# SQL Subqueries Practice

## Project Overview
This project contains SQL queries to practice **correlated** and **non-correlated subqueries**. It is part of the ALX Airbnb Database course.

## Objective
- Write a **non-correlated subquery** to filter properties by average rating.  
- Write a **correlated subquery** to find users with more than 3 bookings.

## Instructions
1. **Non-correlated Subquery:**  
   Find all properties where the average rating is greater than 4.0.

2. **Correlated Subquery:**  
   Find all users who have made more than 3 bookings.

## Files
- `subqueries.sql` – Contains the SQL queries.  
- `README.md` – This file explaining the project.

## Example Queries

### Non-Correlated Subquery
```sql
SELECT id AS property_id, name AS property_name
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
