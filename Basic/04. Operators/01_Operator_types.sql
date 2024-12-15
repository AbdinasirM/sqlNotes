-- Arithmetic Operators in SQL
/*
Arithmetic operators are used to perform mathematical operations on numeric data in SQL.

- Add (+): Adds two values.
- Subtract (-): Subtracts one value from another.
- Multiply (*): Multiplies two values.
- Divide (/): Divides one value by another.
- Modulo (%): Returns the remainder of a division operation.

Examples:
1. SELECT 10 + 5 AS "Addition";       -- Returns 15.
2. SELECT 10 - 5 AS "Subtraction";   -- Returns 5.
3. SELECT 10 * 5 AS "Multiplication";-- Returns 50.
4. SELECT 10 / 5 AS "Division";      -- Returns 2.
5. SELECT 10 % 3 AS "Modulo";        -- Returns 1 (remainder of 10 ÷ 3).
*/

-- Comparison Operators in SQL
/*
Comparison operators are used to compare two values and return a Boolean result (TRUE or FALSE).

- Equal to (=): Checks if two values are equal.
- Not equal to (<>): Checks if two values are not equal.
- Greater than (>): Checks if the left value is greater than the right value.
- Less than (<): Checks if the left value is less than the right value.
- Greater than or equal to (>=): Checks if the left value is greater than or equal to the right value.
- Less than or equal to (<=): Checks if the left value is less than or equal to the right value.

Examples:
1. SELECT 10 = 10 AS "Equal";         -- Returns TRUE.
2. SELECT 10 <> 5 AS "Not Equal";    -- Returns TRUE.
3. SELECT 10 > 5 AS "Greater Than";  -- Returns TRUE.
4. SELECT 10 < 20 AS "Less Than";    -- Returns TRUE.
5. SELECT 10 >= 10 AS "Greater or Equal"; -- Returns TRUE.
6. SELECT 10 <= 5 AS "Less or Equal"; -- Returns FALSE.
*/

-- Logical Operators in SQL
/*
Logical operators are used to combine multiple conditions in a query or evaluate complex expressions.

- AND: Returns TRUE if all conditions are TRUE.
- OR: Returns TRUE if at least one condition is TRUE.
- IN: Checks if a value exists in a list of values.
- LIKE: Matches a pattern in a string.
- BETWEEN: Checks if a value falls within a range.

Examples:
1. SELECT 10 > 5 AND 5 < 10 AS "Logical AND"; -- Returns TRUE.
2. SELECT 10 > 5 OR 5 > 10 AS "Logical OR";   -- Returns TRUE.
3. SELECT 10 IN (5, 10, 15) AS "Logical IN";  -- Returns TRUE.
4. SELECT 'John' LIKE 'J%' AS "Logical LIKE"; -- Returns TRUE (matches strings starting with 'J').
5. SELECT 15 BETWEEN 10 AND 20 AS "Logical BETWEEN"; -- Returns TRUE.
*/

-- Example Query Using Arithmetic, Comparison, and Logical Operators:
/*
This query calculates discounts for items priced above $50 and categorizes the items based on their prices.

SELECT 
    ItemName,
    Price,
    Price * 0.1 AS "Discount",             -- Calculates 10% discount.
    CASE 
        WHEN Price > 100 THEN 'Expensive'  -- Categorizes items as 'Expensive' if Price > 100.
        WHEN Price BETWEEN 50 AND 100 THEN 'Affordable' -- Categorizes items as 'Affordable' if Price is between 50 and 100.
        ELSE 'Cheap'                       -- Categorizes items as 'Cheap' if Price < 50.
    END AS "Category"
FROM Items
WHERE Price > 50                           -- Filters items with Price greater than 50.
ORDER BY Price DESC;                       -- Sorts items by Price in descending order.
*/

-- Explanation:
-- 1. Arithmetic Operators are used to calculate discounts (`Price * 0.1`).
-- 2. Comparison Operators (`>`, `BETWEEN`) are used to define categories.
-- 3. Logical Operators (`AND`, `WHERE`) combine conditions to filter results.
-- 4. The query returns a table showing ItemName, Price, Discount, and Category for items priced above $50.
