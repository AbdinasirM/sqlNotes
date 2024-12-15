/*
Topic: Editing Views in SQL

Purpose:
- This query demonstrates how to edit an existing view in SQL by first dropping it (if it exists) and then recreating it with updated logic.
- Views are virtual tables based on queries and need to be updated or redefined to reflect new requirements.

Key Features:
1. **Dropping a View**:
   - The `DROP VIEW IF EXISTS` command ensures that the view is deleted if it already exists, preventing errors when creating the updated view.
2. **Recreating a View**:
   - The `CREATE VIEW` command redefines the view with the updated query logic.
3. **Dynamic Updates**:
   - A view dynamically reflects changes in the underlying data and query logic, ensuring consistency in results.

Definitions:
- **View**: A virtual table that stores a SQL query for reuse.
- **DROP VIEW IF EXISTS**: Ensures a view is deleted if it exists, avoiding errors during recreation.
- **CREATE VIEW**: Creates or redefines a view in the database.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This script edits the `V_AVGTOTAL` view by redefining its logic to calculate the average total dynamically.
*/

-- Step 1: Drop the Existing View (If It Exists)
DROP VIEW IF EXISTS "main"."V_AVGTOTAL"; -- Deletes the view `V_AVGTOTAL` if it already exists.

-- Step 2: Create the Updated View
CREATE VIEW V_AVGTOTAL AS                 -- Redefines the view `V_AVGTOTAL` with updated logic.
SELECT
    AVG(total) AS "Average Total"        -- Calculates the average total from the Invoice table.
FROM 
    Invoice;                             -- Specifies the Invoice table as the data source.

-- Explanation of the SQL Command Above:
-- 1. DROP VIEW IF EXISTS:
--    - Ensures that the `V_AVGTOTAL` view is deleted if it already exists, preventing errors when recreating it.
-- 2. CREATE VIEW:
--    - Redefines the `V_AVGTOTAL` view using the updated query logic.
-- 3. SELECT clause:
--    - Uses the `AVG` function to calculate the average value of the `total` column in the Invoice table.
--    - Renames the output column to "Average Total" for clarity.
-- 4. FROM clause:
--    - Specifies the `Invoice` table as the data source for the view.

-- Querying the Updated View:
-- Once the view is redefined, it can be queried like a regular table:
SELECT * FROM V_AVGTOTAL;

-- Example of Table Structure:

-- Invoice Table:
-- | InvoiceId | Total  |
-- |-----------|--------|
-- | 1         | 100.00 |
-- | 2         | 200.00 |
-- | 3         | 300.00 |

-- After querying the updated view:
-- V_AVGTOTAL:
-- | Average Total |
-- |---------------|
-- | 200.00        |

-- Explanation of Results:
-- - The view dynamically calculates the average total using the latest data in the `Invoice` table.
-- - If the `Invoice` table is updated (e.g., rows are added or modified), the view will reflect the changes automatically.

-- Purpose:
-- Editing views is useful for:
-- - Reflecting new business logic or reporting requirements in an existing view.
-- - Updating column names, formulas, or filters in the view definition.
-- - Ensuring the view dynamically reflects updated query logic or data.

-- Advanced Example:
-- Editing a view to include a WHERE clause for filtering:
DROP VIEW IF EXISTS V_AVGTOTAL;
CREATE VIEW V_AVGTOTAL AS
SELECT
    AVG(total) AS "Average Total"
FROM 
    Invoice
WHERE
    Total > 150; -- Includes only invoices where the total is greater than 150.

-- Querying the Advanced View:
SELECT * FROM V_AVGTOTAL;

-- Example Output:
-- | Average Total |
-- |---------------|
-- | 250.00        |

-- Notes:
-- - Always use `DROP VIEW IF EXISTS` to avoid errors when recreating views.
-- - Use descriptive column aliases (e.g., "Average Total") for clarity in view outputs.
-- - Test the updated query logic independently before redefining the view.

-- Alternative Approach:
-- Instead of dropping and recreating a view, use `CREATE OR REPLACE VIEW` (if supported by the SQL dialect):
CREATE OR REPLACE VIEW V_AVGTOTAL AS
SELECT
    AVG(total) AS "Average Total"
FROM 
    Invoice;
