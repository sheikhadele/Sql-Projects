--This is to check the NULL values.

SELECT
SUM (CASE WHEN State IS NULL THEN 1 ELSE 0 END) as Null_state,
SUM (CASE WHEN City IS NULL THEN 1 ELSE 0 END) as Null_City,
SUM (CASE WHEN Order_date IS NULL THEN 1 ELSE 0 END) as Null_Order_date,
SUM (CASE WHEN Restaurant_name IS NULL THEN 1 ELSE 0 END) as Null_Restaurant_name,
SUM (CASE WHEN Location IS NULL THEN 1 ELSE 0 END) as Null_Location,
SUM (CASE WHEN Catagory IS NULL THEN 1 ELSE 0 END) as Null_Catagory,
SUM (CASE WHEN Dish_name IS NULL THEN 1 ELSE 0 END) as Null_Dish_name,
SUM (CASE WHEN `Price (INR)` IS NULL THEN 1 ELSE 0 END) as `Null_Price (INR)`,
SUM (CASE WHEN Rating IS NULL THEN 1 ELSE 0 END) as Null_Rating,
SUM (CASE WHEN Rating_Count IS NULL THEN 1 ELSE 0 END) as Null_Rating_Count
FROM Swiggy_data;


--This is to check blank or empty strings.

SELECT * FROM Swiggy_data
WHERE State = '' OR City = '' OR Restaurant_name = '' OR Location = '' 
OR Catagory = '' OR Dish_name = '';

