#!/usr/bin/python3
import sqlite3, random


# ouverture/initialisation de la base de donnee 
conn = sqlite3.connect('logement.db')
conn.row_factory = sqlite3.Row
c = conn.cursor()
#ouverture du fichier contenant les exemples
sql_file = open("logement.sql")
sql_as_string = sql_file. read()
c.executescript(sql_as_string)





# fermeture
conn.commit()
conn.close()
