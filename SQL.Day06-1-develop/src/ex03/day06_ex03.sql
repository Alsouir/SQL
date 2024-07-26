--ex03
CREATE UNIQUE INDEX idx_person_discounts_unique
    ON person_discounts USING btree(person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYSE
    SELECT * FROM person_discounts
    ORDER BY person_id, pizzeria_id;

--DROP INDEX idx_person_discounts_unique;
