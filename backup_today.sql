--
-- PostgreSQL database cluster dump
--

\connect postgres

SET default_transaction_read_only = off;

SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "LR";
ALTER ROLE "LR" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION;
CREATE ROLE jeffreyrichardson;
ALTER ROLE jeffreyrichardson WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION;
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION;






--
-- Database creation
--

CREATE DATABASE "LR_development" WITH TEMPLATE = template0 OWNER = postgres;
REVOKE ALL ON DATABASE "LR_development" FROM PUBLIC;
REVOKE ALL ON DATABASE "LR_development" FROM postgres;
GRANT ALL ON DATABASE "LR_development" TO postgres;
GRANT CONNECT,TEMPORARY ON DATABASE "LR_development" TO PUBLIC;
GRANT ALL ON DATABASE "LR_development" TO jeffreyrichardson;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM postgres;
GRANT ALL ON DATABASE template1 TO postgres;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect "LR_development"

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: activities; Type: TABLE; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    trackable_id integer,
    trackable_type character varying(255),
    owner_id integer,
    owner_type character varying(255),
    key character varying(255),
    parameters text,
    recipient_id integer,
    recipient_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.activities OWNER TO jeffreyrichardson;

--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffreyrichardson
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO jeffreyrichardson;

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffreyrichardson
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    content text,
    post_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.comments OWNER TO jeffreyrichardson;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffreyrichardson
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO jeffreyrichardson;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffreyrichardson
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE TABLE follows (
    id integer NOT NULL,
    follower_type character varying(255),
    follower_id integer,
    followable_type character varying(255),
    followable_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.follows OWNER TO jeffreyrichardson;

--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffreyrichardson
--

CREATE SEQUENCE follows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follows_id_seq OWNER TO jeffreyrichardson;

--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffreyrichardson
--

ALTER SEQUENCE follows_id_seq OWNED BY follows.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE TABLE likes (
    id integer NOT NULL,
    liker_type character varying(255),
    liker_id integer,
    likeable_type character varying(255),
    likeable_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.likes OWNER TO jeffreyrichardson;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffreyrichardson
--

CREATE SEQUENCE likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO jeffreyrichardson;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffreyrichardson
--

ALTER SEQUENCE likes_id_seq OWNED BY likes.id;


--
-- Name: mentions; Type: TABLE; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE TABLE mentions (
    id integer NOT NULL,
    mentioner_type character varying(255),
    mentioner_id integer,
    mentionable_type character varying(255),
    mentionable_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.mentions OWNER TO jeffreyrichardson;

--
-- Name: mentions_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffreyrichardson
--

CREATE SEQUENCE mentions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mentions_id_seq OWNER TO jeffreyrichardson;

--
-- Name: mentions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffreyrichardson
--

ALTER SEQUENCE mentions_id_seq OWNED BY mentions.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    user_id integer,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


ALTER TABLE public.posts OWNER TO jeffreyrichardson;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffreyrichardson
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO jeffreyrichardson;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffreyrichardson
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO jeffreyrichardson;

--
-- Name: users; Type: TABLE; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying(255),
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO jeffreyrichardson;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jeffreyrichardson
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO jeffreyrichardson;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jeffreyrichardson
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeffreyrichardson
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeffreyrichardson
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeffreyrichardson
--

ALTER TABLE ONLY follows ALTER COLUMN id SET DEFAULT nextval('follows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeffreyrichardson
--

ALTER TABLE ONLY likes ALTER COLUMN id SET DEFAULT nextval('likes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeffreyrichardson
--

ALTER TABLE ONLY mentions ALTER COLUMN id SET DEFAULT nextval('mentions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeffreyrichardson
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jeffreyrichardson
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: jeffreyrichardson
--

COPY activities (id, trackable_id, trackable_type, owner_id, owner_type, key, parameters, recipient_id, recipient_type, created_at, updated_at) FROM stdin;
\.


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffreyrichardson
--

SELECT pg_catalog.setval('activities_id_seq', 1, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: jeffreyrichardson
--

COPY comments (id, content, post_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffreyrichardson
--

SELECT pg_catalog.setval('comments_id_seq', 1, false);


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: jeffreyrichardson
--

COPY follows (id, follower_type, follower_id, followable_type, followable_id, created_at) FROM stdin;
\.


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffreyrichardson
--

SELECT pg_catalog.setval('follows_id_seq', 1, false);


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: jeffreyrichardson
--

COPY likes (id, liker_type, liker_id, likeable_type, likeable_id, created_at) FROM stdin;
\.


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffreyrichardson
--

SELECT pg_catalog.setval('likes_id_seq', 1, false);


--
-- Data for Name: mentions; Type: TABLE DATA; Schema: public; Owner: jeffreyrichardson
--

COPY mentions (id, mentioner_type, mentioner_id, mentionable_type, mentionable_id, created_at) FROM stdin;
\.


--
-- Name: mentions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffreyrichardson
--

SELECT pg_catalog.setval('mentions_id_seq', 1, false);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: jeffreyrichardson
--

COPY posts (id, user_id, content, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffreyrichardson
--

SELECT pg_catalog.setval('posts_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jeffreyrichardson
--

COPY schema_migrations (version) FROM stdin;
20141114020538
20141114021943
20141114021944
20141114021946
20141114023032
20141114024131
20141114030114
20141114030132
20141114032136
20141124055149
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jeffreyrichardson
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jeffreyrichardson
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: follows_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

ALTER TABLE ONLY follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: likes_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: mentions_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

ALTER TABLE ONLY mentions
    ADD CONSTRAINT mentions_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fk_followables; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX fk_followables ON follows USING btree (followable_id, followable_type);


--
-- Name: fk_follows; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX fk_follows ON follows USING btree (follower_id, follower_type);


--
-- Name: fk_likeables; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX fk_likeables ON likes USING btree (likeable_id, likeable_type);


--
-- Name: fk_likes; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX fk_likes ON likes USING btree (liker_id, liker_type);


--
-- Name: fk_mentionables; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX fk_mentionables ON mentions USING btree (mentionable_id, mentionable_type);


--
-- Name: fk_mentions; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX fk_mentions ON mentions USING btree (mentioner_id, mentioner_type);


--
-- Name: index_activities_on_owner_id_and_owner_type; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX index_activities_on_owner_id_and_owner_type ON activities USING btree (owner_id, owner_type);


--
-- Name: index_activities_on_recipient_id_and_recipient_type; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX index_activities_on_recipient_id_and_recipient_type ON activities USING btree (recipient_id, recipient_type);


--
-- Name: index_activities_on_trackable_id_and_trackable_type; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX index_activities_on_trackable_id_and_trackable_type ON activities USING btree (trackable_id, trackable_type);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX index_comments_on_post_id ON comments USING btree (post_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: jeffreyrichardson; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

