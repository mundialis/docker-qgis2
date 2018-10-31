# qgis2

QGIS 2.18.x from [QGIS.org](http://qgis.org)

```
USER_NAME=`basename $HOME`
xhost +
docker run --rm --name qgis2 \
    -it \
    -v ${HOME}:/home/${USER_NAME} \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=unix$DISPLAY \
    -e HHHOME=${HOME} \
    mundialis/docker-qgis2
xhost -
```
