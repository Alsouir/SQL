CREATE TABLE graph (
    point1 CHAR NOT NULL,
    point2 CHAR NOT NULL,
    cost INT NOT NULL,
    PRIMARY KEY (point1, point2),
    CHECK (point1 <> point2)
);

INSERT INTO graph
VALUES ('a', 'b', 10),
    ('a', 'c', 15),
    ('a', 'd', 20),
    ('b', 'a', 10),
    ('b', 'c', 35),
    ('b', 'd', 25),
    ('c', 'a', 15),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'a', 20),
    ('d', 'b', 25),
    ('d', 'c', 30);
	
SELECT *
FROM graph;

--ex00
WITH min_cost AS (
    SELECT (gA.cost + g2.cost + g3.cost + g4.cost) AS total_cost,
        FORMAT(
            '{%s,%s,%s,%s,%s}',
            gA.point1,
            gA.point2,
            g2.point2,
            g3.point2,
            g4.point2
        ) AS tour
    FROM graph gA
        JOIN graph g2 ON gA.point2 = g2.point1
        JOIN graph g3 ON g2.point2 = g3.point1
        JOIN graph g4 ON g3.point2 = g4.point1
    WHERE gA.point1 = 'a'
        AND g2.point2 <> gA.point1
        AND g3.point2 NOT IN (gA.point1, g2.point1)
        AND g4.point2 = gA.point1
)
SELECT total_cost,
    tour
FROM min_cost
WHERE total_cost = (
        SELECT MIN(total_cost)
        FROM min_cost
    )
ORDER BY total_cost,
    tour;
