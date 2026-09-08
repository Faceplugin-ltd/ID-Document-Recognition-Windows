@echo off
setlocal
cd /d "%~dp0"

if not exist "%~dp0lib\cpu\DocumentReaderSDK.dll" goto :need_lib
if not exist "%~dp0lib\cpu\dcr-eng.dll" goto :need_lib
if not exist "%~dp0lib\cpu\dcr.fpk" goto :need_lib
goto :ready

:need_lib
echo ERROR: .\lib\cpu\ is empty.
echo.
echo Download all files from Google Drive into .\lib\cpu\:
echo   https://drive.google.com/drive/folders/1YfHUwnXO0E2NSvS_81nTNO2z3mKVO85g
echo.
echo Need:
echo   .\lib\cpu\DocumentReaderSDK.dll
echo   .\lib\cpu\dcr-eng.dll
echo   .\lib\cpu\dcr.fpk
echo.
exit /b 1

:ready

if not defined LICENSE set "LICENSE=%~dp0license.txt"
if not defined DOCSDK_PORT set "DOCSDK_PORT=8082"
if not defined PORT set "PORT=%DOCSDK_PORT%"
set "PATH=%~dp0lib\cpu;%PATH%"

echo Starting Document Reader API on port %PORT% ...
python app.py
exit /b %ERRORLEVEL%
