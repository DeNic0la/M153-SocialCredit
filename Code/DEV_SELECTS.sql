SELECT * FROM Person
JOIN Worth W on Person.id = W.person_id;

SELECT * FROM Worth;

select * from Person
JOIN Worth W on Person.id = W.person_id
JOIN Executed_Punishments EP on Person.id = EP.person_id
JOIN Punishments P on P.id = EP.punishment_id;