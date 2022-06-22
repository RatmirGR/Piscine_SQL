SELECT COALESCE(person.name, '-') AS person_name, visit_date, COALESCE(t2.name, '-') AS pizzeria_name
FROM (
	SELECT t1.person_id, t1.visit_date, t1.pizzeria_id, pizzeria.name
	FROM (
		SELECT person_id, visit_date, pizzeria_id FROM person_visits
		WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
	AS t1 FULL JOIN pizzeria ON t1.pizzeria_id = pizzeria.id)
	AS t2 FULL JOIN person ON t2.person_id = person.id
ORDER BY person_name, visit_date, pizzeria_name