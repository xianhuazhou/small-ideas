#!/bin/bash
mysql_data_dir='/usr/local/mysql/data';
current_dir=`pwd`;
cd $mysql_data_dir;
for database in db1 db2 db3; do
  tgz="$database"_`date +%Y-%m-%d`.tar.gz;
  echo "Backuping...$database";
  tar czf $tgz $database;
  scp $tgz backup_user@backup.machine.name:/backup/databases/;
  rm $tgz;
done
cd $current_dir;
echo "Done.";
