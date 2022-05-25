DROP TRIGGER IF EXISTS set_startScore;
CREATE TRIGGER set_startScore ON Person AFTER INSERT AS
BEGIN
INSERT INTO Worth (score, person_id)
VALUES (10, (SELECT id FROM inserted));
END
go