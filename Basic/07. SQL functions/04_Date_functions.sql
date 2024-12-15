/*
Topic: Calculate the Age of All Employees

Purpose:
- This query calculates the current age of each employee based on their birthdate.
- It also formats the `BirthDate` field to exclude the time component for readability.
- Results are ordered by the calculated age in descending order, showing the oldest employees first.

Key Features:
1. **Date Manipulation**:
   - Uses the `strftime` function to extract and format date components.
   - Calculates the age by subtracting the year of birth from the current year.
2. **Result Formatting**:
   - Formats the `BirthDate` field to exclude time components.
   - Includes both the original and formatted birthdate for reference.
3. **Sorting**:
   - Orders the results by age in descending order.

Definitions:
- **Date**: A data type that stores information in various date and time formats.
- **strftime**: A function used to format date and time values in SQLite.

*/

/*
CREATED BY: ABDINASIR MUMIN
CREATED DATE: 12/12/2024
DESCRIPTION: This query calculates the age of all employees and formats their birthdates for display.
*/

-- The SELECT statement retrieves specific columns, calculates age, and formats birthdates:
SELECT 
    FirstName AS "First Name",                         -- Retrieves the first name of the employee and renames the column.
    LastName AS "Last Name",                           -- Retrieves the last name of the employee and renames the column.
    BirthDate AS "Original BirthDate",                 -- Retrieves the original birthdate (with time component).
    -- Formats the birthdate to exclude the time component using the strftime function.
    strftime("%Y/%m/%d", BirthDate) AS "BirthDate (No Timecode)",
    -- Calculates the employee's age by subtracting the birth year from the current year.
    strftime("%Y", 'now') - strftime("%Y", BirthDate) AS "Age"
FROM 
    Employee                                           -- Specifies the Employee table as the data source.
ORDER BY 
    Age DESC;                                          -- Sorts the results by age in descending order.

-- Explanation of the SQL command above:
-- 1. SELECT clause:
--    - Retrieves specific fields from the Employee table:
--      a) `FirstName`: The employee's first name.
--      b) `LastName`: The employee's last name.
--      c) `BirthDate`: The original birthdate, including the time component.
--    - Formats the `BirthDate` field using the `strftime` function:
--      - Syntax: `strftime(format, date)`
--      - `%Y/%m/%d`: Extracts and formats the year, month, and day from the `BirthDate` field.
--      - Example:
--        strftime("%Y/%m/%d", "1985-06-15 10:30:00") => "1985/06/15"
--    - Calculates the employee's age:
--      - Subtracts the year extracted from `BirthDate` from the current year (using `strftime('%Y', 'now')`).
--      - Example:
--        Current Year = 2024, Birth Year = 1985 => Age = 2024 - 1985 = 39
-- 2. FROM clause:
--    - Specifies the Employee table as the source of the data.
-- 3. ORDER BY clause:
--    - Sorts the results by the calculated `Age` column in descending order (oldest employees first).

-- Example of Table Structure:

-- Employee Table:
-- | EmployeeId | FirstName | LastName | BirthDate              |
-- |------------|-----------|----------|------------------------|
-- | 1          | John      | Doe      | 1980-05-20 08:00:00   |
-- | 2          | Jane      | Smith    | 1990-07-15 10:30:00   |
-- | 3          | Mike      | Brown    | 1975-12-01 18:45:00   |

-- After applying the query:
-- | First Name | Last Name | Original BirthDate    | BirthDate (No Timecode) | Age |
-- |------------|-----------|-----------------------|--------------------------|-----|
-- | Mike       | Brown     | 1975-12-01 18:45:00  | 1975/12/01               | 49  |
-- | John       | Doe       | 1980-05-20 08:00:00  | 1980/05/20               | 44  |
-- | Jane       | Smith     | 1990-07-15 10:30:00  | 1990/07/15               | 34  |

-- Explanation of Results:
-- - The `BirthDate (No Timecode)` column displays the formatted birthdate without the time component.
-- - The `Age` column calculates the current age of each employee based on their birth year.
-- - Results are sorted by age in descending order, with the oldest employees listed first.

-- Purpose:
-- This query is useful for:
-- - Generating reports on employee demographics, such as average or oldest employee age.
-- - Organizing employees by age for HR purposes, such as retirement planning.
-- - Standardizing birthdate formats for display in reports.

-- Notes:
-- - Ensure that the `strftime` function is supported in your SQL implementation. For example:
--   - In MySQL, you would use `DATE_FORMAT()` or `YEAR()` for similar functionality.
--   - Example: YEAR(CURDATE()) - YEAR(BirthDate) AS Age
-- - The age calculation assumes that only the year difference is considered. For a more precise calculation (including months and days), additional logic would be required.

-- Alternative Queries:
-- - To include only employees above a certain age:
--   WHERE strftime("%Y", 'now') - strftime("%Y", BirthDate) > 40
-- - To group employees by age range:
--   SELECT Age / 10 * 10 AS AgeRange, COUNT(*) AS EmployeeCount
--   FROM (query) GROUP BY AgeRange;
-- - To display only the youngest employee:
--   ORDER BY Age ASC LIMIT 1;
