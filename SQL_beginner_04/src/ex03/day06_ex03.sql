ALTER TABLE person_discounts
ADD CONSTRAINT idx_person_discounts_unique UNIQUE (person_id, pizzeria_id);

set enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, pizzeria_id
FROM person_discounts;