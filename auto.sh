#!/bin/bash

version=1.0

docker rm -f nerds_gulp
docker rm -f nerds_nginx

docker rmi nerds_gulp:$version nerds_nginx:$version

# docker volume create nerds_volume

docker build -t nerds_gulp:$version gulp

docker run \
      --name nerds_gulp \
      nerds_gulp:$version

docker build -t nerds_nginx:$version nginx

docker run \
      -d \
      --name nerds_nginx \
      --rm \
      -p 8008:80 \
      --volumes-from nerds_gulp \
      nerds_nginx:$version