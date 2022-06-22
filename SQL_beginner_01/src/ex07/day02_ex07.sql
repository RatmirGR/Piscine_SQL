SELECT DISTINCT t1.name FROM
(
	SELECT person_visits.pizzeria_id, pizzeria.name FROM person_visits
	LEFT JOIN person ON person.id = person_visits.person_id
	LEFT JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
	WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08'
) AS t1 LEFT JOIN menu ON menu.pizzeria_id = t1.pizzeria_id
WHERE menu.price < 800
