--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10
-- Dumped by pg_dump version 10.10

-- Started on 2020-05-15 14:13:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE college;
--
-- TOC entry 2899 (class 1262 OID 16751)
-- Name: college; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE college WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE college OWNER TO postgres;

\connect college

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2902 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 16899)
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    id_group_pk integer NOT NULL,
    "текущий семестр" integer
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16897)
-- Name: group_id_group_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_id_group_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_id_group_pk_seq OWNER TO postgres;

--
-- TOC entry 2903 (class 0 OID 0)
-- Dependencies: 207
-- Name: group_id_group_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_id_group_pk_seq OWNED BY public."group".id_group_pk;


--
-- TOC entry 197 (class 1259 OID 16782)
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    id_room_pk integer NOT NULL,
    "номер кабинета" integer
);


ALTER TABLE public.room OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16780)
-- Name: room_id_room_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.room_id_room_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_id_room_pk_seq OWNER TO postgres;

--
-- TOC entry 2904 (class 0 OID 0)
-- Dependencies: 196
-- Name: room_id_room_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.room_id_room_pk_seq OWNED BY public.room.id_room_pk;


--
-- TOC entry 212 (class 1259 OID 16941)
-- Name: semester marks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."semester marks" (
    id_sem_marks_pk integer NOT NULL,
    id_student_fk bigint,
    id_group_fk bigint,
    id_subject_fk bigint,
    "семестр" integer,
    "оценка" integer
);


ALTER TABLE public."semester marks" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16939)
-- Name: semester marks_id_sem_marks_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."semester marks_id_sem_marks_pk_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."semester marks_id_sem_marks_pk_seq" OWNER TO postgres;

--
-- TOC entry 2905 (class 0 OID 0)
-- Dependencies: 211
-- Name: semester marks_id_sem_marks_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."semester marks_id_sem_marks_pk_seq" OWNED BY public."semester marks".id_sem_marks_pk;


--
-- TOC entry 210 (class 1259 OID 16907)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id_student_pk integer NOT NULL,
    id_group_fk bigint,
    "ФИО" character varying(250)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16905)
-- Name: student_id_student_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_id_student_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_id_student_pk_seq OWNER TO postgres;

--
-- TOC entry 2906 (class 0 OID 0)
-- Dependencies: 209
-- Name: student_id_student_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_id_student_pk_seq OWNED BY public.student.id_student_pk;


--
-- TOC entry 202 (class 1259 OID 16809)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id_subject_pk integer NOT NULL,
    "название дисциплины" character varying(250)
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16807)
-- Name: subject_id_subject_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subject_id_subject_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_id_subject_pk_seq OWNER TO postgres;

--
-- TOC entry 2907 (class 0 OID 0)
-- Dependencies: 201
-- Name: subject_id_subject_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subject_id_subject_pk_seq OWNED BY public.subject.id_subject_pk;


--
-- TOC entry 200 (class 1259 OID 16800)
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    id_teacher_pk integer NOT NULL,
    id_room_fk integer NOT NULL,
    "ФИО" character varying(250)
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16836)
-- Name: teacher-subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."teacher-subject" (
    "id_teacher-subject_pk" integer NOT NULL,
    id_teacher_fk bigint,
    id_subject_fk bigint
);


ALTER TABLE public."teacher-subject" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16834)
-- Name: teacher-subject_id_teacher-subject_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."teacher-subject_id_teacher-subject_pk_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."teacher-subject_id_teacher-subject_pk_seq" OWNER TO postgres;

--
-- TOC entry 2908 (class 0 OID 0)
-- Dependencies: 205
-- Name: teacher-subject_id_teacher-subject_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."teacher-subject_id_teacher-subject_pk_seq" OWNED BY public."teacher-subject"."id_teacher-subject_pk";


--
-- TOC entry 199 (class 1259 OID 16798)
-- Name: teacher_id_room_fk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_id_room_fk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_id_room_fk_seq OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 0)
-- Dependencies: 199
-- Name: teacher_id_room_fk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_id_room_fk_seq OWNED BY public.teacher.id_room_fk;


--
-- TOC entry 198 (class 1259 OID 16796)
-- Name: teacher_id_teacher_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teacher_id_teacher_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_id_teacher_pk_seq OWNER TO postgres;

