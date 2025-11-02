-- 1️⃣ INNER JOIN: Retrieve all bookings and their respective users
SELECT 
    b.id AS booking_id,
    u.id AS user_id,
    u.name AS user_name,
    b.property_id,
    b.start_date,
    b.end_date
FROM bookings AS b
INNER JOIN users AS u
ON b.user_id = u.id;

-- 2️⃣ LEFT JOIN: Retrieve all properties and their reviews (including properties with no reviews)
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    r.id AS review_id,
    r.rating,
    r.comment
FROM properties AS p
LEFT JOIN reviews AS r
ON p.id = r.property_id;

-- 3️⃣ FULL OUTER JOIN: Retrieve all users and bookings (even if no booking exists)
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    b.id AS booking_id,
    b.property_id,
    b.start_date
FROM users AS u
FULL OUTER JOIN bookings AS b
ON u.id = b.user_id;
