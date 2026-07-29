# EV Charging Analytics Dashboard

## Project Overview

This project analyzes Electric Vehicle (EV) charging station operations across major Indian cities using **SQL** for data management and **Power BI** for interactive dashboard development. The dashboard provides insights into charging sessions, revenue generation, customer behavior, station performance, vehicle usage, and operational trends.

---

## Project Objectives

* Analyze EV charging usage across multiple cities.
* Monitor revenue and energy consumption.
* Identify customer charging behavior.
* Compare station performance.
* Understand payment preferences and charger utilization.
* Build an interactive business dashboard for decision-making.

---

## Tools & Technologies

* **MySQL** – Database creation, data import, SQL queries
* **Power BI** – Dashboard development & data visualization
* **Power Query** – Data loading and transformation
* **DAX** – KPI calculations and measures
* **CSV Files** – Source datasets

---

## Database Schema

The project consists of five related tables:

| Table             | Records | Description                   |
| ----------------- | ------- | ----------------------------- |
| charging_sessions | 30,000  | Charging transaction details  |
| customers         | 3,000   | Customer information          |
| vehicles          | 3,000   | EV vehicle details            |
| stations          | 50      | Charging station information  |
| cities            | 10      | City and regional information |

---

## Data Model

```
Cities
   │
   ▼
Stations
   │
   ▼
Charging Sessions
   ▲          ▲
   │          │
Customers ─── Vehicles
```

Relationships were created using:

* Customer_ID
* Vehicle_ID
* Station_ID
* City_ID

---

# Dashboard Features

### Executive KPIs

* Total Revenue
* Total Energy
* Average Duration
* Average Revenue/ Session

---

### Visualizations

* Revenue by Month
* Total sessions by EV brand
* Revenue by station type
* Revenue by charger type


---

## SQL Analysis Performed

The following business questions were answered using SQL:

* Total Revenue Generated
* Average Revenue per Session
* Revenue by Charger Type
* Top 5 Cities by Charging Sessions
* Revenue by Vehicle Brand
* Membership-wise Charging Sessions
* Payment Method Analysis
* Weather-wise Charging Revenue
* Station Performance Analysis
* Average Energy Consumption

---

# Dataset Summary

| Metric            | Value  |
| ----------------- | ------ |
| Cities            | 10     |
| Charging Stations | 50     |
| Customers         | 3,000  |
| Vehicles          | 3,000  |
| Charging Sessions | 30,000 |

---

# Business Insights

* The dataset contains **30,000 charging sessions**, indicating high utilization across the charging network.
* The charging infrastructure spans **10 major Indian cities** with **50 charging stations**.
* Total charging revenue exceeds **$11.79 million**, reflecting strong EV charging demand.
* Digital payment methods such as **Wallet, UPI, Credit Card, and Debit Card** account for most transactions.
* Fast chargers (AC Fast, DC Fast, DC Ultra Fast) contribute significantly to charging activity.
* Gold, Platinum, and Silver membership users represent the majority of repeat customers.
* Multiple EV brands, including Tata, Hyundai, Mahindra, MG, Hero MotoCorp, and others, actively use the charging network.
* Revenue and charging demand vary across stations and cities, helping identify high-performing locations.

---

# Key Recommendations

### Expand High-Performing Stations

Increase the number of chargers at stations with consistently high charging sessions and revenue.

### Promote Membership Programs

Introduce loyalty rewards and exclusive benefits to encourage repeat charging and improve customer retention.

### Improve Fast Charging Infrastructure

Install additional DC Fast and Ultra Fast chargers at busy locations to reduce waiting times.

### Optimize Payment Experience

Continue supporting digital payment options while promoting the most frequently used payment methods for faster transactions.

### Demand-Based Expansion

Use charging session trends to identify cities with growing demand and prioritize future station expansion.

### Operational Planning

Leverage weather and traffic trends to optimize staffing, charger availability, and maintenance schedules.

---

# Project Workflow

1. Designed relational database schema in MySQL.
2. Imported CSV datasets into MySQL.
3. Established primary and foreign key relationships.
4. Executed SQL queries for business analysis.
5. Connected MySQL to Power BI.
6. Built relationships within the Power BI data model.
7. Created DAX measures and KPIs.
8. Designed an interactive dashboard with business insights.

---

# Files Included

```
ev_charging.sql
charging_sessions.csv
customers.csv
vehicles.csv
stations.csv
cities.csv
EV Charging Dashboard.pbix
README.md
```

---

# Skills Demonstrated

* SQL
* Database Design
* Data Modeling
* Data Cleaning
* Power BI
* Power Query
* DAX
* Business Intelligence
* Dashboard Design
* Data Visualization
* Business Analytics

---

## Dashboard Preview



```<img width="1162" height="652" alt="Screenshot 2026-07-29 180636" src="https://github.com/user-attachments/assets/d87d175c-67c6-49b0-8524-73702b3f94e5" />

Author
Vansh Pundir
Linkedln Profile -www.linkedin.com/in/vansh-pundir

---

This README is tailored to the datasets you used (**30,000 charging sessions, 3,000 customers, 3,000 vehicles, 50 stations, and 10 cities**) and is suitable for a professional GitHub portfolio project.
