--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: billing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing (
    billing_id integer NOT NULL,
    billing_amount double precision,
    billing_status character varying(255),
    tax integer,
    date_time timestamp without time zone,
    total_amount double precision
);


ALTER TABLE public.billing OWNER TO postgres;

--
-- Name: billing_billing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.billing_billing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_billing_id_seq OWNER TO postgres;

--
-- Name: billing_billing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billing_billing_id_seq OWNED BY public.billing.billing_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    employee_name character varying(255),
    employee_email character varying(255),
    gender character varying(255),
    employee_phone bigint,
    employee_address character varying(255),
    employee_role integer,
    pin integer,
    delete_status integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO postgres;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: floor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.floor (
    floor_id integer NOT NULL,
    floor_name character varying(255)
);


ALTER TABLE public.floor OWNER TO postgres;

--
-- Name: floor_floor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.floor_floor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.floor_floor_id_seq OWNER TO postgres;

--
-- Name: floor_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.floor_floor_id_seq OWNED BY public.floor.floor_id;


--
-- Name: item_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_category (
    category_id integer NOT NULL,
    category_name character varying(255),
    t_id integer,
    delete_status integer
);


ALTER TABLE public.item_category OWNER TO postgres;

--
-- Name: item_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_category_category_id_seq OWNER TO postgres;

--
-- Name: item_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_category_category_id_seq OWNED BY public.item_category.category_id;


--
-- Name: item_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_type (
    type_id integer NOT NULL,
    type_name character varying(255)
);


ALTER TABLE public.item_type OWNER TO postgres;

--
-- Name: item_type_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.item_type_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_type_type_id_seq OWNER TO postgres;

--
-- Name: item_type_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.item_type_type_id_seq OWNED BY public.item_type.type_id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    item_id integer NOT NULL,
    item_name character varying(255),
    item_desc character varying(255),
    item_status character varying(255),
    c_id integer,
    image character varying(255),
    delete_status integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- Name: items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_item_id_seq OWNER TO postgres;

--
-- Name: items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_item_id_seq OWNED BY public.items.item_id;


--
-- Name: itemsub_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemsub_category (
    sub_catid integer NOT NULL,
    sub_catname character varying(200),
    cat_id integer,
    delete_status integer
);


ALTER TABLE public.itemsub_category OWNER TO postgres;

--
-- Name: itemsub_category_sub_catid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.itemsub_category_sub_catid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.itemsub_category_sub_catid_seq OWNER TO postgres;

--
-- Name: itemsub_category_sub_catid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itemsub_category_sub_catid_seq OWNED BY public.itemsub_category.sub_catid;


--
-- Name: kot_itemlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kot_itemlist (
    kotitem_id integer NOT NULL,
    it_id integer,
    quantity integer,
    price double precision,
    kot_id integer,
    item_status character varying(200)
);


ALTER TABLE public.kot_itemlist OWNER TO postgres;

--
-- Name: kot_itemlist_kotitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kot_itemlist_kotitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kot_itemlist_kotitem_id_seq OWNER TO postgres;

--
-- Name: kot_itemlist_kotitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kot_itemlist_kotitem_id_seq OWNED BY public.kot_itemlist.kotitem_id;


--
-- Name: kot_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kot_order (
    kot_id integer NOT NULL,
    order_id integer,
    order_to character varying(200),
    order_from character varying(200)
);


ALTER TABLE public.kot_order OWNER TO postgres;

--
-- Name: kot_order_kot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kot_order_kot_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kot_order_kot_id_seq OWNER TO postgres;

--
-- Name: kot_order_kot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kot_order_kot_id_seq OWNED BY public.kot_order.kot_id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    menu_id integer NOT NULL,
    itt_id integer,
    breakfast integer,
    lunch integer,
    brunch integer,
    supper integer,
    dinner integer
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_menu_id_seq OWNER TO postgres;

--
-- Name: menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_menu_id_seq OWNED BY public.menu.menu_id;


--
-- Name: order_kot; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_kot (
    order_id integer NOT NULL,
    bill_id integer,
    tab_id integer,
    date_time timestamp without time zone,
    order_status character varying(255),
    status character varying(255),
    e_id integer
);


ALTER TABLE public.order_kot OWNER TO postgres;

--
-- Name: order_kot_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_kot_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_kot_order_id_seq OWNER TO postgres;

--
-- Name: order_kot_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_kot_order_id_seq OWNED BY public.order_kot.order_id;


--
-- Name: prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prices (
    price_id integer NOT NULL,
    price double precision,
    date_time timestamp without time zone,
    i_id integer
);


ALTER TABLE public.prices OWNER TO postgres;

--
-- Name: prices_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prices_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prices_price_id_seq OWNER TO postgres;

--
-- Name: prices_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prices_price_id_seq OWNED BY public.prices.price_id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying(255)
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_role_id_seq OWNER TO postgres;

--
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    table_id integer NOT NULL,
    table_status character varying(255),
    table_number integer,
    emp_id integer,
    capacity integer,
    f_id integer,
    delete_status integer
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- Name: tables_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tables_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_table_id_seq OWNER TO postgres;

