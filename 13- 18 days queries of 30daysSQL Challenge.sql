--Day 13: DIstinct : filters for unique values in a table/column

select *
FROM [Adventureworks].[dbo].[AdventureWorks_Sales_2015]
---returns 2630 rows 

select distinct Occupation
from [Adventureworks].[dbo].[AdventureWorks_Customers]
--returns 5 rows 

select  Occupation
from [Adventureworks].[dbo].[AdventureWorks_Customers]
--returns 18148 rows 

--distinct + order by 
select distinct Occupation, AnnualIncome
from [Adventureworks].[dbo].[AdventureWorks_Customers]
order by AnnualIncome

select *
from [Adventureworks].[dbo].[AdventureWorks_Customers]

--distinct + count 
select count(distinct Occupation)
from [Adventureworks].[dbo].[AdventureWorks_Customers]

---distinct count null values as a unique value 

------aggregate function 
---count: returns the total of all filtered clumn
---query to return the number of records in ocupation column

select count(Occupation)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

--count + distinct 
select count(distinct Occupation)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

---sum : summation of records in a rows 
select sum(AnnualIncome)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

--sum + distinct 
select sum(distinct AnnualIncome)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

--average 
select avg(AnnualIncome)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

--Min 
select min(AnnualIncome)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

--Max
select max(AnnualIncome)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

--day 15:Scalar fx
--uppercase
select upper(Firstname)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

---lowercase
select lower(Firstname)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

---mid
select mid (firstname, 1,3)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

---length
select len(firstname)
from [Adventureworks].[dbo].[AdventureWorks_Customers];

--now
select Now()
from [Adventureworks].[dbo].[AdventureWorks_Customers];
---works in mysq 4.0


--Day 16 : order by 
select Distinct(firstname)
from [Adventureworks].[dbo].[AdventureWorks_Customers]
order by FirstName DESC;

---order by multiple columns
select *
from [Adventureworks].[dbo].[AdventureWorks_Customers]
order by FirstName DESC, Annualincome;

---sorting by column number 
select firstname, Lastname
from [Adventureworks].[dbo].[AdventureWorks_Customers]
order by 1
---the result was sorted based on the first column listed in the select statement i.e order by firstname 

---Day 17, group by 
--query to return sum of total children grouping by occupation 

select Occupation, sum(totalchildren ) as sum
from [Adventureworks].[dbo].[AdventureWorks_Customers]
group by occupation;

--having 
select Occupation, sum(totalchildren ) as sum
from [Adventureworks].[dbo].[AdventureWorks_Customers]
group by occupation
having sum(totalchildren) > 2
order by occupation
order by customerkey

--day 18 Logcal operators: All & ANY 
--query to return all occupation 
select ALL occupation
from [Adventureworks].[dbo].[AdventureWorks_Customers]

---
select ALL firstname, lastname,totalchildren
from [Adventureworks].[dbo].[AdventureWorks_Customers]
where totalchildren >2

--ALL does the same thing * does
---query to return names of customers whose annualincome is greater than average annualincome

-- ALL for comparison 
--a query to return names of customers whose product  ky is <310
select firstname
from [Adventureworks].[dbo].[AdventureWorks_Customers]
where  customerkey = ALL (select[CustomerKey]
from [Adventureworks].[dbo].[AdventureWorks_Sales_2015]
where ProductKey <310)
-- the foreignkey is customer key 

select firstname, customerkey
from [Adventureworks].[dbo].[AdventureWorks_Customers]
group by CustomerKey, FirstName
having min(annualincome) > ALL (
select max (annualincome)
from [Adventureworks].[dbo].[AdventureWorks_Customers])
--order by FirstName asc

--ANY:
--query to return first name and last name of customers 
--with total children = 3
select 
firstname, lastname
-- avg(annualincome)
from [Adventureworks].[dbo].[AdventureWorks_Customers]
where Annualincome = ANY ( select 
annualincome
from [Adventureworks].[dbo].[AdventureWorks_Customers]
where totalchildren = 3)



--Top: to fetch top reords from a data set
this clause is important to use when working with large datasets

select 
top 15 *
from [Adventureworks].[dbo].[AdventureWorks_Customers]

--top + where clause 
select 
top 15 *
from [Adventureworks].[dbo].[AdventureWorks_Customers]
where  educationlevel = 'Bachelors'