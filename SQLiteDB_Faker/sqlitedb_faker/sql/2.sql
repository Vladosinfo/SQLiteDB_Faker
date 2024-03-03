-- Find the student with the highest grade point average in a specific subject.
SELECT s.student_name, sb.subjects_name, AVG(g.grade) AS grade
FROM students_subjects sts 
LEFT JOIN grades g ON g.student_subject_id = sts.id 
LEFT JOIN students s ON s.id = sts.student_id 
LEFT JOIN subjects sb ON sb.id = sts.subject_id  
WHERE sts.subject_id  = 7
GROUP BY sts.student_id 
ORDER BY grade DESC 
LIMIT 1