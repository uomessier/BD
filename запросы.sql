#ПРОСТОЙ ОПЕРАТОР SELECT
#вывести имена студентов
SELECT student_name FROM student;

#вывести все из таблицы дисциплин
SELECT * FROM subject;

#информация о преподавателяъ
SELECT teacher_name, email, working_period, birthday FROM teacher;

#вывести все из таблиц дисциплин и студентов
SELECT * FROM subject, student;

# вывод колонок с преподавателями и предметами из двух таблиц
SELECT teacher_name, subject_name FROM teacher, subject;

#выведем первых 10 студентов
SELECT * FROM student LIMIT 10;


#ИСПОЛЬЗОВАНИЕ ПРЕДИКАТОВ СРАВНЕНИЯ
#вывести все внешние ключи из таблицы оценок, начиная с 11по списку
SELECT id_student, id_subject, id_college_group 
	FROM marks WHERE id_mark > 10; 

#вывести студентов и контакты старше данной даты рождения
SELECT student_name, email, phone_num 
	FROM student WHERE birthday=>'2004-11-24';

#вывести предметы и их id, где количество уч.часов<50 
SELECT id_subject, subject_name
      FROM subject WHERE num_hours<=50;

#имена и должности всех преподавателей, кроме директора
SELECT teacher_name, position 
	FROM teacher WHERE position!='директор';

#вывести все оценки отлично, id студента и семестр,
SELECT mark, id_student, semester
      FROM subject WHERE mark='отлично';



#ЗАПРОСЫ С ИСПОЛЬЗОВАНИЕМ НЕСКОЛЬКИХ ТАБЛИЦ

#вывод преподавателей и их кабинетов
SELECT teacher_name, room_type FROM teacher, room
WHERE teacher.id_room = room.id_room;

#вывод семестра, оценки и студента
SELECT semester, mark, student_name 
   FROM marks, student
   WHERE marks.id_student = student.id_student;

#объединение столбцов с именем и телефоном преподавателя со столбцами предметов и количеством уч. часов в одну таблицу
SELECT teacher.teacher_name, teacher.phone_num, subject.subject_name, subject.num_hours
     FROM  teacher, subject
    	 WHERE  teacher.id_teacher = subject.id_subject;

#объедиение нескольких колонок из таблиц колледж, группа и студент по id
 SELECT 	college_group.id_college_group, college_group.name_group, college_group.num_semester,
 			student.student_name, student.birthday, student.email,
			teacher.teacher_name, teacher.working_period, teacher.position
     FROM college_group, student, teacher
     		WHERE college_group.id_college_group = student.id_student = teacher.id_teacher;

#вывод всей информации о группе конкретного студента
SELECT * FROM college_group WHERE id_college_group =
(SELECT id_college_group FROM student WHERE student_name='Юльева Юлия Юлиевна');




#ИСПОЛЬЗОВАНИЕ ПРЕДИКАТОВ OR, AND, NOT

#вывести все из таблицы оценок для id групп <5 и id студентов > 10
SELECT * FROM marks
	WHERE id_college_group < 5 AND id_student > 10;

#вывести id оценок за осенний семестр или оценки хорошо по предмету, кроме id = 3
SELECT id_mark FROM marks
	WHERE (semester LIKE 'ос%'OR mark LIKE '%шо')
		AND NOT id_subject NOT '3';


#вывод id учителей по определенным значениям
SELECT id_teacher FROM teacher
	WHERE (position = 'директор' OR id_room BETWEEN 1 AND 6)
		AND birthday <= '1973-02-20';

#вывод имен студентов, контактов и группы, сортирован по имени студента и фильтр по возрасту
SELECT student_name, email, phone_num, name_group FROM student, college_group
	WHERE college_group.id_college_group = student.id_college_group
	AND birthday <= '2000-11-24'
	ORDER BY student_name;

#вывод из расписания по дням недели  времени занятий, предметы, преподавателей и группы
SELECT weekday, lesson_time, subject_name, teacher_name, name_group FROM timetable, subject, teacher, college_group
	WHERE timetable.id_subject = subject.id_subject
	AND  timetable.id_teacher = teacher.id_teacher
	AND  timetable.id_college_group = college_group.id_college_group
	ORDER BY weekday;


