INSERT OR IGNORE INTO DWH_ADDRESS(
customer_id,
'address',
postcode,
'state',
country,
property_valuation
)

SELECT cast(customer_id AS INTEGER) AS customer_id,
       'address',
       cast(postcode AS INTEGER) AS postcode,
       'state', country,
       cast(property_valuation AS INTEGER) AS property_valuation
FROM STG_ADDRESS;