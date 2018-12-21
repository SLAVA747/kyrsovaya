--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.5

-- Started on 2018-12-22 01:48:17

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
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 205 (class 1259 OID 16760)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id_role integer NOT NULL,
    name text
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 24673)
-- Name: Комментарии; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Комментарии" (
);


ALTER TABLE public."Комментарии" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16667)
-- Name: авторы; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."авторы" (
    "id_автора" integer NOT NULL,
    "ФИО" text,
    "Описание" text
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
    "адрес" text,
    login text,
    password text,
    id_role integer,
    rate integer,
    age integer,
    comments integer,
    books_back integer,
    books_reads integer,
    avatar text
);


ALTER TABLE public."клиенты" OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16597)
-- Name: книги; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."книги" (
    "id_книги" integer NOT NULL,
    "Название_Книги" text,
    img_src text,
    "Дата_добавления" date,
    "Рейтинг" integer,
    "id_автора" integer,
    "Описание" text
);


ALTER TABLE public."книги" OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16773)
-- Name: комментарии; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."комментарии" (
    "id_комментария" integer NOT NULL,
    "id_клиента" integer,
    text text,
    "id_книги" integer
);


ALTER TABLE public."комментарии" OWNER TO postgres;

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
-- TOC entry 2883 (class 0 OID 16760)
-- Dependencies: 205
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id_role, name) FROM stdin;
1	Admin
2	User
\.


--
-- TOC entry 2885 (class 0 OID 24673)
-- Dependencies: 207
-- Data for Name: Комментарии; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Комментарии"  FROM stdin;
\.


--
-- TOC entry 2879 (class 0 OID 16667)
-- Dependencies: 201
-- Data for Name: авторы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."авторы" ("id_автора", "ФИО", "Описание") FROM stdin;
1	Рей Брэдбери	\N
2	Грегори Дэвид Робертс	\N
3	Джордж Оруэлл	\N
4	Михаил Афанасьевич Булгаков	\N
5	Эрих Мария Ремарк	\N
6	Оскар Уайльд	\N
8	Джером Д. Сэлинджер	\N
9	Даниел Киз	\N
10	Антуан де Сент-Экзюпери	\N
11	Харпер Ли	\N
12	Айн Рэнд	\N
13	Лев Толстой	\N
14	Габриэль Гарсиа Маркес	\N
16	Федор Михайлович Достоевский	\N
18	Александр Дюма	\N
20	Энди Вейер	\N
19	Евгений Петров	\N
\.


