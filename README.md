# Sql-Project

🍔 Swiggy Sales SQL Case Study (MySQL)
📌 Project Overview

This project is a real-world SQL case study based on Swiggy sales data.
The objective is to perform end-to-end data analysis using MySQL, starting from raw CSV data to business insights.

--The project covers:

Data ingestion from CSV
Data validation & cleaning
Handling nulls and duplicates
Data modeling (fact & dimension tables)
Writing business-focused analytical queries

🗂 Dataset

Source: Swiggy sales raw data (CSV format)
Contains state, city, order date, restaurant name, location, category, dish name, price (INR), rating, rating count.
Data imported into MySQL using table creation scripts

🛠 Tools & Technologies

Database: MySQL
Language: SQL
Design: Star Schema (Fact & Dimension tables)

🧹 Data Cleaning & Validation

Created table structure based on raw CSV
Validated data types and ranges
Checked and handled NULL values
Identified duplicate records using window functions
Removed duplicates safely

🧱 Data Modeling

Created a star schema with proper relationships:

-Dimension Tables:

dim_date 
dim_location
dim_restaurant
dim_dish

-Fact Table:

fact_Swiggy_orders

All tables are connected using foreign keys for analytical queries.

📊 Business Questions Answered

Total number of orders
Total sales revenue
Total sales revenue in INR Millions
Average rating of the orders
Monthly order trends
Total revenue month/quarter/year/dayname/week-wise
Total revenue of Top 5 cities
Total orders by restaurant names
Total orders by Category
Dish category performance
Classifying the orders based on the price range

📁 Project Structure
sql/
├── 01_table_creation.sql
├── 02_data_validation_cleaning.sql
├── 03_null_duplicate_handling.sql
├── 04_data_modeling.sql
├── 05_fact_dimension_inserts.sql
└── 06_business_queries.sql

🚀 Key SQL Concepts Used

DDL & DML
Joins
Subqueries
CASE statements
Window functions (ROW_NUMBER)
Aggregations
Data cleaning functions
Fact & dimension modeling
Foreign key constraints

🧠 Learning Outcome

This project helped me understand how SQL is used in real business scenarios:
How raw data becomes analytics-ready
How data models support business reporting
How to write queries for real decision-making
