# qgis2

QGIS 2.18.x from [QGIS.org](http://qgis.org)

INSTALLATION:

Via [docker hub](https://hub.docker.com/r/mundialis/docker-qgis2/):
```
docker pull mundialis/docker-qgis2
```

USAGE:
```
# Startup of QGIS2 in docker, see below for download of this script
#
# get user name
USER_NAME=`basename $HOME`

# MYHOME is used to pass the HOME directory of the user running qgis
# and is used in "launch_prep.sh" to create the same user within the container.

# The user home is mounted as HOME
# --rm will remove the container as soon as it ends

sudo docker run --rm --name qgis2 \
    -it \
    -v ${HOME}:/home/${USER_NAME} \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -e MYHOME=${HOME} \
    mundialis/docker-qgis2
```

Note: You can download above docker startup as a convenient start script:
[qgis2](https://raw.githubusercontent.com/mundialis/docker-qgis2/master/qgis2).
Download it, store it into $HOME/bin/ or /usr/local/bin/ (or likewise) and
set the script to "executable".

QGIS SOURCE: ubuntugis-unstable
