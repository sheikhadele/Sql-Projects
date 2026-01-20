--Creating dimension tables

--dim_date
CREATE TABLE dim_date (Date_id INT AUTO_INCREMENT PRIMARY KEY, Order_date DATE, Year INT, 
Month INT, Month_name VARCHAR (20), Quarter INT, Day INT, Week INT);


--dim_location
Create TABLE dim_location (Location_id INT AUTO_INCREMENT PRIMARY KEY, State VARCHAR (100),
City VARCHAR (100), Location VARCHAR (100));


--dim_dish
CREATE TABLE dim_restaurant (Restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
Restaurant_name VARCHAR (200));


--dim_restaurant
CREATE TABLE dim_dish (Dish_id INT AUTO_INCREMENT PRIMARY KEY, dish_name VARCHAR (200));

--dim_catagory
CREATE TABLE dim_catagory  (Catagory_id INT AUTO_INCREMENT PRIMARY KEY, Catagory VARCHAR (100));

--Creating fact table

--fact_swiggy_orders
CREATE TABLE fact_swiggy_orders 
(Order_id INT AUTO_INCREMENT PRIMARY KEY, 
Date_id INT, `Price (INR)` Decimal (10,2), Rating INT, Rating_count INT,
Location_id INT,
Restaurant_id INT,
Dish_id INT,
Catagory_id INT,
FOREIGN KEY (Date_id) REFERENCES dim_date(Date_id),
FOREIGN KEY (Location_id) REFERENCES dim_Location(Location_id),
FOREIGN KEY (Restaurant_id) REFERENCES dim_restaurant(Restaurant_id),
FOREIGN KEY (Dish_id) REFERENCES dim_dish(Dish_id),
FOREIGN KEY (Catagory_id) REFERENCES dim_catagory(catagory_id));
