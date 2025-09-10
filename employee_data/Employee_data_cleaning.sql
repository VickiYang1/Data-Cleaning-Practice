CREATE DATABASE employee_analysis;
USE employee_analysis;
# Employee_ID, First_Name, Last_Name, 
# Age, Department_Region, Status, 
# Join_Date, Salary, Email, Phone, 
# Performance_Score, Remote_Work
SELECT * 
FROM messy_employee_dataset;

#check for duplicates
SELECT Employee_ID, COUNT(*)
FROM messy_employee_dataset
GROUP BY Employee_ID
HAVING COUNT(*) >1;

#check for missing names
SELECT * 
FROM messy_employee_dataset
WHERE First_Name IS null OR Last_Name IS null
OR First_Name = "" OR Last_Name = "";

#fix missing age data
SELECT * 
FROM messy_employee_dataset
WHERE age IS null or age = "" or age = "N/A";

SELECT 
SUM(CASE WHEN age = "" THEN 1 ELSE 0 END) as total_empty_ages
FROM messy_employee_dataset;

UPDATE messy_employee_dataset
SET age = NULL 
WHERE age IS Null or age = "" or age = "N/A";

#department and region data combined, so we separate
SELECT DISTINCT Department_Region
FROM messy_employee_dataset;

ALTER TABLE messy_employee_dataset
ADD COLUMN Department VARCHAR(100),
ADD COLUMN Region VARCHAR(100);

UPDATE messy_employee_dataset
SET Department = SUBSTRING_INDEX(Department_Region, "-", 1),
	Region = SUBSTRING_INDEX(Department_Region, "-", -1);

ALTER TABLE messy_employee_dataset
DROP COLUMN Department_Region;

SELECT DISTINCT Status
FROM messy_employee_dataset;

SELECT DISTINCT Remote_Work
FROM messy_employee_dataset;

SELECT DISTINCT Performance_Score
FROM messy_employee_dataset;

#fix date format
SELECT STR_TO_DATE(Join_Date, '%m/%d/%Y') AS parsed_date
FROM messy_employee_dataset;

UPDATE messy_employee_dataset
SET Join_Date = STR_TO_DATE(Join_Date, '%m/%d/%Y');

SELECT * 
FROM messy_employee_dataset;

SELECT Salary
FROM messy_employee_dataset
WHERE Salary = "" or Salary = "N/A" or Salary IS NULL;

SELECT Salary
FROM messy_employee_dataset
WHERE Salary NOT REGEXP '^[0-9]+(\\.[0-9]+)?$';

SELECT Email, COUNT(*)
FROM messy_employee_dataset
GROUP BY Email
HAVING COUNT(*)>1;

#change data to correct column types
ALTER TABLE messy_employee_dataset 
MODIFY COLUMN Age INT,
MODIFY COLUMN Salary DECIMAL(10,2);

#change phone format
SELECT Phone
FROM messy_employee_dataset
WHERE Phone NOT REGEXP '^[0-9]{10}$';

UPDATE messy_employee_dataset
SET Phone = SUBSTRING(Phone, 2);

SELECT Phone, LENGTH(Phone) 
FROM messy_employee_dataset
LIMIT 20;

CREATE TABLE Cleaned_Employee_Data AS
SELECT *
FROM messy_employee_dataset;