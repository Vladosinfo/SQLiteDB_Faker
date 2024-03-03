SELECT T.teacher_name, s.subjects_name 
FROM teachers t 
RIGHT JOIN subjects s ON t.id = s.teacher_id 
WHERE T.id = 5
