#!/bin/bash

#Update CentOS with any patches
yum update -y --exclude=kernel

#Install Tools
yum install -y nano git unzip screen

#Install and configure Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /car/www/html
ln -s /vagrant /var/www/html

service httpd start

# Install PHP
yum install -y php php-cli php-common php-devel php-mysql

# Install and configure MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysql on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download Starter Content

service httpd restart


