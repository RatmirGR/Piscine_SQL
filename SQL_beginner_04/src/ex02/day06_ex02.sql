SELECT
	pr.name,
	m.pizza_name,
	m.price,
	ROUND (m.price - m.price * discount / 100) AS discount_price
FROM person pr
INNER JOIN person_order po ON po.person_id = pr.id
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN person_discounts pd ON pd.person_id = po.person_id and pd.pizzeria_id = m.pizzeria_id
ORDER BY 1, 2;