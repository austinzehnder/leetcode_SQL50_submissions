SELECT machine_id,
       ROUND(AVG(CAST(timestamp_end - timestamp_start AS NUMERIC)), 3) AS processing_time
FROM (
    SELECT machine_id,
           process_id,
           MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS timestamp_start,
           MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS timestamp_end
    FROM Activity
    GROUP BY machine_id, process_id
) AS process_times
GROUP BY machine_id
ORDER BY machine_id;
