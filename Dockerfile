FROM openkbs/jdk-mvn-py3-vnc

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

#### -------------------------
#### ---- user: developer ----
#### -------------------------
ENV USER=${USER:-developer}
ENV HOME=/home/${USER}

##################################
#### ---- Components: ----    ####
##################################
COPY wrapper_process.sh /

##################################
####     ---- VNC: ----       ####
##################################
USER ${USER}
WORKDIR ${HOME}
COPY components ${HOME}/components
RUN sudo chown -R ${USER}:${USER} ${HOME}/components && chmod +x ${HOME}/components/*.sh 
RUN cd components ; ./app-postman.sh install
RUN cd components ; ./ide-atom.sh install
RUN cd components ; ./soap-ui.sh install
RUN cd components ; ./json-editor.sh install
RUN cd components ; ./mongodb-compass-gui.sh install
RUN cd components ; ./nosql-mongodb-Ubuntu-16.sh install
# RUN cd components ; ./swagger-editor.sh install

RUN sudo chown -R $USER:$USER $HOME/.config

WORKDIR ${HOME}

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]

CMD ["/wrapper_process.sh"]

