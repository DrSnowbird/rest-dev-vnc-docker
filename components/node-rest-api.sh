#!/bin/bash -x

if [ ! -s $HOME/$(basename $0).installed ]; then
    npm install -g swagger
    
else
    echo "... Installed before already! ..."
fi



