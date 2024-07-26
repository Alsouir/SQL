--ex06
CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date
(
 IN pperson varchar DEFAULT 'Dmitriy',
 IN pprice numeric DEFAULT 500,
 IN pdate date DEFAULT '2022-01-08')
RETURNS TABLE (
        pizzeria_name varchar
) AS $$
        (SELECT DISTINCT pizzeria.name FROM person_visits 
            JOIN person on person.id = person_visits .person_id
            JOIN pizzeria on pizzeria.id = person_visits .pizzeria_id
            JOIN menu on menu.pizzeria_id=pizzeria.id
        WHERE person.name = pperson AND person_visits .visit_date = pdate AND menu.price < pprice)
$$ LANGUAGE SQL;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');

--DROP FUNCTION fnc_person_visits_and_eats_on_date(character varying,numeric,date)


