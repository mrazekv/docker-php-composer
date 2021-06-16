# This file is a template, and might need editing before it works on your project.
FROM php:7.4-cli

# Customize any core extensions here
RUN apt-get update && apt-get install -y gnupg libcurl4-openssl-dev sudo git libxslt-dev zlib1g-dev graphviz zip libmcrypt-dev libicu-dev g++ libpcre3-dev libgd-dev libfreetype6-dev sqlite curl build-essential unzip gcc make autoconf libc-dev pkg-config \
    && docker-php-ext-install gd


RUN echo "memory_limit = -1;" > $PHP_INI_DIR/conf.d/memory_limit.ini

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
