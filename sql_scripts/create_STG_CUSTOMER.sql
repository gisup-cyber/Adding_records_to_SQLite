DROP TABLE IF EXISTS STG_CUSTOMER;
CREATE TABLE IF NOT EXISTS STG_CUSTOMER(
customer_id VARCHAR(255), 
first_name VARCHAR(255),
last_name VARCHAR(255),
gender VARCHAR(255),
past_3_years_bike_related_purchases VARCHAR(255),
DOB VARCHAR(255),
job_title VARCHAR(255),
job_industry_category VARCHAR(255),
deceased_indicator VARCHAR(255),
owns_car VARCHAR(255),
tenure VARCHAR(255),
);
