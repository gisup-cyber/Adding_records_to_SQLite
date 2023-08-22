CREATE TABLE IF NOT EXISTS DWH_TRANSACTION(
transaction_id INTEGER PRIMARY KEY, 
product_id INTEGER,
customer_id INTEGER,
transaction_date DATE,
online_order BOOLEAN,
order_status VARCHAR(128),
brand VARCHAR(128),
product_line VARCHAR(128),
product_class VARCHAR(128),
product_size VARCHAR(128),
list_price FLOAT,
product_first_sold_date INTEGER,
create_dt date,
update_dt date,
FOREIGN KEY(customer_id) REFERENCES DWH_CUSTOMER(customer_id));

 
CREATE TRIGGER if not exists update_trigger_DWH_TRANSACTION AFTER UPDATE ON DWH_TRANSACTION
 BEGIN
  update DWH_TRANSACTION SET update_dt = current_timestamp WHERE transaction_id = NEW.transaction_id;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_TRANSACTION AFTER INSERT ON DWH_TRANSACTION
 BEGIN
  update DWH_TRANSACTION SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE transaction_id = NEW.transaction_id;
 END;