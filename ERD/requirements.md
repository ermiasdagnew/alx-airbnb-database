alx-airbnb-database/
└── ERD/
    └── requirements.md
# Airbnb Database ER Diagram

## Objective
This document defines the entities, attributes, and relationships in the Airbnb-like database system.

## Entities
1. **User**
   - user_id (PK)
   - first_name
   - last_name
   - email (unique)
   - password_hash
   - phone_number
   - role (guest, host, admin)
   - created_at

2. **Property**
   - property_id (PK)
   - host_id (FK → User.user_id)
   - name
   - description
   - location
   - price_per_night
   - created_at
   - updated_at

3. **Booking**
   - booking_id (PK)
   - user_id (FK → User.user_id)
   - property_id (FK → Property.property_id)
   - start_date
   - end_date
   - total_price
   - status (pending, confirmed, cancelled)
   - created_at

4. **Payment**
   - payment_id (PK)
   - booking_id (FK → Booking.booking_id)
   - amount
   - payment_date
   - payment_method

5. **Review**
   - review_id (PK)
   - property_id (FK → Property.property_id)
   - user_id (FK → User.user_id)
   - rating (1–5)
   - comment
   - created_at

6. **Message**
   - message_id (PK)
   - sender_id (FK → User.user_id)
   - recipient_id (FK → User.user_id)
   - message_body
   - sent_at

## Relationships
| From Entity | To Entity | Type | Description |
|--------------|------------|------|--------------|
| User | Property | 1 → ∞ | One host can own many properties |
| User | Booking | 1 → ∞ | One user can make many bookings |
| Property | Booking | 1 → ∞ | One property can have many bookings |
| Booking | Payment | 1 → 1 | Each booking has one payment |
| User | Review | 1 → ∞ | One user can write many reviews |
| Property | Review | 1 → ∞ | One property can have many reviews |
| User | Message | 1 → ∞ | A user can send/receive many messages |

## ER Diagram
Attach your ER diagram (exported as PNG from Draw.io) here:

![ER Diagram](./airbnb_erd.png)

## Notes
- Crow’s foot notation is used for relationships.
- Primary keys (PK) uniquely identify each record.
- Foreign keys (FK) connect related entities.
