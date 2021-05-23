import json
import os

import psycopg2
from psycopg2 import Error
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
import pymysql

class pgDatabaseManager(object):
    cursor = ''
    connection = ''
    host = ''
    port = ''

    def __init__(self, username, password, host, port) -> object:
        self.host = host
        self.port = port
        self.password = password
        self.username = username

    def set_connect(self, db_name):

        self.connection = psycopg2.connect(user=self.username,
                                           password=self.password,
                                           host=self.host,
                                           port=self.port,
                                           db_name=db_name)
        self.connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        self.cursor = self.connection.cursor()

    def create_db(self, db_name):

        self.connection = psycopg2.connect(user=self.username,
                                           password=self.password,
                                           host=self.host,
                                           port=self.port)
        self.connection.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        self.cursor = self.connection.cursor()

        try:
            self.drop_db(db_name)
        except Error as e:
            print(e)

        self.cursor.execute(f'create database {db_name}')
        self.close_connect()

    def drop_db(self, db_name):
        self.cursor.execute(f'drop database {db_name}')

    def create_table(self, path_to_file):
        db_name = path_to_file.split('_')[0]
        self.set_connect(db_name=db_name)
        with open(f"create_query/{path_to_file}") as query:
            self.execute(query.read())
        self.close_connect()

    def load_dump(self, db_name, dump):
        if dump.split('_')[0] == db_name:
            self.set_connect(db_name=db_name)
            with open(f"dumps/{dump}") as query:
                self.execute(query.read())
            self.close_connect()

    def execute(self, query):
        self.cursor.execute(query)
        self.connection.commit()

    def close_connect(self):
        if self.connection:
            self.cursor.close()
            self.connection.close()


class mysqlDatabaseManager(object):
    cursor = ''
    connection = ''
    host = ''
    port = ''

    def __init__(self, username, password, host, port) -> object:
        self.host = host
        self.port = port
        self.password = password
        self.username = username

    def set_connect(self, db_name):

        self.connection = pymysql.connect(user=self.username,
                                          password=self.password,
                                          host=self.host,
                                          port=self.port,
                                          db=db_name)

        self.cursor = self.connection.cursor()

    def create_db(self, db_name):

        self.connection = pymysql.connect(user=self.username,
                                          password=self.password,
                                          host=self.host,
                                          port=self.port)

        self.cursor = self.connection.cursor()

        try:
            self.drop_db(db_name)
        except Error as e:
            print(e)

        self.cursor.execute(f'create database {db_name}')
        self.close_connect()

    def drop_db(self, db_name):
        self.cursor.execute(f'drop database {db_name}')

    def create_table(self, path_to_file):
        db_name = path_to_file.split('_')[0]
        self.set_connect(db_name=db_name)
        with open(f"create_query/{path_to_file}") as query:
            self.execute(query.read())
        self.close_connect()

    def load_dump(self, db_name, dump):
        if dump.split('_')[0] == db_name:
            self.set_connect(db_name=db_name)
            with open(f"dumps/{dump}") as query:
                self.execute(query.read())
            self.close_connect()

    def execute(self, query):
        self.cursor.execute(query)
        self.connection.commit()

    def close_connect(self):
        if self.connection:
            self.cursor.close()
            self.connection.close()


if "__main__" == __name__:
    settings = {}
    db_sets = set()
    files = os.listdir('create_query')
    dumps = os.listdir('dumps')

    with open('db_settings.json') as f:
        settings = json.loads(f.read())

    if os.getcwd().replace('\\', '/').split('/')[-1] == 'postgres':

        dbm = pgDatabaseManager(
            username=settings['username'],
            password=settings['password'],
            host=settings['host'],
            port=settings['port']
        )
    else:
        dbm = mysqlDatabaseManager(
            username=settings['username'],
            password=settings['password'],
            host=settings['host'],
            port=settings['port']
        )

    for i in files:  # Получаем список баз
        db_sets.add(i.split('_')[0])

    for i in db_sets:  # Создаем базы
        dbm.create_db(db_name=i)

    for i in files:  # Создаем таблицы
        dbm.create_table(i)

    for db in db_sets:  # Перебираем базы
        for dmp in dumps:  # Загружаем дампы
            dbm.load_dump(db_name=db, dump=dmp)
