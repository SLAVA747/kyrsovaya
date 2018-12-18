--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.5

-- Started on 2018-12-19 00:52:45

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 201 (class 1259 OID 16667)
-- Name: авторы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."авторы" (
    "id_автора" integer NOT NULL,
    "ФИО" text
);


ALTER TABLE public."авторы" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16700)
-- Name: виды_контактов; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."виды_контактов" (
    "id_вид_контакта" integer NOT NULL,
    "Наименование" text
);


ALTER TABLE public."виды_контактов" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16627)
-- Name: выдача_книг; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."выдача_книг" (
    "id_выдачи" integer NOT NULL,
    "id_полки" integer,
    "id_читателя" integer,
    "дата_выдачи" date,
    "ожидаемая_дата_возврата" date,
    "фактическая_дата_возврата" date,
    "id_штрафа" integer
);


ALTER TABLE public."выдача_книг" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16603)
-- Name: жанры; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."жанры" (
    "id_жанра" integer NOT NULL,
    "название_жанра" text
);


ALTER TABLE public."жанры" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16716)
-- Name: клиенты; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."клиенты" (
    "id_клиента" integer NOT NULL,
    "фамилия" text,
    "имя" text,
    "отчество" text,
    "адрес" text
);


ALTER TABLE public."клиенты" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16597)
-- Name: книги; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."книги" (
    "id_книги" integer NOT NULL,
    "Название_Книги" text
);


ALTER TABLE public."книги" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16673)
-- Name: полка; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."полка" (
    "id_полки" integer NOT NULL,
    "id_книги" integer,
    "id_жанра" integer,
    "id_автора" integer
);


ALTER TABLE public."полка" OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 16621)
-- Name: читатели; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."читатели" (
    "id_читателя" integer NOT NULL,
    "id_вид_контакта" integer,
    "контактные_данные" text,
    "id_клиента" integer
);


ALTER TABLE public."читатели" OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16612)
-- Name: штрафы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."штрафы" (
    "id_штрафа" integer NOT NULL,
    "описание_штрафа" text,
    "штрафная_сумма" money
);


ALTER TABLE public."штрафы" OWNER TO postgres;

--
-- TOC entry 2859 (class 0 OID 16667)
-- Dependencies: 201
-- Data for Name: авторы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."авторы" ("id_автора", "ФИО") FROM stdin;
1	Рей Брэдбери
2	Грегори Дэвид Робертс
3	Джордж Оруэлл
4	Михаил Афанасьевич Булгаков
5	Эрих Мария Ремарк
6	Оскар Уайльд
8	Джером Д. Сэлинджер
9	Даниел Киз
10	Антуан де Сент-Экзюпери
11	Харпер Ли
12	Айн Рэнд
13	Лев Толстой
14	Габриэль Гарсиа Маркес
16	Федор Михайлович Достоевский
18	Александр Дюма
19	Евгений Петров и др.
20	Энди Вейер
\.


--
-- TOC entry 2861 (class 0 OID 16700)
-- Dependencies: 203
-- Data for Name: виды_контактов; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."виды_контактов" ("id_вид_контакта", "Наименование") FROM stdin;
1	Email
2	ICQ
3	SKYPE
4	WhatsApp
5	Моб. Телефон
6	Дом. Телефон
\.


--
-- TOC entry 2858 (class 0 OID 16627)
-- Dependencies: 200
-- Data for Name: выдача_книг; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."выдача_книг" ("id_выдачи", "id_полки", "id_читателя", "дата_выдачи", "ожидаемая_дата_возврата", "фактическая_дата_возврата", "id_штрафа") FROM stdin;
1	1	1	2017-12-12	2018-12-12	\N	1
2	2	2	2017-12-12	2018-12-12	\N	1
3	3	3	2017-12-12	2018-12-12	\N	1
4	4	4	2017-12-12	2018-12-12	\N	1
5	5	5	2017-12-12	2018-12-12	\N	1
6	6	6	2017-12-12	2018-12-12	\N	1
7	7	7	2017-12-12	2018-12-12	\N	1
8	8	8	2017-12-12	2018-12-12	\N	1
9	9	9	2017-12-12	2018-12-12	\N	1
10	10	10	2017-12-12	2018-12-12	\N	1
11	11	11	2017-12-12	2018-12-12	\N	1
12	12	12	2017-12-12	2018-12-12	\N	1
13	13	13	2017-12-12	2018-12-12	\N	1
14	14	14	2017-12-12	2018-12-12	\N	1
15	15	15	2017-12-12	2018-12-12	\N	1
16	16	16	2017-12-12	2018-12-12	\N	1
17	17	17	2017-12-12	2018-12-12	\N	1
18	18	18	2017-12-12	2018-12-12	\N	1
19	19	19	2017-12-12	2018-12-12	\N	1
20	20	20	2017-12-12	2018-12-12	\N	1
\.


