## templates/what/networking.hbs

what-networking-page-title = Сетевое взаимодействие

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust имеет растущую экосистему простых в использовании библиотек для web. Вот только два примера:
networking-get-started-post-json = Отправка JSON
networking-get-started-take-json = Обработка POST с JSON
networking-get-started-reqwest = Узнать больше о reqwest
networking-get-started-rocket = Узнать больше о Rocket

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = Низкая стоимость
networking-pitch-footprint = Возьмите под контроль использование ресурсов чтобы минимизировать использование памяти и процессора. Получите помощь от компилятора, чтобы быть уверенным, что делаете всё правильно. И делайте это с продуктивной и приятной в использовании экосистемой.
networking-pitch-footprint-alt = Перо
networking-pitch-secure-header = Безопасный и надёжный
networking-pitch-secure =
    Мощная проверка типов Rust предотвращает целые классы ошибок.
    Убедитесь, что вы точно знаете, когда и где состояние бывает общим и изменяющимся.
    Получите помощь в отлове точек отказа ещё до развёртывания.
networking-pitch-secure-alt = Щит
networking-pitch-concurrent-header = Конкурентность и масштабируемость
networking-pitch-concurrent = Используйте подход параллельного программирования, который наилучшим образом соответствует вашим потребностям. Rust предотвращает одновременное использование состояний между потоками или задачами. Это позволяет без страха достичь максимальной производительности.
networking-pitch-concurrent-alt = Соединённые шестерёнки

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla = Перенос нашей инфраструктуры Push-соединений на Rust позволил нам легче поддерживать кодовую базу и сфокусироваться на корректности и высокой производительности. В настоящее время мы одновременно обрабатываем до 20 миллионов сетевых подключений в часы пик с серверами на Rust.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, Staff Engineer, Mozilla
networking-production-testimonial-buoyant = Rust является основой технологической дорожной карты Linkerd. Его система типов позволяет нам создавать модульные, тестируемые компонуемые единицы без ущерба для производительности во время исполнения. Однако самое удивительное то, что система проверки заимствований и времён жизни, позволяет нам избежать больших утечек ресурсов. После 2 лет, я не могут представить использование для работы какого-либо другого языка.
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>
