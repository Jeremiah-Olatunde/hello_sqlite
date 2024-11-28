select 'case expressions';

with random_int as (
  select abs(random()) % 2 as x
)
select
  case x
    when 1 then 'on'
    when 0 then 'off'
  else 'invalid state' -- returns null instead of 'invalid state' if else is omitted
  end as state
from random_int;

-- assign risk level to customers based on how much money they've spent on the platform
with customer_totals as (select customerid, sum(total) as total from invoices group by customerid)
select 
  customerid,
  total,
  case
    when total < 30 then 'risk_high'
    when total < 40 then 'risk_medium'
    else 'risk_low'
  end
from customer_totals;
