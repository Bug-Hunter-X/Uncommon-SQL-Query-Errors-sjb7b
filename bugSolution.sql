```sql
SELECT * FROM employees WHERE department_id = 123 AND salary > 100000;
```

This revised query addresses the type mismatch issue by removing the quotes around `123`. This assumes `department_id` is an integer. If it is a string, then the quotes should remain.  It's always best to verify the data type in the table schema.

Further improvements:

* **Explicit type casting:** If there's a chance of inconsistent data types, use explicit casting. For example:
```sql
SELECT * FROM employees WHERE department_id = CAST('123' AS INT) AND CAST(salary AS DECIMAL(19,4)) > 100000;
```
* **Indexing:** Ensure appropriate indexes are created on `department_id` and `salary` columns to improve query performance, especially for larger datasets.
* **Data validation:** Implementing data validation mechanisms to ensure data consistency in the database itself can prevent these types of errors from occurring in the first place.