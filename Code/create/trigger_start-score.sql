DROP TRIGGER IF EXISTS set_startScore;
CREATE TRIGGER set_startScore
    AFTER INSERT
    ON Person
    FOR EACH ROW
BEGIN
    INSERT INTO Worth (score, person_id)
    VALUES (10, NEW.id);
END;