--
-- TOC entry 2910 (class 0 OID 0)
-- Dependencies: 198
-- Name: teacher_id_teacher_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teacher_id_teacher_pk_seq OWNED BY public.teacher.id_teacher_pk;


--
-- TOC entry 204 (class 1259 OID 16825)
-- Name: timetable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timetable (
    id_timetable_pk integer NOT NULL,
    id_group_fk bigint NOT NULL,
    id_teacher_fk bigint NOT NULL,
    id_room_fk bigint NOT NULL,
    id_subject_fk bigint NOT NULL,
    "день недели" character varying(250),
    "время занятия" character varying(250)
);


ALTER TABLE public.timetable OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16823)
-- Name: timetable_id_timetable_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.timetable_id_timetable_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timetable_id_timetable_pk_seq OWNER TO postgres;

--
-- TOC entry 2911 (class 0 OID 0)
-- Dependencies: 203
-- Name: timetable_id_timetable_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.timetable_id_timetable_pk_seq OWNED BY public.timetable.id_timetable_pk;


--
-- TOC entry 2721 (class 2604 OID 16902)
-- Name: group id_group_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group" ALTER COLUMN id_group_pk SET DEFAULT nextval('public.group_id_group_pk_seq'::regclass);


--
-- TOC entry 2715 (class 2604 OID 16785)
-- Name: room id_room_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room ALTER COLUMN id_room_pk SET DEFAULT nextval('public.room_id_room_pk_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 16944)
-- Name: semester marks id_sem_marks_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."semester marks" ALTER COLUMN id_sem_marks_pk SET DEFAULT nextval('public."semester marks_id_sem_marks_pk_seq"'::regclass);


--
-- TOC entry 2722 (class 2604 OID 16910)
-- Name: student id_student_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN id_student_pk SET DEFAULT nextval('public.student_id_student_pk_seq'::regclass);


--
-- TOC entry 2718 (class 2604 OID 16812)
-- Name: subject id_subject_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject ALTER COLUMN id_subject_pk SET DEFAULT nextval('public.subject_id_subject_pk_seq'::regclass);


--
-- TOC entry 2716 (class 2604 OID 16803)
-- Name: teacher id_teacher_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher ALTER COLUMN id_teacher_pk SET DEFAULT nextval('public.teacher_id_teacher_pk_seq'::regclass);


--
-- TOC entry 2717 (class 2604 OID 16804)
-- Name: teacher id_room_fk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher ALTER COLUMN id_room_fk SET DEFAULT nextval('public.teacher_id_room_fk_seq'::regclass);


--
-- TOC entry 2720 (class 2604 OID 16839)
-- Name: teacher-subject id_teacher-subject_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject" ALTER COLUMN "id_teacher-subject_pk" SET DEFAULT nextval('public."teacher-subject_id_teacher-subject_pk_seq"'::regclass);


--
-- TOC entry 2719 (class 2604 OID 16828)
-- Name: timetable id_timetable_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable ALTER COLUMN id_timetable_pk SET DEFAULT nextval('public.timetable_id_timetable_pk_seq'::regclass);


--
-- TOC entry 2889 (class 0 OID 16899)
-- Dependencies: 208
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."group" (id_group_pk, "текущий семестр") VALUES (1, 1);
INSERT INTO public."group" (id_group_pk, "текущий семестр") VALUES (2, 1);
INSERT INTO public."group" (id_group_pk, "текущий семестр") VALUES (3, 2);


--
-- TOC entry 2878 (class 0 OID 16782)
-- Dependencies: 197
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.room (id_room_pk, "номер кабинета") VALUES (1, 11);
INSERT INTO public.room (id_room_pk, "номер кабинета") VALUES (2, 12);
INSERT INTO public.room (id_room_pk, "номер кабинета") VALUES (3, 13);


--
-- TOC entry 2893 (class 0 OID 16941)
-- Dependencies: 212
-- Data for Name: semester marks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."semester marks" (id_sem_marks_pk, id_student_fk, id_group_fk, id_subject_fk, "семестр", "оценка") VALUES (1, 1, 1, 1, 1, 5);
INSERT INTO public."semester marks" (id_sem_marks_pk, id_student_fk, id_group_fk, id_subject_fk, "семестр", "оценка") VALUES (2, 2, 2, 2, 1, NULL);


--
-- TOC entry 2891 (class 0 OID 16907)
-- Dependencies: 210
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.student (id_student_pk, id_group_fk, "ФИО") VALUES (1, 1, 'Иванов Иван Иванович');
INSERT INTO public.student (id_student_pk, id_group_fk, "ФИО") VALUES (2, 1, 'Семенов Семен Семенович');
INSERT INTO public.student (id_student_pk, id_group_fk, "ФИО") VALUES (3, 2, 'Петров Петр Петрович');


--
-- TOC entry 2883 (class 0 OID 16809)
-- Dependencies: 202
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subject (id_subject_pk, "название дисциплины") VALUES (1, 'Химия');
INSERT INTO public.subject (id_subject_pk, "название дисциплины") VALUES (2, 'Физика');
INSERT INTO public.subject (id_subject_pk, "название дисциплины") VALUES (3, 'Биология');
INSERT INTO public.subject (id_subject_pk, "название дисциплины") VALUES (4, 'Математика');
INSERT INTO public.subject (id_subject_pk, "название дисциплины") VALUES (5, 'История');


--
-- TOC entry 2881 (class 0 OID 16800)
-- Dependencies: 200
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teacher (id_teacher_pk, id_room_fk, "ФИО") VALUES (1, 1, 'Андреев Андрей Андреевич');
INSERT INTO public.teacher (id_teacher_pk, id_room_fk, "ФИО") VALUES (2, 2, 'Александрова Александра Александровна');


--
-- TOC entry 2887 (class 0 OID 16836)
-- Dependencies: 206
-- Data for Name: teacher-subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."teacher-subject" ("id_teacher-subject_pk", id_teacher_fk, id_subject_fk) VALUES (1, 1, 1);
INSERT INTO public."teacher-subject" ("id_teacher-subject_pk", id_teacher_fk, id_subject_fk) VALUES (2, 2, 2);


--
-- TOC entry 2885 (class 0 OID 16825)
-- Dependencies: 204
-- Data for Name: timetable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.timetable (id_timetable_pk, id_group_fk, id_teacher_fk, id_room_fk, id_subject_fk, "день недели", "время занятия") VALUES (1, 1, 1, 1, 1, 'Вторник', '10.00 - 11.30');
INSERT INTO public.timetable (id_timetable_pk, id_group_fk, id_teacher_fk, id_room_fk, id_subject_fk, "день недели", "время занятия") VALUES (2, 2, 2, 2, 2, 'Среда', '11.30 - 13.00');


--
-- TOC entry 2912 (class 0 OID 0)
-- Dependencies: 207
-- Name: group_id_group_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_id_group_pk_seq', 1, false);


--
-- TOC entry 2913 (class 0 OID 0)
-- Dependencies: 196
-- Name: room_id_room_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.room_id_room_pk_seq', 1, false);


--
-- TOC entry 2914 (class 0 OID 0)
-- Dependencies: 211
-- Name: semester marks_id_sem_marks_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."semester marks_id_sem_marks_pk_seq"', 1, false);


--
-- TOC entry 2915 (class 0 OID 0)
-- Dependencies: 209
-- Name: student_id_student_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_id_student_pk_seq', 1, false);


--
-- TOC entry 2916 (class 0 OID 0)
-- Dependencies: 201
-- Name: subject_id_subject_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subject_id_subject_pk_seq', 1, false);


--
-- TOC entry 2917 (class 0 OID 0)
-- Dependencies: 205
-- Name: teacher-subject_id_teacher-subject_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."teacher-subject_id_teacher-subject_pk_seq"', 1, false);


--
-- TOC entry 2918 (class 0 OID 0)
-- Dependencies: 199
-- Name: teacher_id_room_fk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_id_room_fk_seq', 1, false);


--
-- TOC entry 2919 (class 0 OID 0)
-- Dependencies: 198
-- Name: teacher_id_teacher_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teacher_id_teacher_pk_seq', 1, false);


--
-- TOC entry 2920 (class 0 OID 0)
-- Dependencies: 203
-- Name: timetable_id_timetable_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timetable_id_timetable_pk_seq', 1, false);


--
-- TOC entry 2738 (class 2606 OID 16904)
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id_group_pk);


