DROP INDEX partkeylineitem, nationkeysupplier, custkeyorders, orderkeylineitem;     -- foreign keys
DROP INDEX typepart, namecustomer;                                                  -- other indexes

-- SELECT indexname, tablename FROM pg_indexes WHERE schemaname = 'public';
