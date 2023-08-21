import os
import shutil
from py_scripts.utils import read_data
from py_scripts.etl_task import EtlTask
from py_scripts.creds import DB_PATH, tables_info
import datetime


def stg_and_dwh(folder_path, file_name):
    data = read_data(f'{folder_path}{file_name}')
    task = EtlTask(DB_PATH)
    if 'terminals' in file_name:
        table_stg = 'STG_TERMINALS'
        dwh_create_script = tables_info['TERMINALS']['dwh_create']
        dwh_insert_script = tables_info['TERMINALS']['dwh_insert']
    elif 'passport' in file_name:
        table_stg = 'STG_PASSPORT_BLACKLIST'
        dwh_create_script = tables_info['PASSPORT_BLACKLIST']['dwh_create']
        dwh_insert_script = tables_info['PASSPORT_BLACKLIST']['dwh_insert']
    else:
        table_stg = 'STG_TRANSACTIONS'
        dwh_create_script = tables_info['TRANSACTIONS']['dwh_create']
        dwh_insert_script = tables_info['TRANSACTIONS']['dwh_insert']

    task.initialize_stg(table_stg)
    task.insert_data_to_stg(table_stg, data)
    task.make_dwh(dwh_create_script)
    task.make_dwh(dwh_insert_script)


if __name__ == "__main__":

    input_path = 'input_data/'
    archive_path = 'archive/'

    input_files = os.listdir(input_path)
    archive_files = os.listdir(archive_path)

    new_files = [x for x in input_files if x + '.dump' not in archive_files]
    dates_increment = str(datetime.datetime.now().date())#list(set([x.split('.')[0].split('_')[-1] for x in new_files]))
    for i in new_files:
        stg_and_dwh(input_path, i)
        shutil.copy(f"{input_path}{i}", f"{archive_path}{i}.dump")










