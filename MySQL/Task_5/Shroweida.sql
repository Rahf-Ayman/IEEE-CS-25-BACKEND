CREATE DATABASE Airport;

use airport;
CREATE table airline_companies(
    airline_id INT PRIMARY key AUTO_INCREMENT,
    airline_name VARCHAR(50),
    head_quarters VARCHAR(50),
    fleet_size int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE Table Planes(
    plane_ID INT PRIMARY KEY ,
    plane_name VARCHAR(50),
    plane_company VARCHAR(50),
    passenger_capacity INT,
    fuel_capacity INT,
    constraint chk_fuel_capacity check(fuel_capacity >= 30),
    next_trip_date TIMESTAMP,
    trip_destination VARCHAR(50),
    airline_ID INT NOT NULL,
    FOREIGN KEY (airline_ID) REFERENCES airline_companies(airline_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);



CREATE Table runway(
    runway_id int PRIMARY KEY AUTO_INCREMENT,
    flight_time TIMESTAMP,
    current_status ENUM ('open','closed'),
    plane_id int NOT NULL,
    FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    gender ENUM('Male', 'Female'),
    age INT,
    address VARCHAR(50),
    role ENUM('Passenger', 'Airport Employee', 'Flight Attendee', 'Pilot') NOT NULL,
    salary DECIMAL(10,2) DEFAULT NULL,
    plane_id INT,
    FOREIGN KEY (plane_id) REFERENCES Planes(plane_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE Table flights(
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    from_location VARCHAR(50) NOT NULL,
    destination_location VARCHAR(50) NOT NULL,
    take_off_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    plane_id INT UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (plane_id) REFERENCES Planes(plane_id)
);


-- Insert into airline_companies
INSERT INTO airline_companies (airline_name, head_quarters, fleet_size) VALUES
('Air Sharkia', 'Sharkia City', 50),
('Sky Wings', 'Cairo', 80),
('Blue Horizon', 'Alexandria', 100),
('Falcon Airways', 'Luxor', 40),
('Desert Eagle Airlines', 'Aswan', 60),
('Nile Air', 'Giza', 70),
('Red Sea Aviation', 'Hurghada', 30),
('Mediterranean Airlines', 'Port Said', 45),
('Pyramids Air', 'Giza', 55),
('Sunbird Airlines', 'Marsa Alam', 35);

-- Insert into planes
INSERT INTO planes (plane_id ,plane_name, plane_company, passenger_capacity, fuel_capacity, next_trip_date, trip_destination, airline_ID) VALUES
(1,'Boeing 737', 'Air Sharkia', 180, 100, '2025-02-20 08:00:00', 'Cairo', 1),
(2,'Airbus A320', 'Sky Wings', 160, 120, '2025-02-21 09:30:00', 'Alexandria', 2),
(3,'Embraer E190', 'Blue Horizon', 120, 90, '2025-02-22 10:15:00', 'Luxor', 3),
(4,'Boeing 747', 'Falcon Airways', 350, 200, '2025-02-23 11:00:00', 'Aswan', 4),
(5,'Airbus A350', 'Desert Eagle Airlines', 250, 180, '2025-02-24 12:45:00', 'Hurghada', 5),
(6,'Boeing 777', 'Nile Air', 300, 220, '2025-02-25 14:30:00', 'Giza', 6),
(7,'Cessna 172', 'Red Sea Aviation', 4, 50, '2025-02-26 16:00:00', 'Port Said', 7),
(8,'Bombardier CRJ900', 'Mediterranean Airlines', 90, 85, '2025-02-27 18:15:00', 'Sharkia City', 8),
(9,'ATR 72', 'Pyramids Air', 70, 75, '2025-02-28 20:00:00', 'Marsa Alam', 9),
(10,'Airbus A321', 'Sunbird Airlines', 190, 130, '2025-03-01 22:30:00', 'Cairo', 10),
(11,'Boeing 737', 'Air Sharkia', 180, 100, '2025-02-20 08:00:00', 'Cairo', 1),
(12,'Airbus A320', 'Sky Wings', 160, 120, '2025-02-21 09:30:00', 'Alexandria', 2),
(13,'Embraer E190', 'Blue Horizon', 120, 90, '2025-02-22 10:15:00', 'Luxor', 3),
(14,'Boeing 747', 'Falcon Airways', 350, 200, '2025-02-23 11:00:00', 'Aswan', 4),
(15,'Airbus A350', 'Desert Eagle Airlines', 250, 180, '2025-02-24 12:45:00', 'Hurghada', 5),
(16,'Boeing 777', 'Nile Air', 300, 220, '2025-02-25 14:30:00', 'Giza', 6),
(17,'Cessna 172', 'Red Sea Aviation', 4, 50, '2025-02-26 16:00:00', 'Port Said', 7),
(18,'Bombardier CRJ900', 'Mediterranean Airlines', 90, 85, '2025-02-27 18:15:00', 'Sharkia City', 8),
(19,'ATR 72', 'Pyramids Air', 70, 75, '2025-02-28 20:00:00', 'Marsa Alam', 9),
(20,'Airbus A321', 'Sunbird Airlines', 190, 130, '2025-03-01 22:30:00', 'Cairo', 10),
(1244,'Airbus A350', 'Desert Eagle Airlines', 250, 180, '2025-02-24 12:45:00', 'Hurghada', 5),
(60,'Boeing 737', 'Air Sharkia', 180, 100, '2025-02-20 08:00:00', 'Tanta', 1),
(62,'Airbus A320', 'Sky Wings', 160, 120, '2025-02-21 09:30:00', 'Tanta', 2),
(63,'Embraer E190', 'Blue Horizon', 120, 90, '2025-02-22 10:15:00', 'Tanta', 3),
(64,'Boeing 747', 'Falcon Airways', 350, 200, '2025-02-23 11:00:00', 'Tanta', 4),
(65,'Airbus A350', 'Desert Eagle Airlines', 250, 180, '2025-02-24 12:45:00', 'Tanta', 5);


-- Insert into runway
INSERT INTO runway (flight_time, current_status, plane_id) VALUES
('2025-02-20 08:00:00', 'open', 1),
('2025-02-21 09:30:00', 'closed', 2),
('2025-02-22 10:15:00', 'open', 3),
('2025-02-23 11:00:00', 'closed', 4),
('2025-02-24 12:45:00', 'open', 5),
('2025-02-25 14:30:00', 'closed', 6),
('2025-02-26 16:00:00', 'open', 7),
('2025-02-27 18:15:00', 'closed', 8),
('2025-02-28 20:00:00', 'open', 9),
('2025-03-01 22:30:00', 'closed', 10);

-- Insert into users
INSERT INTO users (name, gender, age, address, role, salary, plane_id) VALUES
('John Doe', 'Male', 34, 'Cairo', 'Pilot', 5000.00, 1244),
('Jane Smith', 'Female', 28, 'Alexandria', 'Flight Attendee', 3200.00, 1244),
('Ahmed Ali', 'Male', 45, 'Luxor', 'Airport Employee', 4500.00, 1244),
('Sara Khan', 'Female', 30, 'Aswan', 'Passenger', NULL, 1244),
('David Johnson', 'Male', 50, 'Hurghada', 'Pilot', 5500.00, 1244),
('Emily Brown', 'Female', 26, 'Giza', 'Flight Attendee', 3100.00, 1244),
('Mohamed Salah', 'Male', 33, 'Port Said', 'Passenger', NULL, 1244),
('Olivia White', 'Female', 40, 'Sharkia City', 'Airport Employee', 4000.00, 1244),
('Ali Hassan', 'Male', 29, 'Marsa Alam', 'Passenger', NULL, 1244),
('Sophia Wilson', 'Female', 35, 'Cairo', 'Pilot', 4800.00, 1244);

-- Insert into flights
INSERT INTO flights (from_location, destination_location, take_off_time, arrival_time, plane_id) VALUES
('Cairo', 'Alexandria', '2025-02-20 08:00:00', '2025-02-20 09:15:00', 1),
('Alexandria', 'Luxor', '2025-02-21 09:30:00', '2025-02-21 11:45:00', 2),
('Luxor', 'Aswan', '2025-02-22 10:15:00', '2025-02-22 11:30:00', 3),
('Aswan', 'Hurghada', '2025-02-23 11:00:00', '2025-02-23 12:45:00', 4),
('Hurghada', 'Giza', '2025-02-24 12:45:00', '2025-02-24 14:00:00', 5),
('Giza', 'Port Said', '2025-02-25 14:30:00', '2025-02-25 16:15:00', 6),
('Port Said', 'Sharkia City', '2025-02-26 16:00:00', '2025-02-26 17:30:00', 7),
('Sharkia City', 'Marsa Alam', '2025-02-27 18:15:00', '2025-02-27 19:45:00', 8),
('Marsa Alam', 'Cairo', '2025-02-28 20:00:00', '2025-02-28 22:00:00', 9),
('Cairo', 'Alexandria', '2025-03-01 22:30:00', '2025-03-01 23:45:00', 10),
('Shroweida', 'Alexandria', '2025-02-20 08:00:00', '2025-02-20 09:15:00', 11),
('Shroweida', 'Luxor', '2025-02-21 09:30:00', '2025-02-21 11:45:00', 12),
('Shroweida', 'Aswan', '2025-02-22 10:15:00', '2025-02-22 11:30:00', 13),
('Shroweida', 'Hurghada', '2025-03-23 11:00:00', '2025-03-23 12:45:00', 14),
('Hurghada', 'Giza', '2025-02-24 12:45:00', '2025-02-24 14:00:00', 15),
('Giza', 'Port Said', '2025-02-25 14:30:00', '2025-02-25 16:15:00', 16),
('Port Said', 'Sharkia City', '2025-02-26 16:00:00', '2025-02-26 17:30:00', 17),
('Sharkia City', 'Marsa Alam', '2025-02-27 18:15:00', '2025-02-27 19:45:00', 18),
('Marsa Alam', 'Cairo', '2025-02-28 20:00:00', '2025-02-28 22:00:00', 19),
('Cairo', 'Alexandria', '2025-03-01 22:30:00', '2025-03-01 23:45:00', 20);





