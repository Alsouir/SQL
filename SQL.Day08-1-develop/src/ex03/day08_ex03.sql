--ex03
--В этом уровне транзакции могут видеть только изменения, 
--которые были подтверждены другими транзакциями. 
--Это предотвращает неповторяющиеся чтения, 
--но фантомные записи могут все еще возникать.
-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
