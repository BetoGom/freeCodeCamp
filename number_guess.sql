--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: seqid; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.seqid
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seqid OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: usergames; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usergames (
    id integer NOT NULL,
    name character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.usergames OWNER TO freecodecamp;

--
-- Name: usergames_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usergames_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usergames_id_seq OWNER TO freecodecamp;

--
-- Name: usergames_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usergames_id_seq OWNED BY public.usergames.id;


--
-- Name: usergames id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usergames ALTER COLUMN id SET DEFAULT nextval('public.usergames_id_seq'::regclass);


--
-- Data for Name: usergames; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usergames VALUES (53, 'user_1674769726835', 2, 265);
INSERT INTO public.usergames VALUES (52, 'user_1674769726836', 5, 181);
INSERT INTO public.usergames VALUES (71, 'user_1674770687334', 2, 554);
INSERT INTO public.usergames VALUES (55, 'user_1674769827874', 2, 347);
INSERT INTO public.usergames VALUES (70, 'user_1674770687335', 5, 12);
INSERT INTO public.usergames VALUES (54, 'user_1674769827875', 5, 15);
INSERT INTO public.usergames VALUES (57, 'user_1674769857373', 2, 56);
INSERT INTO public.usergames VALUES (73, 'user_1674770850278', 2, 549);
INSERT INTO public.usergames VALUES (56, 'user_1674769857374', 5, 27);
INSERT INTO public.usergames VALUES (72, 'user_1674770850279', 5, 341);
INSERT INTO public.usergames VALUES (59, 'user_1674769977627', 2, 699);
INSERT INTO public.usergames VALUES (58, 'user_1674769977628', 5, 12);
INSERT INTO public.usergames VALUES (61, 'user_1674770036287', 2, 863);
INSERT INTO public.usergames VALUES (75, 'user_1674770909867', 2, 288);
INSERT INTO public.usergames VALUES (60, 'user_1674770036288', 5, 232);
INSERT INTO public.usergames VALUES (62, 'Beto', 1, 1000);
INSERT INTO public.usergames VALUES (74, 'user_1674770909868', 5, 110);
INSERT INTO public.usergames VALUES (64, 'user_1674770224921', 2, 621);
INSERT INTO public.usergames VALUES (63, 'user_1674770224922', 5, 464);
INSERT INTO public.usergames VALUES (65, 'BetoGom', 1, 2);
INSERT INTO public.usergames VALUES (77, 'user_1674770921205', 2, 448);
INSERT INTO public.usergames VALUES (67, 'user_1674770422557', 2, 292);
INSERT INTO public.usergames VALUES (66, 'user_1674770422558', 5, 73);
INSERT INTO public.usergames VALUES (76, 'user_1674770921206', 5, 69);
INSERT INTO public.usergames VALUES (69, 'user_1674770645940', 2, 430);
INSERT INTO public.usergames VALUES (68, 'user_1674770645941', 5, 69);
INSERT INTO public.usergames VALUES (79, 'user_1674770979809', 2, 292);
INSERT INTO public.usergames VALUES (78, 'user_1674770979810', 5, 109);


--
-- Name: seqid; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.seqid', 79, true);


--
-- Name: usergames_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usergames_id_seq', 1, false);


--
-- Name: usergames pk_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usergames
    ADD CONSTRAINT pk_id PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

