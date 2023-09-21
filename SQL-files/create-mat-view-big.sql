CREATE MATERIALIZED VIEW big_mat_view AS
SELECT L.l_extendedprice,L.l_discount,O.o_orderdate,P.p_type,S.s_nationkey,Cu.c_nationkey,Cu.c_name,L.l_returnflag
FROM LINEITEM AS L JOIN 
	  ORDERS AS O ON L.l_orderkey=O.o_orderkey JOIN 
	  PART AS P ON P.p_partkey=L.l_partkey JOIN
	  SUPPLIER AS S ON S.s_suppkey=L.l_suppkey JOIN
	  CUSTOMER AS Cu ON Cu.c_custkey=O.o_custkey;

--DROP MATERIALIZED VIEW  matview;