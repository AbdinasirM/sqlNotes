/*
Topic: Deleting Data from a Database Table

Purpose:
- The `DELETE` statement is used to remove rows from a table.
- Typically, the `WHERE` clause is included to specify which rows to delete.
- Omitting the `WHERE` clause will delete **all rows** in the table, so caution is required.

Key Features:
1. **Targeted Deletions**:
   - The `WHERE` clause allows for precise deletion of specific rows based on conditions.
2. **Deleting All Rows**:
   - Without a `WHERE` clause, the `DELETE` statement removes every row in the table, leaving the structure intact.
3. **Irreversible Action**:
   - Once rows are deleted, they cannot be retrieved unless a backup exists.

Definitions:
- **DELETE**: The SQL command used to remove rows from a table.
- **WHERE**: Filters rows to apply deletions only to those that meet specified conditions.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This script demonstrates how to delete specific rows from a database table using the `DELETE` statement with a `WHERE` clause.
*/

-- Deleting a Specific Row in the `Artist` Table
DELETE
FROM
    Artist                           -- Specifies the `Artist` table as the target for deletion.
WHERE
    ArtistId = 276;                  -- Deletes only the row where `ArtistId` is 276.

-- Explanation of the SQL Command Above:
-- 1. DELETE:
--    - Specifies that rows from the `Artist` table should be removed.
-- 2. FROM:
--    - Indicates the target table (`Artist`) where the deletion will occur.
-- 3. WHERE:
--    - Filters rows to ensure that only the row with `ArtistId = 276` is deleted.

-- Example of Table Structure:

-- Artist Table (Before DELETE):
-- | ArtistId | Name             |
-- |----------|------------------|
-- | 275      | John Doe         |
-- | 276      | Damien Jackson   |

-- After running the DELETE command:
-- Artist Table (After DELETE):
-- | ArtistId | Name             |
-- |----------|------------------|
-- | 275      | John Doe         |

-- Purpose:
-- This operation removes the row for the artist with `ArtistId = 276`, leaving other rows unaffected.

-- Advanced Usage:

-- 1. Deleting Rows Based on Multiple Conditions:
DELETE
FROM
    Artist
WHERE
    Name = 'Damien Jackson' AND ArtistId = 276;

-- Explanation:
-- - Deletes rows that meet **both conditions**: `Name` is 'Damien Jackson' and `ArtistId` is 276.

-- 2. Deleting All Rows (Without a WHERE Clause):
DELETE
FROM
    Artist;

-- Explanation:
-- - Removes all rows from the `Artist` table but leaves the table structure intact.
-- - Use caution, as this action cannot be undone unless a backup exists.

-- Result After Deleting All Rows:
-- Artist Table:
-- | ArtistId | Name             |
-- |----------|------------------|
-- (Empty Table)

-- 3. Deleting Rows Based on Subqueries:
DELETE
FROM
    Artist
WHERE
    ArtistId IN (
        SELECT ArtistId FROM Artist WHERE Name LIKE 'Damien%'
    );

-- Explanation:
-- - Deletes rows where `ArtistId` matches the result of a subquery that selects `ArtistId` for artists whose names start with 'Damien'.

-- Notes:
-- - Always include a `WHERE` clause to avoid unintended deletions.
-- - Use transactions for critical operations to allow rollback in case of errors:
BEGIN TRANSACTION;

DELETE FROM Artist WHERE ArtistId = 276;

ROLLBACK; -- Undoes the delete operation.

-- Alternative Queries:
-- 1. To count the remaining rows after deletion:
--    SELECT COUNT(*) AS RemainingArtists FROM Artist;
-- 2. To verify that the row was deleted:
--    SELECT * FROM Artist WHERE ArtistId = 276;
-- 3. To delete rows conditionally based on related data:
--    DELETE FROM Artist
--    WHERE ArtistId IN (
--        SELECT ArtistId FROM Album WHERE ReleaseYear < 2000
--    );
