-- Create tables (for testing, if not already created)
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
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (property_id) REFERENCES properties(id)
);

-- Insert some sample data (ignore errors if already exist)
INSERT IGNORE INTO users (id, name) VALUES (1, 'John'), (2, 'Sara');
INSERT IGNORE INTO properties (id, name) VALUES (1, 'Cozy House'), (2, 'City Apartment');
INSERT IGNORE INTO bookings (id, user_id, property_id) VALUES 
(1, 1, 1), (2, 1, 2), (3, 2, 1);

-- 🔍 Check performance before indexes
EXPLAIN SELECT * FROM bookings 
JOIN users ON bookings.user_id = users.id 
JOIN properties ON bookings.property_id = properties.id;

-- ⚙️ Create indexes to optimize performance
CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);

-- 🔍 Check performance after indexes
EXPLAIN SELECT * FROM bookings 
JOIN users ON bookings.user_id = users.id 
JOIN properties ON bookings.property_id = properties.id;
