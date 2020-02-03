#!/bin/bash
source_dir=$1
backup_dir=$2
sourse_exists=true
if [ ! -d "$source_dir" ]
then
    echo 'Source directory does not exist'
    exit 1
fi

if [ ! -d "$backup_dir" ]
then
    mkdir $backup_dir
fi

length_of_path=$(( ${#source_dir} + 1 ))
for F in $( find $source_dir -type f -mtime -1 | xargs )
do
 length=${#F}
 file_name=$( echo $F | sed -r 's|.*/||' )
 length_of_end=${#file_name}
 if [ $(( $length - $length_of_end )) -le $length_of_path ]
 then
     path=''
 else
     path=$( echo $F | cut -c "$length_of_path"-"$(( $length - $length_of_end ))" )
 fi
 if [ ! -d $backup_dir/$( date +%Y%m%d )/$path ]
 then
     mkdir -p $backup_dir/$( date +%Y%m%d )/$path
 fi
 rsync -a $F $backup_dir/$( date +%Y%m%d )/$path
done
