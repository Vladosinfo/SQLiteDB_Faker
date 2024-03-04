-- Find the average score in groups in a specific subject.
SELECT gr.group_name, AVG(g.grade) AS grade 
FROM grades g
LEFT JOIN students_subjects sts ON sts.id = g.student_subject_id 
LEFT JOIN students st ON st.id = sts.student_id 
RIGHT JOIN groups gr ON gr.id = st.group_id 
LEFT JOIN subjects s ON s.id = sts.subject_id 
WHERE s.id = 7
GROUP BY gr.id 