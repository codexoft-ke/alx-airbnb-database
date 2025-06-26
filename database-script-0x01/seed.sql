-- Sample data for User
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('00000000-0000-0000-0000-000000000001', 'John', 'Doe', 'john@example.com', 'hashed_pw_1', '0712345678', 'guest'),
('00000000-0000-0000-0000-000000000002', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_2', '0723456789', 'host'),
('00000000-0000-0000-0000-000000000003', 'Bob', 'Brown', 'bob@example.com', 'hashed_pw_3', NULL, 'admin');

-- Sample data for Property
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000002', 'Cozy Apartment', '2-bedroom apartment with WiFi', 'Nairobi', 50.00),
('11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000002', 'Beach Villa', 'Luxurious villa by the sea', 'Mombasa', 150.00);

-- Sample data for Booking
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
('22222222-2222-2222-2222-222222222221', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', '2025-07-01', '2025-07-05', 200.00, 'confirmed'),
('22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000001', '2025-08-01', '2025-08-04', 450.00, 'pending');

-- Sample data for Payment
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('33333333-3333-3333-3333-333333333331', '22222222-2222-2222-2222-222222222221', 200.00, 'credit_card');

-- Sample data for Review
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('44444444-4444-4444-4444-444444444441', '11111111-1111-1111-1111-111111111111', '00000000-0000-0000-0000-000000000001', 5, 'Great stay, very clean and convenient.'),
('44444444-4444-4444-4444-444444444442', '11111111-1111-1111-1111-111111111112', '00000000-0000-0000-0000-000000000001', 4, 'Beautiful place but a bit noisy at night.');

-- Sample data for Message
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('55555555-5555-5555-5555-555555555551', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Hi, I have a question about your property.'),
('55555555-5555-5555-5555-555555555552', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Sure, feel free to ask!');
