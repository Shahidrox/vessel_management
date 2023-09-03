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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: vessel_trackings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vessel_trackings (
    id bigint NOT NULL,
    vessel_id bigint NOT NULL,
    next_port character varying,
    eta character varying,
    speed character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: vessel_trackings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vessel_trackings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vessel_trackings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vessel_trackings_id_seq OWNED BY public.vessel_trackings.id;


--
-- Name: vessels; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vessels (
    id bigint NOT NULL,
    name character varying(100),
    owner_id character varying(30),
    naccs_code character varying(30) NOT NULL,
    start_location character varying(200),
    destination character varying(200),
    ship_type integer DEFAULT 0,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: vessels_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vessels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vessels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vessels_id_seq OWNED BY public.vessels.id;


--
-- Name: vessel_trackings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vessel_trackings ALTER COLUMN id SET DEFAULT nextval('public.vessel_trackings_id_seq'::regclass);


--
-- Name: vessels id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vessels ALTER COLUMN id SET DEFAULT nextval('public.vessels_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: vessel_trackings vessel_trackings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vessel_trackings
    ADD CONSTRAINT vessel_trackings_pkey PRIMARY KEY (id);


--
-- Name: vessels vessels_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vessels
    ADD CONSTRAINT vessels_pkey PRIMARY KEY (id);


--
-- Name: index_vessel_trackings_on_vessel_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vessel_trackings_on_vessel_id ON public.vessel_trackings USING btree (vessel_id);


--
-- Name: index_vessels_on_naccs_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_vessels_on_naccs_code ON public.vessels USING btree (naccs_code);


--
-- Name: vessel_trackings fk_rails_a73d82b9b5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vessel_trackings
    ADD CONSTRAINT fk_rails_a73d82b9b5 FOREIGN KEY (vessel_id) REFERENCES public.vessels(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20230902055434'),
('20230902062447');


