CREATE TABLE Users (
    id INT NOT NULL PRIMARY KEY,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    balance INT NOT NULL
);

CREATE TABLE Purchases (

);

CREATE TABLE Products (
    
);

CREATE TABLE Cart (
    
);

CREATE TABLE Inventory (
    
);

CREATE TABLE Review (
    
);



