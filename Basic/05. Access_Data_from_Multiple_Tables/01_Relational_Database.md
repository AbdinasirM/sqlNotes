/*
Topic: Understanding Joins, Primary Key, and Foreign Key in a Relational Database

Joins:
- Joins are SQL commands that connect fields of two or more tables in a relational database.
- They are used to retrieve data that is spread across multiple related tables.

Primary Key:
- A primary key is a unique identifier for a record in a table.
- It ensures that each row in the table can be uniquely identified.

Foreign Key:
- A foreign key is a field in one table that links to the primary key of another table.
- It establishes a relationship between two tables in a relational database.

Example Scenario:
Imagine a music store database with the following tables:
1. **Albums**: Contains details about music albums.
2. **Artists**: Contains details about artists.
3. **Tracks**: Contains information about individual tracks in albums.

The relationship:
- The **Albums** table has a primary key `AlbumID` and a foreign key `ArtistID` that links to the primary key of the **Artists** table.
- The **Tracks** table has a primary key `TrackID` and a foreign key `AlbumID` that links to the primary key of the **Albums** table.
*/

-- Example of Table Structures:

-- Artists Table:
-- | ArtistID (PK) | ArtistName         |
-- |---------------|--------------------|
-- | 1             | The Beatles        |
-- | 2             | Taylor Swift       |

-- Albums Table:
-- | AlbumID (PK) | AlbumName         | ArtistID (FK) |
-- |--------------|-------------------|---------------|
-- | 1            | Abbey Road        | 1             |
-- | 2            | Folklore          | 2             |

-- Tracks Table:
-- | TrackID (PK) | TrackName          | AlbumID (FK) |
-- |--------------|--------------------|--------------|
-- | 1            | Come Together      | 1            |
-- | 2            | The 1              | 2            |

-- Using Joins to Connect Tables:

-- Task: Retrieve a list of track names, album names, and artist names.

SELECT 
    Tracks.TrackName AS "Track Name",
    Albums.AlbumName AS "Album Name",
    Artists.ArtistName AS "Artist Name"
FROM 
    Tracks
INNER JOIN 
    Albums ON Tracks.AlbumID = Albums.AlbumID  -- Connect Tracks with Albums using AlbumID (FK -> PK).
INNER JOIN 
    Artists ON Albums.ArtistID = Artists.ArtistID  -- Connect Albums with Artists using ArtistID (FK -> PK);

-- Result:
-- | Track Name     | Album Name         | Artist Name    |
-- |----------------|--------------------|----------------|
-- | Come Together  | Abbey Road        | The Beatles    |
-- | The 1          | Folklore          | Taylor Swift   |

-- Explanation of the Query:
-- 1. SELECT clause:
--    - Retrieves the TrackName, AlbumName, and ArtistName fields from the Tracks, Albums, and Artists tables.
-- 2. INNER JOIN:
--    - The first JOIN connects the Tracks table to the Albums table using the AlbumID foreign key.
--    - The second JOIN connects the Albums table to the Artists table using the ArtistID foreign key.
-- 3. Result:
--    - Combines data from all three tables to provide a meaningful output that shows how tracks relate to their albums and artists.

-- Purpose of Joins:
-- - Joins allow you to retrieve combined data from multiple related tables, leveraging relationships defined by primary and foreign keys.
-- - This structure avoids duplication of data and ensures consistency across the database.

-- Notes:
-- - Primary Key ensures each row in a table is unique.
-- - Foreign Key ensures referential integrity by linking related data between tables.
-- - INNER JOIN retrieves only rows with matching values in both tables. Other types of joins (LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN) can be used for different scenarios.
