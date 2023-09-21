-- Same query as query1.sql, but using a materialized view

--EXPLAIN VERBOSE

EXPLAIN ANALYZE
SELECT 	(NS.n_name || ', ' || NC.n_name) AS Nation,
		(RS.r_name || ', ' || RC.r_name) AS Region,	
		SUM(V.l_extendedprice*(1-V.l_discount)) AS revenue,
		DATE_PART('month', V.o_orderdate) AS monthOrder,
		DATE_PART('quarter', V.o_orderdate) AS quarterOrder,
		DATE_PART('year', V.o_orderdate) AS yearOrder,
		V.p_type AS ptype		
FROM big_mat_view AS V JOIN
	  NATION AS NS ON NS.n_nationkey=V.s_nationkey JOIN
	  NATION AS NC ON NC.n_nationkey=V.c_nationkey JOIN
	  REGION AS RS ON RS.r_regionkey=NS.n_regionkey JOIN
	  REGION AS RC ON RC.r_regionkey=NC.n_regionkey
WHERE V.p_type='ECONOMY ANODIZED TIN'  AND NS.n_name='CHINA'
GROUP BY ROLLUP(ptype),ROLLUP(Region,Nation),ROLLUP(yearOrder,quarterOrder,monthOrder);

