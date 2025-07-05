-- 1. Total number of bookings made by each user
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM
    User u
LEFT JOIN
    Booking b ON u.user_id = b.user_id
GROUP BY
    u.user_id, u.first_name, u.last_name
ORDER BY
    total_bookings DESC;

-- 2. Rank properties based on the total number of bookings they have received
-- Using ROW_NUMBER and RANK window functions

-- Subquery to count total bookings per property
WITH property_booking_counts AS (
    SELECT
        p.property_id,
        p.name AS property_name,
        COUNT(b.booking_id) AS total_bookings
    FROM
        Property p
    LEFT JOIN
        Booking b ON p.property_id = b.property_id
    GROUP BY
        p.property_id, p.name
)

-- Applying window functions
SELECT
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number_rank,
    RANK() OVER (ORDER BY total_bookings DESC) AS rank_position
FROM
    property_booking_counts;
