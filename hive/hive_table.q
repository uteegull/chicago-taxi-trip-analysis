CREATE EXTERNAL TABLE hive_query_table(hour_of_day INT, trip_miles FLOAT, trip_seconds INT)ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION 'gs://chicago-taxi-trips-group2/hive-exe/data/';
