CREATE INDEX partkeylineitem ON LINEITEM(l_partkey); 		--USED Q1
CREATE INDEX nationkeysupplier ON SUPPLIER(s_nationkey); 	--USED Q1
CREATE INDEX custkeyorders ON ORDERS(o_custkey);			--USED Q3
CREATE INDEX orderkeylineitem ON LINEITEM(l_orderkey);		--USED Q3

--DROP INDEX partkeylineitem, nationkeysupplier, custkeyorders, orderkeylineitem;