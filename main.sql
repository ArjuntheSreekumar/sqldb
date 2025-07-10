-- MySQL Database Project - Altered Version

-- Create the database
CREATE DATABASE IF NOT EXISTS Cozy_Corner;
SHOW DATABASES;
USE Cozy_Corner;

-- Create the Customers table
CREATE TABLE Customers(
    CustomerID INT NOT NULL PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    PhoneNumber BIGINT NOT NULL UNIQUE
);
SHOW TABLES;

-- Populate Customers table
INSERT INTO Customers(CustomerID, FullName, PhoneNumber) VALUES 
(1, "Alice Johnson", 9876543210), 
(2, "Brian Lee", 8765432109), 
(3, "Chen Wei", 7654321098), 
(4, "Deepa Narayan", 9988776655), 
(5, "Ethan Smith", 8899776655),     
(6, "Fatima Noor", 9090887766),      
(7, "George Brown", 9191999888),      
(8, "Hannah Kim", 9292999777),      
(9, "Isaac Newton", 9393999666),     
(10, "Jin Park", 9494999555);
SELECT * FROM Customers;

-- Create Bookings table
CREATE TABLE Bookings(
    BookingID INT, 
    BookingDate DATE,
    TableNumber INT, 
    NumberOfGuests INT,
    CustomerID INT
);
-- Populate Bookings
INSERT INTO Bookings 
(BookingID, BookingDate, TableNumber, NumberOfGuests, CustomerID) 
VALUES
(101, '2022-10-01', 4, 2, 1),  
(102, '2022-10-01', 6, 3, 2),  
(103, '2022-10-01', 2, 1, 4), 
(104, '2022-10-02', 1, 4, 5),  
(105, '2022-10-02', 5, 2, 6),  
(106, '2022-10-02', 3, 2, 7), 
(107, '2022-10-02', 3, 5, 1),  
(108, '2022-10-03', 5, 2, 2),  
(109, '2022-10-03', 3, 2, 4), 
(110, '2022-10-04', 6, 4, 6),  
(111, '2022-10-05', 5, 2, 3),  
(112, '2022-10-05', 2, 2, 4);
SELECT * FROM Bookings;

-- Create Courses table
CREATE TABLE Courses(
    CourseName VARCHAR(255) PRIMARY KEY, 
    Cost DECIMAL(4,2)
);
-- Populate Courses
INSERT INTO Courses (CourseName, Cost) VALUES 
("Falafel Wrap", 13.50), 
("Tomato Soup", 10.25), 
("Margherita Pizza", 14.00), 
("Pasta Alfredo", 13.25), 
("Grilled Kofta", 16.00), 
("Chicken Gyro", 12.40);
SELECT * FROM Courses;

-- Filter with WHERE + BETWEEN
SELECT * 
FROM Bookings 
WHERE BookingDate BETWEEN '2022-10-02' AND '2022-10-04';

-- JOIN Query
SELECT Customers.FullName, Bookings.BookingID 
FROM Customers 
RIGHT JOIN Bookings ON Customers.CustomerID = Bookings.CustomerID 
WHERE BookingDate = '2022-10-02';

-- GROUP BY
SELECT BookingDate, COUNT(*) 
FROM Bookings 
GROUP BY BookingDate;

-- REPLACE (update price)
REPLACE INTO Courses (CourseName, Cost) VALUES ("Grilled Kofta", 18.00);
SELECT * FROM Courses;

-- Create table with constraints
CREATE TABLE DeliveryAddress(     
    ID INT PRIMARY KEY,     
    Address VARCHAR(255) NOT NULL,     
    Type VARCHAR(100) NOT NULL DEFAULT "Private",     
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
SHOW COLUMNS FROM DeliveryAddress;

-- Alter table: Add Ingredients column
ALTER TABLE Courses ADD COLUMN Ingredients VARCHAR(255);
SHOW COLUMNS FROM Courses;

-- Subquery
SELECT FullName 
FROM Customers 
WHERE (SELECT CustomerID FROM Bookings WHERE Customers.CustomerID = Bookings.CustomerID AND BookingDate = "2022-10-02");

-- Create a View
CREATE VIEW BookingsView AS 
SELECT BookingID, BookingDate, NumberOfGuests 
FROM Bookings 
WHERE NumberOfGuests > 3 AND BookingDate < "2022-10-04";
SELECT * FROM BookingsView;

-- Stored Procedure
DELIMITER //
CREATE PROCEDURE GetBookingsData (IN InputDate DATE)
BEGIN
  SELECT * FROM Bookings WHERE BookingDate = InputDate;
END //
DELIMITER ;
CALL GetBookingsData("2022-10-04");

-- String Function formatting
SELECT CONCAT("ID: ", BookingID, ', Date: ', BookingDate, ', Number of guests: ', NumberOfGuests) AS "Booking Details"
FROM Bookings;
