# SQL Aggregations and Window Functions Practice

## Project Overview
This project contains SQL queries to practice **aggregation functions** and **window functions** as part of the ALX Airbnb Database course.  

The goal is to analyze bookings data by users and properties, and to rank properties based on popularity.

## Objective
- Count the total number of bookings made by each user using `COUNT` and `GROUP BY`.  
- Rank properties based on the total number of bookings using a window function (`RANK()`).

## Files
- `aggregations_and_window_functions.sql` – Contains the SQL queries for the assignment.  
- `README.md` – This file explaining the project.

## Example Queries

### 1️⃣ Total bookings by each user
```sql
SELECT u.id AS user_id, u.name AS user_name, COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;
