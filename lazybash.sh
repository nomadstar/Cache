#!/bin/bash
cd "$(dirname "$0")" || exit
#borra todo en caso de que haya algo, ideal para borrar errores por redundancia de imagenes
#crea imagenes necesarias para el docker compose

docker build -t tusuperimagen -f dtbse.dockerfile .

#se explica solo
docker compose up -d


