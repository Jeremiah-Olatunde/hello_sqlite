-- COLLECTION OF SQL QUERIES


-- SELECT STATEMENT

select 1 + 1;

select 'the very pulse of the machine', 10 * 10;

select firstname, lastname, city from employees;

select * from employees;

-- ORDER BY CLAUSE

-- NOTE:  ASC is default
select name, milliseconds from tracks order by milliseconds limit 10;

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
select name, composer from tracks order by composer limit 10;

-- cutomize this behaviour with the nulls first or nulls last option
select name, composer from tracks order by composer nulls first limit 10;
select name, composer from tracks order by composer nulls last limit 10;

-- SELECT DISTINCT
-- null is not comparable to itself yet when using select distinct null is considered a duplicate

select city from customers; -- returns 59 rows containing duplicate cities
select distinct city from customers; -- returns 53 rows

select count(distinct city) from customers; -- 53
select distinct(count city) from customers; -- 59

select distinct city, country from customers; -- get unique city country combinations

-- how to count unique combinations? passing into count() function does not work
-- perhaps using a subquery

select count(*) from (select distinct city, country from customers);

-- WHERE CLAUSE
select * from tracks where name = 'Tears Dry On Their Own';
select albumid, name from tracks where albumid in (2, 3, 10);
select name from tracks where name like 'z%';
select albumid, name from tracks where albumid between 10 and 20;


-- AND OPERATOR 
select 1 and null; -- null (commutative)
select 0 and null; -- false (commutative)
select null and null; -- null

-- OR OPERATOR
select 1 or null; -- true (commutative)
select 0 or null; -- null (commutative)
select null or null; -- null

-- OFFSET & LIMIT

-- select the second longest track
select name, milliseconds from tracks order by milliseconds desc limit 1 offset 1;

-- select the third shortest track
select name, milliseconds from tracks order by milliseconds asc limit 1 offset 2;

