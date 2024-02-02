SELECT e.name, b.bonus
FROM bonus b
    RIGHT JOIN employee e ON e.empId = b.empId
    WHERE bonus < 1000 or bonus IS NULL;
