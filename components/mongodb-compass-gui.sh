#!/bin/bash -x

#### --------------------------
#### ---- Install Product ----:
#### --------------------------
PRODUCT=${PRODUCT:-"compass"}
PRODUCT_VERSION=${PRODUCT_VERSION:-1.16.3}
PRODUCT_DIR=${PRODUCT_DIR}
PRODUCT_EXE=${PRODUCT_EXE:-mongodb-compass}

# https://downloads.mongodb.com/compass/mongodb-compass-community_1.16.3_amd64.deb
PRODUCT_URL=https://downloads.mongodb.com/${PRODUCT}/mongodb-${PRODUCT}_${PRODUCT_VERSION}_amd64.deb
#sudo wget https://downloads.mongodb.com/compass/mongodb-compass-community_1.16.3_amd64.deb
sudo wget --no-check-certificate ${PRODUCT_URL}
#wget wget https://downloads.mongodb.com/compass/mongodb-compass-community_1.16.3_amd64.deb

sudo apt-get update -y && \
    sudo apt-get install -y libsecret-1-0 libgconf-2-4 libnss3 && \
    sudo dpkg -i $(basename ${PRODUCT_URL});

#### ---- Plugin for Compass ---- ####
#wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash && \
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash 

export NVM_DIR="$HOME/.nvm" && \
sudo chown -R ${USER}:${USER} ${HOME} && \
chmod +x .nvm/nvm.sh && $NVM_DIR/nvm.sh && \
#nvm install stable && \
#npm install -g khaos && \
mkdir -p ${HOME}/.mongodb/${PRODUCT}-community/plugins

#cd ${HOME}/.mongodb/${PRODUCT}-community/plugins && khaos create mongodb-js/compass-plugin ./${USER}-plugin && \
#cd ${HOME}/.mongo/compass/plugins

#
#    # [ -s "$NVM_DIR/nvm.sh" ] && \
#    /bin/bash -c "$NVM_DIR/nvm.sh" 
#    # This loads nvm

mkdir -p $HOME/logs
nohup /usr/bin/${PRODUCT_EXE} 2>&1 > $HOME/logs/$(basename $0).log &


