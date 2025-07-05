-- Unoptimized Query: Using old join style

EXPLAIN ANALYZE
SELECT
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.first_name,
    User.last_name,
    User.email,
    Property.name AS property_name,
    Property.location,
    Payment.amount,
    Payment.payment_date,
    Payment.payment_method
FROM
    Booking,
    User,
    Property,
    Payment
WHERE
    Booking.user_id = User.user_id
    AND Booking.property_id = Property.property_id
    AND Booking.booking_id = Payment.booking_id
    AND Booking.status = 'confirmed';

-- Optimized Query: Using modern INNER JOINs

EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    Booking b
INNER JOIN
    User u ON b.user_id = u.user_id
INNER JOIN
    Property p ON b.property_id = p.property_id
INNER JOIN
    Payment pay ON b.booking_id = pay.booking_id
WHERE
    b.status = 'confirmed';
