# PSDrives

Het concept van een drive (schijf) en meerbepaald een drive-letter is iets dat DOS (Disk Operating System) gepopulariseerd heeft.
DOS gebruikt b.v. volgende drive-letters:

- `A:`: de eerste floppy disk-drive uit het systeem
- `C:`: de eerste harde schijf uit het systeem
- ...

Bij andere OS's (zoals Linux) bestaat het bestandssysteem uit 1 grote hiërarchie, waarbij `/` (de root) de hoofdmap is.
Alle fysieke schijven moeten ge*mount* worden onder deze hiërarchie, b.v. een usb-drive zal worden ge*mount* onder `/media/usb`.
(Merk trouwens op dat Linux-systemen `/` i.p.v. `\` gebruiken als path-scheidingsteken. Windows is dit later ook beginnen ondersteunen.)

## PowerShell-Drives

Met dit commando tonen we een overzicht van alle "drives":

    Get-PSDrive

Van de echte fysieke schijven (eigenlijk moeten we zeggen v.d. *partities* v.d. schijven) zien we een aantal statistieken, zoals hoeveel vrije ruimte er is.
Maar er zijn ook een aantal drives die iets anders voorstellen dan een bestandssysteem!

Met het `cd` commando kunnen we het huidige pad ook veranderen naar deze speciale drives. Hier zijn we dan wel verplicht om `cd` ervoor te zetten.

Deze commando's doen hetzelfde:

    C:
    cd C:

Maar voor andere drives (`Alias:`, `Env:`, ...) zijn we dus **verplicht** om `cd` ervoor te zetten.

    cd Env:

Laten we eerst eens enkele commando's van *gewone* drives herhalen en daarna deze commando's uitproberen voor enkele speciale drives.

## Bestandssystemen

Een overzicht van alle bestanden en mappen:

    dir
    Get-ChildItem
    Get-Item *

Merk op dat `dir` een alias is van `Get-ChildItem` en soms hetzelfde doet als `Get-Item *`.

De inhoud tonen van een bestand (vervang het pad door je eigen `ConsoleHost_history.txt`-bestand te vinden met `Get-PSReadLineOption`):

    Get-Content C:\Users\hans\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
    cat C:\Users\hans\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt

### `Get-Item` vs `Get-ChildItem`

Merk op dat deze 2 commando's hetzelfde betekenen:

    Get-ChildItem
    Get-ChildItem .

In de laatste variant geven we expliciet mee dat we de kind-items van de **huidige locatie** willen zien.

Probeer beide commando's en verklaar het verschil:

    Get-Item C:\Windows\System32\drivers\etc
    Get-ChildItem C:\Windows\System32\drivers\etc

`Get-ChildItem` heeft (i.t.t. `Get-Item`) een aantal extra parameters waarmee ook *kind*-items kunnen opgevraagd worden: 

- `-Recurse`
- `-Depth`

Probeer b.v.

    Get-ChildItem -Depth 2
    Get-ChildItem -Recurse
    ...


Het valt op dat nog een aantal andere parameters van `Get-ChildItem` vooral zijn toegevoegd voor het beheren van bestandssystemen (maar soms ook nuttig kunnen zijn voor andere speciale drives). B.v.

- `-Attributes`
- `-Directory` (waarmee alleen directories worden getoond en geen bestanden)
- `File`
- ...

Om enkel de *directories* in een map te zien, kan je het volgende doen:

    dir -Directory C:\Windows\System32\drivers\
    dir -Attributes Directory C:\Windows\System32\drivers\
    
## Alias-drive

    cd Alias:
    dir

Dit doet hetzelfde als:

    Get-Alias

De objecten zijn ook van hetzelfde type (zie later)

    dir | gm
    Get-Alias | Get-Member

Ook het commando `Get-Content` (of een alias ervan zoals `cat` of `type`) werkt nu in deze drive:

    type dir
    cat dir
    Get-Content dir

## Omgevingsvariabelen-drive

Later zien we meer over omgevingsvariabelen maar dit is dus één manier om omgevingsvariabelen te tonen:

    cd Env:
    dir
    
Meerbepaald als we de omgevingsvariabele `PATH` willen tonen, kan dit o.a. op deze manieren:

    $env:PATH
    cat Env:PATH

Op de laatste manier gebruiken we de PSDrive `Env:`.

## Function-drive

In een Powershell-sessie kunnen **functies** gedefinieerd zijn. We kunnen ze tonen met:
    
    cd Function:
    dir

Sommige commando's die je mogelijk al kent, zijn eigenlijk functies, b.v. de functie `mkdir` is een *wrapper* rond het eigenlijke commando om in Powershell nieuwe directories te maken: `New-Item`:

    cat Function:mkdir

> De precieze betekenis van deze code hoef je uiteraard nog niet te kennen maar het komt er op neer dat er functies worden gemaakt met meestal een aantal parameters! Sommigen ondersteunen de pipeline (als het woordje `process` er in voorkomt).

Uiteraard kan `New-Item` niet alleen gebruikt worden voor nieuwe bestanden of directories maar ook voor nieuwe variabelen, aliases, ... omdat er voor al deze dingen dus PSDrives zijn.
Het heeft wel de voorkeur om de beter geschikte commando's zoals `New-Variable`, `New-Alias`, ... te gebruiken.

Het valt hier ook op dat het veranderen van de huidige schijf in Powershell eigenlijk ook een functie is. Er zijn voor alle mogelijke drive-letters (A t.e.m. Z) functies gedefinieerd. Nu begrijp je waarom voor echte schijven de `cd` er niet voor hoeft gezet te worden: achter de schermen roept Powershell deze functies aan! Deze functies bestaan dus om compatibiliteit met DOS te voorzien.

    cat Function:C:

Een andere functie is `help`. Je zou misschien denken dat `help` een eenvoudige alias is voor `Get-Help` maar `help` doet meer: het zal telkens een **more**-prompt laten zien als het scherm vol is, zodat het niet voorbij scrollt.
Met de `spatiebalk` kan je een volgende pagina tonen en met `q` kan je (het programma) `more` verlaten.

Probeer dit zelf uit, b.v.

    help help
    help Get-Help

Om de inhoud van deze functie te tonen:

    cat Function:help
    Get-Content Function:help

`more` is trouwens zelf ook een functie die dient als *wrapper* rond het (ouderwetse) programma `more.com`. Volgende commando's geven je meer info.

    cat Function:more
    Get-Command more 
    Get-Command more -All

## Opdrachten

### 1

Maak zelf enkele nieuwe alias's, b.v. `myhelp`, `myhelp2`, `myhelp3`, ... voor `Get-Help`. Doe dit zowel met de meest geschikte commando's (`New-Alias`) als via de PSDrive (met `New-Item`).

Nadat ze gemaakt zijn, kan je ze ook aanpassen met `Set-Alias` of `Set-Item`.

Uiteraard staat de help (en de voorbeelden!) steeds tot je beschikking. Controleren of alles gelukt is, doe je natuurlijk ook met `Get-Alias myhelp`, `dir Alias:myhelp2`, ...

### 2

Bedenk voor jezelf nog andere opdrachten. Je mag deze steeds delen met de rest v.d. klas (via Teams, OneNote, ...)
