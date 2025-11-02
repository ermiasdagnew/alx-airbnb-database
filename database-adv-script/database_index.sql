-- 0️⃣ Measure performance BEFORE adding indexes
EXPLAIN ANALYZE
SELECT b.id, u.name, p.name
FROM bookings AS b
JOIN users AS u ON b.user_id = u.id
JOIN properties AS p ON b.property_id = p.id
WHERE b.start_date >= '2025-01-01';

-- 1️⃣ Create indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_bookings_end_date ON bookings(end_date);
CREATE INDEX idx_properties_name ON properties(name);

-- 2️⃣ Measure performance AFTER adding indexes
EXPLAIN ANALYZE
SELECT b.id, u.name, p.name
FROM bookings AS b
JOIN users AS u ON b.user_id = u.id
JOIN properties AS p ON b.property_id = p.id
WHERE b.start_date >= '2025-01-01';
