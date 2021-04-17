FROM php:fpm

RUN apt update \
    && apt install net-tools -y \
    && apt install iproute2 -y \
    && docker-php-ext-install mysqli \
    && curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/5.3.3.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext \
    && mv phpredis-5.3.3 /usr/src/php/ext/redis \
    && docker-php-ext-install redis
    
CMD ["php-fpm"]
EXPOSE 9000
