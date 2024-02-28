WITH PrimaryDept AS (
    SELECT
        employee_id,
        MIN(department_id) AS primary_department
    FROM
        Employee
    WHERE
        primary_flag = 'Y'
    GROUP BY
        employee_id
)
SELECT
    e.employee_id,
    COALESCE(pd.primary_department, e.department_id) AS department_id
FROM
    Employee e
LEFT JOIN
    PrimaryDept pd ON e.employee_id = pd.employee_id
WHERE
    e.primary_flag = 'Y'
   OR (
        e.primary_flag = 'N'
        AND NOT EXISTS (
            SELECT 1
            FROM Employee
            WHERE employee_id = e.employee_id AND primary_flag = 'Y'
        )
    );
