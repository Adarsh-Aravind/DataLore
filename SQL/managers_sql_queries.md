# SQL Queries for Managers Database

Below are the SQL statements fulfilling all 23 requirements provided for the `Managers` table.

## Table Creation & Data Insertion

**1. Create a table named Managers with the following fields and constraints**
```sql
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT,
    Gender VARCHAR(10),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) CHECK (Salary > 0),
    City VARCHAR(50) DEFAULT 'Kochi',
    Joining_Date DATE
);
```

**2. Insert 10 records into the Managers table.**
```sql
INSERT INTO Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Gender, Department, Salary, City, Joining_Date) VALUES
(1, 'Aarav', 'Nair', '1990-05-15', 34, 'Male', 'IT', 60000.00, 'Trivandrum', '2023-02-10'),
(2, 'Neha', 'Menon', '1985-11-20', 38, 'Female', 'HR', 45000.00, 'Kochi', '2021-06-15'),
(3, 'Rohan', 'Kumar', '1992-08-25', 31, 'Male', 'Finance', 30000.00, 'Calicut', '2024-01-20'),
(4, 'Ananya', 'Pillai', '1995-03-10', 29, 'Female', 'IT', 24000.00, 'Kochi', '2023-11-05'),
(5, 'Vikram', 'Singh', '1988-07-12', 35, 'Male', 'Marketing', 55000.00, 'Trivandrum', '2022-09-01'),
(6, 'Meera', 'Krishnan', '1991-12-05', 32, 'Female', 'Finance', 48000.00, 'Kochi', '2024-03-15'),
(7, 'Arjun', 'Das', '1993-04-18', 31, 'Male', 'IT', 26000.00, 'Calicut', '2023-08-10'),
(8, 'Kavya', 'Mohan', '1989-10-22', 34, 'Female', 'HR', 40000.00, 'Trivandrum', '2021-12-05'),
(9, 'Rahul', 'Varghese', '1987-02-28', 37, 'Male', 'Sales', 32000.00, 'Kochi', '2023-05-20'),
(10, 'Sreya', 'John', '1994-06-14', 29, 'Female', 'IT', 28000.00, 'Kochi', '2024-02-01');
```

## Data Retrieval and Manipulation

**3. Retrieve the first name, last name, and date of birth of the manager whose Manager_Id is 1.**
```sql
SELECT First_Name, Last_Name, DOB 
FROM Managers 
WHERE Manager_Id = 1;
```

**4. Display the annual income of all managers.**
*(Assuming the `Salary` column stores monthly salary based on task #5)*
```sql
SELECT Manager_Id, First_Name, Last_Name, (Salary * 12) AS Annual_Income 
FROM Managers;
```

**5. Display details of managers who belong to the IT department and earn more than ₹25,000 per month.**
```sql
SELECT * 
FROM Managers 
WHERE Department = 'IT' AND Salary > 25000;
```

**6. Update the salary of all managers in the IT department to ₹50,000.**
```sql
UPDATE Managers 
SET Salary = 50000 
WHERE Department = 'IT';
```

**7. Delete the record of the manager whose Manager_Id is 10.**
```sql
DELETE FROM Managers 
WHERE Manager_Id = 10;
```

**8. Display managers whose age is greater than 30.**
```sql
SELECT * 
FROM Managers 
WHERE Age > 30;
```

**9. Display managers who are from Kochi.**
```sql
SELECT * 
FROM Managers 
WHERE City = 'Kochi';
```

**10. Display managers whose salary is less than ₹35,000.**
```sql
SELECT * 
FROM Managers 
WHERE Salary < 35000;
```

**11. Display managers who work in the IT, HR, or Finance departments.**
```sql
SELECT * 
FROM Managers 
WHERE Department IN ('IT', 'HR', 'Finance');
```

**12. Display managers whose city is Kochi, Trivandrum, or Calicut.**
```sql
SELECT * 
FROM Managers 
WHERE City IN ('Kochi', 'Trivandrum', 'Calicut');
```

**13. Display managers whose salary is between ₹30,000 and ₹50,000.**
```sql
SELECT * 
FROM Managers 
WHERE Salary BETWEEN 30000 AND 50000;
```

**14. Display managers whose age is between 25 and 35.**
```sql
SELECT * 
FROM Managers 
WHERE Age BETWEEN 25 AND 35;
```

**15. Display managers who joined between '2023-01-01' and '2024-12-31'.**
```sql
SELECT * 
FROM Managers 
WHERE Joining_Date BETWEEN '2023-01-01' AND '2024-12-31';
```

**16. Display managers whose first name starts with 'A'.**
```sql
SELECT * 
FROM Managers 
WHERE First_Name LIKE 'A%';
```

**17. Display managers whose last name ends with 'n'.**
```sql
SELECT * 
FROM Managers 
WHERE Last_Name LIKE '%n';
```

**18. Display managers whose first name contains the letter 'e'.**
```sql
SELECT * 
FROM Managers 
WHERE First_Name LIKE '%e%';
```

## Aggregate Functions

**19. Find the total salary of all managers.**
```sql
SELECT SUM(Salary) AS Total_Salary 
FROM Managers;
```

**20. Find the average salary of all managers.**
```sql
SELECT AVG(Salary) AS Average_Salary 
FROM Managers;
```

**21. Find the highest salary.**
```sql
SELECT MAX(Salary) AS Highest_Salary 
FROM Managers;
```

**22. Find the lowest salary.**
```sql
SELECT MIN(Salary) AS Lowest_Salary 
FROM Managers;
```

**23. Count the total number of managers.**
```sql
SELECT COUNT(*) AS Total_Managers 
FROM Managers;
```
