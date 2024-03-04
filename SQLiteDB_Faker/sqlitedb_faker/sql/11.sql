-- The average grade that a certain teacher gives to a certain student.
SELECT t.teacher_name, s.student_name, AVG(g.grade) AS grade 
FROM grades g 
LEFT JOIN students_subjects sts ON sts.id = g.student_subject_id 
RIGHT JOIN subjects sb ON sb.id = sts.subject_id 
LEFT JOIN teachers t ON t.id = sb.teacher_id 
RIGHT JOIN students s ON s.id = sts.student_id 
WHERE t.id = 5 AND s.id = 7
GROUP BY s.id, t.id 