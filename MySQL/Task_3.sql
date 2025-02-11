-- problem 1 Japanese Cities' Names
select name
from city
where COUNTRYCODE = 'JPN';

-- problem 2 Weather Observation Station 2
select ROUND( sum(LAT_N ) , 2) , ROUND( sum(LONG_W  ) , 2) 
from STATION;

-- problem 3 Weather Observation Station 9
select distinct city
from STATION
where substring(CITY ,1,1) not in ('A','O','U','I','E');

-- problem 4 Weather Observation Station 10
select distinct city
from STATION
where substring(CITY ,length(CITY),1) not in ('A','O','U','I','E');

-- problem 5 Weather Observation Station 12
select distinct city
from STATION
where substring(CITY ,length(CITY),1) not in ('A','O','U','I','E') 
and substring(CITY ,1,1) not in ('A','O','U','I','E');

-- problem 6 Average Population
select ROUND( AVG(population))
from CITY;

-- problem 7 Teams Power Users
SELECT   sender_id , count(message_id) as message_count
from messages
where EXTRACT(MONTH FROM sent_date) = '8'
AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP by sender_id
order by message_count DESC
limit 2;

-- problem 8 App Click-through Rate (CTR)
SELECT"app_id",
ROUND(100 *
SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
AND timestamp < '2023-01-01'
GROUP BY "app_id";





