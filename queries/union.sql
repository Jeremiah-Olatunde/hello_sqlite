select 'hello union';

select 'hello' union select 'world';
select 'hello' union select 'hello'; -- eliminates duplicates
select 'hello' union all select 'hello'; -- keep duplicate rows

select firstname || ' ' || lastname as fullname, 'customer' as type from customers
union
select firstname || ' ' || lastname as fullname, 'employee' as type from employees
order by fullname;