--
-- TOC entry 2881 (class 0 OID 16700)
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
-- TOC entry 2878 (class 0 OID 16627)
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
-- TOC entry 2875 (class 0 OID 16603)
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
-- TOC entry 2882 (class 0 OID 16716)
-- Dependencies: 204
-- Data for Name: клиенты; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."клиенты" ("id_клиента", "фамилия", "имя", "отчество", "адрес", login, password, id_role, rate, age, comments, books_back, books_reads, avatar) FROM stdin;
14	Бикулов	Вячеслав	Федосиевич	425239, г. Парфино, ул. Барышиха, дом 20, квартира 155	\N	\N	\N	34	\N	\N	\N	\N	1.jpg
2	Аксенов	Рубен	Михаилович	658645, г. Волжский, ул. Дачная, дом 64, квартира 275	\N	\N	\N	85	\N	\N	\N	\N	6.jpg
3	Райкова	Инесса	Петровна	390971, г. Кизел, ул. Голландская, дом 70, квартира 244	\N	\N	\N	34	\N	\N	\N	\N	7.jpg
4	Фотеева	Любовь	Романовна	632251, г. Наро-Фоминск, ул. Заречная, дом 5, квартира 41	\N	\N	\N	7	\N	\N	\N	\N	8.jpg
18	Зёмин	Тихон	Демьянович	184041, г. Топки, ул. Зелёная, дом 33, квартира 119	\N	\N	\N	3	\N	\N	\N	\N	9.jpg
19	Алексеева	Агафья	Серафимовна	353485, г. Чернышевское, ул. Автозаводская, дом 3, квартира 210	\N	\N	\N	33	\N	\N	\N	\N	10.jpg
20	Мирнов	Ким	Филиппович	623389, г. Энгельс, ул. Беговая 4-я, дом 38, квартира 62	\N	\N	\N	4	\N	\N	\N	\N	11.jpg
21	\N	\N	\N	\N	root	123456	1	2	\N	\N	\N	\N	12.jpg
24	2124	12343	с	и	.	 1 .	2	53	-44	\N	\N	\N	3.jpg
13	Пузанова	Бронислава	Карповна	662310, г. Александров Гай, ул. Бассейная, дом 40, квартира 20	\N	\N	\N	86	\N	\N	\N	\N	1.jpg
5	Саянкова	Алина	Александровна	442687, г. Февральское, ул. Дачная, дом 87, квартира 277	\N	\N	\N	56	\N	\N	\N	\N	13.jpg
6	Косарёв	Олег	Ульянович	393240, г. Красновишерск, ул. Маршала Василевского, дом 66, квартира 2	\N	\N	\N	3	\N	\N	\N	\N	14.jpg
7	Сахаров	Сократ	Давыдович	182267, г. Шелехов, ул. Лидии Базановой, дом 61, квартира 104	\N	\N	\N	93	\N	\N	\N	\N	15.jpg
8	Клюкина	Элеонора	Николаевна	456840, г. Кормиловка, ул. Театральная, дом 90, квартира 156	\N	\N	\N	23	\N	\N	\N	\N	16.jpg
9	Якушкина	Наталья	Александровна	450976, г. Красногвардейское, ул. Театральная, дом 1, квартира 185	\N	\N	\N	3	\N	\N	\N	\N	17.jpg
22	Терехов	Вячеслав	Викторович	Ул.Советская 43/22	SLAVA_747	123456	2	124	23	\N	\N	\N	Hydrangeas1452392.jpg
10	Теребова	Ника	Ираклиевна	676933, г. Орловский, ул. Адмирала Макарова, дом 24, квартира 238	\N	\N	\N	53	\N	\N	\N	\N	18.jpg
11	Рожков	Эрнест	Сигизмундович	646487, г. Пронск, ул. Зелёная, дом 17, квартира 194	\N	\N	\N	12	\N	\N	\N	\N	19.jpg
12	Саблин	Архип	Моисеевич	102179, г. Усть-Джегута, ул. Баженова, дом 60, квартира 237	\N	\N	\N	53	\N	\N	\N	\N	20.jpg
23	\N	\N	\N	\N	lox	123	2	5	\N	\N	\N	\N	2.jpg
15	Лимарова	Клара	Емельяновна	658982, г. Мантурово, ул. Бараньи горки, дом 82, квартира 134	\N	\N	\N	66	\N	\N	\N	\N	2.jpg
16	Никитина	Александра	Алексеевна	352194, г. Тимашевск, ул. Завокзальная 1-я, дом 45, квартира 267	\N	\N	\N	6	\N	\N	\N	\N	3.jpg
17	Шкловский	Никон	Алексеевич	309746, г. Чамзинка, ул. Бахрушина, дом 32, квартира 4	\N	\N	\N	45	\N	\N	\N	\N	4.jpg
1	Язева	Христина	Серафимовна	102682, г. Ардатов, ул. Авиаконструктора Яковлева, дом 35, квартира 191	\N	\N	\N	23	\N	\N	\N	\N	5.jpg
\.


