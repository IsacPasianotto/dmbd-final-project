#!/bin/bash

tpchdir=./TPC-H-V3.0.1/dbgen
prjdir=$(pwd)
mesdir=$prjdir/measurements
source ./credentials.sh

cd $tpchdir
make -f makefile.suite clean

cd $prjdir/measurements
# the only file we want to keep is "mergeall.py" and "data.csv"
rm q*

cd $prjdir

dropdb -f $dbname
