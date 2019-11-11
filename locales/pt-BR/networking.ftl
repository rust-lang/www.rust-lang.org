## templates/what/networking.hbs

what-networking-page-title = Redes

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust possui um ecossistema em expansão de bibliotecas fáceis de usar para a web. Aqui estão apenas dois exemplos:
networking-get-started-post-json = Faça POST com JSON
networking-get-started-take-json = Receba POST com JSON
networking-get-started-reqwest = Aprenda mais sobre reqwest
networking-get-started-rocket = Aprenda mais sobre Rocket

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = Pouco consumo de recursos
networking-pitch-footprint =
    Controle o uso de recursos para manter o uso de memória e CPU no mínimo.
    Tenha a ajuda do compilador para ter certeza que está tudo certo.
    E faça isso com um ecossistema produtivo e agradável de usar.
networking-pitch-footprint-alt = Uma pena
networking-pitch-secure-header = Seguro e confiável
networking-pitch-secure =
    O verificador de tipos de Rust previne toda uma categoria de erros.
    Garanta exatamente quando e onde o estado é compartilhado e modificado.
    Receba ajuda para encontrar pontos de falha &mdash; antes mesmo de executar em produção.
networking-pitch-secure-alt = Um escudo
networking-pitch-concurrent-header = Concorrência em escala
networking-pitch-concurrent =
    Use qualquer mistura de estratégias de concorrência que funcione para você.
    Rust garantirá que você não compartilhou o estado acidentalmente entre threads e tarefas.
    Isso permite alcançar o máximo de performance, sem medo.
networking-pitch-concurrent-alt = Engrenagens conectadas

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla = Migrar nossa infraestrutura de conexão Push para Rust nos proveu uma base de código  fácil de manter focada em corretude, ainda possuindo uma performance fantástica. Nós agora estamos processando até 20 milhões de conexões websocket ao mesmo tempo nos nossos servidores Rust em horários de pico.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, Staff Engineer, Mozilla
networking-production-testimonial-buoyant =
    Rust é fundacional para a estratégia de evolução do projeto Linkerd. Seu sistema de tipo nos permite construir unidades modulares, testáveis e reusáveis sem sacrificar performance durante a execução.
    O que é mais surpreendente, na verdade, é como o sistema de verificação de <i>lifetime/borrow</i> nos ajuda a evitar grandes tipos de vazamento de recursos. Depois de 2 anos, não consigo imaginar usar qualquer outra linguagem para esse trabalho.
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>
