use namesdb;

-- Table creation.Avoid this query if the table is already created in the database.
create table bNames(                               
Id int  primary key,
Name varchar(50),
Year int,
Gender char(5),
Count int
);

SELECT * FROM dbo.bNames;

 --Find the Most Common Names
SELECT TOP 10 Name, SUM(Count) AS TotalCount     
FROM bNames
GROUP BY Name
ORDER BY TotalCount DESC;


 -- Query to Find the Year with the Highest Number of Births
FROM bNames
SELECT TOP 1 Year, SUM(Count) AS TotalCount       
GROUP BY Year
ORDER BY TotalCount DESC;

 -- simple aggregation to check total number of births in each year
SELECT Year ,SUM(Count) AS TotalCount               
FROM bNames
GROUP BY Year
ORDER BY TotalCount DESC;


 -- Count of Male and Female Names per Year
SELECT Year, Gender, SUM(Count) AS TotalCount      
FROM bNames
GROUP BY Year,Gender
ORDER BY Year ,Gender;


 -- Unique Name Count
SELECT COUNT(DISTINCT Name) as UniqueName         
from bNames;


 -- Top 5 Most Popular Names for Each Year
	SELECT Year, Name, Count                        
	FROM (
		SELECT Year, Name, Count,
			   ROW_NUMBER() OVER (PARTITION BY Year ORDER BY Count DESC) AS Rank
		FROM bNames
	) AS RankedNames
	WHERE Rank <= 5
	ORDER BY Year, Rank;


--Percentage of Male vs. Female Names per Year
SELECT Year, Gender,               
       SUM(Count) * 100.0 / SUM(SUM(Count)) OVER (PARTITION BY Year) AS Percentage
FROM bNames
GROUP BY Year, Gender
ORDER BY Year, Gender;
           

--To see most pupular names in each year during period of 1920 to 2020
WITH YearlyMax AS (
    SELECT Year, Name, Count,
           RANK() OVER (PARTITION BY Year ORDER BY Count DESC) AS rank
    FROM bNames
    WHERE Year BETWEEN 1920 AND 2020
)
SELECT Year, name, Count
FROM YearlyMax
WHERE rank = 1
ORDER BY Year;


--To classify names as classic, semi-classic, semi-trendy

SELECT 
    Name,
	sum(Count) as count,
	CASE
	    WHEN COUNT(*) > 80 THEN 'Classic'
        WHEN COUNT(*) BETWEEN 51 AND 80 THEN 'Semi-Classic'
		WHEN COUNT(*) BETWEEN 21 AND 50 THEN 'Semi-trendy'
		ELSE 'Trendy'
	End AS Popularuty_type
FROM bNames
GROUP BY Name
ORDER BY Name;


--Top-ranked Female Names since 1920
SELECT 
   RANK() OVER (ORDER BY SUM(Count) DESC) AS Name_rank,
   Name,
   SUM(Count) AS Total_count
FROM bNames
WHERE Gender = 'F'
GROUP BY Name
ORDER BY Name_rank;


-- To find a female name ending with letter 'a' and was popular since 2015

SELECT Name
FROM bNames
WHERE Gender ='F' and Year > 2025 and Name LIKE '%a'
GROUP BY Name
ORDER BY SUM(Count) DESC;


--To identify the maximum number of babies given any single male name for each year.
SELECT Year, MAX(Count) AS Max_count
FROM bNames
WHERE Gender = 'M'
GROUP BY Year
ORDER BY Year;


-- To identify most popular male name in each year
SELECT year, name, count
FROM bNames AS bn1
WHERE Gender = 'M'
  AND year BETWEEN 1920 AND 2020
  AND count = (SELECT MAX(count)
               FROM bNames AS bn2
               WHERE bn2.year = bn1.year 
                 AND bn2.Gender = 'M'
                 AND bn2.year BETWEEN 1920 AND 2020)
ORDER BY year;


--To determine the name that held the number one spot for the most years\
WITH YearlyTopNames AS (
    -- Step 1: Identify the most popular male name each year
    SELECT Year, Name, Count,
           RANK() OVER (PARTITION BY Year ORDER BY Count DESC) AS Rank
    FROM bNames
    WHERE Gender = 'M' AND Year BETWEEN 1920 AND 2020
),
NumberOneNames AS (
    -- Step 2: Filter for the names that were ranked number one each year
    SELECT Year, Name
    FROM YearlyTopNames
    WHERE Rank = 1
)
    -- Step 3: Count how many times each name was ranked number one
SELECT TOP 1 Name, COUNT(*) AS YearsAtNumberOne
FROM NumberOneNames
GROUP BY Name
ORDER BY YearsAtNumberOne DESC;














