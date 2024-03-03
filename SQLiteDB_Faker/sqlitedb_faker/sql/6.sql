SELECT s.student_name, g.group_name  
FROM students s
LEFT JOIN groups g ON g.id = s.group_id 
WHERE g.id = 3
