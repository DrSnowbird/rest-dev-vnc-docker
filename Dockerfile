FROM openkbs/eclipse-photon-vnc-docker

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
#### ---- VNC: ----           ####
##################################
USER ${USER}
WORKDIR ${HOME}
COPY components ${HOME}/components
RUN sudo chown -R ${USER}:${USER} ${HOME}/components && chmod +x ${HOME}/components/*.sh

ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]

CMD ["/wrapper_process.sh"]

