create database COMPANY;
use COMPANY;
select*from sales;
-- find all orders shipped via 'economy' mode with a total amount greater than 25000

select order_id from sales where Ship_Mode='economy' and total_amount>25000; 

 select* from sales where Ship_Mode='economy' and total_amount>25000;
 
 -- retrive all sales data for 'Technology' category in 'Irelad' made after 2020-01-01
 
select * from sales where Category='Technology' and  Country='Ireland' and Order_Date>'01-01-2020'; 

-- list the top 10 most profitable sales transactions in descending order

select * from sales order by Unit_Profit desc limit 10;

select * from sales order by Unit_Profit desc limit 10,20; -- skips 10 records ,showing next 20 records

-- find all customers whose name starts with 'j' and ends with 'n'
select Order_ID,Customer_Name from sales where Customer_Name like'j%n';

-- retrive all product names that contains 'Acco' anywhere in the name

select Order_Id,Product_Name from sales where Product_name like '%Acco%';

-- get the top 5 cities with the higest total sales amount

select City,sum(Total_Amount) as t from sales group by City order by sum(total_amount) desc limit 5;

-- when aggregate functions are used it is beter to use alias names
select City,sum(Total_Amount) from sales group by City order by sum(total_amount) desc limit 5;

-- Dispaly the second set of 10 records for costomers_name and total_amount in decreasing order 

select Customer_name , Total_amount from sales order by Total_Amount desc limit 10,20;

-- find the total revenue ,average unit cost and total amountof orders

select sum(Total_Amount) as  T ,avg(unit_cost) as `Unit Cost`, count(order_id) as `order Id`from sales;   

-- Count unique no of regions

select count(distinct(Region)) as UNI_REG from sales;

-- find no of orders placed by each customer 

select Customer_Name,count(Order_ID) as order_count from sales group by Customer_Name order by order_count desc;


select product_name, sum(total_amount) as total_sales, 
rank() over (order by sum(total_amount) desc) as sales_rank from sales group by product_name limit 5;

