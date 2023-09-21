-- note: for the order in which the sql scripts are executed in the bash script "benchmark-all.sh",
--       before creating the small_view, we need first to get rid of the big_mat_view, if it exists.


DROP MATERIALIZED VIEW big_mat_view;

CREATE MATERIALIZED VIEW small_view AS
SELECT L.l_extendedprice,L.l_discount,O.o_orderdate, Cu.c_nationkey,Cu.c_name,L.l_returnflag, L.l_suppkey, L.l_partkey
FROM LINEITEM AS L JOIN
     ORDERS AS O ON L.l_orderkey=O.o_orderkey JOIN
     CUSTOMER AS Cu ON Cu.c_custkey=O.o_custkey;

-- DROP MATERIALIZED VIEW small_view;