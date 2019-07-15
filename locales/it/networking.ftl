## templates/what/networking.hbs

what-networking-page-title = Networking

## templates/components/what/networking/get-started.hbs

networking-get-started = Rust ha un ecosistema di librerie per il web in continua crescita. Questi sono solo un paio di esempi:
networking-get-started-post-json = POST di un JSON
networking-get-started-take-json = Gestione della POST di un JSON
networking-get-started-reqwest = Scopri di più su reqwest
networking-get-started-rocket = Scopri di più su Rocket

## templates/components/what/networking/pitch.hbs

networking-pitch-footprint-header = Basso consumo di risorse
networking-pitch-footprint =
    Tieni sotto controllo le risorse di sistema per tenere al minimo l'utilizzo di memoria e CPU.
    Fatti aiutare dal compilatore e assicurati di fare le scelte giuste.
    Il tutto con un ecosistema produttivo e piacevole da usare.
networking-pitch-footprint-alt = Una piuma
networking-pitch-secure-header = Sicuro e affidabile
networking-pitch-secure =
    Il potente type checker di Rust previene intere classi di bug.
    La certezza di sapere esattamente dove e quando un certo stato è condiviso o modificato.
    Fatti aiutare a evidenziare possibili punti deboli - prima del deploy.
networking-pitch-secure-alt = Uno scudo
networking-pitch-concurrent-header = Concorrenza e scalabilità
networking-pitch-concurrent =
    Usa la combinazioe di approcci alla programmazione concorrente che si adatta meglio alle esigenze.
    Rust previene che thread o task concorrenti abbiano stati condivisi.
    Rust ti permette di scalare fin dove possibile, senza alcuna preoccupazione.
networking-pitch-concurrent-alt = Ingranaggi connessi

## templates/components/what/networking/production.hbs

networking-production-testimonial-mozilla = La migrazione a Rust della nostra infrastruttura di invio notifiche push ci ha permesso di avere una base di codice più facile da mantenere, focalizzata sulla correttezza e al tempo stesso con prestazioni incredbili. Con Rust, possiamo adesso gestire picchi fino a 20 milioni di connessioni websocket all'ora sui nostri server.
networking-production-testimonial-mozilla-attribution = Benjamin Bangert, Staff Engineer, Mozilla
networking-production-testimonial-buoyant = Rust è un componente fondamentale nella roadmap dei progetti di Linkerd. Il suo type system ci permette di costruire sistemi modulari, testabili e componibili senza sacrificare le prestazioni. Ciò che è comunque sorprendente, è che il sistema di lifetime/borrow checking di Rust ci permette di evitare una grande fetta di sorgenti di leak di memoria. Dopo 2 anni, non riesco davvero a immaginare un altro linguaggio per questo compito.
networking-production-testimonial-buoyant-attribution = Oliver Gould, CTO, <a href="{ $href }">Buoyant</a>
networking-production-testimonial-1aim = Il potente type system di Rust permette di rifattorare il codice in sicurezza e di catturare numerose classi di errori già in fase di compilazione. Il basso consumo di risorse e le alte prestazioni, insieme alla sicurezza nella gestione della memoria e a un solido sistema di gestione errori, fanno di Rust lo strumento adatto per scrivere codice nel nostro backend in ambiti di sicurezza con complesse logiche business. L'altissima stabilità significa che la nostra applicazione in Rust sia l'ultimo componente del nostro stack tacnologico di cui doverci preoccupare. Abbiamo in produzione un backend al 100% in Rust dalla fine del 2015 e finora non ci ha mai dato problemi!
networking-production-testimonial-1aim-attribution = Yann Leretaille, <a href="{ $href }">1aim</a>
