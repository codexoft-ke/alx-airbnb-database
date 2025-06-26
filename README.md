# Normalization to 3NF

## User
- No redundancy.
- Unique constraint on email.

## Property
- Host_id is a foreign key to User; no derived or transitive dependencies.

## Booking
- Separated total_price to avoid computing on the fly.
- References Property and User properly.

## Payment
- Separate from Booking to maintain single responsibility (only payment-related data).

## Review
- Separate from Booking, linked to User and Property directly.

## Message
- Recursive FK with sender_id and recipient_id to enable direct user-to-user messaging.

All tables meet 1NF, 2NF, and 3NF.
