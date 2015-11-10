FROM quay.io/justcontainers/base-alpine:v0.10.0
MAINTAINER Gorka Lerchundi Osa <glertxundi@gmail.com>

##
## INSTALL
##

# nginx
RUN apk-install ca-certificates nginx=1.8.0-r1

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
