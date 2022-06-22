WITH t1 AS (
	SELECT pizzeria.name, person.gender FROM person_order
	JOIN menu ON menu.id = person_order.menu_id
	JOIN person ON person.id = person_order.person_id
	JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
 )

SELECT DISTINCT t1.name AS pizzeria_name
FROM t1
WHERE gender = 'male' AND name NOT IN (SELECT name FROM t1 WHERE gender = 'female')
UNION ALL
SELECT DISTINCT t1.name
FROM t1
WHERE gender = 'female' AND name NOT IN (SELECT name FROM t1 WHERE gender = 'male')
ORDER BY pizzeria_name