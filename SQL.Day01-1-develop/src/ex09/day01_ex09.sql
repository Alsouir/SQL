--ex09
/*IN и EXISTS в SQL используются для фильтрации данных в запросах.
 * Оператор IN используется для сравнения значения 
 * столбца или выражения с набором значений, указанным в скобках.
 * WHERE EXISTS (subquery); - Если subquery что-то возращает, 
 * 			то TRUE, иначе  FALSE.
*/
SELECT name
FROM pizzeria
WHERE name NOT IN 
    (SELECT DISTINCT name
     FROM pizzeria
     JOIN person_visits ON person_visits.pizzeria_id=pizzeria.id);

SELECT name
FROM pizzeria
WHERE NOT EXISTS
    (SELECT 1
     FROM person_visits
     WHERE pizzeria.id=person_visits.pizzeria_id);
