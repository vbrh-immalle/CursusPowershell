# Rekenmachine

## Traditioneel rekenen met decimale getallen

Computer betekent (bijna) letterlijk nog altijd **rekenmachine**.

> **to compute** (Engels): berekenen

Laten we daarom eens enkele simpele berekeningen doen:

- een som

```
3+4
```
- een verschil

```
10-8
```

- een vermenigvuldiging

```
4*3
```

- een reële deling

```
10/3
```

- de rest bij deling (modulo)

```
10%3
```

- wetenschappelijke notitie (macht van 10 achter de `e`)

```
3e3
1.8e-3
```

## Math-functies van .Net

Powershell is geschreven bovenop het .Net-framework (hetzelfde framework dat de meeste in C# geschreven programma's gebruiken). Dit maakt dat we - mits een speciale *syntax* - ook .Net-functies (en constanten, classes, ...) kunnen gebruiken.

> **syntax**: hiermee worden de specifieke details van een programmeertaal mee bedoeld, zoals de specifieke plaatsting van (rechte of ronde) haakjes, accolades, punten, puntkomma's, ...

- de constante **pi**

```
[Math]::pi
```

- 2 tot de 4e macht

```
[Math]::Pow(2, 4)
```

## Bewerkingen met andere dingen dan getallen

Hoewel een computer dus eigenlijk een rekenmachine is, bieden viel programmeertalen manieren aan om de rekenkundige operatoren ook te gebruiken op andere soorten objecten dan getallen, b.v. **strings**. (Men noemt dit ook wel **operator overloading** omdat de `+`-operator een extra functionaliteit krijgt: in het geval van strings is dit het *aan elkaar plakken* of *concateneren*.)

> **String**: letterlijk betekent dit een strengel of dus een aaneenschakeling. In de context van programmeertalen bedoelen we hier bijna altijd een aaneenschakeling van **karakters** mee. We zullen later nog spreken over verschillende *encodings* van karakters (zoals *ASCII* en *Unicode*)

- Plak 2 strings aan elkaar

```
"hallo " + "daar"
'hallo ' + "jij"
```

Je ziet dat we voor strings zowel single (`'`) als double (`"`) quotes kunnen gebruiken in Powershell.

## Traditioneel rekenen met binaire en hexadecimale getallen

Door `0x` voor een getal te plaatsen, wordt het beschouwd als een hexadecimaal getal.
Op dezelfde wijze kunnen we `0b` voor binaire getallen plaatsen (enkel in Powershell Core).

De **uitvoer** van Powershell is wel altijd decimaal!

Probeer het volgende:

- een hexadecimaal getal omzetten naar decimaal

```
0x1F
```

- de som van een hexadecimaal getal en een decimaal getal

```
0xA+5
```

- 2 binaire getallen optellen (werkt alleen in Powershell Core)

```
0b0011 + 0b0010
```

Wanneer we Powershell toch de output willen laten tonen in het hexadecimaal of binair, kan de .Net-functie `[Convert]::ToString(getal)` ons helpen. Deze functie kan objecten (vaak *getallen*) omzetten naar een string maar kan als tweede parameter een **grondtal** (**base**) meekrijgen, b.v. `[Convert]::ToString(getal, 2)`.

| base        | uitleg                                                      |
|-------------|-------------------------------------------------------------|
| **base 2**  | getallen met grondtal 2 of dus de **binaire** notatie       |
| **base 8**  | getallen met grondtal 8 of dus de **octale** notatie        |
| **base 10** | getallen met grondtal 10 of dus de **decimale** notatie     |
| **base 16** | getallen met grondtal 16 of dus de **hexadecimale** notatie |

- getallen (en berekeningen) weergeven als binaire getallen

```
[Convert]::ToString(15, 2)
[Convert]::ToString(15+1, 2)
```

- getallen weergeven als hexadecimale getallen

```
[Convert]::ToString(15, 16)
```

## Operatoren die een booleaans resultaat geven

De **Booleaanse algebra** is de algebra die met getallen werkt met maar 2 mogelijke waarden: **waar** en **onwaar** (**true** en **false**). Wanneer we rekenen met **bits** doen we dus eigenlijk Booleaanse algebra.

Nu kan je 2 bits (in de stricte Booleaanse zin) niet zomaar optellen, aftrekken, vermenigvuldigen of delen. In de booleaanse algebra zijn er andere basis-operaties waaronder:

- AND
- OR
- NOT (inversie)

In Powershell zijn de mogelijke Booleaanse waarden gedefinieerd als `$true` en `$false`. De operatoren AND en OR zijn operatoren die **2 operanden** hebben. Ze zijn in Powershell gedefinieerd als `-and` en `-or`. De NOT-operator heeft steeds maar **1 operand** en is in Powershell gedefinieerd als `!`.

Tot zover de theorie. Het wordt veel duidelijker met enkele voorbeelden:

- de Booleaanse waardes

```
$true
$false
```

- het inverse

```
!$true
!$false
```

- logische bewerkingen tussen 2 booleaanse waarden

```
$true -and $true
$true -and $false
$true -or $false
$false -or $false
$false -or !$false
```

Toegegeven, je ziet hier waarschijnlijk nog niet onmiddellijk het nut van. Het wordt misschien pas echt duidelijk als we ook **vergelijkingsoperatoren** toevoegen.

## Vergelijkingsoperatoren

Met vergelijkingsoperatoren bedoel we de zaken zoals:

- groter dan
- groter dan of gelijk aan
- kleiner dan
- kleiner dan of gelijk aan
- gelijk aan
- niet gelijk aan
- ...

In Powershell gebruiken we er het `-`-teken voor gevolgd door een afkorting:

- `-eq`: equal to
- `-ne`: not equal to
- `-lt`: less than 
- ...

En nu komt het: het resultaat van een bewerking met een vergelijkingsoperator **is altijd een Booleaanse waarde**: `$true` of `$false`!

Enkele voorbeelden:

- het vergelijken van 2 getallen

```
3 -lt 5
5 -lt 3
5 -eq 5
```

- het vergelijken van 2 strings

```
"hallo" -eq "hallo"
"hello" -ne "hallo"
```

- het vergelijken van 2 booleaanse waardes

```
$true -eq $true
$true -eq $false
```

- we kunnen ook meerdere bewerkingen combineren met haakjes (de bewerking tussen haakjes wordt dan uiteraard eerst uitgevoerd)

```
(3 -gt 1) -eq $true
!(3 -gt 1)
(3 -gt 1) -and (5 -gt 2)
(3 -gt 1) -and (1 -gt 2)
```

Begrijp je nu (beter) waarom Booleaanse algebra zo belangrijk is in computersystemen? Het is ook handig dat een booleaanse waarde zeer compact kan worden voorgesteld, nl. door slechts **1 bit**!

## EXTRA: Bitsgewijs rekenen

Bij het werken met binaire getallen (en **alle** getallen zijn in een computersysteem eigenlijk binaire getallen!), zijn er naast de klassieke rekenkundige operatoren +, -, *, / en % ook nog enkele bitsgewijze operatoren, waaronder:

- AND (conjunctie): `-band`
- OR (disjunctie): `-bor`
- NOT (inversie): `-bnot`

> In de verzamelingenleer spreekt met over een **conjuncte** verzameling van 2 verzamelingen als alle elementen van verzameling A **ook** in verzameling B voorkomen. We spreken van een **disjuncte** verzameling als alle elementen van 2 verzamelingen voorkomen in verzameling A **OF** in verzameling B.

- het ANDen van 2 getallen in binaire notatie (en de omzetting naar een binair resultaat)

```
0b0011 -band 0b0111
[Convert]::ToString(0b0011 -band 0b0111, 2)
```

- het ORen van 2 getallen in binaire notatie

```
0b0011 -bor 0b0111
```

- het ORen van 2 getallen in hexadecimale notatie

```
0x3 -bor 0x7
[Convert]::ToString(0x3 -bor 0x7, 16)
```

- het inverteren van (de bits van) een getal

```
-bnot 0xf
-bnot 0
-bnot 0b01010101
[Convert]::ToString(-bnot 0b01010101, 2)
```

De resultaten die je krijgt van de `-bnot`-operator zijn waarschijnlijk verwarrend. Hoe komen we plots aan negatieve getallen? Het zou ons nu te ver leiden om daar dieper op in te gaan maar het heeft te maken met hoe negatieve getallen in computersystemen worden opgeslagen (zie b.v. https://nl.wikipedia.org/wiki/Two%27s_complement) en dat Powershell (.Net) standaard met 32-bit getallen werkt.

> Het werken met bitsgewijze operatoren is iets dat later, bij bijvoorbeeld de **subnetmaskers van IP-adressen**, van belang zal zijn. Voorlopig moet je je hoofd hier te hard over breken.

## Opdrachten

### 1

Doe zelf berekeningen zoals in de voorbeelden hierboven.
Je kan Powershell gebruiken als een *labo* om te experimenteren met booleaanse algebra, vergelijkingsoperatoren en binaire en hexadecimale getallen!

Speel dus een beetje een wetenschapper en ga zelf op onderzoek! Maak hypotheses (veronderstellingen) en verifieer met deze krachtige rekenmachine waar wetenschappers uit de 19e eeuw alleen maar van konden dromen.

> Eigenlijk zijn onze hedendaagse computers een realisatie van een *droom* van https://nl.wikipedia.org/wiki/Alan_Turing waarvan al eerder de fundamenten waren gelegd door https://nl.wikipedia.org/wiki/George_Boole en https://nl.wikipedia.org/wiki/Ada_Lovelace en natuurlijk vele anderen!

### 2

Je merkt dat Powershell (en andere programmeertalen met een **interactieve prompt**, zoals b.v. ook Javascript in de webbrowser, Python en er bestaan zelfs REPL's voor C#).

> Zoek op wat een REPL is.

Open in een webbrowser de **development tools**. Alle rekenkundige berekeningen die we hier in Powershell deden, kan je daar ook in Javascript doen. Uiteraard is de **syntax** soms wel anders (maar soms merkwaardig gelijkaardig)!

### 2

Wanneer je in Powershell 5 op Windows het commando `Update-Help` uitvoert (dat even tijd kan nodig hebben) wordt veel van de documentatie van Powershell naar je PC gedownload en kan je het benaderen met het commando `Get-Help`.

> Je voert `Update-Help` best uit als Administrator zodat alle bestanden mogen weggeschreven worden.

> `Update-Help` werkt niet altijd op alle platformen in Powershell Core.

Weet echter dat je steeds alle documentatie ook online kan vinden. Je kan aan `Get-Help` zelfs de parameter `-Online` meegeven op de webbrowser automatisch te openen op de juiste pagina.

Doorblader vluchtig de help-pagina's van de **wiskundige operatoren** en de **vergelijkingsoperatoren**. Je merkt dat de documentatie van Powershell een zeer grondig naslagwerk kan zijn.

    Get-Help about_Arithmetic_Operators
    Get-Help about_Comparison_Operators

Om een lijst op te vragen van alle (gedownloade) `about_`-documenten:

    Get-Help about*
   
### 4

Zoek zelf informatie over de XOR-functie in het algemeen en de `-xor` (booleaanse) en `-bxor` (bitsgewijze) Powershell-operatoren in het bijzonder. De XOR-functie is een belangrijke bouwsteen voor heel wat algoritmes in de computerwetenschappen en elektronica!
