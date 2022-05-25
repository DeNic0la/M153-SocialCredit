DROP PROCEDURE IF EXISTS sp_personalPayday;
CREATE PROCEDURE sp_personalPayday
    @personId AS INT
AS BEGIN
    DECLARE @score DOUBLE = (SELECT score FROM Worth WHERE person_id = @personId);
    DECLARE @worstPunishmentId INT = (SELECT id FROM Punishments WHERE trigger_score <= @score ORDER BY id DESC LIMIT 1)
    EXEC INSERT INTO Executed_Punishments (execution_time, is_executed, person_id, punishment_id) VALUES ();
END