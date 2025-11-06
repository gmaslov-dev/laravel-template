FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    zip unzip curl libpq-dev libonig-dev libzip-dev \
    && docker-php-ext-install pdo pdo_pgsql

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
