import psycopg2
from config import host, user, password, db_name

def connect_to_db():
    try:
        # connect to existing database
        connection = psycopg2.connect(
            host=host,
            user=user,
            password=password,
            database=db_name
        )
        connection.autocommit = True
        return connection
    except Exception as _ex:
        print("[INFO] Error while working with postgres")

def create_dwh_objects(connection):
    with connection.cursor() as cursor:
        cursor.execute(
            open("star_chema.sql", "r").read()
        )
    connection.commit()

def insert_data(connection):
    with connection.cursor() as cursor:
        cursor.execute(
            open("data.sql", "r").read()
        )
    connection.commit()

con = connect_to_db()
create_dwh_objects(con)
insert_data(con)