--
-- TOC entry 2874 (class 0 OID 16597)
-- Dependencies: 196
-- Data for Name: книги; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."книги" ("id_книги", "Название_Книги", img_src, "Дата_добавления", "Рейтинг", "id_автора", "Описание") FROM stdin;
3	1984	3.jpg	2018-12-22	10	3	Своеобразный антипод второй великой антиутопии XX века - "О дивный новый мир" Олдоса Хаксли. Что, в сущности, страшнее: доведенное до абсурда "общество потребления" - или доведенное до абсолюта "общество идеи"? По Оруэллу, нет и не может быть ничего ужаснее тотальной несвободы...
4	Мастер и Маргарита	4.jpg	2018-12-22	10	4	Один из самых загадочных и удивительных романов XX века. Роман "Мастер и Маргарита" - визитная карточка Михаила Афанасьевича Булгакова. Более десяти лет Булгаков работал над книгой, которая стала его романом-судьбой, романом-завещанием. В "Мастере и Маргарите" есть все: веселое озорство и щемящая печаль, романтическая любовь и колдовское наваждение, магическая тайна и безрассудная игра с нечистой силой.
6	Портрет Дориана Грея	6.jpg	2018-12-22	10	6	«Портрет Дориана Грея» – одно из величайших произведений последних полутора столетий, роман, который пытались запретить, а автора осуждали за «непристойное поведение». Превращение прекрасного и невинного юноши Дориана в чудовище под влиянием гедонистических идей и циничных афоризмов лорда Генри – в романе, породившем культ вечной молодости.
7	Вино из одуванчиков	7.jpg	2018-12-22	10	7	Войдите в светлый мир двенадцатилетнего мальчика и проживите с ним одно лето, наполненное событиями радостными и печальными, загадочными и тревожными; лето, когда каждый день совершаются удивительные открытия, главное из которых — ты живой, ты дышишь, ты чувствуешь! «Вино из одуванчиков» Рэя Брэдбери — классическое произведение, вошедшее в золотой фонд мировой литературы.
9	Цветы для Элджернона	9.jpg	2018-12-22	10	9	Сорок лет назад это считалось фантастикой. Сорок лет назад это читалось как фантастика. Исследующая и расширяющая границы жанра, жадно впитывающая всевозможные новейшие веяния, примеряющая общечеловеческое лицо, отважно игнорирующая каинову печать "жанрового гетто". Сейчас это воспринимается как одно из самых человечных произведений новейшего времени, как роман пронзительной психологической силы, как филигранное развитие темы любви и ответственности. Не зря вышедшую уже в 1990-е книгу воспоминаний Киз назвал "Элджернон, Чарли и я".
10	Маленький принц	10.jpg	2018-12-22	10	10	«Маленький принц» — аллегорическая повесть, наиболее известное произведение Антуана де Сент-Экзюпери.
15	Тень горы	15.jpg	2018-12-22	10	2	Впервые на русском – долгожданное продолжение одного из самых поразительных романов начала XXI века. 
2	Шантарам	2.jpg	2018-12-22	10	2	Мастер мирового масштаба, совмещающий в литературе несовместимое. Создатель таких ярчайших шедевров, как "Марсианские хроники", "451° по Фаренгейту", "Вино из одуванчиков" и так далее и так далее. Лауреат многочисленных премий. Это Рэй Брэдбери. Его увлекательные истории прославили автора не только как непревзойденного рассказчика, но и как философа, мыслителя и психолога. Магический реализм его прозы, рукотворные механизмы радости, переносящие человека из настоящего в волшебные миры детства, чудо приобщения к великой тайне Литературы, щедро раздариваемое читателю, давно вывели Брэдбери на высокую классическую орбиту. Собранные в этой книге произведения - достойное тому подтверждение.
8	Над пропастью во ржи	8.jpg	2018-12-22	10	1	Писатель-классик, писатель-загадка, на пике своей карьеры объявивший об уходе из литературы и поселившийся вдали от мирских соблазнов в глухой американской провинции. Единственный роман Сэлинджера, НАД ПРОПАСТЬЮ ВО РЖИ стал переломной вехой в истории мировой литературы. И название романа, и имя его главного героя Холдена Колфилда сделались кодовыми для многих поколений молодых бунтарей от битников и хиппи до современных радикальных молодежных движений. Культовый роман ХХ века в блестящем переводе Риты Райт-Ковалевой, ставшем классикой переводческого искусства.
13	Анна Каренина	13.jpg	2018-12-22	10	13	Гениальный роман Льва Толстого, который не оставляет равнодушным никого, кто его прочел. Драма жизни, женская саморазрушающая любовь, поиски себя и становление личности - все в традициях русской классики. 
14	Сто лет одиночества	14.jpg	2018-12-22	10	14	Странная, поэтичная, причудливая история города Макондо, затерянного где-то в джунглях, - от сотворения до упадка. История рода Буэндиа - семьи, в которой чудеса столь повседневны, что на них даже не обращают внимания. Клан Буэндиа порождает святых и грешников, революционеров, героев и предателей, лихих авантюристов - и женщин, слишком прекрасных для обычной жизни. В нем кипят необычайные страсти - и происходят невероятные события. Однако эти невероятные события снова и снова становятся своеобразным "волшебным зеркалом", сквозь которое читателю является подлинная история Латинской Америки.
17	Триумфальная арка	17.jpg	2018-12-22	10	5	Один из самых красивых и трагических романов о любви в истории европейской литературы, не единожды экранизированный, до сих пор не утративший ни своего горького обаяния, ни удивительного влияния на эмоции читателей. История беженца из нацистской Германии доктора Равика и запутавшейся в "невыносимой легкости бытия" прекрасной Жоан Маду происходит в предвоенном Париже. И тревожное, страшное время, в которое довелось познакомиться и полюбить друг друга этим двоим становится одним из главных героев "Триумфальной арки"…
18	Граф Монте-Кристо	18.jpg	2018-12-22	10	18	"Граф Монте-Кристо"- книга, которую вот уже полтора столетия с увлечением читают и взрослые, и дети. Это история о том, как невинно осужденный моряк стал сказочно богатым графом и о том, как он вознаградил своих верных друзей и отомстил врагам.
20	Марсианин	20.jpg	2018-12-22	10	20	Энди Вейр (Andy Weir) с пятнадцати лет и до сих пор работает инженером-программистом. Увлекается изучением релятивистской физики, орбитальной механики, истории пилотируемой космонавтики. "Марсианин" - его первый роман. Обстоятельства сложились так, что астронавт остался на Марсе совершенно один, без связи с людьми, при ограниченных запасах пищи и иных жизненно необходимых ресурсов. Члены команды, решив, что он погиб во время песчаной бури, покинули поверхность Красной планеты, и главному герою приходится бороться за жизнь в непростых условиях и искать способ вернуться домой.
1	451° по Фаренгейту	1.jpg	2018-12-22	10	1	Мастер мирового масштаба, совмещающий в литературе несовместимое. Создатель таких ярчайших шедевров, как "Марсианские хроники", "451° по Фаренгейту", "Вино из одуванчиков" и так далее и так далее. Лауреат многочисленных премий. Это Рэй Брэдбери. Его увлекательные истории прославили автора не только как непревзойденного рассказчика, но и как философа, мыслителя и психолога. Магический реализм его прозы, рукотворные механизмы радости, переносящие человека из настоящего в волшебные миры детства, чудо приобщения к великой тайне Литературы, щедро раздариваемое читателю, давно вывели Брэдбери на высокую классическую орбиту. Собранные в этой книге произведения - достойное тому подтверждение.
19	Двенадцать стульев	19.jpg	2018-12-22	10	19	Знаменитый роман-фельетон И.Ильфа и Е.Петрова «Двенадцать стульев» впервые был опубликован в 1928 году, а сегодня его называют в числе культовых произведений отечественной литературы XX века. История двух аферистов, пустившихся на поиски брильянтов мадам Петуховой, пользуется неизменным успехом у читателей. Имя Остапа Бендера. великого комбинатора, стало нарицательным, а сам роман разошелся на цитаты и выдержал сотни успешных переизданий.
12	Атлант расправил плечи	12.jpg	2018-12-22	10	12	Айн Рэнд - наша бывшая соотечественница, ставшая крупнейшей американской писательницей. Автор четырех романов-бестселлеров и многочислен­ных статей. Создатель философской концепции, в основе которой лежит принцип свободы воли, главенство рациональности и "нравственность разумного эгоизма". Ее книги читает весь мир. В США она завоевала огромную популярность, ее ро­маны переиздаются из года в год и по совокупности тиражей конкурируют с Биб­лией. Всемирное признание Айн Рэнд нетрудно объяснить: исключительный дар предвидения в самых разных областях - политике, бизнесе, экономике, обществен­ных отношениях - в сочетании с художественной одаренностью принесли ей славу большого писателя и проницательного мыслителя. АТЛАНТ РАСПРАВИЛ ПЛЕЧИ, самое значимое произведение своей жизни, она писала 12 лет.
16	Преступление и наказание	16.jpg	2018-12-22	10	16	Ф.М.Достоевский - один из тех немногих писателей, которые повлияли на умы не только современников, но и потомков. В своем творчестве он ставит самые главные, самые трудные - непосильные - вопросы. Роман "Преступление и наказание" - детектив со всеми необходимыми атрибутами: "хождение по мукам" нищего студента Родиона Раскольникова, убийство старухи-процентщицы, последовавшее за ним расследование, наказание и, конечно же, любовь... Но не этим прежде всего он привлекает читателя. Достоевский гениально показал бунт-преступление "гордого человека", его внутренний мир, подняв вечные вопросы: Что есть человек? В чем его спасение?
5	Три товарища	5.jpg	2018-12-22	10	5	Трое друзей - Робби, отчаянный автогонщик Кестер и "последний романтик" Ленц прошли Первую мировую войну. Вернувшись в гражданскую жизнь, они основали небольшую автомастерскую. И хотя призраки прошлого преследуют их, они не унывают - ведь что может быть лучше дружбы, крепкой и верной, ради которой можно отдать последнее? Наверное, лишь только любовь, не знающая границ и пределов. Прекрасная и грустная Пат, нежная возлюбленная Робби, рассеивает мрак бессмысленности его существования. Однако обретенному счастью угрожают отголоски все той же войны - существующие уже не только в памяти и сознании героев, а суровым образом воплотившиеся в реальность... Эта история раз и навсегда покорила сердца миллионов читателей по всему миру. На этой книге выросли поколения, ее давно раздергали на цитаты, неоднократно экранизировали и продолжают ставить на сцене. Ее хочется перечитывать снова и снова.
11	Убить пересмешника	11.jpg	2018-12-22	10	11	О книге "Убить пересмешника" (1960 г.) - пронзительная история семьи, живущей в вымышленном маленьком городке на юге Америки, в штате Алабама. Время действия - 30-ые годы XX века, период Великой Депрессии. Рассказ ведется от лица восьмилетней девочки. Главная героиня Джин Финч живет с отцом Аттикусом, адвокатом, и братом Джимом. У них с братом есть друг Дилл, и один враг на троих - сосед по прозвищу Страшила. Мир глазами ребенка - сложный, противоречивый, неоднозначный, - проносится перед читателем. Все смешалось в этом мире: детские страхи и взрослые проблемы, жажда справедливости и горькая реальность, расовые проблемы американского юга и сложности отдельно взятой семьи. В центре сюжета - судебный процесс над чернокожим парнем, его обвиняют в изнасиловании, которого он не совершал. Адвокатом выступает отец Джин Аттикус и борется изо всех сил, чтобы справедливость восторжествовала. Об авторе Харпер Ли - "гений одной книги", роман...
\.


