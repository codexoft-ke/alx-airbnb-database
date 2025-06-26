# Task 0: Entity-Relationship (ER) Diagram Documentation

## Objective

Define entities and relationships based on the Airbnb-like database schema and prepare for ERD visualization.

---

## Entities and Attributes

### 1. **User**

* `user_id`: UUID, Primary Key, Indexed
* `first_name`: VARCHAR, Not Null
* `last_name`: VARCHAR, Not Null
* `email`: VARCHAR, Unique, Not Null
* `password_hash`: VARCHAR, Not Null
* `phone_number`: VARCHAR, Nullable
* `role`: ENUM (guest, host, admin), Not Null
* `created_at`: TIMESTAMP, Default Current Timestamp

### 2. **Property**

* `property_id`: UUID, Primary Key, Indexed
* `host_id`: UUID, Foreign Key → User(user\_id)
* `name`: VARCHAR, Not Null
* `description`: TEXT, Not Null
* `location`: VARCHAR, Not Null
* `pricepernight`: DECIMAL, Not Null
* `created_at`: TIMESTAMP, Default Current Timestamp
* `updated_at`: TIMESTAMP, On Update Current Timestamp

### 3. **Booking**

* `booking_id`: UUID, Primary Key, Indexed
* `property_id`: UUID, Foreign Key → Property(property\_id)
* `user_id`: UUID, Foreign Key → User(user\_id)
* `start_date`: DATE, Not Null
* `end_date`: DATE, Not Null
* `total_price`: DECIMAL, Not Null
* `status`: ENUM (pending, confirmed, canceled), Not Null
* `created_at`: TIMESTAMP, Default Current Timestamp

### 4. **Payment**

* `payment_id`: UUID, Primary Key, Indexed
* `booking_id`: UUID, Foreign Key → Booking(booking\_id)
* `amount`: DECIMAL, Not Null
* `payment_date`: TIMESTAMP, Default Current Timestamp
* `payment_method`: ENUM (credit\_card, paypal, stripe), Not Null

### 5. **Review**

* `review_id`: UUID, Primary Key, Indexed
* `property_id`: UUID, Foreign Key → Property(property\_id)
* `user_id`: UUID, Foreign Key → User(user\_id)
* `rating`: INTEGER, CHECK (1 <= rating <= 5), Not Null
* `comment`: TEXT, Not Null
* `created_at`: TIMESTAMP, Default Current Timestamp

### 6. **Message**

* `message_id`: UUID, Primary Key, Indexed
* `sender_id`: UUID, Foreign Key → User(user\_id)
* `recipient_id`: UUID, Foreign Key → User(user\_id)
* `message_body`: TEXT, Not Null
* `sent_at`: TIMESTAMP, Default Current Timestamp

---

## Relationships

1. **User → Property**

   * One host (User) can list many properties.
   * Relationship: **1\:N** (User to Property via `host_id`)

2. **User → Booking**

   * One guest (User) can make many bookings.
   * Relationship: **1\:N** (User to Booking via `user_id`)

3. **Property → Booking**

   * One property can be booked multiple times.
   * Relationship: **1\:N** (Property to Booking via `property_id`)

4. **Booking → Payment**

   * Each booking has one payment.
   * Relationship: **1:1** (Booking to Payment via `booking_id`)

5. **User ↔ Review ↔ Property**

   * A user can leave many reviews for properties.
   * A property can receive many reviews from users.
   * Relationship: **M\:N** (Implemented via Review table)

6. **User ↔ Message ↔ User**

   * A user can send messages to other users.
   * Relationship: **Recursive 1\:N** (User to User via Message table)
