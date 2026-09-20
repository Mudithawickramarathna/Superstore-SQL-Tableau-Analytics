USE retail_analytics;

SHOW TABLES;
SELECT *
FROM retail_sales
LIMIT 10;
DESCRIBE retail_sales;
SELECT
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS total_customers,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(AVG(Discount), 3) AS average_discount
FROM retail_sales;
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY Category;
-- Query 3: Profit by Category
SELECT
    Category,
    ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY Category;
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY Region
ORDER BY total_profit DESC;
SELECT
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%m/%d/%Y'), '%Y-%m') AS month,
    ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY month
ORDER BY month;

SELECT
    `Product Name`,
    ROUND(SUM(Sales), 2) AS total_sales
FROM retail_sales
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

SELECT
    Segment,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY Segment
ORDER BY total_sales DESC;

-- Query 8: Discount vs Profit
SELECT
    CASE
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.20 THEN 'Low Discount'
        WHEN Discount <= 0.40 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_level,
    ROUND(AVG(Profit), 2) AS average_profit
FROM retail_sales
GROUP BY discount_level
ORDER BY average_profit DESC;

SELECT
    Category,
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity,
    ROUND(AVG(Discount), 3) AS average_discount
FROM retail_sales
GROUP BY Category, Region
ORDER BY total_profit DESC;

DESCRIBE retail_sales;
