/* 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia */
SELECT *
 FROM students
  JOIN degrees
 ON  degrees.id = students.degree_id
  WHERE degrees.name= 'Corso di Laurea in Economia';

/* 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze*/
SELECT *
 FROM degrees
JOIN departments
 ON departments.id = degrees.department_id
 WHERE departments.name = 'dipartimento di Neuroscienze' AND degrees.level= 'magistrale';

/* 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) */
SELECT *
 FROM courses
  JOIN course_teacher
 ON courses.id = course_teacher.course_id
  JOIN teachers
 ON teachers.id = course_teacher.teacher_id
  WHERE teachers.id = 44;

/* 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui
sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome */
SELECT *
 FROM students
  JOIN degrees
 ON students.degree_id = degrees.id
  JOIN departments
 ON degrees.department_id = departments.id
  ORDER BY students.name ASC, students.surname ASC;

/* 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti */
SELECT *
 FROM degrees
  JOIN courses
   ON degrees.id = courses.degree_id
 JOIN course_teacher
  ON courses.id = course_teacher.course_id
 JOIN teachers 
  ON teachers.id = course_teacher.teacher_id;

/* 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) */
SELECT DISTINCT teachers.*
 FROM teachers 
  JOIN course_teacher
 ON teachers.id = course_teacher.teacher_id
  JOIN courses
 ON courses.id = course_teacher.course_id
  JOIN degrees
 ON courses.degree_id = degrees.id
  JOIN departments
 ON degrees.department_id = departments.id
WHERE departments.name='dipartimento di matematica';


                     /*QUERY CON GROUP BY */

/* 1. Contare quanti iscritti ci sono stati ogni anno */

SELECT enrolment_date, COUNT(students.id)
FROM students
GROUP BY enrolment_date;

/* 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio */
SELECT  office_address, COUNT(*)
FROM teachers
GROUP BY  office_address;

/* 3. Calcolare la media dei voti di ogni appello d'esame */
SELECT exam_id, AVG(vote) AS media_voti
FROM exam_student
GROUP BY exam_id;


select exam_student.vote, exam_student.exam_id, exam_student.student_id
from exam_student;

/* 4. Contare quanti corsi di laurea ci sono per ogni dipartimento */
SELECT departments.name AS 'nomi dipartimenti', COUNT(degrees.name) AS 'corsi di laurea'
FROM degrees 
JOIN departments
ON departments.id = degrees.department_id
GROUP BY departments.name;
