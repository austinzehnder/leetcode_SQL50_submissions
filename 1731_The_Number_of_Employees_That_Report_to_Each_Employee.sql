WITH ManagerInfo AS (
    SELECT
        e.employee_id,
        e.name,
        COUNT(r.reports_to) AS reports_count,
        ROUND(AVG(r.age)) AS average_age
    FROM 
        Employees e
    LEFT JOIN
        Employees r ON e.employee_id = r.reports_to
    GROUP BY
        e.employee_id, e.name
    HAVING
        COUNT(DISTINCT r.employee_id) > 0
)

SELECT
    employee_id,
    name,
    reports_count,
    average_age
FROM
    ManagerInfo
ORDER BY
    employee_id;
