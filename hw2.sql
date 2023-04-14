USE sem1;

CREATE TABLE sales
(
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
count_product INT NOT NULL
);

SELECT * FROM sales;

INSERT sales (order_date, count_product)
VALUES
('2022-01-01', 156),
('2022-01-02', 180),
('2022-01-03', 21),
('2022-01-04', 124),
('2022-01-05', 341);

SELECT id AS 'id order',
IF(count_product < 100, 'Small order', IF(100 <= count_product AND count_product <= 300, 'Mean Order', 'Big order'))
AS 'Order type'
FROM sales;

CREATE TABLE orders
(
id INT PRIMARY KEY AUTO_INCREMENT,
employee_id VARCHAR(10),
amount DECIMAL(6,2),
order_status VARCHAR(10)
);

INSERT orders (employee_id, amount, order_status)
VALUES
('e03', 15.00, 'OPEN'),
('e01', 25.50, 'OPEN'),
('e05', 100.70, 'CLOSED'),
('e02', 22.18, 'OPEN'),
('e04', 9.50, 'CANCELLED');

SELECT * FROM orders;

SELECT id, employee_id, amount,
CASE
WHEN order_status = 'OPEN' THEN 'Order is in open state'
WHEN order_status = 'CLOSED' THEN 'Order is closed'
ELSE 'Order is cancelled'
END
as full_order_status
FROM orders;

