-- 1. Drop original Booking table (if it exists) - BACKUP FIRST!
DROP TABLE IF EXISTS Booking CASCADE;

-- 2. Create partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- 3. Create monthly partitions (example: Jan - Mar 2025)
CREATE TABLE Booking_2025_01 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE Booking_2025_02 PARTITION OF Booking
    FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE Booking_2025_03 PARTITION OF Booking
    FOR VALUES FROM ('2025-03-01') TO ('2025-04-01');

-- 4. Sample query on date range to test performance
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2025-01-15' AND '2025-01-31';
