# Optimization Report

## Objective
To retrieve all bookings along with user, property, and payment details, then analyze and optimize the query for better performance.

---

## Initial Query
The initial query joined four tables: `bookings`, `users`, `properties`, and `payments`.

```sql
SELECT 
    b.booking_id,
    b.booking_date,
    u.user_id,
    u.name AS user_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;
