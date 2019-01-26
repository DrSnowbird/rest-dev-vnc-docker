#!/bin/bash

INSTALL_DIR=${HOME}/tools
PRODUCT_VERSION=
PRODUCT_HOME=${INSTALL_DIR}/json-editor
PRODUCT_EXE=
PRODUCT_TAR_URL=https://github.com/DrSnowbird/json-editor/archive/master.zip

WORKSPACE=${HOME}/Projects/Json-Editor-projects/

if [ "$1" = "install" ]; then
    if [ ! -s $HOME/$(basename $0).installed ]; then
        mkdir -p ${INSTALL_DIR}; cd ${INSTALL_DIR}
        wget -c ${PRODUCT_TAR_URL}
        unzip master.zip; mv ${PRODUCT_HOME}-master ${PRODUCT_HOME}
        #git clone https://github.com/DrSnowbird/json-editor.git
        cd ${PRODUCT_HOME}
        npm install
    else
        echo "... Installed before already! ..."
    fi
    exit 0
fi

mkdir -p ${WORKSPACE}
cd ${PRODUCT_HOME}

nohup npm start 2>&1 > $HOME/logs/$(basename $0).log &

