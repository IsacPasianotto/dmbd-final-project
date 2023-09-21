--EXPLAIN VERBOSE

EXPLAIN ANALYZE
SELECT SUM(L.l_extendedprice*(1-L.l_discount)) AS revenue,
	   DATE_PART('month', O.o_orderdate) AS monthOrder,
	   DATE_PART('quarter', O.o_orderdate) AS quarterOrder,
	   DATE_PART('year', O.o_orderdate) AS yearOrder,
	   CU.c_name AS custName
FROM LINEITEM AS L JOIN
	 ORDERS AS O ON L.l_orderkey=O.o_orderkey JOIN
	 CUSTOMER AS CU ON CU.c_custkey=O.o_custkey
WHERE L.l_returnflag='R' AND CU.c_name='Customer#000074236' AND DATE_PART('quarter', O.o_orderdate) = '2'
GROUP BY ROLLUP(yearOrder,quarterOrder,monthOrder),ROLLUP(custName);
