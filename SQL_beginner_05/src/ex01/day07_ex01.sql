select p.name, count (visit_date) as count_of_visits
from person_visits pv
inner join person p on p.id = pv.person_id
group by p.name
order by 2 desc
limit 5;