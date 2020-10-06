# Modules

## Inleiding

Powershell heeft een redelijk duidelijke **modulaire** opbouw. Erg interessant is dat we extra modules van het Internet kunnen downloaden en importeren. Op https://www.powershellgallery.com/ kan je opzoeken welke Powershell-modules er zoal bestaan, hoe populair ze zijn, ... en meestal vind je ook een link naar de broncode op GitHub.

Uiteraard komt een Powershell (Core) installatie reeds met zijn eigen set van Powershell-modules. In de opdrachten zal je zelf op zoek gaan waar deze zich fysiek op schijf bevinden.

## Ingeladen modules

Een *verse*, pas geopende Powershell heeft meestal nog (bijna) geen modules geladen. Je kan dit tonen met:

    Get-Module

Maar vanaf dat je een commando ingeeft (b.v. `dir`), zal de bijhorende module zichtbaar worden:

    dir
    Get-Module

We zien dat het commando `dir` dus eigenlijk behoort tot de module `Microsoft.Powershell.Management`.

Het is niet overdreven te zeggen dat een **commando** misschien wel het belangrijkste onderdeel is van Powershell. Deze commando's worden dus gegroepeerd in **modules**. Dit is een zeer ordentelijke manier van werken vergeleken met b.v. traditionele Linux-shells en het maakt dat we veel beter commando's (en hun documentatie) kunnen vinden.

> In vele andere shells zijn de commando's meestal gewoon uitvoerbare bestanden die in het PATH worden gezet. (Als je nog niet weet wat het PATH is, zie later.)

## Structuur van commando's

Een andere goede afspraak waaraan Powershell-commando's zich (liefst) moeten houden, is de **naamgeving**. Elk commando bestaat uit een werkwoord (**verb**) en een zelfstandig naamwoord (**noun**). Enkele voorkomende werkwoorden zijn:

- `Get` en `Set`
- `Open` en `Close`
- `Connect` en `Disconnect`
- `Read` en `Write`

> Eigenlijk geven we steeds **bevelen** aan de shell. De meeste programmeertalen worden ook wel *imperatieve* (programmeer)talen genoemd. (In de taalkunde is de imperatief de *gebiedende wijs* waarmee dus bevelen gegeven worden.) SQL (waarmee gegevens uit databases worden opgevraagd) is een voorbeeld van een *beschrijvende* taal maar dat is iets voor een andere cursus.

Het **noun** zegt dan uiteraard *waarop* we de actie v.h. werkwoord willen uitvoeren.

| Verb  | Noun      | Argumenten           | Instructie                                                                                             |
|-------|-----------|----------------------|--------------------------------------------------------------------------------------------------------|
| `Get` | `History` |                      | Geef de inhoud v.d. commando-geschiedenis!                                                             |
| `Get` | `History` | `-Count 3`           | Geef de laatste 3 commando's uit de commando-geschiedenis!                                             |
| `Get` | `Module`  |                      | Geef alle modules die in deze Powershell-sessie al zijn ingeladen!                                     |
| `Get` | `Module`  | `-All`               | Geef alle modules die (automatisch bij eerste gebruik v.e. commando eruit) kunnen geïmporteerd worden! |
| `Get` | `Module`  | `-ListAvailable`     | Geef alle modules die voor deze Powershell-versie op het systeem beschikbaar zijn!                      |
| `Get` | `Command` |                      | Geef **alle** beschikbare commando's uit alle beschikbare modules!                                     |
| `Get` | `Command` | `*module*`           | Geef alle beschikbare commando's waarin het woord `module` voorkomt!                                   |
| `Get` | `Command` | `-Module PSReadLine` | Geef alle commando's uit de `PSReadLine`-module!                                                       |
| `Get` | `Command` | `-Verb Get`          | Geef alle beschikbare commando's die `Get` als verb hebben!                                            |
| `Get` | `Command` | `-Noun Module`       | Geef alle beschikbare commando's die `Module` als noun hebben!                                         |

## De return-waarde van commando's en de pipeline

Wanneer we een commando uitvoeren - en zeker als dat een `Get`-commando is - krijgen we van Powershell **één of meerdere objecten** terug. Deze objecten worden uiteraard als tekst weergegeven (hoe anders in een tekst-gebaseerde shell?) maar speciaal aan Powershell is dat het **echte objecten** zijn die dus allerlei **properties** (en zelfs **methods**, simpel gezegd zijn dit functies die bij het object horen) kunnen hebben. Wat we op het scherm zien, is slechts een **tekstweergave**, die we tot op het laatste moment kunnen beïnvloeden.

Dit kan b.v. met deze commando's:

