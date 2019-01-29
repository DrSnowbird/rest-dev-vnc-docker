#!/bin/bash

#### Swagger-based REST API Editor ####
INSTALL_DIR=${HOME}/tools
PRODUCT_VERSION=
PRODUCT_HOME=${INSTALL_DIR}/swagger-ui
PRODUCT_EXE=
PRODUCT_TAR_URL=https://github.com/DrSnowbird/json-editor/archive/master.zip

WORKSPACE=${HOME}/Projects/swagger-ui

if [ "$1" = "install" ] || [ ! -d ${PRODUCT_HOME} ] ; then
    if [ ! -s $HOME/$(basename $0).installed ]; then
        mkdir -p ${INSTALL_DIR}; cd ${INSTALL_DIR}
        git clone https://github.com/swagger-api/swagger-ui.git
        cd ${PRODUCT_HOME}
        sudo npm install node-sass -g
        npm install
    else
        echo "... Installed before already! ..."
    fi
    exit 0
fi

mkdir -p ${WORKSPACE}
cd ${PRODUCT_HOME}

nohup npm run dev 2>&1 > $HOME/logs/$(basename $0).log &

echo "Swagger UI: http://localhost:3200/"

chromium http://localhost:3200/

echo
echo ">>> ---------------------------------------------------------------------------------------"
echo ">>> If you need standalone/individual docker stack for swagger,"
echo ">>>    https://github.com/DrSnowbird/swagger-all-in-one-docker-compose."
echo ">>>    0.) Go to your host VM or OS and then open a terminal / xterm"
echo ">>>    1.) git clone https://github.com/DrSnowbird/swagger-all-in-one-docker-compose"
echo ">>>    2.) cd swagger-all-in-one-docker-compose"
echo ">>>    3.) docker-compose up -d"
echo ">>>    4.) ... It will spin up the swagger all-in-one common 7 tools for REST API development,"
echo ">>>               including Mongodb too!"
echo ">>>    5.) ... Enjoy it also if you use that full stack!"
echo ">>> ---------------------------------------------------------------------------------------"
echo

