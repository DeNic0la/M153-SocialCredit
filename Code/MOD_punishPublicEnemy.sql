SET @personId := (SELECT person_id
                  FROM Worth
                  ORDER BY score ASC
                  LIMIT 1);
CALL sp_personalPayday(@personId);
SELECT Pu.name                                  as 'Punishment Name',
       CONCAT(Pe.first_name, ' ', Pe.last_name) as 'Criminal Name',
       Pu.serverity                             as 'Punishment Severity',
       ROUND(W.score, 2)                        as 'Person Worth'
from Executed_Punishments Ep
         JOIN Person Pe on Pe.id = Ep.person_id
         JOIN Punishments Pu on Pu.id = Ep.punishment_id
         JOIN Worth W on Pe.id = W.person_id
WHERE Ep.is_executed = 0
  AND Pe.id = @personId
