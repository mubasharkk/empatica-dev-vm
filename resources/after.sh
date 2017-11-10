#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.


#mysql homestead < /home/vagrant/code/db-dump/data.sql
#echo "/****************************************/";
#echo "/** Importing 'homestead' database **/";
#echo "/****************************************/";

cd /home/vagrant/code/
composer install --prefer-dist
npm install
php artisan key:generate
php artisan migrate
php artisan db:seed

echo "/****************************************/";
echo "/** VisLog API migration done!!!       **/";
echo "/****************************************/";

php artisan import:download-data
echo "/****************************************/";
echo "/** Importing 'app_downloads' data     **/";
echo "/****************************************/";

npm run dev