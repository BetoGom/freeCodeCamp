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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(255) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games_opponent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_opponent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_opponent_id_seq OWNER TO freecodecamp;

--
-- Name: games_opponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_opponent_id_seq OWNED BY public.games.opponent_id;


--
-- Name: games_winner_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_winner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_winner_id_seq OWNER TO freecodecamp;

--
-- Name: games_winner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_winner_id_seq OWNED BY public.games.winner_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: games winner_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN winner_id SET DEFAULT nextval('public.games_winner_id_seq'::regclass);


--
-- Name: games opponent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN opponent_id SET DEFAULT nextval('public.games_opponent_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 2018, 'Final', 11, 8, 4, 2);
INSERT INTO public.games VALUES (2, 2018, 'Third Place', 3, 10, 2, 0);
INSERT INTO public.games VALUES (3, 2018, 'Semi-Final', 8, 10, 2, 1);
INSERT INTO public.games VALUES (4, 2018, 'Semi-Final', 11, 3, 1, 0);
INSERT INTO public.games VALUES (5, 2018, 'Quarter-Final', 8, 19, 3, 2);
INSERT INTO public.games VALUES (6, 2018, 'Quarter-Final', 10, 21, 2, 0);
INSERT INTO public.games VALUES (7, 2018, 'Quarter-Final', 3, 4, 2, 1);
INSERT INTO public.games VALUES (8, 2018, 'Quarter-Final', 11, 24, 2, 0);
INSERT INTO public.games VALUES (9, 2018, 'Eighth-Final', 10, 6, 2, 1);
INSERT INTO public.games VALUES (10, 2018, 'Eighth-Final', 21, 22, 1, 0);
INSERT INTO public.games VALUES (11, 2018, 'Eighth-Final', 3, 14, 3, 2);
INSERT INTO public.games VALUES (12, 2018, 'Eighth-Final', 4, 15, 2, 0);
INSERT INTO public.games VALUES (13, 2018, 'Eighth-Final', 8, 9, 2, 1);
INSERT INTO public.games VALUES (14, 2018, 'Eighth-Final', 19, 20, 2, 1);
INSERT INTO public.games VALUES (15, 2018, 'Eighth-Final', 24, 18, 2, 1);
INSERT INTO public.games VALUES (16, 2018, 'Eighth-Final', 11, 2, 4, 3);
INSERT INTO public.games VALUES (17, 2014, 'Final', 12, 2, 1, 0);
INSERT INTO public.games VALUES (18, 2014, 'Third Place', 16, 4, 3, 0);
INSERT INTO public.games VALUES (19, 2014, 'Semi-Final', 2, 16, 1, 0);
INSERT INTO public.games VALUES (20, 2014, 'Semi-Final', 12, 4, 7, 1);
INSERT INTO public.games VALUES (21, 2014, 'Quarter-Final', 16, 4, 1, 0);
INSERT INTO public.games VALUES (22, 2014, 'Quarter-Final', 2, 3, 1, 0);
INSERT INTO public.games VALUES (23, 2014, 'Quarter-Final', 4, 6, 2, 1);
INSERT INTO public.games VALUES (24, 2014, 'Quarter-Final', 12, 11, 1, 0);
INSERT INTO public.games VALUES (25, 2014, 'Eighth-Final', 4, 5, 2, 1);
INSERT INTO public.games VALUES (26, 2014, 'Eighth-Final', 6, 24, 2, 0);
INSERT INTO public.games VALUES (27, 2014, 'Eighth-Final', 11, 17, 2, 0);
INSERT INTO public.games VALUES (28, 2014, 'Eighth-Final', 12, 1, 2, 1);
INSERT INTO public.games VALUES (29, 2014, 'Eighth-Final', 16, 15, 2, 1);
INSERT INTO public.games VALUES (31, 2014, 'Eighth-Final', 2, 22, 1, 0);
INSERT INTO public.games VALUES (30, 2014, 'Eighth-Final', 7, 13, 2, 1);
INSERT INTO public.games VALUES (32, 2014, 'Eighth-Final', 3, 23, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (1, 'Algeria');
INSERT INTO public.teams VALUES (2, 'Argentina');
INSERT INTO public.teams VALUES (3, 'Belgium');
INSERT INTO public.teams VALUES (4, 'Brazil');
INSERT INTO public.teams VALUES (5, 'Chile');
INSERT INTO public.teams VALUES (6, 'Colombia');
INSERT INTO public.teams VALUES (7, 'Costa Rica');
INSERT INTO public.teams VALUES (8, 'Croatia');
INSERT INTO public.teams VALUES (9, 'Denmark');
INSERT INTO public.teams VALUES (10, 'England');
INSERT INTO public.teams VALUES (11, 'France');
INSERT INTO public.teams VALUES (12, 'Germany');
INSERT INTO public.teams VALUES (13, 'Greece');
INSERT INTO public.teams VALUES (14, 'Japan');
INSERT INTO public.teams VALUES (15, 'Mexico');
INSERT INTO public.teams VALUES (16, 'Netherlands');
INSERT INTO public.teams VALUES (17, 'Nigeria');
INSERT INTO public.teams VALUES (18, 'Portugal');
INSERT INTO public.teams VALUES (19, 'Russia');
INSERT INTO public.teams VALUES (20, 'Spain');
INSERT INTO public.teams VALUES (21, 'Sweden');
INSERT INTO public.teams VALUES (22, 'Switzerland');
INSERT INTO public.teams VALUES (23, 'United States');
INSERT INTO public.teams VALUES (24, 'Uruguay');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: games_opponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_opponent_id_seq', 1, false);


--
-- Name: games_winner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_winner_id_seq', 1, false);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 24, true);


--
-- Name: games pk_games; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT pk_games PRIMARY KEY (game_id);


--
-- Name: teams pk_teams; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT pk_teams PRIMARY KEY (team_id);


--
-- Name: teams uc_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT uc_name UNIQUE (name);


--
-- Name: games fk_teamsopponent; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_teamsopponent FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games fk_teamwinner; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_teamwinner FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

