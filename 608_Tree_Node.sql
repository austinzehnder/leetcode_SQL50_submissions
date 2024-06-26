WITH ChildCounts AS (
    SELECT p_id AS id, COUNT(*) AS child_count
    FROM Tree
    GROUP BY p_id
),
NodeTypes AS (
    SELECT 
        t.id,
        CASE
            WHEN t.p_id IS NULL THEN 'Root'
            WHEN c.child_count IS NULL THEN 'Leaf'
            ELSE 'Inner'
        END AS type
    FROM Tree t
    LEFT JOIN ChildCounts c ON t.id = c.id
)
SELECT id, type
FROM NodeTypes
ORDER BY id;