| Commando       | Omschrijving                                                                                 | Opmerkingen                                                                                                                                |
|----------------|----------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| `Format-List`  | Geef objecten weer als een lijst met telkens de naam v.d. eigenschap/method/... en de waarde | Standaard als er te veel kolommen zouden zijn om op het scherm te passen                                                                   |
| `Format-Table` | Geef objecten weer als een tabel met kolomnamen met de waardes onder elkaar in rijen         | Standaard volgens een bepaalde set van *belangrijkste* kolomnamen dus niet **alle** eigenschappen van de objecten worden standaard getoond |
| `Out-GridView` | Geef objecten weer in een grafisch venster met sorteermogelijkheden/...                      | Niet in Core                                                                                                                               |

Wanneer je b.v. `Get-History` uitvoert, zal standaard de tabel-formattering gebruikt worden. Met de *doorsluis-operator* (pipeline-operator) kan je de uitvoer echter ook doorsluizen naar `Format-List` en (in dit geval) zal je dan alle informatie zien, inclusief het tijdstip waarop het commando in de history is opgeslagen:

    Get-History | Format-List

## Aliases

Als alle commando's de `Verb-Noun`-syntax gebruiken, hoe zit het dan met commando's zoals `dir` en `cd`?

Powershell wilde natuurlijk in de mate van het mogelijke *backward compatible* zijn met DOS en zelfs Linux-gebruikers tevreden stellen.
Daarvoor heeft het een zeer slim `alias`-systeem bedacht.

Met `Get-Alias` krijg je een overzicht van alle gedefinieerde alias's.

Wanneer je goed kijkt, zie je dat er maar liefst 3 alias's gedefinieerd zijn voor `Get-ChildItem`: `dir` (o.w.v. DOS), `ls` (o.w.v. Linux) en `gci`.

Zo zijn volgende commando's hetzelfde dankzij alias's:

    alias | fl
    Get-Alias | Format-List

We blikken nog eens even vooruit en willen al even laten zien hoe je een lijst kan opvragen met de alias's voor een bepaald commando (in dit geval `Get-ChildItem`):

    alias | where Definition -eq Get-ChildItem

Merk op dat je de lijst van alias's ook kan vragen aan `Get-Command` (en dat je dan zelfs te zien krijgt in welke module het commando zit)

    Get-Command -CommandType Alias

> De aandachtige observator ziet dit dat laatste commando meer alias's toont, nl. ook diegenen van de modules die nog niet ingeladen zijn!

## Get-Help

Leren van voorbeelden is altijd handig. Met het `Examples`-argument van `Get-Help` krijg je voor de meeste commando's uitgebreide help te zien:

    Get-Help Get-History -Examples

Toch blijft het interessant om ook de *formele* help-uitleg beter te begrijpen. Wat wil dit precies zeggen?

    Get-History [[-Id] <System.Int64[]>] [[-Count] <System.Int32>] [<CommonParameters>]

Alles tussen rechte haken is **optioneel**. Het commando `Get-History` kan je dus ook uitvoeren **zonder** argumenten want alle argumenten staan tussen rechte haken.

Daarnaast **mag** je b.v. het `Count`-argument meegeven maar dan ben je verplicht ook een geheel getal (van type `<System.Int32`>) mee te geven.

    Get-History -Count 3

We zullen hier later nog dieper op in gaan.

## De kracht van `Get-Command`

Het commando `Get-Command` kan je nog veel meer vertellen dan enkel een overzicht van beschikbare commando's.

Het volledige pad opzoeken van een programma, b.v. `notepad` (opmerking: notepad staat op meerdere locaties, vandaar het `-All`-argument):

    Get-Command -All notepad

Een overzicht van alle programma's (applicaties):

    Get-Command -CommandType Application

Alle *Control Panel*-onderdelen in Windows 10:

    Get-Command *.cpl

Alle commando's met een `-Filter`-argument:

    Get-Command -ParameterName Filter

## Een module downloaden van de powershellgallery

We zullen voor dit voorbeeld een *gimmicky* module downloaden die niet bijzonder veel nut heeft maar wel eens leuk is om uit te proberen.

Modules kunnen gezocht worden via de website https://www.powershellgallery.com/ maar ook vanuit Powershell zelf.

Zoek op de website naar de `WriteAscii`-module.

> Via de link naar de project site, kan je op de GitHub-pagina de broncode van deze module bekijken!

Zoek de module ook via Powershell:

    Find-Module -Name WriteAscii

Om de module te gebruiken, moeten we ze eerst installeren (1 van deze 2 manieren):

    Install-Module WriteAscii
    Install-Module -Name WriteAscii

