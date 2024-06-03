sudo -u postgres psql -c "CREATE ROLE test WITH login password '123';"
CREATE ROLE
sudo -u postgres psql -c "CREATE DATABASE music_service  WITH OWNER test;"
CREATE DATABASE


CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL);

CREATE TABLE IF NOT EXISTS artists (
	id SERIAL PRIMARY KEY,
	name  VARCHAR(60) NOT NULL); 

CREATE TABLE IF NOT EXISTS genres_artists (
	id SERIAL PRIMARY KEY,
	genres_id  INTEGER NOT NULL REFERENCES genres(id),
	artists_id INTEGER NOT NULL REFERENCES artists(id));


CREATE TABLE IF NOT EXISTS albums  (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year_of_release  DATE);

CREATE TABLE IF NOT EXISTS artists_albums  (
	id SERIAL PRIMARY KEY,
	artists_id  INTEGER NOT NULL REFERENCES artists(id),
	albums_id INTEGER NOT NULL REFERENCES albums(id));

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	albums_id INTEGER NOT NULL REFERENCES  albums(id),
	number INTEGER NOT NULL,
	title VARCHAR(60) NOT NULL,
	duration  INTEGER);

CREATE TABLE IF NOT EXISTS tracklists  (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year_of_release  DATE);

CREATE TABLE IF NOT EXISTS tracks_tracklists  (
	id SERIAL PRIMARY KEY,
	tracks_id  INTEGER NOT NULL REFERENCES tracks(id),
	tracklists_id INTEGER NOT NULL REFERENCES tracklists(id));



