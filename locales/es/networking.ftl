## templates/what/networking.hbs

what-networking-page-title = Redes

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust posee un ecosistema en expansión de bibliotecas para la web fáciles de usar. Aquí tienes dos ejemplos:
networking-get-started-post-json = POST de un JSON
networking-get-started-take-json = Recibir un POST con JSON
networking-get-started-reqwest = Saber más sobre reqwest
networking-get-started-rocket = Saber más sobre Rocket

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = Bajo coste
networking-pitch-footprint =
    Controla el uso de recursos y mantén el consumo de memoria y CPU al mínimo.
    Recibe ayuda del compilador para tener certeza de que todo está correcto.
    Y con un ecosistema que es productivo y agradable de usar.
networking-pitch-footprint-alt = Una pluma
networking-pitch-secure-header = Seguro y fiable
networking-pitch-secure =
    El potente sistema de tipos de Rust previene toda clase de errores.
    Controla con exactitud cuándo y dónde se comparte y se modifica el estado.
    Recibe ayuda para encontrar puntos de fallo <em>antes</em> de la puesta en producción.
networking-pitch-secure-alt = Un escudo
networking-pitch-concurrent-header = Concurrente a escala
networking-pitch-concurrent =
    Usa cualquier mezcla de estrategias de concurrencia que funcione para tí.
    Rust te garantiza que no compartes accidentalmente estado entre hilos o tareas.
    Eso te permite exprimir la escalabilidad al máximo, sin temor.
networking-pitch-concurrent-alt = Engranajes conectados

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla =
    Migrar nuestra infraestructura de conexión Push a Rust ha resultado en una base de código más fácil
    de mantener con énfasis en la corrección y un rendimiento fantástico. Actualmente
    estamos respondiendo hasta 20 millones de conexiones websocket simultáneas en horas punta con nuestros servidores Rust.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, Staff Engineer, Mozilla
networking-production-testimonial-buoyant = Rust es un componente fundamental en la estrategia tecnológica del proyecto Linkerd. Su sistema de tipos nos permite construir unidades modulares, comprobables y componibles sin sacrificar el rendimiento. No obstante, lo más sorprendente es como el sistema de verificación de <em>lifetime/borrow</em> nos evita un gran número de fugas de memoria. Después de 2 años, no me puedo imaginar usar cualquier otro lenguaje para esta tarea.
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>
