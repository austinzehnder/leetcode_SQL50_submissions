SELECT DISTINCT manager.name
FROM employee manager
JOIN employee subordinate ON manager.id = subordinate.managerId
GROUP BY manager.name
HAVING COUNT(subordinate.id) >= 5;
