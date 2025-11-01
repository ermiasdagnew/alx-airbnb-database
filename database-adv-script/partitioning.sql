-- 🧱 Drop table if it exists (for testing)
DROP TABLE IF EXISTS bookings;

-- 🧩 Create a large Booking table with partitioning
CREATE TABLE bookings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  property_id INT,
  start_date DATE,
  end_date DATE
)
PARTITION BY RANGE (YEAR(start_date)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- 🧩 Insert sample data
INSERT INTO bookings (user_id, property_id, start_date, end_date) VALUES
(1, 1, '2022-05-10', '2022-05-15'),
(2, 2, '2023-06-11', '2023-06-14'),
(3, 1, '2024-07-20', '2024-07-25'),
(4, 2, '2024-08-01', '2024-08-04');

-- 🔍 Query before partitioning (conceptual)
-- SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 🔍 Query performance after partitioning
EXPLAIN SELECT * FROM bookings WHERE start_date BETWEEN '2023-01-01' AND '2023-12-31';

-- ✅ Verify which partition was scanned
SELECT PARTITION_NAME, TABLE_ROWS
FROM information_schema.partitions
WHERE TABLE_NAME = 'bookings';
