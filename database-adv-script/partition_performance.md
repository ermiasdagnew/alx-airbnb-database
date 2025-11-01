# 5. Partitioning Large Tables

## Objective
To optimize query performance by implementing **table partitioning** on the large `bookings` table based on the `start_date` column.

---

## SQL Implementation

```sql
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
