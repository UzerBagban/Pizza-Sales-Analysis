# Pizza Sales Analysis - Power BI Dashboard & SQL Queries

## 📊 Project Overview

This project analyzes pizza sales data to gain insights into business performance through key performance indicators (KPIs) and visualizations. The analysis includes both SQL queries for data extraction and a Power BI dashboard for interactive visualization.

About Dataset

This dataset contain detailed information about pizza orders, including specifics about the pizza variants, quantities, pricing, dates, times, and categorization details.

pizza_id: A unique identifier assigned to each distinct pizza variant available for ordering.

order_id: A unique identifier for each order made, which links to multiple pizzas.

pizza_name_id: An identifier linking to a specific name of the pizza.

quantity: The number of units of a specific pizza variant ordered within an order.

order_date: The date when the order was placed.

order_time: The time when the order was placed.

unit_price: The cost of a single unit of the specific pizza variant.

total_price: The aggregated cost of all units of a specific pizza variant in an order.

pizza_size: Represents the size of the pizza (e.g., small, medium, large).

pizza_category: Indicates the category of the pizza, such as vegetarian, non-vegetarian, etc.

pizza_ingredients: Provides a list or description of the ingredients used in the pizza.

pizza_name: Specifies the name of the specific pizza variant ordered.

## 🎯 Objectives

- Calculate essential business KPIs for pizza sales
- Identify daily and monthly sales trends
- Analyze sales distribution by pizza category and size
- Identify top and bottom performing pizzas across multiple metrics
- Create interactive visualizations for business intelligence

## 🔧 SQL Queries Implemented

### A. Key Performance Indicators (KPIs)

1. **Total Revenue**
   ```sql
   SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
   ```

2. **Average Order Value**
   ```sql
   SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value 
   FROM pizza_sales
   ```

3. **Total Pizzas Sold**
   ```sql
   SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales
   ```

4. **Total Orders**
   ```sql
   SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
   ```

5. **Average Pizzas Per Order**
   ```sql
   SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
   CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) 
   AS Avg_Pizza_Per_Order FROM pizza_sales
   ```

### B. Business Intelligence Queries

1. **Daily Trend for Total Orders**
2. **Monthly Trend for Total Orders**
3. **Percentage of Sales by Pizza Category**
4. **Percentage of Sales by Pizza Size**
5. **Top 5 Pizzas by Revenue**
6. **Bottom 5 Pizzas by Revenue**
7. **Top 5 Pizzas by Quantity**
8. **Bottom 5 Pizzas by Quantity**
9. **Top 5 Pizzas by Total Orders**
10. **Bottom 5 Pizzas by Total Orders**

## 📈 Power BI Dashboard Features

### Visualizations Included:

1. **KPI Cards**
   - Total Revenue
   - Average Order Value
   - Total Pizzas Sold
   - Total Orders
   - Average Pizzas Per Order

2. **Trend Analysis**
   - Daily Trend for Total Orders (Bar Chart)
   - Monthly Trend for Total Orders (Line Chart)

3. **Sales Distribution**
   - Percentage of Sales by Pizza Category (Donut Chart)
   - Percentage of Sales by Pizza Size (Donut Chart)
   - Total Pizzas Sold by Pizza Category (Funnel Chart)

4. **Performance Analysis**
   - Top 5 Best Sellers by Revenue, Quantity, and Orders (Bar Charts)
   - Bottom 5 Worst Sellers by Revenue, Quantity, and Orders (Bar Charts)

## 🛠️ Technologies Used

- **Database**: Microsoft SQL Server
- **BI Tool**: Microsoft Power BI
- **Data Analysis**: SQL Queries
- **Visualization**: Power BI Charts and Dashboards
- **Dataset**: [Pizza Sales Dataset](https://www.kaggle.com/datasets/nextmillionaire/pizza-sales-dataset/data)

## 📋 Prerequisites

To run this project, you need:

1. Microsoft SQL Server
2. Power BI Desktop
3. Pizza sales dataset with the following columns:
   - order_id
   - order_date
   - pizza_name
   - pizza_category
   - pizza_size
   - quantity
   - total_price

## 🚀 Installation & Usage

1. **Database Setup**:
   - Import your pizza sales data into SQL Server
   - Execute the SQL queries from the documentation

3. **Power BI Dashboard**:
   - Open `Pizza_Sales_Dashboard.pbix` in Power BI Desktop
   - Update the data source connection to your database
   - Refresh the data to see updated visualizations

4. **Customization**:
   - Modify SQL queries as per your dataset structure
   - Adjust Power BI visualizations based on business requirements

## 📊 Insights

- Identification of peak sales days and months
- Understanding of customer preferences for pizza categories and sizes
- Recognition of best-performing and underperforming pizza varieties
- Calculation of key business metrics for performance tracking
- Data-driven decision making for inventory and marketing strategies
---

**Note**: Replace the dataset connection in Power BI with your actual pizza sales data source to see the visualizations populated with real data.
