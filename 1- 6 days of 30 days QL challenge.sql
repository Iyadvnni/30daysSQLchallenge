--Day 3 
--query to create a database called Adventureworks
CREATE DATABASE Adventureworks;

--used task to import customers table
--confirming data has been imported

select * from  [Adventureworks].[dbo].[AdventureWorks_Customers];

--query to create a table-territories
create table territories(
SalesTerritoryKey INT,	Region VARCHAR,	Country VARCHAR, Continent VARCHAR);

--CONFIRMING TABLE HAS BEEN CREATED 
Select * from territories;

--query to insert data into table 
insert into territories (
SalesTerritoryKey, Region,	Country,	Continent)
Values(1, 'Northwest',	'United States',
'North America');

--query to alter data type to expand no of Varchar characters 
--which was not stated in the create table statement and defauult is 1
ALTER TABLE territories
ALTER COLUMN Region VARCHAR(25);

ALTER TABLE territories
ALTER COLUMN Country VARCHAR (25)

ALTER TABLE territories
ALTER COLUMN Continent VARCHAR (25);

--query to insert data into territories table 
insert into territories (
SalesTerritoryKey, Region,	Country,	Continent)
Values(1, 'Northwest',	'United States',	'North America')

---query to insert multiple rows  
insert into territories (
SalesTerritoryKey, Region,	Country,	Continent)
Values(2, 'Northeast',	'United States', 'North America'),
(3,	'Central',	'United States',	'North America'),
(4,	'Southwest', 'United States',	'North America'),
(5,	'Southeast',	'United States',	'North America'),
(6,	'Canada',	'Canada',	'North America'),
(7,	'France',	'France','Europe'),
(8,	'Germany',	'Germany',	'Europe'),
(9, 'Australia','Australia',	'Pacific'),
(10, 'United Kingdom',	'United Kingdom', 'Europe');


--CONFIRMING TABLE HAS BEEN UPDATED 

Select * from territories

--CREATING A TABLE(Singlecustomer) FROM EXISTING TABLE
select * from  [Adventureworks].[dbo].[AdventureWorks_Customers]

--CREATING SINGLE CUSTOMERS
USE Adventureworks
CREATE TABLE Singlecustomer AS 
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
where MaritalStatus ='S';

--query to confirm Singlecustomer has been created
select * from Singlecustomer;

---Query didn't wort
--create table + limit to limit no of rows
CREATE TABLE Singlecustomer AS SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
limit 10

---SELECT STATEMENT 
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]

--query to fetch specific colums 
select FirstName, LastName from AdventureWorks_Customers

--Select + where clause 
select FirstName, LastName from AdventureWorks_Customers
where Gender = 'F';

--Select + group by clause 
select Count (CustomerKey), Gender from AdventureWorks_Customers
GROUP BY Gender;

--Select + having clause 
--select customers with sum of salary > 100000
select sum( AnnualIncome ), Gender from AdventureWorks_Customers
group by Gender
having sum( AnnualIncome )> 100000;

--Select + order by  clause 
--select customers with Annual salary from hight to low limit to 10 
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
order by AnnualIncome DESC;

--select customers with Annual salary from hight to low limit to 10 
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
order by AnnualIncome;

---WHERE CLAUSE
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
WHERE AnnualIncome = 170000

--WHERE +COMPARISON OPERATOR 
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
WHERE AnnualIncome >160000

--WHERE + BETWEEN OPERATOR 
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
WHERE AnnualIncome BETWEEN 150000 AND 160000

--WHERE + LIKE OPERATOR 
-- Query for first that starts with D
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
WHERE FirstName LIKE 'D%';

--WHERE + LIKE OPERATOR 
-- Query for firstName that  contains T
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
WHERE FirstName LIKE '%T%';


--WHERE + IN OPERATOR 
-- Query for call customers withAnnualIncome such as  110000, 120000
SELECT * from [Adventureworks].[dbo].[AdventureWorks_Customers]
WHERE AnnualIncome IN (110000, 120000)

----DELETE STATEMENT
--Deleting a single record 
Select * from [Adventureworks].[dbo].[territories]

--delete entry with Sales Terrirory key = 10
delete from [Adventureworks].[dbo].[territories]
where SalesTerritoryKey = 10

-----Re-inserting 10 
--insert into  [Adventureworks].[dbo].[territories] (
--SalesTerritoryKey, Region,	Country,	Continent)
--Values
--(10, 'United Kingdom',	'United Kingdom', 'Europe')

--delete all records 
delete from [Adventureworks].[dbo].[territories]
--0r 
--delete * from [Adventureworks].[dbo].[territories]
--the above syntax gives an error in SQL server
--delete is a DML and can be undone or rolled back 
--confirming deletion of 9 rows
Select * from [Adventureworks].[dbo].[territories]

