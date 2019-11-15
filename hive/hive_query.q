# INSERT OVERWRITE DIRECTORY 'gs://chicago-taxi-trips-group2/hive-exe/output'
SELECT hour_of_day, 
                   COUNT(trip_miles) AS num_trips,
                   (3600 * SUM(trip_miles) / SUM(trip_seconds)) AS avg_mph
               FROM hive_query_table
               GROUP BY hour_of_day
               ORDER BY num_trips