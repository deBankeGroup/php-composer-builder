FROM php:7.1.8-alpine
ARG PROJECT
ARG DESCRIPTION
ARG MAINTAINER
ARG URL
ARG DATE
ARG COMMIT
LABEL "org.label-schema.name"=$PROJECT
LABEL "org.label-schema.build-date"=$DATE
LABEL "org.label-schema.maintainer"=$MAINTAINER
LABEL "org.label-schema.description"=$DESCRIPTION
LABEL "org.label-schema.vcs-url"=$URL
LABEL "org.label-schema.commit-sha"=$COMMIT

WORKDIR /opt
COPY install-composer.sh install-composer.sh

ENV BUILD_PACKAGES bash curl-dev build-base libffi-dev ca-certificates openssl git openssh
RUN apk add --no-cache $BUILD_PACKAGES    &&\
    update-ca-certificates                &&\
    addgroup -S composer                  &&\
    adduser -S -g composer composer       &&\
    chmod +x install-composer.sh          &&\
    ./install-composer.sh

USER composer
WORKDIR /project
