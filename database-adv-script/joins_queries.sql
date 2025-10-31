-- 1. INNER JOIN
SELECT bookings.id AS booking_id, users.name AS user_name
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

-- 2. LEFT JOIN
SELECT properties.name AS property_name, reviews.review_text
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

-- 3. FULL OUTER JOIN
SELECT users.name AS user_name, bookings.id AS booking_id
FROM users
LEFT JOIN bookings ON users.id = bookings.user_id
UNION
SELECT users.name AS user_name, bookings.id AS booking_id
FROM users
RIGHT JOIN bookings ON users.id = bookings.user_id;
