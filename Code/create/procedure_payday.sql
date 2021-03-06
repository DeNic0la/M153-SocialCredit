DROP PROCEDURE IF EXISTS sp_personalPayday;
DELIMITER &&
CREATE PROCEDURE sp_personalPayday(
    IN var_personId INT
)
BEGIN
    DECLARE var_score DEC(10, 2);
    DECLARE var_worstPunishmentId DEC(10, 2);
    DECLARE var_PunishmentValue DEC(10, 2);
    SET var_score = (SELECT score FROM Worth WHERE person_id = var_personId);
    SET var_worstPunishmentId = (SELECT id FROM Punishments WHERE trigger_score >= var_score ORDER BY id ASC LIMIT 1);
    SET var_PunishmentValue =
            (SELECT trigger_score FROM Punishments WHERE trigger_score >= var_score ORDER BY id ASC LIMIT 1);


    INSERT INTO Executed_Punishments (is_executed, person_id, punishment_id)
    VALUES (false, var_personId, var_worstPunishmentId);
    UPDATE Worth W SET score = if(score < 0, score + (var_PunishmentValue * -1), score) WHERE person_id = var_personId;
END &&
DELIMITER ;
