from datetime import datetime
from faker import Faker
from random import randint, choice
import sqlite3

# ~30-50 студентов, 
# 3 группы, 
# 5-8 предметов, 
# 3-5 преподавателей, 
# до 20 оценок у каждого студента по всем предметам

NUMBER_STUDENT = 50     # (30 - 50)
NUMBER_GROUP = 3
NUMBER_STUDENTS_IN_GROUP = [15, 32, 18]
NUMBER_SUBJECT = 8      # (5 - 8)
NUMBER_TEACHER = 5      # (3 - 5)
NUMBER_GRADES = 20      # ( up to 20 grades for each students in all subjects )

fake = Faker()


# def gen_fake_data(num_stud, num_group, num_subj, num_teachers, num_grades) -> tuple():
def gen_fake_data(num_stud, num_subj, num_teachers):
    fake_students = []
    fake_group = ["Group_1", "Group_2", "Group_3"]
    fake_subject = ["Python", "SQL", "JavaScript", "HTML_CSS", "Datasigns", "Mathematics", "Databases", "OS"]
    fake_teacher = []
    fake_grades = [1,2,3,4,5]

    # fake = Faker()

    for _ in range(num_stud):
        fake_students.append(fake.name())

    # for _ in range(num_subj):
    #     fake_subject.append(fake.name())

    for _ in range(num_teachers):
        fake_teacher.append(fake.name())

    return fake_students, fake_group, fake_subject, fake_teacher, fake_grades


def prepare_data(studs, groups, subjects, teachers, grades):

    # fake = Faker()
    for_students = []
    id_stud = 1
    group = 1
    for student in studs:
        if id_stud > NUMBER_STUDENTS_IN_GROUP[0] and id_stud <= NUMBER_STUDENTS_IN_GROUP[1]:
            group = 2
        if id_stud > NUMBER_STUDENTS_IN_GROUP[1]:
            group = 3
        for_students.append((student, group))
        id_stud +=1

    for_groups = []
    for group in groups:
        # for_groups.append(group)
        for_groups.append((group, ))

    for_subjects = []
    for subject in subjects:
        for_subjects.append((subject, randint(1, NUMBER_TEACHER)))

    for_teachers = []
    for teacher in teachers:
        for_teachers.append((teacher, ))  

    for_students_subjects = []
    for subj_id in range(NUMBER_SUBJECT):
        for stud_id in range(NUMBER_STUDENT):
            for_students_subjects.append((stud_id, subj_id))

    # num variations of students - subjects
    num_var_stud_dub = NUMBER_STUDENT * NUMBER_SUBJECT
    for_grades = []
    for num_var in range(num_var_stud_dub):
        for _ in range(randint(15, NUMBER_GRADES)):
            for_grades.append((randint(1, 5), 
                               fake.date_between_dates(date_start=datetime(2022,9,1), date_end=datetime(2023,5,31))
                               , num_var))
            
    return for_students, for_groups, for_subjects, for_teachers, for_grades, for_students_subjects
        
def insert_data_db(studs, groups, subjects, teachers, grades, studs_subjects):

    with sqlite3.connect('db/university.db') as db_con:
        cur = db_con.cursor()

    insert_to_students = """INSERT INTO students(student_name, group_id) VALUES(?, ?)"""
    cur.executemany(insert_to_students, studs)

    insert_to_groups = """INSERT INTO groups(group_name) VALUES(?)"""
    cur.executemany(insert_to_groups, groups)

    insert_to_subjects = """INSERT INTO subjects(subjects_name, teacher_id) VALUES(?, ?)"""
    cur.executemany(insert_to_subjects, subjects)

    insert_to_teachers = """INSERT INTO teachers(teacher_name) VALUES(?)"""
    cur.executemany(insert_to_teachers, teachers)

    insert_to_grades = """INSERT INTO grades(grade, date_of, student_subject_id) VALUES(?, ?, ?)"""
    cur.executemany(insert_to_grades, grades)

    insert_to_studs_subjects = """INSERT INTO students_subjects(student_id, subject_id) VALUES(?, ?)"""
    cur.executemany(insert_to_studs_subjects, studs_subjects)


    db_con.commit()
    
    
if __name__ == "__main__":
    studs, groups, subjects, teachers, grades, studs_subjects = prepare_data(*gen_fake_data(NUMBER_STUDENT, NUMBER_SUBJECT, NUMBER_TEACHER))
    insert_data_db(studs, groups, subjects, teachers, grades, studs_subjects)

    # print(gen_fake_data(NUMBER_STUDENT, NUMBER_SUBJECT, NUMBER_TEACHER))
    # fk = Faker()
    # print(dir(fk))