--
-- TOC entry 2855 (class 0 OID 16603)
-- Dependencies: 197
-- Data for Name: жанры; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."жанры" ("id_жанра", "название_жанра") FROM stdin;
1	Бизнес-книги 
2	Классическая литература 
3	Зарубежная литература 
4	Русская литература 
5	Детские книги 
6	Детективы 
7	Фэнтези  
8	Фантастика 
9	Современная проза  
10	Приключения 
11	Ужасы, мистика 
12	Публицистическая литература 
13	Книги для подростков 
14	Любовные романы 
15	Боевики, остросюжетная литература 
16	Книги по психологии  
17	Повести, рассказы 
18	Поэзия и драматургия 
19	Наука и образование 
20	Дом, семья, хобби и досуг 
21	Комиксы, манга 
22	Эзотерика 
23	Культура и искусство 
24	Юмористическая литература 
25	Религия 
26	Словари, справочники 
27	Красота и здоровье 
28	Компьютерная литература 
29	Эротика и секс 
30	Периодические издания 
31	Учебная литература 
32	Научная фантастика
33	Художественная литература
34	Романы
35	Нехудожественная литература
36	Мировая классика: книги
37	Литературоведение
38	Книги по изучению иностранных языков
39	Исторические романы
40	Биографии и мемуары
41	Альтернативная история
42	Книги детективы
43	Современные русские книги
44	Триллеры
45	Книги классика
46	Педагогика и воспитание
48	Проза
49	Тёмное фэнтези : книги
50	Дом и хозяйство
51	Мифы. Легенды. Эпос
52	Путешествия и география
53	Справочники
54	Языкознание и лингвистика
55	История
56	Другое
57	Русская классическая литература
58	Юмор
\.


--
-- TOC entry 2862 (class 0 OID 16716)
-- Dependencies: 204
-- Data for Name: клиенты; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."клиенты" ("id_клиента", "фамилия", "имя", "отчество", "адрес") FROM stdin;
1	Язева	Христина	Серафимовна	102682, г. Ардатов, ул. Авиаконструктора Яковлева, дом 35, квартира 191
2	Аксенов	Рубен	Михаилович	658645, г. Волжский, ул. Дачная, дом 64, квартира 275
3	Райкова	Инесса	Петровна	390971, г. Кизел, ул. Голландская, дом 70, квартира 244
4	Фотеева	Любовь	Романовна	632251, г. Наро-Фоминск, ул. Заречная, дом 5, квартира 41
5	Саянкова	Алина	Александровна	442687, г. Февральское, ул. Дачная, дом 87, квартира 277
6	Косарёв	Олег	Ульянович	393240, г. Красновишерск, ул. Маршала Василевского, дом 66, квартира 2
7	Сахаров	Сократ	Давыдович	182267, г. Шелехов, ул. Лидии Базановой, дом 61, квартира 104
8	Клюкина	Элеонора	Николаевна	456840, г. Кормиловка, ул. Театральная, дом 90, квартира 156
9	Якушкина	Наталья	Александровна	450976, г. Красногвардейское, ул. Театральная, дом 1, квартира 185
10	Теребова	Ника	Ираклиевна	676933, г. Орловский, ул. Адмирала Макарова, дом 24, квартира 238
11	Рожков	Эрнест	Сигизмундович	646487, г. Пронск, ул. Зелёная, дом 17, квартира 194
12	Саблин	Архип	Моисеевич	102179, г. Усть-Джегута, ул. Баженова, дом 60, квартира 237
13	Пузанова	Бронислава	Карповна	662310, г. Александров Гай, ул. Бассейная, дом 40, квартира 20
14	Бикулов	Вячеслав	Федосиевич	425239, г. Парфино, ул. Барышиха, дом 20, квартира 155
15	Лимарова	Клара	Емельяновна	658982, г. Мантурово, ул. Бараньи горки, дом 82, квартира 134
16	Никитина	Александра	Алексеевна	352194, г. Тимашевск, ул. Завокзальная 1-я, дом 45, квартира 267
17	Шкловский	Никон	Алексеевич	309746, г. Чамзинка, ул. Бахрушина, дом 32, квартира 4
18	Зёмин	Тихон	Демьянович	184041, г. Топки, ул. Зелёная, дом 33, квартира 119
19	Алексеева	Агафья	Серафимовна	353485, г. Чернышевское, ул. Автозаводская, дом 3, квартира 210
20	Мирнов	Ким	Филиппович	623389, г. Энгельс, ул. Беговая 4-я, дом 38, квартира 62
\.


