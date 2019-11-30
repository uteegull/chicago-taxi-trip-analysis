create external table timediff( taxi_id string, trip_start_timestamp timestamp,trip_end_timestamp timestamp) row format delimited fields terminated by ',' location 'gs://chicago-taxi-trips-group2/spark/data/tips.csv/';


SELECT taxi_id,
                       trip_start_timestamp,
                       trip_end_timestamp,
                       TIMESTAMP_DIFF(
                           trip_start_timestamp, 
                           lag(trip_end_timestamp,1)
                               OVER (
                                    PARTITION BY taxi_id
                                    ORDER BY trip_start_timestamp), 
                           MINUTE) as prev_break
                   FROM timediff
                   WHERE DATE(trip_start_timestamp) = '2019-05-01';