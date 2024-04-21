#!/bin/bash
cd "$(dirname "$0")" || exit
set -e
#borra todo en caso de que haya algo, ideal para borrar errores por redundancia de imagenes
trap 'echo "Ha ocurrido un error en la línea $LINENO. Error de construcción de Docker. Revise los logs para más detalles."' ERR
if [ "$(docker image ls -q tusuperimagen)" ]; then
    docker image rm tusuperimagen
fi
if [ "$(docker image ls -q tusuperclient)" ]; then
    docker image rm tusuperclient
fi
#crea imagenes necesarias para el docker compose
docker build -t tusuperimagen -f dtbse.dockerfile .
docker build -t tusuperclient -f client.dockerfile .
#se explica solo
docker compose up -d


