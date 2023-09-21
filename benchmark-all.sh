#!/bin/bash

sqldir=./SQL-files

source ./credentials.sh

# No optimization 
qnumber=1
optimization=no-optimization-case:a
bash single-benchmark.sh $optimization $qnumber query$qnumber-a.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-a.sql
qnumber=1
optimization=no-optimization-case:b
bash single-benchmark.sh $optimization $qnumber query$qnumber-b.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-b.sql
qnumber=1
optimization=no-optimization-case:c
bash single-benchmark.sh $optimization $qnumber query$qnumber-c.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-c.sql


# Create indexes on foreign keys attributes
psql -U $dbuser -d $dbname -a -f $sqldir/indexes-foreign.sql > /dev/null
qnumber=1
optimization=indexes-foreign-case:a
bash single-benchmark.sh $optimization $qnumber query$qnumber-a.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-a.sql
qnumber=1
optimization=indexes-foreign-case:b
bash single-benchmark.sh $optimization $qnumber query$qnumber-b.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-b.sql
qnumber=1
optimization=indexes-foreign-case:c
bash single-benchmark.sh $optimization $qnumber query$qnumber-c.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-c.sql


# Create indexes on other useful attributes
psql -U $dbuser -d $dbname -a -f $sqldir/indexes-other.sql > /dev/null
qnumber=1
optimization=indexes-other-case:a
bash single-benchmark.sh $optimization $qnumber query$qnumber-a.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-a.sql
qnumber=1
optimization=indexes-other-case:b
bash single-benchmark.sh $optimization $qnumber query$qnumber-b.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-b.sql
qnumber=1
optimization=indexes-other-case:c
bash single-benchmark.sh $optimization $qnumber query$qnumber-c.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-c.sql


# Drop the indexes to focus on the optimization with the materialized views
psql -U $dbuser -d $dbname -a -f $sqldir/drop-indexes.sql > /dev/null
psql -U $dbuser -d $dbname -a -f $sqldir/create-mat-view-big.sql > /dev/null
qnumber=1
optimization=mat-view-big-no-indexes-case:a
bash single-benchmark.sh $optimization $qnumber query$qnumber-a-mv-big.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-a-mv-big.sql
qnumber=1
optimization=mat-view-big-no-indexes-case:b
bash single-benchmark.sh $optimization $qnumber query$qnumber-b-mv-big.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-b-mv-big.sql
qnumber=1
optimization=mat-view-big-no-indexes-case:c
bash single-benchmark.sh $optimization $qnumber query$qnumber-c-mv-big.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-c-mv-big.sql


# Add the indexes on the materialized views
psql -U $dbuser -d $dbname -a -f $sqldir/indexes-mv-big.sql > /dev/null
qnumber=1
optimization=mat-view-big-indexes-case:a
bash single-benchmark.sh $optimization $qnumber query$qnumber-a-mv-big.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-a-mv-big.sql
qnumber=1
optimization=mat-view-big-indexes-case:b
bash single-benchmark.sh $optimization $qnumber query$qnumber-b-mv-big.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-b-mv-big.sql
qnumber=1
optimization=mat-view-big-indexes-case:c
bash single-benchmark.sh $optimization $qnumber query$qnumber-c-mv-big.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-c-mv-big.sql


# Drop the previous view and use the small one 
psql -U $dbuser -d $dbname -a -f $sqldir/drop-indexes.sql > /dev/null
psql -U $dbuser -d $dbname -a -f $sqldir/create-mat-view-small.sql > /dev/null
qnumber=1
optimization=mat-view-small-no-indexes-case:a
bash single-benchmark.sh $optimization $qnumber query$qnumber-a-mv-small.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-a-mv-small.sql
qnumber=1
optimization=mat-view-small-no-indexes-case:b
bash single-benchmark.sh $optimization $qnumber query$qnumber-b-mv-small.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-b-mv-small.sql
qnumber=1
optimization=mat-view-small-no-indexes-case:c
bash single-benchmark.sh $optimization $qnumber query$qnumber-c-mv-small.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-c-mv-small.sql


# Add the indexes on the small materialized view
psql -U $dbuser -d $dbname -a -f $sqldir/indexes-mv-small.sql > /dev/null
qnumber=1
optimization=mat-view-small-indexes-case:a
bash single-benchmark.sh $optimization $qnumber query$qnumber-a-mv-small.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-a-mv-small.sql
qnumber=1
optimization=mat-view-small-indexes-case:b
bash single-benchmark.sh $optimization $qnumber query$qnumber-b-mv-small.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-b-mv-small.sql
qnumber=1
optimization=mat-view-small-indexes-case:c
bash single-benchmark.sh $optimization $qnumber query$qnumber-c-mv-small.sql
qnumber=3
bash single-benchmark.sh $optimization $qnumber query$qnumber-c-mv-small.sql

echo "Done!"