/*
Task: Generate a report listing track names alongside their unit prices.
Result:
- A list containing two columns: Track Name and Price.
- The "Track Name" field contains a list of track names.
- The "Price" field contains the UnitPrice of each track.
- The result must include only the first 20 tracks, sorted alphabetically by track name.

Purpose of the Query:
To provide a concise report of track names and their prices, sorted alphabetically and limited to 20 results.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query generates a report listing track names alongside their unit prices,
sorted alphabetically by track name, and limited to the first 20 results.
*/

-- The SELECT statement retrieves two columns: Name and UnitPrice.
SELECT 
    Name AS "Track Name",        -- Renames the "Name" column to "Track Name" for clarity.
    UnitPrice AS "Price"         -- Renames the "UnitPrice" column to "Price".
FROM Track                      -- Specifies the "Track" table as the data source.
ORDER BY Name                   -- Sorts the result alphabetically by the "Name" column (Track Name).
LIMIT 20;                       -- Restricts the result set to the first 20 rows.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves the "Name" and "UnitPrice" columns from the "Track" table.
--    - Aliases are applied to rename columns for better readability in the result set.
-- 2. FROM clause:
--    - Specifies that data should be retrieved from the "Track" table.
-- 3. ORDER BY clause:
--    - Sorts the track names in ascending order (A to Z).
--    - Ensures the result set is alphabetically ordered based on the "Name" column.
-- 4. LIMIT clause:
--    - Restricts the result to only 20 rows.
--    - Ensures that the output is concise and manageable.

-- Example of results:
-- If the "Track" table contains the following data:
-- | Name                | UnitPrice |
-- |---------------------|-----------|
-- | Song A              | 0.99      |
-- | Song B              | 1.29      |
-- | Song C              | 0.79      |
-- ... (more tracks)

-- After applying ORDER BY Name and LIMIT 20:
-- | Track Name          | Price     |
-- |---------------------|-----------|
-- | Song A              | 0.99      |
-- | Song B              | 1.29      |
-- | Song C              | 0.79      |
-- ... (up to 20 tracks)

-- Purpose:
-- This query is designed to generate a user-friendly report of tracks and their prices. 
-- It can be used for applications that display a limited, alphabetically sorted list of tracks, 
-- such as an e-commerce store or a music streaming service.

-- Notes:
-- - The ORDER BY clause ensures the results are sorted predictably.
-- - The LIMIT clause makes it suitable for generating previews or paginated results.
-- - For larger datasets, combining this with OFFSET could allow for pagination (e.g., rows 21-40 on the next page).
