BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE neo (
    db_id serial PRIMARY KEY,
    nasa_id varchar(255) NOT NULL,
    user_id int NOT NULL,
    neo_date DATE,
    neo_name varchar(255),
    hazardous boolean,
    min_diameter numeric (8, 8),
    max_diameter numeric (8, 8),
    CONSTRAINT FK_neo_users FOREIGN KEY (user_id)
      REFERENCES users(user_id)
);

COMMIT TRANSACTION;
