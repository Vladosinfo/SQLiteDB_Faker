-- Find a list of courses taken by a specific student.
SELECT s.student_name, sb.subjects_name 
FROM students s 
LEFT JOIN students_subjects sts ON sts.student_id  = s.id 
LEFT JOIN subjects sb ON sb.id = sts.subject_id 
WHERE s.id = 7