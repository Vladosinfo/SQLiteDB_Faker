-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name VARCHAR(40) UNIQUE NOT NULL,
    student_surname VARCHAR(40) UNIQUE NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE   
);

-- Table: groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(40) UNIQUE NOT NULL
);

-- Table: students_subjects
DROP TABLE IF EXISTS students_subjects;
CREATE TABLE students_subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    subject_id INTEGER NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table: grades
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    grade VARCHAR(40) UNIQUE NOT NULL,
    date_of DATE NOT NULL,
    student_subject_id INTEGER,
    FOREIGN KEY (student_subject_id) REFERENCES students_subjects (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table: subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subjects_name VARCHAR(40) UNIQUE NOT NULL
);

-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher_name VARCHAR(40) UNIQUE NOT NULL,
    teacher_surname VARCHAR(40) UNIQUE NOT NULL,
    subject_teacher_id INTEGER,
    FOREIGN KEY (subject_teacher_id) REFERENCES subjects (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