--
-- TOC entry 2854 (class 0 OID 16597)
-- Dependencies: 196
-- Data for Name: книги; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."книги" ("id_книги", "Название_Книги") FROM stdin;
2	Шантарам
3	1984
4	Мастер и Маргарита
5	Три товарища
6	Портрет Дориана Грея
7	Вино из одуванчиков
8	Над пропастью во ржи
9	Цветы для Элджернона
10	Маленький принц
11	Убить пересмешника
12	Атлант расправил плечи
13	Анна Каренина
14	Сто лет одиночества
15	Тень горы
16	Преступление и наказание
17	Триумфальная арка
18	Граф Монте-Кристо
19	Двенадцать стульев
20	Марсианин
1	451° по Фаренгейту
\.


--
-- TOC entry 2860 (class 0 OID 16673)
-- Dependencies: 202
-- Data for Name: полка; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."полка" ("id_полки", "id_книги", "id_жанра", "id_автора") FROM stdin;
1	1	32	1
2	2	42	2
3	2	10	2
4	2	43	2
5	2	44	2
6	2	33	2
7	3	45	3
8	3	32	3
9	3	36	3
10	3	7	3
11	3	33	3
12	4	5	4
13	4	35	4
14	4	48	4
15	4	49	4
16	4	7	4
17	4	33	4
18	5	45	5
19	5	38	5
20	5	48	5
21	6	36	6
22	6	33	6
55	15	42	2
56	15	10	2
57	15	43	2
58	15	44	2
59	15	33	2
23	7	38	1
24	7	32	1
25	8	45	8
26	8	48	8
27	9	32	9
28	9	43	9
29	10	5	10
30	10	50	10
31	10	51	10
32	10	46	10
33	10	48	10
34	10	52	10
35	10	53	10
36	10	54	10
37	11	36	1
38	11	33	1
39	12	45	12
40	12	36	12
41	12	43	12
42	12	33	12
43	13	5	13
44	13	50	13
45	13	55	13
46	13	19	13
47	13	35	13
48	13	48	13
49	13	33	13
50	13	54	13
51	14	45	14
52	14	36	14
53	14	33	14
54	15	56	2
61	16	57	16
62	16	33	16
60	16	45	16
63	17	45	5
64	17	38	5
65	18	55	18
66	19	48	19
67	19	33	19
68	19	58	19
69	20	5	20
70	20	32	20
\.


--
-- TOC entry 2857 (class 0 OID 16621)
-- Dependencies: 199
-- Data for Name: читатели; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."читатели" ("id_читателя", "id_вид_контакта", "контактные_данные", "id_клиента") FROM stdin;
35	3	Mer	20
28	3	Ynanl	18
26	3	Vidytrcam	17
25	3	Veretanen	16
24	3	Helyguir	15
20	3	Osteian	11
16	3	Inala	9
12	3	Cllirer	6
8	3	Janagiry	3
1	3	Yliud	1
33	1	yttymmonnemmu-5189@yopmail.com	20
22	1	ranimena-1957@yopmail.com	13
17	1	apejena-8741@yopmail.com	9
13	1	xuffommaffu-8512@yopmail.com	7
6	1	sanepewuti-2066@yopmail.com	3
37	5	8-(903)-765-80-68	20
32	5	8-(952)-447-55-69	19
23	5	8-(959)-699-53-15	14
9	5	8-(921)-540-58-77	4
2	5	8-(938)-421-74-52	1
38	6	4-32-78	20
29	6	9-62-46	18
27	6	7-10-79	17
21	6	0-19-41	12
18	6	3-53-12	9
14	6	2-69-43	8
10	6	5-34-78	4
4	6	5-62-63	2
34	2	0468023	20
31	2	3918371	19
15	2	4109143	8
7	2	2016816	3
3	2	5285412	2
36	4	8-(939)-344-84-21	20
30	4	8-(903)-886-19-19	18
19	4	8-(923)-335-30-62	10
11	4	8-(955)-512-70-59	5
5	4	8-(947)-369-40-42	2
\.


