--ex05
/*Найти людей женского поля старше 25 лет.*/

SELECT name
FROM person
WHERE gender = 'female' AND age > 25
ORDER BY name;
