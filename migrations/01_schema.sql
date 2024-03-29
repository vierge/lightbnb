DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS properties;
DROP TABLE IF EXISTS reservations;
DROP TABLE IF EXISTS property_reviews;

CREATE TABLE users(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255)     NOT NULL,
  email VARCHAR(255)    NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE properties(
  id SERIAL PRIMARY KEY                 NOT NULL,
  title VARCHAR(255)                    NOT NULL,
  description TEXT,
  owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
  thumbnail_photo_url VARCHAR(255),
  cover_photo_url VARCHAR(255),
  cost_per_night INTEGER,
  parking_spaces INTEGER,
  number_of_bathrooms INTEGER,
  number_of_bedrooms INTEGER,
  country VARCHAR(255),
  street VARCHAR(255),
  city VARCHAR(255),
  province VARCHAR(255),
  post_code VARCHAR(255),
  active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE reservations(
  id SERIAL PRIMARY KEY                         NOT NULL,
  start_date DATE,
  end_date DATE,
  property_id INTEGER REFERENCES properties(id)  ON DELETE CASCADE,
  guest_id INTEGER REFERENCES users(id)          ON DELETE CASCADE
);

CREATE TABLE property_reviews(
  id SERIAL PRIMARY KEY                              NOT NULL,
  guest_id INTEGER REFERENCES users(id)               ON DELETE CASCADE,
  property_id INTEGER REFERENCES properties(id) ON DELETE CASCADE,
  reservation_id INTEGER REFERENCES reservations(id)  ON DELETE CASCADE,
  rating SMALLINT,
  message TEXT
);