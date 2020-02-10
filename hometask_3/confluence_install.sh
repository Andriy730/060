#!/bin/bash

dir=/vagrant/

if [ ! -e /vagrant/atlassian-confluence-7.3.1-x64.bin ]
then
	wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-7.3.1-x64.bin
        dir=""
fi

echo "app.confHome=/var/atlassian/application-data/confluence7_3_1" > "$dir"response.varfile
echo "app.install.service$Boolean=true" >> "$dir"response.varfile
echo "portChoice=custom" >> "$dir"response.varfile
echo "httpPort$Long=8080" >> "$dir"response.varfile
echo "rmiPort$Long=8001" >> "$dir"response.varfile
echo "launch.application$Boolean=true" >> "$dir"response.varfile
echo "sys.adminRights$Boolean=true" >> "$dir"response.varfile
echo "sys.confirmedUpdateInstallationString=false" >> "$dir"response.varfile
echo "sys.installationDir=/opt/atlassian/confluence7_3_1" >> "$dir"response.varfile
echo "sys.languageId=en" >> "$dir"response.varfile

chmod a+x "$dir"atlassian-confluence-7.3.1-x64.bin
"$dir"atlassian-confluence-7.3.1-x64.bin -q -varfile "$dir"response.varfile
rm "$dir"response.varfile

if [ ! -e /vagrant/5.1.48.tar.gz ]
then
	wget https://github.com/mysql/mysql-connector-j/archive/5.1.48.tar.gz
else
	cp /vagrant/5.1.48.tar.gz $( pwd )
fi

tar xvzf 5.1.48.tar.gz mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar
cp mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar /opt/atlassian/confluence7_3_1/confluence/WEB-INF/lib/
rm -r mysql-connector-java-5.1.48
