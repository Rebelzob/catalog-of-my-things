CREATE TABLE item (
  id SERIAL PRIMARY KEY,
  genre VARCHAR(50),
  author VARCHAR(50),
  source VARCHAR(50),
  label VARCHAR(50),
  publish_date TIMESTAMP,
  archived BOOLEAN
);

CREATE TABLE source (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  item_id INT REFERENCES item(id)
);
CREATE INDEX idx_source_item_id ON source(item_id);

CREATE TABLE movie (
  id INT REFERENCES item(id),
  genre VARCHAR(50),
  author VARCHAR(50),
  source VARCHAR(50),
  label VARCHAR(50),
  silent BOOLEAN,
  PRIMARY KEY (id)
);


CREATE TABLE Games (
  id INT PRIMARY KEY,
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (id) REFERENCES item(id)
);

CREATE TABLE Authors (
 id INT PRIMARY KEY,
 first_name VARCHAR(255)
 last_name VARCHAR(255),
);