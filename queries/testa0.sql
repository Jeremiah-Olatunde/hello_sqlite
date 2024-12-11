select 'testa0';

with artists_none as (
	select artistid, name from artists where artistid not in (select distinct artistid from albums)
)
select 
	artistid, name, albumid
from artists_none
left join albums using(artistid);
