--ex05
/* ДЕКАРТОВОЕ ПРОИЗВЕДЕНИЕ
 * При декартовом произведении каждая строка 
 * из первой таблицы соединяется с каждой строкой второй таблицы.
 * person 9 строк * pizzeria 6 строк = 54 строк
*/
SELECT person.id, person.name, person.age, person.gender, person.address,
	pizzeria.id, pizzeria.name, pizzeria.rating
FROM person
CROSS JOIN pizzeria
ORDER BY person.id;

