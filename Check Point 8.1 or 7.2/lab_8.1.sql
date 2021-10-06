-- PART ONE

DELIMITER //

CREATE PROCEDURE circle_area(IN radius DOUBLE, OUT area DOUBLE)
BEGIN
    SELECT ((pi()*radius)*radius) INTO area;
END//
DELIMITER ;

SET @area=0.0, @radius=20.5;
CALL circle_area(@radius, @area);
SELECT CONCAT(ROUND(@area, 2), LOWER(' CMS')) AS 'Total Area';

-- PART 2

DELIMITER //
CREATE PROCEDURE circle_area_inout(INOUT next_area DOUBLE)
BEGIN
    SELECT ((pi()*next_area)*next_area) INTO next_area;
END //
DELIMITER ;
SET @next_area=10.5;
CALL circle_area_inout(@next_area);
SELECT CONCAT(ROUND(@next_area, 2), LOWER(' CMS')) AS 'Total Area';

-- PART 3

DELIMITER $$
CREATE DEFINER=root@localhost 
FUNCTION get_area(newArea DOUBLE) 
RETURNS double
DETERMINISTIC
SQL SECURITY INVOKER
COMMENT 'returns a double datatype;calculates an area'
BEGIN
    RETURN ((pi()*newArea)*newArea);
END$$
DELIMITER ;

SELECT ROUND(get_area(20.5),2);

-- PART 4
-- CALCULATE YEARS BETWEEN BIRTH AND NOW
DELIMITER $$
CREATE DEFINER=root@localhost 
FUNCTION get_years(birth YEAR(4)) 
RETURNS int(3)
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT 'calculates years between birth and now'
BEGIN
    RETURN (YEAR(NOW()) - birth);
END$$
DELIMITER ;

SELECT get_years(1980) AS 'Birth <> Now';