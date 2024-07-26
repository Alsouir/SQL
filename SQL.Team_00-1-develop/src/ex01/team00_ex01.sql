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
ORDER BY total_cost,
    tour;