/* 1 Selezionare tutti gli studenti nati nel 1990*/
SELECT `students`.*
FROM `students`
WHERE YEAR(`students`.`date_of_birth`)=1990;

/* 2 Selezionare tutti i corsi che valgono più di 10 crediti*/
SELECT `students`. *
FROM `courses`
WHERE `courses`.`cfu`>10;

/* 3 Selezionare tutti gli studenti che hanno più di 30 anni */
SELECT `students`.*
FROM `students`
WHERE `students`.`date_of_birth` < '1996-01-01';

/* 4 Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea*/
SELECT `courses`.*
FROM `courses`
WHERE `courses`.`year`='1' AND
`courses`.`period`= 'I semestre';

/* 5 Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020*/
SELECT `exams`. *
FROM `exams`
WHERE `exams`.`date`= '2020-06-20' AND
`exams`.`hour`> '14:00:00';

/*Seleziona tutti i corsi di laurea magistrale*/
SELECT `degrees`.*
FROM `degrees`
WHERE `degrees`.`name` LIKE 'corso di laurea magistrale%';

/*Da quanti dipartimenti è composta l'università? */
SELECT COUNT(*)
FROM `departments`;

/*Quanti sono gli insegnanti che non hanno un numero di telefono?*/
SELECT COUNT(*)
FROM `teachers`
WHERE `teachers`.`phone`IS NULL;
