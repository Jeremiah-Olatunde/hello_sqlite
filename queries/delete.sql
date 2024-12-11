select 'delete';

-- delete from table_name
-- where search_condition

-- if the search_condition is omitted all rows are deleted via truncate optimisation
-- order by and limit can be used if sqlite is built from source with the
-- sqlite_enable_update_delete_limit compile time option
-- recall that the like operator can be used in conditions
