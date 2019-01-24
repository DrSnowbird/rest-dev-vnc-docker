#!/bin/bash -x

#### Swagger-based REST API / NPM ####
# Ref: https://www.npmjs.com/package/swagger


if [ ! -s $HOME/$(basename $0).installed ]; then
    sudo npm install -g swagger
    sudo install -g swagger-editor-dist
else
    echo "... Installed before already! ..."
fi

mkdir -p $HOME/swagger-projects
cd $HOME/swagger-projects
swagger project create hello-world

echo "... Once it is done ..."
echo "    You will see:"
echo "     Success! You may start your new app by running: ..."
echo ">> Run: "
echo "      swagger project start hello-world"


