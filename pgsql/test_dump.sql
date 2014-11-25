--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: application_data; Type: TABLE; Schema: public; Owner: webadmin; Tablespace: 
--

CREATE TABLE application_data (
    id integer NOT NULL,
    description character varying(120),
    status boolean
);


ALTER TABLE public.application_data OWNER TO webadmin;

--
-- Name: application_data_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE application_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.application_data_id_seq OWNER TO webadmin;

--
-- Name: application_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE application_data_id_seq OWNED BY application_data.id;


--
-- Name: investment_levels; Type: TABLE; Schema: public; Owner: webadmin; Tablespace: 
--

CREATE TABLE investment_levels (
    id integer NOT NULL,
    name character varying(120)
);


ALTER TABLE public.investment_levels OWNER TO webadmin;

--
-- Name: investment_levels_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE investment_levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.investment_levels_id_seq OWNER TO webadmin;

--
-- Name: investment_levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE investment_levels_id_seq OWNED BY investment_levels.id;


--
-- Name: processes; Type: TABLE; Schema: public; Owner: webadmin; Tablespace: 
--

CREATE TABLE processes (
    id integer NOT NULL,
    name character varying(120),
    role_id integer
);


ALTER TABLE public.processes OWNER TO webadmin;

--
-- Name: processes_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE processes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.processes_id_seq OWNER TO webadmin;

--
-- Name: processes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE processes_id_seq OWNED BY processes.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: webadmin; Tablespace: 
--

CREATE TABLE questions (
    id integer NOT NULL,
    name text,
    answer1 text,
    answer2 text,
    answer3 text,
    answer4 text,
    process_id integer
);


ALTER TABLE public.questions OWNER TO webadmin;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO webadmin;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: webadmin; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.roles OWNER TO webadmin;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO webadmin;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: user_choices; Type: TABLE; Schema: public; Owner: webadmin; Tablespace: 
--

CREATE TABLE user_choices (
    id integer NOT NULL,
    user_id integer,
    field character varying(120),
    question text,
    choice integer,
    answer text
);


ALTER TABLE public.user_choices OWNER TO webadmin;

--
-- Name: user_choices_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE user_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_choices_id_seq OWNER TO webadmin;

--
-- Name: user_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE user_choices_id_seq OWNED BY user_choices.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: webadmin; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(50),
    role_id integer,
    _password bytea,
    _salt character varying(120)
);


