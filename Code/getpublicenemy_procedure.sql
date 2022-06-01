DROP PROCEDURE IF EXISTS sp_getPublicEnemy;

DELIMITER &&
CREATE PROCEDURE sp_getPublicEnemy()
BEGIN
    DECLARE var_highscore DEC(10,2);
    SET var_highscore = (SELECT person_id FROM Worth ORDER BY score DESC LIMIT 1)
    SELECT CONCAT_WS(' ', first_name, last_name) as 'Public Enemy' FROM Person WHERE id = var_highscore
END &&
DELIMITER ;