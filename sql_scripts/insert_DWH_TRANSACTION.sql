INSERT OR IGNORE INTO DWH_TRANSACTION(
    transaction_id, 
    product_id,
    customer_id,
    transaction_date,
    online_order,
    order_status,
    brand,
    product_line,
    product_class,
    product_size,
    list_price,
    product_first_sold_date
)

SELECT cast(transaction_id AS INTEGER) AS transaction_id,
       cast(product_id AS INTEGER) AS product_id,
       cast(customer_id AS INTEGER) AS customer_id,
       cast(transaction_date AS DATE) AS transaction_date,
       cast(online_order AS BOOLEAN) AS online_order,
       order_status, brand, product_line, product_class, product_size,
       cast(list_price AS FLOAT) AS list_price,
       cast(product_first_sold_date AS INTEGER) AS product_first_sold_date
FROM STG_TRANSACTION;

       