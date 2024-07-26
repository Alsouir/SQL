--ex05
COMMENT ON TABLE person_discounts IS 'This table stores discount information for persons associated with pizzerias';
COMMENT ON COLUMN person_discounts.person_id IS 'The ID of the person receiving the discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'The ID of the pizzeria providing the discount';
COMMENT ON COLUMN person_discounts.discount IS 'The percentage discount offered to the person by the pizzeria';

