select distinct p.address, t1.name, t1.count_of_order
from
	(select pz.name, count (order_date) as count_of_order
	from menu m
	inner join pizzeria pz on pz.id = m.pizzeria_id
	inner join person_order po on po.menu_id = m.id
	group by pz.name
) t1
inner join person p on p.id > 0
order by address, name