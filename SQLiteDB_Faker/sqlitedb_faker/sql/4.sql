-- Find the average score on the stream (across the entire table of grades).
SELECT AVG(g.grade) AS grade 
FROM grades g
LEFT JOIN students_subjects sts ON sts.id = g.student_subject_id 
LEFT JOIN subjects s ON s.id = sts.subject_id 