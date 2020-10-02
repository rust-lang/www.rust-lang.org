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
    let path = window.location.pathname;
    if (current_lang != "en-US") {
        path = `/${window.location.pathname.split('/').slice(2).join('/')}`;
    }
    window.location = `${lang}${path}`;
}

nav_dropdown.onchange = langChange;
footer_dropdown.onchange = langChange;
