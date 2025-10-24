-- Airbnb Clone Database Schema
-- DDL script: creates tables, constraints, and indexes

-- 1) User table (hosts and guests)
CREATE TABLE "User" (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  phone VARCHAR(20)
);

-- 2) Location table (zipcodes / cities)
CREATE TABLE Location (
  zipcode VARCHAR(10) PRIMARY KEY,
  city VARCHAR(100) NOT NULL,
  country VARCHAR(100) NOT NULL
);

-- 3) Property table (listings)
CREATE TABLE Property (
  property_id SERIAL PRIMARY KEY,
  host_id INT NOT NULL,
  name VARCHAR(150) NOT NULL,
  zipcode VARCHAR(10) NOT NULL,
  price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES "User"(user_id) ON DELETE CASCADE,
  FOREIGN KEY (zipcode) REFERENCES Location(zipcode)
);

-- 4) PropertyAmenities (many amenities per property)
CREATE TABLE PropertyAmenities (
  property_id INT NOT NULL,
  amenity VARCHAR(50) NOT NULL,
  PRIMARY KEY (property_id, amenity),
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE
);

-- 5) Booking (reservation)
CREATE TABLE Booking (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status VARCHAR(20) NOT NULL DEFAULT 'pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES "User"(user_id) ON DELETE CASCADE,
  FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
  CHECK (end_date > start_date)
);

-- 6) Review (for bookings/properties)
CREATE TABLE Review (
  review_id SERIAL PRIMARY KEY,
  booking_id INT NOT NULL,
  rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- 7) Payment (payments for bookings)
CREATE TABLE Payment (
  payment_id SERIAL PRIMARY KEY,
  booking_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL CHECK (amount >= 0),
  method VARCHAR(50),
  status VARCHAR(20) NOT NULL DEFAULT 'pending',
  paid_at TIMESTAMP,
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- Indexes for performance (common lookup columns)
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_property_zipcode ON Property(zipcode);
CREATE INDEX idx_user_email ON "User"(email);
