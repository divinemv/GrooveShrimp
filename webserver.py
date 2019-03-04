import sqlite3

from flask import Flask, render_template, request, redirect
app = Flask(__name__)

@app.route("/create_tables", methods=["GET"])
def create_tables():
	conn = sqlite3.connect('database.db')
	c = conn.cursor()

	# Create tables

	c.execute(""" 
			CREATE TABLE IF NOT EXISTS ALBUM 
			( 	Album_ID int,
				Artist_ID int,
				Album_Name text,
  				Year int, 
            )""")

	c.execute(""" 
			CREATE TABLE IF NOT EXISTS ARTIST 
			( 	Artist_ID int,
  				Album_Name text,
            )""")

	c.execute(""" 
			CREATE TABLE IF NOT EXISTS COVERS 
			( 	Cover_Song_ID int,
  				Artist_ID int,
				Song_ID int,
				Video_Link text,
            )""")

	c.execute(""" 
			CREATE TABLE IF NOT EXISTS GENRE
			( 	Genre_ID int,
  				Genre_Name text,
            )""")
		
	c.execute("""
			CREATE TABLE IF NOT EXISTS SONG
			(	Song_ID int, 
            	Artist_ID int, 
            	Song_Name text, 
            	Album_ID int, 
            	Genre_ID int, 
            )""")
			
	conn.commit()
	conn.close()

	return "OK"

@app.route("/")
def hello_world():
    """
    If someone goes to the root of your website (i.e. http://localhost:5000/), run this function. The string that this
    returns will be sent to the browser
    """
    return render_template("index.html") # Render the template located in "templates/index.html"

@app.route("/index")
def index():
	return render_template("index.html")

@app.route("/search", methods=["GET"])
def search_form():
	return render_template("search.html")

