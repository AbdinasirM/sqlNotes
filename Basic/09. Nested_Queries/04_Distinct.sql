/*
Topic: Using DISTINCT with Subqueries to Identify Non-Selling Tracks

Purpose:
- This query identifies tracks that are not selling by finding tracks whose `TrackId` does not appear in the `InvoiceLine` table.
- It demonstrates the use of the `DISTINCT` keyword within a subquery to ensure unique results.

Key Features:
1. **DISTINCT Keyword**:
   - Ensures that only unique `TrackId` values are returned by the subquery, eliminating duplicates from the `InvoiceLine` table.
2. **Subquery**:
   - Retrieves a list of `TrackId` values from the `InvoiceLine` table representing tracks that have been sold.
   - The `NOT IN` operator in the outer query then excludes these tracks.
3. **Filtering Non-Selling Tracks**:
   - The outer query fetches tracks from the `Track` table whose `TrackId` values are not in the subquery result.

Definitions:
- **DISTINCT Keyword**: Ensures unique results by removing duplicates from the query output.
- **Subquery**: A query nested within another query, used to calculate intermediate results.
- **NOT IN**: A SQL operator that filters rows by excluding values found in a specified set or subquery result.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query identifies tracks from the Track table that have not been sold, based on data in the InvoiceLine table.
*/

-- Main Query:
SELECT
    TrackId,                                -- Retrieves the unique ID of each track.
    Composer,                               -- Retrieves the composer of the track.
    Name                                   -- Retrieves the name of the track.
FROM
    Track                                  -- Specifies the Track table as the data source.
WHERE
    TrackId NOT IN (                       -- Excludes tracks whose `TrackId` is present in the subquery results.
        SELECT
            DISTINCT TrackId               -- Subquery: Retrieves unique `TrackId` values from the InvoiceLine table.
        FROM
            InvoiceLine                    -- Specifies the InvoiceLine table as the subquery source.
        ORDER BY
            TrackId                        -- Orders the subquery result by `TrackId`.
    );

-- Explanation of the SQL Command Above:
-- 1. SELECT clause (Outer Query):
--    - Retrieves `TrackId`, `Composer`, and `Name` for tracks from the `Track` table that are not selling.
-- 2. WHERE clause (Outer Query):
--    - Filters rows where the `TrackId` is not in the list of unique `TrackId` values returned by the subquery.
-- 3. Subquery:
--    - Fetches distinct `TrackId` values from the `InvoiceLine` table, representing tracks that have been sold.
--    - The `DISTINCT` keyword ensures that each `TrackId` appears only once in the result.
--    - The `ORDER BY TrackId` organizes the subquery results, though it does not affect functionality here.
-- 4. NOT IN clause:
--    - Excludes tracks whose `TrackId` is present in the subquery result, effectively identifying non-selling tracks.

-- Example of Table Structure:

-- Track Table:
-- | TrackId | Composer      | Name            |
-- |---------|---------------|-----------------|
-- | 1       | John Williams | Theme Song A    |
-- | 2       | Hans Zimmer   | Score B         |
-- | 3       | Ennio Morricone| Instrumental C |

-- InvoiceLine Table:
-- | InvoiceLineId | TrackId |
-- |---------------|---------|
-- | 1             | 1       |
-- | 2             | 2       |

-- After applying the query:
-- | TrackId | Composer         | Name           |
-- |---------|------------------|----------------|
-- | 3       | Ennio Morricone  | Instrumental C |

-- Explanation of Results:
-- - The subquery retrieves the distinct `TrackId` values from the `InvoiceLine` table:
--   - TrackId 1: Sold
--   - TrackId 2: Sold
-- - The outer query identifies tracks in the `Track` table whose `TrackId` values are not in this list:
--   - TrackId 3: Not Sold.

-- Purpose:
-- This query is useful for:
-- - Identifying unsold tracks to help focus marketing or promotional efforts.
-- - Analyzing inventory to determine which tracks need attention for sales improvement.
-- - Generating reports for inventory or sales performance.

-- Notes:
-- - The `DISTINCT` keyword ensures that duplicate `TrackId` values in the `InvoiceLine` table do not affect the result.
-- - The `NOT IN` clause is ideal for cases where the subquery produces a list of values to exclude.

-- Alternative Queries:
-- - To identify tracks that are selling:
--   SELECT TrackId, Composer, Name
--   FROM Track
--   WHERE TrackId IN (
--       SELECT DISTINCT TrackId FROM InvoiceLine
--   );
-- - To count the number of unsold tracks:
--   SELECT COUNT(*) AS UnsoldTracks
--   FROM Track
--   WHERE TrackId NOT IN (
--       SELECT DISTINCT TrackId FROM InvoiceLine
--   );
-- - To retrieve unsold tracks sorted by composer:
--   SELECT TrackId, Composer, Name
--   FROM Track
--   WHERE TrackId NOT IN (
--       SELECT DISTINCT TrackId FROM InvoiceLine
--   )
--   ORDER BY Composer;
