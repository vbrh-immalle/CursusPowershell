# Datums en tijden

## Voorwoord

Soms moeten we berekeningen maken met **datums** en **tijden**. Traditionele rekenmachines kennen dit concept niet!
Een rekenblad zoals Excel natuurlijk wel en tegenwoordig heeft ook de ingebouwde rekenmachine van Windows 10 een *Datumberekening*-modus.

Hou steeds goed voor ogen dat je bij datum- en tijdberekeningen eigenlijk met 2 types te maken hebt:

- `DateTime`: een **tijdstip** voorstelt (met een nauwkeurigheid beter dan milli-seconden)
- `TimeSpan`: Een **tijdsspanne** of **tijdsduur**

Een **tijdsspanne** of **tijdsduur** is immers geen **tijdstip** maar het **verschil** tussen 2 tijdstippen!

## Now

Het huidige tijdstip:

    Get-Date

Opslaan in een variabele:

    $now = Get-Date

Wat kunnen we opvragen van dit tijdstip?

    $now = Get-Member

De huidige maand:

    $now.Month

Door haakjes te gebruiken, kunnen we de variabele vermijden:

   (Get-Date).Month

> Als je meerdere bewerkingen moet doen met hetzelfde tijdstip, moet je dit opslaan in een variabele!

## Voorbeeld

We definiëren 2 variabelen van type `DateTime`:

    $startDate = Get-Date -Year 2020 -Month 9 -Day 1
    $endDate = Get-Date -Year 2020 -Month 10 -Day 1

We kunnen dit ook korter schrijven omdat `Get-Date` de meegegeven string zal *parsen*:

    $startDate = Get-Date 2020-09-01
    $endDate = Get-Date 2020-10-01

Hiermee kunnen we nu zoeken in alle bestanden:

    dir -Recurse | where {$_.LastWriteTime -ge $startDate -and $_.LastWriteTime -le $endDate}

Als je geen tijdelijke variabelen (`$startDate` en `$endDate`) wil maken, kan dit ook:

    dir -Recurse | where {$_.LastWriteTime -ge $(Get-Date 2020-09-01) -and $_.LastWriteTime -le $(Get-Date 2020-10-01)}

## Opdrachten

### 1

Gebruik de omgevingsvariabelen `USERNAME` en `COMPUTERNAME` om een string af te printen als Powershell wordt geopend.

    Hallo Joske! Je werkt op COMPUTER-01.

Het pad v.h. script dat Powershell uitvoert bij het openen is te vinden in de (gewone) variabele `$Profile`.

### 2

De periode om een ontvangen postpakketje terug te sturen is 120 dagen na de ontvangstdatum.

Op 18 september ontvingen we het pakketje. Wanneer moeten we ten laatste het retour-formulier invullen?

    $ontvangstdatum = Get-Date 2020-09-18
    $ontvangstdatum.AddDays(120)

### 3

Google de efemeriden van:

- vandaag
- een andere dag b.v. je verjaardag

en doe hier een berekeningen mee.

Voorbeeld:

 > "From dusk till dawn"

    $dusk = get-date 7:47
    $dawn = get-date 17:05

Hoe lang duurt de dag?

    $dawn - $dusk

Wanneer zitten we halverwege de dag? (We werken met een nauwkeurigheid van minuten.) (We kunnen niet zomaar het timespan door 2 delen: deling is niet gedefinieerd voor een `TimeSpan`. We hebben dus de property `totalminutes` nodig.)
    
    (($dawn-$dusk).totalminutes/2)

Om dit op te tellen bij een bestaande datum, moeten we er eerst terug een TimeSpan van maken.

    $dusk + $(New-TimeSpan -Minutes 10)
    $dusk + $(New-TimeSpan -Minutes (($dawn-$dusk).totalminutes/2))

### 4

Bereken:

- hoeveel **dagen** je al in leven bent?
- hoeveel **seconden** je al in leven bent?
- hoeveel dagen je al geleefd zal hebben op nieuwsjaardag 2021
