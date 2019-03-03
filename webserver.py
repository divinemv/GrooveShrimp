import sqlite3

from flask import Flask, render_template, request, redirect
app = Flask(__name__)

@app.route("/create_tables", methods=["GET"])
def create_tables():
	conn = sqlite3.connect('database.db')
	c = conn.cursor()

	# Create table
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

	# song = request.form["song"]
	# artist = request.form["artist"]
	# album = request.form["album"]
	# genre = request.form["genre"]
	# year = request.form["year"]
	# cover = request.form["cover"]
	# x = request.form("song")
	a = request.form["song"]
	# b = request.form["artist"]
	# c = request.form["artist"]
	# d = request.form["artist"]
	# e = request.form["artist"]


	# print(a)
	# print(b  == "")
	# if not (a == ""):
	# 	results = results + 1
	# if not (b == ""):
	# 	results = results + 10
	# if not (c == ""):
	# 	results = results + 100
	# if not (d == ""):
	# 	results = results + 1000
	# if not (e == ""):
	# 	results = results + 1



	conn = sqlite3.connect('database.db')
	c = conn.cursor()
	# data = []
	# for db_row in c.execute("""SELECT Song_Name from SONG WHERE SONG.Song_Name=?""", (song,)):
	# 	data.append(data_row)
	# SELECT * FROM table_name;
	data = []
	for db_row in c.execute(""" SELECT Song_ID, Artist_ID, Song_Name, Album_ID, Genre_ID FROM SONG WHERE SONG.Song_Name = ?""", [a]):
		data_row = {}
		data_row["Song_ID"] = db_row[0]
		data_row["Artist_ID"] = db_row[1]
		data_row["Song_Name"] = db_row[2]
		data_row["Album_ID"] = db_row[3]
		data_row["Genre_ID"] = db_row[4]
		data.append(data_row)

	return render_template("show_search_results.html", data=data)

if __name__ == "__main__":
    app.run()
# for db_row in c.execute(""" SELECT Song_ID, Artist_ID, Song_Name, Album_ID, Genre_ID FROM SONG """):
