-- 🧱 Create tables (if not already created)
CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS properties (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS bookings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  property_id INT,
  payment_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (property_id) REFERENCES properties(id)
);

CREATE TABLE IF NOT EXISTS payments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  booking_id INT,
  amount DECIMAL(10,2),
  status VARCHAR(20),
  FOREIGN KEY (booking_id) REFERENCES bookings(id)
);

-- 🧩 Insert sample data
INSERT IGNORE INTO users (id, name) VALUES (1, 'John'), (2, 'Sara'), (3, 'Mike');
INSERT IGNORE INTO properties (id, name) VALUES (1, 'Cozy House'), (2, 'City Apartment');
INSERT IGNORE INTO bookings (id, user_id, property_id, payment_id) VALUES
(1, 1, 1, 1), (2, 2, 2, 2), (3, 3, 1, 3);
INSERT IGNORE INTO payments (id, booking_id, amount, status) VALUES
(1, 1, 120.00, 'Paid'), (2, 2, 150.00, 'Pending'), (3, 3, 80.00, 'Paid');

-- 1️⃣ Original complex query (unoptimized)
EXPLAIN
SELECT b.id AS booking_id, u.name AS user_name, p.name AS property_name, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;

-- 2️⃣ Add indexes to optimize
CREATE INDEX idx_booking_user ON bookings(user_id);
CREATE INDEX idx_booking_property ON bookings(property_id);
CREATE INDEX idx_payment_booking ON payments(booking_id);

-- 3️⃣ Optimized query using the same joins (faster)
EXPLAIN
SELECT b.id AS booking_id, u.name AS user_name, p.name AS property_name, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
