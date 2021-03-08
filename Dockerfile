FROM php:5.6.40-fpm
RUN apt update \
    && apt install net-tools \    
    && docker-php-ext-install mysql \
    && docker-php-ext-install mysqli
