#!/bin/bash -x

# Ref: 
# - https://github.com/DrSnowbird/rest
# - https://github.com/diegohaz/rest

if [ "$1" = "install" ]; then

    mkdir -p $HOME/samples
    cd $HOME/samples

    mkdir restful
    cd restful/
    sudo npm install -g yo generator-rest eslint
    sudo chown -R $USER:$(id -gn $USER) $HOME/.config
    exit 0
fi

echo "... use yo to generate your project."
mkdir my-rest-api
cd my-rest-api/
yo rest


