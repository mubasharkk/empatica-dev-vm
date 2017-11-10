#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

cd /home/vagrant/code/
composer install --prefer-dist
npm install
php artisan key:generate
php artisan migrate
php artisan db:seed

echo "/****************************************/";
echo "/** VisLog API migration done!!!       **/";
echo "/****************************************/";

#php artisan import:download-data
mysql homestead < /home/vagrant/code/db-dump/dump-empatica-201711102148.sql
echo "/****************************************/";
echo "/** Importing 'app_downloads' data     **/";
echo "/****************************************/";

npm run dev