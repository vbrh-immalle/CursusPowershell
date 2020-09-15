# Inleiding

Shells (met hun CLI) zijn al van de begindagen de manier bij uitstek om mensen toe te laten met computers te *interfacen*.  Toegegeven, een GUI kan (met zijn muisbesturing) soms sneller en vooral ook visueler werken maar werken met een shell heeft zeker ook voordelen. Het voornaamste voordeel misschien wel dat taken veel makkelijker geautomatiseerd kunnen worden.

> **CLI**: Command Line Interface

> **GUI**: Graphical User Interface

De stijgende populariteit van Linux vanaf mid jaren 90, o.a. door de opkomst van het Internet met zijn vele Linux-servers, heeft er steeds voor gezorgd dat de CLI - die door sommigen als ouderwets werd beschouwd - nooit echt verdwenen is. Er werden nieuwe varianten van ouderwetse shells geschreven (**bash** en **zsh** zijn b.v. allemaal nieuwere varianten van het oorspronkelijke **sh**). Sommige jongere software-developers en systeembeheerders ontdekten ook de unieke mogelijkheden van tekst-editors zoals **vim**, een software-pakket dat volledig in een tekstvenster kan draaien en geen GUI nodig heeft maar toch (dankzij moderne plugins) - samen met een goed geconfigureerde shell - een zeer flexibele werkomgeving kan aanbieden. Er werd zelf aandacht besteed om de terminal-ervaring te upgraden naar 256 kleuren omdat werken in een terminal natuurljk al lang niet meer enkel witte tekst op een groene achtergrond hoefde te zijn.

> **Terminal**: vroeger een echt fysiek toestel met een scherm en toetsenbord waarmee commando's konden gestuurd worden naar een server (of mainframe) maar tegenwoordig bedoeld men hier vaak een venster met de CLI van een shell mee.

Microsoft begon de Internet-boot een beetje te missen en zag dat zijn OS's, zoals het oude Windows NT (en tegenwoordig Windows Server 2019) in het Internet-server-marktsegment een gedegen concurrent hadden in Linux-gebaseerde systemen. Langzaam maar zeker begon het ook bij Microsoft te dagen dat, zeker bij IT-professionals en -hobbyisten, de shell zeker nog niet afgeschreven was.

> **OS**: Operating System, Windows Server is de server-lijn van OS's van Microsoft

Microsoft - die toch altijd al zeer gefocust waren op het aanbieden van een goede gebruikservaring voor IT-professionals en vooral ook ontwikkelaars - begon (onder nieuw management) zijn fouten uit het verleden in te zien en kwam op de proppen met zijn eigen nieuwe shell voor de 21e eeuw: Powershell. Ondertussen draait Powershell zowel op Windows-, OSX- als Linux-systemen. Dit was mogelijk dankzij een andere koerswijziging bij Microsoft: het .Net-framework werd quasi van scratch opnieuw geschreven en ditmaal onder een open-source licentie. Iedereen kon de ontwikkeling van **.Net Core** op GitHub volgen, bug-reports plaatsen en er actief aan meewerken en het draait ook op OSX en Linux! Intussentijd heeft Microsoft GitHub overgekocht wat door sommige doemdenkers als een aanval op de *vrije* software werd gezien. Als we echter de politieke redenen opzij zetten en enkel kijken naar de praktische uitwerking van b.v. Powershell, moeten we toch vaststellen dat Microsoft met Powershell een serieuze evolutionaire stap heeft gezet, zeker vergeleken met hun eigen opdrachtprompt (die nog quasi onveranderd was gebleven sinds het DOS-tijdperk) maar zelfs ook vergeleken met andere hedendaagse concurrerende shells.

Enkele zaken die Powershell "beter" doet:

- Het is een object geöriënteerde shell: niet alles is gewoon maar *platte* tekst
- De hulppagina's van elk commando hebben (bijna) steeds duidelijke voorbeelden 
- De naamgeving v.d. commando's is consistent (telkens een *Verb* en een *Noun*)
- ...
