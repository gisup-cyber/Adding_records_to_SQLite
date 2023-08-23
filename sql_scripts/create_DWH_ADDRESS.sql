CREATE TABLE IF NOT EXISTS DWH_ADDRESS(
address_id INTEGER PRIMARY KEY, 
customer_id INTEGER,
'address' VARCHAR(255),
postcode INTEGER,
'state' VARCHAR(50),
country VARCHAR(128),
property_valuation INTEGER(128),
create_dt date,
update_dt date,
FOREIGN KEY(customer_id) REFERENCES DWH_CUSTOMER(customer_id));

 
CREATE TRIGGER if not exists update_trigger_ADDRESS AFTER UPDATE ON DWH_ADDRESS
 BEGIN
  update DWH_ADDRESS SET update_dt = current_timestamp WHERE address_id = NEW.address_id;
 END;

CREATE TRIGGER if not exists insert_trigger_DWH_ADDRESS AFTER INSERT ON DWH_ADDRESS
 BEGIN
  update DWH_ADDRESS SET (create_dt, update_dt) = (current_timestamp,current_timestamp) WHERE address_id = NEW.address_id;
 END;