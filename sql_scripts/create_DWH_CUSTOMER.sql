CREATE TABLE IF NOT EXISTS DWH_CUSTOMER(
customer_id INTEGER PRIMARY KEY, 
first_name VARCHAR(128),
last_name VARCHAR(128),
gender VARCHAR(10),
past_3_years_bike_related_purchases INTEGER,
DOB DATE,
job_title VARCHAR(128),
job_industry_category VARCHAR(128),
deceased_indicator CHAR(1),
owns_car BOOLEAN(128),
tenure INTEGER(128),
create_dt DATE,
update_dt DATE);

CREATE TRIGGER if not exists update_trigger_DWH_CUSTOMER AFTER UPDATE ON DWH_CUSTOMER
 BEGIN
  update DWH_CUSTOMER SET update_dt = current_timestamp WHERE customer_id = NEW.customer_id;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_CUSTOMER AFTER INSERT ON DWH_CUSTOMER
 BEGIN
  update DWH_CUSTOMER SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE customer_id = NEW.customer_id;
 END;