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

CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE NOT NULL,
  archived BOOLEAN,
  cover_state VARCHAR(150),
  publisher VARCHAR(150),
  book_color VARCHAR(50),
  books_id INT,
  PRIMARY KEY(id),
  CONSTRAINT fk_labels FOREIGN KEY(books_id) REFERENCES labels(id)
);

CREATE TABLE Labels (
  id INT PRIMARY KEY,
  title VARCHAR(50),
  color VARCHAR(50),
  FOREIGN KEY (id) REFERENCES item(id)
);

CREATE INDEX idx_book_labels ON books(labels_id);
