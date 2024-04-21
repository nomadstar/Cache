@echo off
setlocal EnableDelayedExpansion

REM Obtenemos el directorio del script actual
for %%I in ("%~dp0.") do set "script_dir=%%~fI"

REM Cambiamos al directorio del script
cd /d "%script_dir%" || exit /b

REM Funci�n para manejar errores
:trap
echo "Ha ocurrido un error en la l�nea !ERRORLEVEL!. Error de construcci�n de Docker. Revise los logs para m�s detalles."
exit /b 1

REM Eliminar im�genes si existen
docker image rm tusuperimagen 2>nul
docker image rm tusuperclient 2>nul

REM Construir las im�genes necesarias
docker build -t tusuperimagen -f dtbse.dockerfile .
docker build -t tusuperclient -f client.dockerfile .

REM Iniciar los contenedores
docker compose up -d
