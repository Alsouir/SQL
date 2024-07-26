--ex07
CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) 
RETURNS NUMERIC AS
$$
DECLARE
    min_val NUMERIC;
BEGIN
	min_val := arr[1];
    FOR i IN 2..array_upper(arr, 1)
    LOOP
        IF arr[i] < min_val THEN min_val = arr[i];
        END IF;
    END LOOP;
    return min_val;
END;
$$ LANGUAGE plpgsql;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);

--DROP FUNCTION func_minimum;