--
-- Name: tables_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tables_table_id_seq OWNED BY public.tables.table_id;


--
-- Name: tax; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax (
    tax_id integer NOT NULL,
    tax character varying
);


ALTER TABLE public.tax OWNER TO postgres;

--
-- Name: tax_tax_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_tax_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tax_tax_id_seq OWNER TO postgres;

--
-- Name: tax_tax_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_tax_id_seq OWNED BY public.tax.tax_id;


--
-- Name: billing_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing ALTER COLUMN billing_id SET DEFAULT nextval('public.billing_billing_id_seq'::regclass);


--
-- Name: employee_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: floor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor ALTER COLUMN floor_id SET DEFAULT nextval('public.floor_floor_id_seq'::regclass);


--
-- Name: category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_category ALTER COLUMN category_id SET DEFAULT nextval('public.item_category_category_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_type ALTER COLUMN type_id SET DEFAULT nextval('public.item_type_type_id_seq'::regclass);


--
-- Name: item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN item_id SET DEFAULT nextval('public.items_item_id_seq'::regclass);


--
-- Name: sub_catid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemsub_category ALTER COLUMN sub_catid SET DEFAULT nextval('public.itemsub_category_sub_catid_seq'::regclass);


--
-- Name: kotitem_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_itemlist ALTER COLUMN kotitem_id SET DEFAULT nextval('public.kot_itemlist_kotitem_id_seq'::regclass);


--
-- Name: kot_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_order ALTER COLUMN kot_id SET DEFAULT nextval('public.kot_order_kot_id_seq'::regclass);


--
-- Name: menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN menu_id SET DEFAULT nextval('public.menu_menu_id_seq'::regclass);


--
-- Name: order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot ALTER COLUMN order_id SET DEFAULT nextval('public.order_kot_order_id_seq'::regclass);


--
-- Name: price_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices ALTER COLUMN price_id SET DEFAULT nextval('public.prices_price_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- Name: table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables ALTER COLUMN table_id SET DEFAULT nextval('public.tables_table_id_seq'::regclass);


--
-- Name: tax_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax ALTER COLUMN tax_id SET DEFAULT nextval('public.tax_tax_id_seq'::regclass);


--
-- Data for Name: billing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing (billing_id, billing_amount, billing_status, tax, date_time, total_amount) FROM stdin;
\.


--
-- Name: billing_billing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billing_billing_id_seq', 14, true);


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, employee_name, employee_email, gender, employee_phone, employee_address, employee_role, pin, delete_status) FROM stdin;
7	takeaway	takeaway@gmail.com	male	5647896321	mangalore	2	1117	0
9	pavan	pavan@gmail.com	male	8796541230	mangalore	1	2142	1
8	kiran	kiran@gmail.com	male	9876543210	mangalore	1	7697	1
12	denzil	denzil@gmail.com	male	5746321540	mangalore	1	2001	0
\.


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 12, true);


--
-- Data for Name: floor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.floor (floor_id, floor_name) FROM stdin;
1	Ground-floor
2	1st-floor
\.


--
-- Name: floor_floor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.floor_floor_id_seq', 2, true);


--
-- Data for Name: item_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_category (category_id, category_name, t_id, delete_status) FROM stdin;
60	International-cuisine	9	0
35	shorteat	9	0
40	soups	10	0
33	shorteat	10	1
56	desserts	9	1
34	soups	9	0
61	Thandai	9	0
\.


--
-- Name: item_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_category_category_id_seq', 61, true);


--
-- Data for Name: item_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_type (type_id, type_name) FROM stdin;
9	Veg
10	Nonveg
\.


--
-- Name: item_type_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.item_type_type_id_seq', 10, true);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (item_id, item_name, item_desc, item_status, c_id, image, delete_status) FROM stdin;
86	Chicken 65	It is a delicious chicken item	available	16	images	0
87	green salad	it is a special green salad	available	12	images	0
\.


--
-- Name: items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_item_id_seq', 87, true);


--
-- Data for Name: itemsub_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itemsub_category (sub_catid, sub_catname, cat_id, delete_status) FROM stdin;
13	vegetarian	34	0
15	15-minutes	35	0
22	Chinese-veg	60	0
16	20-minutes	33	1
14	non-vegetarian	40	1
12	5-minutes	35	0
23	milkshake	61	0
24	fresh fruit juice	61	0
\.


--
-- Name: itemsub_category_sub_catid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itemsub_category_sub_catid_seq', 24, true);


--
-- Data for Name: kot_itemlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kot_itemlist (kotitem_id, it_id, quantity, price, kot_id, item_status) FROM stdin;
\.


--
-- Name: kot_itemlist_kotitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kot_itemlist_kotitem_id_seq', 33, true);


--
-- Data for Name: kot_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kot_order (kot_id, order_id, order_to, order_from) FROM stdin;
\.


