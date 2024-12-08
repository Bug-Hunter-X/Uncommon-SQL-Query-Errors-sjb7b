```sql
SELECT * FROM employees WHERE department_id = '123' AND salary > 100000;
```

The query above is intended to retrieve all employees from department '123' who earn more than \$100,000.  However, it might fail or produce unexpected results if:

1. **`department_id` is not a string:** If `department_id` is an integer type, using single quotes around '123' will lead to a type mismatch and possibly an error or incorrect results depending on your SQL dialect.  The correct approach is to remove the single quotes.
2. **`salary` is not a numeric type:** Similar to the above, a type mismatch error could occur if `salary` is stored as a string. Conversion functions may be needed if the data is inconsistent.
3. **Case-sensitivity:** If your database uses a case-sensitive collation, the `'123'` might not match a `department_id` that is stored as '123' (or '123'). Ensure case consistency.
4. **Implicit type conversion issues:** Depending on the database system, implicit type conversions can lead to unexpected results. Explicit conversion is preferable.
5. **Incorrect indexing or statistics:**  If there is no index on `department_id` or `salary`, the query may perform very slowly on large datasets.  If statistics are out of date, the query optimizer might choose an inefficient execution plan.
6. **Incorrect data:**  The query may not return the expected results if the data itself is incorrect in the `employees` table (e.g. wrong department IDs, salary values)

These errors can be quite subtle and are often diagnosed by carefully checking data types, database settings, and indexing strategies.