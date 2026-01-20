--To create the table as per raw data csv file.

CREATE TABLE swiggy_data (
    State VARCHAR(50),
    City VARCHAR(20),
    Order_date DATE,
    Restaurant_name VARCHAR(50),
    Location VARCHAR(50),
    Category VARCHAR(100),
    Dish_name VARCHAR(150),
    Price (INR) INT,
    Rating INT,
    Rating_Count INT
);

--To insert the data into the table swiggy_data from raw data csv file.

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Swiggy_Data.csv'
INTO TABLE Swiggy_Data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


