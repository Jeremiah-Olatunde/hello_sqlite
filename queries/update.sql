select 'update';

-- syntax
-- update table_name
-- set 
-- 	col = val,
-- 	col = val,
-- 	col = val
-- where
-- 	search_condition
-- order by col_or_exp
-- limit count offset n;

-- if where clause is skipped all rows are updated
-- a negative limit it equivalent to no limit
-- order by and limit are only available if built from source
-- similar to the select clause the values are available via the column name
-- use existing row value to comute new row value
