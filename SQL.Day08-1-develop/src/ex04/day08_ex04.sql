--ex04
--Этот уровень обеспечивает наивысший уровень изоляции. 
--Он гарантирует, что транзакции не будут видеть изменения, 
--сделанные другими транзакциями, пока они не будут подтверждены, 
--и предотвращает возникновение неповторяющихся чтений и 
--фантомных записей.

-- Session #1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;
-- Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
