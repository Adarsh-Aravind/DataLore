-- Q1. Create a database named CompanyDB.
CREATE DATABASE CompanyDB;

-- Q2. Use the database.
USE CompanyDB;

-- Q3. Create a table named Employee with the following columns: EmpID, EmpName, Department, Salary, City.
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2),
    City VARCHAR(50)
);

-- Q4. Display the structure of the table.
DESCRIBE Employee;

-- Q5. Add a new column Email.
ALTER TABLE Employee
ADD Email VARCHAR(100);

-- Q6. Modify the EmpName column to VARCHAR(100).
ALTER TABLE Employee
MODIFY EmpName VARCHAR(100);

-- Q7. Rename the column Department to Dept.
ALTER TABLE Employee
RENAME COLUMN Department TO Dept;

-- Q8. Drop the Email column.
ALTER TABLE Employee
DROP COLUMN Email;

-- Q9. Rename the table to EmployeeDetails.
ALTER TABLE Employee
RENAME TO EmployeeDetails;

-- Q10. Insert the following records:
-- (Assuming some sample records based on Q11, Q12, and Q13 since the actual list was empty)
INSERT INTO EmployeeDetails (EmpID, EmpName, Dept, Salary, City) 
VALUES 
(101, 'Neha', 'HR', 45000.00, 'Delhi'),
(102, 'Arun', 'IT', 55000.00, 'Trivandrum'),
(103, 'John', 'Finance', 60000.00, 'Mumbai'),
(104, 'Jane', 'Marketing', 50000.00, 'Chennai');

-- Q11. Update Neha's salary to 48000.
UPDATE EmployeeDetails
SET Salary = 48000.00
WHERE EmpName = 'Neha';

-- Q12. Change Arun's city to Ernakulam.
UPDATE EmployeeDetails
SET City = 'Ernakulam'
WHERE EmpName = 'Arun';

-- Q13. Delete the employee with EmpID = 104.
DELETE FROM EmployeeDetails
WHERE EmpID = 104;
