#!/bin/bash -x

PRODUCT_VERSION=photon
PRODUCT_EXE=/opt/eclipse/eclipse
WORKSPACE=${HOME}/Projects/Eclipse-projects/

mkdir -p ${WORKSPACE}; cd ${WORKSPACE}

${PRODUCT_EXE} ${WORKSPACE}

