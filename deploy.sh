#! /bin/sh
docker rmi -f $(docker images -f "dangling=true" -q)
docker build . -t testimage
docker run -d -p 8000:8000 --name testimage testimage
