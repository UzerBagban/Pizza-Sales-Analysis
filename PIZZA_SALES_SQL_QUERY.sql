/*Description of Dataset*/
SELECT * FROM pizza_sales

/*A.	KPI’s
1.	Total Revenue*/
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

/*2.	Average Order Value*/
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales

/*3.	Total Pizza Sold*/
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales

/*4.	Total Orders*/
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales

/*5.	Average Pizza Per Order*/
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/ 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
AS Avg_Pizza_Per_Order FROM pizza_sales

/*B.	CHARTS REQUIREMENT
1.	Daily Trend for Total Orders
*/
SELECT DATENAME(DW, order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)

/*2.	Month Trend for Total Orders*/
SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)

/*3.	Percentage of Sales by Pizza Category*/
SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT_Sales
FROM pizza_sales
GROUP BY pizza_category

/*3.	Percentage of Sales by Pizza Category for Particular Month*/
SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT_Sales
FROM pizza_sales
WHERE MONTH(order_date) = 1		/*For viewing percentage for each month*/
GROUP BY pizza_category

/*4.	Percentage of Sales by Pizza Size*/
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT_Sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT_Sales DESC

/*4.	Percentage of Sales by Pizza Size for Particular Quarter*/
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1) AS DECIMAL(10,2)) AS PCT_Sales
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY PCT_Sales DESC

/*5.	Top 5 Pizza by Revenue*/
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

/*6.	Bottom 5 Pizza by Revenue*/
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

/*7.	Top 5 Pizza by Quantity*/
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

/*8.	Bottom 5 Pizza by Quantity*/
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

/*9.	Top 5 Pizza by Order*/
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

/*10.	Bottom 5 Pizza by Order*/
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

