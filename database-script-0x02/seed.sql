-- Seed data for Airbnb Clone

-- 1) Users
INSERT INTO "User" (name, email, phone) VALUES
('Alice Johnson', 'alice@example.com', '123-456-7890'),
('Bob Smith', 'bob@example.com', '234-567-8901'),
('Charlie Lee', 'charlie@example.com', '345-678-9012');

-- 2) Locations
INSERT INTO Location (zipcode, city, country) VALUES
('10001', 'New York', 'USA'),
('94105', 'San Francisco', 'USA'),
('75001', 'Paris', 'France');

-- 3) Properties
INSERT INTO Property (host_id, name, zipcode, price) VALUES
(1, 'Central Park Apartment', '10001', 150.00),
(2, 'Golden Gate Condo', '94105', 200.00),
(3, 'Eiffel Tower View Flat', '75001', 250.00);

-- 4) Property Amenities
INSERT INTO PropertyAmenities (property_id, amenity) VALUES
(1, 'WiFi'), (1, 'Air Conditioning'), (1, 'Kitchen'),
(2, 'WiFi'), (2, 'Parking'), (2, 'Gym'),
(3, 'WiFi'), (3, 'Balcony'), (3, 'Elevator');

-- 5) Bookings
INSERT INTO Booking (user_id, property_id, start_date, end_date, status) VALUES
(2, 1, '2025-11-01', '2025-11-05', 'confirmed'),
(3, 2, '2025-12-10', '2025-12-15', 'pending'),
(1, 3, '2025-12-20', '2025-12-25', 'confirmed');

-- 6) Reviews
INSERT INTO Review (booking_id, rating, comment) VALUES
(1, 5, 'Amazing place! Very clean.'),
(2, 4, 'Great location, but a bit noisy.'),
(3, 5, 'Perfect view of the Eiffel Tower!');

-- 7) Payments
INSERT INTO Payment (booking_id, amount, method, status, paid_at) VALUES
(1, 600.00, 'Credit Card', 'completed', '2025-10-20'),
(2, 1000.00, 'PayPal', 'pending', NULL),
(3, 1250.00, 'Credit Card', 'completed', '2025-10-22');
