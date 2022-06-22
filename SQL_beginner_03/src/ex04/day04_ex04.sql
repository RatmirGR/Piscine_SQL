CREATE VIEW v_symmetric_union AS
SELECT (date1.id - date2.id) AS person_id FROM
(SELECT person_id as id
 	FROM person_visits
 	WHERE visit_date = '2022-01-02') as date1,
(SELECT person_id as id
 	FROM person_visits
 	WHERE visit_date = '2022-01-06') as date2
UNION
SELECT date2.id - date1.id FROM
(SELECT person_id as id
 	FROM person_visits
 	WHERE visit_date = '2022-01-02') as date1,
(SELECT person_id as id
 	FROM person_visits
 	WHERE visit_date = '2022-01-06') as date2
ORDER BY 1