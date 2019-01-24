#!/bin/bash -x

if [ ! -s $HOME/$(basename $0).installed ]; then

    wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
    sudo apt-get update
    # You can now install Atom using apt-get (or apt on Ubuntu):
    ## Opt-A) Install Atom
    #sudo apt-get install-y  atom
    ## Opt-B) Install Atom Beta
    sudo apt-get install -y atom-beta
    PRODUCT_EXE=/usr/bin/atom-beta
    sudo ln -s ${PRODUCT_EXE} /usr/bin/atom
    mkdir -p $HOME/logs
    nohup /usr/bin/${PRODUCT_EXE} 2>&1 > $HOME/logs/$(basename $0).log
else
    echo "... Installed before already! ..."
fi


