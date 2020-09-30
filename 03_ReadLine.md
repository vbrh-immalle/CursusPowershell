# ReadLine

## Inleiding

De knipperende cursor van een shell is al jarenlang het signaal dat de computer wacht op invoer v.d. gebruiker. In het verleden was het zo dat de computer pas écht iets deed als de gebruiker op `<ENTER>` drukte maar tegenwoordig kan er op elke toetsdruk gereageerd worden.

In dit hoofdstuk onderzoeken we enkele handige mogelijkheden van de `PSReadLine`-module van Powershell. Dit is de module die alle toetsdrukken afhandelt. In een volgend hoofdstuk leren we meer over modules in het algemeen. We verklappen wel al dat je alle commando's van deze module kan opvragen:

    Get-Command -Module PSReadLine

**OPGELET**: Afhankelijk van welke terminal je gebruikt, zijn er ook toetsen die door dit terminal-programma worden afgehandeld i.p.v. door `PSReadLine`. Wees je hiervan steeds bewust! B.v. de `PageUp`- en `PageDown`-knoppen (al dan niet in combinatie met `SHIFT` en/of `CONTROL` kunnen in veel terminals gebruikt worden om in het venster te scrollen (zoals je dat met het muiswiel kan). Het is dus mogelijk dat `PageUp` en `PageDown` (of andere toetsen(combinaties)) **niet** terecht komen bij Powershell.

## Pijltjestoetsen: vorige commando's uitvoeren

Een super-handige feature van `PSReadLine` is het opvragen van vorige uitgevoerde commando's. Je kan steeds een lijst van eerder gegeven commando's opvragen met

    Get-History

Maar de handigheid schuilt hem hier in: met **de pijltjestoetsen naar boven en onder** kan je door deze history bladeren! Dit is echt zeer handig als je een vorig commando nog lichtjes wil aanpassen voordat je het opnieuw uitvoert.

## TAB-toets: automatisch aanvullen

In traditionele shells bestaat automatisch aanvullen met `TAB` al een tijdje maar meestal bleef dat beperkt tot het aanvullen v.d. naam v.h. commando. Powershell gaat enkele stappen verder.

Enkele voorbeelden...

### Aanvullen van commando's

Type `Get-` en druk verschillende malen op `TAB`. Alle commando's beginnend met `Get-` worden alfabetisch doorlopen.

> Je kan ook steeds op `SHIFT+TAB` drukken om de suggesties in omgekeerde volgorde te doorlopen!

Type `Get-H`. Nu krijg je uiteraard enkel aanvullingen van commando's die met `Get-H` beginnen.

### Aanvullen van argumenten

Tot zover nog niets héél bijzonders: we vulden gewoon de naam v.e. commando aan. Maar Powershell kan ook de **argumenten** aanvullen.

Type `Get-History -` en druk op `TAB`. Je doorloopt nu het lijstje van alle argumenten die `Get-History` kent. Gebruik b.v. het `-Count`-argument en geef een getal mee om enkel een bepaald aantal commando's uit de history op te vragen.

### Aanvullen van keuzemogelijkheden

Powershell kan nog straffer uit de hoek komen! We moeten hiervoor wel even vooruit blikken op enkele commando's.

Je weet al dit we met `dir` een lijst tonen van bestanden uit de huidige directory. Standaard worden een aantal kolommen getoond maar door de uitvoer van `dir` door te sluizen naar `Select-Object` (of verkort: `Select` of zelfs `?`), kunnen we zelf kiezen welke kolommen getoond worden.

> Vooruitblik: de uitvoer van een commando *doorsluizen* naar een ander commando, doe je met de *pipe*-operator `|`.

Probeer de volgende commando's:

    dir | select Name
    dir | Select-Object Name, Length
    dir | select Name, Length, LastWriteTime

En waar het nu natuurlijk om gaat, op het moment dat je de **kolomnamen** `Name` en `Length` gaat ingeven, kan je ook gewoon op `TAB` drukken om dit automatisch te laten aanvullen! Dit is echt een feature die op traditionele (tekst-gebaseerde) shells zeer moeilijk correct te implementeren valt. Bij Powershell volgt het op natuurlijke wijze uit de object-geöriënteerde aard waarin het (m.b.v. het DOTNET-framework) geschreven is.

Type `dir | select ` en druk op `TAB`. Type vervolgens een komma (`,`) en druk weeer op `TAB`.

> Uit te proberen: Wat gebeurt er als je geen spatie zet na `dir | select` en al op `TAB` drukt?

## Een overzicht van alle toetscombinaties

Het is erg makkelijk om te laten zien wat `PSReadLine` allemaal kan.

Laten we beginnen met te tonen welke toetsen(combinaties) momenteel geconfigureerd zijn:

    Get-PSReadLineKeyHandler

De toetsencombinaties worden gegroepeerd in 4 categorieën:

| categorie                 | omschrijving                                                    |
|---------------------------|-----------------------------------------------------------------|
| Basic editing functions   | basis bewerkingsfuncties voor tijdens het intypen van een regel |
| Cursor movement functions | functies om de cursor te verplaatsen                            |
| History functions         | functies om de commando-geschiedenis te gebruiken               |
| Completion functions      | functies om automatisch te laten aanvullen                      |
| Miscellaneous functions   | een aantal functies die onder de noemer *overige* vallen        |
| Selection functions       | functies om tekst te selecteren                                 |
| Search functions          | functies om te zoeken in de huidige regel tekst                 |

Laten we even enkele handige commando's overlopen.

### Handige editing functies

De functies die gekoppeld zijn aan de shortcuts `Backspace`, `Delete`, `Ctrl+v`, ... spreken voor zich.

Het verschil tussen `Ctrl+C` (met hoofdletter `C`) en `Ctrl+c` (met kleine letter `c`) verdient wat uitleg. `Ctrl-c` is traditioneel in vele shells namelijk een manier om een draaiend CLI-programma te onderbreken (*cancel*). Powershell heeft hiervoor de `CopyOrCancelLine`-functie voor bedacht die zal kopiëren als er tekst geselecteerd is maar anders de cancel-functie heeft.

Onderschat het belang van de `Escape`-toets met zijn `RevertLine`-functie niet! Dit is de snelste manier om je regel terug leeg te maken zonder uit te voeren.

### Handige cursor functies

Ook hier zien we een aantal bekende shortcuts: `Home` met de `BeginningOfLine`-functie, `End` met de `EndOfLine`-functie, `Ctrl+LeftArrow`, ...

De `Ctrl+]`-shortcut met de `GotoBrace`-functie verdient wat extra uitleg. We zullen later zien dat in Powershell vaak de *braces* (accolades: `{` en `}` gebruikt worden. Met deze functie kan je met 1 shortcut de cursor van de *opening* brace naar de *closing* brace laten springen. 

Geef b.v. volgende tekst in:

    blabla { braces blabla } more blabla

En ga met de cursor voor 1 v.d. *braces* staan. Als je nu op `Ctrl+]` drukt, springt de cursor naar de andere brace!

### Handige history functies

We weten al dat de pijltjestoetsen ons door de history laten scrollen maar er is nog een gigantische tijdswinner die je zeker moet leren gebruiken: de `CTRL-R`-shortcut met de `ReverseSearchHistory`-functie.

Wanneer je hierop drukt, krijg je een zogenaamd *incremental search*-veld waar je een gedeelte van een commando in kan typen en waar je zo commando's uit je history mee kan opzoeken. Er wordt gezocht in gans de regel dus niet enkel het begin. Dit is echt een krachtige functie om snel en efficiënt met een shell te werken! Zeker in combinatie met de `EndOfLine`-functie (standaard op de `END`-toets) waarmee je dan onmiddellijk dingen achteraan kan toevoegen. Of je kan natuurlijk snel gaan navigeren in een gevonden regel met functies zoals `NextWord` of `BackwardWord` (standaard `CTRL+LeftArrow/RightArrow`)

## Het gedrag v.d. TAB-toets aanpassen

We zagen al in het overzicht dat de `TAB`-knop gekoppeld is aan de `TabCompleteNext`-functie. Handig maar het kan nog beter!
    
Met deze opdracht koppelen we de `MenuComplete`-functie aan de `TAB`-toets:

    Set-PSReadLineKeyHandler -Chord TAB -Function MenuComplete

> Het woord **Chord** kan vergeleken worden met het woord *akkoord* in de context van een keyboard-speler of pianist die ook meerdere toetsen tegelijk indrukt. `CTRL-N` is dus b.v. een *chord* omdat het bestaat uit 2 toetsen die tegelijk moeten ingedrukt worden.

Deze menu-functie biedt heel wat meer functionaliteit. Wanneer je nu op `TAB` drukt, krijg je meteen een overzicht van alle mogelijkheden te zien en kan je met de pijltjestoetsen (of opnieuw met TAB) hieruit kiezen. Deze feature maakt Powershell al gedeeltelijk een *self-documenting* shell waarmee we bedoelen dat je al minder snel de help of de documentatie zal moeten raadplegen om de functiontaliteit van een commando te begrijpen.
    
## Opdrachten

### 1

Zoek op (of experimenteer) welke toetsen worden afgehandeld door jouw **terminal** (dus niet Powershell zelf!).

Bedenk dus dat deze toetsen **niet** terecht zullen komen bij `PSReadLine` omdat ze al eerder worden afgevangen!

TIPS:
- in het standaard opdrachtvenster van Windows kan je op het icoon linksboven klikken om in een menu een aantal snelkoppelingen te vinden i.v.m. kopiëren en plakken
- in de Preview versie van de nieuwe Windows Terminal, kan je het command pallette openen met `CTRL-(SHIFT)-P`

### 2

Met `Set-PSReadLineOption -EditMode` kan je 3 verschillende manieren van werken instellen:

- Windows
- Emacs
- Vi

Emacs en Vi zijn tekst-editors met al een lange geschiedenis. (Zoek voor meer info.)
Elk hebben ze hun zeer specifieke manier van werken en een set van shortcuts waar mensen aan gewend zijn geraakt en die ze nog steeds blijven gebruiken omdat ze bepaalde voordelen hebben. Het voordeel v.d. emacs-mode is b.v. dat een aantal toetsenbordfuncties (zoals die v.d. HOME-toets) kunnen benaderd worden zonder de vingers ver te hoeven verplaatsen.

De eerder genoemende functie `ReverseSearchHistory` is eigenlijk een typische emacs-shortcut die is overgenomen in de Windows-mode.

Volgende tabel vergelijkt enkele relatief vaak gebruikte snelkoppelingen:

| functie         | normal      | emacs            |
|-----------------|-------------|------------------|
| begin van regel | Home        | CTRL-A           |
| einde van regel | End         | CTRL-E           |
| woord vooruit   | CTRL-rechts | ALT-F (forward)  |
| woord achteruit | CTRL-links  | ALT-B (backward) |

Zet `PSReadLine` in `Emacs`-mode en probeer deze snelkoppelingen uit. 

Vergelijk ook de output `Get-PSReadLineKeyHandler` door 2 Powershell-vensters naast elkaar te zetten die elk in een andere EditMode staan. * *(TIP: In Windows Terminal Preview kan je het venster verticaal splitsen. Zoek op `vertical` of `split` in het command palette.)*

### 3



### 5

Bedenk voor jezelf nog andere opdrachten. Je mag deze steeds delen met de rest v.d. klas (via Teams, OneNote, ...)
