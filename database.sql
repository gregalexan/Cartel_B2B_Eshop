use ismgroup58;

/*
drop table order_products;
drop table orders;
drop table reviews;
drop table product; 
drop table user;
*/ 

CREATE TABLE user (
	name VARCHAR(50) NOT NULL,
	email VARCHAR(100) NOT NULL UNIQUE,
    ssn VARCHAR(9) UNIQUE,
    username VARCHAR(20) NOT NULL PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    joined date,
    image VARCHAR(100),
    phone VARCHAR(10),
	city VARCHAR(100),
	address VARCHAR(100),
	zip INT(5)
);
CREATE TABLE product (
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(100),
    image VARCHAR(100),
    category VARCHAR(100),
    description VARCHAR(1000),
    price DOUBLE,
    stock INT,
    supplier VARCHAR(20), -- supplier of the product
	FOREIGN KEY (supplier) REFERENCES user(username) ON DELETE CASCADE
);
CREATE TABLE reviews (
	stars INT,
    review VARCHAR(300),
    productID INT NOT NULL, 
    username VARCHAR(20) NOT NULL,
    CONSTRAINT R_F1 FOREIGN KEY(productID) REFERENCES product(productID) ON DELETE CASCADE,
    CONSTRAINT R_F2 FOREIGN KEY(username) REFERENCES user(username) ON DELETE CASCADE
);
CREATE TABLE orders (
    orderID INT AUTO_INCREMENT PRIMARY KEY,
    ordered DATETIME NOT NULL,
    shipped DATETIME,
    status VARCHAR(50)
);
CREATE TABLE order_products (
	orderID INT NOT NULL,
	productID INT NOT NULL,
    quantity INT,
    customer VARCHAR(20),
    CONSTRAINT OP_F1 FOREIGN KEY(orderID) REFERENCES orders(orderID) ON DELETE CASCADE,
	CONSTRAINT OP_F2 FOREIGN KEY(productID) REFERENCES product(productID) ON DELETE CASCADE, 
    CONSTRAINT OP_F3 FOREIGN KEY(customer) REFERENCES user(username) ON DELETE CASCADE
);
