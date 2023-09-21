--EXPLAIN VERBOSE

EXPLAIN ANALYZE
SELECT 	(NS.n_name || ', ' || NC.n_name) AS Nation,
	(RS.r_name || ', ' || RC.r_name) AS Region,	
	SUM(L.l_extendedprice*(1-L.l_discount)) AS revenue,
	DATE_PART('month', O.o_orderdate) AS monthOrder,
	DATE_PART('quarter', O.o_orderdate) AS quarterOrder,
	DATE_PART('year', O.o_orderdate) AS yearOrder,
	P.p_type AS ptype		
FROM LINEITEM AS L JOIN 
	ORDERS AS O ON L.l_orderkey=O.o_orderkey JOIN 
	PART AS P ON P.p_partkey=L.l_partkey JOIN 
	SUPPLIER AS S ON S.s_suppkey=L.l_suppkey JOIN
	CUSTOMER AS Cu ON Cu.c_custkey=O.o_custkey JOIN
	NATION AS NS ON NS.n_nationkey=S.s_nationkey JOIN
	NATION AS NC ON NC.n_nationkey=Cu.c_nationkey JOIN
	REGION AS RS ON RS.r_regionkey=NS.n_regionkey JOIN
	REGION AS RC ON RC.r_regionkey=NC.n_regionkey	
WHERE P.p_type='PROMO BURNISHED TIN' AND NS.n_name='CANADA'
GROUP BY ROLLUP(ptype),ROLLUP(Region,Nation),ROLLUP(yearOrder,quarterOrder,monthOrder);