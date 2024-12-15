Here’s a cleaned-up and improved version of your note formatted for an `.md` file, with better structure and additional examples:

```markdown
# Understanding Comments in SQL

Comments in SQL are used to include descriptive text in your SQL code. These comments are ignored by the SQL engine and are meant to document your code for better readability and maintainability.

---

## Types of Comments in SQL

### 1. Single-Line Comments
Single-line comments begin with `--` and extend to the end of the line. They are often used to add brief notes or explain individual SQL statements.

**Example:**
```sql
-- This is a single-line comment that describes the following SQL command
SELECT * FROM Employees WHERE Department = 'IT';
```

---

### 2. Multi-Line Comments
Multi-line comments start with `/*` and end with `*/`. These are useful for adding longer descriptions or temporarily disabling blocks of code during debugging.

**Example:**
```sql
/*
This is a multi-line comment that describes the SQL commands below.
The code retrieves employees from the IT department and orders them by their salary.
*/
SELECT * 
FROM Employees 
WHERE Department = 'IT' 
ORDER BY Salary DESC;
```

---

## Practical Example: Documenting Your SQL Code

You can use comments to provide metadata, such as the author of the code, the creation date, and a description of its purpose.

**Example:**
```sql
/*
CREATED BY: Abdinassir Mumin
CREATED DATE: 12/12/2024
DESCRIPTION: This script creates a table for storing employee details
and inserts a few sample records for testing.
*/

-- Create the "Employees" table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert sample data into the "Employees" table
INSERT INTO Employees (EmployeeID, Name, Department, Salary)
VALUES (1, 'John Doe', 'IT', 80000),
       (2, 'Jane Smith', 'Marketing', 75000),
       (3, 'Sam Brown', 'HR', 70000);
```

---

## Benefits of Using Comments

- **Improves Readability**: Helps other developers understand the purpose of your SQL code.
- **Eases Debugging**: Allows you to disable parts of your code without deleting them.
- **Facilitates Collaboration**: Provides context for team members working on the same project.

---
