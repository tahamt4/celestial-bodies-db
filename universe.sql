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

ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_galaxy_id_fkey;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_star_id_fkey;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_planet_id_fkey;
ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_pkey;
ALTER TABLE IF EXISTS ONLY public.star DROP CONSTRAINT IF EXISTS star_name_key;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_pkey;
ALTER TABLE IF EXISTS ONLY public.planet DROP CONSTRAINT IF EXISTS planet_name_key;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_pkey;
ALTER TABLE IF EXISTS ONLY public.moon DROP CONSTRAINT IF EXISTS moon_name_key;
ALTER TABLE IF EXISTS ONLY public.galaxy DROP CONSTRAINT IF EXISTS galaxy_pkey;
ALTER TABLE IF EXISTS ONLY public.galaxy DROP CONSTRAINT IF EXISTS galaxy_name_key;
ALTER TABLE IF EXISTS ONLY public.comet DROP CONSTRAINT IF EXISTS comet_pkey;
ALTER TABLE IF EXISTS ONLY public.comet DROP CONSTRAINT IF EXISTS comet_name_key;
ALTER TABLE IF EXISTS public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE IF EXISTS public.comet ALTER COLUMN comet_id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.star_star_id_seq;
DROP TABLE IF EXISTS public.star;
DROP SEQUENCE IF EXISTS public.planet_planet_id_seq;
DROP TABLE IF EXISTS public.planet;
DROP SEQUENCE IF EXISTS public.moon_moon_id_seq;
DROP TABLE IF EXISTS public.moon;
DROP SEQUENCE IF EXISTS public.galaxy_galaxy_id_seq;
DROP TABLE IF EXISTS public.galaxy;
DROP SEQUENCE IF EXISTS public.comet_comet_id_seq;
DROP TABLE IF EXISTS public.comet;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL,
    has_tail boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
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
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_planet integer NOT NULL,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_star numeric,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
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
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    is_spherical boolean NOT NULL,
    has_planets boolean NOT NULL,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.comet (comet_id, name, age_in_millions_of_years, distance_from_earth, is_spherical, has_tail) FROM stdin;
1	Halley	4500	6	f	t
2	Hale-Bopp	4500	197	f	t
3	Shoemaker-Levy	4500	4	f	t
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, age_in_millions_of_years, distance_from_earth, is_spherical, has_life, description) FROM stdin;
1	Milky Way	13600	0	t	t	The galaxy containing our solar system
2	Andromeda	10100	2537000	t	f	Nearest spiral galaxy to the Milky Way
3	Triangulum	10000	3000000	t	f	Third largest in the Local Group
4	Whirlpool	400	23000000	t	f	Known for its distinctive whirlpool shape
5	Sombrero	13250	29000000	t	f	Named for its resemblance to a sombrero hat
6	Cartwheel	500	500000000	f	f	Has a ring shape caused by a collision
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, age_in_millions_of_years, distance_from_planet, is_spherical, has_atmosphere, planet_id) FROM stdin;
1	Moon	4500	384400	t	f	1
2	Phobos	4500	9376	f	f	2
3	Deimos	4500	23460	f	f	2
4	Io	4500	421700	t	t	3
5	Europa	4500	671100	t	t	3
6	Ganymede	4500	1070400	t	t	3
7	Callisto	4500	1882700	t	f	3
8	Titan	4500	1221870	t	t	4
9	Enceladus	4500	238020	t	t	4
10	Mimas	4500	185520	t	f	4
11	Rhea	4500	527070	t	f	4
12	Dione	4500	377400	t	f	4
13	Tethys	4500	294660	t	f	4
14	Hyperion	4500	1481010	f	f	4
15	Triton	4500	354759	t	t	7
16	Proteus	4500	117647	f	f	7
17	Ariel	4500	191020	t	f	8
18	Umbriel	4500	266000	t	f	8
19	Titania	4500	436300	t	f	8
20	Oberon	4500	583500	t	f	8
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, age_in_millions_of_years, distance_from_star, is_spherical, has_life, star_id) FROM stdin;
1	Earth	4500	1	t	t	1
2	Mars	4500	2	t	f	1
3	Jupiter	4500	5	t	f	1
4	Saturn	4500	10	t	f	1
5	Venus	4500	1	t	f	1
6	Mercury	4500	0	t	f	1
7	Neptune	4500	30	t	f	1
8	Uranus	4500	19	t	f	1
9	Proxima b	100	0	t	f	4
10	Proxima c	100	0	t	f	4
11	Vega b	200	3	t	f	6
12	Vega c	200	6	f	f	6
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, age_in_millions_of_years, distance_from_earth, is_spherical, has_planets, galaxy_id) FROM stdin;
1	Sun	4600	0	t	t	1
2	Sirius	200	9	t	f	1
3	Betelgeuse	8	700	t	f	1
4	Proxima Centauri	4850	4	t	t	1
5	Rigel	8	860	t	f	2
6	Vega	455	25	t	t	2
\.


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

