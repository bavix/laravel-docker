#!/bin/bash
cd /var/www/html
mysql -hmysql mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}"
chmod 777 ./storage/app
chmod 777 -R ./storage/framework/cache
chmod 777 -R ./storage/framework/sessions
chmod 777 -R ./storage/framework/testing
chmod 777 -R ./storage/framework/views
chmod 777 -R ./storage/logs
chmod 777 ./bootstrap/cache
chmod a+x ./artisan
composer install
./artisan key:generate
./artisan storage:link
