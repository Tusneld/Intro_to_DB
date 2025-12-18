-- task_4.sql
-- Task 4: Full description mandatory

-- The database name will be passed as an argument, so it's referenced in the query.
-- The required method for full description without DESCRIBE/EXPLAIN is querying INFORMATION_SCHEMA.
SELECT 
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'alx_book_store' 
    AND TABLE_NAME = 'Books';