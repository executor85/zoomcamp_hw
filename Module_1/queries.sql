SELECT * FROM public."green_tripdata_2019-09.csv" where lpep_pickup_datetime between '2019-09-18 00:00:00' and '2019-09-18  23:59:59'
-- 15767

SELECT
	CAST(lpep_pickup_datetime AS DATE) as "date",
	count(1) as "count",
	MAX(trip_distance) as td

FROM
	"green_tripdata_2019-09.csv"
group by "date"
order by td desc

--2019-09-26

SELECT
k."Borough" as  "br",
sum(t.total_amount) as sm
FROM
	"taxi+_zone_lookup.csv" k   join  "green_tripdata_2019-09.csv" t
on t."PULocationID" = k."LocationID"
where t.lpep_pickup_datetime between '2019-09-18 00:00:00' and '2019-09-18  23:59:59'
group by br
order by sm desc
Limit 3

--"Brooklyn"
--"Manhattan"
--"Queens"


select
lpep_pickup_datetime,
lpep_dropoff_datetime,
tip_amount,
concat(tpu."Borough",' / ',tpu."Zone") as pickup,
concat(kdo."Borough",' / ',kdo."Zone") as dropof

from
"green_tripdata_2019-09.csv" g,
"taxi+_zone_lookup.csv" tpu,
"taxi+_zone_lookup.csv" kdo
where 
g."PULocationID" = tpu."LocationID" and
g."DOLocationID" = kdo."LocationID" and
date_part('year', lpep_pickup_datetime) = '2019' and
tpu."Zone" = 'Astoria'
order by tip_amount Desc
limit 1

-- "2019-09-08 18:10:40"	"2019-09-08 18:44:42"	62.31	"Queens / Astoria"	"Queens / JFK Airport"