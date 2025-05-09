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
-- Name: dwarf_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.dwarf_planet (
    dwarf_planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    orbital_period_in_years numeric(5,2) NOT NULL,
    distance_from_sun_in_au numeric(4,2) NOT NULL,
    has_rings boolean NOT NULL,
    mass_in_earth_masses numeric(5,2) NOT NULL,
    diameter_in_km integer NOT NULL
);


ALTER TABLE public.dwarf_planet OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.dwarf_planet_dwarf_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dwarf_planet_dwarf_planet_id_seq OWNER TO freecodecamp;

--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.dwarf_planet_dwarf_planet_id_seq OWNED BY public.dwarf_planet.dwarf_planet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    type text NOT NULL,
    diameter_in_ly numeric(6,2) NOT NULL,
    num_stars integer NOT NULL,
    age_in_billion_years integer NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    orbital_period_in_days numeric(5,2) NOT NULL,
    radius_in_km integer NOT NULL,
    is_tidally_locked boolean NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    planet_type text NOT NULL,
    orbital_period_in_days numeric(5,2) NOT NULL,
    distance_from_star_in_au numeric(4,2) NOT NULL,
    has_atmosphere boolean NOT NULL,
    has_water boolean NOT NULL,
    mass_in_earth_masses numeric(5,2)
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type text NOT NULL,
    mass_in_solar_masses numeric(4,2) NOT NULL,
    radius_in_solar_radii numeric(4,2) NOT NULL,
    temperature_in_kelvin integer NOT NULL,
    is_main_sequence boolean NOT NULL
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
-- Name: dwarf_planet dwarf_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet ALTER COLUMN dwarf_planet_id SET DEFAULT nextval('public.dwarf_planet_dwarf_planet_id_seq'::regclass);


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
-- Data for Name: dwarf_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.dwarf_planet VALUES (1, 'Ceres', 4.60, 2.77, false, 0.01, 950);
INSERT INTO public.dwarf_planet VALUES (2, 'Pluto', 8.00, 3.48, false, 0.02, 900);
INSERT INTO public.dwarf_planet VALUES (3, 'Eris', 9.00, 4.67, false, 0.03, 890);
INSERT INTO public.dwarf_planet VALUES (4, 'Makemake', 7.00, 3.79, false, 0.01, 880);
INSERT INTO public.dwarf_planet VALUES (5, 'Haumea', 6.00, 3.34, true, 0.01, 870);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100.00, 100, 13, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 220.00, 120, 10, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 60.00, 90, 12, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 50.00, 75, 9, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 62.00, 80, 8, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Elliptical', 60.00, 60, 13, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 27.32, 100, true, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 0.32, 11, true, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1.26, 6, true, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1.77, 120, true, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3.55, 160, true, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 7.15, 263, true, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 16.69, 240, true, false);
INSERT INTO public.moon VALUES (8, 'Mimas', 6, 0.94, 98, true, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 1.37, 99, true, true);
INSERT INTO public.moon VALUES (10, 'Tethys', 6, 1.89, 100, true, false);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 2.73, 101, true, false);
INSERT INTO public.moon VALUES (12, 'Rhea', 6, 4.52, 102, true, false);
INSERT INTO public.moon VALUES (13, 'Titan', 6, 15.95, 103, true, true);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 2.52, 104, true, false);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 4.14, 105, true, false);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 8.71, 106, true, false);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 13.46, 107, true, false);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 5.88, 108, true, true);
INSERT INTO public.moon VALUES (19, 'Nereid', 8, 60.13, 109, false, false);
INSERT INTO public.moon VALUES (20, 'Charon', 9, 6.39, 110, true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88.00, 0.39, false, false, 0.06);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 225.00, 0.72, true, false, 0.82);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365.25, 1.00, true, true, 1.00);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687.00, 1.52, true, false, 0.11);
INSERT INTO public.planet VALUES (5, 'Planet X', 2, 'Gas Giant', 433.00, 2.50, true, false, 80.00);
INSERT INTO public.planet VALUES (6, 'Planet Y', 2, 'Gas Giant', 759.00, 3.20, true, false, 60.00);
INSERT INTO public.planet VALUES (7, 'Planet Z', 3, 'Ice Giant', 300.00, 2.10, true, false, 20.00);
INSERT INTO public.planet VALUES (8, 'Planet W', 3, 'Ice Giant', 200.00, 1.90, true, false, 18.00);
INSERT INTO public.planet VALUES (9, 'Planet A', 4, 'Terrestrial', 130.00, 0.85, true, false, 1.30);
INSERT INTO public.planet VALUES (10, 'Planet B', 5, 'Gas Giant', 100.00, 0.90, true, false, 1.94);
INSERT INTO public.planet VALUES (11, 'Planet C', 5, 'Gas Giant', 30.00, 0.13, true, false, 0.68);
INSERT INTO public.planet VALUES (12, 'Planet D', 6, 'Terrestrial', 129.85, 0.40, true, false, 1.40);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.00, 1.00, 577, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 2.00, 1.70, 800, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 'G2V', 1.10, 1.10, 600, true);
INSERT INTO public.star VALUES (4, 'Vega', 1, 'A0V', 2.10, 2.50, 850, true);
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 'B9p', 3.00, 2.00, 900, true);
INSERT INTO public.star VALUES (6, 'Mirach', 2, 'M0III', 3.00, 3.00, 450, false);


--
-- Name: dwarf_planet_dwarf_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.dwarf_planet_dwarf_planet_id_seq', 5, true);


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
-- Name: dwarf_planet dwarf_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_name_key UNIQUE (name);


--
-- Name: dwarf_planet dwarf_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.dwarf_planet
    ADD CONSTRAINT dwarf_planet_pkey PRIMARY KEY (dwarf_planet_id);


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

