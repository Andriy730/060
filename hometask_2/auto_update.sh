#!/bin/bash

sudo crontab -l > mycron
cat mycron | grep SHELL || echo "SHELL=/bin/bash" >> mycron
cat mycron | grep PATH || echo "PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin" >> mycron
echo '@weekly log_file=/var/log/update-$( date +\%Y\%m\%d ).log && apt-get -y update > $log_file && apt-get -y dist-upgrade >> $log_file' >> mycron
sudo crontab mycron
rm mycron
