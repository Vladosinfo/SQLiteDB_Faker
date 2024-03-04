-- Find the average grade given by a certain teacher in his subjects.
SELECT t.teacher_name, s.subjects_name, AVG(g.grade) AS grade
FROM grades g 
LEFT JOIN students_subjects sts ON sts.id = g.student_subject_id 
RIGHT JOIN subjects s ON s.id = sts.subject_id 
LEFT JOIN teachers t ON t.id = s.teacher_id 
WHERE t.id =3
GROUP BY s.id