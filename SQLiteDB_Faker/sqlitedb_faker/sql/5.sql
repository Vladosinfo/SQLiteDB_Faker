-- Find out what courses a particular teacher teaches.
SELECT s.subjects_name, t.teacher_name 
FROM subjects s  
LEFT JOIN teachers t ON t.id = s.teacher_id 
WHERE t.id = 5