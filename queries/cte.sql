select 'common table expressions';

-- get the top 5 customers by total sales
with customer_sales as (
  select 
    c.firstname || ' ' || c.lastname as fullname,
    sum(i.total) as total 
  from customers c 
  inner join invoices i 
  using(customerid) 
  group by c.customerid 
)
select fullname, total
from customer_sales
order by total desc
limit 5;
