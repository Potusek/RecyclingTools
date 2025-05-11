# Skrypt do pakowania moda RecyclingTools
# Użycie: .\pack_mod.ps1

# Sprawdź czy istnieje struktura moda
if (-not (Test-Path "modinfo.json")) {
    Write-Error "Nie znaleziono pliku modinfo.json. Uruchom skrypt z katalogu głównego moda."
    exit 1
}

# Wczytaj modinfo.json i pobierz dane
$modInfo = Get-Content "modinfo.json" | ConvertFrom-Json
$modName = $modInfo.modid
$version = $modInfo.version
$outputFile = "$modName-v$version.zip"

Write-Host "Znaleziono mod: $($modInfo.name) [$modName] v$version"

# Utwórz listę plików do spakowania
$files = @(
    "modinfo.json",
    "modicon.png",
    "assets/"
)

# Usuń stary plik ZIP jeśli istnieje
if (Test-Path $outputFile) {
    Remove-Item $outputFile
}

# Spakuj pliki
Write-Host "Pakowanie moda $($modInfo.name) v$version..."
Compress-Archive -Path $files -DestinationPath $outputFile

Write-Host "Mod został spakowany do pliku: $outputFile"
Write-Host "Gotowy do instalacji w folderze Mods gry Vintage Story!"

# Opcjonalnie: wyświetl opis moda
if ($modInfo.description) {
    Write-Host ""
    Write-Host "Opis: $($modInfo.description)"
}