--
-- Name: kot_order_kot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kot_order_kot_id_seq', 11, true);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (menu_id, itt_id, breakfast, lunch, brunch, supper, dinner) FROM stdin;
\.


--
-- Name: menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_menu_id_seq', 1, false);


--
-- Data for Name: order_kot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_kot (order_id, bill_id, tab_id, date_time, order_status, status, e_id) FROM stdin;
\.


--
-- Name: order_kot_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_kot_order_id_seq', 9, true);


--
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prices (price_id, price, date_time, i_id) FROM stdin;
58	200	2018-11-10 10:56:52	86
59	80	2018-11-10 10:56:52	87
\.


--
-- Name: prices_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prices_price_id_seq', 59, true);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (role_id, role_name) FROM stdin;
1	admin
2	waiter
3	Chef
\.


--
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_role_id_seq', 3, true);


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (table_id, table_status, table_number, emp_id, capacity, f_id, delete_status) FROM stdin;
12	takeaway	45	7	4	1	0
18	Empty	1	8	6	1	0
20	Empty	1	8	4	2	1
19	Empty	2	9	6	1	1
21	Empty	2	9	4	2	0
22	Empty	3	9	4	1	1
25	Empty	4	9	6	2	0
23	Empty	3	8	6	2	0
26	Empty	5	8	6	1	0
24	Empty	4	9	6	1	1
\.


--
-- Name: tables_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tables_table_id_seq', 26, true);


--
-- Data for Name: tax; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax (tax_id, tax) FROM stdin;
1	5
2	7
\.


--
-- Name: tax_tax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_tax_id_seq', 2, true);


--
-- Name: billing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing
    ADD CONSTRAINT billing_pkey PRIMARY KEY (billing_id);


--
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: floor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.floor
    ADD CONSTRAINT floor_pkey PRIMARY KEY (floor_id);


--
-- Name: item_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_category
    ADD CONSTRAINT item_category_pkey PRIMARY KEY (category_id);


--
-- Name: item_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_type
    ADD CONSTRAINT item_type_pkey PRIMARY KEY (type_id);


--
-- Name: items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (item_id);


--
-- Name: itemsub_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemsub_category
    ADD CONSTRAINT itemsub_category_pkey PRIMARY KEY (sub_catid);


--
-- Name: kot_itemlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_itemlist
    ADD CONSTRAINT kot_itemlist_pkey PRIMARY KEY (kotitem_id);


--
-- Name: kot_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_order
    ADD CONSTRAINT kot_order_pkey PRIMARY KEY (kot_id);


--
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_id);


--
-- Name: order_kot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot
    ADD CONSTRAINT order_kot_pkey PRIMARY KEY (order_id);


--
-- Name: prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (price_id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- Name: tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);


--
-- Name: tax_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax
    ADD CONSTRAINT tax_pkey PRIMARY KEY (tax_id);


--
-- Name: employee_employee_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_employee_role_fkey FOREIGN KEY (employee_role) REFERENCES public.role(role_id);


--
-- Name: f_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT f_id FOREIGN KEY (f_id) REFERENCES public.floor(floor_id);


--
-- Name: item_category_t_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_category
    ADD CONSTRAINT item_category_t_id_fkey FOREIGN KEY (t_id) REFERENCES public.item_type(type_id);


--
-- Name: items_c_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_c_id_fkey FOREIGN KEY (c_id) REFERENCES public.itemsub_category(sub_catid);


--
-- Name: itemsub_category_cat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemsub_category
    ADD CONSTRAINT itemsub_category_cat_id_fkey FOREIGN KEY (cat_id) REFERENCES public.item_category(category_id);


--
-- Name: kot_itemlist_it_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_itemlist
    ADD CONSTRAINT kot_itemlist_it_id_fkey FOREIGN KEY (it_id) REFERENCES public.items(item_id);


--
-- Name: kot_itemlist_kot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_itemlist
    ADD CONSTRAINT kot_itemlist_kot_id_fkey FOREIGN KEY (kot_id) REFERENCES public.kot_order(kot_id);


--
-- Name: kot_order_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kot_order
    ADD CONSTRAINT kot_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_kot(order_id);


--
-- Name: menu_itt_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_itt_id_fkey FOREIGN KEY (itt_id) REFERENCES public.items(item_id);


--
-- Name: order_kot_bill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot
    ADD CONSTRAINT order_kot_bill_id_fkey FOREIGN KEY (bill_id) REFERENCES public.billing(billing_id);


--
-- Name: order_kot_e_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot
    ADD CONSTRAINT order_kot_e_id_fkey FOREIGN KEY (e_id) REFERENCES public.employee(employee_id);


--
-- Name: order_kot_tab_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_kot
    ADD CONSTRAINT order_kot_tab_id_fkey FOREIGN KEY (tab_id) REFERENCES public.tables(table_id);


--
-- Name: prices_i_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_i_id_fkey FOREIGN KEY (i_id) REFERENCES public.items(item_id) ON DELETE CASCADE;


--
-- Name: tables_emp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(employee_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

