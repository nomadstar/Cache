@echo off
cd /d "%~dp0" || exit /b
setlocal enabledelayedexpansion
REM borra todo en caso de que haya algo, ideal para borrar errores por redundancia de imagenes
set "error_message=Ha ocurrido un error en la línea %~LINENO%. Error de construcción de Docker. Revise los logs para más detalles."
if exist tusuperimagen (
    docker image rm tusuperimagen
)
if exist tusuperclient (
    docker image rm tusuperclient
)
REM crea imagenes necesarias para el docker compose
docker build -t tusuperimagen -f dtbse.dockerfile .
docker build -t tusuperclient -f client.dockerfile .
REM se explica solo
docker compose up -d