--
-- TOC entry 2725 (class 2606 OID 16787)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id_room_pk);


--
-- TOC entry 2744 (class 2606 OID 16946)
-- Name: semester marks semester marks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."semester marks"
    ADD CONSTRAINT "semester marks_pkey" PRIMARY KEY (id_sem_marks_pk);


--
-- TOC entry 2741 (class 2606 OID 16912)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id_student_pk);


--
-- TOC entry 2730 (class 2606 OID 16814)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id_subject_pk);


--
-- TOC entry 2736 (class 2606 OID 16841)
-- Name: teacher-subject teacher-subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject"
    ADD CONSTRAINT "teacher-subject_pkey" PRIMARY KEY ("id_teacher-subject_pk");


--
-- TOC entry 2728 (class 2606 OID 16806)
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (id_teacher_pk);


--
-- TOC entry 2732 (class 2606 OID 16833)
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (id_timetable_pk);


--
-- TOC entry 2739 (class 1259 OID 16918)
-- Name: fki_id_group_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_group_fk ON public.student USING btree (id_group_fk);


--
-- TOC entry 2726 (class 1259 OID 16853)
-- Name: fki_id_room_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_room_fk ON public.teacher USING btree (id_room_fk);


--
-- TOC entry 2742 (class 1259 OID 16952)
-- Name: fki_id_student_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_student_fk ON public."semester marks" USING btree (id_student_fk);


