--1.	How many rows are in the data_analyst_jobs table? 1793

SELECT COUNT (*)
FROM data_analyst_jobs

--2.	Write a query to look at just the first 10 rows. 

SELECT title
FROM data_analyst_jobs
LIMIT 10;

--What company is associated with the job posting on the 10th row?

-- XTO Land Data Analyst

--3.	How many postings are in Tennessee? 

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE (location='TN')

--21

--		How many are there in either Tennessee or Kentucky?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE (location='KY' or location='TN');

--27

--4.	How many postings in Tennessee have a star rating above 4?

SELECT COUNT (star_rating)
FROM data_analyst_jobs
WHERE star_rating>4;

--416

--5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT (review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

--151

--6.	Show the average star rating for companies in each state. 
--		The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_jobs
GROUP BY state
ORDER BY AVG (star_rating) DESC

--Nebraska

--7.	Select unique job titles from the data_analyst_jobs table. 
--		How many are there?

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs

--881

--8.	How many unique job titles are there for California companies?

SELECT COUNT (DISTINCT(TITLE))
FROM data_analyst_jobs
WHERE location='CA'

--230

--9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count>5000 AND company IS NOT null
GROUP BY company

--		How many companies are there with more that 5000 reviews across all locations?

--40

--10.	Add the code to order the query in #9 from highest to lowest average star rating. 

SELECT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count>5000 AND company IS NOT null
GROUP BY company
ORDER BY AVG(star_rating) DESC

--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

--Unilever 4.19

--11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT title
FROM data_analyst_jobs
WHERE UPPER (title) LIKE '%ANALYST%'

--1669=total jobs

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE UPPER (title) LIKE '%ANALYST%'

--774 different(unique) jobs

--12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT(title)
FROM data_analyst_jobs
WHERE UPPER (title) NOT LIKE '%ANALYST%' AND UPPER (title) NOT LIKE '%ANALYTICS%'

--These positions all involve Tableau