--ex01
/* В какие дни не посещали пиццерий person_id 1 или 2 
 * с [01.01.22 по 10.01.22].Создали новую таблицу 
 * "visit12" из person_visits (Взяли 1 и 2 посетителя
 *  и ограничели дату). В visit12 нет дат, которые есть 
 * в person_visits. Значит "person_visits" RIGHT JOIN 
 * "visit12". берем данные c новой JOIN табличке, 
 * где есть NULL в visit_id_1_2.visit_date.*/

SELECT DISTINCT person_visits.visit_date AS missing_date
FROM (SELECT visit_date FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-10'
    AND person_id BETWEEN 1 AND 2) AS  visit12
RIGHT JOIN person_visits
ON visit12.visit_date = person_visits.visit_date
WHERE visit12.visit_date is NULL
ORDER BY person_visits.visit_date;

