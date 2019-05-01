FROM ubuntu:16.04

# Packages install
USER root

RUN apt-get update
RUN apt-get -y install software-properties-common python-software-properties 
RUN apt-get install -y language-pack-en-base
RUN LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

RUN apt-get update

RUN apt-get -y install git mysql-client vim
RUN apt-get -y install default-jre curl wget
RUN apt-get -y install apache2
RUN apt-get -y install git-core sudo

RUN apt-get -y install php7.0 php7.0-cli php7.0-common libapache2-mod-php7.0 php7.0-mysql php7.0-fpm php7.0-curl php7.0-gd php7.0-bz2 php7.0-mcrypt php7.0-json php7.0-tidy php7.0-mbstring php-redis php-memcached 

RUN apt install -y zip unzip php7.0-zip php7.0-xml 
RUN apt-get -y install php7.0-sqlite3

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Composer Install
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


# Create new user
RUN useradd -u 1000 -m developer
RUN usermod -a -G www-data developer
RUN echo 'developer ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN echo 'Defaults !requiretty' >> /etc/sudoers

USER developer
ENV USER developer
ENV TERM xterm

CMD ["apachectl"]
