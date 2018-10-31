# qgis2

QGIS 2.18.x from [QGIS.org](http://qgis.org)

```
# Should be platform neutral - at least working on Linux and Windows
USER_NAME=`basename $HOME`

# MYHOME is used to pass the HOME directory of the user running qgis
# and is used in "start.sh" to create the same user within the container.

# Users home is mounted as home
# --rm will remove the container as soon as it ends


sudo docker run --rm --name qgis2 \
    -it \
    -v ${HOME}:/home/${USER_NAME} \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -e MYHOME=${HOME} \
    mundialis/docker-qgis2
```
