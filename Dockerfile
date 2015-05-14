FROM quay.io/justcontainers/base:v0.7.0
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
ADD https://github.com/glerchundi/confd/releases/download/v0.10.0-beta1/confd-0.10.0-beta1-linux-amd64 /usr/bin/confd
RUN chmod 0755 /usr/bin/confd

##
## ROOTFS
##

COPY rootfs /
RUN s6-rmrf /etc/s6/services/s6-fdholderd/down

##
## CLEANUP
##

RUN apt-cleanup
