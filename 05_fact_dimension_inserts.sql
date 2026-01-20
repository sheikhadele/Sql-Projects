--inserting data into dimension and fact tables
--First column is not inserted since it is auto-incremented.

--dim_date

INSERT INTO dim_date (Order_date, Year, month, Month_name, Quarter, Day, Week)
SELECT DISTINCT order_date, YEAR (Order_date), Month (Order_date), 
MONTHNAME(Order_date), QUARTER (Order_date), DAY(Order_date), WEEK(Order_date)
FROM Swiggy_data;

--dim_location

INSERT INTO dim_Location (State, City, Location)
SELECT DISTINCT State, City, Location
FROM Swiggy_data;

--dim_dish

INSERT INTO dim_dish (dish_name)
SELECT DISTINCT dish_name FROM swiggy_data;

--dim_restaurant

INSERT INTO dim_restaurant (Restaurant_name)
SELECT DISTINCT Restaurant_name
FROM swiggy_data; 

--dim_catagory

INSERT INTO dim_catagory (Catagory)
SELECT DISTINCT Catagory
FROM swiggy_data;

--fact_swiggy_orders
--Due to multiple joins and a large query, i couldn't run the query due to limited memory in the system, hence i put the Limit to the insert query in order to proceed, however the full query is mentioned here.

INSERT INTO fact_swiggy_orders (Date_id, `Price (INR)`, Rating, Rating_count, 
Location_id, Restaurant_id, Dish_id, Catagory_id)
SELECT dim_date.Date_id,
`PRICE (INR)`,
Rating,
Rating_count,
dim_Location.Location_id,
dim_restaurant.Restaurant_id,
dim_dish.Dish_id,
dim_catagory.catagory_id
FROM swiggy_data
Join dim_date ON Date_id = dim_date.Date_id
Join dim_Location On Location_id = dim_location.Location_id
Join dim_restaurant ON Restaurant_id = dim_restaurant.Restaurant_id
Join dim_dish ON Dish_id = dim_dish.Dish_id
JOIN dim_catagory ON catagory_id = dim_catagory.catagory_id;

