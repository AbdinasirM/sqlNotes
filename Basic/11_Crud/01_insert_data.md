/*
Topic: Inserting Data into a Database Table

Purpose:
- The `INSERT INTO` statement is used to add new rows to a table in a database.
- This example demonstrates how to insert a value into a specific column of a table using the `INSERT INTO` statement.

Key Features:
1. **Adding Data**:
   - The `INSERT INTO` statement allows users to populate one or more columns in a table with new data.
2. **Specifying Columns**:
   - By listing the target columns, the statement ensures that the inserted data matches the column structure.
3. **Adding Multiple Rows**:
   - The `INSERT INTO` statement can be extended to add multiple rows of data in a single operation.

Definitions:
- **INSERT INTO**: The SQL command used to add data to a table.
- **VALUES**: Specifies the values to be inserted into the columns of the table.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This script demonstrates how to insert data into a database table using the `INSERT INTO` statement.
*/

-- Inserting Data into the `Artist` Table
INSERT INTO
    Artist (Name)                      -- Specifies the `Artist` table and the `Name` column.
VALUES 
    ('Alex Sanches');                  -- Inserts the value 'Alex Sanches' into the `Name` column.

-- Explanation of the SQL Command Above:
-- 1. INSERT INTO:
--    - Indicates that a new row will be added to the `Artist` table.
-- 2. (Name):
--    - Specifies the `Name` column in the `Artist` table where data will be inserted.
-- 3. VALUES:
--    - Contains the value to be inserted into the specified column.
--    - In this example, the string `'Alex Sanches'` is added to the `Name` column.

-- Example of Table Structure:

-- Artist Table (Before INSERT):
-- | ArtistId | Name         |
-- |----------|--------------|
-- | 1        | John Doe     |
-- | 2        | Jane Smith   |

-- After running the INSERT command:
-- Artist Table (After INSERT):
-- | ArtistId | Name         |
-- |----------|--------------|
-- | 1        | John Doe     |
-- | 2        | Jane Smith   |
-- | 3        | Alex Sanches |

-- Purpose:
-- This operation adds a new artist to the database, ensuring the `Artist` table is updated with the latest data.

-- Advanced Usage:

-- 1. Inserting Data into Multiple Columns:
INSERT INTO
    Artist (ArtistId, Name)           -- Specifies multiple columns.
VALUES
    (4, 'Maria Gonzalez');            -- Inserts values into the `ArtistId` and `Name` columns.

-- 2. Inserting Multiple Rows:
INSERT INTO
    Artist (Name)
VALUES 
    ('Carlos Silva'),
    ('Emily White'),
    ('Victor Hugo');                  -- Adds multiple rows in a single `INSERT` statement.

-- Example Result After Multiple Inserts:
-- | ArtistId | Name         |
-- |----------|--------------|
-- | 1        | John Doe     |
-- | 2        | Jane Smith   |
-- | 3        | Alex Sanches |
-- | 4        | Maria Gonzalez |
-- | 5        | Carlos Silva |
-- | 6        | Emily White  |
-- | 7        | Victor Hugo  |

-- 3. Inserting Default Values:
-- If the table includes columns with default values, those columns can be omitted in the `INSERT INTO` statement:
INSERT INTO
    Artist (Name)
VALUES
    ('Default Artist');               -- Only specifies the `Name` column; other columns use their default values.

-- Notes:
-- - Ensure that the data types of the inserted values match the column definitions.
-- - When inserting into all columns, column names can be omitted, but values must be in the correct order:
--   INSERT INTO Artist VALUES (3, 'Alex Sanches');
-- - Use caution when inserting into tables with primary keys to avoid duplicate key errors.

-- Alternative Queries:
-- - To verify the inserted data:
--   SELECT * FROM Artist WHERE Name = 'Alex Sanches';
-- - To count the total number of rows after insertion:
--   SELECT COUNT(*) AS TotalArtists FROM Artist;
-- - To handle duplicate values, consider using `INSERT IGNORE` (if supported by your SQL dialect):
--   INSERT IGNORE INTO Artist (Name) VALUES ('Alex Sanches');
