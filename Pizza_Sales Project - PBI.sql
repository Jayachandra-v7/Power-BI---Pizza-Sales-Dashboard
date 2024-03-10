Use DB_Practice


select * from [dbo].[pizza_sales$]

--Total Reveune:

Select Sum(total_price) as Total_Revenue from [dbo].[pizza_sales$]

--Tatal Numbers of Orders:

select Sum(total_price)/ count(distinct(order_id)) as Avg_Order_Value from [dbo].[pizza_sales$]

--Total Pizzas Sold:

select sum(quantity) as Total_Pizza_Sold from [dbo].[pizza_sales$]


--Total Number of Order Id's Unique:

select count(distinct(order_id)) as Total_Orders from [dbo].[pizza_sales$]

--Average Pizza per order in deimals:

select cast(cast(sum(quantity)as Decimal(10,2))/Cast(count(distinct(order_id)) as Decimal (10,2)) 
as Decimal (10,2)) as Avg_Pizza_Per_Order from [dbo].[pizza_sales$]

--Daily Trend for Total Orders: 

Select DATENAME(DW, order_date) as Order_Day, Count(Distinct(order_id)) as Total_Orders from [dbo].[pizza_sales$] 
Group by DATENAME(DW, order_date)
Order by DATENAME(DW, order_date) Desc

-- Monthly Trend for Total Oders :

Select Datename(Month, order_date) as Month_Name, count(Distinct order_id) as Total_Oders from [dbo].[pizza_sales$]
Group by Datename(Month, order_date)
Order by count(Distinct order_id) Desc

--Percentage of Sales by Pizza Category :

Select pizza_category, Sum(total_price) as Total_Sales, sum(total_price) *100/ (select sum(total_price) from pizza_sales$  
where Month(order_date) = 1) as Percentage_Total_Sales from pizza_sales$ 
where Month(order_date) = 1
group by pizza_category


--Percentage of Sales by Pizza Size :

Select pizza_size, Cast(Sum(total_price) as Decimal(10,2)) as Total_Sales, cast (sum(total_price) *100/ (select sum(total_price) from pizza_sales$  
where Month(order_date) = 1) as decimal(10,2)) as Percentage_Total_Sales from pizza_sales$ 
where Month(order_date) = 1
group by pizza_size  
Order by  Percentage_Total_Sales  Desc


--Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

Select Top 5 pizza_name, sum([total_price]) as Total_Revenue, count(quantity) as Total_Quantity, count(order_id) as Total_Orders from [dbo].[pizza_sales$]
group by pizza_name
order by sum([total_price]) desc


