select pz.name, count (order_date), round (avg (m.price), 2), max (m.price), min (m.price)
from pizzeria pz
inner join menu m on m.pizzeria_id = pz.id
inner join person_order po on po.menu_id = m.id
group by pz.name
order by pz.name