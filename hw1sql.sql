USE sem1;

CREATE TABLE mobile_phone
(
idphone INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR (45),
manufacturer VARCHAR (30),
product_count INT,
price DECIMAL(8,2)
);

INSERT mobile_phone (product_name, manufacturer, product_count, price)
VALUES 
('Iphone X', 'Apple', 3, 76000),
('Galaxy S9', 'Samsung', 2, 56000),
('Iphone 8', 'Apple', 1, 51000),
('P20 Pro', 'Huawei', 5, 36000);

SELECT product_name, manufacturer, price FROM mobile_phone
WHERE price > 2;

SELECT * FROM mobile_phone
WHERE manufacturer = "Samsung";

SELECT * FROM mobile_phone
WHERE product_name LIKE "%Iphone%" OR manufacturer LIKE "%Iphone%";

SELECT * FROM mobile_phone
WHERE product_name LIKE "%Samsung%" OR manufacturer LIKE "%Samsung%";

SELECT * FROM mobile_phone
WHERE product_name LIKE "%8%";