--
-- TOC entry 2884 (class 0 OID 16773)
-- Dependencies: 206
-- Data for Name: комментарии; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."комментарии" ("id_комментария", "id_клиента", text, "id_книги") FROM stdin;
1	1	test1	1
2	2	test2	2
3	3	test3	3
4	4	test4	4
5	5	test5	5
6	6	test6	6
7	7	test7	7
8	8	test8	8
9	9	test9	9
10	10	test10	10
11	11	test11	11
12	22	Ура! Я в коментах	12
\.


--
-- TOC entry 2880 (class 0 OID 16673)
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
-- TOC entry 2877 (class 0 OID 16621)
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
-- TOC entry 2876 (class 0 OID 16612)
-- Dependencies: 198
-- Data for Name: штрафы; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."штрафы" ("id_штрафа", "описание_штрафа", "штрафная_сумма") FROM stdin;
1	Нет штрафа	0,00 ?
\.


--
-- TOC entry 2740 (class 2606 OID 16767)
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (id_role);


--
-- TOC entry 2732 (class 2606 OID 16694)
-- Name: авторы авторы_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."авторы"
    ADD CONSTRAINT "авторы_pk" PRIMARY KEY ("id_автора");


--
-- TOC entry 2736 (class 2606 OID 16707)
-- Name: виды_контактов виды_контактов_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."виды_контактов"
    ADD CONSTRAINT "виды_контактов_pk" PRIMARY KEY ("id_вид_контакта");


