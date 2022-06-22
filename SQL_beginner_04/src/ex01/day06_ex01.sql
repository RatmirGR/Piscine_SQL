INSERT INTO person_discounts
SELECT ROW_NUMBER( ) OVER ( ) AS id, person.id, pizzeria.id,
CASE
    WHEN COUNT (*) = 1 THEN 10.5
    WHEN COUNT (*) = 2 THEN 22
    ELSE 30
END AS discount
FROM person_order
INNER JOIN person ON person.id = person_order.person_id
INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY 2, 3;