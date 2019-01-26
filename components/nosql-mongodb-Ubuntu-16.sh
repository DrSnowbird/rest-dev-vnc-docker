#!/bin/bash -x

MONGODB_VERSION=4.0
PRODUCT_EXE=/usr/bin/mongod

if [ ! -s ${PRODUCT_EXE} ]; then

    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/${MONGODB_VERSION} multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-${MONGODB_VERSION}.list

    sudo apt-get update

    sudo apt-get install -y mongodb-org

    #echo "mongodb-org hold" | sudo dpkg --set-selections
    #echo "mongodb-org-server hold" | sudo dpkg --set-selections
    #echo "mongodb-org-shell hold" | sudo dpkg --set-selections
    #echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
    #echo "mongodb-org-tools hold" | sudo dpkg --set-selections
    
fi

if [ "$1" = "install" ]; then
    exit 0
fi

#### Prepare to start Mongodb ####
MONGODB_DIR=$HOME/mongodb
mkdir -p $HOME/mongodb

RUN=${1:1}
if [ ${RUN} -gt 0 ]; then
    mkdir -p $HOME/logs
    nohup mongod --dbpath ${MONGODB_DIR} 2>&1 > $HOME/logs/$(basename $0).log &
fi

## not work inside Docker Container: Use the above steps
#sudo service mongod start
#sudo service mongod enabled
