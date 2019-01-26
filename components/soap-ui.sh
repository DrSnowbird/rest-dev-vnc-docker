#!/bin/bash -x

INSTALL_DIR=${HOME}/tools
PRODUCT_VERSION=5.4.0
PRODUCT_HOME=${INSTALL_DIR}/SoapUI-${PRODUCT_VERSION}
PRODUCT_EXE=${PRODUCT_HOME}/bin/soapui.sh
PRODUCT_TAR_URL=https://s3.amazonaws.com/downloads.eviware/soapuios/${PRODUCT_VERSION}/SoapUI-${PRODUCT_VERSION}-linux-bin.tar.gz

WORKSPACE=${HOME}/Projects/SoapUI-projects/

if [ ! -s ${PRODUCT_EXE} ]; then

    mkdir -p ${INSTALL_DIR}; cd ${INSTALL_DIR}
    # https://s3.amazonaws.com/downloads.eviware/soapuios/5.4.0/SoapUI-5.4.0-linux-bin.tar.gz
    wget -c ${PRODUCT_TAR_URL}
    tar xvf $(basename ${PRODUCT_TAR_URL})
    
fi

if [ "$1" = "install" ]; then
    exit 0
fi

export SOAPUI_HOME=${PRODUCT_HOME}

mkdir -p $HOME/logs
mkdir -p ${WORKSPACE}; cd ${WORKSPACE}

nohup ${PRODUCT_EXE} 2>&1 > $HOME/logs/$(basename $0).log &
