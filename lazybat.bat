@echo off
setlocal EnableDelayedExpansion

SET _INTERPOLATION_0=
FOR /f "delims=" %%a in ('dirname "$0"') DO (SET "_INTERPOLATION_0=!_INTERPOLATION_0! %%a")
cd "!_INTERPOLATION_0:~1!" || exit
trap "echo "Ha ocurrido un error en la línea $LINENO. Error de construcción de Docker. Revise los logs para más detalles."" "ERR"
IF SET _INTERPOLATION_1=
FOR /f "delims=" %%a in ('docker image ls -q tusuperimagen') DO (SET "_INTERPOLATION_1=!_INTERPOLATION_1! %%a")
[ "!_INTERPOLATION_1:~1!" (
  docker "image" "rm" "tusuperimagen"
)
IF SET _INTERPOLATION_2=
FOR /f "delims=" %%a in ('docker image ls -q tusuperclient') DO (SET "_INTERPOLATION_2=!_INTERPOLATION_2! %%a")
[ "!_INTERPOLATION_2:~1!" (
  docker "image" "rm" "tusuperclient"
)
docker "build" "-t" "tusuperimagen" "-f" "dtbse.dockerfile" "."
docker "build" "-t" "tusuperclient" "-f" "client.dockerfile" "."
docker "compose" "up" "-d"