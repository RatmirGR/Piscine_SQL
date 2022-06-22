WITH t1 AS (
	SELECT pizzeria.name, person.gender FROM person_visits
	JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
)

SELECT DISTINCT t1.name AS pizzeria_name
FROM t1 WHERE gender = 'male'
UNION ALL
SELECT DISTINCT t1.name
FROM t1 WHERE gender = 'female'
ORDER BY pizzeria_name