CREATE TABLE source (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
  item_id INT REFERENCES item(id)
);
CREATE INDEX idx_source_item_id ON source(item_id);