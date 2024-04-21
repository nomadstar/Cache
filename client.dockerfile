FROM node:latest

WORKDIR /app

COPY client/ .

RUN apt-get update && apt-get -y upgrade && npm install


