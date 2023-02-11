-- Table definition --

CREATE EXTERNAL TABLE dataset_fhv
OPTIONS (
    format = 'CSV'
    uris = ['gs://green-taxi-bucket/*.csv.gz']
)

-- Queries to External table --
SELECT count(*) FROM `serene-column-375413.greentaxiset.dataset_fhv`;

select * from serene-column-375413.greentaxiset.dataset_fhv;
SELECT COUNT(DISTINCT affiliated_base_number)
FROM serene-column-375413.greentaxiset.dataset_fhv;

SELECT COUNT ( PUlocationID)
FROM serene-column-375413.greentaxiset.dataset_fhv
WHERE PUlocationID = 0;

--Queries to BigQuery table--
SELECT count(*) FROM `serene-column-375413.greentaxiset.bqtable`;

select * from serene-column-375413.greentaxiset.bqtable limit 100;

SELECT COUNT(DISTINCT affiliated_base_number)
FROM serene-column-375413.greentaxiset.bqtable;

SELECT COUNT ( PUlocationID), 
       COUNT (DOlocationID)
FROM serene-column-375413.greentaxiset.bqtable;

select count(*) - count(PUlocationID), count(PUlocationID), count(*) - count(DOlocationID) as d, count(DOlocationID)
from serene-column-375413.greentaxiset.bqtable
where PUlocationID is null AND DOlocationID is null;

--Queries to Partition table--
SELECT affiliated_base_number 
FROM `serene-column-375413.greentaxiset.partition_q5` 
WHERE DATE(_PARTITIONTIME) BETWEEN "2019-03-01" AND "2019-03-31";

select DISTINCT affiliated_base_number, pickup_datetime 
FROM `serene-column-375413.greentaxiset.partition_q5` 
WHERE DATE(_PARTITIONTIME) = "2023-02-10"
AND pickup_datetime BETWEEN "2019-03-01" AND "2019-03-31"
order by pickup_datetime;