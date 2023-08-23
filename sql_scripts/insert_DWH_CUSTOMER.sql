INSERT OR IGNORE INTO DWH_CUSTOMER(
customer_id, 
first_name,
last_name,
gender,
past_3_years_bike_related_purchases,
DOB,
job_title,
job_industry_category,
deceased_indicator,
owns_car,
tenure)

SELECT cast(customer_id AS INTEGER) AS customer_id,
       first_name, last_name, gender,
       cast(past_3_years_bike_related_purchases AS INTEGER) AS past_3_years_bike_related_purchases,
       cast(DOB AS DATE) AS DOB,
       job_title, job_industry_category,
       cast(deceased_indicator AS CHAR) AS deceased_indicator,
       cast(owns_car AS BOOLEAN) AS owns_car,
       cast(tenure AS INTEGER) AS tenure
FROM STG_CUSTOMER;