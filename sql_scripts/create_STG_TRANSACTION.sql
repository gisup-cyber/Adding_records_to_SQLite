DROP TABLE if exists STG_TRANSACTION;
CREATE TABLE if not exists STG_TRANSACTION(
transaction_id VARCHAR(255), 
product_id VARCHAR(255),
customer_id VARCHAR(255),
transaction_date VARCHAR(255),
online_order VARCHAR(255),
order_status VARCHAR(255),
brand VARCHAR(255),
product_line VARCHAR(255),
product_class VARCHAR(255),
product_size VARCHAR(255),
list_price VARCHAR(255),
product_first_sold_date VARCHAR(255),
);
