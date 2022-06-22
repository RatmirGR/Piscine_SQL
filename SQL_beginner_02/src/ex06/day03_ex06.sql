SELECT DISTINCT pizza_name as pizza_name, pizzeria_name_1, pizzeria_name_2, t1.price
FROM (
	SELECT DISTINCT
	pizzeria.id as id1,
	pizzeria.name as pizzeria_name_1,
	menu.pizza_name as pizza_name,
	price AS price FROM menu
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id) AS t1
	JOIN (
		SELECT
		pizzeria.id as id2,
		pizzeria.name as pizzeria_name_2,
		menu.pizza_name as pizza_name_2,
		price AS price
		FROM menu
		JOIN pizzeria ON pizzeria.id = menu.pizzeria_id)
		AS t2 ON t1.price = t2.price AND t1.pizza_name = t2.pizza_name_2
WHERE id1> id2