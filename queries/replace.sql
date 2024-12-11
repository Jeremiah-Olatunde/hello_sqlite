select 'replace';

-- if a unique of primary key constraint violation occurs
-- the offending row is deleted and a new row is inserted
-- if there is a constraint violation while inserting the new row 
-- then the whole operation is aborted and the transation is rolled back

-- insert or replace into table_name (col, col, ...)
-- values (val, val, ...), (val, val, ...), ...

-- note the short form replace into table_name
