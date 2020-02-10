#!/bin/bash

if [ ! -e atlassian-confluence-7.3.1-x64.bin ]
then
	wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-7.3.1-x64.bin
fi

echo "app.confHome=/var/atlassian/application-data/confluence7_3_1" > response.varfile
echo "app.install.service$Boolean=true" >> response.varfile
echo "portChoice=custom" >> response.varfile
echo "httpPort$Long=8080" >> response.varfile
echo "rmiPort$Long=8001" >> response.varfile
echo "launch.application$Boolean=true" >> response.varfile
echo "sys.adminRights$Boolean=true" >> response.varfile
echo "sys.confirmedUpdateInstallationString=false" >> response.varfile
echo "sys.installationDir=/opt/atlassian/confluence7_3_1" >> response.varfile
echo "sys.languageId=en" >> response.varfile

chmod a+x atlassian-confluence-7.3.1-x64.bin
./atlassian-confluence-7.3.1-x64.bin -q -varfile response.varfile
rm response.varfile

if [ ! -e 5.1.48.tar.gz ]
then
	wget https://github.com/mysql/mysql-connector-j/archive/5.1.48.tar.gz
fi

tar xvzf 5.1.48.tar.gz mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar
cp mysql-connector-java-5.1.48/mysql-connector-java-5.1.48-bin.jar /opt/atlassian/confluence7_3_1/confluence/WEB-INF/lib/
rm -r mysql-connector-java-5.1.48
