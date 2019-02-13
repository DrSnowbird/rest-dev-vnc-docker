#!/bin/bash

echo "####################### Install Components: $(basename $0) ###########################"

printenv

echo ">>>> Who am i: `whoami` ; UID=`id -u` ; GID=`id -g`"

echo ">>>> Install Components / tools in folder ${COMPONENT_DIR}:"

for active in `cat ${SCRIPT_DIR}/components.list | grep -v '^#'`; do
    ${COMPONENT_DIR}/$(basename $active) install
done


