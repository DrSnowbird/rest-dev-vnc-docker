#!/bin/bash

echo "####################### Main Process: $(basename $0) ###########################"

printenv

echo ">>>> Who am i: `whoami` ; UID=`id -u` ; GID=`id -g`"

echo ">>>> Active Components / tools in folder ${COMPONENT_DIR}:"

for active in `cat ${SCRIPT_DIR}/components.list | grep -v '^#'`; do
    ${COMPONENT_DIR}/$(basename $active)
done

tail -f /dev/null
