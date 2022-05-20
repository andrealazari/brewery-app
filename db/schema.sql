CREATE DATABASE breweries_app;

\c breweries_app

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE breweries(
    id SERIAL PRIMARY KEY,
    name TEXT,
    brewery_type TEXT,
    street TEXT,
    city TEXT,
    state TEXT,
    country TEXT,
    website TEXT,
    rate INT,
    comments TEXT,
    user_id INT
);

CREATE TABLE post_likes(
    id SERIAL PRIMARY KEY,
    brewery_id INT,
    user_id INT
);