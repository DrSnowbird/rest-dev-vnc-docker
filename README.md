
[![](https://images.microbadger.com/badges/image/openkbs/rest-dev-vnc-docker.svg)](https://microbadger.com/images/openkbs/rest-dev-vnc-docker "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/openkbs/rest-dev-vnc-docker.svg)](https://microbadger.com/images/openkbs/rest-dev-vnc-docker "Get your own version badge on microbadger.com")

# SOAP / REST API Development with common tools within VNC/noVNC-based Docker
* SOAP-UI + Swagger-Editor + Atom + Eclipse Photon + Java 8 + Maven 3 + Python 3 + npm 6 + node 11 + Gradle 5 + noVNC/VNC (as Cluster Container Desktop)

# License Agreement
By using this image, you agree the [Oracle Java JDK License](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).
This image contains [Oracle JDK 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html). You must accept the [Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html) to use this image.

# Concept - Dev Environment everywhere using VNC/noVNC Docker
The idea is to use Docker with VNC/noVNC to aggregate all the needed and related Developments tools/IDEs within a single Docker as an agile way to stand up specific collections of tools quick within a Container quick computing needs, e.g.,
* REST Development (this GIT) to cover end-to-end needs from JSON/XML, REST connection, Swagger, Mongodb, Test, etc.
* NLP/Semantic Development (coming soon)
* ... and more per your imaginations or needs in your business application domains, e.g, bio-science, finance, IoT, etc.

**The use-cases of this kind of VNC/noVNC docker container is just limited by your imaginations and your device or networking limitations. Virtually it's accessbile ubiquitously from Your favorite smartphones, tablets, e.g., iPad, SurfacePro, Amazon Fire tablet, Chrome PC, Desktop PC, etc. (Hmmm! in theory, if you can read tiny screens, you can even use your Apple iWatch to use KNIME, Eclipse Photon, IntelliJ, etc. as long as it can display HTML-5 Web Browsers!**

# REST Tools / Components
* The followings are available now for REST Development and more will be added either as default or optional under the "**./components **" (optional) and "**./components-active" (Deployed) directories.
```
./components
├── ide-eclipse.sh
├── nosql-mongodb-CentOS-7.sh
├── nosql-mongodb-Ubuntu-16.sh
├── sample-rest-api.sh
├── swagger-editor.sh
├── swagger-rest-api.sh
└── swagger-ui.sh

./components-active
├── api-workbench.sh
├── app-postman.sh
├── ide-atom.sh
├── json-editor.sh
├── mongodb-compass-gui.sh
└── soap-ui.sh

```
If needed again, you just run each needed component setup script, e.g.,
```
~/componetns/swagger-ui.sh
```

# Core Components
* Atom (default) / Eclipse Photon IDE (installable with script, ~/components/ide-eclipse.sh)
* VNC/noVNC for both browswer-based VNC and VNC-client to connect to use Desktop GUI from Docker container.
* java version "1.8.0_201"
  Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
  Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
* Apache Maven 3.6.0
* Python 3.5.2
* npm 6.5.0 + node v11.8.0 (from NodeSource official Node Distribution)
* Gradle 5.1
* Other tools: git wget unzip vim python python-setuptools python-dev python-numpy 
* noVNC/VNC (as Cluster Container Desktop)

# Note:
This project mainly adopt the [ConSol docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container) implementation.

# Run (recommended for easy-start)
It's highly recommended to change tvnc password to prevent others usign the default password to get into your container, modify the file "**./docker.env**" as below and save the filw before you hit, "./run.sh":
```
(./docker.env) file:

#### ---- VNC Password ----
VNC_PW=MySuperStrongPassword
```
* Once the above build is done, you can run now using the command below.
```
./run.sh
```
The run.sh command will auto-generate the docker run arguments as below:
```
docker run --rm -it 
    --name=rest-dev-vnc-docker 
    --restart=no 
    -e VNC_RESOLUTION=1920x1080 
    -e VNC_PW=vncpassword 
    -v /home/user1/data-docker/rest-dev-vnc-docker/.eclipse:/home/developer/.eclipse 
    -v /home/user1/data-docker/rest-dev-vnc-docker/eclipse-workspace:/home/developer/eclipse-workspace 
    -p 5901:5901 
    -p 6901:6901 
    openkbs/rest-dev-vnc-docker
```
# Run - Override VNC environment variables 
The following VNC environment variables can be overwritten at the docker run phase to customize your desktop environment inside the container. You can change those variables using configurations CLI or Web-GUI with OpenShift, Kubernetes, DC/OS, etc. For standalone deployment, e.g. using "./run.sh" (with Portainer to manage), again, you just modify "./docker-run.env" file's entries as described above.
```
VNC_COL_DEPTH, default is 24 , e.g., change to 16,
    -e VNC_COL_DEPTH=16
VNC_RESOLUTION, default: 1920x1080 , e.g., change to 1280x1024
    -e VNC_RESOLUTION=1280x1024
VNC_PW, default: vncpassword , e.g., change to MySpecial!(Password%)
    -e VNC_PW=MySpecial!(Password%)
```

# Deployment over Openshift or Kubernetes
You need to manually provide the environment variables for deployment (since run.sh automatically aggregate all the needed variables for running the PyCharm docker container to ensure the persistent information stayed with the host directories even you delete the container instances.
Here is what you need to setup in Openshift "deployment" configuration GUI or YAML template (from docker-compose.yaml file below):
```
    volumes:
      -v <Your NFS/File Directory>/data:/home/developer/data
      -v <Your NFS/File Directory>/workspace:/home/developer/workspace
      -v <Your NFS/File Directory>/data-docker/rest-dev-vnc-docker/.eclipse:/home/developer/.eclipse 
      -v <Your NFS/File Directory>/data-docker/rest-dev-vnc-docker/eclipse-workspace:/home/developer/eclipse-workspace 
      -p 5901:5901
      -p 6901:6901 
```
(Note: We will add Openshifpt / Kubernetes templates soon for your convience to deploy.)

## Connect to VNC Viewer/Client or noVNC (Browser-based VNC)
* connect via VNC viewer localhost:5901, default password: vncpassword
* connect via noVNC HTML5 full client: http://localhost:6901/vnc.html, default password: vncpassword
* connect via noVNC HTML5 lite client: http://localhost:6901/?password=vncpassword

Once it is up, the default password is "vncpassword" to access with your web browser:
```
http://<ip_address>:6901/vnc.html,
e.g.
=> Standalone Docker: http://localhost:6901/vnc.html
=> Openshift Container Platform: http://<route-from-openshift>/vnc.html
=> similarly for Kubernetes Container Platform: (similar to the Openshift above!)
```

# Use Cases - Virtual/Physical Class setup
## One-Container-for-Each-Student:
* For standalone container, you just need to spin up, say, 18 containers, one for each student VNC/noVNC, each with different host ports, 6901, 6902, .., 6918 for noNVC ports.
* For using OpenShift to create, you can just spin 18 containers and create "route" for each instances, then give each student different each route (hostname generated by OpenShift).
## One-Container-for-ALL-students to see what you do:
* Just give your container IP/Hostname/Route (from OpenShift) to all your students to login, then they will all see what you do identically. Or, your students can even take over your mouse to show you what you did wrong for your codes, equations or graphs.

# Screen (Desktop) Resolution
Two ways to change Screen resolutions.

## 1.) Modify ./docker-run.env file
```
#VNC_RESOLUTION=1280x1024
VNC_RESOLUTION=1920x1280
```

## 2.) Customize Openshift or Kubernetes container run envionrment
```
Set up, say, VNC_RESOLUTION with value 1920x1280
```

# Base the image to build add-on components

```Dockerfile
FROM openkbs/rest-dev-vnc-docker
```

# Run the image

Then, you're ready to run:
- make sure you create your work directory, e.g., ./data

```bash
mkdir ./data
docker run -d --name my-rest-dev-vnc-docker -v $PWD/data:/data -i -t openkbs/rest-dev-vnc-docker
```

# Build and Run your own image
Say, you will build the image "my/rest-dev-vnc-docker".

```bash
docker build -t my/rest-dev-vnc-docker .
```

To run your own image, say, with some-rest-dev-vnc-docker:

```bash
mkdir ./data
docker run -d --name some-rest-dev-vnc-docker -v $PWD/data:/data -i -t my/rest-dev-vnc-docker
```

## Shell or Logging into the Docker instance

```bash
./shell.sh
./logs.sh
or

docker exec -it some-rest-dev-vnc-docker /bin/bash
```


# Reference
* [RAML APIs](https://raml.org/)
* [API-Workbench for RAML](http://apiworkbench.com/docs/)
* [OpenAPI Specification (OAS)](https://en.wikipedia.org/wiki/OpenAPI_Specification)
* [OAI/OpenAPI-Specification](https://github.com/OAI/OpenAPI-Specification)
* [Swagger OpenAPI Editor, UI](https://swagger.io/)
* [SoapUI](https://www.soapui.org/)
* [VNC / NoVNC](https://github.com/novnc/noVNC)
* [ConSol docker-headless-vnc-container](https://github.com/ConSol/docker-headless-vnc-container)
* [Running GUI apps in Docker containers using VNC](http://blog.fx.lv/2017/08/running-gui-apps-in-docker-containers-using-vnc/)
* [Docker-headless-VNC-Container](https://github.com/DrSnowbird/docker-headless-vnc-container)

# See also X11 and VNC/noVNC docker-based IDE collections
* [openkbs/docker-atom-editor](https://hub.docker.com/r/openkbs/docker-atom-editor/)
* [openkbs/eclipse-oxygen-docker](https://hub.docker.com/r/openkbs/eclipse-oxygen-docker/)
* [openkbs/eclipse-phonto-vnc-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/eclipse-photon-vnc-docker)
* [openkbs/eclipse-photon-docker](https://hub.docker.com/r/openkbs/eclipse-photon-docker/)
* [openkbs/eclipse-photon-vnc-docker](https://hub.docker.com/r/openkbs/eclipse-photon-vnc-docker/)
* [openkbs/intellj-docker](https://hub.docker.com/r/openkbs/intellij-docker/)
* [openkbs/intellj-vnc-docker](https://hub.docker.com/r/openkbs/intellij-vnc-docker/)
* [openkbs/knime-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/knime-docker)
* [openkbs/knime-vnc-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/knime-vnc-docker)
* [openkbs/mysql-workbench-vnc-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/mysql-workbench-vnc-docker)
* [openkbs/netbeans10-docker](https://hub.docker.com/r/openkbs/netbeans10-docker/)
* [openkbs/netbeans](https://hub.docker.com/r/openkbs/netbeans/)
* [openkbs/papyrus-sysml-docker](https://hub.docker.com/r/openkbs/papyrus-sysml-docker/)
* [openkbs/pycharm-docker](https://hub.docker.com/r/openkbs/pycharm-docker/)
* [openkbs/pycharm-vnc-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/pycharm-vnc-docker)
* [openkbs/rapidminer-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/rapidminer-docker)
* [openkbs/scala-ide-docker](https://hub.docker.com/r/openkbs/scala-ide-docker/)
* [openkbs/sublime-docker](https://hub.docker.com/r/openkbs/sublime-docker/)
* [openkbs/webstorm-docker](https://hub.docker.com/r/openkbs/webstorm-docker/)
* [openkbs/webstorm-vnc-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/webstorm-vnc-docker)
* [openkbs/rest-dev-vnc-docker](https://cloud.docker.com/u/openkbs/repository/docker/openkbs/rest-dev-vnc-docker)

# See Also - Docker-based SQL GUI
* [Sqlectron SQL GUI at openkbs/sqlectron-docker](https://hub.docker.com/r/openkbs/sqlectron-docker/)
* [Mysql-Workbench at openkbs/mysql-workbench](https://hub.docker.com/r/openkbs/mysql-workbench/)
* [PgAdmin4 for PostgreSQL at openkbs/pgadmin-docker](https://hub.docker.com/r/openkbs/pgadmin-docker/)

# Releases information
```
developer@cf5bc1c3dd9f:~$ /usr/printVersions.sh 
+ echo JAVA_HOME=/usr/java
JAVA_HOME=/usr/java
+ java -version
java version "1.8.0_201"
Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
+ mvn --version
Apache Maven 3.6.0 (97c98ec64a1fdfee7767ce5ffb20918da4f719f3; 2018-10-24T18:41:47Z)
Maven home: /usr/apache-maven-3.6.0
Java version: 1.8.0_201, vendor: Oracle Corporation, runtime: /usr/jdk1.8.0_201/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "4.15.0-43-generic", arch: "amd64", family: "unix"
+ python -V
Python 2.7.12
+ python3 -V
Python 3.5.2
+ pip --version
pip 19.0.1 from /usr/local/lib/python3.5/dist-packages/pip (python 3.5)
+ pip3 --version
pip 19.0.1 from /usr/local/lib/python3.5/dist-packages/pip (python 3.5)
+ gradle --version

Welcome to Gradle 5.1.1!

Here are the highlights of this release:
 - Control which dependencies can be retrieved from which repositories
 - Production-ready configuration avoidance APIs

For more details see https://docs.gradle.org/5.1.1/release-notes.html


------------------------------------------------------------
Gradle 5.1.1
------------------------------------------------------------

Build time:   2019-01-10 23:05:02 UTC
Revision:     3c9abb645fb83932c44e8610642393ad62116807

Kotlin DSL:   1.1.1
Kotlin:       1.3.11
Groovy:       2.5.4
Ant:          Apache Ant(TM) version 1.9.13 compiled on July 10 2018
JVM:          1.8.0_201 (Oracle Corporation 25.201-b09)
OS:           Linux 4.15.0-43-generic amd64

+ npm -v
6.5.0
+ node -v
v11.8.0
+ cat /etc/lsb-release /etc/os-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.3 LTS"
NAME="Ubuntu"
VERSION="16.04.3 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.3 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial

```

# Known Issues
* Current releases' the VNC port 5901 is not function correctly. However, port 6901 for noVNC / HTML5 is working correctly. Hence, for now, you have to use noVNC/HTML5 web browser with port 6901 to access the container.
* Also, CentOS Dockerfile build still has some connection crash issue. We recommend to use the default build (Ubuntu version's Dockerfile - the default).
* If you are running container or Openshift or Kubernetes behind your corporate Proxy Servers, you might need to modify Dockerfile to inject the information about Proxy Servers so that the container will function properly if it needs to pull in more packages - this is beyond what this container can provide about your proxy servers information, sorry! But, I will post or add sample "Dockerfile-proxied-exmaple" to show you how to modify Dockerfile to fit your Corproate's Proxy environment for build and run the container later.
