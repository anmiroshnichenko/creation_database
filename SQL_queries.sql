sudo -u postgres psql -c "CREATE ROLE test WITH login password '123';"
CREATE ROLE
sudo -u postgres psql -c "CREATE DATABASE music_service  WITH OWNER test;"
CREATE DATABASE

-- один ко многим

CREATE TABLE IF NOT EXISTS albums  (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year_of_release  DATE
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	albums_id INTEGER NOT NULL REFERENCES  albums(id),
	number INTEGER NOT NULL,
	title VARCHAR(60) NOT NULL,
	duration  TIME
);


select * from albums;
select * from tracks;
