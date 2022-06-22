(select pz.name, count (visit_date) as count, 'visit' as action_type
from pizzeria pz
inner join person_visits pv on pv.pizzeria_id = pz.id
group by (pz.name)
order by 2 desc
limit 3)
union all
(select pz.name, count (order_date) as count, 'order' as action_type
from person_order po
inner join menu m on m.id = po.menu_id
inner join pizzeria pz on pz.id = m.pizzeria_id
group by (pz.name)
order by 2 desc
limit 3)
order by 3 asc, 2 desc