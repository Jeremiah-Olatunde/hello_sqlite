select 'exists operator';

select exists (select artistid from artists where artistid = 1000); -- no rows returns false

select exists (select null); -- null rows are still rows therefore returns true

-- get all the customers with at least one invoice 
-- consider the time complexity of this query
-- for each row in the customer table the subquery runs make this O(n)
-- compare against the time complexity of solving the same problem with joins
-- note: every customer has an invoice so not the best example
select 
  firstname || ' ' || lastname as fullname
from 
  customers c
where 
  exists (select * from invoices i where c.customerid = i.customerid)
order by 
  fullname;

-- this probably has a time complexity of O(n) right?
select 
  c.customerid,
  c.firstname || ' ' || c.lastname as fullname
from
  customers c 
where
  c.customerid in (select distinct i.customerid from invoices i);

-- using join
-- note each customer might have more than one invoice hence the use of distinct
-- this only keeps the first invoice encountered which is fine because
-- we don't care about the invoices just that there are at least one
-- since we are joining using the customerid key which is sorted in the database
-- so we can assume that a hash join will take place meaning an O(n + m) complexity maybe
select distinct
  customerid,
  firstname,
  lastname
from
  customers
left join
  invoices
using(customerid)
where
  invoiceid is not null;


select artistid from artists where not exists (select * from albums where artists.artistid = albums.artistid);

select artistid from artists where artists.artistid not in (select distinct artistid from albums);

select at.artistid from artists at left join albums al using(artistid) where al.albumid is null; 
