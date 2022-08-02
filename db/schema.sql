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
-- Name: statusdog; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA statusdog;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authenticators; Type: TABLE; Schema: statusdog; Owner: -
--

CREATE TABLE statusdog.authenticators (
    id bigint NOT NULL,
    credential_id text NOT NULL,
    credential_public_key bytea NOT NULL,
    counter bigint NOT NULL,
    transports text[]
);


--
-- Name: authenticators_id_seq; Type: SEQUENCE; Schema: statusdog; Owner: -
--

CREATE SEQUENCE statusdog.authenticators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authenticators_id_seq; Type: SEQUENCE OWNED BY; Schema: statusdog; Owner: -
--

ALTER SEQUENCE statusdog.authenticators_id_seq OWNED BY statusdog.authenticators.id;


--
-- Name: pending_registrations; Type: TABLE; Schema: statusdog; Owner: -
--

CREATE TABLE statusdog.pending_registrations (
    email character varying(500) NOT NULL,
    challenge text
);


--
-- Name: schema_migrations; Type: TABLE; Schema: statusdog; Owner: -
--

CREATE TABLE statusdog.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: statusdog; Owner: -
--

CREATE TABLE statusdog.users (
    id bigint NOT NULL,
    email character varying(500) NOT NULL,
    current_challenge text
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: statusdog; Owner: -
--

CREATE SEQUENCE statusdog.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: statusdog; Owner: -
--

ALTER SEQUENCE statusdog.users_id_seq OWNED BY statusdog.users.id;


--
-- Name: authenticators id; Type: DEFAULT; Schema: statusdog; Owner: -
--

ALTER TABLE ONLY statusdog.authenticators ALTER COLUMN id SET DEFAULT nextval('statusdog.authenticators_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: statusdog; Owner: -
--

ALTER TABLE ONLY statusdog.users ALTER COLUMN id SET DEFAULT nextval('statusdog.users_id_seq'::regclass);


--
-- Name: authenticators authenticators_pkey; Type: CONSTRAINT; Schema: statusdog; Owner: -
--

ALTER TABLE ONLY statusdog.authenticators
    ADD CONSTRAINT authenticators_pkey PRIMARY KEY (id);


--
-- Name: pending_registrations pending_registrations_pkey; Type: CONSTRAINT; Schema: statusdog; Owner: -
--

ALTER TABLE ONLY statusdog.pending_registrations
    ADD CONSTRAINT pending_registrations_pkey PRIMARY KEY (email);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: statusdog; Owner: -
--

ALTER TABLE ONLY statusdog.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: statusdog; Owner: -
--

ALTER TABLE ONLY statusdog.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: credential_ids; Type: INDEX; Schema: statusdog; Owner: -
--

CREATE INDEX credential_ids ON statusdog.authenticators USING btree (credential_id);


--
-- PostgreSQL database dump complete
--


--
-- Dbmate schema migrations
--

INSERT INTO statusdog.schema_migrations (version) VALUES
    ('20220802130633'),
    ('20220802132023'),
    ('20220802132215'),
    ('20220802133239');