Maar je zal zien dat dit enkel werkt als je Administrator-rechten hebt omdat `Install-Module` deze module standaard **voor alle gebruikers** probeert te installeren. Het kan ook enkel voor de huidige gebruiker:

    Install-Module -Name WriteAscii -Scope CurrentUser

> De eerste keer dat je de powershell-gallery langs Powershell benaderd, moet je akkoord gaan om deze *untrusted repository* in de toekomst te vertrouwen! Uiteraard moeten we steeds voorzichtig zijn met van het Internet gedownloade modules!

Wanneer je nu controleert of de module al geladen is, is dit niet het geval:

    Get-Module

Maar ze zou nu wel aanwezig moeten zijn:

    Get-Module -ListAvailable

In de uitvoer van dit laatste commando zie je waar Powershell de modules fysiek heeft geplaatst. Omdat we als scope `CurrentUser` hebben gekozen, staat de module ergens in het gebruikersprofiel, b.v. onder `Document\WindowsPowershell\Modules`.

De lijst met commando's die in deze module zit, kunnen we opvragen:

    Get-Command -Module WriteAscii

In deze module zit maar 1 commando met de naam `Write-Ascii`. We kunnen de help opvragen:

    Get-Help Write-Ascii

> Je leest b.v. dat het *lettertype* dat gebruikt zal worden, te vinden is in het bestand `letters.xml` in de directory v.d. module

En we kunnen uiteindelijk de functie gebruiken:

    Write-Ascii Boe! -BackgroundColor DarkCyan -ForegroundColor White

> Vergeet niet dat je TAB-completion kan gebruiken, ook voor de kleuren! Kijk de broncode van deze module na om te controleren hoe de lijst met mogelijke kleuren gedefinieerd is.

Tot slot kunnen we deze geladen module ook weer uit de sessie verwijderen en dit controleren:

    Remove-Module writeascii
    Get-Module

Wanneer je nu terug de `Write-Ascii` uitvoert, zal automatisch de module weer geïmporteerd zijn:

    Write-Ascii "Automatic imports" -ForegroundColor DarkRed
    Get-Module

Je kan de module ook zelf importeren voor eerste gebruik:

    Remove-Module writeascii
    Get-Module
    Import-Module writeascii
    Get-Module

## Modules vs Scripts

Modules worden opgeslagen in bestanden met de extensie `.psm1`.

Je zal ook bestanden met de extensie `.ps1` tegenkomen. Dit zijn gewone scripts.

## Opdrachten

## 1

Zoek naar `approved powershell verbs` om de documentatie te vinden over wanneer je welke **verbs** moet gebruiken als je zelf commando's gaat schrijven. 

Microsoft heeft voor elk werkwoord relatief éénduidige afspraken. Zoek b.v. op wanneer je:

- `New` moet gebruiken vs. `Set`
- `Get` vs. `Read`

Je kan ook vinden met welke werkwoorden deze werkwoorden gepaard gaan:

- `Open` 
- `Get`
- `Disonnect`
- ...

## 2

Kijk in de help van `Get-Command` welke mogelijkheden er zijn voor het argument `-CommandType`. (Je kan dit natuurlijk ook te weten komen door auto-completion uit te voeren). Dit kan een vertrekpunt zijn om meer informatie op te zoeken over (nog onbekende) mogelijkheden in Powershell.

## 3

In de module `international` kun je op een Windows-machine een aantal *locale*-instellingen doen, zoals de geïnstalleerde toetsenborden en de taal-instellingen.

Probeer zelf een nieuw toetsenbord toe te voegen voor b.v. qwerty.

## 4

Waar bevinden de `psm1`-bestanden zich fysiek op schijf?

Dit kan je b.v. controleren met `Get-Module -ListAvailable`.

Controleer zelf de inhoud van de directory van de gedownloade `WriteAscii`-module en vergelijk deze met de inhoud van GitHub-pagina van deze module.

> Zijn alle Powershell-modules ook geschreven in Powershell of kan dat ook in een andere taal?
> 
> - .Net (b.v. C#) (managed programmeertalen)
> - b.v. C++ (unmanaged programmeertalen) - CIM / CDXML

## 5

Op http://www.figlet.org/ vind je andere ASCII-fonts.

Beschouw het als een projectje voor een regenachtige dag om een script te schrijven dat automatisch de fonts die je daar kan downloaden omzet in het voor `Write-Ascii` gewenste formaat (zoals te vinden in `letters.xml`). Als dit helemaal lukt, loont het waarschijnlijk ook de moeite om dit op GitHub te zetten en misschien de schrijver v.d. `WriteAscii`-module te contacteren.
