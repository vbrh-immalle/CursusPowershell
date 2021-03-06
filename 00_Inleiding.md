# Inleiding

Shells (met hun CLI) zijn al van de begindagen de manier bij uitstek om mensen toe te laten met computers te *interfacen*. Toegegeven, een GUI kan (met zijn muisbesturing) soms efficiënter zijn maar werken met een shell heeft ook zo zijn voordelen, zoals bij het automatiseren van repetitieve taken. Toch werd de CLI door Microsoft een hele tijd in het verdomhoekje geduwd. Wie het laatste decennium (soms noodgedwongen) op Windows op de console moest werken, was verplicht de redelijk archaïsche werking er maar bij te nemen. Gebruikers keken soms afgunstig naar wat sommigen met de terminals op OSX en Linux konden doen.

> **CLI**: Command Line Interface

> **GUI**: Graphical User Interface

De opkomst van het Internet vanaf de mid-jaren-90 heeft het **open-source OS Linux** een enorme boost gegeven. Het werd al gebruikt in vele organisaties en universiteiten en toen ook de commerciële wereld zijn online aanwezigheid begon uit te bouwen, waren Linux-gebaseerde systemen voor veel bedrijven een goedkopere en efficiëntere keuze dan **Windows-Servers**. Een Internet-server staat immers meestal in een data-center waar niemand geïnteresseerd is in de grafische werkomgeving. Servers worden daarenboven - zeker in grote aantallen - liefst *in bulk* beheerd. Dat Google zijn ganse infrastructuur heeft uitgebouwd met simpele en eenvoudige te vervangen Linux-servers - weliswaar in gigantische aantallen - heeft zeker mee gespeeld.

> **open source**: letterlijk *open broncode* waarmee bedoeld wordt dat de broncode van de software die je gebruikt beschikbaar is en naar believen kan aangepast worden. Aanvankelijk werd deze beweging (van *closed source* / *proprietary* software naar *open source*) in gang gezet door fanatieke anti-copyright-aanhangers (zoals de mensen achter het GNU-project, die dan ook graag weleens de term *copyleft* gebruiken). Vele mensen met economische motieven stonden hier aanvankelijk argwanend tegenover maar uiteindelijk is gebleken dat het de software-kwaliteit ten goede komt. Zeker in deze service-georiënteerde tijden is ook met het schrijven van open-source-software geld te verdienen!

> **OS**: Operating System, sommige OS'n zijn specifiek gericht op server-gebruik. Zo heeft Microsoft tegenwoordig ook **Windows Server Core**: een server-OS zonder GUI, voornamelijk bedoeld voor in het data-center.

> **Linux**: begonnen omstreeks 1991 als een hobby-project van **Linus Torvalds** om een Unix-achtig OS te maken dat op een Intel CPU kon draaien. Linus postte zijn vorderingen in nieuwsgroepen op het (nog jonge) Internet en al gauw werd hij (online) bijgestaan met het schrijven van zijn code. Als programmeertaal werd naast machinetaal ook C gebruikt. De C-compiler (gcc = GNU C Compiler), waarmee de in C geschreven code wordt omgezet naar machine-taal, was al ontwikkeld door GNU-oprichter **Richard Stallman**. O.a. hierdoor kreeg de **Linux-kernel** ook de (copyleft) GNU-licentie, wat zekerheid bood dat de Linux-kernel altijd open-source zou blijven.

Hoewel de CLI door sommigen als ouderwets en achterhaald werd beschouwd (toch zeker voor de eindgebruiker), is deze dus nooit echt verdwenen. Mede door de populariteit en (economische) voordelen van open-source-software, werden oude shells (zoals **bash** en **zsh**) door een nieuwe lichting techneuten mondjesmaat verder ontwikkeld en uitgebreid. Het was voor enkele belangrijke hoofden bij Microsoft aanvankelijk moeilijk te begrijpen hoe het kwam dat bij een significant gedeelte van nieuwe (en jonge) software-ontwikkelaars en systeembeheerders een toch wel bijzondere tekst-editor zoals **vim** geprefereerd werd boven complexe IDE's en grafische omgevingen zoals Visual Studio.

> **IDE**: Integrated Development Environment, een ontwikkelomgeving waar niet alleen een tekst-editor maar ook een debugger, documentatie-browser en alle andere denkbare tools in geïntegreerd zijn

