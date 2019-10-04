#!/bin/bash
WORK_PATH='/usr/projects/vue-front-test'
cd $WORK_PATH
echo 'clean old code'
git reset --hard origin/master
git clean -f
echo 'pull lastest code'
git pull origin master
npm run build
echo 'start build'
docker build -t vue-front:1.0 .
echo 'stop and remove old container'
docker stop vue-front-container
docker rm vue-front-container
echo 'start new  container'
docker container run -p 8000:8000 --name vue-front-container -d vue-front:1.0