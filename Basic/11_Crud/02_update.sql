/*
Topic: Updating Data in a Database Table

Purpose:
- The `UPDATE` statement is used to modify existing data in a table.
- Updates are typically combined with a `WHERE` clause to target specific rows.
- Without a `WHERE` clause, the update applies to all rows in the table, which can lead to unintended changes.

Key Features:
1. **Updating Specific Rows**:
   - The `WHERE` clause filters rows to apply the update only to matching records.
2. **Updating All Rows**:
   - If the `WHERE` clause is omitted, the `UPDATE` statement modifies every row in the table.
3. **Flexibility**:
   - Allows for updating one or more columns with new values.

Definitions:
- **UPDATE**: The SQL command used to modify data in existing rows.
- **SET**: Specifies the column(s) to be updated and their new values.
- **WHERE**: Filters rows to apply updates selectively.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This script demonstrates how to update specific rows in a database table using the `UPDATE` statement.
*/

-- Updating a Specific Row in the `Artist` Table
UPDATE
    Artist                            -- Specifies the `Artist` table to update.
SET
    Name = 'Damien Jackson'           -- Sets the `Name` column to 'Damien Jackson'.
WHERE
    ArtistId = 276;                   -- Filters rows to update only where `ArtistId` is 276.

-- Explanation of the SQL Command Above:
-- 1. UPDATE:
--    - Indicates the table (`Artist`) where data will be updated.
-- 2. SET:
--    - Specifies the column (`Name`) to update and its new value ('Damien Jackson').
-- 3. WHERE:
--    - Filters rows so that only the row with `ArtistId = 276` is updated.
--    - Prevents unintended updates to other rows in the table.

-- Example of Table Structure:

-- Artist Table (Before UPDATE):
-- | ArtistId | Name             |
-- |----------|------------------|
-- | 275      | John Doe         |
-- | 276      | Jane Smith       |

-- After running the UPDATE command:
-- Artist Table (After UPDATE):
-- | ArtistId | Name             |
-- |----------|------------------|
-- | 275      | John Doe         |
-- | 276      | Damien Jackson   |

-- Purpose:
-- This operation modifies the name of the artist with `ArtistId = 276` while leaving other rows unchanged.

-- Advanced Usage:

-- 1. Updating Multiple Columns:
UPDATE
    Artist
SET
    Name = 'Michael Brown',
    Genre = 'Jazz'
WHERE
    ArtistId = 277;

-- Explanation:
-- - Updates both the `Name` and `Genre` columns for the row where `ArtistId = 277`.

-- 2. Updating All Rows (Without WHERE Clause):
UPDATE
    Artist
SET
    Genre = 'Rock';

-- Explanation:
-- - Sets the `Genre` column to 'Rock' for every row in the `Artist` table.
-- - Use caution when omitting the `WHERE` clause, as it applies changes to all rows.

-- Result After Updating All Rows:
-- | ArtistId | Name             | Genre    |
-- |----------|------------------|----------|
-- | 275      | John Doe         | Rock     |
-- | 276      | Damien Jackson   | Rock     |

-- 3. Using Calculations in Updates:
UPDATE
    Invoice
SET
    Total = Total * 1.1               -- Increases the `Total` by 10% for each row.
WHERE
    InvoiceDate > '2024-01-01';

-- Explanation:
-- - Updates the `Total` column by applying a calculation.
-- - The `WHERE` clause filters rows to apply updates only to invoices after January 1, 2024.

-- Notes:
-- - Always test updates on a small subset of data before applying them to the entire table.
-- - Use transactions to ensure that updates can be rolled back if needed:
BEGIN TRANSACTION;

UPDATE Artist
SET Name = 'Temporary Name'
WHERE ArtistId = 276;

ROLLBACK; -- Undoes the update.

-- Alternative Queries:
-- 1. To verify the updated rows:
--    SELECT * FROM Artist WHERE ArtistId = 276;
-- 2. To update rows based on a subquery:
--    UPDATE Artist
--    SET Name = 'Unknown'
--    WHERE ArtistId IN (
--        SELECT ArtistId FROM Artist WHERE Name IS NULL
--    );
