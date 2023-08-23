import datetime
import os
import pandas as pd
import shutil

from py_scripts.etl_task import EtlTask
from py_scripts.creds import DB_PATH, tables_info


def stg_and_dwh(data, sheet_name):
    task = EtlTask(DB_PATH)
    if sheet_name.lower() != 'newcustomerlist':
        if 'customerdemographic' == sheet_name.lower():
            table_stg = 'STG_CUSTOMER'
            dwh_create_script = tables_info['CUSTOMER']['dwh_create']
            dwh_insert_script = tables_info['CUSTOMER']['dwh_insert']
        elif 'transactions' == sheet_name.lower():
            table_stg = 'STG_TRANSACTION'
            dwh_create_script = tables_info['TRANSACTION']['dwh_create']
            dwh_insert_script = tables_info['TRANSACTION']['dwh_insert']
        else:
            table_stg = 'STG_ADDRESS'
            dwh_create_script = tables_info['ADDRESS']['dwh_create']
            dwh_insert_script = tables_info['ADDRESS']['dwh_insert']

        task.initialize_stg(table_stg)
        task.insert_data_to_stg(table_stg, data)
        task.make_dwh(dwh_create_script)
        task.make_dwh(dwh_insert_script)


if __name__ == "__main__":

    input_path = 'input_data/'
    archive_path = 'archive/'

    archive_files = os.listdir(archive_path)

    new_file = os.listdir(input_path)[0]
    dates_increment = str(datetime.datetime.now().date())
    data_file = pd.ExcelFile(f'{input_path}{new_file}')
    sheet_names = data_file.sheet_names
    for sheet_name in sheet_names:
        data = data_file.parse(sheet_name)
        stg_and_dwh(data, sheet_name)
        shutil.copy(
            f"{input_path}{new_file}", f"{archive_path}{new_file}.dump"
            )
