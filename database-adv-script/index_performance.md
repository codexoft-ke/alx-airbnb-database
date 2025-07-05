# Index Performance Evaluation

## Why These Indexes?

We created indexes on columns that:
- Are used frequently in JOIN or WHERE clauses (e.g., `user_id`, `property_id`)
- Are involved in filtering (`status`, `start_date`)
- Improve sorting and lookup speed (`pricepernight`, `email`, etc.)

## Performance Before Indexing

Example Query:
```sql
SELECT * FROM Booking WHERE user_id = 'abc-123';
