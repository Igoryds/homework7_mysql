DELIMITER $$ -- //
CREATE FUNCTION FormatSeconds(seconds INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE formatted VARCHAR(255);
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;

    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds % 86400;
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;

    SET formatted = CONCAT(days, ' дней ', hours, ' часов ', minutes, ' минут ', seconds, ' секунд');
    RETURN formatted;
END $$ -- //

DELIMITER ;

SELECT FormatSeconds(6) AS formatted_time;

DELIMITER $$ -- //

DELIMITER $$ -- //

CREATE PROCEDURE PrintEvenNumbers()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE result VARCHAR(255) DEFAULT '';

    WHILE i <= 10 DO
        IF i % 2 = 0 THEN
            SET result = CONCAT(result, i, ', ');
        END IF;
        SET i = i + 1;
    END WHILE;

    -- Убираем последнюю запятую и пробел
    SET result = SUBSTRING(result, 1, LENGTH(result) - 2);

    SELECT result AS even_numbers;
END $$ -- //

DELIMITER ;

-- Вызов процедуры:
CALL PrintEvenNumbers();

