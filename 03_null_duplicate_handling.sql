--To identify duplicate entries

SELECT state, city, order_date, restaurant_name, location, catagory, 
dish_name, `Price (INR)`, Rating, Rating_count, count (*) as CNT
FROM swiggy_data
GROUP BY state, city, order_date, restaurant_name, location, catagory, 
dish_name, `Price (INR)`, Rating, Rating_count
HAVING count(*) > 1;


--Removing duplicate records using ROW_NUMBER window function but first giving a primary key 'id' to the table.

ALTER TABLE Swiggy_data
ADD COLUMN id BIGINT AUTO_INCREMENT PRIMARY KEY;


DELETE FROM swiggy_data
WHERE id IN (
SELECT id FROM (
SELECT id,
ROW_NUMBER() OVER (PARTITION BY State, City, Order_date, Restaurant_name,
Location, Category, Dish_name, `Price (INR)`,
Rating, Rating_Count ORDER BY id) AS rn
FROM swiggy_data) x
WHERE rn > 1);
