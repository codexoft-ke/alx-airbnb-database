
-- Use EXPLAIN ANALYZE to observe query performance

-- 1. Query on Booking.user_id
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = 'sample-user-id';

-- 2. Query on Booking.start_date
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';

-- 3. Query on Property.location
EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location = 'Nairobi';

-- 4. Query joining Booking and Property
EXPLAIN ANALYZE
SELECT b.*, p.name
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
WHERE p.pricepernight > 100;


-- Create indexes on high-usage columns

-- Indexes on User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Indexes on Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Indexes on Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Indexes on Review table
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);

-- Indexes on Payment table
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
CREATE INDEX idx_payment_date ON Payment(payment_date);

-- Indexes on Message table
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);

-- ================================
-- SECTION C: AFTER CREATING INDEXES
-- Repeat queries to compare performance improvement
-- ================================

-- 1. Query on Booking.user_id
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE user_id = 'sample-user-id';

-- 2. Query on Booking.start_date
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';

-- 3. Query on Property.location
EXPLAIN ANALYZE
SELECT *
FROM Property
WHERE location = 'Nairobi';

-- 4. Query joining Booking and Property
EXPLAIN ANALYZE
SELECT b.*, p.name
FROM Booking b
JOIN Property p ON b.property_id = p.property_id
WHERE p.pricepernight > 100;

-- ================================================================
-- End of Index Performance Test
-- Compare execution plans and timing before vs. after
-- ================================================================
