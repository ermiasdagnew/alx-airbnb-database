-- Create tables (if not already created)
CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS bookings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  property_id INT,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS properties (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100)
);

-- Insert sample data
INSERT IGNORE INTO users (id, name) VALUES (1,'John'), (2,'Sara'), (3,'Mike');
INSERT IGNORE INTO properties (id, name) VALUES (1,'Cozy House'), (2,'City Apartment'), (3,'Country Lodge');
INSERT IGNORE INTO bookings (id, user_id, property_id) VALUES
(1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,3,1),(6,3,2),(7,3,3);

-- 1️⃣ Total bookings by each user
SELECT u.id AS user_id, u.name AS user_name, COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

-- 2️⃣ Rank properties based on total bookings
SELECT p.id AS property_id, p.name AS property_name,
       COUNT(b.id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name
ORDER BY booking_rank;
