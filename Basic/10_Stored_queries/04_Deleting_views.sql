/*
Topic: Deleting Views in SQL

Purpose:
- Deleting a view in SQL involves removing its definition from the database.
- This is useful when the view is no longer needed, has become obsolete, or needs to be redefined with updated logic.

Key Features:
1. **Safe Deletion**:
   - The `DROP VIEW IF EXISTS` command ensures that the operation does not throw an error if the view doesn’t exist.
2. **View Independence**:
   - Deleting a view does not affect the underlying tables or data it references, as a view is a virtual table.
3. **Database Maintenance**:
   - Removing unused or outdated views keeps the database clean and reduces confusion for developers and users.

Definitions:
- **View**: A virtual table based on the result set of a query.
- **DROP VIEW**: The SQL command used to delete a view from the database.
- **IF EXISTS**: A clause that prevents errors if the view does not exist.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This script demonstrates how to safely delete views from the database using the `DROP VIEW` command.
*/

-- Deleting a View Safely
DROP VIEW IF EXISTS V_AVGTOTAL; -- Deletes the view named `V_AVGTOTAL` if it exists, avoiding errors.

-- Explanation of the SQL Command Above:
-- 1. DROP VIEW:
--    - The `DROP VIEW` command removes a view from the database.
-- 2. IF EXISTS:
--    - Ensures that the command does not throw an error if the specified view does not exist.
--    - This is particularly useful in automated scripts or environments where the existence of the view is not guaranteed.
-- 3. V_AVGTOTAL:
--    - Specifies the name of the view to be deleted.

-- Use Case Example:
-- Suppose you have a view `V_AVGTOTAL` defined as:
CREATE VIEW V_AVGTOTAL AS
SELECT ROUND(AVG(total), 2) AS "Average Total"
FROM Invoice;

-- After running the DROP VIEW command:
-- - The view `V_AVGTOTAL` will no longer exist in the database.
-- - The underlying `Invoice` table and its data remain unaffected.

-- Advanced Use Case:
-- Deleting Multiple Views:
DROP VIEW IF EXISTS V_AVGTOTAL, V_SALES_SUMMARY, V_CUSTOMER_DETAILS;

-- Explanation:
-- - This command deletes multiple views (`V_AVGTOTAL`, `V_SALES_SUMMARY`, `V_CUSTOMER_DETAILS`) in one operation.
-- - The `IF EXISTS` clause ensures no error is thrown if one or more of the specified views do not exist.

-- Notes:
-- - Views are virtual tables and do not store data; deleting a view does not delete any data.
-- - Ensure you confirm that the view is no longer needed before dropping it, as recreating it requires the original query logic.

-- Alternative Queries:
-- 1. To check if a view exists before deleting:
--    SELECT TABLE_NAME
--    FROM INFORMATION_SCHEMA.VIEWS
--    WHERE TABLE_NAME = 'V_AVGTOTAL';

-- 2. To recreate the view after deleting:
--    CREATE VIEW V_AVGTOTAL AS
--    SELECT ROUND(AVG(total), 2) AS "Average Total"
--    FROM Invoice;
