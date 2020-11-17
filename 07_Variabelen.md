# Variabelen

## Voorwoord

Als we de zienswijze doortrekken dat Powershell een rekenmachine is, hebben we **geheugenplaatsen** nodig.

> Een traditionele rekenmachine heeft meestal maar ruimte voor 1 getal. Dit geheugen kan dan b.v. gewist worden met de `MC`-toets (Memory Clear)
en er kunnen met `M+` en `M-` getallen bijgeteld of afgetrokken worden. `MR` (Memory Result) toont dan het resultaat. En soms heb je nog een toets zoals `MS` (Memory Set) om het huidige weergegeven getal in het geheugen op te slaan, daarbij eventuele voorgaande getallen overschrijvend. Zie b.v. de ingebouwde rekenmachine van Windows 10 (in Standaard- of wetenschappelijke modus).

Dankzij het enorme RAM-geheugen dat computers hebben, kunnen we in Powershell natuurlijk zeer veel geheugenplaatsen voorzien.
Uiteraard is het dan een quasi noodzaak om elke geheugenplaats ook **een goede naam** te kunnen geven! Hiervoor gebruiken we **variabelen**.

Natuurlijk slaan computers niet enkel **getallen** op maar ook b.v. **strings** en natuurlijk ook **collecties** (verzamelingen). Algemeneer kunnen we zeggen dat data wordt opgeslagen in **datastructuren**. Bij object georiënteerde talen, spreken we ook over **objecten** met **properties**.
Op het laagste niveau wordt al deze data natuurlijk wel als binaire getallen opgeslagen maar door de vele lagen tussenliggende software (operating system, .NET Framework, ...) wordt dit goed verborgen wat het gebruiksgemak (meestal) ten goede komt.

> **Programmeren = datastructuren + algoritmen**
>
> De helft v.h. werk bij het schrijven v.e. programma is het op de juiste manier opslaan van gegevens, d.w.z. in het juiste soort datastructuur.

## Inleiding

Alle variabelen beginnen met `$`.

Er zijn 2 soorten variabelen:

- Powershell-variabelen
- Omgevingsvariabelen (beginnend met `$Env:`)

**Powershell-variabelen** hebben enkel belang binnen Powershell-sessies.

**Omgevingsvariabelen** kunnen invloed hebben op gans het systeem.

## Overzicht

Alle Powershell-variabelen tonen:

    Get-Variable

Alle omgevingsvariabelen tonen (m.b.v. een **PSDrive**):

    dir Env:

Er zijn nog andere manier om variabelen aan te maken, te wijzigen en je kan ze zelfs uit het geheugen verwijderen. Zoek deze commando's op met

    Get-Command -Noun Variable

## Toekennen en weergeven

Een waarde toekennen aan een variabele kan met de zogenaamde **toekenningsoperator**: `=`. Als de variabele nog niet bestaat, wordt deze aangemaakt. Voorbeeld:

    $x = 3

De waarde tonen kan simpelweg door de variabele te typen.

    $x

Speciaal aan Powershell is dat **collecties** van variabelen (zoals arrays, lijsten, ...) automatisch worden aangemaakt wanneer de `,` gebruikt wordt om verschillende waarden op te sommen. Voorbeeld:

    $nummers = 1,2,3
    $nummers

De elementen uit een lijst kan je ook met een **index** (beginnende vanaf `0`) oproepen:

    $nummers[0]
    $nummers[1]
    $nummers[2]

> We krijgen b.v. ook een lijst als we een overzicht opvragen v.d. netwerkkaarten in een systeem:
>
>   Get-NetAdapter
>
> We kunnen deze lijst toekennen aan een variabele:
>
>   $nics = Get-NetAdapter
>
> En vervolgens weergeven:
>
>   $nics
>   $nics[0]
>   $nics[1]

Soms wil je variabelen (b.v. een getal) weergeven in het midden van een string. Wanneer je double quotes gebruikt voor strings (`"`) zal Powershell eventuele tegengekomen variabelen uitzoeken (resolven) en weergeven. Dit gebeurt niet wanneer je single quotes (`'`) gebruikt. Voorbeelden:

    "De waarde van x is $x."
    'De waarde van x is $x.'

## Interessante variabelen

Versie van Powershell:

    $PSVersionTable

> Alle variabelen die met `$PS` beginnen bevatten informatie over de configuratie van Powershell
> B.v. de locatie v.d. powershell-executable:
>
>   $PSHOME

Locatie van het opstartscript van deze gebruiker (dat elke keer bij het opstarten wordt uitgevoerd):

    $profile

## Het type (Get-Member)

Een variabele heeft steeds een **type**.

`Get-Member` alias `gm` is een handig hulpmiddel om het type v.e. variabele op te vragen en meteen ook de beschikbare **properties** en **methods** te exploreren. We kunnen dit doen voor eenvoudige-types:

    "blabla" | gm
    1 | gm

Maar ook voor complexere objecten

    Get-History | gm

Het is telkens de eerste regel (`TypeName: ...`) waar we vooral in geïnteresseerd zijn.
Daarom kunnen we dit beter zo opvragen:

    1 | gm | select TypeName

