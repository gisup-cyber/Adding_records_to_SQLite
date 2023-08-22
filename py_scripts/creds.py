tables_info = {
    'CUSTOMER': {'std': './sql_scripts/create_STG_CUSTOMER.sql',
                    'dwh_create': './sql_scripts/create_DWH_CUSTOMER.sql',
                    'dwh_insert': './sql_scripts/insert_DWH_CUSTOMER.sql'},

    'TRANSACTION': {'std': './sql_scripts/create_STG_TRANSACTION.sql',
                    'dwh_create': './sql_scripts/create_DWH_TRANSACTION.sql',
                    'dwh_insert': './sql_scripts/insert_DWH_TRANSACTION.sql'},

    'CUSTOMER_ADDRESS': {'std': './sql_scripts/create_STG_CUSTOMER_ADDRESS.sql',
                    'dwh_create': './sql_scripts/create_DWH_CUSTOMER_ADDRESS.sql',
                    'dwh_insert': './sql_scripts/insert_DWH_CUSTOMER_ADDRESS.sql'},
}

DB_PATH = 'mydb.db'