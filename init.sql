CREATE DATABASE IF NOT EXISTS messenger_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE messenger_db;

CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(255) PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS chats (
    user1 VARCHAR(255) NOT NULL,
    user2 VARCHAR(255) NOT NULL,
    conversation JSON,
    CHECK (JSON_VALID(conversation)),
    PRIMARY KEY (user1, user2),
    FOREIGN KEY (user1) REFERENCES users(username) ON DELETE CASCADE,
    FOREIGN KEY (user2) REFERENCES users(username) ON DELETE CASCADE
);

INSERT INTO users VALUES ('admin', 'admin@localhost.com', '1234');