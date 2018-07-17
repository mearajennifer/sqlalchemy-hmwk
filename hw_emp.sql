--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.13
-- Dumped by pg_dump version 9.5.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.departments (
    dept_code character varying(5) NOT NULL,
    dept character varying(20),
    phone character varying(20)
);


ALTER TABLE public.departments OWNER TO vagrant;

--
-- Name: employees; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE public.employees (
    emp_id integer NOT NULL,
    name character varying(60) NOT NULL,
    state character varying(2) NOT NULL,
    fav_color character varying(20),
    dept_code character varying
);


ALTER TABLE public.employees OWNER TO vagrant;

--
-- Name: employees_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE public.employees_emp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_emp_id_seq OWNER TO vagrant;

--
-- Name: employees_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE public.employees_emp_id_seq OWNED BY public.employees.emp_id;


--
-- Name: emp_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.employees ALTER COLUMN emp_id SET DEFAULT nextval('public.employees_emp_id_seq'::regclass);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.departments (dept_code, dept, phone) FROM stdin;
ed	Education	555-1000
admin	Administration	555-2222
oth	Other	555-3333
pt	Part-Time	555-9999
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY public.employees (emp_id, name, state, fav_color, dept_code) FROM stdin;
1	Joel Burton	CA	orange	ed
2	Cynthia Dueltgen	CA	purple	ed
3	Rachel Thomas	CA	Unknown	ed
4	Katie Lefevre	CA	rainbow	ed
5	Meggie Mahnken	CA	black	ed
6	Ahmad Alawad	CA	blue	ed
7	Heather Bryant	CA	purple	ed
8	Meg Bishop	CA	blue	ed
9	Katie Byers	CA	red	ed
10	Henry Chen	CA	green	ed
11	Kara DeWalt	CA	cyan	ed
12	Lavinia Karl	CA	orange	ed
13	David Phillips	CA	Unknown	admin
14	Angie Chang	CA	Unknown	admin
15	Stefan Gomez	CA	Unknown	admin
16	Laura Gillen	CA	Unknown	admin
17	Paria Rajai	CA	Unknown	admin
18	Wendy Saccuzzo	CA	Unknown	oth
19	Dori Grant	CA	Unknown	oth
20	Kari Burge	CA	purple	oth
21	Rachel Walker	CA	Unknown	pt
22	Balloonicorn	CA	rainbow	\N
\.


--
-- Name: employees_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('public.employees_emp_id_seq', 22, true);


--
-- Name: departments_dept_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_dept_key UNIQUE (dept);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_code);


--
-- Name: employees_name_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_name_key UNIQUE (name);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_id);


--
-- Name: employees_dept_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_dept_code_fkey FOREIGN KEY (dept_code) REFERENCES public.departments(dept_code);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

