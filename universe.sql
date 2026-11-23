--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(50) NOT NULL,
    galaxy_type character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    has_life boolean,
    description text
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    has_atmosphere boolean,
    diameter_km integer,
    discovery_year integer,
    description text
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    diameter_km integer,
    distance_from_earth numeric(14,2),
    description text
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    temperature integer,
    is_spherical boolean,
    description text
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spirale barrée', 13600, 0.00, true, 'Notre galaxie');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spirale', 10000, 2.50, false, 'Galaxie voisine');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spirale', 10000, 2.70, false, 'Troisième plus grande du Groupe local');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irrégulière', 13000, 0.16, false, 'Satellite de la Voie lactée');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spirale', 400, 31.00, false, 'Galaxie du Tourbillon');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Lenticulaire', 13250, 29.30, false, 'Galaxie du Sombrero');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, false, 3474, 0, 'Satellite de la Terre');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, false, 22, 1877, 'Lune de Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, false, 12, 1877, 'Lune de Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, true, true, 3643, 1610, 'Lune volcanique');
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, true, 3122, 1610, 'Océan sous la glace');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, true, true, 5268, 1610, 'Plus grande lune du système solaire');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, true, 4821, 1610, 'Lune très cratérisée');
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, false, 167, 1892, 'Lune irrégulière');
INSERT INTO public.moon VALUES (9, 'Titan', 6, true, true, 5150, 1655, 'Atmosphère épaisse');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, true, false, 504, 1789, 'Geysers de glace');
INSERT INTO public.moon VALUES (11, 'Mimas', 6, true, false, 396, 1789, 'Grand cratère Herschel');
INSERT INTO public.moon VALUES (12, 'Rhea', 6, true, false, 1527, 1672, 'Lune glacée');
INSERT INTO public.moon VALUES (13, 'Dione', 6, true, false, 1123, 1684, 'Lune glacée');
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, true, false, 1469, 1671, 'Deux faces contrastées');
INSERT INTO public.moon VALUES (15, 'Titania', 7, true, false, 1578, 1787, 'Plus grande lune d''Uranus');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, true, false, 1523, 1787, 'Lune d''Uranus');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, true, false, 472, 1948, 'Relief très varié');
INSERT INTO public.moon VALUES (18, 'Triton', 8, true, true, 2707, 1846, 'Orbite rétrograde');
INSERT INTO public.moon VALUES (19, 'Nereid', 8, false, false, 340, 1949, 'Orbite très excentrique');
INSERT INTO public.moon VALUES (20, 'Charon', 9, true, false, 1212, 1978, 'Plus grande lune de Pluton');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, true, 4879, 91.70, 'Planète la plus proche du Soleil');
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, true, 12104, 41.40, 'Planète très chaude');
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, true, 12742, 0.00, 'Notre planète');
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, true, 6779, 78.30, 'La planète rouge');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, true, 139820, 628.70, 'Géante gazeuse');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, true, 116460, 1275.00, 'Planète aux anneaux');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 50724, 2724.00, 'Géante de glaces');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, true, 49244, 4351.00, 'Planète la plus éloignée');
INSERT INTO public.planet VALUES (9, 'Pluto', 1, false, true, 2377, 5900.00, 'Planète naine');
INSERT INTO public.planet VALUES (10, 'Proxima b', 3, false, true, 14000, 40113000.00, 'Exoplanète potentiellement tempérée');
INSERT INTO public.planet VALUES (11, 'Proxima c', 3, false, true, 20000, 40113000.00, 'Exoplanète candidate');
INSERT INTO public.planet VALUES (12, 'Proxima d', 3, false, true, 6000, 40113000.00, 'Exoplanète candidate');


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Tellurique', 'Planète rocheuse avec une surface solide');
INSERT INTO public.planet_types VALUES (2, 'Géante gazeuse', 'Planète massive composée surtout d''hydrogène et d''hélium');
INSERT INTO public.planet_types VALUES (3, 'Géante de glaces', 'Planète riche en eau, ammoniac et méthane');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5772, true, 'Notre étoile');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 9940, true, 'Étoile la plus brillante du ciel');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4850, 3042, true, 'Étoile la plus proche du Soleil');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 10, 3600, true, 'Supergéante rouge');
INSERT INTO public.star VALUES (5, 'Mirach', 2, 200, 3800, true, 'Géante rouge');
INSERT INTO public.star VALUES (6, 'R136a1', 4, 1, 46000, true, 'Une des étoiles les plus massives connues');


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
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 3, true);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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

