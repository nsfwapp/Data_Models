--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2021-01-31 13:50:59

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
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 704 (class 1247 OID 16929)
-- Name: gender_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.gender_type AS ENUM (
    'Male',
    'Female',
    'Trans-M',
    'Trans-F',
    'Intersex'
);


SET default_table_access_method = heap;

--
-- TOC entry 201 (class 1259 OID 17784)
-- Name: directors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    name character varying
);


--
-- TOC entry 200 (class 1259 OID 17782)
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.directors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 200
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- TOC entry 209 (class 1259 OID 17833)
-- Name: genres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    genre_name character varying
);


--
-- TOC entry 208 (class 1259 OID 17831)
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 208
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- TOC entry 216 (class 1259 OID 17902)
-- Name: movie_cast_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_cast_table (
    movie_id integer,
    performer_id integer
);


--
-- TOC entry 218 (class 1259 OID 17928)
-- Name: movie_genres_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_genres_table (
    movie_id integer,
    genre_id integer
);


--
-- TOC entry 217 (class 1259 OID 17915)
-- Name: movie_tags_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie_tags_table (
    movie_id integer,
    tag_id integer
);


--
-- TOC entry 215 (class 1259 OID 17873)
-- Name: movies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    movie_title character varying,
    movie_cover character varying[],
    length time without time zone,
    movie_trailer character varying,
    description text,
    gallary_urls character varying[],
    studio_id integer,
    director_id integer,
    release_date_id integer,
    rating_id integer
);


--
-- TOC entry 214 (class 1259 OID 17871)
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 214
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- TOC entry 213 (class 1259 OID 17857)
-- Name: performers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.performers (
    id integer NOT NULL,
    name character varying,
    aliases text,
    gender public.gender_type,
    description text,
    profile_pic character varying[],
    date_of_birth date,
    years_active character varying,
    ethnicity character varying,
    birth_place character varying,
    height character varying,
    hair_color character varying,
    eye_color character varying,
    boobs character varying,
    tattoos character varying,
    piercings character varying,
    measurments character varying,
    rating_id integer
);


--
-- TOC entry 212 (class 1259 OID 17855)
-- Name: performers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.performers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 212
-- Name: performers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.performers_id_seq OWNED BY public.performers.id;


--
-- TOC entry 205 (class 1259 OID 17807)
-- Name: ratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    rating numeric
);


--
-- TOC entry 204 (class 1259 OID 17805)
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 204
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- TOC entry 203 (class 1259 OID 17797)
-- Name: releasedates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.releasedates (
    id integer NOT NULL,
    relesse_date date
);


--
-- TOC entry 202 (class 1259 OID 17795)
-- Name: releasedates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.releasedates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 202
-- Name: releasedates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.releasedates_id_seq OWNED BY public.releasedates.id;


--
-- TOC entry 221 (class 1259 OID 17977)
-- Name: scene_cast_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scene_cast_table (
    scene_id integer,
    performer_id integer
);


--
-- TOC entry 222 (class 1259 OID 17990)
-- Name: scene_tags_table; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scene_tags_table (
    scene_id integer,
    tag_id integer
);


--
-- TOC entry 220 (class 1259 OID 17943)
-- Name: scenes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scenes (
    id integer NOT NULL,
    title character varying,
    thumbnail_url character varying,
    preview_url character varying,
    length time without time zone,
    description text,
    gallary_urls character varying[],
    studio_id integer,
    director_id integer,
    release_date_id integer,
    rating_id integer,
    movie_id integer
);


--
-- TOC entry 219 (class 1259 OID 17941)
-- Name: scenes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.scenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 219
-- Name: scenes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.scenes_id_seq OWNED BY public.scenes.id;


--
-- TOC entry 207 (class 1259 OID 17820)
-- Name: studios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.studios (
    id integer NOT NULL,
    studio character varying,
    parent_studio character varying,
    url character varying,
    description text
);


--
-- TOC entry 206 (class 1259 OID 17818)
-- Name: studios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.studios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 206
-- Name: studios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.studios_id_seq OWNED BY public.studios.id;


--
-- TOC entry 211 (class 1259 OID 17844)
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    tag character varying
);


