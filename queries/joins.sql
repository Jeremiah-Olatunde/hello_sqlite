select 'hello joins';

select count(*) from artist; -- 275
select count(*) from albums; -- 347

-- get all artist with no albums in database
-- select artistid, name from artists where artistid not in (select artistid from albums);

-- show album titles along side names of artists

-- INNER JOIN
-- select count(*) from artist inner join albums on true; -- 275 * 347
-- select count(*) from artist inner join albums on false; -- 0

-- for each album iterate through entire artists table until the matching artistid is found
-- for each album there is only on matching artist in the artits table
-- select title, name from albums inner join artists on albums.artistid = artists.artistid;

-- for each artist iterate through all albums until a matching album is found
-- for each artist there are 0 to many matching albums
-- select title, name from artists inner join albums on albums.artistid = artists.artistid;

-- if column names are identical use using syntax
-- select title, name from artists inner join albums using(artistid);

-- LEFT JOIN
-- left join returns all rows from the left table and the matching rows from the right table
-- if there are no matching rows null is returned for the right table data
-- select count(*) from artist left join albums on true; -- 275 * 347
-- select name, title from artist left join albums on true; -- | name | title |

-- select count(*) from artist left join albums on false; -- 275 
-- select name, title from artist left join albums on false; -- | name | null |

select count(*) from albums; -- 347

-- get number of artists without an album
select count(*) from artists where artistid not in (select artistid from albums); -- 71

select count(*) from artists left join albums using(artistid); -- 418 (347 + 71)

-- there exist an artist for every album data from right table will never be null
select count(*) from albums left join artists using(artistid); -- 347

-- note: sum result of count and group by query
select sum(x) from (select count(*) as x from albums group by artistid);

select count(*) from albums left join albums using(albumid); -- 347

select count(*) from albums left join albums using(artistid); -- 1493
select sum(x * x) from (select count(*) as x from albums group by artistid); -- 1493


-- CROSS JOIN
select count(*) from artists cross join media_types; -- 275 * 5

-- note: string concatenation
select 'hello' || ' ' || 'world';
select firstname || ' ' || lastname as fullname from employees order by length(fullname);

-- get all employees and the names of the employees they report too
-- note that there is no row for the manager in the output 
select 
  x.firstname || ' ' || x.lastname as subordinate,
  y.firstname || ' ' || y.lastname as superior 
from 
  employees x
inner join 
  employees y
on
  x.reportsto = y.employeeid;

-- using a left join results in the manager who reports to no one being included in the 
-- output. a null is in the superior column
select 
  x.firstname || ' ' || x.lastname as subordinate,
  y.firstname || ' ' || y.lastname as superior 
from 
  employees x
left join 
  employees y
on
  x.reportsto = y.employeeid;

-- when the join clause is false for all rowr

-- left join all data derived from columns in the right table are null
-- all rows from the left table are included
-- result row count: 8
select
  e.firstname || ' ' || e.lastname as ename,
  c.firstname || ' ' || c.lastname as cname
from
  employees e
left join 
  customers c
on
  ename = cname;

-- similar case but mirrored for right join
-- result row count: 59
select
  e.firstname || ' ' || e.lastname as ename,
  c.firstname || ' ' || c.lastname as cname
from
  employees e
right join 
  customers c
on
  ename = cname;

-- full outer join includes all rows from both tables
-- result row count: 59 + 8 = 67
select
  e.firstname || ' ' || e.lastname as ename,
  c.firstname || ' ' || c.lastname as cname
from
  employees e
full outer join 
  customers c
on
  ename = cname;


