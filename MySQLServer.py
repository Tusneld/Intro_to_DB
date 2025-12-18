# MySQLServer.py
# Task 1: Let's Build Your Database: Your Gateway to Data Adventure!

import mysql.connector
from mysql.connector import errorcode

# Configuration for connecting to the MySQL server
CONFIG = {
    'user': 'root',
    'password': 'tus',
    'host': 'localhost'  
}

DATABASE_NAME = 'alx_book_store'

def create_database():
    """Creates the alx_book_store database if it does not exist."""
    
    cnx = None  # Initialize connection object
    cursor = None # Initialize cursor object

    try:
        # 1. Establish connection to the MySQL server (without specifying a database)
        cnx = mysql.connector.connect(**CONFIG)
        cursor = cnx.cursor()

        # 2. Execute the CREATE DATABASE statement with IF NOT EXISTS
        # This prevents the script from failing if the database already exists
        query = "CREATE DATABASE IF NOT EXISTS {} DEFAULT CHARACTER SET 'utf8'".format(DATABASE_NAME)
        
        cursor.execute(query)
        
        # 3. Print success message
        print(f"Database '{DATABASE_NAME}' created successfully!")

    except mysql.connector.Error as err:
        # 4. Handle connection and execution errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Invalid MySQL username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print(f"Database does not exist: {DATABASE_NAME}")
        else:
            print(f"Error: Failed to connect to the DB: {err}")
    
    finally:
        # 5. Handle open and close of the DB/Connection
        if cursor:
            cursor.close()
        if cnx and cnx.is_connected():
            cnx.close()

if __name__ == '__main__':
    create_database()