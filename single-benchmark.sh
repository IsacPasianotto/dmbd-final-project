#!/bin/bash

# Example of usage: bash single-benchmark.sh no-optimization 1 query1.sql

fout=$1
q=$2 
qfile=$3
outdir=./measurements
sqldir=./SQL-files
niter=75

source ./credentials.sh

echo "Running the query $q with the options: $fout"
echo "Query n. $q with the options: $fout \n" > $outdir/q$q-$fout.txt

for i in $(seq 1 $niter)
do
    printf "iteration number $i:\n"  >> $outdir/q$q-$fout.txt
    { { time psql  -U $dbuser -d $dbname -a -f $sqldir/$qfile >/dev/null ; } 2>> $outdir/q$q-$fout.txt ; }
    printf '\n' >>  $outdir/q$q-$fout.txt
done

python3 from-txt-to-csv.py $outdir/q$q-$fout.txt $outdir/q$q-$fout.csv

echo "Done"
