#!/bin/bash -x

PRODUCT_EXE=/usr/bin/postman
if [ ! -s ${PRODUCT_EXE} ]; then

    wget -c https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    sudo tar -xzf postman.tar.gz -C /opt
    rm postman.tar.gz
    sudo ln -s /opt/Postman/Postman ${PRODUCT_EXE}

    #### Unity desktop for Postman Launcher ####
    mkdir -p ~/.local/share/applications/
    cat > ~/.local/share/applications/postman.desktop <<-EOL
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOL

else

    echo "... Installed before already! ..."

fi

if [ "$1" = "install" ]; then
    exit 0
fi

mkdir -p $HOME/logs
nohup ${PRODUCT_EXE} 2>&1 > $HOME/logs/$(basename $0).log &

