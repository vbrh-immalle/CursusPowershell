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

:TODO:

We zullen zodadelijk laten zien hoe we het gedrag kunnen aanpassen en (afhankelijk van je persoonlijke voorkeur) **nog** handiger maken!

## Een overzicht van alle toetscombinaties

Het is erg makkelijk om te laten zien wat PSReadLine allemaal kan.

Laten we beginnen met te tonen welke toetsen(combinaties) momenteel geconfigureerd zijn:

    Get-PSReadLineKeyHandler

De toetsencombinaties worden gegroepeerd in 4 categorieën:

| categorie                 | omschrijving                                                    |
|---------------------------|-----------------------------------------------------------------|
| Basic editing functions   | basis bewerkingsfuncties voor tijdens het intypen van een regel |
| Cursor movement functions | functies om de cursor te verplaatsen                            |
| History functions         | functies om de commando-geschiedenis te gebruiken               |
| Completion functions      | functies om automatisch te laten aanvullen                      |
| Miscellaneous functions   | een aantal functies die onder de noemen *overige* vallen        |
| Selection functions       | functies om tekst te selecteren                                 |
| Search functions          | functies om te zoeken in de huidige regel tekst                 |

Laten we even enkele handige commando's overlopen.

### Handige editing functies

:TODO:

### Handige cursor functies

:TODO:

### Handige history functies

:TODO:

## Het gedrag v.d. TAB-toets aanpassen

Laten we eerst kijken welke functie momenteel aan de `TAB`-toets is gekoppeld:

    Set-PSReadLineKeyHandler -Chord TAB
    
> Het woord **Chord** kan vergeleken worden met het woord *akkoord* in de context van een keyboard-speler of pianist die ook meerdere toetsen tegelijk indrukt. `CTRL-N` is dus b.v. een *chord* omdat het bestaat uit 2 toetsen die tegelijk moeten ingedrukt worden.

Laten we nu de functie `MenuComplete` koppelen:

    Set-PSReadLineKeyHandler -Chord TAB -Function MenuComplete

:TODO:
    
## Opdrachten

### 1

Zoek op (of experimenteer) welke toetsen worden afgehandeld door jouw **terminal** (dus niet Powershell zelf!).

Bedenk dus dat deze toetsen **niet** terecht zullen komen bij `PSReadLine` omdat ze al eerder worden afgevangen!

TIPS:
- in het standaard opdrachtvenster van Windows kan je op het icoon linksboven klikken om in een menu een aantal snelkoppelingen te vinden i.v.m. kopiëren en plakken
- in de Preview versie van de nieuwe Windows Terminal, kan je het command pallette openen met `CTRL-(SHIFT)-P`

### 2

:TODO:

### 5

Bedenk voor jezelf nog andere opdrachten. Je mag deze steeds delen met de rest v.d. klas (via Teams, OneNote, ...)
