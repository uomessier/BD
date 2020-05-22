CREATE DATABASE college;
USE college;


CREATE TABLE college_group (
id_college_group int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
current_semester varchar(30) NOT NULL,
num_semester int(5) NOT NULL,
name_group varchar(30) NOT NULL
);

INSERT INTO college_group VALUES 
(1, 'осенний', 1, 'K3140'),
(2, 'весенний', 2, 'K3142'),
(3, 'осенний', 3, 'K3143'),
(4, 'весенний', 4, 'K3240'),
(5, 'осенний', 5, 'K3242'),
(6, 'весенний', 6, 'K3243'),
(7, 'осенний', 7, 'K3340'),
(8, 'весенний', 8, 'П3342'),
(9, 'осенний', 5, 'П3242'),
(10, 'весенний', 6, 'П3243'),
(11, 'осенний', 7, 'П3340'),
(12, 'весенний', 8, 'П3342');

CREATE TABLE teacher (
id_teacher int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
teacher_name varchar(30) NOT NULL,
working_period int(5) NOT NULL,
email varchar(30) NOT NULL,
phone_num varchar(30) NOT NULL,
birthday date NOT NULL,
position varchar(30) NOT NULL,
id_room int(5) NOT NULL,
FOREIGN KEY (id_room) REFERENCES room (id_room) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO teacher VALUES 
(1, 'Иванов Иван Иванович', 7,'ghj@mail.ru','24548','1970-02-20','завуч', 1),
(2, 'Семенов Семен Семенович', 8,'fffh@mail.ru','24598','1976-08-10','директор', 2),
(3, 'Петров Петр Петрович', 20, 'guuj@mail.ru','29088','1984-12-24','преподаватель', 3),
(4, 'Александрова Александра Александровна', 5,'ooluj@mail.ru','76548','1959-11-04','преподаватель', 4),
(5, 'Юрьев Юрий Юрьевич', 7,'jklj@mail.ru','28948','1973-02-20','старший преподаватель', 5),
(6, 'Константинов Константин Константинович', 8,'aafh@mail.ru','45298','1976-08-10','старший преподаватель', 6),
(7, 'Сергеев Сергей Сергеевич', 20, 'gsdffwwej@mail.ru','222088','1954-12-24','преподаватель', 7),
(8, 'Альбертова Альберта Альбертовна', 5,'oqwuj@mail.ru','712548','1979-11-04','преподаватель', 8);


CREATE TABLE room (
id_room int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
room_type varchar(30) NOT NULL
);

INSERT INTO room VALUES 
(1,'лекционный'),
(2,'лабораторный'),
(3,'обычный'),
(4,'лекционный'),
(5,'обычный'),
(6,'лабораторный'),
(7,'лабораторный'),
(8,'обычный');



CREATE TABLE subject (
id_subject int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
subject_name varchar(30) NOT NULL,
num_hours int(5) NOT NULL
);

INSERT INTO subject VALUES 
(1, 'Химия', 48),
(2, 'Физика', 57),
(3, 'Биология', 42),
(4, 'Математика', 61),
(5, 'Английский язык', 47),
(6, 'Русский язык', 41),
(7, 'ОБЖ', 22),
(8, 'Информатика', 52);


CREATE TABLE student (
id_student int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
student_name varchar(30) NOT NULL,
id_college_group int(5) NOT NULL,
email varchar(30) NOT NULL,
phone_num varchar(30) NOT NULL,
birthday date NOT NULL,
FOREIGN KEY (id_college_group) REFERENCES college_group (id_college_group) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO student VALUES 

(1, 'Николаев Николай Николаевич', 1,'gphkl6@mail.ru','249048','2000-02-20'),
(2, 'Максимов Максим Максимович', 2,'f76fh@mail.ru','2443598','1996-08-10'),
(3, 'Евгеньева Евгения Евгеньевна', 3, 'gghj77j@mail.ru','298088','1998-12-24'),
(4, 'Валентинова Валентина Валентиновна', 4,'oo07@mail.ru','7689548','1999-11-04'),
(5, 'Антонов Антон Антонович', 5,'jk7w8_6@mail.ru','2894898','2000-02-20'),
(6, 'Алексеев Алексей Алекссевич', 6,'a1fweh@mail.ru','455298','1998-08-10'),
(7, 'Кондратьев Кондратий Кондратьевич', 7, 'gw_78fwwej@mail.ru','090088','2004-12-24'),
(8, 'Васильева Василиса Васильевна', 8,'oqwe_67@mail.ru','734548','1999-11-04'),
(9, 'Федорова Федора Федоровна', 3, 'ggehj77j@mail.ru','2088','1998-10-24'),
(12, 'Егоров Егор Егорович', 4,'oo0ew7@mail.ru','7948','1999-10-04'),
(13, 'Денисов Денис Денисович', 5,'jkew78_6@mail.ru','288698','2000-06-20'),
(14, 'Артемов Артем Артемович', 6,'a1fewh@mail.ru','45968','1998-08-11'),
(15, 'Владимиров Владимир Владимирович', 7, 'g_78fwwej@mail.ru','2088','2004-10-24'),
(16, 'Каринова Карина Кареновна', 8,'oq_5t67@mail.ru','3448','1999-11-08'),
(17, 'Арсеньев Арсений Арсеньевич', 1,'gp6@mail.ru','24948','2000-02-20'),
(18, 'Григорьев Григорий Григорьевич', 2,'f7@mail.ru','23598','2001-08-10'),
(19, 'Юльева Юлия Юлиевна', 3, 'j77j@mail.ru','29688','2002-12-24'),
(20, 'Романов Роман Романович', 4,'kk07@mail.ru','76548','2001-11-04'),
(21, 'Владиславов Владислав Владиславович', 5,'jk_6@mail.ru','2894898','2000-02-20'),
(22, 'Тимуров Тимур Тимурович', 6,'aweh@mail.ru','45298','2003-08-10'),
(23, 'Иванова Иванна Ивановна', 7, 'gw8fwwej@mail.ru','00088','2004-12-24'),
(24, 'Тарасов Тарас Тарасович', 8,'oq7@mail.ru','73448','1999-11-04'),
(25, 'Данилов Даниил Данилович', 3, 'gj797j@mail.ru','29988','1998-10-24'),
(26, 'Дмитриев Дмитрий Дмитриевич', 4,'oow7@mail.ru','76698','1999-10-04'),
(27, 'Кириллов Кирилл Кириллович', 5,'jkw78_6@mail.ru','558898','2000-08-20'),
(28, 'Захаров Захар Захарович', 6,'aewh@mail.ru','459998','1998-03-12'),
(29, 'Антонова Антонина Антоновна', 7, 'g_7wwej@mail.ru','20088','2004-11-24'),
(30, 'Викторов Виктор Викторович', 8,'oq_57@mail.ru','3448','1999-11-08'),
(31, 'Савельев Савелий Савельевич', 1,'osow7@mail.ru','716698','1999-11-14'),
(32, 'Артуров Артур Артурович', 1,'jksw78_6@mail.ru','5581898','2000-09-20'),
(33, 'Витальева Виталина Витальевна', 2,'aewsh@mail.ru','4159998','1998-02-12'),
(34, 'Мирославова Мировлава Мирославовна', 2, 'g_7wwej@mail.ru','201088','2002-11-24'),
(35, 'Валерова Валерия Валерьевна', 2,'oq_aa57@mail.ru','341148','1998-11-08');

CREATE TABLE marks (
id_mark int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
semester varchar(30) NOT NULL,
mark varchar(30) NOT NULL,
id_college_group int(5) NOT NULL,
id_student int(5) NOT NULL,
id_subject int(5) NOT NULL,
FOREIGN KEY (id_college_group) REFERENCES college_group (id_college_group) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_student) REFERENCES student (id_student) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_subject) REFERENCES subject (id_subject) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO marks VALUES 
(1, 'осенний', 'хорошо', 1, 1, 1),
(2, 'весенний', 'отлично', 2, 2, 2),
(3, 'осенний', 'удовлетворительно', 3, 3, 3),
(4, 'осенний', 'отлично', 4, 4, 4),
(5, 'осенний', 'хорошо', 5, 5, 5),
(6, 'весенний', 'отлично', 6, 6, 6),
(7, 'осенний', 'удовлетворительно', 7, 7, 7),
(8, 'осенний', 'отлично', 8, 8, 8),
(9, 'осенний', 'хорошо', 1, 31, 1),
(10, 'весенний', 'отлично', 2, 18, 2),
(11, 'осенний', 'удовлетворительно', 3, 9, 3),
(12, 'осенний', 'отлично', 4, 12, 4),
(13, 'осенний', 'хорошо', 5, 21, 5),
(14, 'весенний', 'отлично', 6, 14, 6),
(15, 'осенний', 'удовлетворительно', 7, 15, 7),
(16, 'осенний', 'отлично', 8, 16, 8),
(17, 'осенний', 'хорошо', 1, 32, 1),
(18, 'весенний', 'отлично', 2, 33, 2),
(19, 'осенний', 'удовлетворительно', 3, 19, 3),
(20, 'осенний', 'отлично', 4, 20, 4),
(21, 'весенний', 'отлично', 5, 27, 5),
(22, 'осенний', 'удовлетворительно', 6, 22, 6),
(23, 'осенний', 'отлично', 7, 23, 7),
(24, 'осенний', 'хорошо', 8, 24, 8),
(25, 'весенний', 'отлично', 2, 34, 1),
(26, 'осенний', 'удовлетворительно', 2, 35, 2),
(27, 'осенний', 'отлично', 3, 25, 3),
(28, 'осенний', 'хорошо', 4, 26, 4),
(29, 'весенний', 'отлично', 6, 28, 5),
(30, 'осенний', 'удовлетворительно', 8, 30, 6),
(31, 'осенний', 'отлично', 7, 29, 7);

CREATE TABLE timetable (
id_timetable int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
weekday varchar(30) NOT NULL,
lesson_time varchar(30) NOT NULL,
id_college_group int(5) NOT NULL,
id_subject int(5) NOT NULL,
id_teacher int(5) NOT NULL,
id_room int(5) NOT NULL,
FOREIGN KEY (id_college_group) REFERENCES college_group (id_college_group) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_subject) REFERENCES subject (id_subject) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_teacher) REFERENCES teacher (id_teacher) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_room) REFERENCES room (id_room) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO timetable VALUES 
(1, 'понедельник', '11.30', 1, 1, 1, 1),
(2, 'вторник', '10.00', 2, 2, 2, 2),
(3, 'среда', '09.00', 3, 3, 3, 3),
(4, 'четверг', '8.30', 4, 4, 4, 4),
(5, 'пятница', '11.30', 5, 5, 5, 5),
(6, 'понедельник', '10.00', 6, 6, 6, 6),
(7, 'вторник', '09.00', 7, 7, 7, 7),
(8, 'среда', '8.30', 8, 8, 8, 8),
(9, 'четверг', '11.30', 1, 1, 1, 1),
(10, 'пятница', '10.00', 2, 2, 2, 2),
(11, 'понедельник', '09.00', 3, 3, 3, 3),
(12, 'вторник', '8.30', 4, 4, 4, 4),
(13, 'среда', '11.30', 5, 5, 5, 5),
(14, 'четверг', '10.00', 6, 6, 6, 6),
(15, 'пятница', '09.00', 7, 7, 7, 7),
(16, 'понедельник', '8.30', 8, 8, 8, 8);

CREATE TABLE teacher_subject (
id_teacher_subject int(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_subject int(5) NOT NULL,
id_teacher int(5) NOT NULL,
FOREIGN KEY (id_teacher) REFERENCES teacher (id_teacher) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_subject) REFERENCES subject (id_subject) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO teacher_subject VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8);