--
-- TOC entry 210 (class 1259 OID 17842)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 210
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 2929 (class 2604 OID 17787)
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- TOC entry 2933 (class 2604 OID 17836)
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- TOC entry 2936 (class 2604 OID 17876)
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- TOC entry 2935 (class 2604 OID 17860)
-- Name: performers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers ALTER COLUMN id SET DEFAULT nextval('public.performers_id_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 17810)
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- TOC entry 2930 (class 2604 OID 17800)
-- Name: releasedates id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.releasedates ALTER COLUMN id SET DEFAULT nextval('public.releasedates_id_seq'::regclass);


--
-- TOC entry 2937 (class 2604 OID 17946)
-- Name: scenes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenes ALTER COLUMN id SET DEFAULT nextval('public.scenes_id_seq'::regclass);


--
-- TOC entry 2932 (class 2604 OID 17823)
-- Name: studios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.studios ALTER COLUMN id SET DEFAULT nextval('public.studios_id_seq'::regclass);


--
-- TOC entry 2934 (class 2604 OID 17847)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 2939 (class 2606 OID 17794)
-- Name: directors directors_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_name_key UNIQUE (name);


--
-- TOC entry 2941 (class 2606 OID 17792)
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- TOC entry 2955 (class 2606 OID 17841)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- TOC entry 2963 (class 2606 OID 17881)
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- TOC entry 2961 (class 2606 OID 17865)
-- Name: performers performers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_pkey PRIMARY KEY (id);


--
-- TOC entry 2947 (class 2606 OID 17815)
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- TOC entry 2949 (class 2606 OID 17817)
-- Name: ratings ratings_rating_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_rating_key UNIQUE (rating);


--
-- TOC entry 2943 (class 2606 OID 17802)
-- Name: releasedates releasedates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.releasedates
    ADD CONSTRAINT releasedates_pkey PRIMARY KEY (id);


--
-- TOC entry 2945 (class 2606 OID 17804)
-- Name: releasedates releasedates_relesse_date_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.releasedates
    ADD CONSTRAINT releasedates_relesse_date_key UNIQUE (relesse_date);


--
-- TOC entry 2965 (class 2606 OID 17951)
-- Name: scenes scenes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT scenes_pkey PRIMARY KEY (id);


--
-- TOC entry 2951 (class 2606 OID 17828)
-- Name: studios studios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.studios
    ADD CONSTRAINT studios_pkey PRIMARY KEY (id);


--
-- TOC entry 2953 (class 2606 OID 17830)
-- Name: studios studios_studio_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.studios
    ADD CONSTRAINT studios_studio_key UNIQUE (studio);


--
-- TOC entry 2957 (class 2606 OID 17852)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2959 (class 2606 OID 17854)
-- Name: tags tags_tag_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_tag_key UNIQUE (tag);


--
-- TOC entry 2971 (class 2606 OID 17905)
-- Name: movie_cast_table movie_cast_table_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_cast_table
    ADD CONSTRAINT movie_cast_table_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- TOC entry 2972 (class 2606 OID 17910)
-- Name: movie_cast_table movie_cast_table_performer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_cast_table
    ADD CONSTRAINT movie_cast_table_performer_id_fkey FOREIGN KEY (performer_id) REFERENCES public.performers(id);


--
-- TOC entry 2976 (class 2606 OID 17936)
-- Name: movie_genres_table movie_genres_table_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_genres_table
    ADD CONSTRAINT movie_genres_table_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id);


--
-- TOC entry 2975 (class 2606 OID 17931)
-- Name: movie_genres_table movie_genres_table_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_genres_table
    ADD CONSTRAINT movie_genres_table_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- TOC entry 2973 (class 2606 OID 17918)
-- Name: movie_tags_table movie_tags_table_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_tags_table
    ADD CONSTRAINT movie_tags_table_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- TOC entry 2974 (class 2606 OID 17923)
-- Name: movie_tags_table movie_tags_table_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie_tags_table
    ADD CONSTRAINT movie_tags_table_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 2968 (class 2606 OID 17887)
-- Name: movies movies_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- TOC entry 2970 (class 2606 OID 17897)
-- Name: movies movies_rating_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_rating_id_fkey FOREIGN KEY (rating_id) REFERENCES public.ratings(id);


--
-- TOC entry 2969 (class 2606 OID 17892)
-- Name: movies movies_release_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_release_date_id_fkey FOREIGN KEY (release_date_id) REFERENCES public.releasedates(id);


--
-- TOC entry 2967 (class 2606 OID 17882)
-- Name: movies movies_studio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_studio_id_fkey FOREIGN KEY (studio_id) REFERENCES public.studios(id);


--
-- TOC entry 2966 (class 2606 OID 17866)
-- Name: performers performers_rating_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.performers
    ADD CONSTRAINT performers_rating_id_fkey FOREIGN KEY (rating_id) REFERENCES public.ratings(id);


--
-- TOC entry 2983 (class 2606 OID 17985)
-- Name: scene_cast_table scene_cast_table_performer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scene_cast_table
    ADD CONSTRAINT scene_cast_table_performer_id_fkey FOREIGN KEY (performer_id) REFERENCES public.performers(id);


--
-- TOC entry 2982 (class 2606 OID 17980)
-- Name: scene_cast_table scene_cast_table_scene_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scene_cast_table
    ADD CONSTRAINT scene_cast_table_scene_id_fkey FOREIGN KEY (scene_id) REFERENCES public.scenes(id);


--
-- TOC entry 2984 (class 2606 OID 17993)
-- Name: scene_tags_table scene_tags_table_scene_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scene_tags_table
    ADD CONSTRAINT scene_tags_table_scene_id_fkey FOREIGN KEY (scene_id) REFERENCES public.scenes(id);


--
-- TOC entry 2985 (class 2606 OID 17998)
-- Name: scene_tags_table scene_tags_table_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scene_tags_table
    ADD CONSTRAINT scene_tags_table_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- TOC entry 2978 (class 2606 OID 17957)
-- Name: scenes scenes_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT scenes_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- TOC entry 2981 (class 2606 OID 17972)
-- Name: scenes scenes_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT scenes_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id);


--
-- TOC entry 2980 (class 2606 OID 17967)
-- Name: scenes scenes_rating_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT scenes_rating_id_fkey FOREIGN KEY (rating_id) REFERENCES public.ratings(id);


--
-- TOC entry 2979 (class 2606 OID 17962)
-- Name: scenes scenes_release_date_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT scenes_release_date_id_fkey FOREIGN KEY (release_date_id) REFERENCES public.releasedates(id);


--
-- TOC entry 2977 (class 2606 OID 17952)
-- Name: scenes scenes_studio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scenes
    ADD CONSTRAINT scenes_studio_id_fkey FOREIGN KEY (studio_id) REFERENCES public.studios(id);


-- Completed on 2021-01-31 13:51:00

--
-- PostgreSQL database dump complete
--

