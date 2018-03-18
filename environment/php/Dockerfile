FROM php:7.1-fpm

# php install
RUN apt-get update && apt-get install -y libmcrypt-dev \
   mysql-client libmagickwand-dev --no-install-recommends \
   && pecl install imagick \
   && docker-php-ext-enable imagick \
   && docker-php-ext-install mcrypt pdo_mysql zip

# startup
WORKDIR /var/www/html

COPY ./docker-entrypoint /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint / && chmod +x /docker-entrypoint

COPY ./startup.sh /usr/local/bin/startup
RUN ln -s /usr/local/bin/startup / && chmod +x /startup

# composer
RUN curl -s -f -L -o /tmp/installer.php 'https://getcomposer.org/installer' \
    && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer

ENTRYPOINT ["docker-entrypoint"]
CMD ["php-fpm"]
