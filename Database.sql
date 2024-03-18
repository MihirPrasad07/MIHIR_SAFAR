-- Create a database for the ticket booking system
CREATE DATABASE IF NOT EXISTS TicketBooking;

-- Use the created database
USE TicketBooking;

-- Create a table for storing route information
CREATE TABLE IF NOT EXISTS Routes (
    RouteID INT AUTO_INCREMENT PRIMARY KEY,
    RouteNumber VARCHAR(255) NOT NULL,
    StartStop VARCHAR(255) NOT NULL,
    EndStop VARCHAR(255) NOT NULL
);

-- Create a table for storing trip information
CREATE TABLE IF NOT EXISTS Trips (
    TripID INT AUTO_INCREMENT PRIMARY KEY,
    RouteID INT,
    DepartureTime DATETIME,
    ArrivalTime DATETIME,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID)
);

-- Create a table for storing ticket purchases
CREATE TABLE IF NOT EXISTS Tickets (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    TripID INT,
    UserID INT,
    PurchaseTime DATETIME,
    Price DECIMAL(10, 2),
    FOREIGN KEY (TripID) REFERENCES Trips(TripID)
    -- If you have a Users table, you would also add a FOREIGN KEY for UserID
);

-- Insert some dummy data into Routes
INSERT INTO Routes (RouteNumber, StartStop, EndStop) VALUES
('217', 'Dadasaheb Sarfare Chowk', 'Dadar Station East Or Swami Narayan Chowk');

-- Insert some dummy trip data
INSERT INTO Trips (RouteID, DepartureTime, ArrivalTime) VALUES
(LAST_INSERT_ID(), '2023-01-01 08:00:00', '2023-01-01 09:30:00');

-- Assume there is a User with ID 1 who is purchasing a ticket
-- Insert a dummy ticket purchase (replace the userID and TripID with actual values from your database)
INSERT INTO Tickets (TripID, UserID, PurchaseTime, Price) VALUES
(1, 1, NOW(), 4.85);
