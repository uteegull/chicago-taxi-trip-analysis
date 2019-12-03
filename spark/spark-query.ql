INSERT OVERWRITE DIRECTORY 'gs://chicago-taxi-trips-group2/spark/divya'
SELECT
    pickup_location,
    SUM(fare) 
over( PARTITION BY(pickup_location) ORDER BY fare_sum) cumsum
FROM q4
order by cumsum;
