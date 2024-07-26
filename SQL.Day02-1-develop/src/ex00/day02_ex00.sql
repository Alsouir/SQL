--ex00 
/*список названий пиццерий с соответствующим значением 
 * рейтинга, которые не посещались посетителями
 * LEFT JOIN
 * Когда объединяем данных двух таблиц, к левой таблице 
 * присоединяется правая таблица. Если в правой таблице нет id, 
 * которая есть в левойи и так как левый id мы всеравно 
 * отображаем, то элементы (столбцы) правлой таблицы 
 * заполняются Налами(Null). Так как у правой нет такой id, 
 * а значит и нет данных для этого id. Когда мы объединили у нас 
 * возникли строки с NULL. И просто их выбираем. 
 * Если id левой таблицы нет в правой, то значит эту пиццерию не посещали.
*/

SELECT name, rating
FROM pizzeria
LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE person_visits.pizzeria_id IS NULL;

SELECT name, rating
FROM pizzeria
WHERE NOT EXISTS
    (SELECT *
     FROM person_visits
     WHERE pizzeria.id=person_visits.pizzeria_id);
