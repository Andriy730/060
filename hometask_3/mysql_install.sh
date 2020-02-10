#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

MYSQL_ROOT_PASSWORD='123456'

apt-get update

echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | debconf-set-selections
apt-get -y install mysql-server mysql-client

sed -i -e 's/bind-addres/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -u root -p'123456' -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456'; FLUSH privileges;"

service mysql restart

mysql -u root -p'123456' -e'CREATE DATABASE CONFLUENCE'
