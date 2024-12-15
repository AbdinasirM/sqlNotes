/*
SQL Challenge: Uncovering Unpopular Tracks at Red30 Tech

Purpose:
- This query identifies tracks that have never been sold, providing insights to guide decisions on promotions or discontinuations.
- The query includes information about the track, its composer, and its genre for a comprehensive analysis.

Key Features:
1. **Filtering Unpopular Tracks**:
   - The `NOT IN` clause is used to exclude tracks that appear in the `InvoiceLine` table (indicating that they have been sold).
2. **Joining with Genre**:
   - The query joins the `Track` table with the `Genre` table to include genre information for each track.
3. **Using DISTINCT**:
   - The subquery uses the `DISTINCT` keyword to ensure that only unique `TrackId` values from the `InvoiceLine` table are considered.
4. **Result Formatting**:
   - The query retrieves specific fields (`Track ID`, `Track Name`, `Composer`, `Genre`) for tracks that meet the criteria.
5. **Sorting Results**:
   - The results are sorted alphabetically by the `Track Name` column for better readability.

Definitions:
- **NOT IN Clause**: Filters rows by excluding values that appear in a specified set or subquery result.
- **DISTINCT Keyword**: Ensures unique results, eliminating duplicates from the query output.
- **Join**: Combines rows from two or more tables based on a related column.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query retrieves tracks that have never been sold, along with their composers and genres, sorted by track name.
*/

-- Query to Identify Tracks That Have Never Been Sold:
SELECT
    t.TrackId AS "Track ID",               -- Retrieves the unique identifier for each track.
    t.Name AS "Track Name",                -- Retrieves the name of the track.
    t.Composer AS "Composer",              -- Retrieves the composer of the track.
    g.Name AS "Genre"                      -- Retrieves the genre of the track from the Genre table.
FROM
    Track t                                -- Specifies the Track table as the main source.
    JOIN Genre g ON t.GenreId = g.GenreId  -- Joins the Track table with the Genre table on the GenreId column.
WHERE
    t.TrackId NOT IN (                     -- Filters out tracks whose IDs are found in the InvoiceLine table.
        SELECT DISTINCT InvoiceLine.TrackId -- Subquery: Retrieves unique TrackId values from the InvoiceLine table.
        FROM InvoiceLine                   -- Specifies the InvoiceLine table as the subquery source.
    )
ORDER BY
    "Track Name" ASC;                      -- Sorts the results alphabetically by track name.

-- Explanation of the SQL Command Above:
-- 1. SELECT clause:
--    - Retrieves the following fields for tracks that have never been sold:
--      a) `Track ID`: The unique identifier for the track from the Track table.
--      b) `Track Name`: The name of the track from the Track table.
--      c) `Composer`: The composer of the track from the Track table.
--      d) `Genre`: The name of the genre from the Genre table, joined using `GenreId`.
-- 2. FROM clause:
--    - Specifies the Track table (`t`) as the primary source of data.
--    - Joins the Track table with the Genre table (`g`) on the `GenreId` column to retrieve genre information.
-- 3. WHERE clause:
--    - Uses the `NOT IN` operator to exclude tracks that appear in the `InvoiceLine` table.
--    - A subquery retrieves unique `TrackId` values from the `InvoiceLine` table, ensuring only distinct sold tracks are considered.
-- 4. ORDER BY clause:
--    - Sorts the results alphabetically by the track name in ascending order.

-- Example of Table Structure:

-- Track Table:
-- | TrackId | Name           | Composer      | GenreId |
-- |---------|----------------|---------------|---------|
-- | 1       | Song A         | John Doe      | 1       |
-- | 2       | Song B         | Jane Smith    | 2       |
-- | 3       | Song C         | Bob Johnson   | 1       |

-- Genre Table:
-- | GenreId | Name           |
-- |---------|----------------|
-- | 1       | Rock           |
-- | 2       | Classical      |

-- InvoiceLine Table:
-- | InvoiceLineId | TrackId   |
-- |---------------|-----------|
-- | 1             | 1         |
-- | 2             | 2         |

-- After applying the query:
-- | Track ID | Track Name | Composer     | Genre     |
-- |----------|------------|--------------|-----------|
-- | 3        | Song C     | Bob Johnson  | Rock      |

-- Explanation of Results:
-- - The subquery identifies `TrackId` values from the `InvoiceLine` table:
--   - Tracks Sold: 1, 2.
-- - The `NOT IN` clause filters out these IDs from the `Track` table:
--   - Remaining Track: 3.
-- - The outer query joins the Track table with the Genre table to include genre information for the unsold track.

-- Purpose:
-- This query is useful for:
-- - Identifying tracks that have not been sold to inform inventory or marketing strategies.
-- - Generating a detailed report with track name, composer, and genre for better insights.
-- - Supporting decisions on promotions or discontinuations of unsold tracks.

-- Notes:
-- - Ensure that the `DISTINCT` keyword is used in the subquery to avoid duplicate `TrackId` values affecting the results.
-- - The `NOT IN` operator is suitable for excluding a small number of records; for larger datasets, consider using `LEFT JOIN` with a `WHERE IS NULL` condition for better performance.

-- Alternative Queries:
-- - To count the number of unsold tracks:
--   SELECT COUNT(*) AS "Unsold Track Count"
--   FROM Track t
--   WHERE t.TrackId NOT IN (
--       SELECT DISTINCT InvoiceLine.TrackId FROM InvoiceLine
--   );
-- - To retrieve unsold tracks grouped by genre:
--   SELECT g.Name AS "Genre", COUNT(*) AS "Unsold Tracks"
--   FROM Track t
--   JOIN Genre g ON t.GenreId = g.GenreId
--   WHERE t.TrackId NOT IN (
--       SELECT DISTINCT InvoiceLine.TrackId FROM InvoiceLine
--   )
--   GROUP BY g.Name;
