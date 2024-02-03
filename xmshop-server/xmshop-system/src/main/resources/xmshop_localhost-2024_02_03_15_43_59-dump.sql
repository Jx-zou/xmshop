--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: t_category; Type: TABLE; Schema: public; Owner: xmshop
--

CREATE TABLE public.t_category (
    id character varying(18) NOT NULL,
    is_best smallint,
    pic character varying(256),
    pid character varying(18),
    product_id character varying(64),
    sort smallint,
    status smallint NOT NULL,
    title character varying(64) NOT NULL
);


ALTER TABLE public.t_category OWNER TO xmshop;

--
-- Name: t_focus; Type: TABLE; Schema: public; Owner: xmshop
--

CREATE TABLE public.t_focus (
    id character varying(18) NOT NULL,
    pic character varying(256),
    "position" integer,
    status smallint NOT NULL,
    title character varying(128) NOT NULL,
    url character varying(256)
);


ALTER TABLE public.t_focus OWNER TO xmshop;

--
-- Name: t_product; Type: TABLE; Schema: public; Owner: xmshop
--

CREATE TABLE public.t_product (
    id character varying(18) NOT NULL,
    cid character varying(18) NOT NULL,
    pic character varying(256),
    price numeric(38,2) NOT NULL,
    s_pic character varying(256),
    sub_title character varying(128),
    title character varying(64) NOT NULL
);


ALTER TABLE public.t_product OWNER TO xmshop;

--
-- Name: t_product_attr; Type: TABLE; Schema: public; Owner: xmshop
--

CREATE TABLE public.t_product_attr (
    id character varying(18) NOT NULL,
    cate character varying(128) NOT NULL,
    list character varying(255)
);


ALTER TABLE public.t_product_attr OWNER TO xmshop;

--
-- Name: t_product_details; Type: TABLE; Schema: public; Owner: xmshop
--

CREATE TABLE public.t_product_details (
    id character varying(18) NOT NULL,
    attrs character varying(255),
    cid character varying(18) NOT NULL,
    cname character varying(64),
    content character varying(2048),
    is_best smallint,
    is_hot smallint,
    is_new smallint,
    old_price numeric(38,2) NOT NULL,
    pic character varying(256),
    price numeric(38,2) NOT NULL,
    specs character varying(2048),
    status smallint,
    sub_title character varying(128),
    title character varying(64) NOT NULL
);


ALTER TABLE public.t_product_details OWNER TO xmshop;

--
-- Data for Name: t_category; Type: TABLE DATA; Schema: public; Owner: xmshop
--

COPY public.t_category (id, is_best, pic, pid, product_id, sort, status, title) FROM stdin;
\.


--
-- Data for Name: t_focus; Type: TABLE DATA; Schema: public; Owner: xmshop
--

COPY public.t_focus (id, pic, "position", status, title, url) FROM stdin;
3251235360690176	0ef3268de51326ccabacab67b0593582.jpg	0	1	Redmi Note 13新春版	0
3251235771731968	1e125f7e065bb9d7bc36b480a4437820.webp	1	1	Redmi Watch4	1
3251235792703488	2e8f6ccc6a942648252e4f53131c2a01.webp	2	1	小米路由器 be3600	2
3251235805286400	72d2f359aa032bc5f6372b3022b39a92.webp	3	1	Redmi Buds 5 Pro	3
3251235826257920	b20d1741dd92cb32b387023ae6244838.webp	4	1	米家保温杯 Ti 2	4
\.


--
-- Data for Name: t_product; Type: TABLE DATA; Schema: public; Owner: xmshop
--

COPY public.t_product (id, cid, pic, price, s_pic, sub_title, title) FROM stdin;
\.


--
-- Data for Name: t_product_attr; Type: TABLE DATA; Schema: public; Owner: xmshop
--

COPY public.t_product_attr (id, cate, list) FROM stdin;
\.


--
-- Data for Name: t_product_details; Type: TABLE DATA; Schema: public; Owner: xmshop
--

COPY public.t_product_details (id, attrs, cid, cname, content, is_best, is_hot, is_new, old_price, pic, price, specs, status, sub_title, title) FROM stdin;
\.


--
-- Name: t_category t_category_pkey; Type: CONSTRAINT; Schema: public; Owner: xmshop
--

ALTER TABLE ONLY public.t_category
    ADD CONSTRAINT t_category_pkey PRIMARY KEY (id);


--
-- Name: t_focus t_focus_pkey; Type: CONSTRAINT; Schema: public; Owner: xmshop
--

ALTER TABLE ONLY public.t_focus
    ADD CONSTRAINT t_focus_pkey PRIMARY KEY (id);


--
-- Name: t_product_attr t_product_attr_pkey; Type: CONSTRAINT; Schema: public; Owner: xmshop
--

ALTER TABLE ONLY public.t_product_attr
    ADD CONSTRAINT t_product_attr_pkey PRIMARY KEY (id);


--
-- Name: t_product_details t_product_details_pkey; Type: CONSTRAINT; Schema: public; Owner: xmshop
--

ALTER TABLE ONLY public.t_product_details
    ADD CONSTRAINT t_product_details_pkey PRIMARY KEY (id);


--
-- Name: t_product t_product_pkey; Type: CONSTRAINT; Schema: public; Owner: xmshop
--

ALTER TABLE ONLY public.t_product
    ADD CONSTRAINT t_product_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

