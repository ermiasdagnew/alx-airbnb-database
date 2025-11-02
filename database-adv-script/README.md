# SQL Aggregations and Window Functions

This directory contains SQL scripts demonstrating aggregation and window functions.

## 1. Total Bookings per User
- Uses `COUNT` and `GROUP BY` to calculate the total number of bookings for each user.
- Orders the results by the total bookings in descending order.

## 2. Rank Properties by Bookings
- Uses a window function (`ROW_NUMBER()`) to assign unique ranks to properties based on total bookings.
- Properties with the same number of bookings get sequential unique ranks.
- Orders the results by rank.

## File List
- **aggregations_and_window_functions.sql** → Contains SQL queries for aggregations and window functions using ROW_NUMBER().
- **README.md** → Explanation of each query.
