import pandas as pd

import sqlite3
from itertools import tee
import requests

#for making the dictionary format of data from query
def dict_factory(cursor, row):
    d = {}
    for idx, col in enumerate(cursor.description):
        d[col[0]] = row[idx]
    return d

def db_connection():
    conn = None
    try:
        path=r"D:\E-BloodBank\e-blood-bank\database\bloodbank1.db"
        # r represents raw string in python
        conn=sqlite3.connect(path)
    except sqlite3.error as e:
        print(e)
    return conn

def Gpoints():
    conn = db_connection()
    conn.row_factory = dict_factory
    cursor = conn.cursor()
    

    if request.method == 'GET':
        userlist = cursor.execute("SELECT * FROM users WHERE User_type='Donor' OR User_type='Both';").fetchall()
        if not userlist:
            return page_not_found(404)

        return jsonify(userlist),200
    conn.commit()
    conn.close()
     

#     if request.method == 'POST':
#         data = request.get_json()
#         Name = data['name']
#         Phone = data['phone']
#         Address = data['address']
#         Age = data['age']
#         User_type = data['user_type']
#         Gender = data['gender']
#         Blood_type = data['bgroup']
#         Latitude = data['latitude']
#         Longitude = data['longitude']
#         Password = data['password']
#         Email = data['email']
        
#         print(data)

#         sql = """INSERT INTO users
#                 ("Name", "Phone", "Age", "Gender", "Address", "Latitude", "Longitude", "Blood_type", "Email", "User_type", "Password")
#                 VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"""

#         cursor = cursor.execute(sql, (Name,Phone,Age,Gender,Address,Latitude,Longitude,Blood_type,Email,User_type,Password))
#         conn.commit()
#         conn.close()

#Read CSV file into data frame named 'df'
#change seperator (sep e.g. ',') type if necessary
df = pd.read_csv('testdata.csv')

#Perform request to use the Google Maps API web service
API_key = '5QgJvUwq6eZ8h5c3obac911ra8vPt'#enter Google Maps API key
url = 'https://api.distancematrix.ai/maps/api/distancematrix/json'

#pairwise function implemented to iterate through two consecutive rows (pairs) in a data frame
def pairwise(iterable):
    a, b = tee(iterable)
    next(b, None)
    return zip(a, b)

#empty list - will be used to store calculated distances
list = [0]

# Loop through each row in the data frame using pairwise
for (i1, row1), (i2, row2) in pairwise(df.iterrows()):
    #Assign latitude and longitude as origin/departure points
    LatOrigin = row1['Latitude'] 
    LongOrigin = row1['Longitude']
    origins = (LatOrigin,LongOrigin)

    #Assign latitude and longitude from the next row as the destination point
    LatDest = row2['Latitude']   # Save value as lat
    LongDest = row2['Longitude'] # Save value as lat
    destination = (LatDest,LongDest)


    #pass origin and destination variables to distance_matrix function# output in meters
    params = {'origins': origins, 'destinations': destination, 'key': API_key}
    result=requests.post(url, params=params)

    # result = gmaps.distance_matrix(origins, destination, mode='walking')["rows"][0]["elements"][0]["distance"]["value"]
      
    #append result to list
    list.append(result)

#Add column 'Distance' to data frame and assign to list values
df['Distance'] = list

df.to_csv('calculated_distances.csv', sep=';', index=None, header= ['id','Latitude','Longitude','track_id','distance'])


