--ex08
CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
RETURNS TABLE (fibonacci_number bigint) AS $$
DECLARE
    a bigint := 0;
    b bigint := 1;
    fib bigint;
BEGIN
    fibonacci_number := a;
    RETURN NEXT;

    fibonacci_number := b;
    RETURN NEXT;

    LOOP
        fib := a + b;
        EXIT WHEN fib >= pstop;
        fibonacci_number := fib;
        RETURN NEXT;

        a := b;
        b := fib;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();


--DROP FUNCTION fnc_fibonacci;



