
-- DATA CLEANING
-- STEP 1 : Create another table to work on so I don't mess up the original table.

CREATE TABLE ks_prj
LIKE ks_prj_2018;

INSERT ks_prj
SELECT *
FROM ks_prj_2018;


-- Check if table creation was sucessful.

SELECT *
FROM ks_prj;


-- Check for duplicates

SELECT ID, COUNT(ID)
FROM ks_prj
GROUP BY ID
HAVING COUNT(ID) > 1;


-- There are no duplicates. Let's start to standardize the data.

SELECT *
FROM ks_prj;


-- The deadline and launched dates are in text datatype. I'll change it to date datatype.
-- Alter deadline column from text to date datatype.

ALTER TABLE ks_prj
MODIFY COLUMN deadline date;


-- Repeat for launched column.
-- I only want the date information in the launched column so let's remove the time.

SELECT launched, LEFT(launched, 10)
FROM ks_prj;

UPDATE ks_prj
SET launched = LEFT(launched, 10);

SELECT launched
FROM ks_prj;


-- Alter launched column from text to date datatype.

ALTER TABLE ks_prj
MODIFY COLUMN launched date;

SELECT *
FROM ks_prj;

-- There are different currencies. 
-- For consistency, I want to replace the goal and pledged with the usd_goal_real and usd_pledged_real column.
-- And remove unnecessary columns.

ALTER TABLE ks_prj
DROP COLUMN currency,
DROP COLUMN goal,
DROP COLUMN pledged,
DROP COLUMN `usd pledged`; 

SELECT *
FROM ks_prj;


-- Rename columns

ALTER TABLE ks_prj
RENAME COLUMN usd_pledged_real to pledged_usd,
RENAME COLUMN usd_goal_real to goal_usd;

SELECT *
FROM ks_prj;

-- Shift column position for better visibility.

ALTER TABLE ks_prj
MODIFY COLUMN goal_usd double after main_category;

ALTER TABLE ks_prj
MODIFY COLUMN pledged_usd double after goal_usd;

SELECT *
FROM ks_prj;


-- Check if there are any nulls.

SELECT *
FROM ks_prj
WHERE category IS NULL
OR deadline IS NULL
OR usd_goal_real IS NULL
OR launched IS NULL
OR usd_pledged_real IS NULL
OR state IS NULL
OR backers IS NULL;

SELECT *
FROM ks_prj;




