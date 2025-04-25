-- DA Final Project

-- SQL Queries
# Create database
create database DA_Project;

# Use respective database
use DA_Project;

# To display all the data from dataset
SELECT * FROM employee_attendance_productivity_cleaned;

-- Project Tasks
-- SQL: Identify employees with frequent absences .
-- 1. Identify Frequent Absentees

# Displays total no. of employee absent in 3 months
select * from employee_attendance_productivity_cleaned where Status = 'Absent';

# Displays the name , department and total no. of absent count of Employees 
SELECT Name, Department, COUNT(*) as AbsenceCount FROM employee_attendance_productivity_cleaned WHERE Status = 'Absent' 
GROUP BY Department, Name ORDER BY AbsenceCount DESC;

# Displays the total Absences from each department
SELECT Department, COUNT(*) AS TotalAbsences FROM employee_attendance_productivity_cleaned WHERE Status = 'Absent' 
GROUP BY Department ORDER BY TotalAbsences DESC;

# Displays the Absences count of Gender 
SELECT Gender ,COUNT(*) as AbsenceCount FROM employee_attendance_productivity_cleaned WHERE Status = 'Absent' 
GROUP BY Gender ORDER BY AbsenceCount DESC;

# Displays details of absent employees
SELECT Name,Gender,Department,Salary,COUNT(*) AS TotalAbsences FROM employee_attendance_productivity_cleaned WHERE Status = 'Absent' 
GROUP BY Name, Gender, Department, Salary ORDER BY TotalAbsences DESC;


-- SQL: Calculate average hours worked.
-- 2. Calculate average hours worked.

# Display total Average hours worked of all employees
SELECT AVG(HoursWorked) AS Average_Hours_Worked FROM employee_attendance_productivity_cleaned ;

# Display Average hours worked for present employees based on gender
SELECT AVG(HoursWorked) AS Average_Hours_Worked FROM employee_attendance_productivity_cleaned WHERE Gender = 'Female';
SELECT AVG(HoursWorked) AS Average_Hours_Worked FROM employee_attendance_productivity_cleaned WHERE Gender = 'Male';

# Department wise average hours of work
SELECT Department,AVG(HoursWorked) AS Avg_Hours_Worked FROM employee_attendance_productivity_cleaned group by Department;

# Displays Average Hours Worked per Employee based on Gender
SELECT Department, Name, Gender, AVG(HoursWorked) as AverageHoursWorked FROM employee_attendance_productivity_cleaned where Department = 'Engineering' and Gender = 'Male' GROUP BY Department, Name;

# Displays the avg work hour status of present employee with respect to department
SELECT Department,Status,AVG(HoursWorked) AS AvgHoursWorked FROM employee_attendance_productivity_cleaned WHERE Status = 'Present' group by Department;

# Displays the avg work hour status of absent employee with respect to department
SELECT Department,Status,AVG(HoursWorked) AS AvgHoursWorked FROM employee_attendance_productivity_cleaned WHERE Status = 'Absent' group by Department;

# Display all details of employees based on average work hours
SELECT Department,`Employee ID` AS Employee_ID,Name, Salary , Gender,AVG(HoursWorked) AS AverageHoursWorked FROM employee_attendance_productivity_cleaned 
WHERE Status = 'Present' GROUP BY Department, `Employee ID`, Name,Salary,Gender ORDER BY Department, AverageHoursWorked DESC limit 20;
