#!/bin/bash
DIR=$(dirname `realpath $0`)
PP=9
NAME=virtualmin
echo $DIR
docker volume create $NAME_data
docker network create guillenet
docker build -t esaenz7/$NAME:latest .
docker run -dit \
  -v $DIR/hosting-etc:/etc \
  -v $DIR/hosting-home:/home \
  -v $DIR/hosting-lib:/var/lib \
  -v $DIR/hosting-log:/var/log \
  -v $DIR/hosting-www:/var/www \
  -p $PP20:20 -p $PP21:21 -p $PP2222:22 -p $PP25:25 -p $PP53:53 -p $PP53:53/udp -p $PP80:80 \
  -p $PP110:110 -p $PP111:111 -p $PP143:143 -p $PP443:443 -p $PP587:587 -p $PP993:993 \
  -p $PP995:995 -p $PP3306:3306 -p $PP10000:10000 -p $PP20000:20000 -p $PP38532:38532 \
  --restart=unless-stopped \
  --privileged \
  --hostname=$NAME \
  --net=guillenet \
  --name $NAME \
  esaenz7/$NAME:latest
