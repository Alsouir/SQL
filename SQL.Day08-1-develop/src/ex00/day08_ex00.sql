--ex00
-- Session #1
SHOW TRANSACTION ISOLATION LEVEL; -- read committed
START TRANSACTION;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Session #2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';
-- Session #1
COMMIT;
-- Session #2
SELECT * FROM pizzeria WHERE name  = 'Pizza Hut';s