@app.route("/search", methods=["POST"])
# def show_all_users():
def show_search_results():
	results = 0

	a = request.form["song"]
	if not (a == ""):
		results = results + 1
	print(a)
	print(results)
	b = request.form["cover"]
	if not (b == ""):
		results = results + 10
	print("cover: "+ b)
	print(results)

	ccc = request.form["artist"]
	print("artist: " + ccc)
	if not (ccc == ""):
	 	results = results + 100
	print(results)


	d = request.form["album"]
	if not (d == ""):
	 	results = results + 1000
	print("album: " + d)
	print(results)

	e = request.form["genre"]
	if not (e == ""):
	 	results = results + 10000
	print("genre: " + e)
	print(results)

	f = request.form["year"]
	if not (f == ""):
	 	results = results + 100000
	print("year: " + f)
	print(results)

	g = request.form["musicvideo"]
	if not (g == ""):
	 	results = results + 1000000
	print("music videos: " + f)
	print(results)

	
	if results == 11:
		conn = sqlite3.connect('database.db')
		c = conn.cursor()
		data = []
		data_list = []
		for db_row in c.execute(""" Select Song_Name from SONG where Song_Name = ? UNION ALL Select Album_Name from ALBUM inner join SONG on SONG.Album_ID = ALBUM.Album_ID where SONG.Song_Name = ? UNION ALL Select Artist_Name from ARTIST inner join SONG on SONG.Artist_ID = ARTIST.Artist_ID where SONG.Song_Name = ? UNION ALL Select Video_Link from COVERS inner join SONG on SONG.Song_ID = COVERS.Song_ID where SONG.Song_Name = ? """, [a, a, a, a]):
			data_list = data_list + [db_row[0]]
		d = (len(data_list)// 4)
		v = []
		counter = 0
		for items in range(d):
			r = {}
			r["Song"] = data_list[0 + counter]
			r["Album"] = data_list[d + counter]
			r["Artist"] = data_list[d * 2 + counter]
			r["Cover"] = data_list[d * 3 + counter]
			data.append(r)
			counter = counter+1
		return render_template("show_search_results.html", data=data)
	if results == 1:
		conn = sqlite3.connect('database.db')
		c = conn.cursor()
		data = []
		data_list = []
		for db_row in c.execute(""" Select Song_Name from SONG where Song_Name = ? UNION ALL Select Album_Name from ALBUM inner join SONG on SONG.Album_ID = ALBUM.Album_ID where SONG.Song_Name = ? UNION ALL Select Artist_Name from ARTIST inner join SONG on SONG.Artist_ID = ARTIST.Artist_ID where SONG.Song_Name = ?  """, [a, a, a]):
			data_list = data_list + [db_row[0]]
		d = (len(data_list)// 3)
		v = []
		counter = 0
		for items in range(d):
			r = {}
			r["Song"] = data_list[0 + counter]
			r["Album"] = data_list[d + counter]
			r["Artist"] = data_list[d * 2 + counter]
			data.append(r)
			counter = counter+1
		return render_template("show_search_results1.html", data=data)
	if results == 1000001:
		conn = sqlite3.connect('database.db')
		c = conn.cursor()
		data = []
		data_list = []
		for db_row in c.execute(""" Select Song_Name from SONG where Song_Name = ? UNION ALL Select Album_Name from ALBUM inner join SONG on SONG.Album_ID = ALBUM.Album_ID where SONG.Song_Name = ? UNION ALL Select Artist_Name from ARTIST inner join SONG on SONG.Artist_ID = ARTIST.Artist_ID where SONG.Song_Name = ? UNION ALL Select Music_Video from VIDEO inner join SONG on SONG.Song_ID = VIDEO.Song_ID where SONG.Song_Name = ? """, [a, a, a, a]):
			data_list = data_list + [db_row[0]]
		d = (len(data_list)// 4)
		v = []
		counter = 0
		for items in range(d):
			r = {}
			r["Song"] = data_list[0 + counter]
			r["Album"] = data_list[d + counter]
			r["Artist"] = data_list[d * 2 + counter]
			r["Cover"] = data_list[d * 3 + counter]
			data.append(r)
			counter = counter+1
		return render_template("show_search_results2.html", data=data)
	if results == 1100:
		conn = sqlite3.connect('database.db')
		c = conn.cursor()
		data = []
		data_list = []
		for db_row in c.execute(""" Select SONG.Song_Name, ALBUM.Year, GENRE.Genre_Name from SONG inner join ALBUM on ALBUM.Album_ID = SONG.Album_ID inner join ARTIST on ARTIST.Artist_ID = SONG.Artist_ID inner join GENRE on GENRE.Genre_ID = SONG.Genre_ID where ALBUM.Album_Name = ? and ARTIST.Artist_Name = ? """, [d, ccc]):
			data_row = {}
			data_row["Song"] = db_row[0]
			data_row["Year"] = db_row[1]
			data_row["Genre"] = db_row[2]
			data_row["Album"] = d
			data_row["Artist"] = ccc
			data.append(data_row)
		return render_template("show_search_results4.html", data=data)
	if results == 110000:
		conn = sqlite3.connect('database.db')
		c = conn.cursor()
		data = []
		data_list = []
		for db_row in c.execute(""" Select SONG.Song_Name, ARTIST.Artist_Name, ALBUM.Album_Name from SONG inner join GENRE on GENRE.Genre_ID = SONG.Genre_ID inner join ARTIST on ARTIST.Artist_ID = SONG.Artist_ID inner join ALBUM on ALBUM.Album_ID = SONG.Album_ID where ALBUM.Year = ? and GENRE.Genre_Name = ? """, [f, e]):
			data_row = {}
			data_row["Song"] = db_row[0]
			data_row["Year"] = f
			data_row["Genre"] = e
			data_row["Album"] = db_row[2]
			data_row["Artist"] = db_row[1]
			data.append(data_row)
		return render_template("show_search_results4.html", data=data)
	if results == 10000:
		conn = sqlite3.connect('database.db')
		c = conn.cursor()
		data = []
		data_list = []
		for db_row in c.execute(""" Select SONG.Song_Name, ARTIST.Artist_Name, ALBUM.Album_Name from SONG inner join GENRE on GENRE.Genre_ID = SONG.Genre_ID inner join ARTIST on ARTIST.Artist_ID = SONG.Artist_ID inner join ALBUM on ALBUM.Album_ID = SONG.Album_ID where GENRE.Genre_Name = ? """, [e]):
			data_row = {}
			data_row["Song"] = db_row[0]
			data_row["Genre"] = e
			data_row["Album"] = db_row[2]
			data_row["Artist"] = db_row[1]
			data.append(data_row)
		return render_template("show_search_results5.html", data=data)



	return render_template("no_results.html")



if __name__ == "__main__":
    app.run()



# ----

# 	conn = sqlite3.connect('database.db')
# 	c = conn.cursor()
# 	# data = []
# 	# for db_row in c.execute("""SELECT Song_Name from SONG WHERE SONG.Song_Name=?""", (song,)):
# 	# 	data.append(data_row)
# 	# SELECT * FROM table_name;
# 	data = []
# 	for db_row in c.execute(""" SELECT Song_ID, Artist_ID, Song_Name, Album_ID, Genre_ID FROM SONG WHERE SONG.Song_Name = ?""", [a]):
# 		data_row = {}
# 		data_row["Song_ID"] = db_row[0]
# 		data_row["Artist_ID"] = db_row[1]
# 		data_row["Song_Name"] = db_row[2]
# 		data_row["Album_ID"] = db_row[3]
# 		data_row["Genre_ID"] = db_row[4]
# 		data.append(data_row)
# ----