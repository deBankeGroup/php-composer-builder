FROM php:7.1.8-alpine
LABEL org.label-schema.name "php-composer-builder"
LABEL org.label-schema.description "PHP Composer Container for CI Build Environments"
LABEL org.label-schema.maintainer "Dan Webb"
LABEL org.label-schema.vcs-url "https://github.com/damacus/php-composer-builder"
ARG date
LABEL org.label-schema.build-date=$date

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN wget -O /etc/apk/keys/php-alpine.rsa.pub http://php.codecasts.rocks/php-alpine.rsa.pub && \
    echo "@php http://php.codecasts.rocks/v3.6/php-7.1" >> /etc/apk/repositories && \
    apk add --no-cache php7-soap@php

WORKDIR /opt
COPY install-composer.sh install-composer.sh
RUN apk update - &&\
    apk add --no-cache ca-certificates &&\
		update-ca-certificates &&\
    apk add --no-cache openssl &&\
    chmod +x install-composer.sh 
RUN ./install-composer.sh

WORKDIR /src
