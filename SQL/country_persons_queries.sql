-- 1. Find the number of persons in each country sorted from high to low
SELECT country_name, COUNT(*) AS number_of_persons
FROM Persons
GROUP BY country_name
ORDER BY number_of_persons DESC;

-- 2. Find out an average rating for Persons in respective countries if the average is greater than 3.0
SELECT country_name, AVG(rating) AS average_rating
FROM Persons
GROUP BY country_name
HAVING AVG(rating) > 3.0;

-- 3. Select country_name, area from country order by area desc limit 3
SELECT country_name, area 
FROM country 
ORDER BY area DESC 
LIMIT 3;

-- 4. Display max rating in each country
SELECT country_name, MAX(rating) AS max_rating
FROM Persons
GROUP BY country_name;

-- 5. Count how many persons belong to each country
SELECT country_name, COUNT(*) AS number_of_persons
FROM Persons
GROUP BY country_name;

-- 6. Display total population grouped by country_name from the persons table
SELECT country_name, COUNT(*) AS total_population
FROM Persons
GROUP BY country_name;

-- 7. Find all persons from the countries 'USA', 'Canada', and 'UK'
SELECT *
FROM Persons
WHERE country_name IN ('USA', 'Canada', 'UK');

-- 8. Find all persons not from the countries 'India' and 'Australia'
SELECT *
FROM Persons
WHERE country_name NOT IN ('India', 'Australia');

-- 9. Find all countries with a population between 5 lakhs (500,000) and 20 lakhs (2,000,000)
SELECT *
FROM country
WHERE population BETWEEN 500000 AND 2000000;

-- 10. Find all countries whose names do not start with 'C'
SELECT *
FROM country
WHERE country_name NOT LIKE 'C%';

-- 11. List the distinct country names from the Persons table
SELECT DISTINCT country_name
FROM Persons;
