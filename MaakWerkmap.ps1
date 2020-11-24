# Maak een werkmap met random naam op de C-schijf
$guid = New-Guid
$werkmappad = "C:\Werkmap-$($guid.Guid)"
Write-Output "De map [$werkmappad] wordt gemaakt..."
mkdir $werkmappad

# Start met
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.github.com/vbrh-immalle/CursusPowershell/master/MaakWerkmap.ps1'))

# Maak een tekstbestand met de naam v.d. gebruiker die het script uitvoert
Set-Content -Path $(Join-Path -Path $werkmappad -ChildPath groet.txt) -Value "Hallo $env:USERNAME!"

# Maak 5 binaire bestanden van random grootte (max. 1024 bytes) met random bytes
1 .. 5 | ForEach-Object {
    $filenaam = Join-Path -Path $werkmappad -ChildPath "file$_.bin"
    $numBytes = Get-Random -Maximum 100
    Write-Output "Het bestand [$filenaam] wordt gevuld met $numBytes random bytes..."
    $buf = [System.Byte[]]::new($numBytes)
    $rndGenerator = [System.Random]::new()
    $rndGenerator.NextBytes($buf)
    Set-Content -Path $filenaam -Value $buf -Encoding Byte
}


# Maak 5 tekstbestanden van random grootte (max. 100 woorden) met random woorden/karakters
1 .. 5 | ForEach-Object {
    $filenaam = Join-Path -Path $werkmappad -ChildPath "file$_.txt"
    $aantalWoorden = Get-Random -Maximum 100
    Write-Output "Het bestand [$filenaam] wordt gevuld met $aantalWoorden random woorden..."
    0 .. $aantalWoorden | ForEach-Object {
        $randomWoordLengte = Get-Random -Maximum 10
        $woord = ""
        0 .. $randomWoordLengte | ForEach-Object {
            $letter = ([char][int]$(Get-Random -Minimum ([char]'a') -Maximum ([char]'z')))
            $woord += $letter
        }
        Add-Content -Path $filenaam -Value $woord
    }
}

function Add-FF {
    <#
    .SYNOPSIS
        Voegt de byte 0xFF toe aan een bestand waardoor het 1 byte groter wordt.
        Controleer met Format-Hex!
    .DESCRIPTION
        Voegt de byte 0xFF toe aan een bestand waardoor het 1 byte groter wordt.
        Controleer met Format-Hex!
        Deze functie heeft weinig nut behalve voor educatieve doeleinden.
    .PARAMETER Path
        Het bestand waaraan je de byte 0xFF wil toevoegen.
    #>
    Param([System.IO.FileInfo]$Path)
    Add-Content -Encoding Byte -Path $Path -Value ([byte]0xFF)
}