--
-- TOC entry 2730 (class 2606 OID 16637)
-- Name: выдача_книг выдача_книг_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."выдача_книг"
    ADD CONSTRAINT "выдача_книг_pk" PRIMARY KEY ("id_выдачи");


--
-- TOC entry 2724 (class 2606 OID 16635)
-- Name: жанры жанры_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."жанры"
    ADD CONSTRAINT "жанры_pk" PRIMARY KEY ("id_жанра");


--
-- TOC entry 2738 (class 2606 OID 16723)
-- Name: клиенты клиенты_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."клиенты"
    ADD CONSTRAINT "клиенты_pk" PRIMARY KEY ("id_клиента");


--
-- TOC entry 2722 (class 2606 OID 16633)
-- Name: книги книги_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."книги"
    ADD CONSTRAINT "книги_pk" PRIMARY KEY ("id_книги");


--
-- TOC entry 2742 (class 2606 OID 16781)
-- Name: комментарии комментарии_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."комментарии"
    ADD CONSTRAINT "комментарии_pk" PRIMARY KEY ("id_комментария");


--
-- TOC entry 2734 (class 2606 OID 16677)
-- Name: полка полка_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."полка"
    ADD CONSTRAINT "полка_pk" PRIMARY KEY ("id_полки");


--
-- TOC entry 2728 (class 2606 OID 16639)
-- Name: читатели читатели_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."читатели"
    ADD CONSTRAINT "читатели_pk" PRIMARY KEY ("id_читателя");


