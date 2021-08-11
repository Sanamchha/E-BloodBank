import sqlite3
conn = None
try:
    path=r"D:\e-blood-bank\database\bloodbank1.db"
    # r represents raw string in python
    conn=sqlite3.connect(path)
except sqlite3.error as e:
    print(e)

cur = conn.cursor()
sql = """CREATE TABLE "users" (
	"Client_id"	INTEGER NOT NULL UNIQUE,
	"First_name"	CHAR(20) NOT NULL,
	"Last_name"	CHAR(20) NOT NULL,
	"Contact_no"	NUMERIC NOT NULL,
	"Address"	CHAR(50) NOT NULL,
	"Username"	CHAR(50) NOT NULL UNIQUE,
	"Password"	CHAR(50) NOT NULL,
	PRIMARY KEY("Client_id")
);"""
cur.execute(sql)
conn.commit()