#ИСПОЛЬЗОВАНИЕ ПРЕДИКАТОВ BETWEEN LIKE

#выведем предметы с определенным количеством учебныз часов
SELECT subject_name FROM subject
 WHERE num_hours BETWEEN 48 AND 57;

#вывод все из таблицы групп, которые учатся с 2 по 7 осенний семестр
SELECT * FROM college_group
 WHERE current_semester LIKE 'ос%'
 AND num_semester BETWEEN 2 AND 7;

#  веведем всех студентов у которых есть оценка хорошо по химии или физике
SELECT mark, student_name, subject_name FROM marks, student, subject
 WHERE mark LIKE 'хор%' 
 AND marks.id_student = student.id_student
 AND marks.id_subject = subject.id_subject
 AND subject_name LIKE 'Х%' 
 OR subject_name LIKE 'Ф%';

# выведем имена учителей определенного возраста и их предметы 
SELECT teacher_name, birthday, subject_name FROM teacher, teacher_subject, subject
WHERE teacher.id_teacher = teacher_subject.id_teacher
AND teacher_subject.id_subject = subject.id_subject
AND birthday BETWEEN '1973-02-20' AND '1984-12-24';

# вывод имен студентов, почты, группы  тех, у кого почта начинается не с буквы 'g'
SELECT student_name, email, name_group FROM student, college_group
WHERE email NOT LIKE 'g%'
AND student.id_college_group = college_group.id_college_group
AND id_student BETWEEN 1 AND 30;


#АГРЕГРАТНЫЕ ФУНКЦИИ AVG MAX

#вывести среднее кол-во учебных часов по всем предметам, кроме ОБЖ
SELECT AVG(num_hours) FROM subject
WHERE subject_name NOT LIKE '%ОБЖ';

#максимальный стаж учителя
SELECT MAX(working_period) FROM teacher;

#минимум и максимум учебных часов
SELECT MIN(num_hours), MAX(num_hours) FROM subject;

#посчитаем сумму, минимум, максимум и среднее кол-во стажа учителей
SELECT SUM(working_period),
       MIN(working_period),
       MAX(working_period),
       AVG(working_period)
FROM teacher;

#сколько почт указано в таблице преподавателей
SELECT COUNT(email) FROM teacher;

#вывести все уникальные типы кабинетов
SELECT DISTINCT room_type FROM room;

#сколько всего оценок у групп с id>5
SELECT COUNT(ALL mark) FROM marks
WHERE id_college_group >5;


#ГРУППИРУЮЩИЕ ЗАПРОСЫ И ГРУППИРУЮЩИЕ ЗАПРОСЫ С УСЛОВИЕМ

# сортировка преподавателей по стажу от большего к меньшему
SELECT * FROM teacher ORDER BY working_period DESC;

#стаж и должность преподавателей группировка по id 
SELECT position, working_period
	FROM teacher
		GROUP BY id_teacher;

#вывод имен студентов, контактов и группы, сортирован по имени студента и фильтр по возрасту
SELECT student_name, birthday, name_group FROM student, college_group
	WHERE college_group.id_college_group = student.id_college_group
	AND birthday <= '1998-11-24'
	GROUP BY student_name;

#вывод групп с весеннего семестра со 2 по 4, сортированныйе по id по возрастанию
SELECT name_group FROM college_group
 WHERE current_semester = 'весенний'
 AND num_semester BETWEEN 2 AND 4
 ORDER BY id_college_group ASC;
 
#вывод студентов, телефона и дня рождения после 2000-02-20, и сортировка по дате от большего к меньшему
SELECT student_name, phone_num, birthday
	FROM student
	WHERE birthday > '2000-02-20'
	ORDER BY birthday DESC;

#вывод всех студентов на букву А и сортировка по id
SELECT * FROM student WHERE student_name LIKE 'А%' ORDER BY id_student;


#ПОДЗАПРОСЫ

#выведем всю информацию об учителях, которые преподают в лекционных кабинетах
SELECT * FROM teacher
	WHERE id_room < (SELECT MAX(id_room) FROM room WHERE room_type='лекционный')

