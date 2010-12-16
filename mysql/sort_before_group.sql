-- from: http://forum.percona.com/index.php/t/673/
SELECT Test.*
FROM Test
INNER JOIN (
    SELECT MAX(id) id
    FROM Test
    GROUP BY gid
) s ON s.id = Test.id
