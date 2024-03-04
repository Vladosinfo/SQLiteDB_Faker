-- Grades of students in a certain group in a certain subject in the last lesson.
SELECT s.student_name, sb.subjects_name, gr.group_name, g.grade, g.date_of
FROM grades g
LEFT JOIN students_subjects sts ON sts.id = g.student_subject_id  
RIGHT JOIN students s ON s.id = sts.student_id 
LEFT JOIN groups gr ON gr.id = s.group_id 
RIGHT JOIN subjects sb ON sb.id = sts.subject_id 
WHERE gr.id = 3 AND sb.id = 7 AND g.date_of = (SELECT MAX(date_of) FROM grades)