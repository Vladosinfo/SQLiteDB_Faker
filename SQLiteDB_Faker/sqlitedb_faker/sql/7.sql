-- Find the grades of students in a specific group in a specific subject.
SELECT s.student_name, gr.group_name, sb.subjects_name, g.grade 
FROM grades g 
LEFT JOIN students_subjects sts ON sts.id = g.student_subject_id 
LEFT JOIN students s ON s.id = sts.student_id 
RIGHT JOIN groups gr ON gr.id = s.group_id 
right JOIN subjects sb ON sb.id = sts.subject_id 
WHERE sb.id = 5 AND gr.id = 3