# Database Normalization – Airbnb Clone

## Objective
To ensure the database design of the Airbnb clone project is in **Third Normal Form (3NF)** and free from redundancy and update anomalies.

---

## Step 1: First Normal Form (1NF)

**Rule:** Each column should contain atomic values, and each table must have a primary key.

**Before:**
**Issue:** The `amenities` field contained multiple values (e.g., “WiFi, Pool, Parking”).

**After:**
**Issue:** The `amenities` field contained multiple values (e.g., “WiFi, Pool, Parking”).

**After:**
✅ Each attribute now holds a single value.

---

## Step 2: Second Normal Form (2NF)

**Rule:** All non-key attributes must depend on the whole primary key.

**Before:**
**Issue:** `user_name` and `user_email` depend only on `user_id`, not on the full key.

**After:**
✅ Removed partial dependency.

---

## Step 3: Third Normal Form (3NF)

**Rule:** Non-key attributes should not depend on other non-key attributes.

**Before:**
**Issue:** `city` depends on `zipcode`.

**After:**
✅ Removed transitive dependency.

---

## Final Database (in 3NF)

- **User(user_id, name, email, phone)**
- **Property(property_id, host_id, name, zipcode, price)**
- **Location(zipcode, city, country)**
- **Booking(booking_id, user_id, property_id, start_date, end_date, status)**
- **Review(review_id, booking_id, rating, comment)**
- **Payment(payment_id, booking_id, amount, method, status)**
- **PropertyAmenities(property_id, amenity)**

✅ Database is now in **Third Normal Form (3NF)**.
