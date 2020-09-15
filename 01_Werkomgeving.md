# Werkomgeving

## Windows 10 en Powershell 5

Windows 10 wordt tegenwoordig (momenteel versie 2004) geleverd met Powershell 5.

> Windows 10 **2004**: Sinds Windows 10 gebruikt Microsoft voor de versienummering van Windows 10 steeds een 4-cijferig getal dat het jaartal en de maand van de release-datum voorstelt. 2004 is dus het versienummer van de Windows 10-versie die is uitgekomen in april 2020.

> Powershell **5**: de traditionele Powershell die nog geschreven is met het traditionele .NET framework. We bedoelen hiermee ook alle kleine updates, zoals 5.1.1, 5.1.2, 5.2, ...

Powershell kan als gewone user worden uitgevoerd maar omdat Powershell vaak voor beheerderstaken wordt gebruikt, kan je het uitvoeren **als Administrator**. Afhankelijk van de UAC-instellingen, krijg je dan een beveilingswaarschuwing te zien waar je eventueel een (beheerders-)wachtwoord moet ingeven.

> **UAC**: User Account Control, het beschermingsmechanisme van Windows om gewone gebruikers niet zomaar standaard de rechten te geven om bepaalde instellingen te wijzigen

Behalve het standaard Powershell-venster, is ook de grafische **Powershell ISE** (Interactive Scripting Environment) op Windows 10 voorgeïnstalleerd.

## Powershell op andere platformen

Op https://aka.ms/powershell kan je de laatste versies van Powershell downloaden waaronder ook **Powershell Core** dat geschreven is in **.Net Core** en daardoor niet enkel op het Windows-platform werkt.

Ook het vermelden waard zijn:

- **Windows Terminal Preview** (te downloaden van de Windows Store): het werd hoog tijd dat Microsoft zijn ouderwetse opdrachtprompt/Powershell-venster van een upgrade ging voorzien!
- **Visual Studio Code**: een all-round zeer goede tekst-editor met ook te installeren extensions voor Powershell

**.Net Core**, **Powershell Core** en **Visual Studio Code** zijn cross-platform: je kan ze op Windows, OS X of Linux draaien.

## Opdrachten

### 1

Een shell is eigenlijk maar een gewoon programma met een CLI i.p.v. een GUI. Om dit verder te illustreren, kan je (voor de lol) eens *een shell in een shell in een shell* opstarten...

- Open een Powershell-venster.
- Type `powershell` om een tweede powershell-omgeving te openen
- Type `exit` om de laatste powershell-omgeving te verlaten
- Type nogmaals `exit` om het oorspronkelijke venster te sluiten

Ja kan Powershell dus ook opstarten vanaf de opdrachtprompt:

- Open een (ouderwetse) opdrachtprompt
- Type `powershell`
- Type `cmd`: je hebt nu een ouderwetse opdrachtprompt die gestart is vanaf powershell die gestart is vanaf cmd ;-)
- Type `exit`
- Type `exit`
- Type `exit`

### 2

Microsoft heeft de drempel voor het gebruik van Powershell uiteraard zo laag mogelijk gehouden voor mensen die DOS-commando's gewend zijn. Dit wil zeggen dat zeer veel oude DOS-commando's nog nog steeds werken (we zullen later zien hoe dit precies werkt). Je kan dus gerust de commando's die je al kent gebruiken, zoals:

- `dir` om de inhoud van een directory te zien
- `cd` om de huidige directory te tonen of naar andere directories te gaan
- `cd ..` om naar de hoger gelegen directory te gaan
- `type` om de inhoud van tekstbestanden te zien
- ...

Je zal wel merken dat de output lichtjes anders is. Vergelijk b.v. de output van `dir` in zowel `powershell` als `cmd`.

### 3

Bekijk de argumenten die je kan meegeven aan `cmd.exe` en `powershell.exe`:

- `cmd /?`
- `powershell /?`

In de beginjaren van Powershell met `cmd.exe` vaak nog ouderwetse (maar noodzakelijke) commando's uitgevoerd in een Powershell-script.

### 4

Installeer Powershell Core (en maak het venster eventueel vast aan je start-balk).

Het kan steeds interessant zijn om de verschillen met Powershell 5 uit te proberen.

### 5
 
Installeer modernere tools zoals Windows Terminal Preview en Visual Studio Code.

> Beide programma's maken gebruik v.h. zogenaamde "command palette" (te openen met CTRL-(SHIFT)-P).

Vergelijk de gebruikerservaring met de standaard tools, b.v. als je een stuk tekst uit de terminal wil kopiëren of plakken.

### 6

Bedenk voor jezelf nog andere opdrachten.
