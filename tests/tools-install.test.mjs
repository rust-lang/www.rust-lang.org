// Browser tests for the Windows download ordering on /tools/install and /learn/get-started.
//
// Run with: node --test tests/
//
// Renders templates/components/tools/rustup.html.hbs with the en-US strings in a
// headless Chromium-based browser (Edge or Chrome; set BROWSER_PATH to override)
// and checks the rendered order of the rustup-init.exe download buttons for
// different User-Agent Client Hints. Skipped when no browser is found.

import { test, before, after } from "node:test";
import assert from "node:assert/strict";
import { spawn } from "node:child_process";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";
import { pathToFileURL, fileURLToPath } from "node:url";

const root = path.resolve(path.dirname(fileURLToPath(import.meta.url)), "..");

function find_browser() {
    const candidates = [
        process.env.BROWSER_PATH,
        "C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe",
        "C:\\Program Files\\Microsoft\\Edge\\Application\\msedge.exe",
        "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe",
        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome",
        "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge",
        "/usr/bin/google-chrome",
        "/usr/bin/chromium",
        "/usr/bin/chromium-browser",
        "/usr/bin/microsoft-edge",
    ];
    return candidates.find((p) => p && fs.existsSync(p));
}

function load_ftl(file) {
    const messages = new Map();
    let key = null;
    for (const line of fs.readFileSync(file, "utf8").split(/\r?\n/)) {
        const m = /^([a-z0-9-]+)\s*=\s?(.*)$/.exec(line);
        if (m) {
            key = m[1];
            messages.set(key, m[2]);
        } else if (key && /^\s+\S/.test(line)) {
            messages.set(key, `${messages.get(key)} ${line.trim()}`.trim());
        } else {
            key = null;
        }
    }
    return messages;
}

const messages = new Map([
    ...load_ftl(path.join(root, "locales", "en-US", "tools.ftl")),
    ...load_ftl(path.join(root, "locales", "en-US", "learn.ftl")),
]);

