#!/bin/bash
FILE=versions.txt
if [ ! -f $FILE ]
then
    wget http://yoko.ukrtux.com:8899/versions.txt
fi
echo $(sort $FILE | uniq -c | sort | tail -1)
