# 4. Optimize Complex Queries

## Objective
To refactor a complex query that retrieves bookings, user, property, and payment details, improving performance using indexing.

---

## Original Query
```sql
SELECT b.id AS booking_id, u.name AS user_name, p.name AS property_name, pay.amount, pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;