Het is voor Microsoft altijd een stokpaardje geweest om te investeren in de gebruiksvriendelijkheid van hun ontwikkelomgevingen (zoals Visual Studio). Hier schuilt natuurlijk een **klantenbindingsstrategie** achter: met de beste ontwikkelomgeving trek je de meeste ontwikkelaars aan en uiteindelijk zal op jouw platform daardoor ook de meeste software beschikbaar zijn en zal je dus de meeste gebruikers hebben. Een reactie van Microsoft op de populariteit van open-source software en de bijhorende development tools, kon dan ook niet uitblijven. Ondertussen heeft Microsoft zijn visie veranderd door - op welbepaalde strategische plaatsen - open-source-software te omarmen i.p.v. te beconcurreren. 

> **klantenbinding** vindt in de IT op verschillende niveau's plaats, denk b.v. aan de Apple Store voor iPhone-gebruikers. Microsoft is altijd al marktleider geweest in de zakelijke markt (met producten zoals **Active Directory**). Voor eindgebruikers moet het tegenwoordig meer en meer opboksen tegen de groeiende smartphone-markt waar o.a. Apple, Samsung en onrechtstreeks Google (met Android) de *Windows Phone* van de markt hebben verstoten.

Open-source omarmen past zeer goed in de huidige evolutie naar **cloud-computing** waar Microsoft met **Azure** probeert te concurreren met Google en Amazon. De reden voor de open-source ontwikkeling van **Powershell Core** moet ook in deze context begrepen worden: de winst zal in de toekomst te halen vallen uit het aanbieden van services met steeds terugkerende betalingen, i.p.v. met de (éénmalige) verkoop van software(-tools). Het transparante ontwikkel-model van open-source-software heeft zich al meermaals superieur getoond en waarom zou je er als bedrijf dan niet aan meewerken als je winst toch elders te halen valt?

> **cloud computing**: het is tegenwoordig erg trendy wanneer je als bedrijf *in de cloud* werkt. Concreet wil dit zeggen dat bedrijven of organisaties geen servers meer in eigen beheer (of op een eigen locatie) moeten hebben maar hun server-infrastructuur kunnen uitbouwen in de datacenters van o.a. Google, Amazon of Microsoft.

De nieuwe **Windows Terminal**, met b.v. ondersteuning voor 256 kleuren, is een klein onderdeeltje van Microsofts strategie voor het nieuwe millenium. Ze maken hiermee duidelijk dat ze aanwezig willen zijn in het ganse spectrum van de IT-dienstverlening. Een goede werkomgeving aanbieden voor zijn *power users*, die soms met lede ogen naar de *gepimpte* Linux/OSX-werkomgevingen kijken, hoort daar dus zeker bij. We leven dan ook in tijden waar een terminal al lang niet meer noodgedwongen uit wit-grijze tekst op een groene achtergrond bestaat.

> **Terminal** of **Console**: vroeger een echt fysiek toestel met een scherm en toetsenbord waarmee commando's konden gestuurd worden naar een server (of mainframe) maar tegenwoordig bedoeld men hier meestal het venster in een GUI-OS mee waarin de shell kan benaderd worden

Microsofts product **Powershell** dateert al van 2006 maar het heeft wel even geduurd voor er volwaardige Powershell-alternatieven waren voor alle ouderwetse Windows-commando's waar systeembeheerders door de jaren heen aan gewend waren. Gelukkig kan je in Powershell nog steeds deze oude commando's gebruiken. Powershell is een voorbeeld van een bewust langzame evolutie maar heeft wel het voordeel gehad dat het niet opgezadeld zat met heel wat *legacy*-tools uit het (Unix-)verleden zoals dat met Linux-shells wel het geval is.