--
-- TOC entry 2733 (class 1259 OID 16896)
-- Name: fki_id_subject_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_subject_fk ON public."teacher-subject" USING btree (id_subject_fk);


--
-- TOC entry 2734 (class 1259 OID 16890)
-- Name: fki_id_teacher_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_id_teacher_fk ON public."teacher-subject" USING btree (id_teacher_fk);


--
-- TOC entry 2752 (class 2606 OID 16913)
-- Name: student id_group_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT id_group_fk FOREIGN KEY (id_group_fk) REFERENCES public."group"(id_group_pk) NOT VALID;


--
-- TOC entry 2746 (class 2606 OID 16919)
-- Name: timetable id_group_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT id_group_fk FOREIGN KEY (id_group_fk) REFERENCES public."group"(id_group_pk) NOT VALID;


--
-- TOC entry 2754 (class 2606 OID 16953)
-- Name: semester marks id_group_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."semester marks"
    ADD CONSTRAINT id_group_fk FOREIGN KEY (id_group_fk) REFERENCES public."group"(id_group_pk) NOT VALID;


--
-- TOC entry 2745 (class 2606 OID 16848)
-- Name: teacher id_room_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT id_room_fk FOREIGN KEY (id_room_fk) REFERENCES public.room(id_room_pk) NOT VALID;


--
-- TOC entry 2748 (class 2606 OID 16929)
-- Name: timetable id_room_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT id_room_fk FOREIGN KEY (id_room_fk) REFERENCES public.room(id_room_pk) NOT VALID;


--
-- TOC entry 2753 (class 2606 OID 16947)
-- Name: semester marks id_student_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."semester marks"
    ADD CONSTRAINT id_student_fk FOREIGN KEY (id_student_fk) REFERENCES public.student(id_student_pk) NOT VALID;


--
-- TOC entry 2751 (class 2606 OID 16891)
-- Name: teacher-subject id_subject_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject"
    ADD CONSTRAINT id_subject_fk FOREIGN KEY (id_subject_fk) REFERENCES public.subject(id_subject_pk) NOT VALID;


--
-- TOC entry 2749 (class 2606 OID 16934)
-- Name: timetable id_subject_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT id_subject_fk FOREIGN KEY (id_subject_fk) REFERENCES public.subject(id_subject_pk) NOT VALID;


--
-- TOC entry 2755 (class 2606 OID 16958)
-- Name: semester marks id_subject_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."semester marks"
    ADD CONSTRAINT id_subject_fk FOREIGN KEY (id_subject_fk) REFERENCES public.subject(id_subject_pk) NOT VALID;


--
-- TOC entry 2750 (class 2606 OID 16885)
-- Name: teacher-subject id_teacher_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject"
    ADD CONSTRAINT id_teacher_fk FOREIGN KEY (id_teacher_fk) REFERENCES public.teacher(id_teacher_pk) NOT VALID;


--
-- TOC entry 2747 (class 2606 OID 16924)
-- Name: timetable id_teacher_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT id_teacher_fk FOREIGN KEY (id_teacher_fk) REFERENCES public.teacher(id_teacher_pk) NOT VALID;


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-05-15 14:13:46

--
-- PostgreSQL database dump complete
--

