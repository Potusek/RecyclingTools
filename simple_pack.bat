@echo off
setlocal enabledelayedexpansion

rem Sprawdz czy istnieje plik modinfo.json
if not exist "modinfo.json" (
    echo Blad: Nie znaleziono pliku modinfo.json
    pause
    exit /b 1
)

rem Prosty parser JSON - pobierz modid i version
for /f "tokens=2 delims=:," %%i in ('findstr /r "\"modid\":" modinfo.json') do (
    set MOD_NAME=%%i
    set MOD_NAME=!MOD_NAME:"=!
    set MOD_NAME=!MOD_NAME: =!
)

for /f "tokens=2 delims=:," %%i in ('findstr /r "\"version\":" modinfo.json') do (
    set VERSION=%%i
    set VERSION=!VERSION:"=!
    set VERSION=!VERSION: =!
)

set OUTPUT_FILE=%MOD_NAME%-v%VERSION%.zip

echo Pakowanie moda %MOD_NAME% v%VERSION%...

rem Użyj wbudowanego narzędzia PowerShell do kompresji
powershell -command "Compress-Archive -Path 'modinfo.json', 'modicon.png', 'assets' -DestinationPath '%OUTPUT_FILE%' -Force"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo Mod zostal spakowany do pliku: %OUTPUT_FILE%
    echo Gotowy do instalacji w folderze Mods gry Vintage Story!
) else (
    echo Blad podczas pakowania moda!
)

pause