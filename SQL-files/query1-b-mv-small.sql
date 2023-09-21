-- Same as query1.sql, but using a materialized view

--EXPLAIN VERBOSE

EXPLAIN ANALYZE
SELECT (NS.n_name || ', ' || NC.n_name) AS Nation,
        (RS.r_name || ', ' || RC.r_name) AS Region,
        SUM(V.l_extendedprice*(1-V.l_discount)) AS revenue,
        DATE_PART('month', V.o_orderdate) AS monthOrder,
        DATE_PART('quarter', V.o_orderdate) AS quarterOrder,
        DATE_PART('year', V.o_orderdate) AS yearOrder,
        P.p_type AS ptype
FROM small_view AS V JOIN
        NATION AS NS ON NS.n_nationkey=V.c_nationkey JOIN
        NATION AS NC ON NC.n_nationkey=V.c_nationkey JOIN
        REGION AS RS ON RS.r_regionkey=NS.n_regionkey JOIN
        REGION AS RC ON RC.r_regionkey=NC.n_regionkey JOIN
        SUPPLIER AS S ON S.s_suppkey=V.l_suppkey JOIN
        PART AS P ON P.p_partkey=V.l_partkey
    WHERE P.p_type='PROMO BURNISHED TIN' AND NS.n_name='CANADA'
GROUP BY ROLLUP(ptype),ROLLUP(Region,Nation),ROLLUP(yearOrder,quarterOrder,monthOrder);

