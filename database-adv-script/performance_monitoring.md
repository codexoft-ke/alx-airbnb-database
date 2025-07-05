# Task 6: Monitoring and Refining Database Performance

## Objective
Use SQL tools like `EXPLAIN ANALYZE` or `SHOW PROFILE` to monitor slow queries, identify performance bottlenecks, and suggest + apply improvements.

---

## Tools Used

- ✅ `EXPLAIN ANALYZE` – PostgreSQL
- ✅ `SHOW PROFILE` – MySQL (if applicable)
- ✅ PostgreSQL query planner for visualizing execution flow

---

## Query 1: Booking Lookup by User

```sql
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'sample-user-id';
