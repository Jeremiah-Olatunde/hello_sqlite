select 'upsert';

-- given a row to insert
-- if the column in the new row conflicts with a column on an existing row
-- then the offending row is updated using the update clause specified
-- an update condition can be specified with the where clause
-- to specify which rows in the table should be updated
-- the values of the offending row are available in the update clause 
-- through the excluded keyword

-- insert into table_name (col_list)
-- values (value_list)
-- on conflict (col_name)
-- do
-- 	update set
-- 		col = val,
-- 		col = val,
-- where conflict_condition


-- note: 
-- nothing can be specified after the do keyword
-- this does nothing if there is a conflict 
-- but the new row gets inserted if there isn't one


-- this is equivalent to regular insert
-- the artistid column is unique and autogenerated
-- so excluding it from the column list means sql generates an autoincremented value
-- which will never conflict
insert into artists (name)
values ('testing upsert')
on conflict (artistid)
do nothing