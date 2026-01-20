--Business requirements

-Find the total number of order?

SELECT COUNT(Order_id) FROM fact_swiggy_orders;

-Find the total amount of revenue?

SELECT SUM(`Price (INR)`) as Millions FROM fact_swiggy_orders;

-Find the total amount of revenue in INR Millions?

SELECT CONCAT(FORMAT(SUM(CAST(`Price (INR)` AS DECIMAL(15,2))) / 1000000, 2), ' INR MILLIONS') AS Total_revenue
FROM fact_swiggy_orders;

-Find avg rating?

SELECT AVG (Rating) FROM fact_swiggy_orders;


-Find monthly order trends?

SELECT Month, Month_name, COUNT (Order_id)
FROM fact_swiggy_orders s
JOIN dim_date dd ON  s.Date_id = dd.Date_id
GROUP BY dd.Month, Month_name
ORDER BY dd.Month;

-Find total revenue month wise?

SELECT Month, Month_name, SUM(`Price (INR)`) as Total_Revenue
FROM fact_swiggy_orders s
JOIN dim_date dd ON  s.Date_id = dd.Date_id
GROUP BY dd.Month, Month_name
ORDER BY dd.Month;

-Find Total Revenue Quarter wise?

SELECT Quarter, CONCAT(FORMAT(SUM(CAST(`Price (INR)` AS DECIMAL(15,2))) / 1000000, 2), ' INR MILLIONS') as Total_Revenue
FROM fact_swiggy_orders s
JOIN dim_date dd ON  s.Date_id = dd.Date_id
GROUP BY dd.Quarter
ORDER BY dd.Quarter;

-Find Total revenue Yearly wise?

SELECT Year, CONCAT(FORMAT(SUM(CAST(`Price (INR)` AS DECIMAL(15,2))) / 1000000, 2), ' INR MILLIONS') as Total_Revenue
FROM fact_swiggy_orders s
JOIN dim_date dd ON  s.Date_id = dd.Date_id
GROUP BY dd.Year
ORDER BY dd.Year;

-Find Total revenue week wise?

SELECT Week, CONCAT(FORMAT(SUM(CAST(`Price (INR)` AS DECIMAL(15,2))) / 1000000, 2), ' INR MILLIONS') as Total_Revenue
FROM fact_swiggy_orders s
JOIN dim_date dd ON  s.Date_id = dd.Date_id
GROUP BY dd.Week
ORDER BY dd.Week;

-Find revenue dayname wise?

SELECT Dayname(Order_date), CONCAT(FORMAT(SUM(CAST(`Price (INR)` AS DECIMAL(15,2))) / 1000000, 2), ' INR MILLIONS') as Total_Revenue
FROM fact_swiggy_orders s
JOIN dim_date dd ON  s.Date_id = dd.Date_id
GROUP BY Dayname(Order_date), DAYOFWEEK(Order_date)
ORDER BY DAYOFWEEK(Order_date);

-Find total_revenue of Top 5 cities?

SELECT City, Count(*) FROM 
fact_swiggy_orders s
JOIN dim_location l ON s.Location_id= l.Location_id
GROUP BY l.city
ORDER BY Count(*) DESC
LIMIT 5;

-Find total orders by restaurant names?

SELECT restaurant_name, COUNT(order_id) from fact_swiggy_orders s
JOIN dim_restaurant r ON s.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name;

-Total order by category?

SELECT catagory, COUNT(order_id) from fact_swiggy_orders s
JOIN dim_catagory c ON s.catagory_id = c.catagory_id
GROUP BY c.catagory;

-Find Cuisine Performance?

SELECT catagory, Rating, AVG(Rating), COUNT(order_id) from fact_swiggy_orders s
JOIN dim_catagory c ON s.catagory_id = c.catagory_id
GROUP BY c.catagory, Rating;

-Classify the orders based on price range, of 0-100, 100-199, 200-299, 300-399, 400-499, >500.

SELECT `Price (INR)`, COUNT(ORDER_id) as Total_orders,
CASE WHEN `Price (INR)` < 100 THEN 'Under 100 INR'
WHEN `Price (INR)` < 200 THEN '100-199 INR'
WHEN `Price (INR)` < 300 THEN '200-299 INR'
WHEN `Price (INR)` < 400 THEN '300-399 INR'
WHEN `Price (INR)` < 500 THEN '400-499 INR'
ELSE '500 INR & Above' 
END AS price_range
FROM fact_swiggy_orders
GROUP BY price_range, `Price (INR)`
Order By Total_orders DESC;


