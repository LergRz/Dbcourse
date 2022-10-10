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
    name character varying(20) NOT NULL,
    description character varying(100),
    has_life boolean,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth_in_km numeric(7,3),
    comments text
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(30) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100),
    has_life boolean,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth_in_km numeric(7,3),
    planet_id integer NOT NULL
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
    name character varying(20) NOT NULL,
    description character varying(100),
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,1),
    distance_from_earth_in_km numeric(7,3),
    comments text,
    number_dominant_species integer,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(30) NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100),
    age_in_millions_of_years numeric(4,1),
    distance_from_earth_in_km numeric(7,3),
    category integer,
    galaxy_id integer NOT NULL
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Canis Major', 'the first galaxy I remember', false, true, 400.3, 4847.333, 'just a comment');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'the second one I remember', false, true, 739.3, 8373.383, 'another comment');
INSERT INTO public.galaxy VALUES (3, 'Milky Way', 'the one where we live in, I think', true, true, 435.4, 50.300, 'is a nice place to live in');
INSERT INTO public.galaxy VALUES (4, 'Cygnus', 'is really really far', false, false, 234.3, 9898.880, 'I dont know what to write in here');
INSERT INTO public.galaxy VALUES (5, 'Virgo', 'has a black hole in the center', true, false, 342.3, 2434.534, 'a useless comment');
INSERT INTO public.galaxy VALUES (6, 'magellanic', 'his name is similar to magallanes', false, true, 323.4, 2568.038, 'I am tired of comments');


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'spiral', 'has a spiral form');
INSERT INTO public.galaxy_type VALUES (2, 'elliptical', 'has an elliptical form');
INSERT INTO public.galaxy_type VALUES (3, 'irregular', 'it has a mess up form');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'our only moon', false, 23.3, 1.200, 2);
INSERT INTO public.moon VALUES (2, 'phobos', 'the first moon of mars', false, 2.3, 1.400, 1);
INSERT INTO public.moon VALUES (3, 'deimos', 'the second moon of mars', false, 1.3, 1.200, 1);
INSERT INTO public.moon VALUES (4, 'Adrastea', 'discovered in 1979', false, 4.3, 434.320, 3);
INSERT INTO public.moon VALUES (5, 'Altnea', 'member of karme group', false, 32.4, 424.300, 3);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'discovered in 1892', false, 32.3, 324.400, 3);
INSERT INTO public.moon VALUES (7, 'Ananke', 'dicovered in 1951', false, 22.3, 2.300, 3);
INSERT INTO public.moon VALUES (8, 'Aoede', 'discovered in 2003', false, 23.1, 5.300, 3);
INSERT INTO public.moon VALUES (9, 'Arche', 'member of carme group', false, 32.3, 321.300, 3);
INSERT INTO public.moon VALUES (10, 'Autonoe', 'discovered in 2001', false, 4.3, 345.200, 3);
INSERT INTO public.moon VALUES (11, 'Callrhoe', 'discovered in 1999', false, 4.3, 52.300, 3);
INSERT INTO public.moon VALUES (12, 'Callisto', 'I remember this one', false, 4.1, 56.500, 3);
INSERT INTO public.moon VALUES (13, 'Carme', 'discovered in 1938', false, 5.3, 524.400, 3);
INSERT INTO public.moon VALUES (14, 'Carpo', 'discovered in 2003', false, 3.5, 434.500, 3);
INSERT INTO public.moon VALUES (15, 'Chaldene', 'discovered in 2000', false, 45.4, 434.000, 3);
INSERT INTO public.moon VALUES (16, 'Cyllene', 'discovered in 2003', false, 4.4, 53.200, 3);
INSERT INTO public.moon VALUES (17, 'Dia', 'has a radius of 2km', false, 43.4, 35.500, 3);
INSERT INTO public.moon VALUES (18, 'Eirene', 'discovered in 2003', false, 32.4, 534.000, 3);
INSERT INTO public.moon VALUES (19, 'Elara', 'discovered in 1905', false, 83.3, 839.300, 3);
INSERT INTO public.moon VALUES (20, 'Erinome', 'discovered in 2000', false, 4.3, 434.000, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Spe', 'is an extra solar planet', false, true, 23.2, 2353.434, 'I dont know anything about it', 0, 4);
INSERT INTO public.planet VALUES (10, 'Arion', 'located in delphine', false, true, 923.3, 3939.320, ' I dontknow much about it', 0, 4);
INSERT INTO public.planet VALUES (11, 'Arkas', 'located in urse major', false, true, 32.3, 2248.430, 'an extra solar planet', 0, 4);
INSERT INTO public.planet VALUES (12, 'Orbitar', 'located in draco', false, true, 24.4, 2423.245, 'just another planet', 0, 4);
INSERT INTO public.planet VALUES (13, 'amateru', 'located in epsilon tauri', false, true, 534.3, 4343.345, 'just another planet', 0, 4);
INSERT INTO public.planet VALUES (1, 'Mars', 'the red planet', false, true, 34.4, 2.400, 'is the planet we want to conquer', 0, 9);
INSERT INTO public.planet VALUES (2, 'earth', 'our planet', true, true, 323.2, NULL, 'the only planet we have', 1, 9);
INSERT INTO public.planet VALUES (3, 'jupiter', 'the biggest planet of our solar system', false, true, 345.3, 3255.320, 'is really big', NULL, 9);
INSERT INTO public.planet VALUES (4, 'Mercury', 'the first planet of the solar system', false, true, 11.2, 23.300, 'the first one', 0, 9);
INSERT INTO public.planet VALUES (5, 'venus', 'the second planet', false, true, 20.3, 203.320, 'the second one', 0, 9);
INSERT INTO public.planet VALUES (6, 'Saturn', 'the fifth one', false, true, 29.4, 343.400, 'the fifth one from earth', 0, 9);
INSERT INTO public.planet VALUES (7, 'Uranus', 'is a blue planet', false, true, 32.3, 324.320, 'is very blue', 0, 9);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'giant planet', 'a massive planet');
INSERT INTO public.planet_type VALUES (2, 'ice giant', 'made of ice');
INSERT INTO public.planet_type VALUES (3, 'subearth', 'smaller than earth');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'alpha andromeda', 'a cute yellow star', 33.3, 4234.434, 2, 2);
INSERT INTO public.star VALUES (4, 'beta andromeda', 'a cute blue star', 23.4, 4353.325, 1, 2);
INSERT INTO public.star VALUES (5, 'upsilon andromeda', 'a cute white star', 12.3, 8383.200, 3, 2);
INSERT INTO public.star VALUES (6, 'proxima centauri', 'is a relatively near star from earth', 253.4, 34.345, 1, 3);
INSERT INTO public.star VALUES (7, 'Sirius a', 'has a twin star', 12.4, 2342.324, 1, 3);
INSERT INTO public.star VALUES (8, 'Epsilon eridani', 'I dontt know', 23.2, 2343.215, 1, 3);
INSERT INTO public.star VALUES (9, 'Sun', 'our star', 434.4, 434.430, 3, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


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
-- PostgreSQL database dump complete
--

