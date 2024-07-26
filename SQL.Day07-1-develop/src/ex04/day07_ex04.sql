--ex04
SELECT name,
	count_of_visits
FROM (SELECT person.name,
		COUNT(*) AS count_of_visits
	FROM person_visits 
	JOIN person ON person.id = person_visits.PERSON_ID
	GROUP BY person.name) AS PV
WHERE count_of_visits > 3
