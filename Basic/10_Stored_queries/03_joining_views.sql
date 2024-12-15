/*
Topic: Joining Views in SQL

Purpose:
- This query demonstrates how to create a view that combines data from multiple tables using a join.
- By joining the `InvoiceLine` and `Track` tables, the view provides detailed information about invoices and their corresponding tracks.
- The view simplifies complex joins, making the data reusable for future queries.

Key Features:
1. **Combining Data with Joins**:
   - The `INNER JOIN` combines rows from `InvoiceLine` and `Track` based on matching `TrackId` values.
   - Ensures that only matching rows from both tables are included in the result.
2. **Creating a View**:
   - The `CREATE VIEW` statement saves the result of the join as a virtual table that can be reused like a regular table.
3. **Reusability**:
   - The view simplifies querying by abstracting the join logic into a reusable structure.

Definitions:
- **INNER JOIN**: Combines rows from two tables where the join condition is met.
- **View**: A virtual table created by saving a query for repeated use.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This view joins the `InvoiceLine` and `Track` tables to provide detailed information about invoices and tracks.
*/

-- Creating a View with a Join
CREATE VIEW V_Tracks_InvoiceLine AS         -- Defines a view named "V_Tracks_InvoiceLine."
SELECT
    il.InvoiceId,                          -- Retrieves the Invoice ID from the `InvoiceLine` table.
    il.UnitPrice,                          -- Retrieves the Unit Price of the track from the `InvoiceLine` table.
    il.Quantity,                           -- Retrieves the Quantity purchased from the `InvoiceLine` table.
    t.Name AS "Track Name",                -- Retrieves the Track Name from the `Track` table.
    t.Composer AS "Composer",              -- Retrieves the Composer of the track from the `Track` table.
    t.Milliseconds AS "Duration (ms)"      -- Retrieves the duration of the track in milliseconds from the `Track` table.
FROM
    InvoiceLine AS il                      -- Specifies the `InvoiceLine` table as the base table.
INNER JOIN 
    Track AS t                             -- Joins the `Track` table to include track details.
ON
    il.TrackId = t.TrackId;                -- Join condition: Matches `TrackId` in both tables.

-- Explanation of the SQL Command Above:
-- 1. CREATE VIEW:
--    - Defines a view named `V_Tracks_InvoiceLine`.
-- 2. SELECT clause:
--    - Retrieves columns from both `InvoiceLine` and `Track` tables:
--      a) From `InvoiceLine`: `InvoiceId`, `UnitPrice`, `Quantity`.
--      b) From `Track`: `Name`, `Composer`, `Milliseconds`.
--    - Uses aliases (e.g., "Track Name") to provide descriptive column names in the view.
-- 3. FROM clause:
--    - Specifies the `InvoiceLine` table (`il`) as the base table.
-- 4. INNER JOIN:
--    - Joins the `Track` table (`t`) to include additional details about each track.
-- 5. ON clause:
--    - Defines the join condition: Rows are matched where `il.TrackId = t.TrackId`.

-- Querying the View:
-- Once created, the view can be queried like a regular table:
SELECT * FROM V_Tracks_InvoiceLine;

-- Example of Table Structure:

-- InvoiceLine Table:
-- | InvoiceId | TrackId | UnitPrice | Quantity |
-- |-----------|---------|-----------|----------|
-- | 1         | 101     | 1.99      | 2        |
-- | 2         | 102     | 0.99      | 1        |

-- Track Table:
-- | TrackId | Name        | Composer       | Milliseconds |
-- |---------|-------------|----------------|--------------|
-- | 101     | Song A      | John Doe       | 210000       |
-- | 102     | Song B      | Jane Smith     | 180000       |

-- After querying the view:
-- V_Tracks_InvoiceLine:
-- | InvoiceId | UnitPrice | Quantity | Track Name | Composer    | Duration (ms) |
-- |-----------|-----------|----------|------------|-------------|---------------|
-- | 1         | 1.99      | 2        | Song A     | John Doe    | 210000        |
-- | 2         | 0.99      | 1        | Song B     | Jane Smith  | 180000        |

-- Explanation of Results:
-- - The view dynamically combines rows from `InvoiceLine` and `Track` where `TrackId` matches in both tables.
-- - For each invoice line, the view includes detailed track information such as name, composer, and duration.

-- Purpose:
-- This view is useful for:
-- - Simplifying analysis of invoice data with track details.
-- - Abstracting the join logic for reuse in future queries.
-- - Supporting reporting or business insights by combining invoice and track information.

-- Notes:
-- - Views like `V_Tracks_InvoiceLine` are dynamically updated when the underlying tables are modified.
-- - Ensure that the join condition accurately represents the relationship between the tables.

-- Advanced Example:
-- Extending the view to include invoice totals:
CREATE VIEW V_Tracks_InvoiceLineWithTotal AS
SELECT
    il.InvoiceId,
    il.UnitPrice,
    il.Quantity,
    (il.UnitPrice * il.Quantity) AS "Line Total", -- Calculates the total amount for each invoice line.
    t.Name AS "Track Name",
    t.Composer,
    t.Milliseconds AS "Duration (ms)"
FROM
    InvoiceLine AS il
INNER JOIN 
    Track AS t
ON
    il.TrackId = t.TrackId;

-- Querying the Extended View:
SELECT * FROM V_Tracks_InvoiceLineWithTotal;

-- Example Output:
-- | InvoiceId | UnitPrice | Quantity | Line Total | Track Name | Composer    | Duration (ms) |
-- |-----------|-----------|----------|------------|------------|-------------|---------------|
-- | 1         | 1.99      | 2        | 3.98       | Song A     | John Doe    | 210000        |
-- | 2         | 0.99      | 1        | 0.99       | Song B     | Jane Smith  | 180000        |

-- Notes on Advanced Views:
-- - Including calculated fields (e.g., `Line Total`) enhances the usability of views.
-- - Additional joins can further enrich the data for complex reporting needs.

