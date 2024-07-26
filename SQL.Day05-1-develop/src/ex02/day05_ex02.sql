--ex02
CREATE INDEX idx_person_name ON person (UPPER(name)); 

SET enable_seqscan = OFF;

EXPLAIN ANALYZE 
	SELECT person.name
	FROM person
	ORDER BY UPPER(name);

