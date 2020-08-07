from datetime import timedelta

from airflow import DAG

from airflow.operators.postgres_operator import PostgresOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

#Pandas transformation. If file is really big, we can use Spark instead of Pandas
from sqlalchemy import create_engine
import pandas as pd
import numpy as np
import psycopg2
import re 
  

data_file = '/data/agaricus-lepiota-Aug.csv'
#TODO: Parameterize
#TODO: Move to a new Python Module
#TODO: Test coverage

engine = create_engine('postgresql+psycopg2://postgres:postgres@postgres:5432/airflow')

# Function to clean time, we can use similar methods for other columsn 
def clean_time(sample_time): 
    search = re.search('([AaPp][Mm]).*', sample_time)
    if search: 
        # Extract the position of beginning of pattern 
        pos = search.start() + 2
  
        # return the cleaned time 
        return sample_time[:pos] 
    else: 
        # if data is something else return a default value. This needs to be discussed with team. 
        # Default value can be avg, median etc. 
        return "00:00 AM"  
          


def clean_data(ds, **kwargs):
    df = pd.read_csv(data_file, sep=',')
    df = df.rename(columns={
        "1": "cap_shape", 
        "3": "cap_color",
        "5": "odor",
        "8": "gill_size",
        "9": "gill_color",
        "14": "stalk_color_above_ring",
        "17": "veil_color",
        "19": "ring_type",
        "20": "spore_print_color",
        "21": "population",
        "22": "habitat",
        "Time": "sample_time"
        })
    
    # Updated the city columns 
    df['sample_time'] = df['sample_time'].apply(clean_time) 

    df.to_sql('mushrooms_dl', engine, schema='public', if_exists='replace')
    return "Cleanup completed"

# These args will get passed on to each operator
# You can override them on a per-task basis during operator initialization
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': days_ago(2),
    'email': ['gozcuem@gmail.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
    # 'queue': 'bash_queue',
    # 'pool': 'backfill',
    # 'priority_weight': 10,
    # 'end_date': datetime(2016, 1, 1),
    # 'wait_for_downstream': False,
    # 'dag': dag,
    # 'sla': timedelta(hours=2),
    # 'execution_timeout': timedelta(seconds=300),
    # 'on_failure_callback': some_function,
    # 'on_success_callback': some_other_function,
    # 'on_retry_callback': another_function,
    # 'sla_miss_callback': yet_another_function,
    # 'trigger_rule': 'all_success'
}
dag = DAG(
    'TEST_ELT',
    default_args=default_args,
    description='Sinks the data in the CSV without any transformation',
    schedule_interval=timedelta(days=1),
)

# t1, t2 and t3 are examples of tasks created by instantiating operators
t1 = BashOperator(
    task_id='Start',
    bash_command='date',
    dag=dag,
)


t2 = PythonOperator(
    task_id='clean_sink_data',
    provide_context=True,
    python_callable=clean_data,
    dag=dag,
)

t3 = PostgresOperator(
    task_id='de_duplicate',
    sql='sql/dedup.sql',
    postgres_conn_id='postgres_default',
    retries=3,
    dag=dag,
)

t4 = PostgresOperator(
    task_id='translate',
    sql='sql/translate.sql',
    postgres_conn_id='postgres_default',
    retries=3,
    dag=dag,
)

t5 = BashOperator(
    task_id='End',
    bash_command='date',
    dag=dag,
)

dag.doc_md = __doc__

t1.doc_md = """\
#### Task Documentation
**Sample ETL**
"""


t1 >> t2 >> t3 >> t4 >> t5 