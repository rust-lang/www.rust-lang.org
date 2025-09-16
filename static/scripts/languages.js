let nav_dropdown = document.getElementById('language-nav');
let footer_dropdown = document.getElementById('language-footer');

let current_lang = nav_dropdown.getAttribute("data-current-lang");
nav_dropdown.value = current_lang;
footer_dropdown.value = current_lang;

function langChange() {
    let lang = this.value;
    if (lang == "en-US") {
        lang = "";
    } else {
        lang = `/${lang}`;
    }

    // Base URL of the web, without a leading slash.
    // For example "" or "/foo/bar".
    let base_url = window.RUST_BASE_URL;

    // If we have a path like /foo/bar/<lang>/<page>/<subpage>, we want to extract only
    // /<page>/<subpage>
    let path = window.location.pathname;
    // Remove /foo/bar
    if (path.startsWith(base_url)) {
        path = path.slice(base_url.length);
    }
    // Remove /<lang>
    if (current_lang != "en-US") {
        path = path.slice(current_lang.length + 1); // +1 for leading /
    }

    // Now reconstruct back /foo/bar
    window.location = `${base_url}${lang}${path}`;
}

nav_dropdown.onchange = langChange;
footer_dropdown.onchange = langChange;
