SELECT t1.pizza_name, t1.price, pizzeria.name AS pizzeria_name
FROM
	(SELECT menu.pizza_name, menu.price, menu.pizzeria_id
	FROM menu
	WHERE id NOT IN (SELECT menu_id FROM person_order)
	) t1 INNER JOIN pizzeria ON pizzeria.id = t1.pizzeria_id
ORDER BY pizza_name, price