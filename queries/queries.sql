-- COLLECTION OF SQL QUERIES


-- SELECT STATEMENT

select 1 + 1;

select 'the very pulse of the machine', 10 * 10;

select firstname, lastname, city from employees;

select * from employees;

-- ORDER BY CLAUSE

-- NOTE:  ASC is default
-- select name, milliseconds from tracks order by milliseconds; 

-- order by column not in select list
-- result is sorted first before the limit is applied
select name, composer from tracks order by milliseconds desc limit 35;

-- sort by multiple columns
select name, albumid, milliseconds from tracks order by albumid desc, milliseconds asc limit 10;

-- order by column position in select list
select name, milliseconds from tracks order by 2 limit 52;

select 25 = 25;
select 'hello' = 'hello';

-- null is not comparable to any other value
-- all comparisons with null return null
select null = null;

-- by default null is considered less than all other values
select name, composer from tracks order by composer;

-- cutomize this behaviour with the nulls first or nulls last option
select name, composer from tracks order by composer nulls first;
select name, composer from tracks order by composer nulls last;
