SELECT id, movie, description, rating
FROM cinema
WHERE mod(id,2) != 0 AND description != 'boring'
ORDER BY rating desc;
