
-- get all tracks on an album via the albums name
-- the tracks table only stores the albumid not the name

select 
  trackid, name 
from 
  tracks 
where 
  albumid = (
    select albumid 
    from albums 
    where title = 'Let There Be Rock'
  );

-- same result as above using join instead of a subquery
-- subquery is probably more performant? investigate that further
select t.trackid, t.name from tracks t inner join albums a using(albumid) where a.title = 'Let There Be Rock';

-- get all artist without any albums
-- note: the subquery here returns multiple rows which are then searched with the in operator

select count(artistid) from artists where artistid not in (select distinct artistid from albums);

-- same as above but with a left join
select count(at.artistid) from artists at left join albums al using(artistid) where al.title is null;

-- get the average length of all the albums
select avg(album_length) from (select sum(milliseconds) as album_length from tracks);
