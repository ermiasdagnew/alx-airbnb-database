# alx-airbnb-database
Database design for Airbnb clone project
# Airbnb Database ER Diagram

## Objective
This document defines the entities, attributes, and relationships in the Airbnb-like database system.

## Entities

### 1. User
**Primary Key:** user_id  
**Attributes:** first_name, last_name, email (unique), password_hash, phone_number, role (guest, host, admin), created_at

### 2. Property
**Primary Key:** property_id  
**Foreign Key:** host_id → User(user_id)  
**Attributes:** name, description, location, price_per_night, created_at, updated_at

### 3. Booking
**Primary Key:** booking_id  
**Foreign Keys:** property_id → Property(property_id), user_id → User(user_id)  
**Attributes:** start_date, end_date, total_price, status (pending, confirmed, canceled), created_at

### 4. Payment
**Primary Key:** payment_id  
**Foreign Key:** booking_id → Booking(booking_id)  
**Attributes:** amount, payment_date, payment_method (credit_card, paypal, stripe)

### 5. Review
**Primary Key:** review_id  
**Foreign Keys:** property_id → Property(property_id), user_id → User(user_id)  
**Attributes:** rating (1–5), comment, created_at

### 6. Message
**Primary Key:** message_id  
**Foreign Keys:** sender_id → User(user_id), recipient_id → User(user_id)  
**Attributes:** message_body, sent_at

## Relationships
- User (host) → Property (1 to many)
- User (guest) → Booking (1 to many)
- Property → Booking (1 to many)
- Booking → Payment (1 to 1)
- User → Review (1 to many)
- Property → Review (1 to many)
- User → Message (1 to many, as sender/recipient)

## ER Diagram
![ER Diagram](<img width="711" height="622" alt="Airbnb Database ER Diagram drawio" src="https://github.com/user-attachments/assets/a5e2f615-9a2d-44f6-8f7f-11c4e8712b50" />
)
Commit new file
alx-airbnb-database/ERD/requirements.md
