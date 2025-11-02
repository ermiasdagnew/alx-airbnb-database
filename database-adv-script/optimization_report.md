# Query Optimization Report

## Initial Query
- Retrieved all bookings along with user details, property details, and payment details.
- Filtered bookings starting from '2025-01-01' with completed payments (`WHERE b.start_date >= '2025-01-01' AND pay.status = 'completed'`).
- EXPLAIN ANALYZE revealed full table scans and unnecessary data retrieval.

## Identified Inefficiencies
- INNER JOIN on payments could exclude bookings without payments.
- Selecting extra columns not necessary for results.
- Missing indexes on join columns could slow down query.

## Optimized Query
- Converted to LEFT JOINs to include all bookings, even without payments.
- Reduced selected columns to only those needed.
- Ensured join columns (`bookings.user_id`, `bookings.property_id`, `payments.booking_id`) are indexed.
- Maintains the filtering condition for relevant bookings but allows missing payments.

## Results
- Reduced execution time.
- Query plan now uses index scans instead of full table scans.
- All bookings are now included, payments displayed if available.