#вывод преподавателей, у которых есть занятия в лекционных кабинетах
SELECT teacher_name FROM teacher WHERE id_room IN
(SELECT id_room FROM room WHERE room_type='лекционный');

#выведем кто ведет информатику
SELECT teacher_name FROM teacher WHERE id_teacher IN
       (SELECT id_teacher FROM teacher_subject WHERE id_subject IN
          (SELECT id_subject FROM subject WHERE subject_name = 'Информатика')
       );

#выведем какой предмет ведет Иванов Иван Иванович
SELECT subject_name FROM subject WHERE id_subject IN
       (SELECT id_subject FROM teacher_subject WHERE id_teacher IN
          (SELECT id_teacher FROM teacher WHERE teacher_name = 'Иванов Иван Иванович')
       );

#выведем информацию о студентах из групп с id > 5
SELECT * FROM student
	WHERE id_college_group NOT IN 
		(SELECT id_college_group FROM college_group 
			WHERE id_college_group < 5);



#ПРЕДИКАТЫ IN, SOME (ANY), ALL

#вывести все из таблицы оценок,  где id предмета меньше всех id студентов из групп с id > 8
SELECT * FROM marks
WHERE id_subject < ALL(SELECT id_student 
	FROM student WHERE id_college_group > 8);

#выведем кто ведет информатику
SELECT teacher_name FROM teacher WHERE id_teacher IN
       (SELECT id_teacher FROM teacher_subject WHERE id_subject IN
          (SELECT id_subject FROM subject WHERE subject_name = 'Информатика')
       );

#вывод всех дисциплин, которые ведут учителя с должностью "преподаватель"
SELECT subject_name FROM subject WHERE id_subject IN
       (SELECT id_subject FROM teacher_subject WHERE id_teacher IN
          (SELECT id_teacher FROM teacher WHERE position = 'преподаватель')
       );

#вывод информации по преподавателям
 SELECT * FROM teacher
 	WHERE id_room = ANY (SELECT id_room FROM room );


#ИСПОЛЬЗОВАНИЕ СОЕДИНЕНИЯ INNER JOIN

#выведем студентов и их оценки
SELECT mark, student_name
	FROM marks INNER JOIN student
		ON marks.id_student = student.id_student;

#выведем  имя групп, id их расписания и имена преподавателей
SELECT college_group.name_group, timetable.id_timetable, teacher.teacher_name
	FROM ((timetable
		INNER JOIN college_group ON college_group.id_college_group = timetable.id_college_group)
		INNER JOIN teacher ON teacher.id_teacher = timetable.id_teacher);

#выведем имена студентов, их оценки по предметам, группированные по id оценок < 3
SELECT student.student_name, marks.mark, subject.subject_name
	FROM ((marks
		INNER JOIN student ON student.id_student = marks.id_student)
		INNER JOIN subject ON subject.id_subject = marks.id_subject)
			GROUP BY id_mark HAVING id_mark > 3;

#выведем 10 студентов и их оценки 
SELECT weekday, lesson_time
	FROM timetable INNER JOIN college_group
		ON timetable.id_college_group = college_group.id_college_group
		 LIMIT 10;


#ИСПОЛЬЗОВАНИЕ СОЕДИНЕНИЯ LEFT JOIN и RIGHT JOIN

#выведем учителей и их предметы 
SELECT teacher.id_teacher, teacher.teacher_name, 
		subject.id_subject, subject.subject_name 
			FROM  teacher
				LEFT OUTER JOIN  subject ON subject.id_subject = teacher.id_teacher;

#выведем названия групп и по каким дням они учатся
SELECT college_group.name_group, timetable.weekday
	FROM college_group
		LEFT JOIN timetable ON college_group.id_college_group = timetable.id_college_group
			ORDER BY college_group.name_group;

#выведем все из таблицы групп и студентов, где id> 3, но кроме группы К3342
SELECT * FROM college_group
	LEFT OUTER JOIN student ON student.id_college_group = college_group.id_college_group
		WHERE student.id_college_group > 3
			AND name_group != 'К3342';

