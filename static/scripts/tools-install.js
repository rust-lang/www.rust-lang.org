var platform_override = null;

function vis(elem, apply) {
    ["db", "di", "dn"].forEach(c => {
        if (c === apply) {
            elem.classList.add(c);
        } else {
            elem.classList.remove(c);
        }
    });
}

function detect_platform() {
    "use strict";

    if (platform_override) {
        return platform_override;
    }

    var os = "unknown";

    if (navigator.platform == "Linux x86_64") {os = "unix";}
    if (navigator.platform == "Linux i686") {os = "unix";}
    if (navigator.platform == "Linux i686 on x86_64") {os = "unix";}
    if (navigator.platform == "Linux aarch64") {os = "unix";}
    if (navigator.platform == "Linux armv6l") {os = "unix";}
    if (navigator.platform == "Linux armv7l") {os = "unix";}
    if (navigator.platform == "Linux armv8l") {os = "unix";}
    if (navigator.platform == "Linux ppc64") {os = "unix";}
    if (navigator.platform == "Linux mips") {os = "unix";}
    if (navigator.platform == "Linux mips64") {os = "unix";}
    if (navigator.platform == "Linux riscv64") {os = "unix";}
    if (navigator.platform == "Mac") {os = "unix";}
    if (navigator.platform == "Win32") {os = "win";}
    if (navigator.platform == "FreeBSD x86_64") {os = "unix";}
    if (navigator.platform == "FreeBSD amd64") {os = "unix";}
    if (navigator.platform == "NetBSD x86_64") {os = "unix";}
    if (navigator.platform == "NetBSD amd64") {os = "unix";}

    // I wish I knew by now, but I don't. Try harder.
    if (os == "unknown") {
        if (navigator.appVersion.indexOf("Win")!=-1) {os = "win";}
        if (navigator.appVersion.indexOf("Mac")!=-1) {os = "unix";}
        // rust-www/#692 - FreeBSD epiphany!
        if (navigator.appVersion.indexOf("FreeBSD")!=-1) {os = "unix";}
    }

    // Firefox Quantum likes to hide platform and appVersion but oscpu works
    if (navigator.oscpu) {
        if (navigator.oscpu.indexOf("Windows")!=-1) {os = "win";}
        if (navigator.oscpu.indexOf("Mac")!=-1) {os = "unix";}
        if (navigator.oscpu.indexOf("Linux")!=-1) {os = "unix";}
        if (navigator.oscpu.indexOf("FreeBSD")!=-1) {os = "unix";}
        if (navigator.oscpu.indexOf("NetBSD")!=-1) {os = "unix";}
    }

    return os;
}

function adjust_for_platform() {
    "use strict";

    var platform = detect_platform();

    var unix_div = document.getElementById("platform-instructions-unix");
    var win_div = document.getElementById("platform-instructions-win");
    var unknown_div = document.getElementById("platform-instructions-unknown");
    var default_div = document.getElementById("platform-instructions-default");

    vis(unix_div, "dn");
    vis(win_div, "dn");
    vis(unknown_div, "dn");
    vis(default_div, "dn");

    if (platform == "unix") {
        vis(unix_div, "db");
    } else if (platform == "win") {
        vis(win_div, "db");
    } else if (platform == "unknown") {
        vis(unknown_div, "db");
    } else {
        vis(default_div, "db");
    }

    var platform_specific = document.getElementsByClassName("platform-specific");
    for (var el of platform_specific) {
        var el_is_not_win = el.className.indexOf("not-win") !== -1;
        var el_is_inline = el.tagName.toLowerCase() == "span";
        var el_visible_class = "db";
        if (el_is_inline) {
            el_visible_class = "di";
        }
        if (platform == "win") {
            if (el_is_not_win) {
                vis(el, "dn");
            } else {
                vis(el, el_visible_class);
            }
        } else {
            if (el_is_not_win) {
                vis(el, el_visible_class);
            } else {
                vis(el, "dn");
            }
        }
    }
}

function cycle_platform() {
    if (platform_override == null) {
        platform_override = "default";
    } else if (platform_override == "default") {
        platform_override = "unknown";
    } else if (platform_override == "unknown") {
        platform_override = "win";
    } else if (platform_override == "win") {
        platform_override = "unix";
    } else if (platform_override == "unix") {
        platform_override = "default";
    }
    adjust_for_platform();
}

function set_up_cycle_button() {
    var cycle_button = document.getElementById("platform-button");
    if (cycle_button !== null) {
        cycle_button.onclick = cycle_platform;
    }

    var key="test";
    var idx=0;
    var unlocked=false;

    document.onkeypress = function(event) {
        if (event.key == "n" && unlocked) {
            cycle_platform();
        }

        if (event.key == key[idx]) {
            idx += 1;

            if (idx == key.length) {
                if (cycle_button !== null) {
                    vis(cycle_button, "db");
                }
                unlocked = true;
                cycle_platform();
            }
        } else if (event.key == key[0]) {
            idx = 1;
        } else {
            idx = 0;
        }
    };
}

function fill_in_bug_report_values() {
    var nav_plat = document.getElementById("nav-plat");
    var nav_app = document.getElementById("nav-app");
    var report_link = document.getElementById("report-unknown-platform-link");
    nav_plat.textContent = navigator.platform;
    nav_app.textContent = navigator.appVersion;
    var issue_template = `\
<!--
    PLEASE do not open an issue if you are using Android!

    The Rust toolchain does not run and can't be installed on Android.

    If you are on desktop, go ahead and open this issue.
-->

navigator.platform: \`${navigator.platform}\`
navigator.appVersion: \`${navigator.appVersion}\`

The website did not recognize the platform I'm on, so I am unable to install rustup.`;
    report_link.href = "https://github.com/rust-lang/www.rust-lang.org/issues/new?title=Unrecognized%20platform&body=" + encodeURIComponent(issue_template);
}

var override_map = new Map ([
    ["unix", "unix"],
    ["win", "win"],
    ["linux", "unix"],
    ["win32", "win"],
    ["win64", "win"],
    ["windows", "win"],
    ["wsl", "win"],
    ["default", "default"],
    ["generic", "default"],
    ["all", "default"],
]);

function check_initial_override() {
    var urlParams = new URLSearchParams(location.search);
    if (urlParams.has('platform_override')) {
        var override = urlParams.get('platform_override').toLowerCase();
        // Now normalise in case people pass unusual things in
        override = override_map.get(override);
        if (override === undefined) {
            platform_override = "unknown";
        } else {
            platform_override = override;
        }
    }
}

(function () {
    check_initial_override();
    adjust_for_platform();
    set_up_cycle_button();
    fill_in_bug_report_values();
}());
