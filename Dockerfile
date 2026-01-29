ARG PHP_VERSION=8.2
ARG NODE_VERSION=24.13.0

FROM node:${NODE_VERSION}-alpine AS node
FROM composer/composer:latest-bin AS composer

FROM php:${PHP_VERSION}-alpine

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

COPY --from=composer /composer /usr/bin/composer
ENV PATH="/root/.composer/vendor/bin:${PATH}"

RUN apk add --no-cache \
    bash \
    git \
    libpng-dev \
    zlib-dev \
    oniguruma-dev \
    autoconf \
    g++ \
    make

RUN docker-php-ext-install pcntl

RUN composer global require laravel/installer
