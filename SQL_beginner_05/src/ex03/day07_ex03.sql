with t1 as (
	select pz.name, pv.visit_date as count, pz.id
	from pizzeria pz
	inner join person_visits pv on pv.pizzeria_id = pz.id
	union all
	select pz.name, po.order_date as count, pz.id
	from person_order po
	inner join menu m on m.id = po.menu_id
	inner join pizzeria pz on pz.id = m.pizzeria_id
)
select name, count (count) as total_count
from t1
group by name
UNION ALL
select pizzeria.name as name, 0::bigint
FROM pizzeria
WHERE pizzeria.id NOT IN (SELECT id FROM t1)
order by total_count desc