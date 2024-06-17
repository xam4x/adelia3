#!/bin/bash

# MySQL root password
ROOT_PASSWORD="amdf3129427b3A01a1e02256c9d1c987f675d26aec7b39dfe3"

# Database and user details
DB_NAME="chess"
DB_USER="chess_user"
DB_PASSWORD="Zyc54s93gfSdce8"

# MySQL commands to drop the database, create the database and user, and set up the tables
SQL="
DROP DATABASE IF EXISTS $DB_NAME;
DROP USER IF EXISTS '$DB_USER'@'localhost';

CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;

USE $DB_NAME;

CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    board_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    file_path VARCHAR(255),
    parent_id INT DEFAULT 0,
    post_id VARCHAR(255) NOT NULL,
    last_reply_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE boards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);
"

# Run the MySQL commands
echo "$SQL" | mysql -u root -p"$ROOT_PASSWORD"

if [ $? -eq 0 ]; then
    echo "Database, user, and tables created successfully."
else
    echo "An error occurred while setting up the database."
fi
