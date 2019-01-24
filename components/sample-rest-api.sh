#!/bin/bash -x

if [ ! -s $HOME/$(basename $0).installed ]; then

    mkdir -p $HOME/samples
    cd $HOME/samples

    mkdir restful
    cd restful/
    sudo npm isntall -g yo generator-rest eslint

    mkdir my-api
    cd my-api/
    yo rest
    
    touch $HOME/$(basename $0).installed
else
    echo "... Installed before already! ..."
fi

