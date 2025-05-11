@echo off
setlocal enabledelayedexpansion

rem Sprawdz czy istnieje plik modinfo.json
if not exist "modinfo.json" (
    echo Blad: Nie znaleziono pliku modinfo.json
    pause
    exit /b 1
)

rem Pobierz dane z modinfo.json
for /f "tokens=1,* delims=:" %%a in ('type modinfo.json ^| findstr /c:"\"modid\"" /c:"\"version\"" /c:"\"name\""') do (
    set line=%%b
    set line=!line:"=!
    set line=!line:,=!
    set line=!line: =!
    
    echo %%a | findstr "modid" >nul
    if !errorlevel! equ 0 set MOD_NAME=!line!
    
    echo %%a | findstr "version" >nul
    if !errorlevel! equ 0 set VERSION=!line!
    
    echo %%a | findstr "name" >nul
    if !errorlevel! equ 0 set DISPLAY_NAME=!line!
)

set OUTPUT_FILE=%MOD_NAME%-v%VERSION%.zip

echo Znaleziono mod: %DISPLAY_NAME% [%MOD_NAME%] v%VERSION%

echo Pakowanie moda %MOD_NAME% v%VERSION%...

rem Sprawdz czy 7-Zip jest zainstalowany
where 7z >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Blad: 7-Zip nie jest zainstalowany lub nie jest w PATH
    echo Pobierz 7-Zip z: https://www.7-zip.org/
    pause
    exit /b 1
)

rem Usun stary plik ZIP jesli istnieje
if exist "%OUTPUT_FILE%" del "%OUTPUT_FILE%"

rem Spakuj pliki
7z a -tzip "%OUTPUT_FILE%" modinfo.json modicon.png assets\

echo.
echo Mod zostal spakowany do pliku: %OUTPUT_FILE%
echo Gotowy do instalacji w folderze Mods gry Vintage Story!
pause