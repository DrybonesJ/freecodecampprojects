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
    age_in_billions_of_years numeric,
    number_of_stars_in_billions integer,
    galaxy_type character varying(30)
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
    name character varying(30),
    planet_id integer NOT NULL,
    type character varying(30),
    has_water boolean
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    in_solar_system boolean,
    planet_type text,
    star_id integer NOT NULL
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
    name character varying(30),
    galaxy_id integer NOT NULL,
    star_types_id integer NOT NULL,
    is_blackhole boolean
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
-- Name: star_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_types (
    star_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    color character varying(30),
    weight integer
);


ALTER TABLE public.star_types OWNER TO freecodecamp;

--
-- Name: star_types_star_types_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_types_star_types_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_types_star_types_seq OWNER TO freecodecamp;

--
-- Name: star_types_star_types_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_types_star_types_seq OWNED BY public.star_types.star_types_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_types star_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types ALTER COLUMN star_types_id SET DEFAULT nextval('public.star_types_star_types_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, 100, 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10, 1000, 'barred spiral');
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 13.3, 100, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 10, 7, 'lenticular ring');
INSERT INTO public.galaxy VALUES (5, 'Fireworks', 10, 1, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'Cigar', 0.5, 30, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'rock', false);
INSERT INTO public.moon VALUES (2, 'Metis', 5, 'inner', false);
INSERT INTO public.moon VALUES (3, 'Adrastea', 5, 'inner', false);
INSERT INTO public.moon VALUES (4, 'Amaithea', 5, 'inner', false);
INSERT INTO public.moon VALUES (5, 'Thebe', 5, 'inner', false);
INSERT INTO public.moon VALUES (6, 'lo', 5, 'galileo', false);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 'galileo', false);
INSERT INTO public.moon VALUES (8, 'Ganymede', 5, 'galileo', false);
INSERT INTO public.moon VALUES (9, 'Callisto', 5, 'galileo', false);
INSERT INTO public.moon VALUES (10, 'Leda', 5, 'Himalia', false);
INSERT INTO public.moon VALUES (11, 'Ersa', 5, 'Himalia', false);
INSERT INTO public.moon VALUES (12, 'Himalia', 5, 'Himalia', false);
INSERT INTO public.moon VALUES (13, 'Pandia', 5, 'Himalia', false);
INSERT INTO public.moon VALUES (14, 'Lysithea', 5, 'Himalia', false);
INSERT INTO public.moon VALUES (15, 'Elara', 5, 'Himalia', false);
INSERT INTO public.moon VALUES (16, 'Dia', 5, 'Himalia', false);
INSERT INTO public.moon VALUES (20, 'Erriapus', 6, 'Gallic', false);
INSERT INTO public.moon VALUES (17, 'Mimas', 6, 'Major', false);
INSERT INTO public.moon VALUES (18, 'Enceladus', 6, 'Major', false);
INSERT INTO public.moon VALUES (19, 'Albiorix', 6, 'Gallic', false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', true, 'rock', 1);
INSERT INTO public.planet VALUES (2, 'Venus', true, 'rock', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'rock', 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 'rock', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 'gas', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 'gas', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 'gas', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 'gas', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', true, 'rock', 1);
INSERT INTO public.planet VALUES (10, 'Roshar', false, 'rock', 2);
INSERT INTO public.planet VALUES (11, 'Scadriel', false, 'rock', 3);
INSERT INTO public.planet VALUES (12, 'Sel', false, 'rock', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 2, false);
INSERT INTO public.star VALUES (2, 'Bamba', 2, 3, true);
INSERT INTO public.star VALUES (3, 'Big Fella', 5, 1, false);
INSERT INTO public.star VALUES (4, 'Little Fella', 2, 3, false);
INSERT INTO public.star VALUES (5, 'Orion', 1, 1, false);
INSERT INTO public.star VALUES (6, 'Small Tooth', 6, 3, false);


--
-- Data for Name: star_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_types VALUES (1, 'White Dwarf', 'White', 20);
INSERT INTO public.star_types VALUES (2, 'Red Dwarf', 'Red', 10);
INSERT INTO public.star_types VALUES (3, 'Neutron Star', 'White', 50);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: star_types_star_types_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_types_star_types_seq', 4, true);


--
-- Name: galaxy galaxy_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constraint UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_constraint UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_constraint UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_constraint; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constraint UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_types star_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_pkey PRIMARY KEY (star_types_id);


--
-- Name: star_types star_types_star_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_types
    ADD CONSTRAINT star_types_star_types_key UNIQUE (star_types_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_star_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_types_id_fkey FOREIGN KEY (star_types_id) REFERENCES public.star_types(star_types_id);


--
-- PostgreSQL database dump complete
--

