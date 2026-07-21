-- Create table Country
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population BIGINT,
    Area DECIMAL(10, 2)
);

-- Create table Persons
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population BIGINT,
    Rating DECIMAL(3, 1),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert 10 rows into Country table
INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331000000, 9833520.00),
(2, 'Canada', 37742154, 9984670.00),
(3, 'UK', 67886011, 243610.00),
(4, 'India', 1380004385, 3287263.00),
(5, 'Australia', 25499884, 7692024.00),
(6, 'Germany', 83783942, 357022.00),
(7, 'France', 65273511, 551695.00),
(8, 'Japan', 126476461, 377975.00),
(9, 'Brazil', 212559417, 8515767.00),
(10, 'China', 1439323776, 9596961.00);

-- Insert 10 rows into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'John', 'Doe', 100000, 4.5, 1, 'USA'),
(2, 'Alice', 'Smith', 65000, 3.8, 2, 'Canada'),
(3, 'Bob', 'Johnson', 75000, 4.2, 3, 'UK'),
(4, 'Amit', 'Patel', 150000, 4.9, 4, 'India'),
(5, 'Aarav', 'Sharma', 80000, 3.5, 4, 'India'),
(6, 'Charlie', 'Brown', 45000, 2.9, 1, 'USA'),
(7, 'David', 'Lee', 90000, 4.1, 5, 'Australia'),
(8, 'Emma', 'Watson', 55000, 4.6, 3, 'UK'),
(9, 'Fiona', 'Gallagher', 62000, 3.9, 2, 'Canada'),
(10, 'George', 'Miller', 110000, 4.7, 1, 'USA');


-- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
SELECT SUBSTRING(Country_name, 1, 3) AS Country_name_abbr 
FROM Country;

-- 2. Write an SQL query to count the number of unique country names from Persons table
SELECT COUNT(DISTINCT Country_name) AS unique_countries 
FROM Persons;

-- 3. Write a query to print the maximum population from the Country table.
SELECT MAX(Population) AS max_population 
FROM Country;

-- 4. Write a query to print the minimum population from Persons table.
SELECT MIN(Population) AS min_population 
FROM Persons;

-- 5. List all persons ordered by their rating in descending order. 
SELECT * 
FROM Persons 
ORDER BY Rating DESC;

-- 6. Find the total population for each country in the Persons table.
SELECT Country_name, SUM(Population) AS total_population 
FROM Persons 
GROUP BY Country_name;

-- 7. Find countries in the Persons table with a total population greater than 50,000 
SELECT Country_name, SUM(Population) AS total_population 
FROM Persons 
GROUP BY Country_name 
HAVING SUM(Population) > 50000;

-- 8. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
SELECT Country_name, COUNT(*) AS total_persons, AVG(Rating) AS average_rating 
FROM Persons 
GROUP BY Country_name 
HAVING COUNT(*) > 2 
ORDER BY average_rating ASC;

-- 9. Count the number of persons in each country where Fname starts with 'A'.
SELECT Country_name, COUNT(*) AS persons_count 
FROM Persons 
WHERE Fname LIKE 'A%' 
GROUP BY Country_name;

-- 10. Show the total population of persons in each country and sort by total population in descending order.
SELECT Country_name, SUM(Population) AS total_population 
FROM Persons 
GROUP BY Country_name 
ORDER BY total_population DESC;

-- 11. Display the top 3 countries with the highest average rating. 
SELECT Country_name, AVG(Rating) AS average_rating 
FROM Persons 
GROUP BY Country_name 
ORDER BY average_rating DESC 
LIMIT 3;

-- 12. Display the top 5 countries having the largest total population of persons.
SELECT Country_name, SUM(Population) AS total_population 
FROM Persons 
GROUP BY Country_name 
ORDER BY total_population DESC 
LIMIT 5;

-- 13. Show the top 5 countries having the highest total population where the person's population is greater than 60,000.
SELECT Country_name, SUM(Population) AS total_population 
FROM Persons 
WHERE Population > 60000 
GROUP BY Country_name 
ORDER BY total_population DESC 
LIMIT 5;