--
-- TOC entry 2726 (class 2606 OID 16641)
-- Name: штрафы штрафы_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."штрафы"
    ADD CONSTRAINT "штрафы_pk" PRIMARY KEY ("id_штрафа");


--
-- TOC entry 2747 (class 2606 OID 16678)
-- Name: выдача_книг выдача_книг_полка_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."выдача_книг"
    ADD CONSTRAINT "выдача_книг_полка_fk" FOREIGN KEY ("id_полки") REFERENCES public."полка"("id_полки");


--
-- TOC entry 2745 (class 2606 OID 16647)
-- Name: выдача_книг выдача_книг_читатели_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."выдача_книг"
    ADD CONSTRAINT "выдача_книг_читатели_fk" FOREIGN KEY ("id_читателя") REFERENCES public."читатели"("id_читателя");


--
-- TOC entry 2746 (class 2606 OID 16652)
-- Name: выдача_книг выдача_книг_штрафы_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."выдача_книг"
    ADD CONSTRAINT "выдача_книг_штрафы_fk" FOREIGN KEY ("id_штрафа") REFERENCES public."штрафы"("id_штрафа");


--
-- TOC entry 2751 (class 2606 OID 16768)
-- Name: клиенты клиенты_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."клиенты"
    ADD CONSTRAINT "клиенты_role_fk" FOREIGN KEY (id_role) REFERENCES public.role(id_role);


--
-- TOC entry 2752 (class 2606 OID 16782)
-- Name: комментарии комментарии_клиенты_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."комментарии"
    ADD CONSTRAINT "комментарии_клиенты_fk" FOREIGN KEY ("id_клиента") REFERENCES public."клиенты"("id_клиента");


--
-- TOC entry 2750 (class 2606 OID 16695)
-- Name: полка полка_авторы_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."полка"
    ADD CONSTRAINT "полка_авторы_fk" FOREIGN KEY ("id_автора") REFERENCES public."авторы"("id_автора");


--
-- TOC entry 2748 (class 2606 OID 16683)
-- Name: полка полка_жанры_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."полка"
    ADD CONSTRAINT "полка_жанры_fk" FOREIGN KEY ("id_жанра") REFERENCES public."жанры"("id_жанра");


--
-- TOC entry 2749 (class 2606 OID 16688)
-- Name: полка полка_книги_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."полка"
    ADD CONSTRAINT "полка_книги_fk" FOREIGN KEY ("id_книги") REFERENCES public."книги"("id_книги");


--
-- TOC entry 2743 (class 2606 OID 16708)
-- Name: читатели читатели_виды_контактов_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."читатели"
    ADD CONSTRAINT "читатели_виды_контактов_fk" FOREIGN KEY ("id_вид_контакта") REFERENCES public."виды_контактов"("id_вид_контакта");


--
-- TOC entry 2744 (class 2606 OID 16724)
-- Name: читатели читатели_клиенты_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."читатели"
    ADD CONSTRAINT "читатели_клиенты_fk" FOREIGN KEY ("id_клиента") REFERENCES public."клиенты"("id_клиента");


-- Completed on 2018-12-22 01:48:18

--
-- PostgreSQL database dump complete
--

