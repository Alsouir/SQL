--ex10

WITH inform_person1 AS (
    SELECT id, name, address FROM person
    ORDER BY address, name
),
inform_person2 AS (
    SELECT id, name, address FROM person
    ORDER BY address, name
)
SELECT inform_person1.name AS person_name1, 
		inform_person2.name AS person_name2, 
		inform_person1.address AS common_address 
FROM inform_person2
INNER JOIN inform_person1
	ON inform_person1.id > inform_person2.id 
	AND inform_person1.address = inform_person2.address
ORDER BY person_name1, person_name2, common_address;