En nog beter:

    1 | gm | select -Unique TypeName
    Get-History | gm | select -Unique TypeName
    dir | gm | select -Unique TypeName
    [Math]::Pi | gm | select -unique typename
    
Met `Get-Member` kunnen we dus behalve het type aflezen, ook ontdekken welke properties en methods dit object nog kent. Dit commando laat b.v. zien welke String-functies beschikbaar zijn.
    
    [Convert]::ToString(192,2)
    [Convert]::ToString(192,2) | gm

We kunnen b.v. de `PadLeft`-method aanroepen:

    [Convert]::ToString(192,2).PadLeft(20)

Op dezelfde wijze, kunnen we ontdekken welke methods File- of Directory-objecten hebben:

    dir | gm

> `Get-Member` is zeer handig om .Net-objecten te exploreren en dus ook nuttig als je een C#-programma's schrijft!


## Casten

**Casten** is het **omzetten van het type** van een variabele **naar een ander type**.

De **string** `"3"` wordt omgezet naar een **int**:

    [int]"3"

Wat gebeurt hier?

    "3"+2
    [int]"3"+2

## Collecties

Deze collecties zijn hetzelfde:

    1..4
    1,2,3,4

We kunnen b.v. een collectie maken van alle mappen en bestanden in de huidige directory:

    $files = dir

## Opdrachten

### 1

Gebruik de omgevingsvariabelen `USERNAME` en `COMPUTERNAME` om een string af te printen als Powershell wordt geopend.

    Hallo Joske! Je werkt op COMPUTER-01.

Het pad v.h. script dat Powershell uitvoert bij het openen is te vinden in de (gewone) variabele `$Profile`.

### 2

Het gebruikersprofiel wordt in Windows opgeslagen in een bepaalde map. De omgevingsvariabele `$Env:USERPROFILE` zegt over welke map het gaat.

Er bestaat ook een (gewone/Powershell) variabele die deze map bevat.

> Op een Linux/BSD-systeem wordt deze variabele-naam gebruikt. Vandaar dat Powershell o.w.v. compatibiliteit met Linux/BSD-tools eveneens deze variabele definieert.

Over welke variabele gaat het?

### 3

`Get-PSReadLineOption` geeft een object terug van type `Microsoft.PowerShell.PSConsoleReadLineOptions`.
Gebruik deze properties van dit object om meer details op te zoeken over hoe en waar de command history wordt opgeslagen:

- `MaximumHistoryCount`
- `HistorySavePath`

Verifieer het aantal regels in het bestand. Zit je al aan de `MaximumHistoryCount`?

### 4 (Extra)

De **toekenningsoperator** (`=`) is een cruciale operator in zowat elke programmeertaal.
In zeldzame gevallen kan het voorkomen dat je een variabele wel wil maken maar **geen waarde** aan een variabele wil toekennen.
Dit kan b.v. zo

    $z = null

Maar het kan ook met 1 v.d. commando's die je vindt met

    Get-Command -Noun Variable
    Get-Command *Variable

Test zelf het gebruik van alle commando's i.v.m. variabelen grondig uit. Vergeet hierbij niet dat je steeds een overzicht van alle variabelen (met **alle** eigenschappen) kan opvragen met

    Get-Variable | select *
    Get-Variable | select * | ogv

Probeer een antwoord te vinden op volgende vragen zonder op Internet te zoeken en zo weinig mogelijk gebruikt te maken van `Get-Help`:

> Hoe moet je dit dan wel vinden? Powershell is zeer consistent in een aantal zaken waardoor je door te exploreren toch zeer veel te weten kan komen.
> Deze 2 tips moeten je verder helpen:
> - Het *Verb* van elk commando zegt precies wat het doet. `New-Variabele` dient om een nieuwe variabele te maken, terwijl `Set-Variable` dient om een waarde toe te kennen.
> - Elk object (en dus ook elke variabele) heeft een aantal eigenschappen (properties). Met `| select *` kunnen we deze allen weergeven. **Zeer vaak kunnen de eigenschappen gezet of opgevraagd worden via de parameters v.d. bijhorende commando's**.
> B.v. de omschrijving (`Description`) van een variabele kan gezet worden met de `-Description`-parameter van `Set-Variable`.

- Welke variabelen zijn **Read-Only**?
- Welke variabelen zijn **Constant**?
- Welke foutmelding krijg je als je een **Read-Only** of **Constant** variable toch een nieuwe waarde probeert toe te wijzen?
- Kan je met `Set-Variable` ook een nieuwe variabele maken?
- Hoe kan je een beschrijving (b.v. `zomaar een getal`) toekennen aan een zelf gemaakte variabele `$x`?
- Hoe kan je een zelfgemaakte variabele **Read-Only** maken?

### 5 (Extra)

https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/value-types#built-in-value-types

### 6 (Extra)

Bedenk voor jezelf nog andere opdrachten. Je mag deze steeds delen met de rest v.d. klas (via Teams, OneNote, ...)
