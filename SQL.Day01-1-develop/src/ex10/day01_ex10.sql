--ex10
/*GLOBAL JOIN - это оператор запроса SQL, 
     * который используется для объединения данных 
     * из двух или более таблиц на основе определенного 
     * условия. Он позволяет объединить строки из 
     * различных таблиц и выбрать данные из них в одном 
     * результате запроса.*/
SELECT person.name AS person_name,
       menu.pizza_name AS pizza_name,
       pizzeria.name AS pizzeria_name
FROM person
JOIN person_order ON person.id=person_order.person_id
JOIN menu ON person_order.menu_id=menu.id
JOIN pizzeria ON menu.pizzeria_id=pizzeria.id
ORDER BY person_name,
         pizza_name,
         pizzeria_name;

