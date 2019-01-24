#!/bin/bash -x

if [ ! -s /usr/bin/postman ]; then

    wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    sudo tar -xzf postman.tar.gz -C /opt
    rm postman.tar.gz
    sudo ln -s /opt/Postman/Postman /usr/bin/postman

fi

mkdir -p $HOME/logs
nohup /usr/bin/postman 2>&1 > $HOME/logs/$(basename $0).log &



