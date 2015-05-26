FROM quay.io/justcontainers/base:v0.7.2
MAINTAINER Gorka Lerchundi Osa <glertxundi@gmail.com>

##
## INSTALL
##

# nginx
RUN echo "deb http://nginx.org/packages/ubuntu/ precise nginx" > /etc/apt/sources.list.d/nginx.list && \
    apt-key-min adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62                   && \
    apt-get update                                                                                  && \
    apt-get-install-min nginx=1.8.0-1~precise

# confd
ADD https://github.com/glerchundi/confd/releases/download/v0.10.0-beta2/confd-0.10.0-beta2-linux-amd64 /usr/bin/confd
RUN chmod 0755 /usr/bin/confd

##
## ROOTFS
##

# root filesystem
COPY rootfs /

# s6-fdholderd active by default
RUN s6-rmrf /etc/s6/services/s6-fdholderd/down

##
## CLEANUP
##

RUN apt-cleanup
