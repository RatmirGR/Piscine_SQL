CREATE VIEW v_price_with_discount AS
SELECT
	person.name,
	menu.pizza_name,
	menu.price,
	round(menu.price / 100 * 90, 0) AS price_with_discount
FROM person_order
JOIN person ON person.id = person_id
JOIN menu ON menu.id = menu_id
ORDER BY 1, 2