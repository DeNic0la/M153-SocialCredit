SELECT CONCAT(p.first_name, ' ', p.last_name) as Name, ROUND(w.score, 2) as Score
from Person p
         JOIN Worth w on p.id = w.person_id
ORDER BY w.score DESC;
