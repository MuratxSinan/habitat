# Habitat ETL (ELT)

Sample ETL pipeline demonstratest usage of Airflow, Bash, Python, SQL.

## Getting Started

To run the application on your local machine make sure you install latest version of docker desktop.

### Prerequisites

It is pretty straight, code runs in containers and installs all necessary components. Make sure you don't use the port 5432 (PostgreSQL) and 8080 (Airflow). Install docker desktop to be able to pull base images and run the line below in the root of the repository

```
docker-compose up
```

### Installing

Application will install everything.

```
docker-compose up
```

And re-run if you change any configuration or script.

```
docker-compose up --build
```


## Running the tests

Test covarage is out of scope because of time constraints.

## Configuration Parameters

After Airflow starts navigate http://0.0.0.0:8080/admin/connection/ on your local machine and edit `postgres_default` connection by setting the password to `postgres`   

This must be the direct link. Please save after changing
```
http://0.0.0.0:8080/admin/connection/edit/?id=13&url=%2Fadmin%2Fconnection%2F
```
## Running the pipeline

Data pipeline is set disabled initially. Please navigate the link below and in the list toggle the on/off button to `on` position so Airflow Scheduler will be triggered. In couple of minutes all pipeline will run and fill the tables.

```
http://0.0.0.0:8080/admin/
```

## Running the queries

You can also run sqls in the sql folder by navigating the url below. Please select `postgres_default` in the selectbox and copy contents of the sql script and paste in the text area in the page. You can run or download the result by clicking respective button.
```
http://0.0.0.0:8080/admin/queryview/
```

## Authors

* **Emrah Gozcu** 