> **legacy**: een term waarmee doorgaans verouderde software wordt bedoeld waar noodgedwongen toch nog mee gewerkt moet worden, b.v. omdat de kosten (en de risico's) om (in één klap) over te schakelen veel te groot zijn. Het gevolg is dat in moderne software vaak nog heel wat zaken *zijn zoals ze zijn* o.w.v. *legacy*-redenen.

In 2016 (10 jaar later) kwam de eerste open-source variant van Powershell uit. De ontwikkeling daarvan gebeurde volledig transparant op GitHub, een bedrijf dat Microsoft 2 jaar later (in 2018) overnam. **Powershell 6.0** werd volledig ontwikkeld op hun open-source variant van het **.Net framework** dat ook op OSX en Linux draait. **.Net core** is een onderdeel v.d. strategie van Microsoft om te verzekeren dat toekomstige software op *alle* platformen (en dus niet enkel Windows Server) met Microsoft-technologie kan worden ontwikkeld. Door *.Net Core* open-source te ontwikkelen, kan Microsoft nu reeds OSX- en Linux-ontwikkelaars laten kennismaken met het platform en krijgen zij zelfs een zekere inspraak.

> **.Net framework**: Microsofts reactie op het Java-platform. Met Java werd het mogelijk om software te schrijven die - zonder aanpassingen - op verschillende platformen kon draaien. Hiervoor wordt een soort *'virtuele machine'*-techniek toegepast: een tussenliggende software-laag tussen de hardware en het eigenlijke programma. De mensen achter Java (indertijd het bedrijf **Sun**) bieden deze 'virtuele machine' voor verschillende platformen (zoals Windows, Linux, OSX, hun eigen Solaris servers, ...) gratis aan zodat alle Java-programma's zonder problemen op al deze (ondersteunde) platformen werken. Hoewel het principe van het .Net framework hetzelfde was (een tussenliggende *VM*), ondersteunde Microsoft tot voor de komst van *.Net Core* in de praktijk enkel *Windows*. Er waren wel initiatieven uit de open-source-gemeenschap (zoals het Mono-project) dat op eigen houtje trachtte .Net te implementeren voor b.v. Linux. Ondertussen is het Mono-project om begrijpelijke redenen (de steun van Microsoft) mee opgegaan in het **.Net core**-project.

In de open-source-gemeenschap (eigenlijk voornamelijk in de GNU-tak ervan) heerst nog steeds veel scepsis t.o.v. Microsoft en dat zal altijd zo zijn. Een bedrijf opereert primair immers vanuit economische overwegingen en zal daar soms sluwe strategiën voor hanteren. Daardoor zul je mensen tegenkomen die uit een soort *politieke overweging* (b.v. de fanatiekste aanhangers van de GNU-licentie) geen gebruik meer willen maken van GitHub en (bij de overname door Microsoft) overgeschakeld zijn naar GitLab. Onder meer om die reden zie je - voorlopig - ook maar weinig mensen die zich Powershell als een volwaardige Linux-shell kunnen inbeelden. Als we echter de politieke redenen opzij zetten en vanuit technisch oogpunt naar Powershell kijken, moeten we toch vaststellen dat Microsoft vandaag de dag serieuze investeringen doet om de CLI-ervaring een nieuwe - positieve - richting uit te sturen...

In de loop van deze cursus zal hopelijk duidelijk worden welke zaken Powershell zoal "beter" doet:

- Het is een object geöriënteerde shell: niet alles is gewoon maar *platte* tekst
- De hulppagina's van elk commando hebben (bijna) steeds duidelijke voorbeelden 
- De naamgeving v.d. commando's is consistent (telkens een *Verb* en een *Noun*)
- ...

# Over deze cursus

Dit is niet *zomaar* een cursus Powershell. Als je snel aan de slag wil om praktische zaken met Powershell te doen, kan je elders betere handleidingen vinden! Deze cursus tracht om van de grond af de basisprincipes van Powershell grondig te bestuderen waarbij meteen ook de basisprincipes van het .Net framework aan bod komen. Daarenboven wordt aandacht besteed aan computer-architectuur! Deze cursus kadert immers in een bredere opleiding (informaticabeheer) waar ook kennis wordt gemaakt met programmeren (in C#) en de werking van computer-hardware en zelfs digitale en analoge elektronica. In deze opleiding komt dan ook een zeer ruim spectrum van IT-onderwerpen aan bod waarbij aandacht wordt besteed aan de gelaagdheid van deze materie:

- Elektriciteit
- Analoge elektronica
- Digitale (asynchrone en synchrone) elektronica
- Computer-architectuur (bussen, geheugens, CPU)
- (Netwerk-architectuur (netwerktoestellen, Internet))
- Operating Systems
- Compilers / Interpreters (programmeertalen) en bibliotheken (libraries)
- Databases (SQL)
- Applicaties

Het materiaal uit deze cursus is dan ook voornamelijk bedoeld om de student een hulpmiddel aan te reiken waarmee geëxperimenteerd kan worden om nuttig te zijn voor onderwerpen uit het ganse spectrum: van b.v. binaire getallen berekenen t.e.m. het Operating System beheren en applicaties aan te sturen zoals Excel.
