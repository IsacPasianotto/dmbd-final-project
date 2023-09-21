#!/bin/bash 

tpchdir=./TPC-H-V3.0.1/dbgen
prjdir=$(pwd)
size=10
sqldir=SQL-files

source ./credentials.sh

cd $tpchdir
make -f makefile.suite 
printf "\n\nGenerating the random data for the database ...\nThis could take a while\n"
./dbgen -v -s $size

cd $prjdir/$sqldir

printf "\n\n Creating a database with name $dbname with the user $dbuser\n"
createdb -h localhost -p 5432 -U $dbuser $dbname
printf "\nImporting the data into the database ...\nThis could take a while\n"
psql -U$dbuser -d $dbname -a -f init_database.sql > /dev/null

cd $prjdir
