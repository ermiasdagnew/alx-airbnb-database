# Database Schema (DDL) for Airbnb Clone

This directory contains the SQL schema for the Airbnb Clone backend.

## Files
- `schema.sql` — SQL DDL script that creates tables, constraints, and indexes.

## Tables created
- **User** — stores hosts and guests (user_id, name, email, phone).  
- **Location** — zip code, city, country.  
- **Property** — listings owned by hosts (property_id, host_id, zipcode, price).  
- **PropertyAmenities** — amenity list per property (many-to-many style).  
- **Booking** — reservation records (booking dates, status).  
- **Review** — ratings and comments tied to a booking.  
- **Payment** — payments linked to bookings.

## Notes
- Primary keys use `SERIAL` for auto-incrementing ids.  
- Foreign keys enforce relationships and use `ON DELETE CASCADE`.  
- Basic constraints (NOT NULL, UNIQUE, CHECK) ensure data validity.  
- Indexes added for faster lookups on common query columns (user, property, zipcode, email).  
- The schema follows normalization up to 3NF.
