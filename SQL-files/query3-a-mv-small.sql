-- Same as query3.sql, but using a materialized view

--EXPLAIN VERBOSE

EXPLAIN ANALYZE
SELECT SUM(l_extendedprice*(1-l_discount)) AS revenue,
	   DATE_PART('month', o_orderdate) AS monthOrder,
	   DATE_PART('quarter', o_orderdate) AS quarterOrder,
	   DATE_PART('year', o_orderdate) AS yearOrder,
	   c_name AS custName
       FROM small_view
WHERE L.l_returnflag='R' AND CU.c_name='Customer#000001999' AND DATE_PART('quarter', O.o_orderdate) = '1'
GROUP BY ROLLUP(yearOrder,quarterOrder,monthOrder),ROLLUP(custName);
