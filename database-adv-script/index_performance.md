# Index Performance Analysis

This file demonstrates the impact of adding indexes on query performance.

## Queries Tested
- Query joining `bookings`, `users`, and `properties` filtered by `start_date`.

## Before Indexes
- Used `EXPLAIN ANALYZE` to check the query plan.
- Found full table scans on `bookings` table.

## Indexes Added
- idx_bookings_user_id
- idx_bookings_property_id
- idx_bookings_start_date
- idx_bookings_end_date
- idx_properties_name

## After Indexes
- Query plan now uses index scans.
- Query performance improved significantly.
