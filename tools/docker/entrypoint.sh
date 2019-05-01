#!/bin/bash
set -e

sudo rm /etc/apache2/sites-enabled/*
sudo ln -fs /var/www/sites/* /etc/apache2/sites-enabled/
# Apache configuration
sudo ln -fs /etc/apache2/mods-available/ssl.load /etc/apache2/mods-enabled/
sudo a2enmod headers
sudo a2enmod expires
sudo a2enmod rewrite
sudo a2enmod ssl

sudo rm -rf /run/httpd/* /tmp/httpd* /var/logs/httpd* /var/run/apache2/apache2.pid

sudo ln -sf /dev/stdout /var/log/apache2/access.log
sudo ln -sf /dev/stderr /var/log/apache2/error.log

#check for the word not in the result of status
if !(service apache2 status | grep -q not) then
		echo "apache is running";
		sudo apachectl stop
else
    echo "apache is not running"
fi

sudo apachectl -D FOREGROUND
