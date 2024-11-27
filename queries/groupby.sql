select 'group by sql';

-- list out the albums and the number of tracks per album
select albumid, count(trackid) as c from tracks group by albumid order by c desc;

-- same as above but joining with albums table to get the album title as well
-- note: grouping first and then joining on the result
select 
  albumid, 
  c, 
  albums.title 
from 
  (select albumid, count(trackid) as c from tracks group by albumid order by c desc)
inner join 
  albums
using(albumid);

-- joining tracks and albums first then grouping the result

-- note: for every track there is 1 album in the albums table (when joining on albumid)
select count(*) from tracks; -- 3503
select count(*) from tracks inner join albums using(albumid); -- 3503

-- we have the tracks table but each row has the corresponding row from the albums table
select albums.title as album_title, tracks.name as track_name from tracks inner join albums using(albumid) limit 40;

-- group above by albumid
select 
  albums.albumid as id,
  albums.title as album_title,
  count(*) as no_tracks
from 
  tracks 
inner join albums using(albumid) 
group by albumid
having 20 < no_tracks
order by no_tracks desc;

-- get all the albums with more than 20 tracks, and show the total time of the album
-- join the tracks and the album tables together to get the album title (this increases the time complexity)
-- group the result by the album id
-- use sum to sum the milliseconds in each group
-- use count to count the number of each group
select 
  albums.albumid as id,
  albums.title as album_title,
  count(*) as no_tracks,
  sum(milliseconds)
from 
  tracks 
inner join albums using(albumid) 
group by albumid
having 20 < no_tracks
order by no_tracks desc;

-- joining on more than two tables
select 
  t.name, 
  g.name, 
  m.name 
from 
  tracks t 
inner join 
  genres g, media_types m 
on 
  t.mediatypeid = m.mediatypeid and t.genreid and g.genreid;

-- group by multiple colums
select 
  g.name, 
  m.name,
  count(*) 
from 
  tracks t 
inner join 
  genres g, media_types m 
on 
  t.mediatypeid = m.mediatypeid and t.genreid and g.genreid
group by 
  t.mediatypeid, t.genreid;

-- todo: group by year
