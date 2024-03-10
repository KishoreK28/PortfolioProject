--Total Revenue

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales  


-- Average Order Value

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value FROM pizza_sales


--Total Pizzas Sold

SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales

--Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

--Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Average_Pizzas_Per_Order  FROM pizza_sales

--Daily Trends on Total Order

SELECT * FROM pizza_sales

SELECT DATENAME(DW, order_date) AS order_day, 
COUNT(DISTINCT order_id) AS Total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

--Monthly Trend on Total Orders

SELECT DATENAME(MONTH, order_date) AS Month_name,
COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC

--Precentage of Sales by Pizza category

SELECT  pizza_category, SUM(total_price) *100 / (SELECT SUM(total_price) from pizza_sales) AS PCT
From pizza_sales 
--WHERE MONTH(order_date) = 1
GROUP BY pizza_category 

--Percentage of Sales by Pizza Size

SELECT  pizza_size, SUM(total_price) *100 / (SELECT SUM(total_price) from pizza_sales) AS PCT
From pizza_sales 
WHERE DATEPART (QUARTER, order_date) =1
GROUP BY pizza_size
ORDER BY PCT DESC

--Top 5 Sellers

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

-- Bottom 5 Sellers

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


-- Top 5 Sellers (Quantity)

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Bottom 5 Sellers (Quantity)

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

--Top 5 Pizzas by Total Orders

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 Pizzas by Total Orders

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

