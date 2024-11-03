--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE users;
--
-- Name: users; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE users WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE users OWNER TO freecodecamp;

\connect users

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 9999999 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1730601348010', 0, 9999999);
INSERT INTO public.users VALUES (3, 'user_1730601348009', 0, 9999999);
INSERT INTO public.users VALUES (5, 'user_1730602422267', 2, 9999999);
INSERT INTO public.users VALUES (4, 'user_1730602422268', 5, 9999999);
INSERT INTO public.users VALUES (7, 'user_1730602511371', 2, 9999999);
INSERT INTO public.users VALUES (18, 'user_1730603127529', 2, 176);
INSERT INTO public.users VALUES (6, 'user_1730602511372', 5, 9999999);
INSERT INTO public.users VALUES (8, '853', 1, 9999999);
INSERT INTO public.users VALUES (17, 'user_1730603127530', 5, 90);
INSERT INTO public.users VALUES (10, 'user_1730602966262', 2, 224);
INSERT INTO public.users VALUES (20, 'user_1730603131543', 2, 646);
INSERT INTO public.users VALUES (19, 'user_1730603131544', 5, 240);
INSERT INTO public.users VALUES (9, 'user_1730602966263', 5, 129);
INSERT INTO public.users VALUES (12, 'user_1730602984331', 2, 50);
INSERT INTO public.users VALUES (11, 'user_1730602984332', 5, 22);
INSERT INTO public.users VALUES (1, 'JOE', 5, 2);
INSERT INTO public.users VALUES (22, 'user_1730603134203', 2, 141);
INSERT INTO public.users VALUES (21, 'user_1730603134204', 5, 30);
INSERT INTO public.users VALUES (14, 'user_1730603081612', 2, 129);
INSERT INTO public.users VALUES (13, 'user_1730603081613', 5, 8);
INSERT INTO public.users VALUES (16, 'user_1730603096884', 2, 558);
INSERT INTO public.users VALUES (15, 'user_1730603096885', 5, 43);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

