UPDATE Executed_Punishments Ep SET Ep.is_executed = 1, Ep.execution_time = NOW()
WHERE Ep.is_executed = 0;
