#!/bin/bash

set -e

printenv

/bin/bash -c "${HOME}/components/app-postman.sh"
/bin/bash -c "${HOME}/components/ide-atom.sh"
/bin/bash -c "${HOME}/components/json-editor.sh"
/bin/bash -c "${HOME}/components/soap-ui.sh"
#/bin/bash -c "${HOME}/components/swagger-editor.sh"
#/bin/bash -c "${HOME}/components/swagger-ui.sh"
/bin/bash -c "${HOME}/components/mongodb-compass-gui.sh"

#/bin/bash -c "${HOME}/components/ide-eclipse.sh"
#/bin/bash -c "/opt/eclipse/eclipse"

tail -f /dev/null
