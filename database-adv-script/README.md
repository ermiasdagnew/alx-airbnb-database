# SQL Join Queries

This directory contains SQL scripts demonstrating different types of JOIN operations in SQL.

## 1. INNER JOIN
- Retrieves all bookings with their corresponding users.
- Only shows results where both a user and a booking exist.

## 2. LEFT JOIN
- Retrieves all properties and their reviews.
- Includes properties that have no reviews (NULL for missing review data).
- Results are ordered by property ID.

## 3. FULL OUTER JOIN
- Retrieves all users and all bookings.
- Includes users without bookings and bookings without users.

## File List
- **joins_queries.sql** → Contains the three JOIN queries, including LEFT JOIN with ORDER BY.
- **README.md** → Explanation of each query.
