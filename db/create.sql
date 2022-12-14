CREATE TABLE Users (
    id INT NOT NULL PRIMARY KEY,
    email VARCHAR UNIQUE NOT NULL,
    type_user ENUM("Buyer", "Seller", "Buyer+Seller") NOT NULL,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    balance INT NOT NULL
);

CREATE TABLE Products (
    CONSTRAINT ps_id PRIMARY KEY (pid,seller_id),
    pid INT NOT NULL,
    seller_id INT NOT NULL REFERENCES Users(id), 
    category VARCHAR(255) NOT NULL,
    short_name VARCHAR(255) NOT NULL,
    longer_description VARCHAR(255) NOT NULL,
    product_image VARCHAR(255) NOT NULL, 
    price VARCHAR(255) NOT NULL
    quantity_available INT NOT NULL
);

CREATE TABLE Carts (
    user_id INT NOT NULL REFERENCES Users(id),
    pid INT NOT NULL REFERENCES Products(pid),
    quantity INT NOT NULL,
    seller_id INT NOT NULL REFERENCES Users(id)
);

CREATE TABLE Purchases (
    id INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    user_id INT NOT NULL REFERENCES Users(id),
    pid INT NOT NULL REFERENCES Products(pid),
    quantity INT NOT NULL,
    order_id INT NOT NULL REFERENCES Order(id),
    seller_id INT NOT NULL REFERENCES Users(id),
    fulfillment_status BOOLEAN NOT NULL 
);

CREATE TABLE Orders (
    id INT NOT NULL PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    uid INT NOT NULL REFERENCES Users(id),
    time_order timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    total_amount FLOAT NOT NULL,
    number_of_items INT NOT NULL, 
    fulfillment_status BOOLEAN NOT NULL
);

CREATE TABLE Review_Products (
    user_id INT NOT NULL REFERENCES Users(id),
    pid INT NOT NULL REFERENCES Products(pid),
    rating FLOAT NOT NULL CHECK(rating >= 0 AND rating <=5),
    time_review timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    review VARCHAR(255)
);

CREATE TABLE Review_Sellers (
    user_id INT NOT NULL REFERENCES Users(id),
    seller_id INT NOT NULL REFERENCES Users(id),
    rating FLOAT NOT NULL CHECK(rating >= 0 AND rating <=5)
    time_review timestamp without time zone NOT NULL DEFAULT (current_timestamp AT TIME ZONE 'UTC'),
    review VARCHAR(255)
);



