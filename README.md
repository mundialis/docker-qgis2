# Latest QGIS 2 in docker (QGIS 2.18.x)

QGIS 2.18.x from [QGIS.org](http://qgis.org)

Included: QGIS-Processing - GRASS GIS 7.4

## Installation

Available via [mundialis docker hub repo](https://hub.docker.com/r/mundialis/docker-qgis2/):
```
docker pull mundialis/docker-qgis2
```


You can download a convenient "qgis2" startup script here: [qgis2](https://raw.githubusercontent.com/mundialis/docker-qgis2/master/qgis2).
Download the file and store it either into `$HOME/bin/` or in `/usr/local/bin/` (or likewise into a directory listed in your PATH environment variable) and set the "executable" flag of the script.
Hence, be sure to make the "qgis2" script an executable:
```
chmod a+x qgis2
```

A .desktop file can be used as well for starting QGIS from a desktop environment.
Modify the paths to the qgis2 launch script and the icon inside `qgis.desktop` (must be full absolute paths!), then copy it:
```
cp qgis.desktop ~/.local/share/applications
```

## Usage

Simply run

`qgis2`

## Troubleshooting

If QGIS crashes or hangs it might leave an orphan docker process running.
If you see the process with
```
docker ps
```
Then run
```
docker stop <process id or container name>
```
Else run
```
docker ps -a
```
then
```
docker rm <process id or container name>
```

In case the launch script doesn't work properly, try adding the `-t` flag to the `docker run` command.
This will break launching from the desktop environment though.

## Acknowledgements

Software: QGIS SOURCE: [ubuntugis-unstable](https://launchpad.net/~ubuntugis)

The work of [Tim Cera](https://github.com/timcera/qgis-desktop-ubuntu) and [Michael Wess](https://github.com/wessm/Dockerfiles/tree/master/qgis2) is acknowledged. Thanks!