ALTER TABLE public.users OWNER TO webadmin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: webadmin
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO webadmin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: webadmin
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY application_data ALTER COLUMN id SET DEFAULT nextval('application_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY investment_levels ALTER COLUMN id SET DEFAULT nextval('investment_levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY processes ALTER COLUMN id SET DEFAULT nextval('processes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY user_choices ALTER COLUMN id SET DEFAULT nextval('user_choices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: application_data; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY application_data (id, description, status) FROM stdin;
3	is_gm_answered_on_questions	f
1	is_headmaster_start_testing	t
2	is_cso_choose_processes	t
\.


--
-- Name: application_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('application_data_id_seq', 3, true);


--
-- Data for Name: investment_levels; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY investment_levels (id, name) FROM stdin;
1	Инвестиционный уровень 1
2	Инвестиционный уровень 2
3	Инвестиционный уровень 3
4	Инвестиционный уровень 4
5	Инвестиционный уровень 5
\.


--
-- Name: investment_levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('investment_levels_id_seq', 5, true);


--
-- Data for Name: processes; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY processes (id, name, role_id) FROM stdin;
1	Процесс 1.1	4
2	Процесс 1.2	3
3	Процесс 2.1	3
4	Процесс 2.2	3
5	Процесс 3.1	3
6	Процесс 3.2	6
7	Процесс 4.1	5
8	Процесс 4.2	5
9	Процесс 5.1	5
10	Процесс 5.2	3
11	Процесс 6.1	3
12	Процесс 6.2	4
13	Процесс 7.1	4
14	Процесс 7.2	5
15	Процесс 8.1	6
16	Процесс 8.2	3
17	Процесс 9.1	3
18	Процесс 9.2	4
19	Процесс 10.1	6
20	Процесс 10.2	5
\.


--
-- Name: processes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('processes_id_seq', 20, true);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY questions (id, name, answer1, answer2, answer3, answer4, process_id) FROM stdin;
1	Вопрос 1.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	1
2	Вопрос 1.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	1
3	Вопрос 1.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	1
4	Вопрос 1.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	1
5	Вопрос 2.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	2
6	Вопрос 2.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	2
7	Вопрос 2.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	2
8	Вопрос 2.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	2
9	Вопрос 3.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	3
10	Вопрос 3.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	3
11	Вопрос 3.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	3
12	Вопрос 3.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	3
13	Вопрос 4.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	4
14	Вопрос 4.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	4
15	Вопрос 4.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	4
16	Вопрос 4.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	4
17	Вопрос 5.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	5
18	Вопрос 5.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	5
19	Вопрос 5.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	5
20	Вопрос 5.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	5
21	Вопрос 6.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	6
22	Вопрос 6.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	6
23	Вопрос 6.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	6
24	Вопрос 6.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	6
25	Вопрос 7.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	7
26	Вопрос 7.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	7
27	Вопрос 7.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	7
28	Вопрос 7.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	7
29	Вопрос 8.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	8
30	Вопрос 8.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	8
31	Вопрос 8.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	8
32	Вопрос 8.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	8
33	Вопрос 9.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	9
34	Вопрос 9.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	9
35	Вопрос 9.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	9
36	Вопрос 9.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	9
37	Вопрос 10.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	10
38	Вопрос 10.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	10
39	Вопрос 10.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	10
40	Вопрос 10.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	10
41	Вопрос 11.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	11
42	Вопрос 11.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	11
43	Вопрос 11.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	11
44	Вопрос 11.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	11
45	Вопрос 12.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	12
46	Вопрос 12.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	12
47	Вопрос 12.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	12
48	Вопрос 12.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	12
49	Вопрос 13.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	13
50	Вопрос 13.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	13
51	Вопрос 13.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	13
52	Вопрос 13.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	13
53	Вопрос 14.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	14
54	Вопрос 14.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	14
55	Вопрос 14.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	14
56	Вопрос 14.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	14
57	Вопрос 15.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	15
58	Вопрос 15.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	15
59	Вопрос 15.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	15
60	Вопрос 15.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	15
61	Вопрос 16.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	16
62	Вопрос 16.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	16
63	Вопрос 16.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	16
64	Вопрос 16.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	16
65	Вопрос 17.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	17
66	Вопрос 17.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	17
67	Вопрос 17.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	17
68	Вопрос 17.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	17
69	Вопрос 18.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	18
70	Вопрос 18.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	18
71	Вопрос 18.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	18
72	Вопрос 18.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	18
73	Вопрос 19.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	19
74	Вопрос 19.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	19
75	Вопрос 19.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	19
76	Вопрос 19.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	19
77	Вопрос 20.1	Ответ 1	Ответ 2	Ответ 3	Ответ 4	20
78	Вопрос 20.2	Ответ 1	Ответ 2	Ответ 3	Ответ 4	20
79	Вопрос 20.3	Ответ 1	Ответ 2	Ответ 3	Ответ 4	20
80	Вопрос 20.4	Ответ 1	Ответ 2	Ответ 3	Ответ 4	20
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('questions_id_seq', 80, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY roles (id, name) FROM stdin;
1	Administrator
2	headmaster
3	CSO
4	GM
5	OM
6	TM
\.


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('roles_id_seq', 6, true);


--
-- Data for Name: user_choices; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY user_choices (id, user_id, field, question, choice, answer) FROM stdin;
1	2	investment_level	Инвестиционный уровень	2	Инвестиционный уровень 2
2	3	process	Процесс	3	Процесс 2.1
3	3	process	Процесс	4	Процесс 2.2
4	3	process	Процесс	5	Процесс 3.1
5	3	process	Процесс	6	Процесс 3.2
6	3	process	Процесс	7	Процесс 4.1
7	3	process	Процесс	11	Процесс 6.1
8	3	process	Процесс	16	Процесс 8.2
9	3	process	Процесс	18	Процесс 9.2
\.


--
-- Name: user_choices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('user_choices_id_seq', 9, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: webadmin
--

COPY users (id, username, role_id, _password, _salt) FROM stdin;
1	admin	1	\\x427ba62cd863e0e46e3c868d1a04a73260c87270d938fb27e623299bf95259c00a541abe0ca0b54841c33a082938bba0878ae03902740a5ef04f34616c60fe8c	245864514587612132981466439936412131996
2	hm	2	\\xf5780ac783e379a0e8b1154054583c270313f48b6a47a4a66966791363252ea52304001d379dd9ccf9ac545c75634f4455309aee2397330447305299e56b26b0	66228113115176009287167593508105107450
3	cso	3	\\xa19337422a30a275c7c5e1d13378995ac86484eedebb1ddde22eec21da6e3c765b3cbeec4a5fd0c2ac6e878a0abd0f3b5570e00a9390698e4bad65c39d3a300b	206117367271885439647953295930176212266
4	gm	4	\\x37461815b6f79b91a3021b471d3d95ca1f09f2fc994dd3b0f15d1a077097686770036a42d6b4b2b02a3987145e61f3df9af7ec5c8b5728a4d478ea64605ddd94	166833311379741906625136252475937610070
5	om	5	\\x485f5cef7b1fe9451823a85726bb12056774c20bffe76de513712567edfbff3d6b436e43f16566cb071a8fad3310a20be6c91a87eb0b8ee5799f99692b22a388	147592198089977691948298508524887208760
6	tm	6	\\xde0920e82d3bbbc5a38849c6f67a791320f1329eb43e1a91972ff67c740beb0e1a4575c95d76fd13bcb29a1751df9c00342182e71b10e43f305e45ce71748ecd	101907847554540587282424992275003207369
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: webadmin
--

SELECT pg_catalog.setval('users_id_seq', 6, true);


--
-- Name: application_data_description_key; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY application_data
    ADD CONSTRAINT application_data_description_key UNIQUE (description);


--
-- Name: application_data_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY application_data
    ADD CONSTRAINT application_data_pkey PRIMARY KEY (id);


--
-- Name: investment_levels_name_key; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY investment_levels
    ADD CONSTRAINT investment_levels_name_key UNIQUE (name);


--
-- Name: investment_levels_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY investment_levels
    ADD CONSTRAINT investment_levels_pkey PRIMARY KEY (id);


--
-- Name: processes_name_key; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY processes
    ADD CONSTRAINT processes_name_key UNIQUE (name);


--
-- Name: processes_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY processes
    ADD CONSTRAINT processes_pkey PRIMARY KEY (id);


--
-- Name: questions_name_key; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_name_key UNIQUE (name);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: roles_name_key; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: user_choices_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY user_choices
    ADD CONSTRAINT user_choices_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: webadmin; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: processes_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY processes
    ADD CONSTRAINT processes_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: questions_process_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_process_id_fkey FOREIGN KEY (process_id) REFERENCES processes(id);


--
-- Name: user_choices_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY user_choices
    ADD CONSTRAINT user_choices_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: webadmin
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

