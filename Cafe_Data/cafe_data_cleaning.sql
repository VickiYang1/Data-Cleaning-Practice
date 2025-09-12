CREATE DATABASE cafe_analysis;
USE cafe_analysis;

SELECT *
FROM dirty_cafe_sales;

UPDATE dirty_cafe_sales
SET `Transaction ID` = SUBSTRING(`Transaction ID`, LOCATE('TXN_', `Transaction ID`) + 4);

SELECT `Transaction ID` AS ID, COUNT(*)
FROM dirty_cafe_sales
GROUP BY ID
HAVING COUNT(*) >1;

SELECT DISTINCT Item
FROM dirty_cafe_sales;

SELECT Item, COUNT(*)
FROM dirty_cafe_sales
WHERE Item = "" OR Item = "UNKNOWN" OR Item = "ERROR"
GROUP BY Item;

DELETE FROM dirty_cafe_sales
WHERE Item = "" OR Item = "UNKNOWN" OR Item = "ERROR";

SELECT DISTINCT Quantity
FROM dirty_cafe_sales;

SELECT DISTINCT `Price Per Unit`
FROM dirty_cafe_sales;

SELECT DISTINCT `Total Spent`
FROM dirty_cafe_sales;

SELECT `Total Spent` AS TS, ITEM, COUNT(*)
FROM dirty_cafe_sales
WHERE `Total Spent` = "" 
   OR `Total Spent` = "UNKNOWN" 
   OR `Total Spent` = "ERROR"
GROUP BY `Total Spent`, ITEM;

UPDATE dirty_cafe_sales
SET `Total Spent` = Quantity * `Price Per Unit`
WHERE `Total Spent` = "" 
   OR `Total Spent` = "UNKNOWN" 
   OR `Total Spent` = "ERROR";
   
SELECT Item, Quantity, `Price Per Unit`, `Total Spent`
FROM dirty_cafe_sales
WHERE `Total Spent` != Quantity *`Price Per Unit`;
   
Select Distinct `Payment Method` AS PM, COUNT(*)
FROM dirty_cafe_sales
GROUP BY PM;

Select Distinct *
FROM dirty_cafe_sales
WHERE `PAYMENT METHOD` = "" OR `PAYMENT METHOD` = "UNKNOWN" OR `PAYMENT METHOD` = "ERROR";

UPDATE dirty_cafe_sales
SET `Payment Method` = "UNKNOWN"
WHERE `PAYMENT METHOD` = "" OR `PAYMENT METHOD` = "ERROR";

SELECT DISTINCT Location, COUNT(*)
FROM dirty_cafe_sales
GROUP BY Location;

UPDATE dirty_cafe_sales
SET `Location` = "UNKNOWN"
WHERE `Location` = "" OR `Location` = "ERROR";

SELECT DISTINCT `Transaction Date`, COUNT(*)
FROM dirty_cafe_sales
GROUP BY `Transaction Date`
HAVING `Transaction Date` NOT REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$';

UPDATE dirty_cafe_sales
SET `Transaction Date` = "UNKNOWN"
WHERE `Transaction Date` = "" OR `Transaction Date` = "ERROR" ;

SELECT *
FROM dirty_cafe_sales;

CREATE TABLE Cleaned_Cafe_Data AS
SELECT *
FROM dirty_cafe_sales;
