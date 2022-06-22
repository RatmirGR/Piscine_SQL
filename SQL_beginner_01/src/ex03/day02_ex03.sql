WITH my_table (missing_date)
AS (SELECT d::date AS missing_date FROM generate_series('2022-01-01', '2022-01-10', '1 day'::interval) AS d)

SELECT missing_date
FROM my_table
LEFT JOIN (SELECT visit_date FROM person_visits WHERE (person_visits.person_id = 1 OR person_visits.person_id = 2)) t2
ON t2.visit_date = missing_date
WHERE t2.visit_date IS null