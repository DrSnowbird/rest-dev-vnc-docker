#!/bin/bash -x

PRODUCT_VERSION=1.34.0
PRODUCT_EXE=/usr/bin/atom
WORKSPACE=${HOME}/Projects/Atom-projects/

if [ ! -s ${PRODUCT_EXE} ]; then

    wget -c https://github.com/atom/atom/releases/download/v${PRODUCT_VERSION}/atom-amd64.deb

    sudo apt-get install -y ./atom-amd64.deb

fi

if [ "$1" = "install" ]; then
    exit 0
fi

mkdir -p ${WORKSPACE}; cd ${WORKSPACE}

${PRODUCT_EXE} ${WORKSPACE}

