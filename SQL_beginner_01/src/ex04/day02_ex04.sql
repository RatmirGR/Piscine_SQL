SELECT pizza_name, name as pizzeria_name, price
FROM menu
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY pizza_name, pizzeria_name