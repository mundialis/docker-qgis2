FROM ubuntu:xenial

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

# Dockerfile inspired by
#   https://github.com/timcera/qgis-desktop-ubuntu
#   https://github.com/wessm/Dockerfiles/tree/master/qgis2

LABEL maintainer="Markus Neteler <neteler@mundialis.de>"

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends apt-utils sudo && \
    apt-get install -y --no-install-recommends nano wget software-properties-common python-software-properties

RUN echo "deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main" >> /etc/apt/sources.list
RUN echo "deb-src http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu xenial main " >> /etc/apt/sources.list

# Key for qgis ubuntugis
RUN    apt-key adv --keyserver keyserver.ubuntu.com --recv-key CAEB3DC3BDF7FB45
RUN    apt-key adv --keyserver keyserver.ubuntu.com --recv-key 089EBE08314DF160

RUN    apt-get -y update                                                  \
    && apt-get -y install --no-install-recommends                         \
                                                  python-requests         \
                                                  python-numpy            \
                                                  python-pandas           \
                                                  python-scipy            \
                                                  python-matplotlib       \
                                                  python-pyside.qtwebkit  \
                                                  gdal-bin                \
                                                  qgis                    \
                                                  python-qgis             \
                                                  qgis-provider-grass     \
                                                  grass                   \
                                                  firefox ca-certificates \
    && apt-get clean                                                      \
    && apt-get purge                                                      \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV QGIS_DEBUG 5
ENV QGIS_LOG_FILE /proc/self/fd/1
ENV PGSERVICEFILE /project/pg_service.conf
ENV QGIS_PROJECT_FILE /project/project.qgs

# Called when the Docker image is started in the container

ADD launch_prep.sh /launch_prep.sh
RUN sudo chmod +x /launch_prep.sh
CMD ["/launch_prep.sh"]


