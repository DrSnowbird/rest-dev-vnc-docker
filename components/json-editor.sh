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
        git clone https://github.com/DrSnowbird/json-editor.git
        cd ${PRODUCT_HOME}
        npm install
    else
        echo "... Installed before already! ..."
    fi
    exit 0
fi

mkdir -p ${WORKSPACE}
cd ${PRODUCT_HOME}

nohup /usr/bin/firefox ${PRODUCT_HOME}/docs/demo.html 2>&1 > $HOME/logs/$(basename $0).log &

