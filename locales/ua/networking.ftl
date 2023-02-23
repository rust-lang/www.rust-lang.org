## templates/what/networking.hbs

what-networking-page-title = Мережева взаємодія

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust має зростаючу екосистему простих у використанні бібліотек для web. Ось лише два приклади:
networking-get-started-post-json = Надсилання JSON
networking-get-started-take-json = Обробка POST з JSON
networking-get-started-reqwest = Дізнатися більше про reqwest
networking-get-started-rocket = Дізнатися більше про Rocket

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = Низька вартість
networking-pitch-footprint = Візьміть під контроль використання ресурсів, щоб мінімізувати використання пам'яті та процесора. Отримайте допомогу від компілятора, щоб бути впевненим, що робите все правильно. І робіть це з продуктивною та приємною у використанні екосистемою.
networking-pitch-footprint-alt = Перо
networking-pitch-secure-header = Безпечний і надійний
networking-pitch-secure = networking-pitch-secure
    Потужна перевірка типів Rust запобігає цілим класам помилок.
    Переконайтеся, що ви точно знаєте, коли і де стан буває загальним і змінним.
    Отримайте допомогу у вилові точок відмови ще до розгортання.
networking-pitch-secure-alt = Щит
networking-pitch-concurrent-header = Конкурентність і масштабованість
networking-pitch-concurrent = Використовуйте підхід паралельного програмування, який найкраще відповідає вашим потребам. Rust запобігає одночасному використанню станів між потоками або завданнями. Це дозволяє без страху досягти максимальної продуктивності.
networking-pitch-concurrent-alt = З'єднані шестерінки

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla = Перенесення нашої інфраструктури Push-з'єднань на Rust дало нам змогу легше підтримувати кодову базу і сфокусуватися на коректності та високій продуктивності. Наразі ми одночасно обробляємо до 20 мільйонів мережевих підключень у години пік із серверами на Rust.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, Staff Engineer, Mozilla
networking-production-testimonial-buoyant = Rust є основою технологічної дорожньої карти Linkerd. Його система типів дозволяє нам створювати модульні, тестовані компоновані одиниці без шкоди для продуктивності під час виконання. Однак найдивовижніше те, що система перевірки запозичень і часів життя, дозволяє нам уникнути великих витоків ресурсів. Після 2 років, я не можу уявити використання для роботи будь-якої іншої мови.
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>
