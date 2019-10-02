#!/bin/bash
WORK_PATH = '/usr/projects/vue-back'
cd $WORK_PATH
echo 'clean old code'
git reset --hard origin/master
git clean -f
echo 'pull lastest code'
git pull origin master
echo 'start build'
docker build -t vue-back:1.0 .
echo 'stop old image and remove'
docker stop vue-back-container
docker rm vue-back-container
echo 'start new container'
docker container run -p 3000:3000 --name vue-back-container -d vue-back:1.0