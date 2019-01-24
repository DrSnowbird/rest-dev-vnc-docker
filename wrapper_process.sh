#!/bin/bash

set -e

printenv

/bin/bash -c "/opt/eclipse/eclipse"

tail -f /dev/null
