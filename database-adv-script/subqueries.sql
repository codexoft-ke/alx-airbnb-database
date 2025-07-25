-- 1. Find all properties where the average rating is greater than 4.0
-- Using a non-correlated subquery with GROUP BY
SELECT *
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- 2. Find users who have made more than 3 bookings
-- Using a correlated subquery
SELECT *
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id
) > 3;
