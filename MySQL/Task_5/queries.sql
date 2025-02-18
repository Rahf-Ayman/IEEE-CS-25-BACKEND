-- Find all passengers ,pilots,Flight attendee for the plane which has ID=1244
SELECT u.user_id, u.name , u.gender , u.age , u.address , u.role , u.salary
FROM users u JOIN planes p
WHERE p.plane_ID = 1244 AND u.role in('Passenger',  'Flight Attendee', 'Pilot');


-- Find all upcoming flights departing from Shroweida in the next 7 days.
SELECT * 
FROM airport.flights
WHERE from_location = 'Shroweida'
AND take_off_time > NOW() AND  take_off_time <= NOW() + INTERVAL 7 DAY ;

-- All Open runways
SELECT *
FROM airport.runway
WHERE current_status = 'open';

-- All planes,its company,passengers capacity that will flight to Tanta
SELECT p.plane_id , p.plane_name , p.passenger_capacity , c.airline_id , c.airline_name
FROM planes p join airline_companies c
ON c.airline_id = p.airline_ID
WHERE p.trip_destination = 'Tanta';

