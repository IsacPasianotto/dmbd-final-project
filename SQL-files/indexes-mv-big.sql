-----------------------------INDEXES ON FOREIGN KEYS---------------------------------
-- not used
-- CREATE INDEX partkeylineitem ON LINEITEM(l_partkey); 		
-- CREATE INDEX nationkeysupplier ON SUPPLIER(s_nationkey); 	
-- CREATE INDEX custkeyorders ON ORDERS(o_custkey);			
-- CREATE INDEX orderkeylineitem ON LINEITEM(l_orderkey);		

---------------------------INDEXES ON MATERIALIZED VIEW------------------------------
 CREATE INDEX snationview ON big_mat_view(s_nationkey);			--USED Q1       
 CREATE INDEX nameview ON big_mat_view(c_name);				    --USED Q3       
 CREATE INDEX typeview ON big_mat_view(p_type);                 --USED Q1      

-- SELECT indexname, tablename FROM pg_indexes WHERE schemaname = 'public';