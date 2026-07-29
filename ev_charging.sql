CREATE DATABASE IF NOT EXISTS ev_charging;
USE ev_charging;

-- =========================
-- Cities Table
-- =========================
CREATE TABLE cities (
    City_ID VARCHAR(10) PRIMARY KEY,
    City VARCHAR(50),
    State VARCHAR(50),
    Region VARCHAR(20),
    Population_Category VARCHAR(20),
    Latitude DECIMAL(9,6),
    Longitude DECIMAL(9,6)
);

-- =========================
-- Stations Table
-- =========================
CREATE TABLE stations (
    Station_ID VARCHAR(10) PRIMARY KEY,
    Station_Name VARCHAR(100),
    City_ID VARCHAR(10),
    Station_Type VARCHAR(30),
    Charger_Type VARCHAR(30),
    Number_of_Chargers INT,
    Operator VARCHAR(50),
    Opening_Year INT,
    Latitude DECIMAL(9,6),
    Longitude DECIMAL(9,6),
    FOREIGN KEY (City_ID) REFERENCES cities(City_ID)
);

-- =========================
-- Customers Table
-- =========================
CREATE TABLE customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Gender VARCHAR(20),
    Age_Group VARCHAR(20),
    Customer_Type VARCHAR(20),
    Membership VARCHAR(20),
    Membership_Start_Date DATE,
    Home_City VARCHAR(50),
    Vehicle_ID VARCHAR(10)
);

-- =========================
-- Vehicles Table
-- =========================
CREATE TABLE vehicles (
    Vehicle_ID VARCHAR(10) PRIMARY KEY,
    EV_Brand VARCHAR(50),
    Model VARCHAR(100),
    Vehicle_Type VARCHAR(30),
    Battery_Capacity_kWh DECIMAL(6,2),
    Manufacturing_Year INT,
    Customer_ID VARCHAR(10),
    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID)
);

-- =========================
-- Charging Sessions Table
-- =========================
CREATE TABLE charging_sessions (
    Session_ID VARCHAR(15) PRIMARY KEY,
    Customer_ID VARCHAR(10),
    Vehicle_ID VARCHAR(10),
    Station_ID VARCHAR(10),
    Session_Start DATETIME,
    Duration_Minutes INT,
    Energy_kWh DECIMAL(8,2),
    Tariff_per_kWh DECIMAL(8,2),
    Revenue DECIMAL(10,2),
    Charger_Type VARCHAR(30),
    Payment_Method VARCHAR(30),
    Weather VARCHAR(20),
    Traffic VARCHAR(20),
    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID),
    FOREIGN KEY (Vehicle_ID) REFERENCES vehicles(Vehicle_ID),
    FOREIGN KEY (Station_ID) REFERENCES stations(Station_ID)
);


-- Total charging sessions
SELECT COUNT(*) AS Total_Sessions
FROM charging_sessions;

-- Total Revenue
SELECT ROUND(SUM(Revenue),2) AS Total_Revenue
FROM charging_sessions;

-- Total energy consumed
SELECT ROUND(SUM(Energy_kWh),2) AS Total_Energy
FROM charging_sessions;

-- Average charging duration
SELECT AVG(Duration_Minutes) AS  Average_charging_duration
FROM charging_sessions;

-- Top 10 Revenue Generating Stations

SELECT s.Station_Name,
SUM(cs.Revenue) AS Total_Revenue
FROM charging_sessions cs
JOIN stations s
ON cs.Station_ID = s.Station_ID
GROUP BY s.Station_Name
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Sessions by Charger Type
	SELECT Charger_Type,
    COUNT(*) AS Total_Sessions
    FROM charging_sessions
    GROUP BY Charger_Type;
    
-- . Revenue by Payment Method
SELECT Payment_Method,
SUM(Revenue) AS Total_Revenue
FROM charging_sessions
GROUP BY Payment_Method;

-- Sessions by Weather

SELECT Weather,
COUNT(*) AS Sessions
FROM charging_sessions
GROUP BY Weather; 

-- Top 10 Customers by Energy Usage

SELECT Customer_ID,
ROUND(SUM(Energy_KWH)) AS Energy_Usage
FROM charging_sessions 
GROUP BY Customer_ID
ORDER BY Energy_usage DESC
LIMIT 10;

-- Average Revenue by Charger Type

SELECT Charger_Type,
AVG(Revenue) AS Average_Revenue
FROM charging_sessions
GROUP BY Charger_Type;

 -- Monthly Revenue Trend
SELECT 
YEAR(Session_Start) AS Year,
MONTH(Session_start) AS Month,
ROUND(SUM(Revenue)) AS Revenue
FROM charging_sessions
GROUP BY YEAR(Session_start), MONTH(Session_start)
ORDER BY Year , Month;

-- EV Brand Wise Sessions
SELECT v.EV_Brand,
COUNT(*) AS Total_sessions
FROM charging_sessions cs
JOIN vehicles v 
ON cs.vehicle_ID=v.Vehicle_ID
GROUP BY v.EV_Brand 
ORDER BY Total_sessions DESC;

-- Average Energy by Vehicle Type
SELECT
    v.Vehicle_Type,
    ROUND(AVG(cs.Energy_kWh),2) AS Avg_Energy
FROM charging_sessions cs
JOIN vehicles v
ON cs.Vehicle_ID = v.Vehicle_ID
GROUP BY v.Vehicle_Type;

-- Top 5 Cities by Sessions
SELECT City ,
COUNT(*) AS Sessions 
FROM charging_sessions cs
JOIN cities c ON cs.City_ID=c.City_ID
    