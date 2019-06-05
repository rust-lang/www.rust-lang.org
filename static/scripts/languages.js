let dropdown = document.getElementById('language-nav');

let current_lang = dropdown.getAttribute("data-current-lang");
dropdown.value = current_lang;

dropdown.onchange = function() {
    let lang = dropdown.value;
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
