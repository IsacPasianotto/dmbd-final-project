-----------------------------INDEXES ON FOREIGN KEYS---------------------------------
CREATE INDEX typepart ON PART(p_type);                      --USED Q1

---------------------------INDEXES ON MATERIALIZED VIEW------------------------------

CREATE INDEX partview ON small_view(l_partkey);               --USED Q1       --used Q1

-- SELECT indexname, tablename FROM pg_indexes WHERE schemaname = 'public';