# Task 4: Query Optimization Report

## Objective
Improve performance of a complex query involving joins between Booking, User, Property, and Payment tables.

---

## Initial Query
Used legacy join syntax:
```sql
FROM Booking, User, Property, Payment
WHERE ...
