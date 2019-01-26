#!/bin/bash -x

#### --------------------------
#### ---- Install Product ----:
#### --------------------------
PRODUCT=compass
PRODUCT_VERSION=1.16.3
PRODUCT_EXE=/usr/bin/mongodb-compass

WORKSPACE=${HOME}/Projects/Mongodb-Compass-projects

if [ ! -s ${PRODUCT_EXE} ]; then

    # https://downloads.mongodb.com/compass/mongodb-compass-community_1.16.3_amd64.deb
    PRODUCT_URL=https://downloads.mongodb.com/${PRODUCT}/mongodb-${PRODUCT}_${PRODUCT_VERSION}_amd64.deb
    #sudo wget https://downloads.mongodb.com/compass/mongodb-compass-community_1.16.3_amd64.deb
    cd $HOME
    wget -c --no-check-certificate ${PRODUCT_URL}

    sudo apt-get update -y 
    sudo apt-get install -y libsecret-1-0 libgconf-2-4 libnss3 
    sudo dpkg -i $(basename ${PRODUCT_URL});

    #### ---- Plugin for Compass ---- ####
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash 

    export NVM_DIR="$HOME/.nvm" 
    sudo chown -R ${USER}:${USER} ${HOME}/.nvmd 
    chmod +x .nvm/nvm.sh && $NVM_DIR/nvm.sh 
    #nvm install stable && \
    #npm install -g khaos && \
    mkdir -p ${HOME}/.mongodb/${PRODUCT}-community/plugins

    #cd ${HOME}/.mongodb/${PRODUCT}-community/plugins && khaos create mongodb-js/compass-plugin ./${USER}-plugin && \
    #cd ${HOME}/.mongo/compass/plugins

    #
    # This loads nvm
    # [ -s "$NVM_DIR/nvm.sh" ] && /bin/bash -c "$NVM_DIR/nvm.sh" 
    
fi

if [ "$1" = "install" ]; then
    exit 0
fi

mkdir -p $HOME/logs
mkdir -p ${WORKSPACE}; cd ${WORKSPACE}

nohup ${PRODUCT_EXE} 2>&1 > $HOME/logs/$(basename $0).log &


