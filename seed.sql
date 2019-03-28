DROP DATABASE IF EXISTS letswork;
CREATE DATABASE letswork;

\c letswork;

CREATE TABLE users (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR UNIQUE NOT NULL,
    email VARCHAR UNIQUE NOT NULL,
    avatar VARCHAR UNIQUE NOT NULL,
    created TIMESTAMP DEFAULT NOW(),
    updated TIMESTAMP DEFAULT NOW()
);

CREATE TABLE posts (
    user_id INT REFERENCES users(id) ,
    caption VARCHAR NOT NULL,
    likes VARCHAR NOT NULL,
    comments VARCHAR NOT NULL,
    created TIMESTAMP DEFAULT NOW(),
    updated TIMESTAMP DEFAULT NOW(),
    avatar VARCHAR REFERENCES users(avatar)
);

CREATE TABLE comments (
    user_id INT REFERENCES users(id),
    comment VARCHAR NOT NULL,
    created TIMESTAMP DEFAULT NOW(),
    updated TIMESTAMP DEFAULT NOW(),
    avatar VARCHAR REFERENCES users(avatar)

);

INSERT INTO users
(username, email, avatar) VALUES
('userone', 'userone@email.com', 'https://ca.slack-edge.com/TD416AWAE-UD52WKQPR-05976bd60d01-48');

INSERT INTO posts
(caption, likes, comments)VALUES
('poppin gz','62783871','hey jo');

INSERT INTO comments
(comment)VALUES
('the users comment')
