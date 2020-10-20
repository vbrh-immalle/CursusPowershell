# Wildcards

In

    Get-Help about_wildcards

kunnen we lezen over deze 3 (of eigenlijk 4) soorten wildcards. Veruit de meest gebruikte is `*`.

## `Get-ChildItem`

Al deze commando's zijn eigenlijk hetzelfde (kan je uitleggen waarom?):

    dir *.txt
    Get-ChildItem *.txt
    dir -Filter *.txt
    Get-ChildItem -Filter *.txt

## `Get-Command`

Enkele voorbeelden:

    Get-Command [bc]*[d]
    Get-Command [a]d[d]*
    Get-Command [a]?[d]*

Merk op dat er een verschil is tussen deze 2 commando's (in de help kunnen we lezen waarom):

    Get-Command
    Get-Command *

We kunnen dit verschil ook opmerken m.b.v. het `Measure`-commando:

    Get-Command | Measure
    Get-Command * | Measure

## `Get-Module`

Bij modules komt het vaak voor dat er een `.` in de naam staat.

> Ook bij bestandsextensies komt dit uiteraard voor!

Met slim gebruik van wildcards, kan je op die manier alle modules tonen die bij elkaar gegroepeerd zijn, b.v.

    Get-Module -All *.[U]*
    Get-Module -All Microsoft.*

## Andere commando's

Wildcards kan je zeer veel plaatsen gebruiken. Wat denk je b.v. hiervan?

    dir | fl name, [l]*
    dir | Format-List name, L*

Dit laat alle *properties* van de bestanden en directories zien die beginnen met een `l`, zoals `Length`, `LastAccessTime`, ...

Of:

    dir | Format-Table name, Last*

## Opdrachten

### 1

Probeer elk van deze wildcards uit a.h.v. `Get-Command`. Gebruik ook meerdere wildcards gelijktijdig en vergeet niet dat je er ook nog gewone tekst tussen kan plaatsen!

- `*`: veel karakters
- `?`: 1 karakter
- `[a-c]`: een bereik (range) van karakters
- `[ac]`: een opsomming van karakters

### 2

Bedenk voor jezelf nog andere opdrachten. Je mag deze steeds delen met de rest v.d. klas (via Teams, OneNote, ...)
