#! /bin/sh
docker rmi -f $(docker images -f "dangling=true" -q)
docker-compose down
docker-compose rm -f
docker-compose build
docker-compose up --build -d
