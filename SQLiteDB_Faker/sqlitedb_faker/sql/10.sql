-- A list of courses taught to a particular student by a particular instructor.
SELECT s.subjects_name, st.student_name, t.teacher_name 
FROM subjects s 
LEFT JOIN teachers t ON t.id = s.teacher_id 
LEFT JOIN students_subjects sts ON sts.subject_id = s.id 
LEFT JOIN students st on st.id = sts.student_id 
WHERE st.id = 7 AND t.id = 5