// Minimal stand-in for the site's Handlebars + Fluent rendering, enough for the
// templates under test.
function render_template(rel) {
    const msg = (k) => {
        assert.ok(messages.has(k), `missing en-US string ${k}`);
        return messages.get(k);
    };
    const out = fs.readFileSync(path.join(root, "templates", rel), "utf8")
        .replace(/\{\{> components\/tools\/([a-z]+) \}\}/g,
            (_, name) => render_template(`components/tools/${name}.html.hbs`))
        .replace(/\{\{#fluent "([a-z0-9-]+)"\}\}\{\{#fluentparam "([a-z0-9-]+)"\}\}(.*?)\{\{\/fluentparam\}\}\{\{\/fluent\}\}/g,
            (_, k, p, v) => msg(k).replace(`{ $${p} }`, v))
        .replace(/\{\{fluent "([a-z0-9-]+)"\}\}/g, (_, k) => msg(k))
        .replaceAll("{{baseurl}}", "")
        .replaceAll("{{baseurl_assets}}", pathToFileURL(root).href)
        .replaceAll("{{assets.js.tools_install}}",
            pathToFileURL(path.join(root, "static", "scripts", "tools-install.js")).href);
    return out;
}

function write_page(dir, name, body) {
    assert.ok(!/\{\{/.test(body), "unrendered template expression");
    const tachyons = pathToFileURL(path.join(root, "static", "styles", "tachyons.css")).href;
    const extra_css = process.env.EXTRA_CSS ? `<link rel="stylesheet" href="${pathToFileURL(process.env.EXTRA_CSS).href}">` : "";
    const html = `<!doctype html><html><head><meta charset="utf-8">
<link rel="stylesheet" href="${tachyons}">${extra_css}</head><body>${body}</body></html>`;
    const file = path.join(dir, name);
    fs.writeFileSync(file, html);
    return pathToFileURL(file).href;
}

// /tools/install: the component inside the green #rustup section.
function render_install(dir) {
    const body = render_template("components/tools/rustup.html.hbs");
    return write_page(dir, "install.html",
        `<section id="rustup" class="green"><div class="w-100 mw-none ph3 mw8-m mw9-l center f3">${body}</div></section>`);
}

// /learn/get-started: the real purple #installing-rust section.
function render_get_started(dir) {
    const page = fs.readFileSync(path.join(root, "templates", "learn", "get-started.html.hbs"), "utf8");
    const section = /<section id="installing-rust"[\s\S]*?<\/section>/.exec(page)[0];
    const tmp = path.join(dir, "get-started-section.hbs");
    fs.writeFileSync(tmp, section);
    const body = render_template(path.relative(path.join(root, "templates"), tmp));
    return write_page(dir, "get-started.html", body);
}
class Cdp {
    constructor(ws) {
        this.ws = ws;
        this.id = 0;
        this.pending = new Map();
        this.listeners = [];
        ws.addEventListener("message", (ev) => {
            const msg = JSON.parse(ev.data);
            if (msg.id && this.pending.has(msg.id)) {
                const { resolve, reject } = this.pending.get(msg.id);
                this.pending.delete(msg.id);
                msg.error ? reject(new Error(msg.error.message)) : resolve(msg.result);
            } else if (msg.method) {
                this.listeners.forEach((l) => l(msg));
            }
        });
    }
    send(method, params = {}, sessionId) {
        const id = ++this.id;
        this.ws.send(JSON.stringify({ id, method, params, sessionId }));
        return new Promise((resolve, reject) => this.pending.set(id, { resolve, reject }));
    }
}

let browser, cdp, fixture_url, get_started_url, tmp;
const browser_path = find_browser();

before(async () => {
    if (!browser_path) {
        return;
    }
    tmp = fs.mkdtempSync(path.join(os.tmpdir(), "tools-install-test-"));
    fixture_url = render_install(tmp);
    get_started_url = render_get_started(tmp);
    const profile = path.join(tmp, "profile");
    browser = spawn(browser_path, [
        "--headless=new", "--remote-debugging-port=0", `--user-data-dir=${profile}`,
        "--no-first-run", "--no-default-browser-check", "--allow-file-access-from-files",
        "about:blank",
    ], { stdio: "ignore" });
    const port_file = path.join(profile, "DevToolsActivePort");
    let port, ws_path;
    for (let i = 0; i < 200 && !ws_path; i++) {
        try {
            [port, ws_path] = fs.readFileSync(port_file, "utf8").split(/\r?\n/);
        } catch {}
        if (!ws_path) {
            await new Promise((r) => setTimeout(r, 50));
        }
    }
    assert.ok(ws_path, "browser did not start");
    const ws = new WebSocket(`ws://127.0.0.1:${port}${ws_path}`);
    await new Promise((resolve, reject) => {
        ws.addEventListener("open", resolve);
        ws.addEventListener("error", reject);
    });
    cdp = new Cdp(ws);
});

after(() => {
    if (cdp) {
        cdp.ws.close();
    }
    if (browser) {
        browser.kill();
    }
    if (tmp) {
        try { fs.rmSync(tmp, { recursive: true, force: true, maxRetries: 5 }); } catch {}
    }
});

// `hints` is the object getHighEntropyValues resolves to, "absent" for browsers
// without navigator.userAgentData, or "reject" for a failing request.
async function render({ platform, hints, query = "", width = 1280, screenshot, url }) {
    const { targetId } = await cdp.send("Target.createTarget", { url: "about:blank" });
    const { sessionId } = await cdp.send("Target.attachToTarget", { targetId, flatten: true });
    const s = (m, p) => cdp.send(m, p, sessionId);
    const exceptions = [];
    const listener = (msg) => {
        if (msg.sessionId === sessionId && msg.method === "Runtime.exceptionThrown") {
            exceptions.push(msg.params.exceptionDetails);
        }
    };
    cdp.listeners.push(listener);
    try {
        await s("Runtime.enable");
        await s("Page.enable");
        await s("Emulation.setDeviceMetricsOverride", {
            width, height: 900, deviceScaleFactor: 1, mobile: false,
        });
        await s("Page.addScriptToEvaluateOnNewDocument", {
            source: `(() => {
                const platform = ${JSON.stringify(platform)};
                const hints = ${JSON.stringify(hints)};
                Object.defineProperty(Navigator.prototype, "platform", { get: () => platform });
                let uad;
                if (hints === "reject") {
                    uad = { getHighEntropyValues: () => Promise.reject(new DOMException("blocked", "NotAllowedError")) };
                } else if (hints !== "absent") {
                    uad = { getHighEntropyValues: () => new Promise((r) => setTimeout(() => r(hints), 20)) };
                }
                Object.defineProperty(Navigator.prototype, "userAgentData", { get: () => uad });
            })();`,
        });
        await s("Page.navigate", { url: (url || fixture_url) + query });
        let result;
        for (let i = 0; i < 100; i++) {
            const { result: r } = await s("Runtime.evaluate", {
                returnByValue: true,
                expression: `(() => {
                    const c = document.getElementById("rustup-win-downloads");
                    if (!c || !c.hasAttribute("data-detected-arch")) { return null; }
                    const shown = (el) => el.getClientRects().length > 0;
                    const items = [...c.querySelectorAll("[data-arch]")];
                    return {
                        detected: c.getAttribute("data-detected-arch"),
                        win_visible: shown(document.getElementById("platform-instructions-win")),
                        unix_visible: shown(document.getElementById("platform-instructions-unix")),
                        default_visible: shown(document.getElementById("platform-instructions-default")),
                        winget_text: document.querySelector("#rustup-winget code").textContent,
                        downloads_above_winget: shown(document.getElementById("rustup-winget")) &&
                            c.getBoundingClientRect().bottom <=
                            document.getElementById("rustup-winget").getBoundingClientRect().top,
                        order: items.filter(shown)
                            .map((el) => ({ arch: el.dataset.arch, rect: el.getBoundingClientRect() }))
                            .sort((a, b) => a.rect.top - b.rect.top || a.rect.left - b.rect.left)
                            .map((x) => x.arch),
                        labelled: items
                            .filter((el) => shown(el.querySelector(".rustup-win-detected-label")))
                            .map((el) => el.dataset.arch),
                    };
                })()`,
            });
            if (r.value) {
                result = r.value;
                break;
            }
            await new Promise((r) => setTimeout(r, 25));
        }
        assert.ok(result, "page did not finish detection");
        if (screenshot && process.env.SCREENSHOT_DIR) {
            await s("Runtime.evaluate", {
                expression: "document.getElementById('platform-instructions-win').scrollIntoView()",
            });
            const { data } = await s("Page.captureScreenshot", { format: "png", captureBeyondViewport: true });
            fs.mkdirSync(process.env.SCREENSHOT_DIR, { recursive: true });
            fs.writeFileSync(path.join(process.env.SCREENSHOT_DIR, `${screenshot}.png`), Buffer.from(data, "base64"));
        }
        return { ...result, exceptions };
    } finally {
        cdp.listeners.splice(cdp.listeners.indexOf(listener), 1);
        await cdp.send("Target.closeTarget", { targetId });
    }
}

const skip = browser_path ? false : "no Chromium-based browser found (set BROWSER_PATH)";
const DEFAULT_ORDER = ["x86_64", "aarch64", "i686"];
const win = (architecture, bitness) => ({ platform: "Windows", architecture, bitness });

for (const [name, hints, expected] of [
    ["ARM64", win("arm", "64"), ["aarch64", "x86_64", "i686"]],
    ["x64", win("x86", "64"), ["x86_64", "aarch64", "i686"]],
    ["32-bit x86", win("x86", "32"), ["i686", "x86_64", "aarch64"]],
]) {
    test(`Windows ${name} hints put that download first and label it`, { skip }, async () => {
        for (const width of [1280, 400]) {
            const r = await render({
                platform: "Win32", hints, width,
                screenshot: width === 1280 ? `windows-${expected[0]}` : undefined,
            });
            assert.equal(r.win_visible, true);
            assert.equal(r.downloads_above_winget, true, "downloads should come before WinGet");
            assert.deepEqual(r.winget_text.split("\n").map((l) => l.split(" --")[0]),
                ["winget install -e", "winget install -e"], "Copy should get two winget lines");
            assert.deepEqual(r.order, expected, `width ${width}`);
            assert.deepEqual(r.labelled, [expected[0]]);
            assert.equal(r.detected, expected[0]);
            assert.deepEqual(r.exceptions, []);
        }
    });
}

for (const [name, hints] of [
    ["unavailable (no userAgentData)", "absent"],
    ["rejected", "reject"],
    ["ambiguous (32-bit ARM)", win("arm", "32")],
    ["missing architecture", { platform: "Windows" }],
]) {
    test(`Windows with ${name} hints keeps the default order without errors`, { skip }, async () => {
        const r = await render({
            platform: "Win32", hints,
            screenshot: hints === "absent" ? "windows-unknown" : undefined,
        });
        assert.equal(r.win_visible, true);
        assert.deepEqual(r.order, DEFAULT_ORDER);
        assert.deepEqual(r.labelled, []);
        assert.equal(r.detected, "none");
        assert.deepEqual(r.exceptions, []);
    });
}

test("non-Windows platforms still show the Unix instructions", { skip }, async () => {
    const r = await render({
        platform: "Linux x86_64",
        hints: { platform: "Linux", architecture: "x86", bitness: "64" },
    });
    assert.equal(r.unix_visible, true);
    assert.equal(r.win_visible, false);
    assert.equal(r.detected, "none");
    assert.deepEqual(r.exceptions, []);
});

test("platform_override=win on a non-Windows device shows the default order", { skip }, async () => {
    const r = await render({
        platform: "Linux x86_64",
        hints: { platform: "Linux", architecture: "x86", bitness: "64" },
        query: "?platform_override=win",
    });
    assert.equal(r.win_visible, true);
    assert.deepEqual(r.order, DEFAULT_ORDER);
    assert.deepEqual(r.labelled, []);
});

test("platform_override=unix on Windows hides the Windows downloads", { skip }, async () => {
    const r = await render({
        platform: "Win32", hints: win("arm", "64"), query: "?platform_override=unix",
    });
    assert.equal(r.unix_visible, true);
    assert.equal(r.win_visible, false);
});

test("platform_override=default shows the manual instructions", { skip }, async () => {
    const r = await render({
        platform: "Win32", hints: win("arm", "64"), query: "?platform_override=default",
    });
    assert.equal(r.default_visible, true);
    assert.equal(r.win_visible, false);
});

test("get-started page detects ARM64 and shows downloads before WinGet", { skip }, async () => {
    const r = await render({
        platform: "Win32", hints: win("arm", "64"), url: get_started_url,
        screenshot: "get-started-aarch64",
    });
    assert.equal(r.win_visible, true);
    assert.deepEqual(r.order, ["aarch64", "x86_64", "i686"]);
    assert.deepEqual(r.labelled, ["aarch64"]);
    assert.equal(r.downloads_above_winget, true);
    assert.deepEqual(r.winget_text.split("\n").map((l) => l.split(" --")[0]),
        ["winget install -e", "winget install -e"]);
    assert.deepEqual(r.exceptions, []);
});