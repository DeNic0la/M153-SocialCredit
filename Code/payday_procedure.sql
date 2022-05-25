DROP PROCEDURE IF EXISTS sp_personalPayday;
DELIMITER &&
CREATE PROCEDURE sp_personalPayday (
    IN @personId INT
)BEGIN
    DECLARE @score DEC;
    DECLARE @worstPunishmentId DEC;
    SET @score = (SELECT score FROM Worth WHERE person_id = @personId);
    SET @worstPunishmentId = (SELECT id FROM Punishments WHERE trigger_score <= @score ORDER BY id DESC LIMIT 1);
    INSERT INTO Executed_Punishments (is_executed, person_id, punishment_id) VALUES (false, @personId, @worstPunishmentId);
END &&
DELIMITER ;