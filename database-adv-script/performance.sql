-- 1️⃣ Initial query: Retrieve all bookings with user, property, and payment details
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.city AS property_city,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM bookings AS b
JOIN users AS u ON b.user_id = u.id
JOIN properties AS p ON b.property_id = p.id
JOIN payments AS pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND pay.status = 'completed';

-- 2️⃣ Analyze initial query performance
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.id AS user_id,
    u.name AS user_name,
    u.email AS user_email,
    p.id AS property_id,
    p.name AS property_name,
    p.city AS property_city,
    pay.id AS payment_id,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM bookings AS b
JOIN users AS u ON b.user_id = u.id
JOIN properties AS p ON b.property_id = p.id
JOIN payments AS pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND pay.status = 'completed';

-- 3️⃣ Optimized query: Include all bookings, even without payments
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.city AS property_city,
    pay.amount AS payment_amount,
    pay.status AS payment_status
FROM bookings AS b
LEFT JOIN users AS u ON b.user_id = u.id
LEFT JOIN properties AS p ON b.property_id = p.id
LEFT JOIN payments AS pay ON b.id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND (pay.status = 'completed' OR pay.status IS NULL);