---DAY 5
--INSERT INTO, TWO METHODS (inserting values in specified columns or using select statment
--method 1 
--inserting only values without column namees
insert into [Adventureworks].[dbo].[territories]  Values (1, 'Northwest',	'United States',	'North America')

--Column Names And Values Both
--inserting multiple rows  

insert into [Adventureworks].[dbo].[territories] (
SalesTerritoryKey, Region,	Country,	Continent)
Values(2, 'Northeast',	'United States', 'North America'),
(3,	'Central',	'United States',	'North America'),
(4,	'Southwest', 'United States',	'North America'),
(5,	'Southeast',	'United States',	'North America'),
(6,	'Canada',	'Canada',	'North America'),
(7,	'France',	'France','Europe'),
(8,	'Germany',	'Germany',	'Europe'),
(9, 'Australia','Australia',	'Pacific'),
(10, 'United Kingdom',	'United Kingdom', 'Europe');

--Method 2 (Inserting values in only specified columns) – SQL INSERT INTO Statement
--If we want to insert values in the specified columns then we use the following query:
--this will create a null value in the empty column
insert into [Adventureworks].[dbo].[territories] (
SalesTerritoryKey,	Country,	Continent)
Values(2,	'United States', 'North America')

--Using SELECT in INSERT INTO Statement
--Inserting specific columns of a table – INSERT INTO SELECT Statement 
--creating a new table specifying the database to use
USE Adventureworks
CREATE TABLE Subtable(
SalesTerritoryKey INT ,	Country VARCHAR(20),	Continent varchar(20))

--inserting with a select statement from an existing table 
INSERT INTO Subtable
select SalesTerritoryKey,	Country,	Continent from [Adventureworks].[dbo].[territories]
select * from subtable;

--Method 1 – (Inserting all rows and columns)
--If we want to insert only values then we use the following query:

USE Adventureworks
CREATE TABLE Subtable2 (
SalesTerritoryKey INT ,	Region vARCHAR(20), Country VARCHAR(20),	Continent varchar(20))

--inserting with a select statement from an existing table 
INSERT INTO Subtable2
select * from [Adventureworks].[dbo].[territories]

--confirming data is present 
select * From Subtable2 

--Method 2(Inserting specific columns)
---If we want to insert values in the specified columns then we use the following query:

SQL INSERT INTO SELECT Query:

--INSERT INTO Student(ROLL_NO,NAME,Age) 
--SELECT ROLL_NO, NAME, Age FROM LateralStudent;

--DAY 6
--AND, OR Operator
--select all data with Marital status = M and Gender = F
select * from [dbo].[AdventureWorks_Customers]
where MaritalStatus= 'M' AND Gender = 'F';
--RESULT = 4607 RECORDS

----select all data with GENDER = m AND anNUAINCOME = 12000 
and Firstname contains T
select * from [dbo].[AdventureWorks_Customers]
where AnnualIncome= 170000 AND Gender = 'm'AND FirstName LIKE '%T%' ; 
--RESULT = 17 RECORDS

--OR OPERATOR
--select all data with Marital status = M and Gender = F
select * from [dbo].[AdventureWorks_Customers]
where MaritalStatus= 'M' OR Gender = 'F';
--RESULTS = 14,100 RECORDS

--select all data where  FirstName= 'NATHAN' OR FirstName = 'MATHEW';
select * from [dbo].[AdventureWorks_Customers]
where  FirstName= 'NATHAN' OR FirstName = 'MATHEW';
--RESULTS = 94 RECORDS

--Combining both AND & OR
--fetch all the records from the customerst table where Annual income is 160000  NAME is Last name is Hill or Perry.
select * from [dbo].[AdventureWorks_Customers]
where  AnnualIncome = 120000
AND LastName = 'HIll' OR LastName = 'Gao';

---DROP:used to delete content of a table or database
---To drop a database
---create a database
Create database Sample;

--drop sample database
drop database sample;

--To delete the whole table from the Database
drop table sample;


--TRUNCATE
--create a tale to practice truncate on 
Use Adventureworks
create table territories2(
SalesTerritoryKey INT,	Region VARCHAR(25),	Country VARCHAR(25), Continent VARCHAR(25));

--CONFIRMING TABLE HAS BEEN CREATED 
Select * from territories2

--insert data into table 
insert into territories2 (
SalesTerritoryKey, Region,	Country,	Continent)
Values(1, 'Northwest',	'United States',	'North America')

---inserting multiple rows  
insert into territories2 (
SalesTerritoryKey, Region,	Country,	Continent)
Values(2, 'Northeast',	'United States', 'North America'),
(3,	'Central',	'United States',	'North America'),
(4,	'Southwest', 'United States',	'North America'),
(5,	'Southeast',	'United States',	'North America'),
(6,	'Canada',	'Canada',	'North America'),
(7,	'France',	'France','Europe'),
(8,	'Germany',	'Germany',	'Europe'),
(9, 'Australia','Australia',	'Pacific'),
(10, 'United Kingdom',	'United Kingdom', 'Europe');

--write a query to truncate territoties 2
Truncate table territories2

---truncate is ultra fast and good use for deleting data from temporary table
--it preserves the structure of the table since it doesnt delete the table but
--the contents of the table 

--Not Operator:for selecting all data except what is stated in the condition

--query to select Continent other than North Ameria in Subtable2 table 
select * from [Adventureworks].[dbo].[Subtable2]
where Continent <> 'North America';

--query can also be wrtten as 
select * from [Adventureworks].[dbo].[Subtable2]
where Not Continent ='North America';

--Combining AND, OR and NOT

--query to fetch recorrds where counrty ia not Germany, Francis or Austria 
select * from [Adventureworks].[dbo].[Subtable2]
where country <> 'Germany' AND
country <> 'France' OR country <> 'Australia';