#выведем имя учителя из таблицы учителей и из таблицы его расписание,сортировка по id
SELECT teacher_name FROM teacher
	RIGHT JOIN timetable ON teacher.id_teacher = timetable.id_teacher
		WHERE teacher.id_teacher < 3
		ORDER BY id_timetable;


#ИСПОЛЬЗОВАНИЕ ОБЪЕДИНЕНИЯ ЗАПРОСОВ UNION

#вывод всех имен
SELECT teacher_name FROM teacher
	UNION SELECT student_name FROM student;

#объединим два запроса в 1
(SELECT timetable.weekday
	FROM college_group
		LEFT JOIN timetable ON college_group.id_college_group = timetable.id_college_group
			ORDER BY college_group.name_group)
UNION ALL
(SELECT teacher_name FROM teacher
	RIGHT JOIN timetable ON teacher.id_teacher = timetable.id_teacher
		WHERE teacher.id_teacher < 3
		ORDER BY id_timetable);

#и еще объединение запросов
(SELECT teacher_name FROM teacher WHERE id_teacher IN
       (SELECT id_teacher FROM teacher_subject WHERE id_subject IN
          (SELECT id_subject FROM subject WHERE subject_name = 'Информатика')
       ))
UNION ALL
(SELECT subject_name FROM subject WHERE id_subject IN
       (SELECT id_subject FROM teacher_subject WHERE id_teacher IN
          (SELECT id_teacher FROM teacher WHERE position = 'преподаватель')
       ));


#  веведем всех студентов у которых есть оценка хорошо по химии или физике
(SELECT mark, student_name, subject_name FROM marks, student, subject
 WHERE mark LIKE 'хор%' 
 AND marks.id_student = student.id_student
 AND marks.id_subject = subject.id_subject
 AND subject_name LIKE 'Х%' 
 OR subject_name LIKE 'Ф%')

UNION ALL

# выведем имена учителей определенного возраста и их предметы 
(SELECT teacher_name, birthday, subject_name FROM teacher, teacher_subject, subject
WHERE teacher.id_teacher = teacher_subject.id_teacher
AND teacher_subject.id_subject = subject.id_subject
AND birthday BETWEEN '1973-02-20' AND '1984-12-24');


#вывод семестра, оценки и студента
(SELECT semester, mark, student_name 
   FROM marks, student
   WHERE marks.id_student = student.id_student)

UNION ALL

#вывод студентов, телефона и дня рождения после 2000-02-20, и сортировка по дате от большего к меньшему
(SELECT student_name, phone_num, birthday
	FROM student
	WHERE birthday > '2000-02-20'
	ORDER BY birthday DESC);


#выведем студентов и их оценки
(SELECT mark, student_name
	FROM marks INNER JOIN student
		ON marks.id_student = student.id_student)

UNION ALL

#выведем 10 студентов и их оценки 
(SELECT weekday, lesson_time
	FROM timetable INNER JOIN college_group
		ON timetable.id_college_group = college_group.id_college_group
		 LIMIT 10);


#ИСПОЛЬЗОВАНИЕ ПРЕДИКАТА EXISTS

SELECT student_name FROM student
	WHERE EXISTS (SELECT name_group FROM college_group 
		WHERE college_group.id_college_group = student.id_college_group
	 		AND id_student < 6);

SELECT teacher_name FROM teacher
	WHERE EXISTS (SELECT subject_name FROM subject
 		WHERE teacher.id_teacher = subject.id_subject);

SELECT DISTINCT student_name, email, phone_num 
	FROM student 
	WHERE NOT EXISTS
		(SELECT id_college_group
			FROM college_group
			WHERE student.id_student = college_group.id_college_group
			);

(SELECT student_name FROM student
	WHERE EXISTS (SELECT name_group FROM college_group 
		WHERE college_group.id_college_group = student.id_college_group
	 		AND id_student < 6))
UNION ALL

(SELECT teacher_name FROM teacher
	WHERE EXISTS (SELECT subject_name FROM subject
 		WHERE teacher.id_teacher = subject.id_subject));


SELECT teacher_name, phone_num, email
FROM teacher
ORDER BY
(CASE WHEN working_period < 10 THEN phone_num
    ELSE email
END);