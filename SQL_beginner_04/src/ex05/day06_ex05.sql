COMMENT ON TABLE person_discounts IS 'эта таблица хранит в себе внешние ключи и скидки, что позволяет ей взаимодействовать с другими таблицами, а точнее с таблицами person и pizzeria, и устанавливать, в зависимости от условий, скидки';
COMMENT ON COLUMN person_discounts.id IS 'этот атрибут является уникальным ключом';
COMMENT ON COLUMN person_discounts.person_id IS 'этот атрибут является внешним ключом, позволяющим работать с таблицами person, person_order, person_visits';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'этот атрибут является внешним ключом, позволяющим работать с таблицами pizzeria, menu, person_visits';
COMMENT ON COLUMN person_discounts.discount IS 'этот атрибут хранит скидку, которая позволяет использовать его при работе с другими таблицами';