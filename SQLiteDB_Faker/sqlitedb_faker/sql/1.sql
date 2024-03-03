-- Find the 5 students with the highest average score in all subjects.
SELECT s.student_name, sb.subjects_name, AVG(g.grade) AS grade 
FROM students_subjects sts
LEFT JOIN grades g ON g.student_subject_id = sts.id 
LEFT JOIN students s ON s.id = sts.student_id 
LEFT JOIN subjects sb ON sb.id = sts.subject_id  
GROUP BY sts.subject_id, sts.student_id
ORDER BY grade DESC 
LIMIT 5