CREATE TABLE IF NOT EXISTS music_genre (
	id_genre SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS musician (
	id_musician SERIAL PRIMARY KEY,
	musician_name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS MusicianGenre (
	id_musician INTEGER REFERENCES musician(id_musician),
	id_genre INTEGER REFERENCES music_genre(id_genre),
	CONSTRAINT pk_MG PRIMARY KEY (id_musician, id_genre)
);

CREATE TABLE IF NOT EXISTS album (
	id_album SERIAL PRIMARY KEY,
	album_name VARCHAR(40) NOT null,
	release_year date
);

CREATE TABLE IF NOT EXISTS AlbumMusician (
	id_musician INTEGER REFERENCES musician(id_musician),
	id_album INTEGER REFERENCES album(id_album),
	CONSTRAINT pk_AM PRIMARY KEY (id_musician, id_album)
);

CREATE TABLE IF NOT EXISTS track (
	id_track SERIAL PRIMARY KEY,
	track_name VARCHAR(40) NOT null,
	duration INTEGER not null,
	id_album INTEGER NOT NULL REFERENCES album(id_album)
);

CREATE TABLE IF NOT EXISTS collection (
	id_collection SERIAL PRIMARY KEY,
	collection_name VARCHAR(40) NOT null,
	release_year date
);

CREATE TABLE IF NOT EXISTS CollectionList (
	id_collection INTEGER REFERENCES collection(id_collection),
	id_track INTEGER REFERENCES track(id_track),
	CONSTRAINT pk_CL PRIMARY KEY (id_collection, id_track)
);