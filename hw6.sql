USE lesson6;

/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

2. Выведите только четные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DROP FUNCTION IF EXISTS task61;
DELIMITER //
CREATE FUNCTION task61(num INT)
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN
	DECLARE count INT DEFAULT 0;
    DECLARE d_sec INT DEFAULT 86400;
    DECLARE result VARCHAR(100) DEFAULT ' ';
    DECLARE DD VARCHAR(20) DEFAULT 'days';
    DECLARE HH VARCHAR(20) DEFAULT 'hours';
    DECLARE MM VARCHAR(20) DEFAULT 'minutes';
    DECLARE SS VARCHAR(20) DEFAULT 'seconds';
        SET count = FLOOR(num /d_sec);
        SET num = num % d_sec;
		SET DD = CONCAT(count, ' ', DD);
        SET result = CONCAT(DD, ';');
    SET count = num / 3600;
    SET num = num % 3600;
    SET HH = CONCAT(count, ' ', HH);
    SET result = CONCAT(result, ' ', HH);
    SET count = num / 60;
    SET num = num % 60;
    SET MM = CONCAT(count, ' ', MM);
    SET result = CONCAT(result, ' ;', MM);
    SET SS = CONCAT(num, ' ', SS);
    SET result = CONCAT(result, ' ;', SS);
    RETURN result;
END//
DELIMITER ;
SELECT task61(2163167);

DROP FUNCTION IF EXISTS task62;
DELIMITER //
CREATE FUNCTION task62(num INT)
RETURNS VARCHAR(30)
DETERMINISTIC 
BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE result VARCHAR(30) DEFAULT ' ';
	WHILE i <= num DO
		IF i % 2 = 0
        THEN SET result = CONCAT(result, ' ', i);
        END IF;
        SET i = i + 1;
	END WHILE;
    RETURN result;
END//
DELIMITER ;
SELECT task62(10);