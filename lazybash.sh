#!/bin/bash
cd "$(dirname "$0")" || exit
docker image rm tusuperimagen
docker build -t tusuperimagen -f dtbse.dockerfile .
docker image rm tusuperclient
docker build -t tusuperclient -f client.dockerfile .
docker compose up -d


