with t2 as
 (select pizzeria.id  from menu
     left join pizzeria on menu.pizzeria_id = pizzeria.id
  where menu.price < 800 and pizzeria.name not in
     (SELECT DISTINCT piz_name FROM
         (SELECT pizzeria.name as piz_name, pizzeria_id as piz_id
         FROM person_visits
         LEFT JOIN person ON person.id = person_id
         LEFT JOIN pizzeria ON pizzeria.id = pizzeria_id
         WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08') AS t1
     LEFT JOIN menu ON menu.pizzeria_id = t1.piz_id
     WHERE menu.price < 800)
     limit 1
 )
 insert into person_visits (id, person_id, pizzeria_id, visit_date)
 select (select (count(*) + 1) from person_visits) as id,
     (select person.id from person where name = 'Dmitriy') as person_id,
     (select * from t2),
     '2022-01-08' as visit_date;
 refresh materialized view mv_dmitriy_visits_and_eats


 CREATE TABLE routes (
	node1 VARCHAR NOT null,
	node2 VARCHAR NOT null,
	cost INTEGER NOT null
)

INSERT INTO routes
VALUES
	('A', 'B', 10), ('B', 'A', 10), ('A', 'C', 15), ('C', 'A', 15),
	('A', 'D', 20), ('D', 'A', 20), ('D', 'B', 25), ('B', 'D', 25),
	('D', 'C', 30), ('C', 'D', 30), ('C', 'B', 35), ('B', 'C', 35)

select * from routes


 - в задании ex00 - таблица неровная

Примечание: Практически во всех заданиях есть следующие строки:
- The SQL script looks like below
 select *
 from ....
Нет описания того, для чего нужен этот код, смысл непонятен с первого раза и строка (- The SQL script looks like below) вводит в заблуждение