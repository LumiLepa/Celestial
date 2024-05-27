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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter numeric(7,2),
    groups text,
    is_visible_unaided boolean,
    morph_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    in_group character varying(30),
    mass numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: morphology; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.morphology (
    morph_id integer NOT NULL,
    name character varying(30) NOT NULL,
    classification character varying(10)
);


ALTER TABLE public.morphology OWNER TO freecodecamp;

--
-- Name: morphology_morph_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.morphology_morph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.morphology_morph_id_seq OWNER TO freecodecamp;

--
-- Name: morphology_morph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.morphology_morph_id_seq OWNED BY public.morphology.morph_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric,
    mass numeric,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    classification character(1),
    in_milkyway boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: morphology morph_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.morphology ALTER COLUMN morph_id SET DEFAULT nextval('public.morphology_morph_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Large Magellanic Cloud', 40.00, 'Local Groups', true, 1);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 100.00, 'Local Groups', false, 3);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 16000.00, 'Virgo Cluster', false, 2);
INSERT INTO public.galaxy VALUES (4, 'Andromeda Galaxy', 220.00, 'Local Groups', true, 3);
INSERT INTO public.galaxy VALUES (5, 'Virgo A', 2.20, 'Virgo Cluster', false, 1);
INSERT INTO public.galaxy VALUES (6, 'Cygnus A', 130.00, 'Cygnus Cloud', false, 2);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Prometheus', 'Inner', 0.15, 1);
INSERT INTO public.moon VALUES (2, 'Epimetheus', 'Inner', 0.1, 1);
INSERT INTO public.moon VALUES (3, 'Naiad', 'Inner', 0.004, 2);
INSERT INTO public.moon VALUES (4, 'Mab', 'Outer', 0.002, 2);
INSERT INTO public.moon VALUES (5, 'Hippolyta', 'Inner', 0.3, 3);
INSERT INTO public.moon VALUES (6, 'Rosalind', 'Outer', 0.2, 3);
INSERT INTO public.moon VALUES (7, 'Pandora I', 'Inner', 0.8, 4);
INSERT INTO public.moon VALUES (8, 'Pandora II', 'Outer', 1.2, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 'Inner', 1.5, 5);
INSERT INTO public.moon VALUES (10, 'Dione', 'Outer', 1.1, 5);
INSERT INTO public.moon VALUES (11, 'Terra', 'Inner', 0.3, 6);
INSERT INTO public.moon VALUES (12, 'Luna', 'Outer', 0.75, 6);
INSERT INTO public.moon VALUES (13, 'Alnath I', 'Inner', 0.5, 7);
INSERT INTO public.moon VALUES (14, 'Alnath II', 'Outer', 0.4, 7);
INSERT INTO public.moon VALUES (15, 'Desdemona', 'Inner', 1, 8);
INSERT INTO public.moon VALUES (16, 'Juliet', 'Outer', 0.8, 8);
INSERT INTO public.moon VALUES (17, 'Unlikely Moon I', NULL, 0.2, 9);
INSERT INTO public.moon VALUES (18, 'Unlikely Moon II', NULL, 0.19, 9);
INSERT INTO public.moon VALUES (19, 'Phobos', 'Inner', 0.002, 11);
INSERT INTO public.moon VALUES (20, 'Deimos', 'Outer', 0.001, 11);


--
-- Data for Name: morphology; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.morphology VALUES (1, 'shell', 'eo');
INSERT INTO public.morphology VALUES (2, 'type-cd', 'e');
INSERT INTO public.morphology VALUES (3, 'spiral', 's');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-186f', 1.15, 1.4, 2);
INSERT INTO public.planet VALUES (2, 'LHS 1140b', 1.4, 7, 3);
INSERT INTO public.planet VALUES (3, 'HAT-P-11b', 4, 30, 4);
INSERT INTO public.planet VALUES (4, 'Pandora', 2, 5, 1);
INSERT INTO public.planet VALUES (5, 'Titan', 1.5, 2, 2);
INSERT INTO public.planet VALUES (6, 'Proxima d', 0.8, 0.5, 3);
INSERT INTO public.planet VALUES (7, 'Alpheratz c i', 2.5, 8, 4);
INSERT INTO public.planet VALUES (8, 'Alpheratz c ii', 1, 2, 4);
INSERT INTO public.planet VALUES (9, 'WR Cyg X-1 b', 3, 12, 6);
INSERT INTO public.planet VALUES (10, 'WR Cyg X-1 c', 1.8, 4, 6);
INSERT INTO public.planet VALUES (11, 'venus', 0.95, 0.81, 2);
INSERT INTO public.planet VALUES (12, 'mars', 0.5, 0.64, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'R136a1', 'O', false, 1);
INSERT INTO public.star VALUES (2, 'Sun', 'G', true, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 'M', false, 5);
INSERT INTO public.star VALUES (4, 'Alpheratz', 'B', false, 4);
INSERT INTO public.star VALUES (5, 'M87', NULL, false, 3);
INSERT INTO public.star VALUES (6, 'WR Cyg X-1', 'W', false, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: morphology_morph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.morphology_morph_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: morphology morphology_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.morphology
    ADD CONSTRAINT morphology_name_key UNIQUE (name);


--
-- Name: morphology morphology_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.morphology
    ADD CONSTRAINT morphology_pkey PRIMARY KEY (morph_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy fk_morph_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_morph_id FOREIGN KEY (morph_id) REFERENCES public.morphology(morph_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_star_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star fk_star_is; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_is FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

