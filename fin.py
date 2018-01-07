#!/usr/bin/env python

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt


import MySQLdb


m1,m2 =[],[]


# Open database connection
db = MySQLdb.connect("localhost","root",".@c.D8wiyWq4","data" )

# prepare a cursor object using cursor() method
cursor = db.cursor()

# Prepare SQL query to INSERT a record into the database.
sql = "select * from smap;"
try:
   # Execute the SQL command
   cursor.execute(sql)
   # Fetch all the rows in a list of lists.
   results = cursor.fetchall()
   for row in results:
      f1 = row[0]
      f2 = row[1]
     
except:
   print "Error: unable to fecth data"



ql = "select mk1,mk2 from map where sub1='"+str(f1)+"' AND sub2='"+str(f2)+"';"
#print ql
try:
   # Execute the SQL command
   cursor.execute(ql)
   # Fetch all the rows in a list of lists.
   results = cursor.fetchall()
   for row in results:
          m1.append(row[0])
          m2.append(row[1])


except:
   print "Error: unable to fecth data"


plt.scatter(m1,m2)
plt.xlabel(f1)
plt.ylabel(f2)
plt.savefig('myfig')
plt.show()