--
-- TOC entry 2856 (class 0 OID 16612)
-- Dependencies: 198
-- Data for Name: штрафы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."штрафы" ("id_штрафа", "описание_штрафа", "штрафная_сумма") FROM stdin;
1	Нет штрафа	0,00 ?
\.


--
-- TOC entry 2718 (class 2606 OID 16694)
-- Name: авторы авторы_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."авторы"
    ADD CONSTRAINT "авторы_pk" PRIMARY KEY ("id_автора");


--
-- TOC entry 2722 (class 2606 OID 16707)
-- Name: виды_контактов виды_контактов_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."виды_контактов"
    ADD CONSTRAINT "виды_контактов_pk" PRIMARY KEY ("id_вид_контакта");


--
-- TOC entry 2716 (class 2606 OID 16637)
-- Name: выдача_книг выдача_книг_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."выдача_книг"
    ADD CONSTRAINT "выдача_книг_pk" PRIMARY KEY ("id_выдачи");


--
-- TOC entry 2710 (class 2606 OID 16635)
-- Name: жанры жанры_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."жанры"
    ADD CONSTRAINT "жанры_pk" PRIMARY KEY ("id_жанра");


--
-- TOC entry 2724 (class 2606 OID 16723)
-- Name: клиенты клиенты_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."клиенты"
    ADD CONSTRAINT "клиенты_pk" PRIMARY KEY ("id_клиента");


--
-- TOC entry 2708 (class 2606 OID 16633)
-- Name: книги книги_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."книги"
    ADD CONSTRAINT "книги_pk" PRIMARY KEY ("id_книги");


--
-- TOC entry 2720 (class 2606 OID 16677)
-- Name: полка полка_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."полка"
    ADD CONSTRAINT "полка_pk" PRIMARY KEY ("id_полки");


--
-- TOC entry 2714 (class 2606 OID 16639)
-- Name: читатели читатели_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."читатели"
    ADD CONSTRAINT "читатели_pk" PRIMARY KEY ("id_читателя");


--
-- TOC entry 2712 (class 2606 OID 16641)
-- Name: штрафы штрафы_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."штрафы"
    ADD CONSTRAINT "штрафы_pk" PRIMARY KEY ("id_штрафа");


--
-- TOC entry 2729 (class 2606 OID 16678)
-- Name: выдача_книг выдача_книг_полка_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."выдача_книг"
    ADD CONSTRAINT "выдача_книг_полка_fk" FOREIGN KEY ("id_полки") REFERENCES public."полка"("id_полки");


--
-- TOC entry 2727 (class 2606 OID 16647)
-- Name: выдача_книг выдача_книг_читатели_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."выдача_книг"
    ADD CONSTRAINT "выдача_книг_читатели_fk" FOREIGN KEY ("id_читателя") REFERENCES public."читатели"("id_читателя");


--
-- TOC entry 2728 (class 2606 OID 16652)
-- Name: выдача_книг выдача_книг_штрафы_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."выдача_книг"
    ADD CONSTRAINT "выдача_книг_штрафы_fk" FOREIGN KEY ("id_штрафа") REFERENCES public."штрафы"("id_штрафа");


--
-- TOC entry 2732 (class 2606 OID 16695)
-- Name: полка полка_авторы_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."полка"
    ADD CONSTRAINT "полка_авторы_fk" FOREIGN KEY ("id_автора") REFERENCES public."авторы"("id_автора");


--
-- TOC entry 2730 (class 2606 OID 16683)
-- Name: полка полка_жанры_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."полка"
    ADD CONSTRAINT "полка_жанры_fk" FOREIGN KEY ("id_жанра") REFERENCES public."жанры"("id_жанра");


--
-- TOC entry 2731 (class 2606 OID 16688)
-- Name: полка полка_книги_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."полка"
    ADD CONSTRAINT "полка_книги_fk" FOREIGN KEY ("id_книги") REFERENCES public."книги"("id_книги");


--
-- TOC entry 2725 (class 2606 OID 16708)
-- Name: читатели читатели_виды_контактов_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."читатели"
    ADD CONSTRAINT "читатели_виды_контактов_fk" FOREIGN KEY ("id_вид_контакта") REFERENCES public."виды_контактов"("id_вид_контакта");


--
-- TOC entry 2726 (class 2606 OID 16724)
-- Name: читатели читатели_клиенты_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."читатели"
    ADD CONSTRAINT "читатели_клиенты_fk" FOREIGN KEY ("id_клиента") REFERENCES public."клиенты"("id_клиента");


-- Completed on 2018-12-19 00:52:45

--
-- PostgreSQL database dump complete
--

