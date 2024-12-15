/*
Challenge

Task:
Write SQL that selects track names, composers, and unit prices, and categorizes each track based on its price.

Price Categories:
- Budget: Tracks priced at $0.99 or less.
- Regular: Tracks priced between $1.00 and $1.49.
- Premium: Tracks priced between $1.50 and $1.99.
- Exclusive: Tracks priced above $1.99.

Result:
- A list containing four columns: Name, Composer, UnitPrice, and PriceCategory.
  1. The "Name" field contains a list of track names.
  2. The "Composer" field contains the composer of each track.
  3. The "UnitPrice" field contains the cost of each track.
  4. The "PriceCategory" field contains categories as defined above.
- Results are ordered by UnitPrice in ascending order.

Purpose:
To classify tracks into meaningful pricing categories for analysis or reporting.
*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query selects track names, composers, and unit prices, and categorizes each track into predefined price categories.
*/

-- The SELECT statement retrieves specified columns and applies a CASE statement to categorize prices:
SELECT 
    Name AS "Track Name",               -- Retrieves the name of each track and renames the column to "Track Name."
    Composer AS "Composer",            -- Retrieves the composer of each track and renames the column to "Composer."
    UnitPrice AS "Price",              -- Retrieves the unit price of each track and renames the column to "Price."
    CASE
        WHEN UnitPrice <= 0.99 THEN 'Budget'          -- Classifies prices $0.99 or less as "Budget."
        WHEN UnitPrice BETWEEN 1.00 AND 1.49 THEN 'Regular' -- Classifies prices between $1.00 and $1.49 as "Regular."
        WHEN UnitPrice BETWEEN 1.50 AND 1.99 THEN 'Premium' -- Classifies prices between $1.50 and $1.99 as "Premium."
        ELSE 'Exclusive'                              -- Classifies prices above $1.99 as "Exclusive."
    END AS "PriceCategory"                           -- Renames the resulting column as "PriceCategory."

FROM Track                                          -- Specifies the "Track" table as the data source.

ORDER BY
    UnitPrice ASC;                                  -- Sorts the results by UnitPrice in ascending order (cheapest to most expensive).

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves four columns:
--      a) "Track Name": The name of the track.
--      b) "Composer": The composer of the track.
--      c) "Price": The unit price of the track.
--      d) "PriceCategory": A new column that categorizes tracks based on their price using the CASE statement.
-- 2. CASE statement:
--    - Evaluates the UnitPrice of each track and assigns a category based on the predefined price ranges:
--      a) "Budget" for $0.99 or less.
--      b) "Regular" for prices between $1.00 and $1.49.
--      c) "Premium" for prices between $1.50 and $1.99.
--      d) "Exclusive" for prices above $1.99.
--    - Each track is assigned exactly one category based on these rules.
-- 3. FROM clause:
--    - Specifies the "Track" table as the source of the data.
-- 4. ORDER BY clause:
--    - Ensures the results are sorted by UnitPrice in ascending order, making it easy to analyze tracks from cheapest to most expensive.

-- Example of results:
-- If the "Track" table contains the following data:
-- | Name           | Composer        | UnitPrice |
-- |----------------|-----------------|-----------|
-- | Track A        | Composer X      | 0.99      |
-- | Track B        | Composer Y      | 1.25      |
-- | Track C        | Composer Z      | 1.75      |
-- | Track D        | Composer W      | 2.50      |

-- After applying the query:
-- | Track Name | Composer    | Price | PriceCategory |
-- |------------|-------------|-------|---------------|
-- | Track A    | Composer X  | 0.99  | Budget         |
-- | Track B    | Composer Y  | 1.25  | Regular        |
-- | Track C    | Composer Z  | 1.75  | Premium        |
-- | Track D    | Composer W  | 2.50  | Exclusive      |

-- Purpose:
-- This query is useful for classifying tracks into pricing categories, which can help in:
-- - Identifying trends in pricing.
-- - Creating tiered pricing strategies.
-- - Analyzing and reporting sales data based on track categories.

-- Notes:
-- - The CASE statement is evaluated for each row, ensuring that every track is classified into one of the defined categories.
-- - The ORDER BY clause organizes the output for easier analysis, starting with the cheapest tracks.

-- Alternative Queries:
-- - To focus on a specific price category, add a WHERE clause:
--   WHERE PriceCategory = 'Exclusive'
-- - To group results by category and count the number of tracks in each:
--   SELECT PriceCategory, COUNT(*) AS TrackCount
--   FROM Track
--   GROUP BY PriceCategory;
