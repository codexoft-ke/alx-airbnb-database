# Task 5: Partitioning Performance Report

## Objective
Improve performance of large Booking table by partitioning it based on `start_date`.

---

## Partition Strategy

- **Type**: Range Partitioning
- **Column Used**: `start_date`
- **Partitions Created**: Monthly (e.g., Jan, Feb, Mar 2025)
- **Reason**: Queries commonly filter by date range.

---

## Before Partitioning

Query:
```sql
SELECT * FROM Booking WHERE start_date BETWEEN '2025-01-15' AND '2025-01-31';
