--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Ubuntu 12.2-4)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-4)

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
-- Name: almacen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.almacen (
    id integer NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.almacen OWNER TO postgres;

--
-- Name: almacen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.almacen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.almacen_id_seq OWNER TO postgres;

--
-- Name: almacen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.almacen_id_seq OWNED BY public.almacen.id;


--
-- Name: auth_assignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_assignment (
    item_name character varying(64) NOT NULL,
    user_id character varying(64) NOT NULL,
    created_at integer
);


ALTER TABLE public.auth_assignment OWNER TO postgres;

--
-- Name: auth_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_item (
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    description text,
    rule_name character varying(64),
    data bytea,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_item OWNER TO postgres;

--
-- Name: auth_item_child; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_item_child (
    parent character varying(64) NOT NULL,
    child character varying(64) NOT NULL
);


ALTER TABLE public.auth_item_child OWNER TO postgres;

--
-- Name: auth_rule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_rule (
    name character varying(64) NOT NULL,
    data bytea,
    created_at integer,
    updated_at integer
);


ALTER TABLE public.auth_rule OWNER TO postgres;

--
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO postgres;

--
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- Name: marca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.marca_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marca_id_seq OWNER TO postgres;

--
-- Name: marca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.marca_id_seq OWNED BY public.marca.id;


--
-- Name: migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration (
    version character varying(180) NOT NULL,
    apply_time integer
);


ALTER TABLE public.migration OWNER TO postgres;

--
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id integer NOT NULL,
    nombre character varying NOT NULL,
    descripcion character varying,
    precio numeric(12,2) NOT NULL,
    stock integer NOT NULL,
    fecha_creacion timestamp without time zone NOT NULL,
    fecha_actualizacion timestamp without time zone,
    marca_id integer NOT NULL,
    seccion_id integer NOT NULL
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- Name: producto_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto_categoria (
    id integer NOT NULL,
    producto_id integer NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE public.producto_categoria OWNER TO postgres;

--
-- Name: producto_categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_categoria_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_categoria_id_seq OWNER TO postgres;

--
-- Name: producto_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_categoria_id_seq OWNED BY public.producto_categoria.id;


--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_id_seq OWNER TO postgres;

--
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_id_seq OWNED BY public.producto.id;


--
-- Name: seccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seccion (
    id integer NOT NULL,
    codigo character varying(10) NOT NULL,
    descripcion character varying(255) NOT NULL,
    almacen_id integer NOT NULL
);


ALTER TABLE public.seccion OWNER TO postgres;

--
-- Name: seccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seccion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seccion_id_seq OWNER TO postgres;

--
-- Name: seccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seccion_id_seq OWNED BY public.seccion.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombres character varying NOT NULL,
    username character varying NOT NULL,
    password character varying,
    password_hash character varying NOT NULL,
    access_token character varying NOT NULL,
    auth_key character varying
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: almacen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacen ALTER COLUMN id SET DEFAULT nextval('public.almacen_id_seq'::regclass);


--
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- Name: marca id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca ALTER COLUMN id SET DEFAULT nextval('public.marca_id_seq'::regclass);


--
-- Name: producto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN id SET DEFAULT nextval('public.producto_id_seq'::regclass);


--
-- Name: producto_categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_categoria ALTER COLUMN id SET DEFAULT nextval('public.producto_categoria_id_seq'::regclass);


--
-- Name: seccion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seccion ALTER COLUMN id SET DEFAULT nextval('public.seccion_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.almacen (id, codigo, descripcion) FROM stdin;
1	ALM N	Almacen Principal
2	ALM NE	Almcaen Noreste
3	ALM O	Almacen Oeste
4	ALM S	Almacen Sur
5	ALM SE	Almacen Sureste
7	ALM E	Almacen este
\.


--
-- Data for Name: auth_assignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_assignment (item_name, user_id, created_at) FROM stdin;
Administrador	1	1676300223
Espectador	11	1676300987
\.


--
-- Data for Name: auth_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_item (name, type, description, rule_name, data, created_at, updated_at) FROM stdin;
Administrador	1	\N	\N	\N	\N	\N
crearProductos	2	\N	\N	\N	\N	\N
crearUsuarios	2	\N	\N	\N	\N	\N
actualizarProducto	2	\N	\N	\N	1676299793	1676299793
Espectador	1	\N	\N	\N	1676299586	1676299586
\.


--
-- Data for Name: auth_item_child; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_item_child (parent, child) FROM stdin;
\.


--
-- Data for Name: auth_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_rule (name, data, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nombre, descripcion) FROM stdin;
5	Eggs, Meat & Fish	\N
7	Cleaning & Household	\N
2	Fruits & Vegetables	\N
6	Gourmet & World Food	\N
9	Bakery, Cakes & Dairy	\N
4	Kitchen, Garden & Pets	\N
11	Beverages	\N
8	Beauty & Hygiene	\N
1	Baby Care	\N
10	Foodgrains, Oil & Masala	\N
3	Snacks & Branded Foods	\N
88	Frozen Veggies & Snacks	\N
41	Biscuits & Cookies	\N
53	Storage & Accessories	\N
50	Detergents & Dishwash	\N
40	Health & Medicine	\N
52	Organic Fruits & Vegetables	\N
39	Pickles & Chutney	\N
21	Flask & Casserole	\N
66	Dry Fruits	\N
82	Drinks & Beverages	\N
58	Feeding & Nursing	\N
84	Fresh Fruits	\N
97	Pasta, Soup & Noodles	\N
64	Dals & Pulses	\N
25	Dairy	\N
63	Coffee	\N
67	Fresh Vegetables	\N
80	Baby Bath & Hygiene	\N
48	Sauces, Spreads & Dips	\N
89	Chocolates & Candies	\N
28	Pooja Needs	\N
36	Cooking & Baking Needs	\N
90	Bins & Bathroom Ware	\N
59	Tea	\N
71	Mops, Brushes & Scrubs	\N
74	All Purpose Cleaners	\N
60	Snacks, Dry Fruits, Nuts	\N
12	Dairy & Cheese	\N
54	Organic Staples	\N
85	Edible Oils & Ghee	\N
27	Sausages, Bacon & Salami	\N
31	Baby Food & Formula	\N
17	Cereals & Breakfast	\N
57	Feminine Hygiene	\N
16	Atta, Flours & Sooji	\N
45	Snacks & Namkeen	\N
79	Gardening	\N
30	Baby Accessories	\N
72	Rice & Rice Products	\N
51	Fragrances & Deos	\N
76	Bakeware	\N
34	Stationery	\N
92	Cookies, Rusk & Khari	\N
96	Mutton & Lamb	\N
77	Energy & Soft Drinks	\N
15	Hair Care	\N
62	Makeup	\N
22	Steel Utensils	\N
99	Oils & Vinegar	\N
91	Eggs	\N
55	Herbs & Seasonings	\N
98	Men's Grooming	\N
35	Crockery & Cutlery	\N
49	Noodle, Pasta, Vermicelli	\N
37	Bath & Hand Wash	\N
43	Ready To Cook & Eat	\N
100	Cuts & Sprouts	\N
18	Car & Shoe Care	\N
19	Tinned & Processed Food	\N
75	Cakes & Pastries	\N
29	Salt, Sugar & Jaggery	\N
44	Health Drink, Supplement	\N
86	Masalas & Spices	\N
24	Spreads, Sauces, Ketchup	\N
65	Chocolates & Biscuits	\N
13	Cookware & Non Stick	\N
32	Fish & Seafood	\N
33	Kitchen Accessories	\N
38	Exotic Fruits & Veggies	\N
94	Breads & Buns	\N
78	Disposables, Garbage Bag	\N
81	Appliances & Electricals	\N
83	Indian Mithai	\N
46	Diapers & Wipes	\N
23	Fruit Juices & Drinks	\N
56	Gourmet Breads	\N
68	Oral Care	\N
42	Pet Food & Accessories	\N
20	Breakfast Cereals	\N
93	Fresheners & Repellents	\N
101	Non Dairy	\N
14	Party & Festive Needs	\N
26	Skin Care	\N
\.


--
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marca (id, nombre, descripcion) FROM stdin;
1475	Iyengar Spices & Food Specialists 	\N
1186	Dabur	\N
293	Swa Artisanal Syrups	\N
1994	FNS	\N
561	BHealthy	\N
1533	Akshayakalpa	\N
1019	Earthon	\N
712	Jus Amazin	\N
975	Toyo Kombucha	\N
1102	Organic Harvest	\N
2272	Aashirvaad	\N
1111	Sofit 	\N
970	Annapoorna	\N
1889	Fit & Flex	\N
2094	Joy	\N
2126	Born Good	\N
1605	Classmate	\N
1099	Mantra	\N
2151	Aloe Veda	\N
2062	Medimix	\N
844	Rostaa	\N
2152	Aaha Oho	\N
659	Asian	\N
232	Skin Cottage 	\N
1504	Wild Stone	\N
1990	Daucy	\N
2055	Gebi 	\N
2238	DP	\N
940	LOreal Professionnel	\N
2301	Dairy Craft	\N
2183	Chymey	\N
2288	HAZEL	\N
2231	Malabar Coast	\N
1250	Kuxuna	\N
2105	Samvruddhi	\N
378	Sprite	\N
1169	Spice Story	\N
331	Casasunco	\N
131	Listerine	\N
2243	Ezy Be	\N
449	Switz	\N
673	Upakarma	\N
616	Good knight	\N
942	Satinance	\N
1916	T BASE	\N
91	The Face Shop	\N
69	Hm International	\N
1776	MVS	\N
402	Lyra	\N
422	Hersheys 	\N
324	The Moms Co	\N
1826	Gillette	\N
848	BIOTIQUE	\N
1893	SSS	\N
1171	Signoraware	\N
33	Colour Me	\N
2114	Baidyanath	\N
1105	Moov	\N
1603	Paseo	\N
1080	PureCult	\N
484	Command	\N
2019	Tata Tea	\N
689	Vedapure	\N
224	Godrej No.1	\N
865	Prozo Plus	\N
674	Badshah	\N
1507	Farm Connect	\N
1097	La Espanola	\N
2150	Dimples	\N
2106	Fruitoria	\N
741	Cafe Junyali	\N
1753	ST. D'VENCE	\N
1794	Nirlon	\N
803	Bixa Botanical	\N
1316	The Baker's Dozen	\N
1733	Ajmal	\N
760	Haagen-Dazs	\N
1053	Estee Lauder	\N
197	Abbies	\N
1158	Embark	\N
221	Soulflower	\N
1074	Hawkins	\N
1133	Maxi Persian	\N
877	Le Kaviraj	\N
1189	Hair4U	\N
1015	Kitchens Of India	\N
2283	Wc Net	\N
771	Cambridge Tea Party	\N
2221	Starbucks	\N
299	Nutrinorm	\N
304	Pekers	\N
617	Herbal Essence	\N
1384	Appitas	\N
1870	Grandma Singletons	\N
562	Pasabahce	\N
1093	Joyo Steel	\N
2177	50ap	\N
2006	Bobs Red Mill	\N
690	Godrej	\N
184	Lion	\N
2174	Odonil 	\N
1460	MyGlamm	\N
2163	Camlin	\N
1229	Zandu	\N
171	Hot Muggs	\N
245	Tasty Nibbles	\N
2088	She made	\N
1305	Sancha	\N
2119	Bronson Professional	\N
1471	Shahnaz Husain	\N
539	Lakme	\N
1044	Dukes	\N
52	Happy Jars	\N
849	Mysore Sandal	\N
763	MAGGI 	\N
2003	Quickee'S	\N
1925	Dove	\N
839	Glamveda	\N
650	Del Monte	\N
770	Gala	\N
1706	Iveo 	\N
205	Blue Dragon	\N
831	Liao	\N
1023	Yardley London	\N
1577	Nelson Honey	\N
1211	Trm	\N
1629	Fortune 	\N
901	Jiva Ayurveda	\N
2197	Habanero	\N
1544	Teamonk	\N
332	BIC Cello	\N
1499	Keya	\N
458	Meghdoot	\N
710	Garden	\N
2049	sumeru	\N
1361	Faultless	\N
2215	Britannia	\N
374	Bisk Farm	\N
510	Dhatu Organics & Naturals	\N
573	Cartini	\N
749	Laopala Diva	\N
926	Morpheme Remedies	\N
1000	MTR	\N
2030	Wild Ideas	\N
272	Cadbury	\N
1891	Runaway	\N
2257	Suvidha	\N
2196	Colleen	\N
1119	Clorox	\N
1732	Sprig Tea	\N
502	AGARO	\N
1786	BodyHerbals	\N
408	Kittos	\N
1304	The Whole Truth	\N
30	bb Popular	\N
1897	Fendo	\N
1531	GoodDiet	\N
1234	Octus	\N
1213	The Man Company	\N
1143	Anjali	\N
821	Figaro	\N
702	Dr Batra's 	\N
462	Wow Confetti	\N
1409	Gadre	\N
86	Yera	\N
296	Cambay Tiger	\N
1017	Bikaji	\N
249	Zebronics	\N
878	Townbus	\N
1289	Shareat	\N
580	FruitTreat	\N
1331	BB Home	\N
1138	Tetley	\N
2278	Haldirams 	\N
471	Fackelmann	\N
1929	Betty Crocker	\N
2245	Bombay Shaving Company	\N
1740	The Gourmet Jar	\N
688	Milton	\N
1055	Veet	\N
454	Lotus Herbals	\N
15	4700BC	\N
622	Excel Plus	\N
2009	Mirabelle	\N
655	PureFoods	\N
815	Tealia	\N
271	BORGES	\N
1194	Airific	\N
2309	Hugo Reitzel 	\N
1287	Mee Mee	\N
141	Engage	\N
2275	Patanjali	\N
1715	Prakrta	\N
1838	Oriental Botanics	\N
290	Kohinoor	\N
1380	Richfeel	\N
631	Schwarzkopf Professional	\N
1580	Dr Rhazes	\N
1932	Floroma	\N
486	Dr.Batra'S	\N
2017	Colgate	\N
548	Karma Kettle	\N
1896	Seven seas	\N
2107	Gillette Venus	\N
939	Sensodyne	\N
199	Jaguar	\N
264	DrNatcure	\N
592	Happilo	\N
634	Kapiva Ayurveda	\N
1125	Kiwi	\N
1416	Ponds	\N
2024	Schar	\N
1604	Paper Boat	\N
995	Te-A-Me	\N
1804	Steel Lock	\N
1180	Muniyal Ayurveda	\N
77	Classic Essentials	\N
460	ORGANIC INDIA	\N
1671	Fuschia	\N
518	Big Sams	\N
196	Sprig	\N
191	Turn Organic 	\N
1190	Harveys	\N
1011	Epiphany Snacks	\N
733	Hawkins Futura	\N
1813	Reliance Plast	\N
1014	Maharishi Ayurveda 	\N
1878	Layerr	\N
1756	Quick Dry	\N
1659	Man Arden	\N
88	Wagh Bakri	\N
73	Nirvana	\N
122	All Time	\N
660	Bionova	\N
693	Super Saver	\N
827	Clove	\N
2043	Atish 	\N
1032	Sanjay 	\N
1436	Shalimar	\N
671	Prestige	\N
1395	Remia	\N
56	Krosno - Europe	\N
146	Reliance	\N
1423	Happy Hens Farms	\N
2007	ACT II	\N
1427	Organicana	\N
1442	Priya	\N
1245	Heritage	\N
1513	Tai Hua	\N
799	KOKOLEKA	\N
2060	Bamboooz	\N
2018	Air wick	\N
1948	Pigeon	\N
213	Sunfeast	\N
764	Herbal Strategi	\N
1408	Premier	\N
1230	LetsShave	\N
51	Dentoshine  	\N
1036	JOYO	\N
67	Mambalam Iyers	\N
399	Future Organics	\N
2251	USTRAA	\N
1344	PRISTINE	\N
1568	Set Wet	\N
1722	Ritu	\N
1986	Nutty Yogi	\N
905	MOM Meal of the Moment	\N
1656	Bagrrys	\N
1378	Olay	\N
676	Cocon	\N
391	Top Ramen 	\N
2217	Khadi Natural	\N
832	Epigamia 	\N
2298	Manna 	\N
1402	Soulfit	\N
896	B Natural	\N
938	Chandrika 	\N
1721	Phalada Pure & Sure	\N
1667	Axe	\N
1833	Graminway	\N
404	Mastercook	\N
1979	Corsafe Advance	\N
1768	Saffola	\N
2206	6 Rasa	\N
1149	Maple Joe	\N
2046	Anmara	\N
677	Aachi	\N
1680	OGA	\N
624	Bechef	\N
2040	Skinn by Titan	\N
635	Koka	\N
2139	Craftel	\N
2220	On The Run	\N
38	D-Alive	\N
46	Delfi	\N
450	Nutribee	\N
303	Comfort	\N
181	Samyang	\N
1914	Jerhigh	\N
147	Fragata	\N
776	Whiskas	\N
1982	Mdh	\N
328	Typhoo	\N
1393	FabBox	\N
1546	Pigeon Baby	\N
1868	Timios	\N
2052	Pantai	\N
1575	Monin	\N
2193	Garnier	\N
1950	Gits	\N
1195	Ego of Paris	\N
633	Good Home	\N
474	Ariel 	\N
466	Valley Spice	\N
958	Pedigree	\N
1931	Dabur Meswak	\N
1515	Catch	\N
1435	Makino	\N
1107	Urban Platter	\N
2056	Scotch brite	\N
1420	24 Mantra	\N
1253	TGL Co.	\N
824	Kantan	\N
1730	Zoe	\N
1311	Milton - Spotzero	\N
315	Beeta	\N
175	Pepsodent	\N
2312	Park avenue	\N
1879	All Out	\N
584	Brylcreem	\N
1137	Habit	\N
417	NOCD	\N
1696	Pietro Coricelli	\N
1182	Olivia	\N
1201	ITC Master Chef	\N
2306	Samvuddhi & Co	\N
490	Prasukh	\N
911	True Elements	\N
2122	Early Foods	\N
263	MeraKisan	\N
467	Sln  	\N
511	Malkist	\N
2027	Fresho	\N
1563	Safal	\N
591	English Oven	\N
2269	Godrej Protekt	\N
1816	Maxkleen	\N
354	Soyfit	\N
1181	NUTRASHIL	\N
1035	Drools	\N
2034	PastificioG Di Martino	\N
12	Sri Sri Tattva	\N
1779	Doublemint	\N
846	Jacques Bogart	\N
585	Montanini	\N
319	Ifb	\N
1009	Colavita	\N
1476	bb Combo	\N
2204	Red Hunt	\N
2112	Supa Corn	\N
2198	Complan	\N
411	Green Leaf	\N
2314	Weikfield	\N
646	Oxy	\N
157	Natures Essence	\N
1492	ECO365	\N
383	Ambica	\N
663	Aloederm	\N
452	MISHT	\N
1051	TrueNature	\N
292	Enfamil A+	\N
262	Glade	\N
2180	Madhur	\N
1731	Vaadi	\N
745	Skore	\N
1221	Health Sutra	\N
1024	Parle	\N
217	York	\N
438	Jeva	\N
670	Himalaya Wellness	\N
468	Jergens	\N
1033	Brut	\N
997	Stonesoup	\N
1291	Twister	\N
1874	Aroma Treasures	\N
373	Frestol	\N
31	Slurrp Farm	\N
828	Chip Chops	\N
1814	Lomani	\N
1578	Wise Crack	\N
1772	Kaya Youth	\N
1297	Tedemei	\N
1927	Klassic	\N
1951	Unibic	\N
1508	KCL	\N
605	ALPENLIEBE	\N
1938	Aer	\N
400	As Chefs Cook	\N
1312	Tata Sampann	\N
1062	Orika	\N
2132	PIPO	\N
1390	RiteBite Max Protein	\N
1463	Real	\N
556	Idhayam	\N
1876	Dettol	\N
60	Old Spice	\N
1325	Kvg	\N
127	It's Skin	\N
1350	Tulips	\N
858	Peebuddy	\N
2089	Bio-Oil	\N
636	Nivea	\N
1943	Chizzpa	\N
1812	Daawat 	\N
1134	Nike	\N
35	Omega	\N
17	Tabac	\N
1462	TJORI	\N
1993	Origami	\N
984	On1y	\N
1479	Roxx	\N
1388	Blue Tokai 	\N
1528	Cornitos	\N
377	Gowardhan	\N
1066	Barilla	\N
344	SINWUAS	\N
1741	Delight Foods	\N
2008	Ramson	\N
2160	Huggies	\N
1061	Organic Tattva	\N
1308	Nature Protect	\N
515	All That Dips	\N
765	Liril	\N
1002	Kamasutra	\N
1589	INATUR 	\N
2199	Kennel kitchen 	\N
1256	Glenand	\N
1880	Ocean	\N
1255	Siang Pure	\N
1383	Sri Sri Ayurveda 	\N
868	NUTRIWISH	\N
682	YVES ROCHER	\N
1851	Loreal Paris	\N
369	Schwarzkopf	\N
1805	999	\N
21	A-1 Chips	\N
119	Raju's Cloth	\N
2026	Pears	\N
1969	Octavius	\N
1369	G.D 	\N
370	Eastern	\N
368	Nestle 	\N
456	HappyChef	\N
1199	Everyuth Naturals	\N
42	Aroma Magic 	\N
451	Dexolac	\N
850	Fabelle	\N
2014	Santoor	\N
269	Amul	\N
317	Kaya Clinic	\N
875	Vlcc	\N
423	Garnier Men	\N
1453	Health 1st	\N
1328	Namyaa	\N
1623	Seastar	\N
284	Lindberg	\N
1784	Himalayan Natives	\N
108	ENE	\N
823	Ah!rogya Bar	\N
1262	Safe Harvest	\N
1530	Marudhar	\N
1365	Geo-Fresh	\N
1488	Dhara 	\N
2102	Bajaj	\N
2156	Miaow Miaow	\N
1591	Doms	\N
1566	Milky Mist	\N
2127	Laplast	\N
661	Sangam Sweets	\N
1841	Oleiva Gold	\N
1594	Elovera	\N
2111	IRICH	\N
2289	SAPPHERO	\N
1018	B Vishal	\N
833	Sapphire	\N
316	Dorall Collection	\N
731	By Nature	\N
48	Veeba	\N
744	Pinnacle	\N
435	Nakoda	\N
1973	Fresho Signature	\N
275	Batter Box	\N
1609	Yoga bar	\N
1654	Kelloggs	\N
894	Vauva	\N
1086	United Colors Of Benetton 	\N
2078	Himalaya Baby	\N
796	Tasties	\N
859	Neem 	\N
654	StBotanica	\N
907	Closeup	\N
2281	bb Royal	\N
2228	IN2	\N
1579	Wipro	\N
872	Crompton	\N
1104	Nissin	\N
1971	Azafran	\N
71	Basso	\N
886	Nutriplate	\N
1148	Tabasco	\N
1762	Kaiv	\N
1470	Pampers 	\N
709	JIMMY'S COCKTAILS	\N
1351	Mother's Recipe	\N
1947	Pro Nature	\N
860	United	\N
2143	Murginns	\N
1226	K.P. Namboodiris	\N
974	Real Thai	\N
1998	Batchelors	\N
898	Johnson's baby	\N
966	Softouch	\N
1154	Sakurafresh	\N
949	Kerala Ayurveda	\N
1676	Nourish You	\N
1094	Weiman	\N
178	Tropicana	\N
345	Puramate	\N
662	Soft Touch	\N
723	Steelo	\N
1966	Ratan	\N
253	Grb	\N
558	American Garden 	\N
1820	Double Horse	\N
1720	Jovees	\N
16	Whisper 	\N
2224	Cello	\N
27	So Sweet	\N
44	Captain Zack	\N
629	Munchys	\N
1231	Vinod	\N
1985	NaturoBell	\N
1217	Jensons	\N
1184	Tong Garden	\N
492	Purix	\N
2097	Himalaya	\N
2241	Diabetics Dezire	\N
2157	Knorr	\N
162	Gupta Glass Ideas	\N
2252	Dabur Vatika	\N
1626	Lacto Calamine	\N
535	Too Yumm!	\N
1647	Princeware	\N
1340	Treo	\N
1	C&S Electric	\N
84	Dylon 	\N
95	Meatzza	\N
11	Toska Chocolates	\N
2066	La Carne	\N
210	Qraa Men	\N
1303	Smith & Jones	\N
1836	Pidilite	\N
808	Hello Tempayy	\N
\.


--
-- Data for Name: migration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration (version, apply_time) FROM stdin;
m000000_000000_base	1676033297
m140506_102106_rbac_init	1676033609
m170907_052038_rbac_add_index_on_auth_assignment_user_id	1676033609
m180523_151638_rbac_updates_indexes_without_prefix	1676033610
m200409_110543_rbac_update_mssql_trigger	1676033610
\.


--
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (id, nombre, descripcion, precio, stock, fecha_creacion, fecha_actualizacion, marca_id, seccion_id) FROM stdin;
35	Pet Solitaire Container Set - Silver	The Steelo plastic PET Container Set, is made of 100% food-grade PET plastic that helps you store, pulses, spices and more in a safe way. These containers are Bisphenol A (BPA) free, thus keeping you safe from health hazards. Therefore, these containers help you make a healthier lifestyle choice. The PET material makes the containers odour-free, so you donot have to worry about the spices and cereals smelling different. The airtight seal completely locks the container and conserves the nutritional value of the stored items.	499.00	31	2020-02-07 00:00:00	\N	723	34
81	Chips - Topica	Made with Topica	65.00	12	2021-08-11 00:00:00	\N	1032	28
273	Red Curry	Real Thai Red Curry with Vegetables is ready to cook meal packet. You just need to cook or microwave it and it can be served with Real Thai Jasmine Rice.\nBenefits \n1. Made with all-natural ingredients.\n2. Tasty and healthy, it's ready to eat product.	270.00	10	2021-03-04 00:00:00	\N	974	30
25	Veggieeeeee	Food Grade High Quality Plastic, Keep and store knife away from the reach of children. Multi use 2-in-1 Veg Cutter with Round Sharp steel blade along with slicer, Specially designed for cutting vegetables and fruits with locking system. Easy to use and wash	195.00	81	2020-12-10 00:00:00	2023-02-10 00:00:00	2111	10
27	Granola - Happy Berries	Fit & Flex granola is not just crunchy and tasty, it is also incredibly great for you. It is the perfect start to your every morning and packs quite a nutritious punch. Easy to chew, amazingly high on flavour and delightfully caramelised just right, is how we describe Fit & Flex granola.	245.00	52	2022-01-08 00:00:00	\N	1889	8
30	Lip Butter - Rose	Reload the dry and chapped lips with Organic Lip Butter Rose. The ideal mixture of organic butter and waxes instantly brightens your lips with red colour. Whenever you apply the colour it adds on to your charm with a rich creamy texture.	169.15	18	2018-10-04 00:00:00	\N	1102	37
31	Fruit Power - Masala Sugarcane	Sugarcane and Spicy Masala, a love story that has been part of every Indian home across generations. Real Masala Sugarcane is one of the 1st in India offering the benefits of your age-old sugarcane juice with a sprinkling of traditional Indian masala in the hygienic Tetra pack format. So relish every drop of our new Masala Sugarcane beverage that promises to refresh you with every gulp. Savour the natural sugarcane goodness brought to your home by Real.	19.00	54	2019-08-10 00:00:00	\N	1463	38
32	Chocobakes Choc Filled Cookies	Experience new exciting chocolatey centre filled cookie from Cadbury. Perfect as an indulgent "me time" treat or to relish happy moments with your loved ones and friends. Indulge in the taste of this amazing combination of delicious cookies that enrobe a smooth Chocolatey centre.	102.00	8	2021-01-09 00:00:00	\N	272	18
33	Amber - Deodorant Body Spray	Smellcome to Magic with Old Spice’s New Launch Deodorant range. 0% Gas and for long-lasting 24-hour freshness. A fruity fragrance with notes of blackberry, black raspberry, and plum, rounded out with sweet vanilla and amber notes at the base. Armed with Amber, flanked by the Old Spice eagles, you have the beacon to freely spread joy amongst your smellectorate.	211.65	88	2020-09-11 00:00:00	\N	60	36
34	Green Tea - Tulsi Loose Leaf	Octavius Tulsi Green Tea, is a unique combination where both the herbs help in refreshing and energizing the body and mind. It promotes metabolism which is vital for weight management. Green tea and Tulsi offer a vast array of remarkable health benefits including an abundance of antioxidants.	225.00	34	2021-09-11 00:00:00	\N	1969	19
36	Dhania - Dal	Finest quality split coriander seeds roasted and mildly salted; crunchy and crisp. A traditional mouth freshener and an excellent post-meal digestive. Coriander Seeds are rich in Vit-C (the only seed to do so), Vit-B family and thiamin, riboflavin, and niacin. Coriander seeds are anti-bacterial, anti-microbial and anti-inflammatory in nature, and hence, consuming dhana dal after meals can have many medicinal benefits.	98.00	26	2018-08-02 00:00:00	\N	2281	4
37	Pudina Chutney Masala	Catch Pudina Chutney is a spicy dip made from mint leaves. This Pudina chutney masala is perfect for making the traditional Indian condiment. It is an extremely flavour condiment and is served in small quantities. It is one of the most popular Indian chutneys around, as it can be served with almost any food. Catch Pudina Chutney Masala is made using Low-Temperature Grinding technology.	46.75	85	2019-11-03 00:00:00	\N	1515	10
38	Bodylicious Deodorant Spray - Mate (For Men)	Engage Man Mate Deo Spray  For Beauty tips, tricks & more visit https://bigbasket.blog/	136.50	22	2021-07-11 00:00:00	\N	141	26
39	Sport Deo Spray - Fresh, for Men	A refreshing fresh fragrance with sparkling citrus top notes, sophisticated floral heart notes and a comples woody-musky base, which is perfect for a hot summer day or an enchanting date night.  For Beauty tips, tricks & more visitÃ‚Â https://bigbasket.blog/	112.75	67	2021-10-12 00:00:00	\N	141	18
40	Choco Deck - Mini Delights	Fabelle brings you Fabelle Choco Deck – Mini Delights, a pack of mini Milk Chocolate bars that will impress everyone, regardless of age. Perfect for gifting, it will make moments of celebration and bonding with friends and family even more special. Each bar is made of a layer of rich choco creme cradled between two layers of Milk Chocolate.\nExperience an explosion of chocolate in your mouth as you first taste the sweetness from milk chocolate followed by the richness from the choco crème. Handcrafted by the Master Chocolatiers from the House of ITC, Fabelle gives you a dessert like an experience in a chocolate bar. Finding the perfect gift can be tricky so when in doubt, gift chocolate!	160.00	13	2021-04-06 00:00:00	\N	850	31
41	Eau De Toilette - Homme Green	Colour Me is the of one of Milton Lloyds wonders. Now get a long-lasting, luxury fragrance in form of different variants of Colour Me. Take advantage of the finest quality and longest lasting oils, put in the highest concentration to ensure you a repeated delight.	427.50	76	2020-06-09 00:00:00	\N	33	15
126	Premium Square Plastic Container - Green	These containers are microwave safe but without its lid and is refrigerator safe and dishwasher safe. Use it only for reheating the food and not for cooking food in this container. All containers are airtight but not leakproof.	179.00	19	2020-07-04 00:00:00	\N	404	35
42	Lemon & Tea Tree Oil Soap	The new Liril soap, with its active ingredients like tea tree oil and lemon extract, gives you a freshness that lasts longer. The soap gives you a fragrance which not only lasts the whole day long as well as keeps your skin healthy. This soap ensures that your skin gets the best care and stays fresh. At the very same time, this soap also ensures that not only your skin retains its natural moisture but also maintains its oil balance. The lemon and tea tree oil ingredients in this soap give you a thick lather which lends a sense of freshness after every shower and makes bathing an enjoyable experience. The fragrance with cues of Lemon provides an invigorating shower experience. This soap has been consistent in bringing alive freshness. This soap also lasts for a long time and is a great choice for a daily refreshing shower! Buy the new Liril Soap in a 125-gm bar now, right here! With active ingredients, the Liril Lime Soap gives you freshness that lasts all day long. The lemon and tea tree oil ingredients in this soap give you instant freshness after every shower. Buy the Liril Lime Soap in a 125-gm bar, right here!	360.00	10	2019-01-02 00:00:00	\N	765	13
43	Flavoured Cream Wafer Roll - Strawberry	Very crispiest texture and pleasant odour of flavour.	275.00	53	2022-05-12 00:00:00	\N	1291	36
44	Storage/Lunch Steel Container with PP Lid - Red	Add a dash of colour to your kitchen with these colourful and functional microwave safe stainless steel plastic coated containers with lid from Classic Essential. The containers have a steel interior and a plastic-coated exterior and can be used easily for reheating food or simply serving and storing your snacks/cereals.The exterior plastic gets heated first which in turn heats up the inner steel in which your food is absolutely safe of any toxins. Hence it might take longer than usual to heat up in the microwave. So go ahead and buy yourself a set.	109.00	97	2020-11-02 00:00:00	\N	77	39
45	Plain Green Olives	Olives are small fruits that grow on olive trees (Olea European). they belong to a group of fruit called drupes, or stone fruits, and are related to mangoes, cherries, peaches, almonds, and pistachios. Olives are very high in Vitamin E and other powerful antioxidants.	179.00	65	2022-05-07 00:00:00	\N	821	1
46	Quinoa - Organic	Quinoa is one of the world’s most popular health foods. Organic Tattva's Organic Quinoa is one superfood which is gluten-free, high in protein and is full of anti-oxidants. It is one nutritious plant food which contains all nine essential amino acids. Enriched with anti-inflammatory phytonutrients, it is helpful in the prevention and treatment of various health conditions.  It contains small amounts of the heart-healthy omega-3 fatty acids and it boosts the immune system. Quinoa has a sweet and nutty flavour with a distinct texture. Organic Quinoa ensures purity and unadulterated goodness of this superfood. its high nutrition content makes it useful for people who are particular about their health. Organic Tattva's Quinoa is produced  and processed in compliance with NPOP standars in India, USDA -NOP, and EU Regulation EC no. 834/2007 & 889/2008.	250.00	20	2019-03-01 00:00:00	\N	1061	31
47	After Shave Splash - Arctic Ice	Designed specifically for male skin. Finish a great shave with a crisp, Clean aftershave that refreshes just-shaved skin. Refreshes with a clean, Crisp, Masculine fragrance.	459.62	15	2018-09-09 00:00:00	\N	1826	9
58	Argan-Liquid Gold Hair Spa	Our beautifully crafted Hair Spa Collection promises to be the perfect solution for nourishing and rejuvenating your tresses. Made with Argan Oil it revives moisture in the dull dry hair, reduces frizz, smooths unmanageable locks of curly hair, deeply nurtures hair shafts & follicles to prevent hair fall, repair split ends and strengthens the roots!Revitalising Hair Oil - The luxurious fusion of Moroccan Argan Oil, Sesame Oil, Olive Oil, Lavender and Geranium provides intense nutrition to revitalize dry and damaged hair.Follikare Wash - Precious blend of Moroccan Argan Oil, Hibiscus, and Ylang Ylang nudges away sebum to strengthen the hair follicles and improve hair growth.Follikare Deep Conditioning Mask - Perfect balance of Moroccan Argan Oil, Patchouli and Shea Butter restores hairs natural luster and provide deep nourishment to brittle, weak and frizzy locks.Restorative Nourishing Tonic - Exotic elixir of Moroccan Argan Oil, Chamomile, Watercress and Sage Extracts strengthens the root to prevent hair fall, enhance the volume and silken the texture of hair.Satin Feel Leave-On - Potent serum of Moroccan Argan Oil and Vitamin E repairs damaged hair strands, while moisturises and smoothens unmanageable dry frizzy hair.Argan - Liquid Gold - Aroma Treasures brings to you an exclusive Hair Spa Collection enriched with Argan Oil extracted from the kernels of Moroccos Argan tree.	199.50	8	2018-05-01 00:00:00	\N	1874	32
48	Colour Catcher Sheets	1. Prevents Colour Run Accidents Colours that run in the water during the wash might bleed into your laundry. Thanks to its patented technology the sheet acts like a magnet and traps loose dye from the water - assuring maximum protection against discolouration and colour runs. The proof is on the sheet!\n2. Allows Mixed Washes As the sheet protects against colour transfer it allows you to wash all colours together, even with whites. Colour Catcher protects your laundry and saves your time and money by allowing mixed washes.\n3. Protects Colour Brightness Even if not seen by the eye, traces of dye might deposit every wash and build up a layer of mixed colours on the garment over time - making your coloured garments dull. The sheets trap dyes from the water before they deposit on the garments. It helps to keep your colours brighter for longer!\n4. Prevents Greying Greying is an accumulation process. Grime and dirt are traces which redeposit on the fabric during several washes and their build-up becomes visible over time. By removing loose dirt particles from the wash the sheet protects the fabric from greying.\n5. Effective at All Temperatures Extra absorbent fibres of the sheet provides maximum protection at all temperatures. For best results use Colour Catcher in every wash.\n6. Prevents Residual Dirt Redepositing Dirt particles may also float in the wash water. With its unique feature, the sheet catches released dirt particles from the wash water for better cleanliness of your fabrics.	799.00	6	2019-12-07 00:00:00	\N	84	27
49	Sauce - Sweet & Sour	Sweet & sour sauce is great for pineapple, fried rice, stir fried noodles, tofu dipping, etc.	245.00	57	2019-01-04 00:00:00	\N	2052	2
50	Super Hot and Sweet Mango Chutney	From the Bylanes & Streets of Eastern UP, comes the inspiration of this Chutney. Originally the Khatta Meetha Aam ka Achar, this sauce will transport you back to your childhood.	100.00	61	2020-05-07 00:00:00	\N	1169	35
51	Pani Puri Mix Paste	Make your home-made Panipuri more delightful, with the help of our Tangy Panipuri Mix Paste. Mix 4 tablespoon (50g) of Mother's Recipe Panipuri Mix Paste in 450 ml of chilled water. Dunk the puris filled with mashed boiled potatoes and Sprouts or Boondi in the prepared water and enjoy. Tastes best with our Tamarind Date Chutney.	48.95	63	2020-04-07 00:00:00	\N	1351	40
52	Peach Syrup	Pekers peach syrup takes you on a historical trip to north-west china together with the sweet aroma of fuzzy peach fruit and It’s yellow-red colour.	850.00	13	2020-07-03 00:00:00	\N	304	23
53	Acne & Oil Control Face Wash	Natural mineral kaolin deep cleans removes dirt, pollution and bacteria. Added sliver resists the impact and spread of acne causing bacteria	80.00	96	2020-08-02 00:00:00	\N	2204	8
54	Choco Deck - French Dessert Inspired Layered Bar	Fabelle Choco Deck is a unique multi-layered chocolate experience with three irresistible layers of chocolate. Now introducing Fabelle Choco French Dessert Inspired Layered Bar where the bar is inspired from the French Dessert - Mille Feuille. The middle layer is made of soft choco creme, nuts and crisps cradled between two layers of Milk Chocolate thereby re-creating the iconic French dessert.Fabelle has reimagined the way chocolates are meant to look, feel and taste. Indulge your senses with Fabelle's range of premium chocolate bars available in a unique format.	56.00	21	2020-02-09 00:00:00	\N	850	24
55	Extra Fine Green Peas	We bring for you Europe’s leading brand of canned vegetables from the Cooperative d’aucy Group, France, consisting of more than 25000 farmer members and 60 production sites. The history of Daucy began in Brittany in 1965. In 1979, d'aucy became part of a cooperative enterprise. Today, and for almost 50 years now, d'aucy has been trying to offer you the best of its vegetables, whether canned, frozen or in our prepared dishes. The vegetables are processed and packed within a few hours of picking, thus ensuring that the micronutrients are saved from deterioration. Each vegetable awakens in its own season, at its own pace so that you can enjoy all year round all their flavors and all their benefits, daucy's mission is to harvest them in the right season when they are ripe and then find the best way to keep them. Daucy guarantees top quality and traceability of its products. We ensure this guarantee by controlling all the stages of the production from the farmer’s field to the consumer’s plate. Daucy Extra Fine Green Peas are hand picked at their peak in order to ensure that only the best make it into the can. Filled with dietary fiber. Daucy selects its peas for their fondant and tenderness.Our canned peas are an excellent nutritional boost, which can be added to dishes or eaten straight out the can. Cook, steam or grill them to your taste. You can use them to prepare salads, side dishes, vegetable dishes or pickles.	202.50	66	2018-04-04 00:00:00	\N	1990	30
56	Soothing Cucumber Facial Scrub With Apricot Seeds	The soothing feel of cucumber meets the gentle exfoliation of apricot in our wonderful scrub. While the apricot cleanses the top layer of dead cells and reveals fresh, glowing skin from below, vitamin-rich cucumber cools it down gently. This non-abrasive scrub also reduces excess sebum production, which makes it perfect for those with oily skin.	299.40	30	2020-02-02 00:00:00	\N	1462	33
59	Baby Bed Protector - Sublimation Print, Pink	These bed protectors for babies bed from Quick Dry are quick absorbent that makes it dry faster. It protects the baby against the dust mites, bacteria and allergens. This leakproof protector is soft, cosy and smooth. It can be easily washed in the washing machine. It comes in a variety of colours with attractive print designs and sizes.	199.00	75	2019-05-02 00:00:00	\N	1756	5
60	Corporate Planner Diary With Premium PU Leather Cover With Card Holder	A5 Size (210x150mm) \n192 Pages Premium Natural Shade 80 GSM paper \nFlat Lay open easily Hardbound Diary with Premium PU Leather Top \nWith Card Holder Perfect Binding with sewing \nRounded Corners\nProudly Made in India	399.00	29	2019-06-03 00:00:00	\N	865	38
61	Atta Chalan - Stainless Steel, Size- No.8	This atta maida challan is made from high quality stainless steel. This is used for sieving wheat, rice, atta, maida and many more items.	149.00	14	2018-06-05 00:00:00	\N	1325	11
62	Dog Supplement - Absolute Skin + Coat Tablet	Give your pet the Glory of Healthy Skin and Coat with Drools Absolute Skin + Coat Tablet. The tablet helps make your pets coat healthier and shinier. It has the recommended formation which provides the coat with a healthy and natural sheen, while also helping keep the skin free from any allergy or disease.	348.60	21	2019-10-11 00:00:00	\N	1035	6
63	Peanut Butter - Creamy, Super	Happilo Super Crunchy Peanut Butter is made from high-quality peanuts and is very healthy & tasty. This delicious butter is an excellent source of protein and fibre. It is ideal for gym-goers, dieters, and joggers.	209.40	8	2022-01-07 00:00:00	\N	592	17
64	Sugar Free Petit Beurre - The Taste of France	Bisk Farm Sugar Free Petit Beurre is one of the best sugar free petit beurre for diabetic patients and for other health issues. They have a good flavor and these biscuits are made of salty, spice and sweet. It is hygienically baked and well packed in wrappers that makes them long lasting and remain fresh giving crispy taste. It is crispy and gives a superior taste.	35.00	59	2020-01-06 00:00:00	\N	374	8
65	Aqua Halo Rejuvenating Conditioner	This Aqua Halo Rejuvenating Conditioner is an organic conditioner, which is specially formulated with moisturizing actives to add vibrancy and vitality to your hair. This natural hair conditioner provides long-lasting conditioning and colour protection. It controls unruly, dry and brittle hair and it is formulated for all hair types.	168.75	69	2021-06-09 00:00:00	\N	1971	25
66	Ayurvedic Anti-Tan Face Pack	A nourishing face pack that removes tan and brightens your face. Powered with fenugreek, milk powder and rose petals, this face pack delivers a boost of moisture to your skin, nourishing it while leaving it fresh and glowing.	269.40	7	2020-11-04 00:00:00	\N	1462	34
67	Dog Supplement - Absolute Calcium Tablet	Give your pet the Glory of Healthy Skin and Coat with Drools Absolute Skin + Coat Tablet. The tablet helps make your pets coat healthier and shinier. It has the recommended formation which provides the coat with a healthy and natural sheen, while also helping keep the skin free from any allergy or disease.	339.15	0	2021-03-11 00:00:00	\N	1035	25
68	Battery Power Kids Toothbrush - Barbie	Kids must brush their teeth at least 2 times a day and Colgate Kids Battery Operated Toothbrush is a fun way to encourage good oral care habits early on! The extra soft bristles, specially designed for kids, ensure gentle yet effective cleaning. This attractive Barbie toothbrush comes with a small oscillating head, which easily fits their small teeth and 2 replaceable AAA Alkaline batteries, which goes a long way. Easy on/off buttons ensures comfort brushing while the slim handle is easy to hold. The Colgate toothbrush also features fun character handles that make brushing more fun. Cleaning teeth couldn’t have been more fun! This powered toothbrush is not intended for children below 3 years of age. Read pack for complete instructions.	374.25	95	2018-02-10 00:00:00	\N	2017	38
69	Organic Carom Seeds/Ajwain/Om Kalu	Earthon's Ajwain is Best quality, organically grown, no preservative, no artificial colour and free from harmful chemicals or pesticides.\nAjwain also know as Bishop’s weed or Carom seeds are small brown colour seeds with a pleasant but strong odour.	72.00	50	2020-08-08 00:00:00	\N	1019	32
70	Padded Harness - 3/4 inch, Grey Colour	These are soft padded harness for your active pets with light weight metal fitings making them completely safe for your pets.	840.00	2	2019-10-11 00:00:00	\N	1256	16
71	Kids Motu Patlu Toothpaste - 2-5 Years, Bubble Fruit Flavour	Kids must brush their teeth at least 2 times a day and Colgate Kids Motu Patlu Toothpaste is a fun way to ensure they enjoy good oral care habits early on! This delicious fruit flavoured toothpaste is specially designed for children of age 6 years and above who have newly erupted or developing permanent teeth. The toothpaste effectively cleanses their mouth, leaving it fresh. The kid’s toothpaste also provides clinically proven cavity and enamel protection. Sparking colourful gel of Colgate strawberry toothpaste makes brushing fun for kids. Developed with the help and expertise of Pediatric dentists, Colgate offers a healthy and thoroughly clean. It ensures your kid’s smile gets brighter and cleaner with every use.	43.00	40	2021-05-12 00:00:00	\N	2017	12
72	Pure & Gentle Face Wash	Pears is the gentle way to keep your skin looking innocent and beautiful. It is enriched with pure glycerin and natural oils that gently moisturize skin to keep it smooth while its mild fragrance and soft lather ensure that your skin gets the pampering it deserves. Its natural glycerin provides moisture to your skin, making your face feel silky smooth while it stays clear and radiant! . Enriched with pure glycerine and natural oils that gently moisturize skin to keep it smooth. Mild fragrance and soft lather ensure that skin gets a well deserved pampering. Soap free washing preparation Pears Brand: With the goodness of glycerin & natural oils, Pears is trusted for being gentle, and is recommended by doctors and pediatricians worldwide. It keeps your skin soft and smiling with innocence. It is so pure that you can actually see through it! The pure and gentle face wash gives you fresh and clear skin in a gentle way. The face wash is suitable for frequent use as it has a soap-free formulation. Its mild fragrance will leave you feeling fresh and clean and this gentle wash not only cleans your skin but also rejuvenates it from deep within. This face wash will not leave your skin dry as it is enriched with glycerin and natural oils. So pamper your skin and nourish it at the same time with this mild face wash from Pears. You can carry this tube even in your bag, get this face wash right away!\n\n\n\n\n\nFeatures and Benefits:\n\n\n• Enriched with pure glycerin that gently moisturize the skin for a smooth feel.\n\n\n• Deeply cleanse & wash away dead skin cells.\n\n\n• This provides you a soap-free washing preparation.\n\n\n• soap-free formulation.\n\n\n• Fresh and renewed skin.\n\n\n• Use twice a day for best results  For Beauty tips, tricks & more visitÃƒ€šÃ‚ https://bigbasket.blog/	120.00	18	2020-03-11 00:00:00	\N	2026	3
73	Sesame Seed Oil	Sesame seeds were one of the first crops processed for oil as well as one of the earliest condiments and were acquired from the seeds of Sesamum Indicum plant. Sesame contains Vitamin E that acts as an excellent antioxidant and thus is useful as a natural sunscreen lotion. Sesame oil acts as both moisturiser and emollient for the body. To prevent dry skin problems, some drops of sesame oil added to the bath water works wonders. Another benefit is that it slows down ageing because of its antioxidant properties. It also detoxifies the skin, helps to repair damaged skin cells and reduces antibacterial infections.	210.00	9	2018-10-02 00:00:00	\N	1589	39
74	Til Dil Seeds	Mantra Til Dil is made from premium quality natural ingredients that have a great taste. It contains no preservatives, no added colours or flavours. Mantra Til Dil is a great way to indulge yourself naturally. The premium ingredients add a luxurious taste to it.  Perfect healthy snacks to tame your small hunger pangs.	70.00	74	2018-08-11 00:00:00	\N	1099	7
75	Penta Plastic Pet Water Bottle - Green, Wide Mouth	These BB Home pet water bottles are made of high-quality plastic which is 100% food grade and BPA free. Due to the use of virgin PET material, these bottles are having elegant shine and colour. These are the best ones to store water in the fridge or you can drink water directly from them.\nBB Home products are always high quality and at a very competitive price compared to other branded products in the market. So when you get the best or better than the brands available in the market at a lower cost, definitely you save money and get the best quality product for your use.\nSpecial Note: Colour of the bottle physically might slightly differ from the image displayed on the website due to digital photography.	75.00	91	2020-04-03 00:00:00	\N	1331	6
77	Disposable Bamboo Wood Skewer/Picker Sticks- For Barbeque, 12 Inch	These skewers are made from bamboo and are treated and boiled. Bamboooz Bamboo Wood Twister Skewer/Picker Barbeque Disposable Stick is made with high-quality bamboo.  No chemicals are used to smoothen the sticks, nor bleach to make it look white. Whatever colour comes naturally, the same is brought to you. These are made in India.	135.00	59	2020-08-07 00:00:00	\N	2060	7
78	& Moms Bathing Soap - Jasmine	Your trusted Dettol offers a new range of Dettol Co-Created with Moms beauty bathing soaps. It is made by ingredients approved by moms and with minimal chemicals. This new range is free from parabens, harsh chemical residues, artificial dyes, and talc; it has fragrance infused with 100% natural jasmine essence. It gives 10 times better protection than any ordinary soap and is gentle on skin. Reassuringly, Dettol protects from a wide range of illness-causing germs and bacteria to help you stay healthy.	108.00	50	2018-02-08 00:00:00	\N	1876	37
79	Amla Chatpata Dry Fruit	Fresho Signature presents an array of dry fruits apart from the ordinary to give you the best of the best to indulge. Want to try something other than a regular fruit? This sweetened and spiced amla dry fruit is a healthy alternative to munch on when hunger strikes. It contains amla fruit, sulphurless sugar, cumin seed, black pepper, black salt, citric acid, cinnamon, asafoetida and ginger powder. Easy to carry, it makes a great snack to keep you going throughout the day.\n\nOur spicy candied dry fruit is here to be your snack buddy and your healthy sugar high. They are sweetened with sulphurless sugar and liquid glucose and spiced to enhance the zing. There are 0 added preservatives, artificial colour and flavour to retain the original fruit essence and keep it natural and healthy.	49.00	99	2022-05-05 00:00:00	\N	1973	21
80	Toothbrush Superhero Assorted, Batman/Spiderman	Kids must brush their teeth at least 2 times a day and Colgate Kids Spider-man Toothbrush is a fun way to encourage good oral care habits early on! This attractive extra-soft bristle toothbrush has extra soft bristles specially designed for children. It is ideal for kids of age 5 years and above who have baby teeth or developing permanent teeth. Extra soft, multi-height bristles on the toothbrush effectively clean big and small teeth, while the raised tip helps clean hard to reach back teeth. The kid’s toothbrush features a well-rounded handle; a thumb grip offering comfortable hold; a suction cup at the base for easy and fun upright storage and a soft plus safe tongue cleaner on the back of the toothbrush head. Cleaning teeth could never have been more fun! Developed with the help and expertise of Pediatric dentists, Colgate offers a healthy and thoroughly clean. The toothbrush helps clean beyond teeth so your kid’s smile only gets brighter and cleaner.	49.00	64	2021-11-12 00:00:00	\N	2017	20
82	Cup a Soup - Croutons Cream of Asparagus	Batchelor's Cup a Soup with Croutons Cream of Asparagus: Serving Suggestion: 1. Empty a Sachet into a cup or mug, 2. Add 230ml of boiling water, 3. Stir well, wait a few moments, 4. Sit back and enjoy. Ingredients: As Served (greatest first) Water, Asparagus (5%), Maize Starch, Glucose Syrup, Vegetable Oil, Croutons (1.3), (Wheat Flour, Vegetable Oil, Salt, Yeast, Rosemary Extract), Lactose, Potato Starch, Salt, Onion Powder, Milk Proteins, Flavouring, Flavours Enhancers (Monosodium Glutamate, Disodium 5-ribonucleotides), Emulsifier (Mono-and Diglycerides of Fatty Acids), Acidity Regulator (Dipotassium Phosphate), Yeast Extract (Contain Barley), Turmeric, Natural Flavouring (Contains Celery).	269.10	67	2020-01-01 00:00:00	\N	1998	26
83	Organic Dal - Masoor	Pro Nature Organic Masoor Dal, that comes in a hygienically sealed packet ensuring its freshness and taste. It is a preparation of pulses (dried lentils, beans or peas) which have been stripped of their external hulls and split. It is also high in carbohydrates whilst being virtually fat free. It is also rich in B vitamins thiamine and folic acid as well as numerous minerals, especially zinc and iron.	96.00	35	2019-06-08 00:00:00	\N	1947	22
84	Strawberry Ice Cream	Haagen-Dazs strawberry ice cream is sweet, summer strawberries which introduced to delicate cream and other superb ingredients. Packed over with actual fruit, the true taste of the strawberries comes shining through. This is the strawberry lover's concentrate of pure enjoyment. It is soft and delightful tastes. It is very yummy creamy frozen dessert with real fruit pieces. The ice cream supari is most thinly developed flavors to give you a distinctive flavor.	225.00	62	2021-06-03 00:00:00	\N	760	18
97	Hair Remover Spray - Foam Lemon	Denim BlackÃ‚ is made for the bold and the confident. The unmistakably intense and woody accord of Patchouli, Sandalwood & Cedar represent masculinity, while Amber, Labdanum & Oakmoss balances the composition with warm sensual tones.  For Beauty tips, tricks & more visit https://bigbasket.blog/	1200.00	6	2018-11-10 00:00:00	\N	2150	1
271	Cotton Swabs	Cotton swabs consist of a small wad of cotton wrapped around one or both ends of a short rod, usually made of either wood  For Beauty tips, tricks & more visit https://bigbasket.blog/	109.00	90	2021-09-07 00:00:00	\N	1350	36
85	Exo Dishwash Bar- Round 700 gm Box + Pril Dishwash Liquid- Active 2X Lime 225 ml	Exo Dish Shine Round makes your vessels odorous and removes the stain. The fast action formula with the hyper-cleaning technology quickly removes the toughest of stains and makes your vessels shine like never before. This dishwashing bar does not leave traces on the vessel and hence it can be easily washed. It works hard on grease and stains, keeping your utensils fresh and shining. It contains many anti-microbial agents that keep your vessels away from dirt and microbes which do not create pealing or itching of your skin.Pril dishwash liquid has powerful active 2x molecules that cut away tough grease residue, removes the food smell and leaves the utensils sparkling clean.	95.00	58	2020-01-12 00:00:00	\N	1476	12
86	Jupiter Water/Juice Glass Tumbler	B Home glasses are crafted and manufactured in Taiwan to bring the best of the quality, clarity in glass and shine for elegance. These glasses are very superior in quality with high wall thickness and with a heavy bottom to flaunt your style and elegance to your guest at the first impression. These glasses are manufactured with high precision to ensure no wobbling on the rim or bottom of the glass. These are 100% food grade and dishwasher safe. These high-quality glasses can be used for serving juice, water or even alcoholic drinks during your parties.BB Home products are always high quality and at a very competitive price compared to other branded products in the market. So when you get the best or better than the brands available in the market at a lower cost, definitely you save money and get the best quality product for your use.	479.00	0	2021-04-05 00:00:00	\N	1331	9
87	Cheese - Feta Greek, Block	Fresho Signature brings to you one of the most loved and simplest of cheeses- the luscious Greek Feta made from sheep's milk using traditional recipes. Its briny and salty taste makes it a perfect table cheese to nibble with some bread or crackers. This cheese is perfect for a fresh veggie salad because its grainy texture balances out the crunch from the veggies making it ideal for stuffing into grilled vegetables or even works well with desserts. We prepare the cheese into dices as per your individual requirements for each order. Store in an airtight container in below 5°C and consume within 5 days of packing.	695.70	15	2020-07-05 00:00:00	\N	1973	10
88	Avida 3-in-1 Semi Economy Pouch -  FG01248	3 in 1, Incense sticks, also known as agarbathi (or agarbatti) and joss sticks, in which an incense paste is rolled or moulded around a bamboo stick, are the main forms of incense in India. In India, burning incense is about spreading positivity in all around areas. Burning incense sticks is also a symbol of worshipping God and a symbol of peace and freshness.With powerful healing properties, these incense sticks can influence your life by increasing spirituality. The bamboo method originated in India and is distinct from the Nepali/Tibetan and Japanese methods of stick making without bamboo cores.	31.50	93	2021-03-02 00:00:00	\N	1436	9
89	Bathing Soap - Sandal & Turmeric	Favoured by over 380 million consumers, Godrej No.1 offers you 'nature's way to beauty' with carefully chosen natural ingredients to make your skin naturally beautiful. It is Grade 1 quality soap and the highest-selling soap of its kind in the country. Godrej No.1 Sandal and Turmeric soap come with the sweet, balsamic, woody scent of the sandal. It preserves the young nature of your skin giving you a perfect complexion. It protects your skin and gives you a youthful and young look.	254.15	16	2019-02-03 00:00:00	\N	224	37
90	Sweet Corn Kernels - Chipotle	Ready To Eat Sweet Corn kernels, packaged using OXYFRESH Technology along with Chipotle masala sachet.	55.00	100	2021-02-01 00:00:00	\N	2112	32
91	Ashwagandha Tablets	Muniyal Ayurveda Ashwagandha Tablet contains the Ayurveda herb, Ashwagandha, which has worked wonders with patients of cardiac and neural disorders for centuries. The tablet strengthens the nervous system and enables its users to handle stress better by elevating their stress threshold considerably. It is effective against hypertension and is also beneficial in renal complaints because of the diuretic properties of its ingredients. Its anti-inflammatory properties reduce the risk of fever, swelling and tenderness.	120.00	22	2018-05-06 00:00:00	\N	1180	35
92	Hard Anodised Ezee-Pour Saucepan With Lid - L88	Futura Hard Anodised Saucepan comes with a spout for pouring and is especially suitable for making tea or other beverages and boiling milk. The larger capacity saucepans have flared rims. All saucepans either come with a lid or are offered with an optional lid. It has one long handle.	864.50	67	2020-11-01 00:00:00	\N	733	11
93	Topp Up Milk - Elaichi	Gowardhan Topp-Up Milk is made by 100 % of cow's milk and has 10% more protein. This elaichi milk will taste like a rich and luxurious treat. Liked by all ages, this healthy drink is perfect for your hunger pangs and its delicious taste will surely going to please your taste buds.	80.01	18	2020-09-03 00:00:00	\N	377	34
94	Namkeen - Madras Mixture	Townbus Savoury Snacks are made by combining the freshest of ingredients with a traditional recipie. These authentic snacks will take you down memory lane and remind you of the traditional snacks your grandma used to make with love. Townbus namkeens are perfect to relish with your evening tea or coffee. They can also be used in chaat for added flavour or to customise it as per your liking. Townbus every bite has a story.	10.00	87	2022-02-02 00:00:00	\N	878	11
95	Stainless Steel Storage Lunch Container - Flat, Carry Snack Pack	These smart and stylish air-tight, spill-proof and moisture-free storage containers help keep your food fresh and tasty for longer. They have locks on 4 sides to prevent spills and moisture. The translucent lids let you easily see what's inside. These stainless steel containers are a big help when packing food for school and office. Durable and reusable, these containers can even be taken along for lunches and picnics. This size makes it ideal to store chapatis or any other Indian snacks.	129.00	83	2021-12-09 00:00:00	\N	2008	6
96	Oceans Deodorant for Men - Long Lasting & Fresh Aquatic Fragrance	Looking for an energetic fragrance that works for all occasions? Say hello to Brut Ocean Deodorant Spray. A fresh, aquatic version of the classic men’s fragrance, Brut Ocean leaves you feeling super fresh and energized through the day. It embodies an energetic experience – exactly what you need to either kickstart your day or post a great workout session. Enjoy this masculine, aquatic fragrance that lasts all day, all night. An iconic brand in the world of fragrances, Brut exemplifies absolute class, electrifying charisma and ultimate sophistication. So, what are you waiting for?	179.40	38	2019-12-10 00:00:00	\N	1033	5
98	Mr. Magic Powder-To-Liquid Germ Protection Handwash Empty Bottle + Refill	Godrej Protekt Mr Magic handwash is a unique powder to liquid format, a first, in the world of handwashes! With Neem which is tough on germs and soothing Aloe Vera makes it gentle on skin. Extremely affordable compared to other handwashes in the market.Mr Magic handwash is not just green in colour, it's also green in nature. If all Indian households that use liquid handwash refills switch to Godrej Protekt Mr Magic refills, it would result in a greener, better world.So, add, pour, shake and wash to stay protected!	32.55	88	2022-04-12 00:00:00	\N	2269	8
99	Frankincense Oil	This Frankincense Oil balance, heals, tones and rejuvenates ageing skin. Its woody, warm, and balsamic aroma help calm the mind during meditation and creates a peaceful environment.	258.75	60	2018-08-12 00:00:00	\N	1102	28
100	Wonder Diaper Pants - Xtra Large, 12-17 Kg	Huggies knows that nothing is more important than the comfort and well-being of your little baby. Choosing the best diaper for your baby is an important step in ensuring the comfort of your little one during the day as well as overnight. That is why we have lovingly designed Huggies Wonder Pants for the all-round comfort of your little one. These diaper pants keep your baby comfortable in the day and help them sleep peacefully at night without any wetness irritating their skin. Their cottony-soft material is gentle on their bum keeping their precious skin perfect. And their revolutionary Dry Touch Sheet pulls the wetness away from the skin of your baby keeping it dry and hygienic for up to 12 hours. If you are looking for safe and gentle care for your little one, stock up your diaper bags and changing tables with Huggies Wonder Pants.	1266.38	89	2019-02-05 00:00:00	\N	2160	27
101	Samrakshana Vaastu Deepa Thailam	Exclusive blend of quality oils and powerful divine herbs, Puja Oil is the blend of five puja oils - Coconut, Rice Bran, Sesame (Til), Castor and Mahua - sourced in their purest form and blended for cherished memories to last longer The oil constitution varies regionally.	515.00	67	2020-07-08 00:00:00	\N	2105	29
102	Quinoa - Organic Black	• Saponin Free • Gluten Free • Grown in India • Powerhouse of Fibre & Protein • Only plant food that provides high contents of all essential ammino acids in to protein • 2 X more amino acids than Rice & Wheat • 6X Leucine than wheat	495.00	85	2018-08-10 00:00:00	\N	1676	28
103	Fructis Serum - Long & Strong	Garnier Fruits Long & Strong Strengthening Serum detangles unruly hair, softens hair without heaviness and helps stop split and breakage ends. It is enriched with the goodness of Grape seed and avocado oil that result in smoother, shinier and longer hair.  For Beauty tips, tricks & more visit https://bigbasket.blog/	230.00	82	2019-05-10 00:00:00	\N	2193	16
104	Citrus Blast Orange Lemon Soap Free Body Wash	Fuschia Citrus Blast Body Wash is a fusion of Orange and Lemon extracts in a soap free formula. It is rich in Vitamin C. This body wash gives you firm and flawless skin.	225.00	47	2021-07-01 00:00:00	\N	1671	13
105	Veda Marie Light Biscuits	Crispy Marie biscuits with the goodness of wheat fibre and 5 natural ingredients -Tusli, Ginger, Cardamom, Ashwagandha and Mulethi, making it the perfect partner for your cup of tea!	30.00	60	2022-06-04 00:00:00	\N	213	2
106	2 Fold Umbrella - Auto-Open & Manual Close, Dark Violet	This Fendo Umbrella brings - Classic Women Umbrella, one of the most preferred umbrellas online. Made of Superior Polyester Fabric with UV Protection. It will withstand harsh weather conditions. Umbrella Care: Please allow the umbrella to dry before closing	289.00	29	2020-03-09 00:00:00	\N	1897	25
107	Aamras Mango Fruit Juice	The one treasure that easily transforms Indian summer into a festivity that it is, is Aamras. An honest treat for an honest day’s work. A silkesque ale cascading down your throat - Soothing, serenading and more importantly, lingering. Sometimes enveloped in rotis, sometimes guzzled with milk but the best way to go about Aamras is to have it directly as is. The way the ancients intended. Without preservatives or artificial flavour. Without frills or hassles.\n Ah! One just cannot help but submit to the tasty tyranny of the one true king of the fruit realm. All hail the mango! Long live the king!	243.00	64	2020-07-10 00:00:00	\N	1604	39
108	Henna & Ginseng Anti Hair Loss Shampoo	Jovees Herbal Anti- hair loss Shampoo is an excellent natural recipe containing naturally derived ingredients that have proven therapeutic properties, which aid in controlling hair loss, provide nutrition and strengthen the hair shaft. It shall also help in improving the texture of the hair.	137.75	32	2019-06-04 00:00:00	\N	1720	8
109	Sandwich Toaster - Non-Stick, Gas	Omega toasters are budget friendly gas toasters that make beautifully crisp sandwiches and toasts to be enjoyed any time. It has a non stick coating inside and a hand crafted handle with maximum grip torque. They can be easily locked to keep the contents secured inside and are very easy and convenient to use.	249.00	57	2020-12-01 00:00:00	\N	35	6
424	Conditioner - Hair Repair	Richfeel Hair Repair untangles & instantly enhances the texture of your hair. It repairs the hair cuticles to give you an instant shine. Also helps repair split ends. Suitable for all hair types  For Beauty tips, tricks & more visit https://bigbasket.blog/	161.00	8	2020-07-02 00:00:00	\N	1380	35
313	Masala - Punjabi Chhole	Made of select varieties of Naturally Rich ingredients and with the formulation of Chef Sanjeev Kapoor, Tata Sampann masalas add mouthwatering taste to your food.	28.05	83	2019-01-10 00:00:00	\N	1312	15
110	Baby Cereal - Ragi Almond & Banana, 6-8 Months, No Preservatives, No Artificial Colours	Smooth easy-to-cook porridge mix made from Sprouted Ragi, Almond powder, Banana Powder and Cardamom Powder. We use Sprouted Ragi which has 3x the calcium of a glass of milk and 10 x the calcium of wheat and rice, great for growing bones. Almonds contain fibre, minerals and essential fatty acids. Fortified with 13 essential vitamins and minerals. Great for healthy weight gain for your little ones. No Added Sugar, No Added Salt, No Milk, No Preservatives & Artificial Flavours, 100% Natural and excellent early food for the little ones. If your little one is ready for new tastes, add some mashed fruits, vegetables or Slurrp Farm Jaggery.	349.00	66	2021-11-03 00:00:00	\N	31	11
111	Incense Sticks - Sandal	Traditional Indian Incense Sticks	60.00	43	2020-12-12 00:00:00	\N	383	23
112	SPF 15 Sunscreen Lotion	Elovera SPF Lotion is a specially formulated sunscreen that provides protection from the harmful UV radiation of the sun. The key ingredients of the sunscreen are Aloe vera and Vitamin E extract.	209.30	6	2020-03-03 00:00:00	\N	1594	1
113	Fenugreek	Per 100 gm : Calories - 323 g, Fat - 6 g, Protein - 23 g	28.50	62	2021-12-11 00:00:00	\N	1061	14
114	Caramel Popcorn - Himalayan Salt	4700BCs high quality popcorns are coated with signature handcrafted caramel sprinkled with Himalayan salt. It is the perfect snack for every occasion so go ahead and indulge yourself by having this pack filled of yummy Sriracha Lime Cheese popcorns at anytime during the day. This delicious gluten free snack has 0 grams of trans fat per serving and has certified non-GMO corn, no MSG and is cholesterol free.	44.10	88	2022-05-12 00:00:00	\N	15	22
115	Cold Pressed Bhringraj Cooling Oil For Hair Fall & Damage Control	Cold-pressed Soulflower Bhringraj Oil with coconut & sesame is a cooling non-greasy formulation that controls acute hair fall, revitalizes hair follicles, reverses premature greying and offers stress relief. The blend of Eclipta prostrate/Alba (Bhringraj) Flower Oil, Sesamum Indicum (Sesame) Seed Oil and Cocos Nucifera (Coconut) Oil can be easily absorbed by your scalp and hair. It soothes scalp irritation, protects your hair from the heat of hair dryers, curlers, and flat irons, deeply conditions hair and tames frizzy brittle hair.	182.75	41	2019-06-08 00:00:00	\N	221	35
116	Sapota - Organically Grown	Brown skinned sapotas are smooth to grainy textured, musky-scented and deliciously sweet in taste. The flesh generally contains 2-3 large and inedible black seeds. Fresho sapotas are freshly plucked by our farmers who grow it organically and the best quality is delivered to you. Do not forget to check our delicious fruit recipe - https://www.bigbasket.com/cookbook/recipes/1232/summer-fruit-salad/	35.00	3	2020-11-04 00:00:00	\N	2027	30
117	Spiced Tea - Blend Of 7 Refreshing Spices	Rejuvenate yourself with this refreshing spice tea made from rich premium fresh leaves and seven authentic Indian spices. The name Wagh Bakri is one of the most trusted name in Indian household. It is especially famous among the tea lovers. A Unique Blend of 7 Refreshing Spices. This tea is flavoured with clove, ginger, black pepper, cinnamon, nutmeg, lemon grass, piper longum.	150.00	75	2020-02-06 00:00:00	\N	88	9
118	Steel Bowl/Vati/Katori - No. 4, Chutney	BB Home Chutney Bowl can be used to serve all sorts of homemade chutneys and sauces with ease to accompany your homemade spicy Indian meal. It is made from high-quality steel and this set of four steel bowls is a must-have for your home and for small servings.	69.00	60	2020-07-02 00:00:00	\N	1331	29
119	Adult Dry Cat Food - +1 Year, Ocean Fish	A nutrient-rich food that has been formulated to deliver a cat’s need for its diet requirement. Enriched with ocean fish and other essential ingredients which helps your feline to maintain the beautiful skin and coat. Taurine, an essential amino acid keeps the heart healthy and promotes the growth and development of the body. We assure all our ingredients goes through a strict selection process by nutritional laboratories to meet the safety and quality standards of the product. Our extensive research guarantees high palatability, better digestibility.	999.00	2	2019-02-09 00:00:00	\N	1133	12
120	Millet Rusk - Sweet	Made with organic whole wheat, millets and jaggery, our sweet rusk is baked to perfection. You can enjoy a guilt-free snack with your tea or coffee which is filled with fibre and nutrition and is super tasty. All our products are made with no maida, butter, sugar or preservatives.	100.00	40	2018-09-07 00:00:00	\N	450	8
121	Stainless Steel Kadai - Induction Bottom With Glass Lid,  26 cm	Create those nutritious and flavourful recipes quickly with minimal effort by bringing home this 24 cm Induction Friendly Kadhai from Vinod. It prevents food from getting burnt. It is ergonomically designed using high-quality stainless steel, this kadhai ensures even distribution of heat while preventing food from frothing or getting burnt. Easy to clean and is dishwasher-safe, this kadhai can be easily cleaned and maintained after every use. It is suitable for all cooktops. This kadhai comes with an induction base which makes it perfect to be used on all types of cooktops including gas stoves and induction cooktops.	1099.00	64	2019-04-09 00:00:00	\N	1231	33
122	Power Pocket - Long Lasting Bathroom Fragrance, Berry Rush	Petal Crush Pink Life is not a bed of roses. But it can smell like one right? Here's a fragrance that is as fresh as it is romantic. Godrej Aer Pocket Say hello to Godrej aer pocket, a range of bathroom air freshener available in 5 delightful fragrances. Its unique power gel technology keeps your bathroom fragrant for 3-4 weeks and ensures that its fragrance reaches every corner of your bathroom. A must-have stock item in your pantry & toilet, Godrej aer pocket is so easy to use, that you simply have to unwrap the packet and hang it with the hook provided. That's it, you are done. Godrej aer pocket works 24x7 without any effort, so you can walk-in to a refreshing fragrance every-time you step into your bathroom. You can now choose from any of our 5 refreshing fragrance variants - Misty Morning Meadows, Fresh Lush Green, Bright Tangy Delight, Violet Valley Bloom, and Petal Crush Pink.	53.35	6	2018-01-10 00:00:00	\N	1938	39
123	Cabbage - Red	It is round, wrapped in purplish red leaf layers. The flavour is more peppery and bold compared to green ones.\nIts leaves are coarser as they have less water content. \nDo not forget to check our delicious recipe - https://www.bigbasket.com/cookbook/recipes/1561/violet-cabbage-walnut-salad/	23.00	32	2021-03-02 00:00:00	\N	2027	29
124	Marvel Spiderman 2-In-1 Snackeez Bottle With Snack Box	Alongside a lovely cartoon character design, the innovative Snackeez snacking solution allows you to have drink water and have your favourite snack all in one hand. The cup stays perfectly sealed to prevent spills and keep snacks fresh.	269.00	16	2019-10-11 00:00:00	\N	69	30
125	Refined Oil - Rice Bran (Natural Oryzanol & Vitamin E)	Dhara refined rice bran oil is high in Vitamin E and mono-unsaturated fatty acids.\nFood fried in this oil supposedly absorbs less oil ensuring lower calorie intake.\nIt has reasonably balanced fat composition (MUFA, PUFA and SFA) apart from the presence of Oryzanol.\nIts ideally for cooking. Store in cool and dry place, away from direct sunlight.	183.00	70	2018-04-04 00:00:00	\N	1488	5
127	Instant Popcorn - Butter Delite	Enhance your movie-watching experience, in the comfort of your own home with World’s No. 1 ACT II popcorn. ACT II popcorn is easy to make. In only 3 minutes, enjoy Hot n Fresh n delicious popcorn along with the delightful popcorn aroma. You can choose among different pack sizes such as individual packs, family packs and party packs, as per your need.\nRelish your favourite ACT II popcorn, now available in various lip-smacking desi flavours such as butter, Sweet Pani Puri, Tandoori Tadka, Southern Spice, Butter pepper as well as international flavours such as Cheese Delite, Peri Peri, Thai Sweet Chilli and Tomato Chili.	29.70	12	2018-07-12 00:00:00	\N	2007	32
128	Cherry Lip Balm 4.5 g + Deep Nourish Elbow & Foot Cream 50 g	Cherry Lip Balm:\n\nThe skin on your lips is thinner than your facial skin and requires nourishing care to keep it supple and hydrated\nKaya Derma Naturals lip balms are a handbag essential that comes in stick format which is easy to use and carry when you are out and about \nHeals dry and chapped lips \nMoisturised and softens lips \nSoft glossy look 6.Contains SPF protection\n\nDeep Nourish Elbow & Foot Cream: This cream is specially formulated to gently heal rough and cracked feet. It is also recommended for foot softening, treating corns, calluses and thick skin around the elbows and knees. Makes feet smooth and soft.	455.00	30	2021-05-04 00:00:00	\N	317	1
129	Nutrition Plus Health Supplement - Joint Support	This supplement contains Glucosamine and Chondroitin, which may support joints in order to promote healthy cartilage and tissue, while MSM supports healthy collagen for supreme joint support. Joint Support is great to help with painful stiffness, discomfort, and poor range of motion. With a specialised Glucosamine Chondroitin complex per serving, you can move easily and comfortably again. Chondroitin is the most abundant glycosaminoglycan in cartilage and is partly responsible for the resiliency of cartilage. Chondroitin is also important in preventing the action of enzymes that can destroy cartilage.	1299.00	10	2021-06-09 00:00:00	\N	197	27
130	Glass Belleza Bowl - Wine	These Iveo Belleza Glass Bowls are made from high quality coloured glass material. These are extra strong, freezer safe, no sharp edges, no wobbling. The capacity of these bowls are 400 ml each. These are ideal for storing & serving fruits, snacks & other food articles.	299.00	19	2022-03-11 00:00:00	\N	1706	22
131	Dark Fantasy - Choco Fills Biscuits - Cookies	Sunfeast Dark Fantasy Chocofill is nothing but smooth and tasty choco creme inside cookies that are baked to perfection. It has a rich chocolaty taste, and because of its soft texture, it simply melts in the mouth after a bite. This innovative cookie has its center filled with luscious chocolate which adds to the crunchiness.	23.76	69	2019-03-04 00:00:00	\N	213	36
132	Banana - Red	Standing apart from the common varieties of yellow bananas, Red bananas are short, plump and reddish-purple in colour.\nEven the flesh is light pink and sweeter compared to other varieties. They are high in nutrients and are freshly procured from the farmers. \nDo not forget to check our delicious fruit recipe - https://www.bigbasket.com/cookbook/recipes/1383/banana-ice-cream/	39.00	99	2020-06-07 00:00:00	\N	2027	26
133	Chilli - Bajji, Mild	Fresho is our brand of fresh fruits and vegetables which are individually handpicked every day by our experienced and technically competent buyers. Our buying, storing and packaging processes are tailored to ensure that only the fresh, nutrient-dense, healthy and delicious produce reaches your doorstep. We guarantee the quality of all Fresho products. If you're not satisfied with the freshness of the items, you can hand them back to our Customer Experience Executive (CEE) for a full refund. Product image shown is for representation purpose only, the actual product may vary based on season, produce & availability.	14.00	64	2021-05-11 00:00:00	\N	2027	15
134	I Love You Fruit N Nut Chocolate	This yummilicious chocolate is filled with crunchy almonds and handpicked juicy raisins and studded in the smooth texture of dark chocolate to give you the best chocolate pleasure.With 55% cocoa, Amul Fruit 'N' Nut Chocolate is a classic combination that is celebrated for decades and relished even today. The amalgamation of the dark chocolate and dry fruits will surely give your taste buds a heavenly feeling. Enjoy this sweet delight with your loved ones or enjoy some self-indulgence.	90.00	18	2021-01-06 00:00:00	\N	269	10
135	Pitted Green Olives	Del Monte olives are sourced from the largest olive producer and exporter in Spain. Olives can be used while preparing Italian & Mediterranean cuisines at home, as well as for healthy snacking. Deep & rich in flavor, Del Monte Pitted Green Olives go exceptionally well in salads & pasta, or simply for healthy snacking. Ready-to-use Spanish olives of the Hojiblanca variety. Use these in pizzas, pasta, bruschetta, garlic bread, or for plain healthy snacking.	230.00	38	2020-01-07 00:00:00	\N	650	30
136	Glass Mixing Bowl With Lid - Polo	This range of Yera mixing and serving bowls were designed as a tribute to the modern gleaming kitchen of today. These durable bowls come in different sizes to fulfil every need. The lids lock the aroma in and help to keep the food fresh for a long period of time. With these mixing bowls, you will be able to directly warm food in a microwave oven without having to go through the hassles of transferring it to another bowl or plate. This helps to warm the food in very little time and negates the need for another crockery for the same.	159.00	12	2019-06-05 00:00:00	\N	86	8
137	Cake Gel	Cake gel is a translucent soft jelly included in emulsifiers and humectants, which considerably enhances volume through increased aeration and provides a more uniform crumb structure. Adding Cake Gel helps in smooth mixing of all ingredients. Cake Gel is found in baked goods, ice cream, toppings, waffle, and fillings.	85.50	38	2020-12-08 00:00:00	\N	492	31
138	Toffees - Excellence Assorted	Almond, Anjeer, Cashew, Pistachio, Rose Flavoured Toffees	250.00	55	2020-03-07 00:00:00	\N	833	4
139	Organic Idly Podi - Ginger	This is a Ginger flavour Idly Podi that can be had with Idli, Dosa or Adai/Cheela. Ginger helps in digestion. It contains gingerol, a substance with medicinal properties, that can treat many forms of nausea. The anti-inflammatory effects of ginger can help with osteoarthritis, treat chronic indigestion and help fight infections. Certified organic products are only used.	75.00	43	2019-01-07 00:00:00	\N	2152	14
140	Glass Water Bottle - Aquaria Organic Purple	A cheerful pattern that adorns this brightly hued glass bottle. Bring home the colourful eccentricity of these Italian milk and water bottle for a pleasing sip each time as they are airtight. This serves as an ideal way to store milk, water, juices or just for decorative pieces.	369.00	90	2018-11-07 00:00:00	\N	2224	23
171	BCAA Energy Drink - Berry Flavour	NOCD provides a comprehensive\nformula for stronger immune system, stronger\nmuscles, active brain and quality skin and hair\nThe presence of BCAA and different vitamins and\nminerals along with effective levels of\nantioxidants provides a complete synergistic\nimmune therapy to the body These elements of\nthe drink help protect against the damage caused\nby free radicals Other nutrients like biotin, folic\nacid protect DNA and cells from within It has\ngoodness of green coffee bean extract and l\ncarnetine which helps in weight management	110.00	80	2019-07-03 00:00:00	\N	417	19
141	Stainless Steel Pav Bhaji/Idli Oval Shaped Plate	We believe every meal should be complemented by dinnerware that makes you smile. Hence, make a fun addition to your kitchen with the plates that blends superior durability, hassle-free maintenance and a sunny look to your dinner table. This high-quality food-grade stainless steel plate comes with 3 apple shape compartments.All compartments can accommodate different types of food like chapatti/curries/salad/ pickle or sweet. It is more useful where one can have a different quantity of small food in 1 plate without using 3 different bowls for it. This season give your kitchen a perfect gift with Compartment Plates. It is very economical in range. It is non-breakable, durable, sturdy, rust free and long lasting.	125.00	76	2020-04-08 00:00:00	\N	35	15
142	Organic Cow Ghee/Tuppa	Akshayakalpa Ghee is delicious and enjoy it with all rice, pasta and vegetable dishes. It is rich in essential fatty acids and vitamins A, D, E and K. It is great for cooking, high heat stability and easy to digest.	280.00	76	2021-05-01 00:00:00	\N	1533	1
143	Dates/Kharjura - Deseeded	Dates provide several necessary nutrients such as fiber, calcium, sulfur, iron, amino acids, manganese, magnesium, copper, phosphorous, potassium, and fats to the body.\nThey can be simply digested in nature.\nAs against other forms, dates are excellent for providing energy to your body.\nThey assist to strengthen your immunity in a natural manner.\nClick here for unique and delicious recipes - https://www.bigbasket.com/flavors/collections/231/dry-fruits-berries-nuts/	66.00	56	2020-09-08 00:00:00	\N	184	25
144	Chutney - Sweet Mango Sliced (without Garlic)	Priya Sweet Sliced Mango Chutney is rich in taste to meal. Hence, highly demanded. This Sweet Mango Chutney is highly appreciated for its purity and long shelf life. It is having high nutritional value and appetizing taste. This Sliced Mango Chutney is rich in aroma.	90.00	38	2019-11-03 00:00:00	\N	1442	27
145	Turmeric Powder/Arisina Pudi	Aashirvaad Turmeric Powder is well-known for its bright yellow color and used as a coloring agent Turmeric is used extensively in Indian dishes. Turmeric has also originated application in canned beverages, dairy products, baked products, yogurt, ice cream, and biscuits.	32.00	12	2021-01-06 00:00:00	\N	2272	13
146	Bread - Fruit	Filled with amazing tutti fruity	20.00	32	2022-01-11 00:00:00	\N	591	28
147	Bombay Street Food Spice Blend	The origins of pau bhaji date back to the 1850s Bombay, it was a fast, nutritious lunch for textile workers, a mash of vegetables sprinkled with spices and a dollop of butter, Bombay can rightfully claim to be the birthplace of this hot, spicy, tasty bhaji served with crunchy onions and slivers of lime, coupled with butter-dripping Portuguese bread called pau. Junyali pau bhaji masala can be used for Bombay’s street foods, like scrambled egg & potato patty.	225.00	48	2019-09-08 00:00:00	\N	741	15
148	Ragi Flakes	Made of only Ragi (Nachni) and Jaggery, we guarantee our Ragi Flakes will become your favourite breakfast. Murginns Ragi Flakes is certified organic. With 10x the amount of Calcium found in rice, Ragi is the superfood you need to supercharge your day.	225.00	60	2021-05-06 00:00:00	\N	2143	35
149	Mustard Oil - Cold Pressed	Mustard Oil is a good source of monounsaturated fatty acids. One of the most balanced fatty acid compositions of monounsaturated and polyunsaturated fatty acids among oils. Extracted from Mustard Plant, it is usually used in cooking in an Indian household. Having umpteen health benefits, the oil is also used to massage people suffering from muscle pain, cold among others.	250.00	65	2018-07-05 00:00:00	\N	1453	1
150	Juice/Water Glass - Long Drink Nord	The Lyra Nord Long Drink Glass 410 ml - Set of 6 can assist you in serving your guests with class and elegance. Made of glass, this product features a transparent body with an attractive shape to root for. With an ideal dimension and sturdy material, this set of glasses is a durable choice.	639.00	89	2020-06-01 00:00:00	\N	402	23
151	Glass Amaze Air Tight Jar - Pink	These glass Jars are beautiful looking with its fabulous printed design, made with good quality. These jars are made air tight to keep food articles fresh for longer period, these are also extra strong, freezer safe, food grade, moisture resistant, scratch resistant with no sharp edges & no wobbling. These glass jars are ideal for storing snacks, nuts, spices & other food articles.	289.00	99	2021-03-11 00:00:00	\N	1706	37
152	Finger Brush For Kids - Blue, Ultra Soft	- Safe & easy to use - Fits comfortably on the finger - Cleans teeth & massages gums - Specially made for gentle care	120.00	9	2020-01-10 00:00:00	\N	51	10
153	Water/Juice Glass  - Jupiter Long Glass	Lyra Jupiter Long Drink Glass - Set of Six Whether you enjoy champagne, cognac, wine, or fresh vegetable and fruit juices, a proper glass is required to serve the same. The Lyra Jupiter 350-ml Long Drink Glasses are perfectly suited to serve a variety of drinks, be they aerated, non-aerated, alcoholic or non-alcoholic. What is more, you can also serve cold water to your guests in these beautiful Lyra Jupiter long drink glasses.	459.00	74	2018-10-08 00:00:00	\N	402	3
154	Energy Bar - Choco Crunch	Need that punch? go for the crunch! With crystallised fresh ginger, its perfect companion of tea or coffee. Ginger and green tea extract is a perfect combination of antioxidants. Chocolate Chips gives a rich taste. Finger Millet is the surprise ingredient. Rich in antioxidants, it comes with green tea extract and is rich in Vitamin C	50.00	29	2021-04-04 00:00:00	\N	2220	33
155	Breeze - Razor Blades	The Gillette Venus Breeze blade for women is the secret to a time-saving shave. Simply wet the blade for an amazingly smooth shave. Flexible shave gel bars are built-in and contain rich body butter for a light lather. A smooth glide that makes no need for separate shave gel or soap. 3 Spring-mounted blades with telomer coating with shower storage. Indulge your senses as you shave with the Venus Breeze 2-in-1 women's razor.	350.00	75	2021-04-10 00:00:00	\N	2107	33
156	Confeito Vermicelli Combo, Sprinkles	Put the finishing touch on all of your fun and festive baked treats with these rainbow sprinkles! Perfect for a consistent product that's sure to please you. Sprinkle these tiny, thin, rod-shaped colourful confections into your signature cookie batter, top a flavorful ice cream sundae, or use them to garnish frosted cupcakes. Can also be sprinkled on cake pops, cookies, cakesicles and more.	247.00	54	2019-06-09 00:00:00	\N	462	33
157	Olive Oil - Classic	Olive oil is rich with monosaturated fats which makes it the king of healthy oils. It helps reduce inflammation and controls cholestrol and blood sugar. It is universally proven to be the heathiest oil and can be used for a number of things including pasta sauce, salad dressings and much more.	429.03	18	2021-05-06 00:00:00	\N	271	33
172	Coffee Energizing Face Scrub	Biotique Coffee Energizing Face Scrub is enriched with 100% pure coffee extract. The coffee purifies and deeply cleanses your face. It scrubs away impurities and dead cells and brightens your face. It rejuvenates and energizes your skin. This Scrub wash gives you a clear complexation by removing tan and blackheads. It unclogs the pores giving you a healthy glow. It is made with all pure ingredients and is preservative-free.	142.50	60	2020-03-03 00:00:00	\N	848	23
158	Octa Plastic Pet Water Bottle - Light Blue, Narrow Mouth	These BB Home pet water bottles are made of high-quality plastic which is 100% food grade and BPA free. Due to the use of virgin PET material, these bottles are having elegant shine and colour. These are the best ones to store water in the fridge or you can drink water directly from them.BB Home products are always high quality and at a very competitive price compared to other branded products in the market. So when you get the best or better than the brands available in the market at a lower cost, definitely you save money and get the best quality product for your use.Special Note: Colour of the bottle physically might slightly differ from the image displayed on the website due to digital photography.	25.00	22	2020-03-09 00:00:00	\N	1331	29
159	Chia Seeds	1 teaspoon chia contains 2g protein and 5g fibre. 1 tablespoon of chia seeds mixed with 3 tablespoons of warm water left to sit for 10 minutes is the equivalent to 1 egg, a great vegan alternative. Chia can absorb 9 times liquid compare to its weight making your stomach fill full and is therefore considered good for weight loss. Organicana chia is a certified organic product of India and it is grown in Malwa region of Madhya Pradesh which is considered to be the most fertile region of central India.	185.00	79	2019-03-08 00:00:00	\N	1427	12
160	Skin Cream	Aloe vera based (Cold processed) Moisturising cream with additional benefits of Niacinamide and Vitamin E in 50 gm tube. Niacinamide increases ceramide and other intercellular lipid levels in epidermis thereby reducing inflammation. Aloe Vera has been known for Keratolytic action for removing dead skin, replacing it with new skin cells. Aloe dilates the capillaries, and thus increases the blood flow, which fastens the wound healing process.	112.50	65	2019-04-10 00:00:00	\N	663	11
161	One Touch Air Purifier Freshener - Floral Bouquet Refill	Odonil One Touch is proof you dont need an oil diffuser for your home, as it also guards your family from all sorts of bacteria in the air.Whether you need a room, car, or bathroom freshener, this one-touch spray is versatile air sanitiser that reduces 99% of airborne germs with only one spray.	77.00	72	2021-09-12 00:00:00	\N	2174	32
162	Water/Juice Glass	Classic Yera tumblers for typical daily use. Stylish and affordable. Microwave Safe for the mild re-heating purpose only, not for Popping corn & Cooking. Unlike Plastic will not leach Chemicals into your Food even over repeated usages.	189.00	94	2019-01-10 00:00:00	\N	86	34
163	Color Naturals Creme Riche Ultra Hair Color - Raspberry Red	Garnier Color Naturals is creme hair colour which gives 100% Grey Coverage and ultra visible colour with 50% more shine. It has a superior Colour Lock technology which gives you a rich long-lasting colour that lasts up to 8 weeks. Color Naturals comes in a range of 8 gorgeous shades especially suited for Indian skin tones. It is available in an easy to use kit which can be used at your convenience in the comfort of your house! It is enriched with the goodness of 3 oils - Almond, Olive and Avocado which nourishes hair and provides shiny, long-lasting colour. Your hair will love the nourishment and you will love the colour!	199.00	29	2020-07-01 00:00:00	\N	2193	12
164	Nomarks - Antimarks Soap For Oily Skin	New Bajaj nomarks soap helps remove excess oil, deep-rooted dirt and provides relief from sunburn, blemishes and acne or pimple problems. It is a natural antiseptic which provides deep pore cleansing. Its key ingredient neem is a miraculous herb which is medicinal in nature and has potent antibacterial and powerful healing properties. Neem effectively prevents and treats itching, rashes, acne and other skin ailments.	40.00	15	2019-03-02 00:00:00	\N	2102	12
165	Silver Needles Tulsi White Tea Bags - Rich In Antioxidants, Pure Tea Buds	Immunity Boosting Tea Enjoy the goodness of ‘Antioxidant’ rich white tea blended with an ancient Indian herb- ‘Tulsi’ with sweet & intense citrus notes. Cleanse, Detoxify & Purify your body with this blend\n\nIngredients: White Tea & Holy Basil Leaves (Tulsi)\nHealthy Benefits: Builds Immunity & Detoxes the insides\nCaffeine Levels: Low Master\nTea Tasters Notes: Sweet Intense, Citrus Notes\nTime to Enjoy this Brew: Daily Morning Kickstarter	450.00	27	2019-07-04 00:00:00	\N	1305	26
166	Baby Napkins - Mini Terry	All mee mee baby napkins are carefully made from cotton and other best quality fabric. It gives a cool comfortable feeling provides high absorbency for your baby cleansing needs. Machine wash. Soft fabrics for your babys tender skin. 100% cotton towelling. Size 9 x 9 suitable from birth.	179.00	27	2021-11-09 00:00:00	\N	1287	13
167	Printed Fabric Pencil Pouch - Purple, BB1263DPPL	Keep your daughter's stationery safe and at one place with this purple printed pencil pouch. It is crafted using high-quality fabric, which is strong, durable yet light in weight. It features a zipper closure and added compartments for storing different stationeries. The print on the bag is trendsetting and is sure to catch people's eyes.	232.00	16	2018-03-09 00:00:00	\N	2238	37
168	Snacks - Roasted Mixture Lime	Bb GoodDiet Roasted Mixture Lime is tangy, flaky and healthy too. You cannot debate it when your pack of snack contains a mix of multi-grains, pulses, flaxseed, and oats. Its a complete snack made mainly of Bengal Gram (chana) and Wheat Flakes. Weight loss on your mind? This mix is your best bet as wheat flakes help you in weight loss and many other health benefits. Do not just go on dieting. Go on good dieting.  Frying food increases your fat and calorie content. Enjoy these completely roasted snacks and say hello to a happier and healthier you.	79.00	90	2021-02-07 00:00:00	\N	1531	22
501	Active Baby Medium (6-11 kg) - 62 Diapers	Pamper Active Baby Medium Diapers have been planned to offer utmost comfort to your kid. It keeps your baby dry, even under stress, so he can play uninterruptedly. It is flex to fit where your baby needs it nearly all.	1077.02	82	2019-01-12 00:00:00	\N	1470	7
169	Organic Dosa Mix - Jowar	Millets are micronutrients which are nutritious and is a replacement for rice and wheat. This Dosa mix is made from Sorghum/Jowar. Jowar is rich in fibre and iron. The high protein content of jowar controls blood sugar level, is good for bone health, and gluten-free. Certified organic products are only used.	80.00	65	2018-01-08 00:00:00	\N	2152	39
170	Lunch Box/Tiffin Set - Green BB 570 2	Pack lunch for your loved ones easily with this uptown lunchbox by Tedemei. Made of high-quality stainless steel on the inside, the lunch box is sturdy, durable, and easy to clean. On the outside, it is made of high-quality plastic. The lunch box comes with an airtight flap and lock lid, which helps in keeping the food fresh for a longer time. Also, the lid closes tight enough to store solid as well as liquid food without worries of spillage. With a catchy green colour with a smart design, this lunch box is perfect to carry to the office.	509.00	95	2020-04-07 00:00:00	\N	1297	26
173	Pain Relief - Oil	Pain Massage Oil is a herbal oil which provides relief from neuromuscular pain and the pain associated with arthritis.  For Beauty tips, tricks & more visit https://bigbasket.blog/	90.00	17	2020-09-09 00:00:00	\N	670	1
174	Ultra Soft New Born Diapers - Extra Small	Huggies ultra soft pants are our softest diaper pants. The ultra-soft range is the very best from Huggies and features cotton-like softness to gently hug your baby. Every ultra-soft diaper pant is clinically proven to help prevent rashes.	699.00	45	2020-05-06 00:00:00	\N	2160	23
175	Jungle Stimulating Facial Cleanser	Refine the tone and texture of your skin with our Jungle Stimulating Facial Cleanser. Infused with natural Vitamin E and extracts such as Green Tea, Cucumber, Aloe vera, Clary sage and Avocado, this cleanser defends the skin, helps reduce and prevent the appearance of wrinkles, dark spots, fine lines and other signs of ageing. The Balancing formula keeps the skin feeling revived and refreshed. After using the cleanser, welcome fresh, smoother, younger, happier and truly vibrant skin. Natural Face Wash with Vitamin E, Avocado Oil, Aloe Vera Extract, Cucumber Extract, Clary Sage Extract, Butchers Broom Extract. Ideal for both Men and Women.Tip: Following a regular skin care regime can help you achieve flawless skin. For more tips on skin care, visit bigbasket lifestyle blog, Click Here to visit bigbasket’s lifestyle blog	799.00	82	2019-02-08 00:00:00	\N	654	3
176	Ylang Ylang Essential Oil	100% pure, natural and vegan Soulflower Ylang Ylang Essential Oil softens, rejuvenates and moisturises skin, keeps your skin and hair look healthy, hydrated and smooth by balancing scalp moisture.For Skin: Cananga Odorata (Ylang Ylang) essential oil is pale yellow to golden yellow and has a thin consistency. It retains skin moisture, controls acne, lightens scars and blemishes, prevents microbial growth; thus protects skin from bacterial or fungal infections. This oil is perfect in giving you beautiful and glowing skin as it balances skin oil, keeps your skin youthful, refreshed, hydrated and soft.For Hair: Ylang Ylang essential oil works great in rejuvenating the dry scalp, controlling hair fall, strengthening hair roots, balancing sebum secretion and boosting hair growth giving you a healthier scalp and hair. This oil also retains the natural moisture to your strands.For Diffusion: Ylang Ylang essential oil’s warmth and depth of herby aroma acts as an aphrodisiac attuning your Svadhistana; The Sacral Chakra. It also helps boost and uplift mind aromatically and gives you a sense of relief from panic, fear and shock. It is the spiritual energy centre of confidence, happiness, and resourcefulness and also related to the negative shades of greed, fear, and self-preservation.It is 100% natural, herbal, pure, organic & vegan.	328.00	2	2020-03-08 00:00:00	\N	221	9
177	Clear Glycerine Soap - Natural Toning (Tea Tree Oil & Honey)	Medimix Clear Glycerine-Natural Toning is meant for people with Normal Skin. It helps maintain healthy skin-tone the natural way. It contains the unique and time tested combination of Tea-tree Oil, Honey and Glycerine, which helps keep skin clear, firm and healthy. It makes your skin smile!!!  For Beauty tips, tricks & more visit https://bigbasket.blog/	40.00	76	2018-08-02 00:00:00	\N	2062	26
178	Soap	Mysore Sandal-The Only Soap with Pure, natural Sandalwood Oil, Mysore Sandal Gold-Enriched with pure Sandalwood & Almond Oil and moisturisers, The Soap that comes close to the natural fragrance of Jasmine Flowers, Mysore Rose-The gentle fragrance of roses keeps you close to nature, Mysore Sandal Classic-The Soap with the goodness of Moistuiser and fragrant sandalwood Oil, Mysore Lavender-The Fragrance of Lavender for Freshness all through the day.  For Beauty tips, tricks & more visit https://bigbasket.blog/	430.00	72	2022-05-03 00:00:00	\N	849	10
179	Yellow Balm	Siang Pure is premium International Brand for Herbal Natural Medicinal products made in Thailand since 1958 at the state of the Art Plant located in Bangkok to produce various products of Ancient Chinese Wisdom for Natural Cure based on the principles of self-healing. The Essence of Chinese Medicine is to maintain (Balance of Life) including that of the Body and External Nature as well as the internal balance of all Organs. Each Herbal ingredient works together to maximise the healing effects of One another mainly to improve blood circulation. Siang Pure Products are used by millions of customers in worldwide to get relief from Headache, Motion Sickness, Dizziness, Coughing (Throat Irritation), Nasal Congestion from Flu, Allergy, Sinus & Asthma, Stomach-ache, Gastric Distension, Insect Bites, Joint and Muscle Pain, Shoulder & Back Pain or Cramp etc without any side effects and now distributed in India by Hello Ten Brands Pvt. Ltd.,	195.00	53	2020-03-05 00:00:00	\N	1255	23
180	LED Bulb - 12 Watt, Cool Daylight, B22 Base	High-Quality Bright Light: Glows with 80 CRI for better colour retention, giving the true colour effect more accurate.Economical: Consumes less energy thus saving 85% electricity bill compared to incandescent bulbs. Long Lasting: Lasts 10X longer than incandescent bulbs.No Visible Flickering: The right light enables you to experience flicker-free lighting and does away with physical discomfort to the eyes. Select LED bulbs with a lower Flicker Index and SVM less than 1.3.Glare Reduction Surface: Brightness of lamps can cause excessive sensitivity to the eyes. But the right light provides more comfort to the eyes, physical ease and relaxation when looking directly at them. Eye Safety Compliance: The right light is tested and certified to ensure the light is as safe to the eyes as any other artificial light source. LED products provide the right light for all your needs. Colour Temperature: Gives output colour temperature of 6500K for comfortable vision. Instant Start: Illuminates within a second at the flip of a switch.	159.00	74	2020-12-12 00:00:00	\N	502	24
181	Coriander Leaves 100 g + Garlic 250 g + Ginger 250 g + Chilli Green Long 250 g	Coriander leaves are green, fragile with a decorative appearance. They contain minimal aroma and have a spicy-sweet taste. Now do not bother wasting time cutting off the roots as we value your money and time and provide you with the freshest leafy edible parts.Do not forget to check our delicious recipe - https://www.bigbasket.com/cookbook/recipes/33/green-chutney/ Garlic is made of several heads wrapped in thin whitish layers. They are firm and have a mild flavour. Once crushed, they emit a strong and pungent aroma.Do not forget to check out our delicious recipe- https://www.bigbasket.com/cookbook/recipes/819/pull-apart-cheese-garlic-bread/ Firm and fibrous ginger roots are stretched with multiple fingers that have light to dark tan skin and rings on it and is aromatic, spicy and pungent. The flavour gets intensified when the ginger is dried and lessens when cooked.Do not forget to check out our delicious recipe- https://www.bigbasket.com/cookbook/recipes/232/chinese-white-sauce/ Green chillis are the best kitchen ingredient to bring a dash of spiciness to recipes. The fresh flavour and sharp bite make them a must in almost all Indian dishes. This particular green chilli variety is big.	81.06	99	2021-10-01 00:00:00	\N	2027	34
182	Jaggery/Bella Powder - Pesticide Free	Safe Harvest Jaggery Powder is made in the traditional way from molasses from cane juice, which is slow cooked to deliver a rich, nutrient dense goodness all the way from Uttarakhand to you. With minimal processing and no bleaching, it is packed with beneficial vitamins and minerals like Iron, Calcium, Potassium and Zinc important for bone density, immunity boosting and reproductive health.  Available in versatile powdered form, it can be used in a wide variety of sweet preparations as a healthy substitute to white sugar.  Transfer to a clean airtight container after opening the packet to avoid lumps.  All Safe Harvest products are cultivated completely devoid of synthetic chemical pesticides.	56.00	28	2019-04-05 00:00:00	\N	1262	22
195	Onion - Rings	Miaow Miaow Onion Rings: Ingredients: Corn Grits, Palm Oil, Contain Onion Seasoning, Flavouring Substance, Sugar, Salt and Contains Anti Caking, Food Conditioner.	75.00	52	2020-01-09 00:00:00	\N	2156	32
183	Ready Masala - Kashmiri Meat	This flavorful delicacy is the pride of Kashmir and one of the main dishes of the famous Kashmiri Wazwan, known for its heavenly taste and aromatic gravy, this dish is full of flavours and should not be missed by any meat lover. It won’t be untrue to say that if there’s a dish that tastes like heaven then this is it!	19.00	34	2019-03-04 00:00:00	\N	290	25
184	Water Saving Aerator, Switch	Eco365 presents water saving aerator for kitchen & washbasin tap. Its flow rate is as per green building norms. It is designed with a flow rate of 3 litres per minute to cut down on unnecessary water consumption. Regular pre-installed aerators on taps dispense much more water than actually required. Eco365 water saving aerator can reduce this water wastage by up to 80%. In a years time, an Eco365 aerator installed tap could save approx. 40000 litres of fresh water. Water saved is water earned. Measure your tap's opening before ordering. Tap aerators might be small but are one of the most essential parts of any tap set up. Covert your existing water taps into water-saving taps with Eco365 Aerator!	509.00	13	2019-07-11 00:00:00	\N	1492	37
185	Lemongrass Anti-Pigmentation Massage Cream	A super-rich mixture of various essential oils, this massage cream leaves your skin feeling super soft, supple & refreshed. Nutrient-rich Lemongrass & Cedarwood penetrate into the deeper layers of the skin granting health to the cells and fading away blemishes & marks. It makes your skin clear & vibrant.	148.50	93	2020-11-10 00:00:00	\N	1731	14
186	Breakfast Mix - Finger Millet Ragi Idli	Ragiidli is a delicious savoury breakfast made from premium quality finger millets. It is extremely healthy, easily digestible and very nutritious. This ready-to-cook breakfast mix also contains sooji, which has a low glycemic index and that makes it a recommended food for diabetics. The high amount of dietary fiber in ragi keeps the stomach full for longer and prevents unwanted cravings. Upgrade your lifestyle by inviting more healthy foods into your kitchen.	119.00	73	2019-05-05 00:00:00	\N	1531	12
187	Herbal Wine Grapefruit Lip Balm	Wine grapefruit lip balm is made with nutritious grapefruit seed oil, bursting with powerful vitamins. It refreshes your lips with a sweet hint of citrus and nourishes with vitamin c and softened and lustrous lips.	99.00	19	2021-03-05 00:00:00	\N	2217	28
188	Masala Upma	Wholesome meal that tastes just like home food. Just add hot water. No preservatives	20.00	87	2019-08-02 00:00:00	\N	905	14
202	1001 Nights Concentrated Oriental Perfume Free From Alcohol For Unisex	Uniting deep-rooted traditions with modern times, Alf Lail O Lail Eau de Parfum, comprises Spicy and Smoky notes, which evolve into a menagerie of Floral elements, complemented by the lingering effect of Musky and Woody notes. Equally as enchanting as the fragrance and in continuation of the â€˜1001 Arabian Nightsâ€™ theme, the Eau de Parfum is encased in an exquisitely-crafted bottle resembling a magic lamp. The matt-gold finish of the casing and the silver cap add to the charm of the authentic looking Arabian bottle containing 60 ml of the entrancing scent, capturing the magic and mystery of the orient.	4900.00	97	2020-02-08 00:00:00	\N	1733	4
203	Man - Indigo Body Mist	A brand inspired by the Greek goddess of victory, it personifies strength, speed and energy and it launched its first perfume in 1929. Since then, a wide assortment of fragrance collections has hit the marketplace with refreshing, and eye-catching proposals that capture the essence and lifestyle of today´s man and woman.Nike Indigo man Body mist is long-lasting fragrant. Provides long-lasting protection with active formula.	278.40	38	2020-03-07 00:00:00	\N	1134	11
189	Maharishi Ayurveda Ayush Kwath	Maharishi Ayurveda Ayush Kwath is a special Ayurvedic formulation made with herbs that act as an immunity booster. It helps in Fighting Infections. It is  Antibacterial, Anti Viral, and supports prana and Udana. Ayush Kwath is a scientifically proven natural supplement that has everything that your body needs to fight germs in a healthier way. This special Ayurvedic formula is scientifically researched and combines years of ayurvedic knowledge along with the world’s best herbs and other natural ingredients to provide the immune system with everything it needs. It can be sipped like tea or kadha and can be customized according to individual taste by adding Gud, lemon juice etc. Give a boost to your Immune system with this Scientifically proven Ayurvedic Kwath formula. Maharishi Ayurveda Ayush kwath is an Ayurvedic formula that helps in building your Immune system from within. This formulation is  Antibacterial, Anti Viral, and supports prana and Udana, thereby strengthening the body’s immune system. This is a simple technique to make your immunity strong. You just need to sip this kadha on a daily basis. In no time, you will feel the difference in your Immune system. Ayush Kwath comes in powder form and can be used daily to make your Immunity building Kadha. Made with organically produced herbs that are scientifically researched. It can be sipped like tea or kadha and can be customized according to individual taste by adding Gud, lemon juice etc.	165.00	58	2019-08-09 00:00:00	\N	1014	8
190	Svachh Nakshtra Steel Inner Lid Pressure Cooker (20257)	Bring home a cooker that helps you keep the kitchen clean and safe. The Nakshatra Plus Svachh Pressure Cooker comes with a unique lid that contains any spillage that might occur during the course of cooking and prevents the messy liquid from dripping down.	2369.00	83	2018-02-04 00:00:00	\N	671	3
191	Chicken Liver Gourmet Loaf With Pumpkin - Super Food	Natural food for dogs. Suitable for both adult and puppies. Preservative-free contains superfood pumpkin. Good for hydration. Suitable for all ages and sizes above 3 months of age. Suitable for both adult and puppies.	150.00	97	2019-04-09 00:00:00	\N	2199	2
192	Bath & Body Oil - Oriental Spicy Rose	Introducing the Oriental Botanics Bath and Body Oil - A botanical delicately scented Body Oil making it the best Oil for skin - a light natural oil that penetrates your skin cells to moisturize and provides a soothing topical barrier without clogging pores which leaving skin feeling hydrated and enriched. This product is uniquely blended with the high quality of 100% natural base oils of Sweet Almond, Avocado, Soya bean, Apricot, Jojoba and Grapeseed Oil. This light and non-greasy oil will be quickly absorbed and leaves only a comfortable feeling. Your skin will be soft and smooth after relaxing with Green Tea and Basil bath and body oil.	699.00	98	2019-01-10 00:00:00	\N	1838	30
193	Specialist Skin Care Oil - Scars, Stretch Mark, Ageing, Uneven Skin Tone	Bio-Oil Skincare Oil is made for all skin types, this skincare oil can be used to help reduce the appearance of stretch marks, scars, and other marks due to surgery, injury, acne, aging, pregnancy, and more. Its fast-absorbing, non-comedogenic formula won't clog pores. It helps the skin to retain essential moisture to soften skin and provide dry skin relief. It's truly a multiuse oil that's recommended by skincare specialists across the world. Its unique formulation, which contains Vitamins and plant extracts along with the breakthrough ingredient PurCellin Oil™ is highly effective and clinically proven.	333.00	3	2018-06-09 00:00:00	\N	2089	6
194	Brioche	Loaded with butter (mind it, not margarine or vanaspati), try me for breakfast, as a desi €˜bun maska€™ or a French toast and start your day on a sweet note	155.00	5	2018-11-03 00:00:00	\N	1316	1
196	Cotton Mop With Telescopic Handle 150 Cm	York is a Leading European manufacturer of household cleaning products. The mop consists of many highest quality cotton strings, ideal for cleaning various surfaces such as tiles and laminated floors. The thick thread is produced from an exceptionally durable material and comes with a telescopic handle.	558.00	67	2018-11-04 00:00:00	\N	217	36
197	Kale	Kale is a crisp and hearty vegetable, with a hint of earthiness. Kale is considered a superfood (meaning it is nutrient-dense while being very low in calories) and packs more nutrition than almost any other whole food.1? Like other dark green leafy vegetables, kale is high in calcium, beta-carotene, and vitamin C, but surpasses other greens with its skyrocketing levels of vitamins A and K.	10.00	74	2020-03-09 00:00:00	\N	2027	21
198	Notebook - Unruled, Long	Classmate Notebooks are made to the highest quality standards. Made from superior quality paper and pulp, the pages are whiter, brighter and smoother. The superior cut and excellent finish ensure the pages are in perfect alignment without any folded corners. The superior binding strength and wrapper lamination make them as durable as ever. These notebooks come with a wide variety of covers with activities and trivias to make every classmate notebook unique in its own way.	33.00	49	2020-04-07 00:00:00	\N	1605	7
199	Instant Noodles - Soy & Vinegar	Contains Anthocyanins, Rich in Natural Antioxidants, Non-Fried, No MSG, No Preservatives, No Artificial Colouring, No Trans Fat	67.50	67	2019-04-04 00:00:00	\N	635	20
200	Gluten-Free Quinoa Flour	Quinoa Flour is produced from Quinoa (kin-wah) which is a grain-like crop derived from South America. Quinoa provides protein, dietary fibre, B vitamins, and dietary minerals in rich amounts above those of wheat, corn, rice, or oats. It is gluten-free. Quinoa can be eaten as a rice replacement, as a hot breakfast cereal. Quinoa flour can be mixed with maize or wheat flour for making bread and pasta, and it is used for making or baking biscuits, cakes, and pastries in general.	378.00	5	2018-08-02 00:00:00	\N	1833	18
201	Chikki, Peanut Bar	The classic! Everybody's favorite snack. Most coveted in tiffin boxes and among post-dinner treats or mid-day snack for that matter. Now that we think about it, this was the ever favorite snack (can you blame us, it is sooo snacky!) Made with the finest quality peanuts and jaggery, its crunchy sweetness is sure to bring a smile to your face.	40.00	77	2020-02-02 00:00:00	\N	1604	10
514	Moisturzing Cream - Intense	Provide excellent moisture,balance,Provide excellent moisture balance.  For Beauty tips, tricks & more visit https://bigbasket.blog/	175.00	6	2022-03-06 00:00:00	\N	486	9
204	Fields Of Gold Organic Cumin - Whole	Cumin seeds are also known as “Jeera” in Hindi is a spice obtained from the dried seed of the herb, Cuminum Cyminum. Cumin seeds impart an earthy, warming and aromatic character to the food. It can be incorporated in a variety of cuisines in combination with coriander seeds powder. It can be added in garam masala in a roasted form and it is 100% Organic. It is certified by USDA and Indian Organic certification body like Control Union.	52.00	57	2020-01-12 00:00:00	\N	1344	38
205	Body Massage Oil - Energising	This Distil Energising Body Massage Oil is specially formulated with a healing blend of pure Essential Oils in a carrier oil base of premium Sweet Almond Oil. Distil Oils are gentle, light on the skin and easily absorbed by the body due to its ideal viscosity. It contains beta-carotene, gamma-oryzanol, tocotrienols (vitamin E) and vitamins D, C. The rich presence of essential fatty acids like palmitic, stearic, and linoleic acid moisturizes the skin, balances both dry and oily patches, reduce inflammation, soothes discomfort and is a wonderful oil for itchy alligator skin.Regular massage with Distil Massage Oils, promote the restoration of collagen at the cellular level, makes the skin firm, smooth and youthful in appearance. The special blend of Essential Oils is an aphrodisiac and gives a sensuous high.	697.50	32	2020-10-08 00:00:00	\N	2151	34
206	Synthetic Food Colour Preparation Lemon Yellow	Synthetic Food Colour Preparation Lemon Yellow	20.00	70	2019-04-04 00:00:00	\N	1805	40
207	Toothpaste - Gum Care, Expert Protection	Reduce those dental visits with this Expert Protection Gum Care Toothpaste from Pepsodent. Formulated with Zinc Citrate technology, this toothpaste not only takes care of your teeth, but provides you with the best gum care. Its advanced formula consists of Germ check and Gum guard to provide you with Complete-8 action oral care. Its anti-bacterial formula prevents your teeth from cavities, reduces tartar and lactic acid, and eliminates bacteria to give you a refreshing breath and healthier teeth & gums. \n\n\nPerfect for the whole family, this toothpaste should be used twice daily for effective results. Buy this value pack right away and get the complete oral care for your teeth and gums. A quality product of Unilever Dental Research. TM Regd. Made in India.	78.40	84	2020-04-02 00:00:00	\N	175	26
208	Bio Myristica Spot Correcting Anti Acne Face Pack	Biotique Bio Myristica Face Pack will give you results that you have never experienced before. This spot correcting face pack treats pimples and helps control the bacteria that causes breakouts, redness and other skin irritations. Now say goodbye to bad skin days with this amazing formula!	149.25	28	2020-09-10 00:00:00	\N	848	31
209	Stainless Steel Frying Ladle - No. 9, Silvera	The neat and clean design of this elegant frying ladle makes it essential for your home. It is made to be durable and from high-quality stainless steel. This spoon will survive multiple wash cycles and not lose its shine. It is easy to use for frying foods.	65.00	85	2019-08-10 00:00:00	\N	1143	6
210	OvenOrg Multi Millet Rusk	Pristine presents it's OvenOrg Multi Millet Rusk a perfect tea time treat for fitness lovers.  Loaded with great taste and Health Millets is a storehouse of nutrition and helps in mitigating new age ailments. They are highly nutritious and one of the most digestible grains.\nThe rusks are made from 57% Millet flour that is retrieved from the ebbing legacy of our cultural heritage. Enjoy this healthy package of delectable rusk at a tea-party with your friends and family.	35.00	54	2020-06-02 00:00:00	\N	1344	4
211	Mahabhringraj Tel - Hairfall Reduction & Dandruff Control	Mahabhringraj Tel is pure Ayurvedic chemical-free nourishing hair oil, made scientifically with the goodness of Bhringraj, a herb which is known in Ayurveda as ‘Keshraj’- king of hair, which helps your hair grow longer and healthier. The tail is prepared by Traditional Ayurvedic methods (Kshirpak vidhi) with a combination of 15 valuable clinically proven herbs dipped in pure Til tail (Sesame oil). This process with till tel as base oil will help to extract the entire medicinal qualities from the herbs giving us potent Mahabhringraj tel. Regular gentle massage of this therapeutic hair oil on the scalp will help control hair fall, strengthen hair from their roots, and is a helpful remedy for Dandruff. It’s a 100 % Natural formulation free from mineral oils, No silicone, No synthetic colours and fragrances	295.00	47	2020-02-05 00:00:00	\N	2114	21
649	Cat Treats - Salmon Rings, Purr-Fect	The key ingredient in these delicious treats is salmon, which provides your pet with all the nutritional goodness that goes with it. High in protein, this FDA APPA approved snack is gluten-free.	99.00	1	2018-01-12 00:00:00	\N	408	2
212	Masterchefs Germ Protection Liquid Handwash Refill	Godrej Protekt Masterchef's is a handwash unlike any other. It does not contain harmful chemicals and is naturally derived. It washes the germs away with the goodness of glycerin and essential oils leaving your hands soft and your nose delighted. A Triclosan free handwash, it has been replaced with saner actives.This product is 100% recyclable and 100% reusable.Also available in Protekt Masterblaster variant.	147.00	12	2021-06-02 00:00:00	\N	2269	27
213	Black Naturals Hair Colour Shade 1-Deep Black 20 ml + 20 gm	It is an oil-enriched cream colour which gives natural-looking black hair. Works in 15 minutes, non-drip cream. Maintains softness, smoothness, and shine. No ammonia hair colour. Lasts for 6 weeks.	108.78	62	2020-02-04 00:00:00	\N	2193	2
214	Apple Cider Vinegar - Raw Unfiltered Unpasteurized with Cinamon & Honey	ZOE Apple Cider Vinegar (ZOE ACV) with Cinnamon and Honey is a naturally fermented with delicious natural Himalayan apples. ZOE ACV is 100 per cent pure and has the goodness of mother of vinegar that lends it a cloudy look, but is an affirmation of high quality unprocessed vinegar. Loaded with potent antioxidants and minerals ZOE ACV is an elixir of life. \n\nCinnamon has anti-fungal and anti-bacterial characteristics to combat infections, bad breath, and tooth decay. Its anti-oxidative properties lowers the risk of cognitive infections and cancer. It provides benefits in controlling the cholesterol and triglyceride levels and blood pressure. Thus it is beneficial in keeping the heart diseases at bay. Also, the anti-diabetic property also helps in controlling by considerably increasing the receptivity to insulin. \n\nHoney is well known for its medicinal properties, particularly anti-inflammatory and alleviate allergies. Honey absorbs calcium, the natural form of unprocessed sugars such as fructose. The glucose present in honey quickly boosts energy levels. Finally, it helps to regulate sleep cycles and soothe the scalp.	449.10	57	2020-01-03 00:00:00	\N	1730	14
215	Brinjal - Varikatri, Organically Grown	It Is Organically Grown And Handpicked From Farm  Product image shown is for representation purpose only, the actually product may vary based on season, produce & availability.	10.00	56	2020-05-02 00:00:00	\N	2027	32
216	Wonderz Milk Shakes - Classic Vanilla	Treat yourself with an exciting tasteful adventure and discover Wonderz of Milk in every sip. Classic Vanilla Shake is a wonderful blend of the goodness of vanilla and milk. Made with natural vanilla extracts, it promises to offer a classic thick and creamy milkshake experience. This product contains no preservatives and is a source of protein and calcium.	29.75	17	2018-11-01 00:00:00	\N	213	7
217	Marie Light Biscuits - Oats Fibre	Sunfeast Marie Light Oats, Crispy Marie biscuits enriched with the goodness of 2 power-packed fibres - natural wheat fibre and soluble oats fibre.	25.00	27	2022-01-07 00:00:00	\N	213	5
218	Masala - Chicken	Annaporna Spices are the preserve for Connoisseurs of authentic and pure ground Flovours & Aromas.	28.00	47	2021-01-02 00:00:00	\N	970	11
219	Dark Chocolate- 55% Rich In Cocoa	Amul Dark Chocolate is made with the finest ingredients and rich cocoa. Its strong flavour and silky texture is just what you need to fall in love with pure cocoa for its authentice taste.	87.12	10	2019-04-03 00:00:00	\N	269	28
220	Gentle Baby Wipes	Infused with the goodness of Aloe Vera and Indian Lotus extracts, Gentle Baby Wipes are mild enough to soothe baby's bottoms during a diaper change. The wipes can also be used to gently cleanse baby's skin. The natural ingredients ensure that the baby remains bacteria-free throughout the day. Ideal for use when travelling.	699.00	5	2021-05-12 00:00:00	\N	2097	28
221	Avocado	Avocado is an oval-shaped fruit with thick green and a bumpy, leathery outer skin. They have a unique texture, with a creamy and light green colored flesh that has a buttery flavour and a special aroma. Avocados are also known as alligator pear or butter fruit. These avocados delivered to you, will not just entice your taste buds but will also ensure your well being. The approximate weight of one avocado is around 300-500 g.	105.00	25	2018-10-09 00:00:00	\N	2027	21
222	Plastic Dustbin - Beige	Keep your office or home clean and organised by keeping this stylish dustbin on the ground. It is rectangular. The dustbin is made using high-quality plastic, which makes it lightweight and durable. You can throw staple pins, papers pins, empty refills, pencil shavings, crumbled papers etc. Keep the trash and clutter away with this.	249.00	94	2021-06-12 00:00:00	\N	2238	29
223	Pineapple - Chunks, Single Serve	Our uniformly and perfectly cut pineapple chunks are enriching sight to behold.\nWe have reduced a large effort for you by removing the pineapple's prickly exterior and cubed its sweet, juicy flesh into bite-sized chunks.\nConsumed on the during travel or in your breaks. These are alternatives for your snacks. A\ndd them to your meal to make it interesting. Spice it up with a pinch of salt and masala. \nDo not forget to check our delicious fruit recipe -  https://www.bigbasket.com/cookbook/recipes/865/american-pineapple-upside-down-cake-egg-free/	19.00	46	2020-06-07 00:00:00	\N	2027	25
224	Jeera Powder	Catch Jeera Powder is made using the advanced LTG technology that keeps its aroma and flavour intact. Jeera is well known for its digestive properties and is used in a variety of Indian Dishes. It’s undoubtedly an inseparable part of every Indian kitchen. Catch Jeera Powder is a basic Indian spice used extensively in all the Indian cuisines. The main use of this Indian masala is to add aroma, colour and flavours to vegetables, gravies, curries and meat dishes. Catch Jeera Powder is made from the best premium sortex quality cumin seeds sourced from Unjha, Gujrat & Jodhpur, Rajasthan.	44.20	25	2019-10-01 00:00:00	\N	1515	6
225	Pure Neem Skin Purifying Face Wash	Joy Pure Neem Skin Purifying Face Wash contains Neem extracts with active salicylates which treat severe acne and pimple breakouts. It fights spots, marks and other skin conditions while washing away excess oil from skin surface without over drying. Skin appears pure and clear. Due to its antioxidant properties, neem protects the skin from harmful UV rays, pollution and other environmental factors. The vitamins and fatty acids in neem improve and maintain the elasticity of the skin, reduce wrinkles and fine lines.Joy Pure Neem Purifying Face Wash contains Neem extracts with active salicylates which treat severe acne and pimple breakouts. Known as an antiseptic and effective against impurities, neem is rich in anti-fungal and anti-bacterial properties. It deep cleanses your skin very gently, removes excess oils and clears clogged pores. Joy Face Wash deep cleanses the skin, resulting in a smooth, supple, and even-toned skin. It clears acne and prevents further breakouts and eruptions.Joy Skin Products are formulated with natural ingredients which provide effective results and long-lasting skin benefits.	90.00	77	2019-11-04 00:00:00	\N	2094	18
226	Lemon - Organically Grown	It is organically grown and handpicked from farm  Product image shown is for representation purpose only, the actually product may vary based on season, produce & availability.	33.60	54	2020-06-04 00:00:00	\N	2027	3
227	Lavender & Vanilla Handmade Luxury Soap	This natural soap is loaded with ingredients known for their nourishing and anti-ageing properties. We use only cold-pressed natural oils as they contain more nutrients and antioxidants than the cheaper pressed oils. The nutrient dense oils provide superior nourishment to the skin cells.Lavender & Vanilla Essential Oils: Apart from the sensuous aroma, essential oils offer a number of skin benefits. Lavender oil soothes the skin. It could quickly relieve skin irritation. It has antibacterial and anti-inflammatory properties that help reduce skin breakouts. Its antioxidant constituents fight the signs of skin aging. It helps lighten dark spots and pigmentation and helps even out skin tone. The high antioxidant content of vanilla oil helps in inhibiting free radical-induced cell damage. The reactive oxygen species generated following exposure to environmental pollutants and solar radiation are neutralized by antioxidants.Organic Plant Oil: Natural oils used in the soap are procured from the best organic sources. Virgin coconut oil is richer in skin-friendly fats and nutrients than the ordinary coconut oil. Castor oil is an excellent solvent for impurities. It easily penetrates the skin pores and removes the impurities. Wheat germ oil is the best source of vitamin E. Shea Butter: African shea nut is a source of nourishing butter with numerous skin benefits. It locks moisture into the skin for a longer time. It soothes the skin and protects it from pollutants and sun damage.Aloe Vera: Soothing aloe vera gel helps repair the damaged skin. It is rich in nutrients that boost the skin health. Chemical-Free Natural Soap: Protect your skin from the ravages of chemical-laden cleansers by introducing our natural handmade soap to your daily cleansing routine. Free from sulphates, paraben, silicone, mineral oil and other potentially hazardous chemicals, this soap takes the best care of your skin. Luxury handcrafted soap with amazing natural fragrance. A moisturizing and nourishing soap made with the finest plant-based ingredients.	275.00	72	2020-08-03 00:00:00	\N	654	4
240	Green Tea Gentle Detox Set	Our Green Tea Detox Scrub Box has our gel-based Face & Body scrub that scrubs away dead cells, dirt and dullness with seeds gentle enough even for sensitive skin. While Black Sand and Tagua Nut gently exfoliate, Aloe Vera soothes and hydrates skin leaving it soft & healthNay. Green Tea & Plant AHAs remove excess oil & control sebum production.	972.00	1	2020-03-09 00:00:00	\N	324	7
228	Stainless Steel Pressure Cooker - Steeltuff, Induction Base, Silver	Affordable and versatile, the Stainless Steel cookers from United are one of the most kitchen-friendly utensils out there. They are strong, safe and easy to maintain. Also, being a fantastic thermal conductor, these cookers result in perfectly even and well-cooked dishes. United aluminium pressure cooker, is the most cost-effective product, with similar specs and quality as compared to all the other products in the market. With zero compromises on the quality, it is the most pocket-friendly aluminium pressure cooker. Along with its effective pricing, it also has several plus points such as an anti-bulge base, injection moulding and bakelite handles which increases the life span of the product.	2059.00	74	2021-01-09 00:00:00	\N	860	20
229	Steel Deep Dabba/Storage Container - No. 12, Plain	BB Home Canister/Container Deep Dabba is a long cylindrical-shaped storage container, made of fine quality stainless steel that is durable and ideal for storing grains, snacks and other edibles. They are easy to clean and maintain. They add a great addition to your modular kitchen.	249.00	47	2019-11-11 00:00:00	\N	1331	39
230	Chyawan Fit Sugarfree Chyawanprash - Natural Immunity Booster	Baidyanath Chyawan-Fit, the Sugarfree Chyawanprash is an excellent tonic for people with high blood sugar. It is specially formulated, as it is free from any added sugar. Every teaspoon of Baidyanath Sugarfree Chyawan-Fit contains the natural goodness of Almonds, Ashwagandha and Amla, a rich source of vitamin C, minerals & potent herbal nutrients essential to boost the body’s immunity & metabolic activity. Baidyanath Chyawanfit Sugarfree contains the rejuvenating goodness of herbs and acts as immunomodulatory. It is a mind and body rejuvenator, enriched with Vitamin – C, and Calcium.	225.00	3	2018-08-11 00:00:00	\N	2114	19
231	Morning Dew Perfumed Talc 250 g + English Lavender Perfumed Talc 250 g	Yardley Morning Dew exudes freshness that lingers from morning through the day. This is a fine, silky luxury talcum powder. Embrace the vibrant and musky fragrance of white flowers like lily and lotus. This luxurious talcum powder will keep you fresh, smooth, and scented throughout the day.It takes the world's finest natural lavender oils and over 200 years' expertise to create Yardley English Lavender. This is a fine, silky luxury talcum powder and will leave your skin feeling soft and subtly fragrant all day. This luxurious talcum powder will keep you fresh, smooth, and scented throughout the day.	329.80	45	2019-10-12 00:00:00	\N	1023	10
232	Energy Bars - Nutty, 4+ Years, 100% Natural & Healthy	Timios Nutty Energy Bars are made from 100% natural and real fruits with the wholesome and goodness of a wide variety of nuts and dried fruits which are loaded and packed with antioxidants and various other essential nutrients that are ideal for the development of cognition and other physical attributes in your little one. This product does not contain processed sugar, artificial colours, added flavour and added preservatives.	140.00	1	2019-10-10 00:00:00	\N	1868	10
233	Banana Stem - Diced	We have reduced your time and effort with this pack of fresho diced banana stems which makes a quick and healthy meal, and are neatly cleaned and packed. Banana Stem is the fibrous stalk of the banana plant. It has high water content, fresh and crispy textured stalks with a mild taste. Fresho stem grade bananas are offered in a pristine condition and are tasty and nutritious.	32.00	78	2020-09-09 00:00:00	\N	2027	19
234	Chilli Flakes	Set your taste buds on a rollercoaster ride as you add a dash to your gourmet salads, pizzas and pastas. Throw in a pinch to liven up your salsa too. Go ahead, experiment and explore.	99.00	100	2020-08-09 00:00:00	\N	984	13
235	Bite & Sip Flask And Lunch Box/Tiffin Box - Green Colour	Asian Bite & Sip Combo Pack includes a lunch box and a flask. Their outside wall made by food-grade plastic and inner material includes steel. The lunch box keeps food warm, made from high quality of stainless steel and the bottle double-walled 18/8 stainless steel Premium Thermos Flask which keeps drinking hot for 12 hours and cold for 24 h. Inset consists of natural high-grade steel with a smooth surface hygienic and easy to clean. It is made from high-quality 304-grade stainless steel. It carries conveniently hot or cold beverages. Have cold water all day long, on-the-go, even in the most peak summers. Carry coffee or tea when travelling.	319.00	53	2018-01-08 00:00:00	\N	659	15
236	Namkeen - Khara Boondi	Tasties Namkeens are a range of traditional indian savories that are authentic, crispy, and deliciously mouth watering. If you are looking for a quick snack to compliment your evening tea, or a spicy bite to accompany your food, Tasties Namkeen is the perfect fun-food that will leave you craving for more!	49.00	26	2020-05-06 00:00:00	\N	796	16
237	Raw Seeds - Sunflower Pumpkin Flax Seeds	True Elements brings to you Raw Sunflower Pumpkin Flax Seeds that are loaded with health benefits and nutrients. It is perfectly crunchy and is 100% natural and high-quality. These seeds are raw to get maximum health benefits. This combination of seeds contains vitamins, minerals, essential amino acids, antioxidants, fatty acids, etc. that are important for your health. It is a great mid-meal snack, sprinkled over breakfast, soups or can be ground into a powder and added to food.\nBenefits:\n1. It is loaded with many health benefits and nutrients.\n2. It is a great healthy snack or meal option.\n3. It contains vitamins, minerals, essential amino acids, antioxidants and fatty acids.\n4. It is 100% natural and made of high-quality.	166.00	86	2019-07-09 00:00:00	\N	911	6
238	Garnet LED White Bulb - 14 Watt, Cool Day, B22	This high brightness LED comes an efficacy up to 100lm/W. It has wide coverage with a 240-degree beam angle. It comes with an aluminium heat sink for better heat dissipation. It is LM 80 tested with SMD LED Technology. It can take high voltage fluctuation with up to 380VAC and surge protection up to 2.5KV. These bulbs are suitable for commercial and industrial appliances. It comes with diffuser optics for a glare-free light which is safe for eyes.	199.00	41	2019-02-07 00:00:00	\N	1579	21
239	Tempeh Cubes - Simply Sriracha Soyabean	Get your protein and spice fix all at once with Simply Sriracha Tempayy. Whip up stir fries and lettuce wraps with complete ease or just munch on these with complete abandon. Created by the magic of fermenting soyabeans with zero preservatives, it is packed with protein and fibre, low in carbs and easy to digest.	135.00	17	2020-01-10 00:00:00	\N	808	19
241	Fresh Catch Fish Fingers	You can’t beat the classics. Perfectly crispy and exceptionally dippable, our Crunchy Fish Fingers are always delicious, making them the perfect intro for any get-together of family and friends.	240.00	21	2019-12-04 00:00:00	\N	319	15
242	Sour Cream & Onion	Tired of potato chips and nachos? We have found the perfect snack for your munchies! Appitas Olive Twist Pita Chips are baked, multigrain pita chips loaded with the zest of olives but yet remain low in carbs and fat so you do not need to worry about cheating on your diet whenever you feel like having a midnight snack. These chips are the perfect party snack to serve with any dips and are delicious enough that you can eat the entire packet on their own! So what are you waiting for? Try them!	95.00	58	2022-07-01 00:00:00	\N	1384	20
243	Xylitol Powder	So Sweet Stevia Xylitol is made of 100% natural Zero calorie sweetener and in the best and healthiest alternative to sugar and artificial sweeteners in your daily life ( Zindagi ). No calories, no carbohydrates, and no artificial ingredients. Non-glycemic response, no bitterness, no aftertaste. Verified NON-GMO Product. Zero Glycemic Index, safe for diabetics. Smooth taste, Sweet taste, Kosher Certified extract used. 100% natural extraction process of sweetener. Extraction is done, using only water.	350.00	90	2019-02-09 00:00:00	\N	27	32
244	Glass Amaze Air Tight Jar - Pink	These glass Jars are beautiful looking with its fabulous printed design, made with good quality. These jars are made air tight to keep food articles fresh for longer period, these are also extra strong, freezer safe, food grade, moisture resistant, scratch resistant with no sharp edges & no wobbling. These glass jars are ideal for storing snacks, nuts, spices & other food articles.	289.00	7	2021-10-03 00:00:00	\N	1706	10
245	Sixer Biscuits - Salted	Parle Sixer Salted is offering a Salty and delicious snack range with small yet filled with flavour pieces of salty biscuits. It has high nutritional value and quiets a hit among the tea time brunches.	60.00	64	2018-03-04 00:00:00	\N	1024	13
246	Gokshuradi Guggulu - Urinary Disorders, 500mg	Gokshuradi Guggulu is effective in Renal Colic and Urinary Disorders, Dysuria. It is useful in Calculus, Gout, Leucorrhoea and spermatic disorders.Acts as an anti-lithiatic, anti-inflammatory, anti-arthritis, anti-hypertensive, anti-gout, analgesic, muscle relaxant and adaptogenicHelps to maintain a healthy metabolismRemove toxins from the system and supports a healthy urinary systemAlso used in the treatment of gall bladder disorder, Kidney disease, corpulence (obesity) and skin disorders	80.00	75	2018-09-11 00:00:00	\N	12	9
247	Peach Shine Lip Care	Moisturizes your lips to keep them soft and supple. Shine with Himalaya Herbals naturally glossy Peach Shine Lip Care. Our luxurious lip balm moisturizes your lips to keep them soft and supple. The moisture-retention formula with skin soothers makes your lips naturally glossy while the antioxidants and natural actives care for your lips by protecting them from environmental damage. Enriched with 100% natural colour, Vitamin E and antioxidants, Peach Shine Lip Care is free from preservatives, petroleum jelly, mineral oil and silicone. Not tested on animals.	112.50	21	2022-05-05 00:00:00	\N	2097	31
248	Skincare Hand Wash Refill	Be 100% sure to protect your skin from 100 illness-causing germs and bacteria. Use Dettol's Skincare Germ Protection Handwash Liquid Soap pH balanced formula every day and keep your hands hygienically clean and refreshed. This hand wash provides a soft and rich lather, leaving behind clean hands and fragrance. The trusted germ-protection modus operandi acts like a barrier between your hands and a wide range of unseen germs. The soap-free formula with glycerin makes sure to keep your skin moisturised, while the plant-derived cleansers help ensure thorough cleaning.\nDettol handwash also contains more than 85% naturally derived ingredients with no TCC & Triclosan, giving another healthy reason for handwashing whenever in need. Wash hands properly with Dettol and helps keep your family healthy! Safety Information: Keep out of reach of children unless under adult supervision. Avoid direct contact with eyes. For external use. In case of contact with eyes, rinse immediately with plenty of water. If persistent irritation occurs, seek medical attention.	218.00	11	2020-09-03 00:00:00	\N	1876	3
249	4mm Aluminium Induction Base Chapati Roti Tawa - Silver	Hazel Aluminium Tawa has an ergonomic design for ease of use. It features an ergonomic handle for easy function. This Induction Base Tawa is highly durable and is made of fine quality material making it long-lasting. It is easy to clean and wash. It is highly durable and has a comfortable handle making it easy to carry. It ensures even heat distribution and fast cooking. It is used to make chapatti, roti, paratha, etc.	649.00	35	2021-05-12 00:00:00	\N	2288	30
250	Mix - Rava Idli	Rava idly is a trendy breakfast recipe and is consumed either during breakfast or evening snack time. GRB's flavor enhancers like Cashew nuts are included in the Rava idly. It mixes well with valid traditional coconut chutney.	110.00	34	2020-01-10 00:00:00	\N	253	35
251	Impress Concentrated Perfume Free From Alcohol For Male	A hot new flame for men. A burning passion, sizzling chemistry, hearts on fire, pulses set alight and a man who blazes a trail where women follow. Just some of the benefits of the spicy and sizzling fragrance of spark!	300.00	58	2021-09-11 00:00:00	\N	1733	10
252	Skin Awakening Rinse	Specially formulated by kaya dermatologists, skin awakening rinse is a multi-vitamin shimmering cleanser that is designed to wash away make-up and impurities without altering skins natural moisture balance.	432.00	3	2019-08-01 00:00:00	\N	317	17
253	Pacific Steel Insulated Vacuum Flask	BB Home Vacuum insulated double wall flasks are optimal for storing hot or cold liquids for long periods. Suitable for storing liquids only. Complete stainless steel body Vacuum insulated flask. Ergonomic design for easy maintenance, handling and reducing discomfort. 100% leaf proof, stain-free, odour free, this is made from food-grade stainless steel. Carbonated or aerated liquids must be avoided, as it may cause damage to the product. These are very high-quality steel vacuum flask with aluminium foil between the walls to maintain temperature for 12 hours for hot and cold liquids. Electropolished interiors for resisting steel corrosion which is not available in many branded flasks in the market. Why spend more money on pricey branded flasks, when you get the same finest quality flask at cheaper rates here.	609.00	67	2020-03-11 00:00:00	\N	1331	21
270	Perfume - Youth Dew EDP Spray	Top notes are aldehydes, orange, spices, peach, bergamot, narcissus and lavender; middle notes are cinnamon, cassia, orchid, jasmine, cloves, ylang-ylang, rose, lily-of-the-valley and spicy notes; base notes are tolu balsam, peru balsam, amber, patchouli, musk, vanilla, oakmoss, vetiver and incense. Fragrance Type- Oriental Spicy  For Beauty tips, tricks & more visit https://bigbasket.blog/	3500.00	54	2019-04-03 00:00:00	\N	1053	4
254	Regenerist - Advanced Anti-Ageing Revitalising Hydration Skin Cream Moisturizer SPF 15	Olay Regenerist offers advanced appearance correcting anti aging skin care products that help regenerate skins appearance without drastic measures. Formulated with an exclusive Olay amino-peptide + B3 complex, Regenerist incorporates other proven anti-aging ingredients such as vitamin E, pro-vitamin B5, green tea extract, allantoin, and glycerin. Olay Regenerist renews skins outer layer one cell at a time, helps regenerate its appearance quickly and strengthens its moisture barrier.	1049.25	9	2021-07-05 00:00:00	\N	1378	26
255	Cotton Swabs	Keep yourself groomed and hygienic as you use these cotton earbuds. The earbuds are composed using cotton to offer a smooth and soft experience to the user. The cotton swabs protect your eardrum and let you clean off the dirt with much ease and care.	39.00	85	2021-10-10 00:00:00	\N	344	24
256	Tropical Fruit Pudding - Lychee, Mango, Strawberry Flavoured	Translucent cubes chewy, jelly sweetened and flavored pudding	63.75	84	2018-07-05 00:00:00	\N	676	21
257	Pippali Fruit Powder - Supports Healthy Digestive & Immune System	Pippali, Pimpali or Piper Longum (Latin, linn) is an indigenous plant to North- eastern & southern india and Ceylon, cultivated in Eastern Bengal. Pippali is the term applied to the fruit of piper longum. Pippali is a powerful Rejuvenating herb that strengthens and nourishes the body. Piper Longum is useful in various ailments especially of respiratory tract, digestive system, genital system, Skin, Liver & spleen. As per Ayurvedic textual reference Pippali is better for Vitiated Vatta, Kapha of the body & is hot, pungent in quality. From ancient time Pippali Powder when taken with honey is found useful for removing extra phlegm, relieve cough & cold, sore throat & hiccups. Ayurveda also mentions utility of Pippali Powder with Jaggery (twice in quantity) - useful in loss of appetite, indigestion, chronic fever, anaemic conditions and intestinal worms. Various basic formulations are made using Pippali as important ingredient in Ayurveda, which are used in stomach problems like flatulency, colic, indigestion, fullness etc. \nScientific study shows presence of Piperlongumine & other useful alkaloids in Pippali which has various beneficial actions like stopping excessive cell growth, as an antioxidant, relieving from chronic bronchitis & bacterial infections of lungs. Piper longum has also shown promising action in Joint inflammations as pain reducer and anti-rheumatic agent. \nExternally - oil containing Pippali and ginger is applied in sciatica & paraplegia as rubefacient and pain reducer.	595.00	6	2021-07-03 00:00:00	\N	803	27
258	Salt & Peeper Shaker Masala Dabbi With Window	A masala box (or masala dabbi, dabbe, or dabba) is a popular spice storage container widely used in Indian kitchens.	89.00	45	2022-04-08 00:00:00	\N	1722	29
259	Organic - Triphala Powder	Helps in digestion, improves blood circulation, helps in weight loss, regulates blodd pressure.	94.05	24	2019-07-10 00:00:00	\N	1061	19
260	Aeda Glycerine Bathing Bar - Natural Green	Protect the skin from environmental damages and act as anti-ageing agent.  For Beauty tips, tricks & more visit https://bigbasket.blog/	35.00	0	2019-09-02 00:00:00	\N	1226	8
261	Chicken Cocktail Sausage	Chicken Cocktail Sausage is made with premium ingredients, giving you the perfect blend of flavours. Easy to cook, this is a perfect option to tame your hunger pangs. Indulge in some premium taste with Fresho.	171.60	94	2021-02-10 00:00:00	\N	2027	39
262	Sun Expert Fairnes Sunscren Lotion SPF 30 PA++	SPF 30 is a measure of protection for the skin from UVB rays and broad spectrum UV protection, Keeps your skin looking fresh and oil-free, PA+ is a measure of protection for the skin from the harmful UVA rays, Helps lighten your skin tone on regular usage.  For Beauty tips, tricks & more visit https://bigbasket.blog/	385.00	1	2020-01-09 00:00:00	\N	539	25
263	Cotton Pads	Cotton pads are pads made of cotton  For Beauty tips, tricks & more visit https://bigbasket.blog/	80.00	60	2020-08-04 00:00:00	\N	1350	36
264	Ashwagandha Powder	Reap the benefits of a rejuvenating tonic and an anti-inflammatory agent in Nutriwish Ashwagandha Powder. Known as one of the most powerful herbs in Ayurvedic healing, Nutriwish Ashwagandha Powder helps to assist the body to adapt to the negative effects of chronic stress by increasing energy, strength, and stamina. Make the most of this Indian ginseng, by having a beverage that contains a teaspoon of powdered ashwagandha before bedtime.	400.00	95	2020-02-11 00:00:00	\N	868	37
265	Frozen - Mixed Vegetables	A packet of Safal frozen mixed vegetables is what you need after a hard day's work when you want to spend a minimum amount of time cooking. The vegetables are peeled and finely diced into small pieces, and they are frozen when fresh using the revolutionary individual quick freezing technique. This helps preserve the nutritional content and flavour of the vegetables.	93.50	68	2020-11-02 00:00:00	\N	1563	37
266	Masala - Kitchen	Kitchen King Masala is a perfect multi-utility blend to add taste and colour to of your gravy dishes in a very tasty. The masala Works magic even when used in Paneer Butter Masala Egg-Curry, Veg. Kofta and manyMore	29.70	45	2020-09-11 00:00:00	\N	677	12
267	Mustard/Sasive/Rai - Big	Mustards are an integral part of the kitchen spices. Used mainly for seasoning in any Indian dish. Releases a wonderful aroma making the dish taste perfect and making it look complete. Be it chutneys or dhoklas or curries, mustard seeds are a must. You can add this mustard to any Indian curry to enhance its taste. Use it with other spices as part of your spice-mix or make a paste for everyday use.	30.00	69	2020-07-08 00:00:00	\N	2281	14
268	Ayurvedic Soap	Chandrika has been the beauty secret of millions of women over the world. Today, it is one of the most trusted brands in South India, with its pure ayurvedic ingredients known to cure skin problems and give a clear and flawless skin, naturally. Made with the purest coconut oil and best of ayurvedic herbs, Chandrika is safe and effective.	230.40	91	2021-07-08 00:00:00	\N	938	2
269	Glass Matt Finish Bottle With Plastic Cap - Blue, BB1324	Keep yourself hydrated by carrying this smart-looking bottle whenever stepping out from the house. The glass body offers excellent finishing with enough durability and strength. It comes with a holder strap, which allows you to hold with much ease and convenience. This bottle can fit anywhere and is designed to slip into your office bag, purse or sports bag, as this bottle takes up minimal space.	169.00	66	2019-05-02 00:00:00	\N	2238	14
272	Organic Idly - Oats	Oats are rich in fibre and minerals. Oats is presented in a convenient form and adopted in a south Indian breakfast style. Rich in antioxidants, oats lowers the cholesterol level and improves blood sugar control. Oatmeal is very filling and it helps to lose weight. Certified organic products are only used to make this product.	125.00	1	2021-07-02 00:00:00	\N	2152	21
274	Hareli Kitchen Jar	These Pasabahce glass jars are made from high-quality glass raw material. The capacity of these jars is 635 ml each. These are airtight in nature & featured with 100% clarity, extra strong, heavy bottom, freezer safe, no sharp edges, no wobbling, odorless & also dish washer safe. These are ideal for storing snacks, pulses & other food articles.	409.00	49	2022-06-03 00:00:00	\N	562	11
275	Heavy Starch - Lemon Fresh Scent	Faultless Heavy Strach Lemon Fresh sprays on consistently with its button technology. It helps maintain your shits clean. Appear professional and fresh all the day. It makes ironing simpler and with no clogging thanks to its expert formula. It can be used on all washable garments.	285.00	33	2019-11-04 00:00:00	\N	1361	9
276	United Dreams Go Far Eau De Toilette	The new men's fragrance from the United Dreams collection is dedicated to any man who loves letting loose and living in the moment. Fresh and energetic, this perfume perfectly embodies a strong and brave attitude. Its vitality is expressed via marine and lime features that combine with hints of cardamom, lavender and lotus spices. A mix that is intensified by dashes of musk, cedarwood, and amber.	1330.00	72	2018-03-02 00:00:00	\N	1086	10
277	Ayurvedic Jamun Powder	Meghdoot's Jamun Powder is an ayurvedic remedy which helps in controlling blood sugar level. This helps in controlling diabetes and also helps in regulating carbohydrate metabolism, stomach related disorders such as indigestion and constipation can also be relieved by its use. It is made using herbal formulation that it is safe to use. It helps to manage cholesterol levels in the body.	60.00	62	2021-11-09 00:00:00	\N	458	36
278	So Soft 2 Ply Face Tissue Box	Origami presents premium imported tissues which are highly absorbent and soft. These multipurpose tissues can be used in your workplace, home and even while you are traveling. These tissues are made using virgin fiber to deliver superior quality and hygiene. They are soft and absorbent, and also made from recycled material from regenerative forest sources. So every time you use one of the tissues, you do so without impacting the environment. So go ahead and pull away!  For Beauty tips, tricks & more visitÃ‚ https://bigbasket.blog/	140.00	80	2020-08-07 00:00:00	\N	1993	35
279	Pomegranate - Single Serve, Peeled	We've eliminated the messy step of removing the peel of pomegranate.\nSavour the luscious seeds without any effort through Fresho's pomegranates.\nWith ruby color and an intense, floral, sweet-tart flavour, the pomegranate delivers both taste and beauty. \nDo not forget to check our delicious fruit recipe -  https://www.bigbasket.com/cookbook/recipes/1229/pomegranate-cooler/	34.00	70	2019-04-05 00:00:00	\N	2027	12
280	Stevia Spoonable - Powder	So Sweet Stevia Powder is made of 100% natural Zero calorie sweetener and in the best and healthiest alternative to sugar and artificial sweeteners. So Sweet Stevia Powder can be used in beverages or can be used for cooking, boiling or baking.  It contains no calories, no carbohydrates, no artificial ingredients and it doesn't have bitterness or aftertaste. It is a verified Non-GMO product and is safe for diabetics. 100% natural extraction process of sweetener is done using only water.	320.00	9	2020-11-08 00:00:00	\N	27	10
281	Ylang Ylang Essential Oil	This Ylang ylang flower is an aphrodisiac and its flowers are strewn on the beds of Indonesian newlyweds. This Essential Oil relaxes, reduces muscle tension and is a good antidepressant and leaves you in a state of euphoria. It has been traditionally used as an aphrodisiac, and is supportive for conditions of over-excitation and temper. Used in hair preparations to promote thick and shiny hair, also to add luster to skin.	351.00	48	2021-04-12 00:00:00	\N	2151	20
282	Toor/Arhar Dal	Toor Dal is not only delicious but also has nutritional value. It contains a good amount of fiber. Toor dal is an excellent source of nutrients and plant protein, and it also contains dietary fiber. In essence, legumes are nutritional though they represent a low-fat and low-cholesterol alternative. Legumes such as toor dal provide essential nutrients, fiber and protein for vegetarians. Toor dal rich in protein, vitamins and iron is often served with rich spices over rice and Rotis.	128.00	91	2022-03-03 00:00:00	\N	30	5
283	Peristaltic Nipple - 'S' Hole	This nipple is of perfect shape and size to fit into the sucking fossa of the baby. The inner vertical lines make it collapse-resistant and the textured surface allows the baby to latch on easily. It is 100% silicone nipple, super soft and flexible, allows natural and smooth tongue movement. The air ventilation system reduces intake of gas, which is the potential cause of colic.	99.00	40	2018-08-10 00:00:00	\N	1546	24
284	Fragrance Body Spray - Cool Blue	Cool Blue opens with oceanic cool fresh notes that shall remind you of a beach vacation, powered by a combination of spicy clove with citrusy lemon. Nice fruity heart blended with the heavy woody character helps to hold the fragrance for a long time on the body.For Beauty tips, tricks & more visit https://bigbasket.blog/	159.50	90	2018-02-01 00:00:00	\N	2312	10
295	Gold Flash - Mosquito Repellent Combo Machine & Refill	Goodknight Gold Flash is India’s Most Powerful Liquid Vapouriser. It consists of a mosquito repellent cartridge (refill) and clip-on electronic machine. This vapouriser system is powered by Gold Flash technology which has 2 modes - Flash and Normal Mode. Use Flash Mode when there are more mosquitoes, and Normal Mode when there are fewer mosquitoes. Visible powerful Flash vapours instantly spread across the room and drive away mosquitoes, even the hidden ones. Flash mode releases visible vapours for 30 minutes every 4 hours.	226.16	90	2020-01-01 00:00:00	\N	616	30
285	Vitamin C Brightening Peel Off Mask	St. Botanica Vitamin C Brightening Peel Off Face Mask is a luxurious blend of vitamin C and premium plant extracts for whitening and brightening your complexion. It is an effective product to detoxify the skin, nourish it and reveal clear glowing skin. The peel-off face mask helps remove the deep-seated dirt trapped in the skin pores. By unclogging the pores, it helps your skin to breath and diminishes breakouts. Vitamins and bioactive constituents of the plant extracts penetrate the skin and nourish the dermis. This helps decrease excess melanin synthesis and gives your skin a lighter appearance. The nutrient-rich face mask also helps in firming the skin. Multiple Benefits of Vitamin C: Vitamin C is blessed with multiple skin-friendly properties. It’s a powerful antioxidant for neutralizing free radicals that damage the skin cells. Its anti-ageing effect, an obvious outshoot of its antioxidant property, helps restore the youthful texture and tone of the skin. For restoring your natural complexion you need vitamin C. It helps lightens dark spots and fades blemishes. Skin nurtured by this amazing nutrient boasts of a flawless complexion. Skin Detoxification: Multani mitti, the base ingredient of the face mask, is a powerful absorbent. It draws out toxins, impurities and microbes from the skin and leaves your skin feeling squeaky clean and refreshed. Hydrated & Soft Skin: The peel-off face mask absorbs excess oil from the skin without disrupting your skin’s oil balance. It contains hyaluronic acid, your skin’s natural humectant. The high concentration of hyaluronic acid in the dermis gives your skin the plumped up appearance. Light Radiant Complexion: Orange and lemon peel extracts infused in the face mask supports fair spotless complexion. Liquorice helps in lightening the skin tone. Turmeric boosts your skin’s radiance. Cucumber has a soothing effect on the skin. Green tea extract is loaded with antioxidants that protect the skin from free radicals and maintains your naturally glowing complexion. Vitamin C for a clear, even, radiant complexion. Removes impurities and absorbs excess oil.	499.00	5	2019-03-11 00:00:00	\N	654	13
286	Almond & Rose Soap Value Pack	Himalaya Almond & Rose Soap combines 10% natural actives to restore the body's water content. This non-greasy soap leaves skin feeling soft, supple and toned. Blended with all natural ingredients such as Almond Oil and Persian Rose, this body soap deeply penetrates into the skin to hydrate it completely.	131.20	38	2020-05-05 00:00:00	\N	2097	10
287	Yippee Noodles - Magic Masala	Sunfeast YiPPee! Magic Masala Noodles are sure to make for a quick, tasty and wholesome meal for your kids. Made with the finest ingredients and the goodness of real vegetables, YiPPee!'s delicious mix of Indian spices give it the much loved magical masala taste. Sunfeast YiPPee! comes packed in a unique round block, which ensures you get long, non-sticky and slurpy tasty instant noodles every time.\nRelish them as a tasty snack in the evening, as a wholesome noodle meal which has the right nutrition and a source of Calcium, Vitamin C, Iron Folic acid and Protein, or for a midnight craving munch - perfect for when you want something quick and tasty.	61.20	77	2020-06-11 00:00:00	\N	213	27
288	Fields Of Gold Organic Foxtail Millet	Foxtail Millet is traditionally grown food and a storehouse of nutrition – their resilience makes them organic by nature. This is one of the healthiest food options. Rich in high nutritious value, it is good for health.	90.00	72	2020-07-08 00:00:00	\N	1344	11
289	Arrabbiata Tomato Pasta Sauce With Chilli		325.00	29	2018-12-05 00:00:00	\N	585	9
290	Wood - Centre Filled Bar Infused With Dark Mousse, Cinnamon & Coffee	Experience a unique woody chocolate taste as you bite into delectable dark chocolate shells to discover dark mousse infused with cinnamon and coffee. Handcrafted by Master Chocolatiers, Fabelle Wood has been inspired by the mystical element of nature – Wood. Created with premium ingredients in India, where high-quality cocoa meets premium ingredients – cinnamon and coffee. Relax and unwind as you indulge in this luxurious center-filled dark chocolate bar.\nThe richness of this dark chocolate bar is only elevated with a punch of coffee and spiciness of cinnamon. It evokes a multi-sensorial experience as it teases you with its rich aroma, smooth texture and indulgent taste before hitting you with woody and intense taste. A perfect cure for Monday blues or a mid-day or post-dinner indulgence. Whenever the mood strikes, irrespective of the time and day, this center-filled luxury chocolate will lift your spirits.\nFabelle Launched in April 2016. It has redefined the way the country experiences chocolates. It’s unique offerings in the luxury and premium chocolate segment, is quite unlike anything that’s available in the market today. Its luxurious range of chocolates are Made in India after sourcing the finest single-origin cacaos from Africa and Latin America and blending it with exotic ingredients.	350.00	39	2020-10-03 00:00:00	\N	850	34
291	Basil Seed Drink - Orange	This refreshing and healthy Basil seed drink is the perfect, healthy drink to quench thirst. Basil seeds are known for their health benefits, which includes, reducing stress, cooling the body and facilitating digestion. The drink can also be enjoyed as an accompaniment for snacks, or as a flavourful thirst quencher.	84.15	61	2020-02-12 00:00:00	\N	2106	24
292	Solution Anti Blackhead/Whitehead Masksheet (Pack of 10)	This basic mask sheet line that provides an honest solution to solve skin troubles, The Solution Pore Care Face Mask by Faceshop is your ultimate beauty saviour! This face mask features a light-as-air sheet that feels soft and weightless on skin. The serum containing ingredients that provide pore care properties that help achieve a stunning texture. Bye bye, bad skin! It is enriched with rich essentials to help achieve smooth and healthy skin. This product is dermatologically tested and created to give you a gorgeous Korean beauty experience. Beauty treasure for millions around the globe, Faceshop is a South-Korea based skincare line that provides fabulous goodies for your beauty rituals. Ranging affordable high-quality products born from botany, this sensational brand believes in creating products that stem from a lovely concept of Science meets Beauty. In a nutshell, Faceshop is your ultimate dream destination to treat your skin to its best beautiful.This basic mask sheet line that provides an honest solution to solve skin troubles. The Solution Firming Face Mask by Faceshop is your ultimate beauty saviour! This face mask features a light-as-air sheet that feels soft and weightless on skin. The serum containing Ceramides provides a moisturizing solution to dry, rough skin. Bye bye, bad skin! It is enriched with rich essentials to help achieve smooth and healthy skin. This product is dermatologically tested and created to give you a gorgeous Korean beauty experience. Beauty treasure for millions around the globe, Faceshop is a South-Korea based skincare line that provides fabulous goodies for your beauty rituals. Ranging affordable high-quality products born from botany, this sensational brand believes in creating products that stem from a lovely concept of Science meets Beauty. In a nutshell, Faceshop is your ultimate dream destination to treat your skin to its best beautiful.This basic mask sheet line that provides an honest solution to solve skin troubles, The Solution Nourishing Face Mask by Faceshop is your ultimate beauty saviour! This face mask features a light-as-air sheet that feels soft and weightless on skin. The serum containing Ceramides provides a moisturizing solution to dry, rough skin. Bye bye, bad skin! Enriched with rich essentials to help achieve smooth and healthy skin. This product is dermatologically tested and created to give you a gorgeous Korean beauty experience. Beauty treasure for millions around the globe, Faceshop is a South-Korea based skincare line that provides fabulous goodies for your beauty rituals. Ranging affordable high-quality products born from botany, this sensational brand believes in creating products that stem from a lovely concept of Science meets Beauty. In a nutshell, Faceshop is your ultimate dream destination to treat your skin to its best beautiful.This basic mask sheet line that provides an honest solution to solve skin troubles, The Solution Soothing Face Mask by Faceshop is your ultimate beauty saviour! This face mask features a light-as-air sheet that feels soft and weightless on skin. The serum containing ingredients that provide pore care properties that help achieve a stunning texture. Bye bye, bad skin! It is enriched with rich essentials to help achieve smooth and healthy skin. This product is dermatologically tested and created to give you a gorgeous Korean beauty experience. Beauty treasure for millions around the globe, Faceshop is a South-Korea based skincare line that provides fabulous goodies for your beauty rituals. Ranging affordable high-quality products born from botany, this sensational brand believes in creating products that stem from a lovely concept of Science meets Beauty. In a nutshell, Faceshop is your ultimate dream destination to treat your skin to its best beautiful.This Face Shop soothing jelly essence mask gently soothes fatigued and irritated skin after a hot summer day. This refreshing mask sheet with jelly essence provides an excellent cooling effect and tightens pores. The jelly essence absorbs into skin with no sticky residue to provide a long cooling effect. The face shop soothing jelly mask pore care intense moisture mask sheet is made with 100% peppermint fiber and the natural plant-derived sheet clings comfortably to the skin, soothes skin with moisture and provides a long-lasting cooling sensation.	900.00	17	2019-02-02 00:00:00	\N	91	8
293	Acno Fight Pimple Clearing Gel	Garnier Men Pimple Clearing Pen is an S.O.S pimple product that fights pimple-causing bacteria and has a lightweight gel formula.  Garnier Men is India's No. 1 Men's Face Wash Brand.	104.30	83	2020-03-08 00:00:00	\N	423	27
294	Pork Classic Salami	At La Carne, we take pride in offering products of high quality. La Carne brings to you the authentic taste of premium Imported Pork Products. Quick Freezing technology used to preserve all the goodness and freshness inside. Made with best of European Pork meat, which is lean with low fat. Pork Salami is the mildly flavoured and integral part of any breakfast.	191.25	5	2020-02-08 00:00:00	\N	2066	35
296	Stainless Steel Airtight Storage Container - SL-1401	Stainless Steel Special Airtight Containers uses silicon which keeps food items fresh longer and has all 4 sides locks to prevent spills. It is ideal to carry meals/fruits or any food items to work, travel, school, college outing etc.	209.00	55	2020-05-09 00:00:00	\N	1804	38
297	Organic Idly Podi - Ginger	This is a Ginger flavour Idly Podi that can be had with Idli, Dosa or Adai/Cheela. Ginger helps in digestion. It contains gingerol, a substance with medicinal properties, that can treat many forms of nausea. The anti-inflammatory effects of ginger can help with osteoarthritis, treat chronic indigestion and help fight infections. Certified organic products are only used.	75.00	40	2021-06-07 00:00:00	\N	2152	40
298	Whisky Cocktail Mixers - 100% Natural	Swa Artisanal Syrups Lychee Lemon Syrup - Makes 8-10 Drinks 250 ml +Swa Artisanal Syrups Orange Mint Syrup - Makes 8-10 Drinks 250 ml + Swa Artisanal Syrups Passion Fruit Tea Syrup - Makes 8-10 Drinks 250 ml + Swa Artisanal Syrups Pineapple Bird's Eye Chili Syrup - Makes 8-10 Drinks 250 ml\n100% Natural Syrups. Make easy mocktails, cocktails, iced teas, craft coffees or drizzle over your pancakes or yoghurt. Made with Real Fruits, Herbs and Spices. No added preservatives, colours or artificial flavours. Swa Artisanal Syrups are hand-crafted by women. 250 ml syrups are shipped in sustainable Glass bottles. Each 250 ml syrup bottle makes 8-10 mocktails or 12-15 cocktails. Thus each glass of a complex restaurant-style cocktail will cost only Rs 30! Shelf life is 4 months unopened from Mfg date, refrigerate after opening and use within a month.\nFor recipe ideas please visit www.drinkswa.com/recipes \nA delicious signature blend, Lychee Lemon, is the crown of Summer. Our Lychees do come from Muzaffarpur, and we have the pulp frozen and stored for a year so that this syrup can be made accessible all year round. If food technology has developed, we should make use of it. No need to rely on preservatives, which we know for a fact, are harmful to our bodies. 100% Natural Syrups. Make easy mocktails, cocktails, iced teas, craft coffees or drizzle over your pancakes or yoghurt. Made with Real Fruits, Herbs and Spices. No added preservatives, colours or artificial flavours. Swa Artisanal Syrups are hand-crafted by women. 250 ml syrups are shipped in sustainable Glass bottles. Each 250 ml syrup bottle makes 8-10 mocktails or 12-15 cocktails. Thus each glass of a complex restaurant-style cocktail will cost only Rs 30! Shelf life is 4 months unopened from Mfg date, refrigerate after opening and use within a month.\nFor recipe ideas please visit www.drinkswa.com/recipes \nKids love this one. These are especially amazing as they are Indian Oranges grown widely in Rajasthan, bursting with robust flavour. We evaporate the orange juice in a vacuum for minimal loss of nutrients and flavour. We use Orange Juice, some mint, lemon juice and sugar to get this perfectly balanced, natural Swa Orange Mint Syrup syrup to you. 100% Natural Syrups. Make easy mocktails, cocktails, iced teas, craft coffees or drizzle over your pancakes or yoghurt. Made with Real Fruits, Herbs and Spices. No added preservatives, colours or artificial flavours. Swa Artisanal Syrups are hand-crafted by women. 250 ml syrups are shipped in sustainable Glass bottles. Each 250 ml syrup bottle makes 8-10 mocktails or 12-15 cocktails. Thus each glass of a complex restaurant-style cocktail will cost only Rs 30! Shelf life is 4 months unopened from Mfg date, refrigerate after opening and use within a month.\nFor recipe ideas please visit www.drinkswa.com/recipes \nA perfect balance of Assam and Darjeeling tea blend, brewed to perfection. Has just the right bitter notes from the tannins. Passionfruit is from Coorg/Malnad, Kerala depending upon the season. 100% Natural Syrups. Make easy mocktails, cocktails, iced teas, craft coffees or drizzle over your pancakes or yoghurt. Made with Real Fruits, Herbs and Spices. No added preservatives, colours or artificial flavours.\nSwa Artisanal Syrups are hand-crafted by women. 250 ml syrups are shipped in sustainable Glass bottles. Each 250 ml syrup bottle makes 8-10 mocktails or 12-15 cocktails. Thus each glass of a complex restaurant-style cocktail will cost only Rs 30! Shelf life is 4 months unopened from Mfg date, refrigerate after opening and use within a month.\nFor recipe ideas please visit www.drinkswa.com/recipes \nPineapple Bird’s eye chilli will uplift anybody's spirit. It’s perfectly balanced for all the flavours to come through and shine. There is something about Pineapple that is so universal that it becomes an instant hit. This is one fruit that has been used and abused, and no matter how you treat it, it still perks up any dish it touches. The sweet, tart and astringency of pineapple need a touch of spice to balance it out, leaving you a near-perfect combo to write home about.	1200.00	45	2020-11-04 00:00:00	\N	293	17
744	Frappuccino - Coffee	Frappuccino - Coffee is creamy, rich taste of coffee and it gently, savouring each and every heavenly sip. It is made a comprehensive list of every single flavour offered to date. The coffee meets milk and ice in a blender for a rumble and tumble and together.	350.00	74	2022-04-05 00:00:00	\N	2221	21
299	Family Sunscreen Lotion SPF 25	Family Sunscreen SPF 25 is an innovative sun protection lotion for the entire family {safe for kids too} with a cream base that protects with advanced broad spectrum. It provides an ultra-light and non-shiny finish.It is non-comedogenic, non-irritant, water resistant and can be used as a base before makeup. It contains the goodness of Aloe Vera - that is a natural UV inhibitor with a hydrating effect, Benzophenone 3 - provides UVB protection, Carrot extracts - an anti-inflammatory that soothes chapped and uncomfortable skin, retains moisture in the skin, Ethylexyl Methoxycinnamate - provides protection from UVB rays, Butyl Mehoxydibenzalemethane - protects from UVA rays, Honey - an anti-oxidant that protects from sun damage, Liquorice - prevents tan and brings fairness, Sandalwood - anti-inflammatory and natural sunscreen.	273.00	1	2020-12-06 00:00:00	\N	1589	28
300	Japanese Cooking Rice-Wine	Urban Platter Japanese Cooking Rice-Wine, 500ml [all natural & traditional cooking rice wine seasoning] contains water, rice, corn syrup, alcohol, rice koji. It adds sheen to foods. It is made from short-grain rice and glutinous rice, and then sweetened. Urban Platter - simply good food	475.00	54	2018-07-11 00:00:00	\N	1107	6
301	Coated Green Peas - Wasabi	The Wasabi Coated Green Peas has a smooth & delicate flavours that will make you come back for more. They are generously coated in a flavoursome batter, an added bonus to an already addictive snack. When you're hungry and in a hurry, reach for one of these quick, easy and nutritious snack. The product is highly rich in fibre and proteins. It is also 100% vegeterian and cholestrol free which makes it a super healthy snack to munch on at any time of the day! It is also made with premium quality ingredients so that you dont have to compromise with taste and quality.	93.50	14	2020-07-05 00:00:00	\N	1528	31
302	Charminar Basmati Rice/Basmati Akki - Select	Charminar Select Basmati Rice is a tribute to the rich flavours of Nizami cuisine. Its long and delicate grains are processed with the expertise to preserve their distinct aroma and exceptional flavour ensuring that every dish you cook has the touch of royalty. So, go ahead and make something that will be remembered forever.	399.00	77	2019-06-06 00:00:00	\N	290	35
303	Hide & Seek Choco Rolls	First of its kind chocolate chip cookies in India, Hide & Seek was launched in 1996 - best known today for its rich chocolaty experience. Available in Chocolate chip and Caffe Mocha flavours.	37.50	40	2021-08-07 00:00:00	\N	1024	17
304	Hair Fall Control Kit - Oil, Shampoo & Serum	Dr Batra’s Hair Fall Control Kit contains products that prevent hair fall and strengthen roots resulting in thicker, stronger and fuller Hair. Dr Batra’s Hair Fall Control Kit contains Hairfall Control Oil, Hairfall Control Shampoo and Hair fall control Serum.	630.00	80	2020-06-09 00:00:00	\N	702	15
305	Anti-Acne Face Cleanser - With Salyclic Acid, For Oily Skin	A deep cleansing formulation with anti-bacterial properties for complete and balanced skincare for acne-prone skin. Removes dust, pollution and excess oil without leaving your skin dry. Contains Salicylic acid, Vitamin C, Enriched Pea protein, Acai extracts and Wheat protein. Paraben and Sulphate free.	236.00	22	2019-06-01 00:00:00	\N	2245	4
306	Gluten-Free Moong Dal Cheela/Dosa Mix	Graminway Protein Daal Cheela is a power-packed cheela made of healthy moong dal and flavoured with natural spices. At Graminway, we believe that everyone deserves to live a full and healthy life. The intake of our food supplements will provide a good foundation for a healthy lifestyle. We are committed to providing the highest quality products at an affordable price. We are a company with a purpose beyond profit and want to make a lasting difference in the World. We aim to provide clean, natural, and healthy products without compromising on the flavours and taste. We produce them in small batches, which helps maintain freshness and preserve the ingredient texture. By not stockpiling, each product is as fresh as possible when it reaches your doorstep.	259.00	73	2021-09-11 00:00:00	\N	1833	36
307	Milk Boiler - Aluminium	This milk pan is ideal for heating milk and making tea. The sleek pan is highly durable and is easy to cook and clean. So go grab this cookware to make your cooking an easy fun job. It helps you keep your food tasty yet healthy.	549.00	95	2020-04-05 00:00:00	\N	877	2
308	Green Tea - Pure, Bio-Degradable	A selection of carefully crafted, finely balanced pure Ceylon artisan tea blends, Tealia provides customers with the highest quality of natural Ceylon green tea.	297.00	74	2021-04-01 00:00:00	\N	815	30
309	Cube Storage Glass Jar	Treo by Milton is synonymous with elegant and utilitarian glassware, handpicked from the finest furnaces in the world. Created with the perfect cuts to suit Indian tastes, these glass items are made to keep your guests talking while being functional additions to your home. These square-shaped jars from Treo by Milton allow you to store any item for kitchen use. This transparent jar from Treo by Milton offers you a direct and unobstructed view of what it holds inside. The clarity of the glass makes it look appealing as well. The unique square shape of the compact jar allows you to store it conveniently on any shelf without wasting any space. You can easily pack multiple units on a single shelf to utilise every corner. The threaded lid allows a secure closure that is resistant to leakage. The steel-finish framing around the lid offers a classy look. These jars from Treo by Milton sport a unique lid design that has a see-through top. This functional design allows one to view the content of the jar from above. These airtight, leak-proof jars allow you to store all your kitchen items safely. These jars are ideal for storing spices, nuts, pickles, and more. The glass surface can easily be labelled with a sticker. Treo by Milton is synonymous with elegant and utilitarian glassware, handpicked from the finest furnaces in the world. Created with the perfect cuts to suit Indian tastes, these glass items are made to keep your guests talking while being functional additions to your home. Treo has the largest assortment of storage products for all needs. We have everything from stylish bottles in various shapes to suit your style to a large variety of fridge containers, jars and canisters. Your kitchen and fridge will never look the same again! The glass is here to promise you to have the best time every day! Serving good food and drinks with finesse is an art befitting a connoisseur. Delight your guests and family with the largest range of dinnerware, jugs, bowl and an extraordinary range of tumblers and mugs. Live the good life everyday with the beautiful assortment of Treo serve-ware. Explore our vast range of cookware sourced from the finest furnaces across the world. From die-cast non-stick aluminium range to bakeware to 100% fire-clay cookware, we have it all and more. Cooking will never be the same again! Live the good life every day where cooking becomes a delight with the beautiful yet functional products from Treo.	249.00	17	2019-10-08 00:00:00	\N	1340	26
310	M1 Perfume Spray - For Men	Engage M1 Perfume Spray for Men. It has the fragrance of fresh citrus and spice that gives you long lasting aroma. It gives you protection against bad odour for a long time. The spray is easy to use and apply. It keeps you feeling fresh all day long. It accompanies all the occasions be it a party, a business meeting or a date. Strike an impression with this spray.	231.00	2	2021-05-10 00:00:00	\N	141	3
311	Tulsi Mulethi Green Tea	A stress-relieving tea that will leave you energized and refreshed. This immunity-boosting tea helps keep common cough and cold at bay, improves digestion and is a natural mood uplifter. Enjoy the goodness of a certified organic tea.A delightful herbal aroma and taste of warm tulsi layered with sweet notes. Licorice adds a sweet touch to the finish.	300.00	78	2020-07-05 00:00:00	\N	548	27
312	Nicer Dicer	Irich 12 in 1 Nicer Dicer made with High Grade ABS plastic material. It ideals with all kind of vegetable and fruit. It is a fastest, safest and easiest way to chop or dice fruits, vegetables & more. It is easy and very convenient to use. It is made of high quality stainless steel blade. Ideal for Potato, Onion, Carrots, Cucumber, Pineapple, Apple and many more fruits and vegetables, manual chopper. Salient Features ABS Plastic, Heavy duty & long life, Easy for fitting, Stainless Steel blade, Easy to use and clean	475.00	78	2020-03-11 00:00:00	\N	2111	15
314	Pork - Fresh Bacon, Sliced	Casanova Bacon Sliced (Fresh) is a premium-quality bacon. The lean slices of pork are cured and slowly smoked over Applewood chips for up to 24 hours. Manufactured at Spain. Packed as per Customer requirement. Not a standard pack under weights & Measurement Guidelines. Consume within 05 days from date of Packing. Store in refrigerator at or below 05 degree C in an airtight container.	360.00	53	2020-01-05 00:00:00	\N	1973	25
315	Active Salt Toothpaste Saver Pack 300g + Sensitive Soft Bristles Toothbrush 4pcs	Colgate Active Salt Toothpaste - Saver Pack 300 gColgate Active Salt is an anti-cavity toothpaste with the goodness of salt and minerals which help fight germs. Refreshing minty flavour gives fresher breath when used as directed for oral hygiene. Colgate Active Saltâ€šÂ¬â€žÂ¢s unique formula helps fight germs and provide you with healthier and cleaner teeth. Brush twice a day with Colgate Active Salt toothpaste as recommended by dentists. Colgate is Indiaâ€šÂ¬â€žÂ¢s No. 1 brand recommended by Dentists and offers unique oral hygiene solutions to ensure complete protection against germs and plague build-up.Colgate Sensitive Soft Bristles Toothbrush 4 pcsColgate Comfort Sensitive, Soft Bristles Toothbrush, with soft curved bristles, provides deep yet gentle mouth clean. The silky soft bristles for sensitive teeth and gums gently clean your mouth. It sweeps away food and plague, giving you a cleaner mouth with every brush. The compact head size reaches corners of the mouth, to provide deep clean action.Try Colgate Comfort Sensitive toothbrush and experience comfortable and effective cleaning, so you wear a confident smile every day!	149.72	13	2019-05-09 00:00:00	\N	2017	24
316	Silicone Feeding Nipple/Teat Regular Neck - Size XL	Regual Neck Nipple with anti colic valves, it is recommended for the first days of baby's life. Different flow rates are also available.	150.00	33	2019-10-07 00:00:00	\N	894	19
317	Microwaveable Plastic Multiutility Bowl - Yellow, New Coral, L2272 YL	It is made of high-quality food grade virgin plastic. These bowls come in beautiful bright colours. Store fruits, dry fruits, snacks, biscuits etc. in these bowls. These coral bowls are microwave safe, easy to clean and maintain.	29.00	94	2021-07-11 00:00:00	\N	1647	39
318	Chicken Jalapeno Cheese Nuggets	Boneless chicken meat, formed, batter-coated & breadcrumbed. Bite into these mildly spiced cheese nuggets every weekend. Enjoy it with family and friends. Whenever you have Hunger Pangs or you are planning a party you want something quick, open a pack of Meatzza Snackers. Just heat and eat.	285.00	11	2019-10-03 00:00:00	\N	95	1
319	Milk Delights Face Wash With Honey For Dry Skin	Presenting New Nivea Milk Delights Face Wash which has the goodness of milk proteins and moisturising honey. Formulated specifically for the dry skin, it gives you healthy-looking skin. It cleans the face from within making it healthy and dirt-free.	86.40	13	2020-08-06 00:00:00	\N	636	16
320	Instaglow Oxygen Bleach	Its unique gas flushing action and exclusive formula release oxygen, which thoroughly cleanse the skin, unblocking the clogged pores, thus providing an instant fairness & radiance. Pre-bleach cream conditions skin and protects skin from irritation caused by after bleaching. Vlcc Insta Glow Herbal Bleach Pack is made from all the herbal ingredients making it the best product for your skin.	63.00	51	2018-07-05 00:00:00	\N	875	30
438	School/Stationery Kit	Set of high-quality pens, mechanical pencil, marker and highlighter essential stationery kit for all student requirement. \nIdeal for gifting It Includes -\n\n1 Butterflow original,\n1 Geltech\n1 Tristar\n1 Supreme Fashion\n1 Marky and\n1 Power highlighter	49.00	74	2018-04-03 00:00:00	\N	332	1
321	Soft Drink - Lime Flavoured	Sprite is a clear lime drink truly meant to quench your thirst & refresh you since 1999. Now, do not confuse thirst with anything else under the sky! Its not your agony aunt but just a drink that refreshes you. Be it summers or winters, Sprite will always keep you refreshed. It has true feelings for your thirst. Believe it!\n\n\n\nIts crisp lemon-lime taste makes you feel like you have just stepped out of a cold shower. Clear Hai? \n\n\n\nYou can not drink this refreshing Sprite by just looking at the page so Buy Now!	38.00	71	2019-11-10 00:00:00	\N	378	5
322	Coffee Creamer - Coffee-Mate	Nescafe Coffee-mate creamer will help make your cup of coffee, even richer, smoother, and creamier to help you kick start your day on the right note. This creamer is the ideal substitute for milk, which is easy to store or carry along. The Original Rich And Deliciously Creamy Non-Dairy Creamer. Coffee-Mate Is Perfect Anytime You Want To Enjoy A Velvety-Smooth Cup Of Coffee.	425.00	48	2020-01-03 00:00:00	\N	368	31
323	Royce Premium High Quality Pedal Plastic Dustbin / Garbage Bin - Blue	Elegant looking and light-weight, it is ideal for disposal of dry and wet garbage. Its smooth pedal ensures hands-free use, easy to clean and wash.	219.00	37	2020-09-04 00:00:00	\N	1776	22
324	Khaas Shampoo Bar - Heena Amla	Easy to use a bar with conditioner with zero waste and no non-sense, no sulphates, parabens and no plastic packaging. Unlike commercially made soaps, our soaps are passionately handcrafted with natural ingredients chunks of goodness that your scalp & hair would absolutely love & want more! Along with beautiful hair, these handmade soaps leave you with a sense of pride. Amla: Strengthens hair, prevents premature greying, controls dandruff.\n\nHeena: Deep conditioner, moisturises, enhance shine and makes hair silky.\nCoconut cream- Good hair conditioner making hair manageable.\nAloe vera: Controls dandruff	295.00	12	2021-01-03 00:00:00	\N	997	16
325	Bubble Glass	This glass is 20% more resistant and is ideal for drinking water, juice, cold-drinks, whisky etc. Durobor glasses are made in Belgium and are handblown glasses.	789.00	67	2019-11-08 00:00:00	\N	1896	17
326	Dazzle Livid Lilac Dinner Set - White	Tableware that is infused with beauty and strength, charming dishes, gaily patterned in colourful new designs serve every purpose. Cello Opalware is produced in the most advanced state-of-the-art manufacturing facility using German Technology. Cello Opalware has beguiling designs delicately poised between fantasy and fiction. Tableware that is infused with beauty and strength, charming dishes, gaily patterned in colourful new designs serve every purpose. Bacteria free-non porous and hygienic for your family.\n100 percent vegetarian with bone ash free and made of green material. Thermal resistant, no cracks on heating food in the microwave from refrigerator and stackable.  It's a break, chip and scratch-resistant product made for everyday use. It is fully tempered up to 3X stronger, recyclable, easy to clean.	1229.00	81	2022-02-09 00:00:00	\N	2224	4
327	Dhanwantharam Kwath	Dhanwantharam Kwath is an Ayurveda formulation that helps relieve Vata disorders and postnatal difficulties in women. Dhanwantharam Kwath helps reduce the symptoms associated with degenerating diseases, rheumatic complaints, trauma, etc. It also proves beneficial in vaginal complaints, painful micturition and helps restore natural strength after delivery.	140.00	55	2019-12-01 00:00:00	\N	949	21
469	Moisturizing Body Bath - Green Tea & Milk	Calm Restore RefreshMade in Malaysia.Content 400ml.pH - 5.5.This deliciously fruity Milk bath is ideal for everyday use. Delicately scented with a refreshingly Green tea. Added natural Goat milk extract.  For Beauty tips, tricks & more visit https://bigbasket.blog/	279.00	92	2021-05-01 00:00:00	\N	232	17
328	Suzzan Glass Bottle With Blue Cap	Glass has almost zero rates of chemical interaction thus ensures strength, aroma and flavour. Exclusive airtight, leak resistant lid safeguards from spoilage and bacteria.It is ideal for storing milk, juice, water, lassi, cold coffee etc. Treo by Milton is synonymous with elegant and utilitarian glassware, handpicked from the finest furnaces in the world. Created with the perfect cuts to suit Indian tastes, these glass items are made to keep your guests talking while being functional additions to your home. Treo has the largest assortment of storage products for all needs. We have everything from stylish bottles in various shapes to suit your style to a large variety of fridge containers, jars and canisters. Your kitchen and fridge will never look the same again! The glass is here to promise you to have the best time every day! Serving good food and drinks with finesse is an art befitting a connoisseur.	290.00	32	2018-03-06 00:00:00	\N	1340	23
329	Henko Detergent Bar - Stain Care 250 gm + Mr. White Detergent Powder 1 kg Pouch	Henko Stain Champion Bar is a detergent bar that even eradicates dry, tough stains from laundry. Powered by German technology with Oxygen Power, it completely removes even deep down hard stains like dried up oil and stubborn dirt on collars and cuffs.Mr White detergent powder guarantees superb washing, snowy white clothes and assists boost your assurance by providing spotless clean clothes. Mr White detergent plays an important part in aiding us to look good by giving greater white clean clothes. It aids provide whiter and brighter clothes.	87.00	45	2018-04-08 00:00:00	\N	1476	15
330	Tea - English Breakfast	Typhoo English Breakfast tea is a traditional and unique blend of Assam orthodox and CTC teas. Created by our master blenders, this tea is famous world over for its rich taste, bright liquor with strengh& aroma to match. This malty, classic tea with oaky undertones is the perfect companion with breakfast and a refershing delight to enjoy, any time of the day.	166.00	9	2021-08-09 00:00:00	\N	328	38
331	Rolled Oats - Gluten Free + Gluten Free - Steel Cut Oats (each 500 g)	Rolled Oats 500g\nTrue Elements brings to you Rolled Oats that are loaded with health benefits and nutrients. These are lightly processed whole-grain food. Before being rolled into flat flakes under heavy rollers and then stabilized by being lightly toasted. It is rich in protein, fibre and is an excellent source of Vitamin B Complex and iron. It is the healthiest grain. Cook it with milk or water and add fruits or veggies for your choice. This makes a perfect healthy breakfast.\nBenefits:\n\nIt is loaded with many health benefits and nutrients.\nIt is a great healthy breakfast option.\nIt is rich in protein, fibre and is an excellent source of Vitamin B Complex and iron.\n\nSteel Cut Oats 500g\nTrue Elements brings to you Steel Cut Oats that are loaded with health benefits and nutrients. These are oat groats that have been sliced into smaller pieces. It is rich in protein, fibre and is an excellent source of Vitamin B Complex and iron. It takes more time to cook than other oats. Cook it with milk and add fruits for your choice. This makes a perfect healthy breakfast.\nBenefits:\n\nIt is loaded with many health benefits and nutrients.\nIt is a great healthy breakfast option.\nIt is rich in protein, fibre and is an excellent source of Vitamin B Complex and iron.	352.00	70	2019-02-07 00:00:00	\N	911	20
332	Wafer Roll - Twister, Black With Vanilla Flavoured Cream	Delfi Wafer Rolls are crispy and crunchy wafer sticks wrapped around delicious vanilla cream filling, which are a favourite amongst children and adults. It is an ideal snack to pack for school, to relished on-the-go or to savour as a midday snack. They are made using vegetarian ingredients only.	275.00	65	2019-07-10 00:00:00	\N	46	39
333	Steel Cut Oats	Nutriwish seeks to help you achieve a healthy and active life that you wish to lead, by delivering nutrition suited to your needs. we deliver an eclectic range of nutritious superfoods from across the world to bring out the super you in you. Nutriwish100% Steel Cut Oats are an excellent source of dietary fibre such as beta-glucan which helps in weight management by suppressing hunger pangs. Steel cut oats have a lower GI than instant oats. They are rich in antioxidants called Avenanthramides. Steel cut oats deliver B vitamins and plenty of iron, magnesium and selenium and can be easily be incorporated into weight management plans.	650.00	49	2019-12-08 00:00:00	\N	868	33
334	Zucchini - Green	Zucchini is a long, slender, cucumber like green vegetable that is also called squash. The green variant has a firm flesh and a mild flavour. Do not forget to check out our delicious recipe-https://www.bigbasket.com/cookbook/recipes/1933/quinoa-with-vegetables/	50.00	23	2021-09-02 00:00:00	\N	2027	3
335	Green Sliced Olives	Habit Green Olives are hand-picked and cured when they are fresh. They are generally treated by soaking in a solution of salt and water to make them less bitter. It has a brilliant flavour, feel and colour.	180.00	33	2019-07-10 00:00:00	\N	1137	5
336	Ready To Eat - Khatta Meetha Poha	Breakfast in a cup.Granish with fresh coriander and boiled Lemon wedge.	60.00	64	2020-06-12 00:00:00	\N	1000	11
337	Roasted Soyanuts - Wasabi	WARNING: Having this snack on a daily basis can make you addicted to health and yumminess! Vegetarians have always relied on paneer and soya as their sources of protein, even though none of these are generally available as a munchable snack. But no more! We've jazzed up soya and made it hot spicy with some tangy, wasabi flavour! The result is just impeccable, and we ourselves can't resist having a handful in the office during team meetings! :p It's also especially great to add to your bhel and chaats to make them crunchier and zingier.	185.00	92	2018-06-05 00:00:00	\N	1393	17
338	Radiance Boost Orange Aroma Mask	Uplift the skin freshness with the Radiance Boost Organic Serum Mask. The oatmeal extract helps absorb natural skin oils and gives the skin a clean look. Aloe Vera is a great antioxidant and protects the skin from oxidative damages thus encouraging a radiant and natural glow. Aloe vera extract aids in locking in the moisture and gives the skin a radiant glow. Due to the exfoliating properties of yoghurt, the skin is transformed from being dry and dull to lighter and softer. Rich in vitamin B, keeps skin glowing and hydrated and aids in regeneration. The cheerful and uplifting fragrance of orange adds to the radiance by uplifting your mood.	112.50	6	2021-03-08 00:00:00	\N	1102	17
339	Muffin/Cup Cake Vanilla 200 g + Choco Chip 200 g (Pack of 4 each)	Fresho Signature Muffin/Cup Cake - Vanilla 200 g (Pack of 4)\nMoist and delicious in flavours of vanilla. Enjoy it with family and friends. It is ideal for bonding over tea. A good muffin is ideal for tea time. The muffins are fresh and true to their brand name. Made with premium quality ingredients, the taste is surely going to tame your tastebuds. \nEnjoy this sweet delight and say bye to small hunger pangs.  \nFresho Signature Muffin/Cup Cake - Choco Chip 200 g (Pack of 4)\nThese classic muffins have a delicious twist: chocolate chips, instant coffee and a crunchy brown topping. They are great first thing in the morning or served as a coffee break snack. Made with premium quality ingredients, the taste is surely going to tame your tastebuds. \nEnjoy this sweet delight and say bye to small hunger pangs.	318.00	89	2019-05-10 00:00:00	\N	1973	22
745	Cup Noodles - Italiano	Nissin Cup Noodles - Italiano 70 g	50.00	81	2018-12-04 00:00:00	\N	1104	35
340	Masala Oats - Veggie Twist	Saffola Masala Oats has a burst of flavours and are made from 100% natural wholegrain oats along with real vegetables and the choicest of masalas. Eating Saffola Masala Oats as part of your daily routine is not just fantastically healthy and delicious, but also requires minimal effort for preparation; ready in 3 minutes. It satisfies the cravings for those savoury flavours as a breakfast cereal or during different times of the day.	180.00	54	2019-02-04 00:00:00	\N	1768	12
341	Sunscreen Cream - Sunblock Anti Aging SPF UV 60	Excellent for Sensitive Oily and combination skin types as well as universally accepted for skin of any colour, Soft Touch Perfect Sunblock SPF 60 provides up to 60 times the protection to the bare skin and physical barrier against UVA/UVB and Infrared rays to prevent Sunburn, Skin damage, freckling and uneven colouration.  For Beauty tips, tricks & more visit https://bigbasket.blog/	475.00	77	2021-02-12 00:00:00	\N	662	23
342	Sunblock Lotion	100 % free of oxybenzone, paraben, harsh chemicals, alcohol and artificial fragrance. My all-mineral, ultra effective formula creates a physical barrier between you and the sun. Non-greasy, skin friendly and enriched with carrot seed, wheat germ and jojoba oils. They provide natural sun safety, Vitamins B5, C, E and prevent visible signs of ageing. Notes of helichrysum, calendula and roman chamomile essential oils heal scars and mattify your skin. The non-nano Zinc Oxide in me is a mineral reflector found in nature that scatters harmful rays. Green tea extracts promote elasticity and provide smart sun protection.	178.50	51	2021-08-09 00:00:00	\N	42	17
343	Copper Water Fliptop Bottle - Stripes	Frestol sipper bottle Sipper is made of pure copper. Drinking water stored in copper bottles is strongly recommended by Science and Ayurveda because water stored in a copper bottle is loaded with anti-oxidants. Just fill this bottle and leave it for a minimum 3 hours, best if kept overnight as the water gets copper properties and its benefits during this time. Copper kills undesirable bacteria and germs and gets water charged with the health-benefiting qualities of copper. It is recommended to drink the water at room temperature, experts say that drinking from a copper water bottle on a regular basis, especially early in the morning, can make a significant difference to health.	549.00	11	2019-09-10 00:00:00	\N	373	4
344	For Men Evolution Eau De Toilette	Bergamot, mint, orange and basil open the composition and with the fresh, aromatic start announce a blend of clary sage, cardamom, apple and lavender in the heart. Base notes cuddle and warm us subtly with amber, sandalwood and musk	1900.80	35	2021-03-06 00:00:00	\N	199	30
345	Long & Black Shampoo - With Goodness Of Amla & Bhringraj, For Shiny, Black Hair	New Dabur Vatika Naturals Long & Black Shampoo, with the goodness of Satt Poshan Seven Natural Ingredients – Amla, Bhringaraj, Shikakai, Reetha, Black Olive, Almond, Reetha. The shampoo with seven natural ingredients helps to maintain shiny smooth hair, providing gentle cleansing, conditioning and nourishment to hair.	171.00	76	2021-02-06 00:00:00	\N	2252	6
346	Toothpaste - Complete Care	Neems anti-bacterial properties make it natures most effective germ fighter. Neem Active Complete Care Toothpaste with the naturally enriched power of neem helps preveny cavities, bleeding gums and inflammation. Its unique formulation combined with mint ensures fresh breath for hours. Use daily for strong healthy gums.	65.00	24	2019-08-09 00:00:00	\N	859	27
347	Olive Oil - Pomace	Premium quality Olive oil from selected hand picked Olives from Spain.	3330.00	19	2021-06-05 00:00:00	\N	1841	4
348	Glass Set - Solo Shot Bar	Ocean Solo Shot Bar Glass - Set of TwelveIf you are planning to throw your birthday party at home then serve your favorite wine or other alcohol in this specially designed Ocean Solo Shot Bar Glass Set. Made of fine quality glass material, these votive style twelve shot bar glasses are freezer and dishwasher-safe. Smart design with a dimension of 3 x 2 x 3 inches lets you enjoy a satisfactory quantity of neat alcohol at a time.	579.00	76	2021-11-02 00:00:00	\N	1880	7
349	Bonacure Conditioner - Repair Rescue	Schwarzkopf Professional Bonacure Repair Rescue Conditioner is a light conditioner that will mildly replenish your damaged hair without weighing it down. It strengthens hair from its roots making them more elastic. It is ideal for damaged, porous, over processed hair. The best conditioner to keep your hair healthy and good looking.For Beauty tips, tricks & more visit https://bigbasket.blog/	900.00	50	2021-05-12 00:00:00	\N	631	22
350	Vegan Chipotle Mayo - Dairy-Free	Rich mayo with a smoky kick of chilli and red paprika, it's a savoury mixture of spicy, cool, earthy, and smoky flavours that become an excellent spread for burgers, or a dip for fries, chips, and veggies.\nBuild a delicious sandwich, potato salad, or the freshest, savoury sauces and dressings. Vegan Chipotle Mayo is India's first 100% vegan and non-dairy mayo. It is trans-fat free and palm oil free.Urban Platter - Simply Good Food! :)	332.50	38	2018-10-07 00:00:00	\N	1107	12
351	Blueberry	Plump, smooth-skinned and indigo coloured perfect little globes of juicy berries have mostly sweet and slightly tart flavour. We have imported this fine quality, delicious tasting variety of blueberries. Do not forget to check our delicious fruit recipe - https://www.bigbasket.com/cookbook/recipes/564/blueberry-mousse/	330.00	17	2019-08-01 00:00:00	\N	2027	9
352	Oregano - Organic, USDA Certified	Geo Fresh presents their healthy and nutritious range of organic Ayurvedic ingredients which are packed with essential nutrients that are bound to boost your immunity, leave you energised and provide you with all the health benefits you need that require you to go on for a healthy living. The impressive health benefits of Oregano include its ability to protect the immune system, prevent the onset of chronic disease, improve digestion, detoxify the body, strengthen the bones, improve heart health, increase energy levels, and even protect against diabetes.	99.00	86	2019-08-05 00:00:00	\N	1365	1
353	Chunky Salsa - Mild	All natural, juicy red tomatoes, jalapenos, onion/garlic, bell peppers, no MSG	140.25	40	2018-11-01 00:00:00	\N	1528	18
354	Multigrain Energy Bar - Nuts n Seed	Yogabar's Energy Bars contain a nutrient dense primary ingredient that is generally whole grains, nuts or seeds. The bar contains 25 - 30% Whole grains & complex carbs, derived from Brown rice, Oats, Buckwheat, etc. 10 - 15% Nuts, that is generally Almonds, Cashews or Peanuts, as they provide all round more protein and fiber. Lastly, it contains 10 - 15% Seeds, which are generally Flax, Chia, Sunflower, etc. \n\n\n\nThe bars contain no corn syrup, artificial sweeteners or hydrogenated oils. It also contains no artificial preservatives, as Yoga Bar chooses to focus on the long term health of their consumers, rather than a product that can last years on the shelf.	40.00	55	2020-04-07 00:00:00	\N	1609	22
355	Active Fresh Gel Toothpaste	Himalayas Active Fresh toothpaste is filled with energising herbal ingredients that guarantee long-lasting fresh breath. Menthol is a normal revitalizing agent. Indian Dil prevents mouth odour while Clove and Fennel are efficient natural astringents that tighten gums.	45.00	57	2020-10-06 00:00:00	\N	2097	12
746	Cat Care - Comfort Bowl, 32Oz GIb1010	Dog And Cat Feeding Bowls.	360.00	56	2021-03-01 00:00:00	\N	1256	6
356	Hydro Replenish Radiance Day Crème with SPF 15	Hydration is a must for skin! With time, our skin cells lose the capacity to retain hydration, leading to dull, tired and dry skin. Kaya Youth Hydro Replenish, enriched with pure Aloe Vera gel is developed by dermatologists and deep hydrates the skin to lock in hydration for upto 24 hours, giving you healthy, radiant skin! Kaya Youth Radiance Day Crème with SPF 15 has a gentle, lightweight formulation and is enriched with Aloe Hydro Lock Complex. SPF 15 protects skin from harmful UV rays and provides everyday sun protection.\nThe pure Aloe Vera gel helps in locking hydration and helps in removing dryness, keeping skin healthy and radiant. For best results apply pure Aloe Vera enriched crème twice to clean face and neck. The day cream is free from paraben and harmful chemicals and is suitable for all skin types. Developed by dermatologists, this aloe vera day cream is non-sticky, has a quick-absorbing texture and is ideal for daily use. Enjoy rejuvenated, youthful, bouncy skin with a dewy glow everyday – Try out the New Kaya Youth Hydro Replenish Radiance Day Crème. Also check out other hydrating Kaya Youth products for a complete skin health regime – Hydro Replenish Gentle Face wash, Ultimate Hydration Sleeping pack, Under-eye recovery gel, Light Pure Aloe Vera Gel and Refreshing Face Mist!	104.30	58	2021-12-11 00:00:00	\N	1772	32
357	Anti-Hair Fall Shampoo	Anti-Hair Fall Shampoo reduces the hair fall and promotes hair growth. It is a breakthrough 2-in-1 formula that reduces hair fall and provides nourishment to hair shafts. It also conditions and improves your hair texture to reduce hair fall due to breakage. The herbs Butea Frondosa and Bhringaraja stimulate hair follicle growth and are effective in strengthening hair roots and controlling hair fall.	123.50	98	2021-02-01 00:00:00	\N	2097	27
358	Cereal - Ragi, Rice & Mango With Milk	This cereal is made with Slurrp Farm's Organic Grain Blend consisting of Ragi, Jowar & Rice along with Oats, Organic Brown Sugar and Natural Mango Powder. This super healthy cereal will provide all the essential nutrients to your little ones.	300.00	36	2018-11-02 00:00:00	\N	31	10
359	Fenugreek/Methi/Menthya	Fenugreek is primarily used as a culinary spice. It brings you the finest selection of methi seeds, which are non for their immense health benefits. These seeds are bitter in taste but lose their bitterness when roasted a little. It is loaded with health benefits, the methi seeds are hygienically packed to ensure they retain their natural goodness and aroma. These seeds can also be used in pureed form for hair growth. It also enhances many liver and heart functions and purifies the blood.	18.40	96	2022-01-06 00:00:00	\N	30	27
360	Hair Spa Oil Therapy	Champi’ (Oil Massage) is a time tested way to give deep nourishment to your scalp and repair hair texture. Our blend is made of pure extra virgin olive oil, virgin coconut oil, cold pressed oils of blackseed and enriched with therapeutic grade essential oils of rosemary, peppermint and lavender that have potent anti-oxidants and vitamins naturally good for hair and scalp health. Essential oils help stimulate blood flow to your scalp and improve the nourishment to the hair follicle and cold-pressed base oils nourish the scalp. We sincerely recommend that you take about half hour on sundays and instead of feeding your scalp and hair chemicals, use our highly nutritive Hair Spa Oil and we are confident you will love the difference.	370.50	85	2020-07-06 00:00:00	\N	1715	20
361	Sauce - Bhut Jolokia, Sweet Chilli	Uses Chilli Puree from the Hotest Chilli in Asia	168.75	49	2020-09-04 00:00:00	\N	108	34
362	Dry Fruit Mixed Chatpata	Fresho Signature presents an array of dry fruits apart from the ordinary to give you the best of the best to indulge. Want to try something other than a regular fruit? This sweet and spicy dry fruit mix is a healthy alternative to munch on when hunger strikes. It contains papaya, apple, pineapple, mango, black grape, strawberry, sulphurless sugar, cumin seed, black pepper, black salt, citric acid, cinnamon, asafoetida and ginger powder. Easy to carry, it makes a great snack to keep you going throughout the day.\n\nOur spicy candied dry fruit mix is here to be your snack buddy and your healthy sugar high. They are sweetened with sulphurless sugar and liquid glucose and spiced to enhance the zing. There are 0 added preservatives, artificial colour and flavour to retain the original fruit essence and keep it natural and healthy.	149.00	35	2019-02-11 00:00:00	\N	1973	1
363	Organic Coriander Powder	One of the most useful essential oil-bearing, as well as a medicinal plant, is Coriandrum sativum L. Coriander powder/ Kothamalli powder/ Kothamailli podi/ Kothamalli thool/ Kottamalli vitai/Methi powder is good for digestion. 24 Mantra Organic Coriander Powder/ Kothamalli powder/ Kothamailli podi/ Kothamalli thool/ Kottamalli vitai/Methi powder is made from unadulterated, organic coriander seeds. The seeds are cleaned and ground into powder.	48.00	91	2018-08-05 00:00:00	\N	1420	5
364	Stainless Steel Induction Base Tope	Vinod Introduce 18/8 Stainless Steel Induction Friendly,Ultra Hygienic Pressure Cooker With Long Durable Food Gradable Silicon Gasket.	399.00	44	2020-09-03 00:00:00	\N	1231	4
365	Adult Cat Food Pocket Tuna 7 kg + Wet Meal Tuna In Jelly, for Adult Cat 1.02 kg	High Quality Ingredients \n\nWholegrain Cereals (Corn, Rice, Wheat) - Corn Gluten Meal - Poultry & Poultry By-products - Soy Bean Products (Full-fat Soy Bean, Soy Bean Meal) - Palm Stearin - Ocean Fish - Wheat Flour - Minerals - Iodised Salt - Vitamins - Taurine - Soy Oil - Methionine - Food Colouring -Preservatives - Flavour\n  How to Use  Easy-to-open pouch. Whiskas understands what your cat naturally needs and loves. Thats why the Whiskas Wet Meal (Adult - Cat Food) Tuna in Jelly pouches are tasty and contain the same nutrition you have come to expect. Each pouch contains 100 per cent complete and balanced cat food with succulent meaty pieces to help you provide care for your cat	1986.60	21	2018-02-10 00:00:00	\N	776	5
366	Pork - Mortadella with Olives, Sliced	Dautore Mortadella with Olives is large Italian sausage made of finely hashed or ground, heat-cured pork. It has at least 15% small cubes of pork flavoured with spices and olives, including whole or ground black pepper, myrtle berries. Manufactured at Italy. Packed as per Customer requirement. Not a standard pack under weights & Measurement Guidelines. Consume within 05 days from date of Packing. Store in refrigerator at or below 05 degree C in an airtight container.	410.40	31	2020-09-06 00:00:00	\N	1973	12
367	Andhra Special Allam/Ginger Pickle	Contains - Andhra Special Allam - Ginger Pickle 250g. Aromatic & spicy accompaniment with your meal. Spicy Masalas & Pickles are a daily affair in Andhra Pradesh. But you need not go to Andhra to explore their tantalizing & spicy pickle recipes. Authentic Andhra Pickles are just a click away. We bring you the most authentic range of Traditional Andhra Pickles, prepared using the finest ingredients & an age-old recipe to ensure the genuine flavour, aroma & texture. Our pickles are manufactured using only natural ingredients & contain no artificial colours, flavours or preservatives. We have the 5 most popular & exciting flavours - Avakaya(Mango), Allam(Ginger), Gongura, Red chilli & Bitter Gourd. Each variant is an ideal blend of the iconic spice & the main ingredient. Enjoy these flavourful pickles at the comfort of your home. Eat it with curd rice, rice sambar, Indian bread, etc. Veg. Store dry & airtight container. Do not use wet spoon. Best Before 365 days from the date of packing	210.00	83	2021-12-11 00:00:00	\N	1741	30
368	New Dry Diapers - Medium	One of the most important baby care products that you buy for your baby is diapers. A good quality diaper can help keep your baby comfortable during play as well as sleep time. Choose Huggies New Dry Diapers - these diapers are highly absorbent and help in keeping your baby’s skin dry & fresh. These diapers are suitable for your baby’s skin to ensure uninterrupted play and nap time. Huggies New Dry is available in different sizes from Small to Large to suit your baby.	388.88	7	2019-02-11 00:00:00	\N	2160	3
369	Fruit N Fibre Muesli - Mixed Fruit	A delightful muesli for a great start to your day with the perfect balance of whole grains and mixed fruit crush.	320.00	9	2019-07-08 00:00:00	\N	1656	6
370	Basa Fish - Fillet Family Pack	Good Source for Lean Protein, Individually Quick Frozen, Healthy Low Fat Food, Rich in Omega-3 Fatty Acid.	499.00	46	2020-11-07 00:00:00	\N	1623	29
382	Matcha Moringa Bar Bites - Mini, Gluten-free, Vegan	Healthy and gluten-free Matcha Moringa bar bites are easy options for on-the-go snacking. With the goodness of matcha and moringa, these bites contain antioxidants that support immunity building. Not just that it is also enriched with the wholesome nutrition of almonds, dates, chia seeds, oats and a touch of cinnamon. There are no added preservatives and artificial flavours.	112.56	41	2018-12-02 00:00:00	\N	2088	32
371	Baby Corn - Sweet & Sour	Reitzel is a family-run business, founded in 1909. In 2005 The subsidiary Reitzel India is created in Bangalore, specialising in gherkin farming in order to create an efficient supply chain. In 2017 The “French Cornichons” and “HUGO” ranges are launched in Switzerland, made from 100% locally grown ingredients. Hugo Reitzel products are prepared and produced in Aigle, in the canton of Vaud. Gherkins, capers, baby corn, jalapenos etc. Over the years, Reitzel has become a recognised specialist in the production of these delicious condiments. When it comes to pickles, the possibilities are endless! And, above all, they’re perfect for every occasion. Hugo Reitzel brings to you a range of food items that will not only satiate your taste buds but will also kill your hunger prangs. Packed with the best of ingredients, these are fresh and delicious. Baby corn is a cereal grain taken from corn harvested early while the stalks are still small and immature. It typically is eaten whole – cob included – in contrast to mature corn, whose cob is too tough for human consumption. It is eaten both raw and cooked. The baby corn is perfectly mixed with vinegar and sugar. Use it for salads, pasta, pizza, good in soup, stir-fried dishes and oriental cuisine.\nLegal Disclaimer: While we work to ensure that product information is correct, on occasion manufacturers may alter their ingredient lists. Actual product packaging and materials may contain more and/or different information than that shown on our web site. We recommend that you do not solely rely on the information presented and that you always read labels, warnings, and directions before using or consuming a product. For additional information about a product, please contact the manufacturer.	607.75	53	2019-06-12 00:00:00	\N	2309	10
372	Kool - Badam	Amul Kool is a refreshing beverage range with a variety of flavours. Pick up Badam for its unique flavour and enjoy the drink, Hamara cold drink.	20.00	13	2018-10-03 00:00:00	\N	269	2
373	Creamy Crackers - Original	Sapphire sugar crackers are the original wheat crackers that are heated to a light and crunchy perfection. These crackers are enormous fun to share, tasty to eat and are also uniquely delicious.	180.00	88	2020-08-09 00:00:00	\N	833	26
374	Dried - Cranberries 200G + Prunes 200G + Apricots  200G + Blueberries 150G	Surprise your taste buds with the delicious taste ofÂ Sweet cranberries. It is perfect for snacking,Â baking,Â mixing into cereal, muffins, smoothies etc   Ready to eat Delicious Prunes contain no pits and are ideal for cooking, snacking or adding to your smoothie, muffins or cereal.Â Not only do prunes taste great, but they are also very good for healthy.   Our Jumbo dried apricots are plump, moist, chewy and vibrant in flavour! Larger apricots like this variety tend to be sweeter and more delicious.   Blueberries are slightly sweetened and ideal for snacking, mixing in cereals, or adding to cakes and muffins. Heart Healthy,Â plump and sweet taste of our dried blueberries,Â will leave your taste buds in paradise.	1280.00	36	2019-09-10 00:00:00	\N	592	35
375	Milly Magic Chocolate Balls - Gluten Free	When Milly Magic chocolate balls hop into your cereal bowl, it is truly an easy leap into the new day. Fibres and yummy cocoa - probably the best breakfast combination for all adventurers, big and small. Hop-hop, choco-pop! Time to go!	485.00	32	2020-11-07 00:00:00	\N	2024	27
376	Millet Based Nutrition Bar - Classic	Millet based nutrition bar is totally natural and vegetarian. It is one of the healthy options that you can include in your day to day life.It contains 6 gm of protein. Reduce your hunger pangs in a healthy way with this nutrition bar.	20.00	84	2020-12-07 00:00:00	\N	823	20
377	Bathroom Cleaner - Liquid, Hand Made	Wild Ideas present their all-new range of Hand Made Liquid Castile Bathroom Cleaner topped with the added disinfecting and cleaning properties of Lemon Essential Oil. This cleaner works extremely well on tough stains in the toilet bowl, sinks and tiles. You can use it for cleaning regular surfaces as well.	120.00	84	2020-05-08 00:00:00	\N	2030	15
378	Kodo Millet Rice - Pesticide Free	Safe harvest Kodo Millet Rice is procured from small and marginal farmer producer collectives from South Tamil Nadu. It has been carefully grown to ensure that you get safe food without synthetic pesticides and without using genetically modified seeds. All products of Safe harvest are tested in FSSAI accredited laboratories for the presence of 149 pesticides and a Minimum Residual Level report is obtained. Also, our millet rice is parboiled and unpolished that helps in retaining the essential nutrients. They are easily digestible, highly nutritious, and gluten-free and has a lesser percentage of glucose when compared to rice and thus lowers the risk of diabetes. Kodo millet has 8. 3% protein and 65. 2% carbohydrate when compared to paddy rice that has only 6. 8% protein but 78. 2% carbohydrates. Eating millets is a step towards sustainable cropping practices as millet is not a water-intensive crop like rice or wheat. Kodo millet rice is rich in phytates and thereby helps reduce the risk of cancer. Recommended for making such as Biriyani, Kheer.	84.15	79	2018-04-05 00:00:00	\N	1262	30
379	Amla Juice	Patanjali Amla Juice is rich in antioxidants and vitamin C. Amla or Indian gooseberry has several health benefits; it is used as skin & hair treatment and improves your immunity and eyesight. This amla juice is absolutely natural and should be taken on an empty stomach.	220.00	46	2021-12-12 00:00:00	\N	2275	7
380	Cheddar - English	100% pure vegetarian and natural cheddar with mild creamy flavour. It has a rich tendency to melt in the mouth with a hazelnut flavour.	530.00	17	2020-07-05 00:00:00	\N	2301	22
408	7 O Click - Permasharp Stainless Blade	The Razor's Snap Lock Action makes shaving really convenient and hassle-free, unlike ordinary razors, its superior design ensures a firm hold and precise positioning of the blade, minimising any chances of nicks and cuts. So you can have a shave that's totally safe and comfortable.	21.56	88	2020-03-09 00:00:00	\N	1826	37
381	Power - Fresh Breath Fluoride Toothpaste 100 g + Sensitive Toothpaste 80 g	Clove is your very own dental care expert made by Indians for Indians. Clove Power is an anti-cavity toothpaste that contains a unique formula that freshens breath with the goodness of clove oil. Formulated with Dentist approved ingredients, it helps clean teeth to make them whiter and stronger. It helps reduce the formation of plaque and tartar above the gum line which helps fight against gingivitis, stains, tartar, and cavities. Fluoride gives protection against tooth decay and strengthens teeth. Clove Power has excellent foaming action with smooth & easy flow ensuring it gets to every corner of your whole mouth and fights bacteria on teeth, tongue, cheeks, and gums. Also, it whitens the teeth, protects the enamel and prevents bleeding gums. Say goodbye to bad breath, decay and gum disease as you welcome Clove Power toothpaste. Clove Power has a unique flavour (Clove + Mint) formulated by Symrise, a world-renowned flavouring company based in Germany and manufactured in India by Dabur.\n \nClove is your very own dental care expert made by Indians for Indians. Clove Sensitive helps relieve the sharp or sudden pain caused by sensitive teeth. The toothpaste is formulated with Dentist approved ingredients to provide long-lasting relief from sensitivity and help prevent cavities. With the goodness of clove oil & mint, it helps reduce the formation of plaque and tartar above the gum line and fight against gingivitis, stains, tartar, and cavities. Fluoride gives protection against tooth decay and strengthens teeth. Clove Sensitive has excellent foaming action with smooth & easy flow ensuring it gets to every corner of your whole mouth and fights bacteria on teeth, tongue, cheeks, and gums, enamel protection and prevents bleeding gums. Say goodbye to sensitive teeth and gums as you welcome Clove Sensitive toothpaste. Clove Sensitive has a unique flavour (Clove + Mint) formulated by Symrise, a world-renowned flavouring company based in Germany and manufactured in India by Dabur.	203.99	3	2018-03-03 00:00:00	\N	827	25
383	Sugar Free Juice - Lemon Ginger Squash	Made from pure lemon juice, fresh ginger &Â Levulose. Direction for use : Add 1 measure of Diabetics Dezire natural lemon squash concentrate to 4 measures of chilled water, enjoy without guilt. For every 20 ml it contains 50 Kcal of energy per serving, 0.10 g of Protein & Fibre, 12 g of Carbohydrates.	330.00	27	2018-04-02 00:00:00	\N	2241	21
384	Wipeout Germ Killing Soap	Rejuvenating and purifying, the WIPEOUT Germ Killing Soap by MyGlamm is the perfect start and finish to a long day. This anti-microbial bathing bar contains nourishing cocoa butter, enriched with germ-killing chlorhexidine with tea tree oil and healing coconut extracts to give you germ-free soft, supple and squeaky clean skin.	55.20	13	2020-03-03 00:00:00	\N	1460	13
385	Jelly Crystal - Raspberry	Jelly is amazing treat on its own as it is so tasty, but jelly is fabulous with some whipped cream or\nice cream and even custard, which together is a classic of the tea-time table. Jelly Crystals is the\nbest vegetarian dessert. Puramate jelly crystals give you perfect taste, texture & flavour .	40.50	58	2020-09-02 00:00:00	\N	345	28
386	Black Tea	Featuring the finest grade Assam teas, selected by our expert tea masters working their magic for that unique taste you love.	155.00	50	2018-12-11 00:00:00	\N	1138	19
387	Grainy Delight	Grainy Delight is a roasted multi-millet namkeen which is rich in fibre, protein, iron, calcium and minerals. It is a healthy & tasty snack which you can enjoy any time.	150.00	30	2018-06-12 00:00:00	\N	886	37
388	Kitchen Cleaning/Dusting Microfibre Cloth - Grey, G130060GR	Keep your kitchen tidy and clean with this grey coloured microfibre cloth. Since the fabric is made using microfibre, it can absorb more water than its weight. It is easy to clean and dry. It traps dirt and filth like a magnet. The fibres are super soft hence makes the cleaning ultra smooth and relaxing.	239.20	9	2022-01-07 00:00:00	\N	831	2
389	Amla Churna	Dabur Amla Churna helps to increase Immunity. It has antioxidant properties and is beneficial for eyes. It provides relief from digestive problems like acidity and also from the burning sensation in chest.	80.00	12	2021-10-05 00:00:00	\N	1186	12
390	Professional Herbal Orange Facial Massage Cream	Want instant glowing skin? Try Olivia Orange Facial Message Cream. It makes your skin flawless and fabulous. Try today and retain your natural glow.	191.25	95	2018-04-04 00:00:00	\N	1182	4
391	Eggless Mayonnaise Dip	Happy Chef eggless mayonnaise is a creamy salad dressing completely made using skimmed milk powder without added egg in it. Mayonnaise is a classic French sauce which is used in sandwiches, salads and is a mother sauce for a variety of sauces and dressings.\nCreated by international chefs, our products are made in small batches to give the authentic flavour that you will relish. Bring out the chef in you with our exciting range of Happy Chef products; sauces, dips and conserves, pasta, baking bars and buttons.	119.00	94	2018-07-03 00:00:00	\N	456	11
392	Nilgiri Green Tea - Yakuso Tulsi	This Nilgiri Green Tea - Yakuso Tulsi helps for weight loss, and enhancing your immunity as it gets you rid of toxins and enhances your metabolism. Enjoy your leisure time savouring this relaxing tea along with your favourite biscuits.	525.00	61	2019-04-11 00:00:00	\N	1544	24
393	Peri Peri Sauce - Bird Eye Chili, Hot & Tangy	Habaneros versatile Peri Peri Sauce is made using birds-eye chilly that can be used as a tasty marinade or a flavourful sauce and snacks and grilled or barbecued dishes. Peri Peri is one of the most common spice and is ranked as one of the spiciest forms of chilli flavouring.	161.10	72	2020-05-12 00:00:00	\N	2197	27
394	Menstrual Cup - Wings, Pratham	Stonesoups Menstrual Cups are soft and easy to insert and are recommended for women who have given vaginal birth and leading a sedentary lifestyle. These cups have good suction and are easy to remove and clean. They can be safely worn at night while slepping without fear of leakage.	489.00	23	2019-08-08 00:00:00	\N	997	24
395	Wonderz Milk Fruit N Milk - Mango	Treat yourself with an exciting tasteful adventure and discover Wonderz of Milk in every sip. Fruit n Milk Mango Drink is a wonderful blend of the goodness of fruit and milk. Made with real mango pulp and mango bits, it promises a delightful experience. This product contains no preservatives and is a low-fat beverage.	29.75	33	2019-12-04 00:00:00	\N	213	40
396	Cow Ghee/Tuppa	The Original Himalayan Cow ghee is made from the milk of purebred and non-hybrid free-range Himalayan cows that graze exclusively on the mineral-rich Himalayan grass, herbs, and medicinal plants. Our ghee is 100% genuine and is ethically and sustainably sourced. It is also free from preservatives, colours, and chemicals. It possesses a granular texture with an authentic aroma and flavour.	432.00	39	2020-11-07 00:00:00	\N	1784	23
397	Organic - Black Cardamom Ealachi, Whole	Black Cardamom Whole by BB Royal Organic is organically cultivated for purity and come filled with brightness and health.	44.00	54	2021-06-05 00:00:00	\N	2281	20
409	Classic Sandalwood & Tulsi Hand Wash	Presenting Santoor hand wash with a blend of natural ingredients and unique formulation that not only fights germs but also keeps the hands soft. Its natural fragrance makes it pleasant to use and the ergonomically designed packs make it easy to keep in washbasins and sinks. Its unique formulation not only fights germs but has a pH balanced formulation that maintains the softness of the hands.	209.00	82	2018-09-02 00:00:00	\N	2014	5
410	Chai/Stainless Steel Cups - For The Love Of Tea	This Lovely High Gloss Design in stainless steel with typographic design expressions for the Love Of Tea. The mugs have gloss reflections which add that extra style and distinctness to the product. It is ideal for gifting and adding that touch of style for elite homes/offices.	395.00	51	2020-02-09 00:00:00	\N	171	31
411	Brass Karpoor Arti - No.2	The camphor is placed and lit in the middle of the karpura Arthi holder and it is waved in circular fashion to show the gratitude and offerings to the God. The flames from the karpur arthi is partially touched with the hands and kept on the eyes as a part of the ritual to get positivity. The hovering of the hands is used to open the sense of touch and flames are used to open the sense of sight. It gives calmness to the mind.	109.00	33	2020-02-10 00:00:00	\N	1211	26
398	Ultimate Choco Berry	 A BAR FOR EVERYONE: With 30gms of protein in each bar and 10gms of fiber, 5.5g of BCAA and goodness of berries. Max Protein Choco Berry protein bar is the perfect bar for your ultimate lifestyle with no preservatives and no artificial sweeteners with a balance of taste and health.\n\nSUSTAINED ENERGY: Max Protein Choco Berry is yours go to performance energy bar, purposefully crafted with an ideal mix of 3 protein blends of whey protein, soy and casein and a punch of flavor with berries to sustain 5hrs of energy for your ultimate lifestyle.\n\nWHOLESOME INGREDIENTS FOR A WHOLESOME EXPERIENCE: A bar that satiates your hunger and keeps you going with 5hrs of sustained energy. We aim to keep you healthier and provide a healthier option to your food choices with an irresistible combo of nutrition and flavor of berries and no added sugar.\n\nDELICIOUS NUTRITION: Satisfy your cravings with a perfect blend of dark chocolate and almonds and no preservatives, 100% vegetarian.\n\nYOUR ENERGY BUDDY: No time for breakfast before the video call? Need something energy boost for the grocery run? Got that midnight movie craving? Choose the healthier Max Protein bars as your energy and nutrition buddy. Don't skip on your health and weight goals. Have this bar handy for all the time whenever bored or binge eating hits you.\n\nMADE IN INDIA : Max Protein is the first brand to launch nutrition & protein bars in India. We have created and nurtured protein bars category in Indian Market.	950.00	49	2020-05-09 00:00:00	\N	1390	2
399	Steel Belly Shape Storage Dabba/ Container Set With PP Lid - Silver & Blue	Jensons Stainless Steel Belly Puri Dabba/storage containers are made with high-quality stainless steel. This storage container features with beautiful mirror polish design which is easy to clean and maintain for timeless kitchen style. This container is essential to any kitchen and is versatile, space-saving and stylish. These are sturdy and durable, taking care of your food and ingredients for a long time. Use the containers to store kitchen ingredients like spices, lentils and grains, cookies and other kitchen staples.	219.00	99	2022-02-09 00:00:00	\N	1217	9
400	Kool - Koko	Kool Koko is a fun, wholesome drink. Shake the can, open it and get pleasure from the yummy goodness of cafe. It is effortless to use a yummy drink that energizes you instantly with the goodness of milk.Serve it at home for parties or to your family instead of unhealthy fizzy drinks.	111.00	77	2018-11-02 00:00:00	\N	269	13
401	Apple Cider Vinegar - With Mother, Unfiltered & Unpasteurized	True Nature Apple Cider Vinegar is 100% naturally fermented to 5% acidity from the finest and delicious Himalayan grown apples. It is unfiltered and unpasteurized and hence retains the benefits of the natural residue "Mother" which has the health benefits mentioned below and also retains essential minerals like sodium and potassium required by the body. Product Description: 1. 100% Natural, fermented to 5% acidity from the finest and delicious Himalayan grown apples 2. FSSAI Certified 3. 500ml plastic packing (Plastic Used is food grade plastic) 4. 18 months shelf life from the date of manufacture 5. No refrigeration required Following are the unique things of my product: 1. It is manufactured in Shimla where the qualities of the Apples are the best in India 2. To manufacture the Apple Cider Vinegar we require less temperature since it is a two-step (Apple Juice to Cider and then Cider to Vinegar) bacterial fermentation process. Shimla being a hill station with the desired temperatures gives us that leverage so that we manufacture it naturally instead of creating low temperatures artificially in the manufacturing setup if it is located elsewhere.	500.00	77	2018-11-12 00:00:00	\N	1051	24
402	Dare Deodorant Spray - Men	Stolen kisses! Hazardous flings! Bold moves! Dangerous liaisons! Fatal attractions! And a man who sends pulses racing everywhere! These are just some of the benefits when you dare to be different with this warm and vibrant fragrance!	210.00	67	2018-09-03 00:00:00	\N	1002	31
403	Svachh DLX Alpha Steel Outer Lid Pressure Cooker (20247)	The Prestige Dlexue Alpha Svachh pressure cookers are made using the best quality stainless steel, which makes it perfect for any kitchen. Its unique Alpha base is designed for even distribution of heat and is also induction compatible. What's more, it also features built-in safety mechanisms in the form of pressure indicators, safety plug and controlled gaskets release system. Also, the scachh lid contains any spillage that might occur during the course of cooking, keeping your kitchen cleaner and safer than ever before. So, go ahead and bring home the Deluxe Alpha Svachh stainless steel pressure cooker, it's yet another Prestige product you can trust.	2060.00	39	2020-10-09 00:00:00	\N	671	16
404	Hydrating Body Lotion	Nutrinorm’s Hydrating Body Lotion is enriched with Anti-oxidants and Vitamin E, providing a Natural, Healing and Soothing effect on the skin. Its unique herbal properties Strengthen, Protects and Rejuvenates the skin for enhanced cell function. While its natural moisturizer leaves the skin soft. The Hydrating Body lotion contains high-quality Virgin Coconut oil, Pure Olive oil, Grapeseed oil and Glycyrrhiza glabra which has a soothing effect on the skin and the formula absorbs the lotion quickly into the skin.	349.00	72	2019-09-05 00:00:00	\N	299	28
405	Nuts & Seeds Bar	A NUTTY TREAT: A the crunch of almonds and cashews in each bite and a kick of health with pumpkin seeds and flax seeds. To add on to this, this great combination is formulated WITH NO ADDED SUGAR NUTRITION AND MORE: With cashews and almonds that are rich in zinc and magnesium and source of other micronutrients. Dark chocolate that serves as a mood elevator and aids stress management, Oats that delivers Fibre and quinoa provides sustained energy with Low GI. A product with clean and natural ingredients and no preservatives and the benefits of flax seeds that are a good source of Omerag-3 fatty acids and pumpkin seeds that improves heart health.  YOUR GO-TO SNACK: A pack full of goodness for all your sweet cravings. No more guilt for your midnight binge or when you have a craving for something sweet. This little pack can get you through all those tiring commutes or even those quick exercise sessions. We have got you covered. MADE IN INDIA: We are truly local & Proudly Vocal about it.	36.00	96	2021-07-03 00:00:00	\N	1390	31
406	Nacho Chips - Cheese With Herbs, No Onion, No Garlic	Makino’s No Onion and No Garlic flavours are specially launched for people who don’t consume garlic, onion and potato in their diet or meal. We procure Non-GMO high protein Corn from Northern parts of India, in-process we bake raw chips, fry it with corn oil and add imported seasoning to give you the best taste without compromising the quality. These products are made in ISO 22000, FSSAI, HACCP, HALAL and US FDA approved plant. On the other side, our all products contain no MSG, no Preservative, zero trans fat and zero cholesterol so, feel free to consume. About Makino’s No Onion No Garlic Flavors, they are very unique in taste compare to Makino’s regular flavours.	46.90	97	2018-12-05 00:00:00	\N	1435	21
407	Pistachio	Made with the highest quality of carefully handpicked pistachios, the nuts are roasted to perfection and seasoned with just the right amount of salt. They make for wholesome and healthy snacks, the kind you would never want to stop eating.	307.20	40	2018-04-07 00:00:00	\N	844	18
412	Nikhaar Hair Removal Cream For All Skin Types	Enjoy a pleasant hair removal experience with Veet Nikhaar Hair Removal Cream – with the goodness of Turmeric, Sandal & Saffron- it gives you smooth and visibly brighter skin with every depilation. This hair depilation cream is pain-less and great for instant use. It effectively removes even short, stubborn hair and leaves skin moisturized for up to 24 hours. It can be used on legs, arms, bikini line and underarms for a perfectly finished hair-less skin. Veet Nikhaar Hair Removal Cream for all skin types gives you perfect hair removal results in just 3 to 6 minutes. Follow the steps mentioned in the pack using the special spatula provided. Before using the product, please read the pack precautions carefully. With regular use; get fewer, finer and softer hair growing back!	82.00	65	2022-05-03 00:00:00	\N	1055	30
413	Original Care Lip Balm For 24h Moisture With Shea Butter & Natural Oils	Nivea Original Care Lip Blam nourishes lips in such a way that they always look and feel their best. With its weightless texture, it makes effective all-around lip care for soft and smooth lips, with no colour. The skin on your lips is much thinner than rest of the body skin, it chaps and peels so easily and hence ideally should be kept moisturised with a lip care product. Nivea Original Lip Balm keeps your lips moisturised for up to 12 hours.	114.80	1	2021-05-11 00:00:00	\N	636	10
414	Plastic Insulated Jr Casserole For Roti/Chapati Gift Set - White, Regalia	Bring home this Milton casserole and dig right into a tasty meal without waiting. Eating hot and fresh food is everyones desire and this casserole with a stainless steel interior and plastic outer body retains heat effectively for long periods of time. The double-walled insulation lets you say goodbye to the lengthy process of heating each item before consumption. Moreover, its charming aesthetics make it an ideal gifting solution for any occasion.	739.00	69	2021-02-02 00:00:00	\N	688	17
415	Sunspray Sunscreen SPF 30	Inatur Sun Spray SPF 30 is an organic-mineral-aqueous system that ensures very high UVA & UVB protection. It is light, oil-free and excellent for sensitive skin, oily skin and delicate skin of babies and children. It is enriched with Carrot extracts - which helps in repairing tissues and protects from UV rays, heals sunburns, Honey extracts - which is full of antioxidants that help to slow down ageing, is extremely moisturizing and boosts the complexion and gives a healthy glow, Aloe Vera - that prevents skin ageing, treats sunburn and gives a radiant glow and Bergamot oil - a restorative skin toner.	292.50	93	2019-04-08 00:00:00	\N	1589	2
416	Vastu Combo Pack - Floor Cleaner + toilet cleaner	Runaway Vastu Floor Cleaner Contains Herbal & Organic Contents and Also it contains Various kinds of Natural Oils ,Which again helps in Reducing Negative Energy from your place. Runaway-Vastu Floor Cleaner have 5 in 1 Properties. 1.Powerfull Cleaner2. Retain Shine of Floor3. Kill Germs4. Reduces Negative Energy .5. Insecticidal Property It also Contains Gau Mutra . Gau Mutra is Natural Disinfectant, Anti Microbial & Anti Bacterial.	319.00	22	2021-01-09 00:00:00	\N	1891	37
417	Water Flask - Insulated Thermosteel, Flip Lid , Silver	This Insulated double walled vacuum water flask is designed for maximum temperature retention that keeps your favourite drinks hot/cold without altering their temperatures for a prolonged period of time. It will keep your drinks just the way you need them throughout the day. The taste and nutritive value of the drinks remain intact for a long time making the flasks very appropriate choice for storing beverages.	879.00	85	2019-01-06 00:00:00	\N	688	11
418	Drumstick - Organically Grown	Fresho Organic products are organically grown and handpicked by expert.  Product image shown is for representation purpose only, the actually product may vary based on season, produce & availability.	13.00	40	2019-12-10 00:00:00	\N	2027	22
419	Up Or Down Eau De Toilette Deodorant - For Man	A brand inspired by the Greek goddess of victory, it personifies strength, speed and energy and it launched its first perfume in 1929. Since then, a wide assortment of fragrance collections has hit the marketplace with refreshing, and eye-catching proposals that capture the essence and lifestyle of today´s man and woman.	223.20	86	2020-01-06 00:00:00	\N	1134	24
420	Ultra Healing - Extra Dry Skin Moisturiser With Vitamin C, E & B5	Let your skin experience the luxury of pure pampering with this Ultra Healing Extra Dry Skin Moisturizer Nourishes and Heals body lotion exquisitely created by Jergens. This deeply hydrating moisturiser penetrates deep into the layers of your skin for deep nourishment and moisturisation. Specially-created Formula with Vitamin B3 Complex. This specially-created formula is enhanced with a touch of Vitamin B3 complex that helps in healing your dry skin with intense moisturization. Heals Dryness at the Source and Locks in Moisture for 24 hours. The Jergens Ultra Healing Extra Dry Skin Moisturizer Nourishes and heals body lotion gently soothes and moisturises your skin to heal dryness at the source.	296.10	78	2020-12-06 00:00:00	\N	468	18
421	Organic, Fennel /Saunf/Sompu Powder	Organic Saunf is hygienically processed fragrant spice which is also known as one of the key ingredients of Chinese 5 spice powder. This is quite frequently used in many Indian recipes.	23.00	24	2021-05-03 00:00:00	\N	2281	1
422	Coconut Braker - Big	This tool for easily breaking coconut without spilling water in surroundings. Body is made of plastic with a heavy metal bar in the middle. Easy to clean.	129.00	91	2019-09-12 00:00:00	\N	1325	21
423	Truffel - Caramel	Make every moment sweeter by treating your senses to the deliciousness of a caramel centre, wrapped within creamy milk chocolate. Rejoice with loved ones by indulging in a Truffle, and revel in the generous blend of taste and texture.	190.00	50	2021-09-11 00:00:00	\N	1044	23
425	Stainless Steel Water Bottle - Blue, BB506 3	This blue coloured water bottle, made of stainless steel, is specially designed with a vacuum seal that prevents leakage. It is durable and lightweight. The slim design fits into most standard auto cup holders, making it perfect for long car rides and bags. The wide mouth of the bottle helps easy filling and also fits ice cubes.	249.00	80	2020-02-08 00:00:00	\N	2238	7
426	Mischief Avatar Deodorant & Body Spray Perfume For Men	Are you ready for some mischief? Switch on fun-mode with the Set Wet Mischief Avatar deodorant for men. Be the bright spot of the day - the fun guy who is in every friend circle. If your love giving quirky comebacks, if your jokes and memes get the likes, if your harmless pranks are the talk of town, this men’s deo is perfect for you! Set Wet Mischief Avatar deo with a feisty fragrance with the zesty scent of many spices, whispers of rosewood and a highlight of apples & melon. Make Set Wet your bro. Your avatar is Mischief Avatar.\nSet Wet Avatar range of deodorants for men is a burst of colour, energy, and passion that comes with the prime of youth. It is a collection sunny, sporty and charming fragrance for men that are perfectly suited to deliver to your varying avatars. Set Wet Avatar range of deo for men prevent body odour caused by the bacterial breakdown of perspiration in armpits and other areas of the body. This range of deodorant spray for men are perfect for everyday use, and can be used on both body and clothes. Set Wet is a Brand with an agenda of making men feel great again by bringing back confidence in them.	121.00	90	2019-02-04 00:00:00	\N	1568	16
427	Skin Fruits Fruit Moisturising Body Lotion	Joy Skin Fruits Moisturising Body Lotion is an intensive care moisturiser, with Active Fruit Boosters, which moisturises and softens skin leaving no signs of dryness. Enriched with Apple Extracts, jojoba and almond oils, it revitalises skins youthful beauty. It results in softer, silky, younger-looking skin.	68.85	11	2020-01-10 00:00:00	\N	2094	14
428	Multipurpose Germ Protection Anti-Bacterial Wipes With Lemon Fragrance	Corsafe advance: Multipurpose germ protection wipes\nProven Formula: Provides 99.9% protection\nAlcohol-free Wipes: suitable for all surfaces, indoor & outdoor\nSkin-friendly ph\nAntibacterial\nRefreshing lemon fragrance\nGood cleansing action: use on gadgets, toys, furniture, door handles, elevators etc.\n25 usable wet wipes of size 150x200 mm	100.00	22	2019-01-06 00:00:00	\N	1979	40
429	Basmati Rice/Basmati Akki - Rozana Super 90	Daawat Rozana Super 90 is the finest Basmati Rice in the mid-price affordable segment. It is specially processed for daily cooking across a multitude of regular dishes, a perfect fit for every day consumption. Rozana Super 90 promises a sweet taste and rich aroma as each grain is naturally aged.  Click here for unique and delicious recipes - https://www.bigbasket.com/flavors/collections/233/rice-rice-products/	340.00	84	2018-11-04 00:00:00	\N	1812	20
430	Milk power Frappe Milkshake - Belgian Chocolate	Real Milk Power Frappe Milkshake - Belgian Chocolate has the goodness of milk and exotic Belgian chocolate flavour. It has 30% more calcium and vitamin D2 than Cow Milk (based on values as per NIN, ICMR). It has no added preservatives. Taste and health in one packet. Enjoy this to tame your small hunger pangs.	27.00	95	2019-04-12 00:00:00	\N	1463	35
431	Peanut Butter - Unsweetened, Crunchy	If you like it healthy & intensely crunchy, this one's for you. 100% roasted peanut goodness, the Pure Peanut Crunchy is high on protein and mixed in with even more peanuts to give it that delectable crunch. With 30% more protein content, it's great before or after a workout. Peanut butter can be used as a spread on bread and chapati. It is rich in protein and Vitamin B6. It can be used as part of fitness diets and for those who want a diet rich in protein.	275.00	30	2020-10-12 00:00:00	\N	52	24
432	Salem Turmeric Powder/Arisina Pudi	As vibrant as its colour are the bountiful gifts of Turmeric. Known for its excellent anti-inflammatory & antioxidant properties, Turmeric powder is an essential component of almost all savoury Indian preparations. Orika sources superior quality turmeric from Salem, known for its high curcumin content. We go the extra mile to keep the curcumin intact with our meticulous processing methods. A pinch of this Turmeric powder unleashes bright yellow hues along with subtle & complex flavours.	24.75	94	2019-03-08 00:00:00	\N	1062	23
433	Body Fragrance - Alexander	Park Avenue Alexander - Truly for the masculine spirit which is high in optimism. The top note opens up with bergamot and settles down with musk and amber. It has floral notes at the heart which will ensure spirits are always high.For Beauty tips, tricks & more visitÂ https://bigbasket.blog/	149.25	24	2021-03-07 00:00:00	\N	2312	23
434	Steel Storage/Lunch Container- No.1, Blue, Klip It	Joyo Klip It Stainless steel container comes with easy locking. These containers are made from high quality non-magnetic stainless steel body. Joyo Klip It container has odourless lid cover with food-grade silicone seal (gasket) in lid & has all 4 sides locks which ensure airtight containers for keeping food fresh, 100% leak-proof containers for keeping food from spilling, stackable design for easily storing the containers on top of each other and the pioneering clip mechanism. Take this container to the office, school, camping or hiking.	79.00	51	2019-03-11 00:00:00	\N	1093	23
435	Ladies Finger	Ladies finger is a green vegetable with a tip at the end and a lighter green head, which is inedibe and to be thrown away.\nIt tastes mild and slightly grassy. \nDo not forget to check out our delicious recipe- https://www.bigbasket.com/cookbook/recipes/2136/cheesy-okra-bhindi-fritters/	26.73	72	2018-07-01 00:00:00	\N	2027	26
436	Aloe Vera Juice - Purifies Blood & Boosts Immunity	A natural anti-oxidant and blood purifier, Aloe Vera strengthens the immune system and improves digestion. It is a good skin tonic and anti-ageing agent. Jiva Aloe Vera Juice is made from premium-quality aloe vera plant as per ancient Ayurveda texts. Moreover, it is manufactured through sophisticated processes marked by Jivau2019s stringent quality standards in order to maintain the potency of the ingredients.	220.00	75	2019-07-01 00:00:00	\N	901	35
437	Balloon - Polka Dot, 12 Inch	Whether it is a party in the office, a Christmas bash, a baby shower, wedding, or a casual party for friends, these decorative items seem to be an essential of party supplies. They make the perfect party accessory for people who love to have a good time.	99.00	62	2018-06-02 00:00:00	\N	1018	29
439	Face Wash - White Tea & Chamomile	I am 100% free of paraben, soap, alcohol, artificial colouring and fragrance. Deep clean your pores with white tea and soy milk extracts and exfoliating microbeads. Prevent ageing and protect the skin from free radicals. The chamomile essential oil soothes and calms, leaving you fresh and relaxed.Tip: Following a regular skin care regime can help you achieve flawless skin. For more tips on skin care, visit bigbasket lifestyle blog, Click Here to visit bigbasket’s lifestyle blog	129.50	42	2021-02-09 00:00:00	\N	42	4
440	Bathroom Cleaner	PureCult Bathroom Cleaner I a biodegradable blend powered by essential oils works hard to remove water drop marks, soap scum and grime effectively from bathroom tiles, shower cubicles and washbasins. It leaves a layer of protection on the shower cubicles that makes it hard for the stain to get back. Sweet orange and Lemon essential oils are both known for their antimicrobial and antifungal properties and their refreshing fragrance.\nProduct: This bottle contains 500ml of concentrated, high-efficiency environment-friendly bathroom cleaner. This product is “Made in India” and proudly Indian owned.\nUsage: This product removes water drop marks, soap scum & grime from bathroom tiles, shower cubicles & washbasins. It also leaves a stain protection layer on shower cubicles.\nIngredients: Environment-friendly biodegradable surfactants, biodegradable scale removing agent and essential oils. Sweet orange & Lemon are known for their grime and stain cleaning properties.\nPackaging: This formulation packaged in a recyclable bottle, delivers the best wash. The shrink-wrap on the bottle meets the 50 microns government regulation.\nBe a Zero Hero: This product has Zero sulphates/phosphates/ammonia/bleach/artificial fragrance or colour.	209.30	58	2022-01-10 00:00:00	\N	1080	38
441	Imperial Desert Set - Aqua Leaves	The fusilli spiral on the wooden spoon is just right. We will not guarantee the effect to replicate with any other bakeware. As it is made of borosilicate glass, our bakeware can handle temperature as high as 300 degree Celsius. So you can use them to make a lot of things.	419.00	49	2019-09-02 00:00:00	\N	2224	30
468	Organic Wheat Dalia	Organic Tattvas Wheat Dalia is not just high in fiber but also free from any additional coloring or chemical enameling, making it the best fiber source for diabetics and the fitness conscious.	52.25	60	2018-10-04 00:00:00	\N	1061	24
442	Solitaire Storage Transparent Pet Container Set - Green Lid	These Steelo storage containers are made from high-quality plastic for everyday use. It seals the food effectively and has an easily stackable design for smart storage. The multipurpose airtight storage containers come with an attractive design, a food-grade quality that makes it hygienic for food use. It has a freezer without a lid, strong and durable body for longevity.	409.00	90	2020-05-11 00:00:00	\N	723	33
443	Organic Cold Pressed Virgin Coconut Oil	GoodDiet Organic Cold Pressed Virgin Coconut Oil is made from fresh milk extracted from Organic coconuts. It is ideal for healthy and flavourful cooking and also works wonder for skin and hair too.	239.00	58	2021-02-08 00:00:00	\N	1531	35
444	DiaFree Juice	CONTROLS BLOOD SUGAR: Karela, Amla and Jamun are traditional remedies that have proven to bring down blood sugar levels. Karela also is known as Bitter gourd contains an insulin-like compound called Polypeptide-p or p-insulin which has been researched to control diabetes naturally. Diabetic patients can benefit from this powerful combination of Indian origin and notice greater energy levels, lower blood sugar levels, lower cholesterol levels.LOWERS CHOLESTEROL: Karela ka juice is anti-inflammatory and helps in reducing the bad cholesterol levels in the body. Which means a healthier heart! It’s packed with various nutrients. Potassium absorbs excessive sodium from the body, which helps in maintaining the blood pressure of the body. Iron and folic acid, present in Karela are known to decrease the risk of stroke and keep your heart healthy.DETOXIFIES THE LIVER: Our Dia free juice with Karela in the mix cleanses your bowel as well as heals your liver.DOSAGE: Take 30ml of juice with equal parts water twice a day to help fight diabetes.	420.00	94	2020-10-08 00:00:00	\N	634	26
445	Hand Wash Rose & Geranium - Anti Bacterial	A transformative moment to energize and awaken your senses; this fresh, lively fragrance infuses your day with unlimited possibility. Hard working hands are gently cleansed with nourishing ingredients. The handwash lathers beautifully and leaves hands lightly scented with fresh, botanical fragrance Made without sulfates and parabens or dyes. Our vegan-friendly purely clean gentle hand wash delivers a rich, creamy lather to gently wash away dirt and germs, while soothing aloe, shea butter, coconut oil and nourishing vitamin E and leave hands feeling soft and smooth. This Anti Bacterial Neem based Hand wash cares for hands, keeping them feeling renewed, soft and supple. Morpheme Remedies has always formulated fragrances with the utmost of care. Drawn from nature, our unique formulations are artfully crafted to create products that are skin-compatible, environmentally conscious, effective and a pleasure to use. We opt for natural, high-quality, plant-based ingredients instead of chemical ingredients whenever possible. We use botanical extracts with health-enhancing nutrients, vitamins and vital antioxidants. Hydrating Cleanser: Rose & Geranium fragrance lightly scents this liquid soap, which cleanses gently without overdrying the skin, leaving hands conditioned and hydrated with glycerin and neem oil, and elevating the simple act of hand washing into a restorative experience.	349.00	37	2021-01-05 00:00:00	\N	926	31
446	Namkeen - Flattend Rice Mixture	SLN Namkeens are made by combining the freshest of ingredients with a traditional recipe. They are perfect to relish as a snack, with your evening tea or coffee and can also be used in chaat for added flavour or to customise it as per your liking.	38.00	42	2018-06-12 00:00:00	\N	467	38
459	Water/Juice Glass Tumbler - Volvic 3303	Roxx tumblers are available in different designs, shapes, sizes, and materials. Each piece is durable and is made using premium quality to suit your needs. These glasses are strong, durable and fit for serving at parties or can be used at home for daily use.	425.00	36	2019-04-05 00:00:00	\N	1479	6
460	Red Poha	Turn Organic Red poha is made from flattened Organic red rice. Red rice is easily digestible and is perfect for a morning or evening snacks.	80.00	73	2019-02-07 00:00:00	\N	191	23
461	Brightening Serum	Brightening serum contains a potent active lightening complex known to even the skin tone, lighten freckles and age spots as well as helps to reduce hyperpigmented areas. Ferulic acid and Waltheria Indica extracts have a regulatory effect on melanin skin pigmentation. It is clinically tested to decrease pigmentation and brighten your skin.	942.00	80	2018-01-12 00:00:00	\N	317	12
447	Borosilicate Glass Rectangular Food Container With Green Lid	These BB Home borosilicate food storage containers are crafted and manufactured to bring the best of the quality, clarity in glass and shine for elegance. These borosilicate food containers are very superior in quality with high wall thickness and with a heavy bottom to flaunt your style and elegance to your guest at the first impression. These containers are manufactured with high precision to ensure no wobbling on the rim or bottom of the glass. These are 100% food grade and dishwasher safe. These are airtight borosilicate container with high-quality gasket fitted on the lid to ensure freshness of food stored inside. It can withstand up to 400 degrees temperature. It can be used in the microwave, OTG/Oven or even it can be placed inside the electric cooker to cook your delicious food. These borosilicate containers come with coloured lids which are 100% food grade and BPA free. These containers are freezer safe as well. These food storage containers can be used to store fresh food and even leftovers so that, you can re-heat anytime without the hackles of using multiple containers. Even, these can be used as tiffin boxes for light bites.BB Home products are always high quality and at a very competitive price compared to other branded products in the market. So, when you get the best or better than the brands available in the market at a lower cost, definitely you save money and get the best quality product for your use.a lower cost, definitely you save money and get the best quality product for your use.	209.00	97	2020-02-02 00:00:00	\N	1331	38
448	Black Naturals	Garnier Black Naturals is enriched with the goodness of Almond Oil and Black Tea extract Enriched with the goodness of Almond Oil and Black Tea Extract, Garnier Black Naturals is a no-ammonia crème formula that works in just 15 minutes, covers 100% greys and lasts upto 6 weeks.	37.00	47	2021-03-10 00:00:00	\N	2193	9
449	Sorghum Rava/ Semolina	Sorghum Contains More Antioxidants Than Blueberries And Is High In Protein, Iron And Fiber, With No Gluten, Which Makes It A Perfect Dietary Grain For Those With Celiac Disease. Sorghum Supports Metabolism And Its Niacin Content Helps Break Down And Metabolize Nutrients Into Energy. Niacin And Iron Also Supports Healthy Circulation, And Iron Plays A Role In Immune Function. It Is Diabetic Friendly And Gluten Free. \nMillets Have Been Cultivated From Pre-Historic Times And Is One Of The Worlds Earliest Food Plants Used By Humans. It Is Naturally Gluten Free And Is Non-Acid Forming. Millets Are Alkalizing Foods Which Help In Preventing Chronic Diseases. \nSorghum Is Rich In Antioxidants And Has Anti-Carcinogenic Properties When Consumed Regularly As Part Of Your Diet. It Promotes Cardiovascular Health Better Than Other Cereals.	80.00	93	2020-10-11 00:00:00	\N	510	4
747	Sylvana Whisky Glass Tumbler	These simple yet elegant-looking glasses are ideal for serving scotch and whiskey. Enhance the beauty of your in-house bar with this beautifully crafted crockery.	489.00	1	2019-05-09 00:00:00	\N	562	21
450	Sensitive Toothpaste - Fresh Mint	Sensodyne toothpaste provides clinically proven relief and daily protection for sensitive teeth. Sensodyne relieves sensitivity by building a protective barrier that blocks the sensitivity caused by hot, cold, sweet and other contact triggers. It contains fluoride to prevent cavities so that you can use it every day. Toothpaste has a cool refreshing taste that leaves your mouth feeling fresh and clean. For best results, use twice daily	215.60	65	2018-10-04 00:00:00	\N	939	37
451	Floor Cleaner - Lime	Is Herbal Perfumed Deodoriser and Cleaner,, Is Ideally Suited for Cleaning Floors, Kitchen and Toilets, repels flies, Mosquitoes and Cocokroaches away.	70.00	45	2019-12-07 00:00:00	\N	1932	19
452	Hair Serum - Anti-Dandruff	I am 100% free of parabens, petrochemicals, sulphates, alcohol, toxic ingredients, artificial coloring and fragrance. Powered by the potent blend of essential oils of Eucalyptus and Chamomile. Rich in Vitamins and minerals, Aloe Vera juice, extract of Indian gooseberry and Patchouli in my formulation.	637.50	29	2019-01-06 00:00:00	\N	42	37
453	Face Mask 3-Layer Surgical - Disposable, Anti-Dust & Anti-Pollution, With Earloop	This face protects your face, nose, mouth, against dust, smoke, ash, pollution and other particulate matter in all weather conditions. It’s soft & super light material does not cause any irritation even after prolonged wearing. The non-woven design provided on the mask filters the air properly and allows it to pass through, letting you breathe even while wearing the mask. This face mask is made up of special multilayer non-woven fabric to ensure an enhanced level of protection from even the smallest particles present in the air. The face mask is great for protecting you from dust, pollution, smoke etc to help you breathe easier and stay germ-free.Disclaimer - We have suspended returns on Face Mask products for the safety of our customers and delivery agents. We will update the policy once the situation has resolved. Thank you for your support and understanding.	79.00	13	2020-02-10 00:00:00	\N	1234	30
454	Veda Keto-Slim Ultra Weight Loss	Vedapure Naturals Keto Slim advanced weight loss allows you to burn fat naturally through a metabolic state known as ketosis. When you are in the state of ketosis, your body burns fatty acids instead of sugar or glucose. This means that your body does all the heavy lifting work to achieve weight loss by turning excess fat into your body's main source of energy fuel.	1699.00	82	2019-04-06 00:00:00	\N	689	9
455	Basmati Rice Mini Mogra, Broken/Tukda 5 Kg + Wheat Flour (Chakki Atta) 10 Kg	Basmati Rice Mini Mogra, Broken/Tukda:  bb Royal Mini Mogra Basmati rice leaves a lasting impression because of its flavour and fluffy texture. 1401 and 1121 variety of raw rice ensures great quality and taste. Sourced from the Basmati-rice-bowl states of Punjab, Haryana and Uttarakhand, this rice is processed in GMP plants using Swiss technology to ensure superior quality and high nutritional value. With its small size, this rice is best suitable for daily dishes like dal chawal, khichdi and kheer.Wheat Flour (Chakki Atta): Atta is made from the choicest grains - heavy on the palm, golden amber in colour and hard in a bite. It is carefully ground using modern chakki grinding process for the perfect balance of colour, taste and nutrition which also ensures that BB Royal atta contains 0% Maida. The dough made from BB Royal Atta absorbs more water, hence rotis remain softer for longer.Click here for unique and delicious recipes - https://www.bigbasket.com/flavors/collections/232/flours-sooji/	575.00	22	2021-01-11 00:00:00	\N	2281	28
456	Tapioca	Starchy and mild flavoured Tapiocas are edible roots with a grainy textured flesh.	17.00	64	2022-02-02 00:00:00	\N	2027	13
457	Organic - Kalonji	Reduces joint pain, controls blood pressure, keeps check on diabeties.	47.50	54	2020-02-08 00:00:00	\N	1061	19
458	Savoury - Pizza	Per 100 gm : Energy - 504 kcal, Carbohydrate - 63.9 g, Protein - 4.3 g, Fat - 25.7 g	190.00	3	2020-03-08 00:00:00	\N	2156	3
462	Ivory Glass Bottle - Orange & Yellow Floral	Glass has almost zero rates of chemical interaction thus ensures strength, aroma and flavour. Exclusive airtight, leak resistant lid safeguards from spoilage and bacteria.It is ideal for storing milk, juice, water, lassi, cold coffee etc. Treo by Milton is synonymous with elegant and utilitarian glassware, handpicked from the finest furnaces in the world. Created with the perfect cuts to suit Indian tastes, these glass items are made to keep your guests talking while being functional additions to your home.	190.00	82	2020-01-12 00:00:00	\N	1340	36
463	Sheer Perfume For Women - EDP	Walk into the room like a breeze, bringing along with you a culmination of some of the most sensual fragrances. With fresh green pear and cheerful red strawberries, the sweet top notes are complemented by the elegance of floral elements and a dash of pink pepper. The fragrance has been skilfully crafted to have a luxurious and cheerful warmth that stays with you. The first notes are bright and mouthwatering thanks to a green pear accord. The fragrance starts on an energising clementine, conveying joy and spontaneity. Cheerful notes of red fruits highlight a sweet and crunchy facet while the Pink Pepper SFE highlights a vibrant and contrasting sensation. The heart reveals the softness and delicacy of four flowers: Jasmine, Peony, Heliotrope and Magnolia. The jasmine combines a touch of depth and sophistication while peony brings a dewy, shimmering, spontaneous facet. The contrasted floral bouquet has been shaped as a celebration of refined femininity. The dry-down is enticing and intense with a blend of vanilla, woods (Sandalwood, Cedarwood) and musks. The vanilla provides a hint of warmth thanks to its addictive and gourmand facet, contrasted by a note of cedarwood, conveying mystery to the perfect seduction. As a final touch, musks enhance the sensual harmony of the fragrance.	1435.50	86	2021-05-09 00:00:00	\N	2040	9
464	Dog Treats - Diced Chicken	Chip Chop Diced Chicken is made of fresh meat. They are carefully prepared to provide a pure, tasty and highly digestible snack. Chip Chop has goodness with nutritional benefits for your pets well being. Chip Chops are suitable for feeding as a snack, or a reward to show your pet love.	195.00	90	2022-01-01 00:00:00	\N	828	25
465	Baking Powder - Double Acting	By Nature double-acting baking powder is made of the freshest & finest ingredients to give you consistently best baking experience. Double-acting baking powder allows for leavening twice which leads to fluffier goods. Unlike conventional baking powders, our formulation leaves the baked goods with no bitter, metallic aftertaste.	145.00	56	2019-11-08 00:00:00	\N	731	11
466	Ready Mix - Kheer, Vermicelli	Gits present their exotic range of sweet dishes and desserts which are ready to make and are ideal for those kitty parties and get togethers that require you to rake up quick snacks and recipes. Experience the rich and smooth flavours encompass your mouth and tastebuds in every bite and it is sure to become a favourite among your family and friends.	53.00	49	2019-08-02 00:00:00	\N	1950	11
467	Scrubbing Broom Brush - Outdoor	Standee broom brush with handle is made of best quality material with a firm grip.Thick and hard bristles easily cleanes stubborn stains. Ideal for outside floor cleaning.	256.50	85	2019-01-09 00:00:00	\N	2243	34
470	The Original Kashaya - Caffeine Free	Relax and unwind with a cup of our Original Kashaya, an immunity-boosting delectable blend made from 15 traditional Indian herbs and spices, each having unique healing powers. Completely caffeine-free, this deliciously strong yet balanced blend has been crafted to make you feel at the peak of your health. Coriander, black pepper and cumin form the magical trio that will help boost your immunity levels. Cardamom and clove lend a sweet-spicy aroma while the dry ginger and liquorice give it a zesty sweet undertone. Heal your body, awaken your mind and soothe your soul with our immunity building delicious Kashaya.The Original Kashaya helps to relieve cold, cough, sore throat and headache. It aids in digestion and boosts immunity.Mastered over generations and inspired by Ayurveda, Kashaya is a traditional Indian hot brew blended with the finest quality of aromatic spices and therapeutic herbs which promises invigorating taste while restoring beneficial effects on the mind and body.	279.00	62	2020-02-03 00:00:00	\N	2206	40
471	Nizami Hyderabadi Cuisine	It was in the kitchens of the erstwhile Nizams of Hyderabad where cultures truly blended together by taking the best of each other – be it Arabic, Mughal, Turkish or South Indian. Like most of India’s cities, Hyderabad is a blend of fairy-tale and reality, a motley mix of the old and the new, forming an exotic background for it’s much sought after and mouth-watering cuisine. Since this spice blend was meant for the palate of the Royals, the recipe and ingredients were under guard and preparation techniques confined to the secrecy of the Palace Kitchens. Through Afifa Begum, we at Junyali are proud to be able to present to you the Nizami Spice Blend directly from the Royal household. It has been refined so that it can be used for all Nizami cuisine! Ghee and slow cooking is always recommended.	395.00	88	2020-01-10 00:00:00	\N	741	15
472	Elegance Deodorizing Talc - For Men	This luxury perfumed talc leaves your skin feeling soft and fragrant throughout the day. The fragrance will keep you refreshed and comfortable. The rich and the authentic fragrances from the house of Yardley, which will keep you energizing and rejuvenating.	157.25	73	2020-08-08 00:00:00	\N	1023	40
473	LED Bulb - 10 Watt CDL Round Base Lyor 5 Star Series, Cool Day Light White, B22	Crompton presents a 5 star LED lamp that adds to the design and comfort of your house. If you have frequent voltage fluctuations then do not worry as this lamp has a voltage fluctuation guard. This energy-efficient 10-watt lamp comes with a year warranty.	149.00	3	2019-04-02 00:00:00	\N	872	21
474	Organic Rasam Ready Mix - Long Pepper	This is a healthy form of Rasam which is made from Long Peppers. Long Peppers has been proven as prevention of many forms of cancers. This can be consumed as soup. Long peppers help in bronchitis, asthma, increases immunity, improves digestion and remove toxins. Certified organic products are only used.	85.00	85	2020-06-04 00:00:00	\N	2152	35
475	Gold Caramel Candy	Your trusted brand, Alpenliebe is known for its exceptionally smooth and creamy, melt-in-your-mouth qualities. Full of milky richness, Alpenliebe Gold is a fun-filled candy to have at any time of the day. Show your loved ones how much they mean to you by sharing Alpenliebe candies with them. Alpenliebe – bring hearts closer	50.00	8	2018-05-08 00:00:00	\N	605	35
476	Masala - Birayani Pulao	Mdh Briyani Masala Is An Aromatic Mix Of Spices. It Made Up Of Quality Of Ingredients. It Can Be Used To Make Exotic Briyani.	80.00	2	2018-05-05 00:00:00	\N	1982	36
477	Hair Fall Control Oil	Dr Batra’s Hair Fall Control Oil contains Tulsi extract, Brahmi Oil and Thuja. Enriched with the goodness of Tulsi extract stimulates the proliferating cells in the hair root. Brahmi Oil strengthens hair roots by providing nutrition. Thuja controls hair loss. The Hair Oil nourishes the hair cuticles without a feeling of sticky or heavy. It has a very soothing calming effect not only on hair but also on the nervous system. Its natural ingredients prevent hair loss and boost hair growth.All Dr Batra’s Products are formulated with natural actives. The proportion of surfactants in Dr Batra’s Hair Care Products is much lower, as compared to other cosmetic products, thus protecting the scalp and hair from chemical damage. Dr Batra’s Hair Care Products does not contain SLS & Paraben (a very harmful and carcinogenic).	145.00	92	2020-06-11 00:00:00	\N	702	1
478	Bio Renew White Strawberry & Sweet Mint Conditioner	Gently condition your hair with Herbal Essence's bio-renew White Strawberry & Sweet Mint Conditioner to leave it voluminous and vibrant. Crafted with bio-renew, our signature blend of essential antioxidants, aloe and sea kelp, White Strawberry & Sweet Mint Conditioner also helps purify and protect against impurities to bring your hair back to life. Free of parabens, gluten and colourants, White Strawberry & Sweet Mint Conditioner gently conditions as it infuses crisp notes of white strawberry, delicate jasmine and invigorating mint into your hair.	468.00	50	2021-12-04 00:00:00	\N	617	18
479	Comfort Bathroom Stool Plastic/Patla - Plain, Big, Assorted	Joyo Patla is a portable furniting item used for sitting. It can also be used in bathrooms to facilitate bathing or for washing clothes while sitting on it. It is made of strong and durable material and is easy to carry around.	259.00	60	2018-04-07 00:00:00	\N	1036	35
480	Bounce Biscuits - Elaichi Creme	Deliciously creamy and deliciously fun - Sunfeast Bounce. These biscuits are available in four tasty flavours- Chocolate, Orange, Elaichi and Pineapple. The flavoured biscuit shell encasing the soft creamy centre transports you to a world of fun and excitement!	27.00	25	2021-05-07 00:00:00	\N	213	20
481	Pumice Stone & Emery Foot Filer - FFL3407, Colour May Vary		175.00	37	2021-03-02 00:00:00	\N	1762	22
482	Olive Oil - Classic	The La Espanola pure Olive oil is primarily refined olive oil with a small addition of virgin for taste. It has a superior aroma and flavour that is ideal for daily Indian cooking. Our pure olive oil has strong Anti-Inflammatory properties, large amounts of antioxidants and multiple health benefits. Use a drizzle of the La Espanola pure Olive oil for cooking or as a dressing on salads to keep your heart health in check. It contains zero trans fat and cholesterol. Packed with the goodness of antioxidants, olive oil is a rich source of vitamin E and supports your metabolism. Drizzle, dress or pour our olive oil to enjoy the deliciousness of hearty Italian cooking. A healthier pick than vegetable and seed oils, our olive oil is neutral in taste and can be used for all types of Indian cooking including deep frying, roasting etc.	589.00	48	2018-09-12 00:00:00	\N	1097	36
483	Light Soy Sauce - Reduced Salt	Tai Hua soy sauces are traditional Chinese flavoured soy sauces, naturally brewed from selected premium soy beans, wheat flour, water and salt. Tai Hua Sauce has well-balanced flavours of saltiness, sweetness and tartness. Ideal to cook food or use as a dip. Tai Hua Soy sauces are manufactured in Singapore.	346.50	74	2020-04-11 00:00:00	\N	1513	21
484	Kitchen Cleaning/Dusting Microfibre Cloth - Red & Grey, G130064RG	Keep your kitchen tidy and clean with these red and grey coloured microfibre cloth. Since the cloth is made using microfibre, it can absorb more water than its weight. It is easy to clean and dry. It traps dirt like a magnet. The fibres are super soft hence makes the cleaning ultra smooth and relaxing. It's a pack of six.	219.00	32	2020-07-01 00:00:00	\N	831	16
485	Painting Kit	Doms Painting Kit is a perfect value kit that comes in a convenient and attractive pack. It is a perfect kit with assorted products suitable to gift your children, their friends or students. It is suitable for beginners to start painting. The kit contains a Drawing Book, 12 Shade Bi-Colour Pencil, 12 Shade Oil Pastels, 12 Shade Water Colour Pens, Water Colour Cake Pack, 6 Shade Glitter, 12 Shade Extra Long Wax Crayon and a Pencil Kit.	196.00	73	2018-07-05 00:00:00	\N	1591	4
486	Diamond Skin Brightening Kit - Consumer Pack	Joy Diamond Brightening Facial Kit contains Diamond Ash and Natural Extracts to make skin brighter and polished. It brings out radiance and shining effect of the skin. Step 1: Joy Diamond Scrub Cleanser: Enriched with Diamond Ash, Vitamin E, Wheatgerm and Almond oil, this unique scrub cleanser effectively cleanses the skin to reveal natural brightness. It revitalizes and rejuvenates skin. Step 2: Joy Diamond Skin Brightening Cream: Contains Diamond Ash and natural moisturisers which improve the skin’s ability to retain moisture and hydrate itself. The skin’s resilience and elasticity improves, making it supple and firm. Step 3: Joy Diamond Youthful Shine pack: Detoxifying shine pack removes dead skin cells and regenerates new cells to provide glow and youthful shine. Extracts of Aloe, Almond, Hops, Evening Primrose and Gotu Kala increases the vitality of skin by preventing early wrinkles and lines Step 4: Joy Diamond Polish Cream: Zero Oil Cream forms an invisible layer on the skin thereby protecting it from environmental pollution, impurities and UV rays. It imparts a smooth and bright complexion that lasts all day.	150.00	9	2022-01-03 00:00:00	\N	2094	26
487	Organic - Turmeric Powder/Arisina Pudi	Turn Organic brought to you its Premium, fresh and healthy Organic Turmeric Powder with no added pesticides and fertilizers. Popularly known as Haldi, commonly used as a spice in Indian cuisine and even curries, for dyeing, and to impart color to mustard condiments.	32.00	33	2019-04-04 00:00:00	\N	191	38
488	Natural Neem Agarbatti	Goodknight Naturals Neem Agarbatti, a 100% natural mosquito repellent agarbatti (incense stick). Goodknight Agarbatti is infused with nature's two most potent natural ingredients - Neem and Turmeric which can repel mosquitoes and provide effective mosquito protection.	180.00	92	2018-08-12 00:00:00	\N	616	10
489	Raspberry Strawberry Preserve	Luscious Raspberries and Juicy Strawberries Blend Together to make this Delightful Preserve That's a Hit with Everyone, Perfect for a Delicious Breakfast and Also for Your Desserts	349.00	34	2018-06-03 00:00:00	\N	1740	31
490	Meghdoot Honey Almond Body Lotion	Meghdoot Honey Almond Body Lotion is enriched with honey, aloe vera and oil extracts of almond that helps attain young soft and glowing skin by reducing skin pigmentation and wrinkles. It also helps reduce excessive dry skin. It has the perfect balance of almond oil and honey along with aloe vera. This lotion deeply nourishes and moisturises your skin making it smooth and youthful. It keeps your skin healthy and naturally glowing.	195.00	52	2020-11-01 00:00:00	\N	458	27
491	Hajmola Maha Candy - Aam+Imli	Hajmola Maha Candy is a zingy tangy candy thats fun to have any time of the day. And whats more, it gets your digestive juices working better.\n\nIts a great way to enjoy while staying healthy. The Candys khatta meetha taste is available in two different fun-filled flavours- Albela Aam and Chulbuli Imli  For Beauty tips, tricks & more visitÃ‚ https://bigbasket.blog/	117.00	76	2020-07-06 00:00:00	\N	1186	25
492	Rice Bran Oil	Fortune Rice Bran Health Oil is physically refined oil, it contains Gamma Oryzanol, that reduces cholesterol, keeps heart healthy.\nVitamin E helps in maintaining the balance of the nervous system, natural antioxidants.\nBest suitable for health conscious people.	173.00	43	2019-04-01 00:00:00	\N	1629	1
493	N95 Washable Face Mask - Blue, Medium	Nirvana's N95 washable masks give protection against 96% of germs and contaminants. This anti-viral mask is designed with 3 layers to keep you guarded against the harmful bacterias and viruses. The outer and inner layers are made from all-natural fabrics like cotton, linen, hemp, and flax, and a nanofibre filter is placed in the middle to provide maximum protection against particulate matter and contaminants.\nThe filtering efficiency of a mask depends on its proper fit. Nirvana masks have an adjustable secured noseband that always ensures perfect fitting and comfort. It is available in three different sizes (small, medium, and large). Medium Size fits a person weighing between 35 Kg to 65 Kg.	299.00	4	2018-05-02 00:00:00	\N	73	33
494	Coriander Powder	Patanjali Coriander Powder is the powder obtained by grinding clean, sound, dried mature fruits of Coriandrum Sativum. Add it to bring the aromatic taste of coriander to your food.	24.00	56	2019-04-08 00:00:00	\N	2275	35
495	Dressing - Creamy Caesar	Vegetable Oil (Soybean and/or Canola), high fructose corn syrup distPickle relish (Cucumber, distilled vinegarm, water, Salt, Xanthan gum, alum), High Fructose Corn Syrup, Water, Cucumber Juice, Tomato Paste, Sugar, Distilled Vinegar, egg Yolk, Contain less tahn 2% of Salt, modified food starch, natural flavor, Spices (catsup Seasoning, allspice, ginger, mustard flour, tumeric), Onion Powder, Propylene glycol alginate, Xanthan gum, Calcium disodium EDTA to Protect flavour, Caramel color.	270.00	91	2019-02-03 00:00:00	\N	558	30
496	Shishu Taila - For Healthy Skin & Stronger Bones	Massaging infants has various health benefits and it is a beautiful way of expressing your love and are to them. It is necessary to protect, hydrate and moisturize baby's skin since the beginning. Sri Sri Tattva Shishu Taila is a wonderful blend of exquisite herbs prepared by restoring the essence of Traditional Ayurvedic oil. Suitable for a newborns skin, this oil helps to protect & nourish it effectively. It also helps strengthen infant's bones. Keep the delicate skin of your baby healthy&.ftwithSriSriTattvaShishuTaila.Protects & nourish the baby’s skin.Therapeutic uses: good for the skin.Improves complexion.Reduces skin dryness due to Vata dosha in winter.ItchingGood for hair.Cuts or wounds.Cracked skin.Strengthens tissues & bones.Nourishes tissues.Burning sensation caused by pitta vitiation in summer.	200.00	45	2021-07-10 00:00:00	\N	12	19
497	Chocolate Flavoured Lubes	SKORE Lubes is specifically aimed at enhancing your foreplay sessions and promises to drive you and your partner wild with pleasure. Now Foreply in new Chocolate flavour.	300.00	54	2021-04-01 00:00:00	\N	745	24
498	Free Range Eggs - Omega 3	Happy Hens Farms Eggs are from chickens feed on herbs, grains, in addition to bugs, greens and others in the range which enriches the eggs uniquely. These are providing the strength and energy to patients. Our eggs are hygienically processed and also safely packed for keeping these free from any contamination and impurity. It contains rich nutritional content, protein, rich taste and the fragrance.	150.00	85	2020-01-10 00:00:00	\N	1423	26
589	Baby Oil With Fruit Extracts	Gentle enough to be used from birth, Mee Mee olive baby oil blends olive oil and sunflower seed and oil making it ideal for your baby's daily massage. It is micro-biologically tested to suit your baby. Olive oil keeps the skin soft and beautiful. Ideal for a smooth massage on a baby's delicate skin.	343.20	44	2020-09-07 00:00:00	\N	1287	20
499	Whiteglow Skin Whitening & Brightening Gel Creme PA+++ - SPF 25	Lotus Herbals Whiteglow Skin Whitening & Brightening Gel Cream SPF-25 is an apt product to help you fight the stern rays of the sun and remain tan free for a long period of time, thanks to its SPF 25 PA+++ formulation. It has a one of its kind base that has the amazing combination of a gel and a cream. This unique base facilitates fast absorption, leaving you with youthful looking supple skin that radiates brightness. The mulberry, saxifrage and grape extracts help make the skin brighter, override the harmful effects of skin darkening and lend a beautiful texture to the skin surface post application. Its milk enzymes act as natural fairness agents and lighten the skin tone with a visible difference. You can now effectively tackle the harmful effects of both UVA and UVB on applying this cream.Tip: Following a regular skin care regime can help you achieve flawless skin. For more tips on skin care, visit bigbasket lifestyle blog, Click Here to visit bigbasket’s lifestyle blog	292.50	63	2019-01-04 00:00:00	\N	454	28
500	Premium Californian Roasted & Salted Pistachios - Value Pack	Happilo has travelled the world to get the finest gourmet dry fruits, Pistachios are a wonderful, fun and tasty snack, which are lightly salted. Crack open the shells to treat your taste buds for a snacking sensation.	656.25	7	2019-01-07 00:00:00	\N	592	36
502	Nutrition & Health Drink - Pista Badam	Complan is a scientifically developed nutrition and health drink with clinically proven formula to give kids’ 2 times faster growth. This milk protein-based formula also supports immune function, helps brain development & functioning. Serve Complan to your kid two times a day as part of their daily balanced diet and help your children grow 2 times faster. Available in 4 delicious flavours - Royale Chocolate, Creamy Classic, Kesar Badam and Pista Badam.Complan is a nutrition and health drink with clinically proven formula to deliver 2 times faster growthContains 100% First Class ProteinContains 34 Vital NutrientsNutrients like Vitamin A, E &C supports immune functionNutrients like Iodine, Iron, Vitamin B12 and Folic Acid helps Brain development and it’s functioningNutrients like Sodium, Potassium & Chloride maintains fluid balance in the bodyCan be consumed with milk or water	315.00	18	2020-03-08 00:00:00	\N	2198	16
503	Chocolate Biscuits - Cream 4 Fun	Dukes Bourbon Biscuits are not only tasty; it has the goodness of chocolate taste. It gives real aroma of chocolates makes you go enticing and induce you to take bites over and over. Each bite of this biscuit is a delicacy for your taste buds.	25.00	92	2022-05-12 00:00:00	\N	1044	25
504	Oat Krunch - Dark Chocolate	Moments with crackers have a special place in our lives, bringing us and our families warmly together every day during breakfast, tea or any time you need a munch. It is the ideal product for everyday snacking, and Munchy's Crackers have made it easier than ever. Oat Krunch is Higher in Wholegrain, Trans-fat free with No Preservatives. Made from the Natural goodness of Oats. Packed in a convenient sachet, Oat Krunch is a great snacking companion wherever you go.\n Benefits :\n1. Crackers are generally low in calories.\n2. They are a rich source of B-Complex vitamins and dietary fibre.\n3. They are a good source of energy.	125.00	88	2020-11-03 00:00:00	\N	629	12
505	Soft & Fresh Soap Bar	Pears Soft & Fresh Soap is a multi-purpose soap that cleans your skin and keeps it supple all the time. True to its name, the soap gives you a soft and fresh skin instantly.Its active ingredients moisturize your skin from deep within and keeps it looking clean and the pure glycerin and mint extracts give it an instant cool freshness. Give yourself a refreshing shower every day, buy the Pears Soft & Fresh Soap Bar, right here!  For Beauty tips, tricks & more visit https://bigbasket.blog/	72.00	19	2020-02-10 00:00:00	\N	2026	31
506	Oxygen Moisture Shampoo	Many of us with fine, flat hair avoid using shampoo to keep our hair feeling light and looking full. But did you know that with a specially designed shampoo for fine hair you can get the look and feel of naturally voluminous, bouncy hair without sacrificing nourishment? The new Dove Oxygen Moisture s is here to add the difference to your hair. It is made with a transparent, lightweight formula that cleanses and moisturizes hair without weighing it down. Smooth, thicker looking and bouncy, let your hair love itself. Dove Oxygen Moisture Shampoo is designed for flat, fine hair. The nourishing system of Dove Oxygen Moisture Shampoo boosts hair with up to 95% more visible volume and fullness. Infused with Oxyfusion technology, this volumizing shampoo helps give the appearance of naturally bouncy hair that feels smooth and moisturized without being weighed down. Deeply conditioning, this nourishing shampoo for thin hair delicately cleanses and moisturizes strands to leave you with strong hair thats nourished, silky and smooth. Every wash gives your locks a moisturizing and volumizing boost, for touchably soft, smooth and beautiful hair. Based on a lab test of visible volume with Dove Oxygen Moisture system vs unclean hair.	466.20	100	2020-09-02 00:00:00	\N	1925	28
507	Almond Milk - Unsweetened, Lactose-Free, Plant-Based Milk Alternative	Urban Platter Unsweetened Almond Milk contains Premium Almonds from California and mountain spring water from the Himalayas.\n\nMake the switch to dairy-free deliciousness you never thought possible. Our Unsweetened original almond milk is infused with plant-based nutrition to keep you and your family healthy.\n\nEvery serving pours on 40% more calcium than dairy milk. Plus, our almond milk is naturally high in protein, low in fat and packed with vitamins and minerals.\n\nFind yourself blown away by the creamy goodness. Pour it over your favourite cereal, add a dash of it to your coffee/tea or pair a glass of it with a warm cookie.\n\nUrban Platter - Simply Good Food! :)	237.50	59	2020-08-11 00:00:00	\N	1107	36
508	Herbal Vedaprash Immunity Booster	We at Vedapure believe in the complete natural herbal formulation to care for your overall health by providing nutrition which we miss in day to day life. The day-to-day illness which is common these days, vedaprash chyawanprash can help your body's immunity to fight them. Vedaprash is a great combination of extraordinary taste and exquisite ingredients.	649.00	78	2020-11-08 00:00:00	\N	689	9
509	Table Ring - Trivet Round, Dia-13 cm	Easy to clean, durable prevets your dinning surface from getting damaged due to hot vessels. Easy to clean	45.00	35	2020-03-05 00:00:00	\N	1325	27
510	Premium International Healthy Nutmix - Value Pack	Confused about which nuts to take in your diet? Switch to Happilo Healthy Nutmix with an ultra-healthy combination of dry fruits, which give you your daily intake of nutrients. Time to be happy, lovely and healthy.	401.33	69	2019-01-12 00:00:00	\N	592	36
511	Non Scratch Sponge	Scotch-Brite Non Scratch Sponge is designed to help you with cleaning delicate utensils in your kitchen with care. The Non Scratch Scrub Sponge is a durable solution engineered with both, non woven crimped web and a sponge on either side. Now your glassware, non-stick cookware and other delicate utensils get non-scratch cleaning & the care they deserve!	57.00	82	2021-01-02 00:00:00	\N	2056	25
748	Flavoured Milk - Pista	Heritage Flavoured Milk - Pista has the honesty of milk with the luscious flavour of pistachios. Throughout summers a tumbler of chilled Heritage Pista Flavoured Milk is all you want to strike the heat.	96.00	71	2021-03-06 00:00:00	\N	1245	31
512	Premium Care XXXL - 23 Diaper Pants	Pampers baby-dry pants style diapers are the only pants in India with new Air Channels providing your baby with a new type of dryness overnight; breathable dryness. Magic Gel that locks wetness away for up to 12 hours of dryness. The new & improved product design enables a comfortable fit, closer to the baby’s body. Flexible waistband that adapts to baby’s movements for a comfortable fit. Baby lotion with Aloe Vera helps protect your baby’s delicate skin from diaper rash and irritation. A top layer with cotton-like soft material, for a comfortable night’s sleep. Fun exterior graphics; fun designs and characters to enjoy with your baby.	850.26	50	2021-06-03 00:00:00	\N	1470	28
513	Drumstick - Organically Grown	Fresho Organic products are organically grown and handpicked by expert.  Product image shown is for representation purpose only, the actually product may vary based on season, produce & availability.	13.00	14	2020-04-03 00:00:00	\N	2027	32
515	Shikakai - Amla and Bhringraj	Godrej Shikakai Amla Plus conditioning hair soap is enriched with normal ingredients, namely Shikakai, Amla and Bhringraj that cleanse condition and encourage your hair, keeping it spongy, smooth and shiny. It has Amla Plus conditioning that provides conditioning similar to shampoos. Godrej Shikakai with natural ingredients is a suitable and cheap way to have dirt free, shiny and strong hair.  For Beauty tips, tricks & more visit https://bigbasket.blog/	20.90	17	2019-06-07 00:00:00	\N	690	28
516	Amritsari Chhole Masala	Keya Khada Masala blends are whole spice mixes, hand-picked in the right proportion by expert chefs, gently blended and coarse ground to unlock its taste and aroma only while cooking. The magic of aroma-locked Amritsari Chhole Masala comes alive with flavourful bursts of real whole spices.	40.95	10	2021-10-06 00:00:00	\N	1499	10
517	Meswak Toothpaste	Meswak is made from a rare herb, which grows slowly, resisting the brutal forces of nature amidst the sand dunes of Africa and South Asia. Even a small portion of this herb is capable to provide Complete Oral Care. Dabur brings to you, this herb in the form of Incredible Meswak Toothpaste. It is scientifically proven to help reduce tartar and plaque, fight germs and bacteria to keep gums healthy, helps prevent tooth decay, eliminate bad breath and ensure strong teeth, all at once to provide Complete Oral Care.	426.30	45	2019-12-10 00:00:00	\N	1186	23
518	Tofu Supreme - Regular	soya paneer. Substitute to normal milk paneer with zero cholesterol & high protien. No Refrigeration Required.	108.00	43	2018-09-10 00:00:00	\N	354	39
519	Honey Sunflower	Brighten your day with these sunflower seeds, chock-full of vitamin E and dripping with honey. Each handful of these sweet morsels is packed with nutritional goodness, satiating hunger and supplying health.	110.50	5	2020-04-07 00:00:00	\N	1184	29
520	Premium Raw Organic Authentic Flaxseeds	Happilo Natural Organic Flaxseed is your next smoothie mix-in, all-natural fibre substitute and healthy culinary secret! The facts about flax seeds, it provides a source of omega-3 and fibre and adds a pleasantly nutty flavour to everyday meals.Happilo provides food that is packed with the goodness of nature and taste that will keep you wanting for more. With a range of food items across categories like nuts, dry fruits, dried fruits, berries, seeds, mixed nuts, fusions, nut mix and other healthy items.Each of our products is not only 100% natural but is also made of 100% whole grains. While we stand strongly for health, wherein our products have a clear functional benefit, we believe that taste is the most important element when it comes to Snacks. We strive to bring the best range of snacks to you.	59.40	59	2019-12-12 00:00:00	\N	592	36
521	Ultra Protect Spray	Dr Rhazes Ultra Protect Hand Spray instantly kills 99.9% of germs, viruses and bacteria and gives your hands and surfaces non-stop protection for 2 hours, in spite of multiple touches. It contains 70% Ethanol and proprietary anti-microbial compounds that protect you from viruses and bacteria for 2 hours, even if you come in contact with infected surfaces or hands.\nIt is completely safe on the skin and Surfaces and does not require water. Dr Rhazes Ultra Protect Hand Spray has been designed and developed in Singapore and is Made in India.	340.00	95	2021-05-05 00:00:00	\N	1580	22
522	Chia Mango Mint Jam	Chia seeds are packed with protein, calcium, healthy omega-3 fatty acids and soluble fibre. In fact, the fibre in the chia seeds allows them to absorb liquids to swell up to ten times their original size. Chia seeds also help with weight loss. They help you stay hydrated and are a powerhouse of nutrition. This is a superfood that is packed with all the essential nutrients. Zingy freshness, energy burst... This is what you get with our Chia mango mint jam. It is a unique blend of Alphonso mangoes, fresh mint and calcium-rich chia seeds. It is an irresistible spread that contains no added preservatives and is 100% natural.Not to be consumed by diabetic patients.	126.00	30	2018-09-02 00:00:00	\N	490	28
523	Asafoetida - Powder	Energy: 328 K Cal, Protein 4.0G, Carbohydrates 75.8G, Fat 1.1G, Saturated Fat: 0.75G, Poly Unsaturated Fatty Acid 1.0G, Monounsaturated Fatty Acid 1.2G, Cholesterol 0.0G, Vitamin 0.006G, Minerals 0.73G.	90.25	97	2020-04-01 00:00:00	\N	1820	32
524	Pure Maple Syrup - Product Of Canada, Grade A, Robust Taste	Nothing comes close to this finest and pure maple syrup from Canada which we guarantee you is the richest, most delicious, and healthiest maple syrup you've ever had.\n\n100% pure, maple syrup that contains no additives, preservatives, or artificial flavours. All the wholesome natural goodness that flows out of the tree is exactly what you get.\n\nMaple syrup can be added to pancakes or cakes or any other dessert to get a refreshing taste. It is extra rich with a naturally sweet and pure flavour, also high in minerals.	900.00	82	2018-01-08 00:00:00	\N	1107	23
525	Flucon Tablets - Fights Allergy Naturally	This tablet increases the immunity level of the upper respiratory system that eventually protects the body from seasonal sneezing, running nose, cold, headache, heaviness in the chest, cough etc. Ingredients that are used in these formulations control mucus secretions and ensures easy breathing. It balances Vata and Kapha Dosha which are naturally get vitiated in such disorders.	110.00	18	2022-07-12 00:00:00	\N	901	22
526	Tagara (Valerian) - Tablets	Himalaya Tagara Relaxant is an herbal medicine utilized as a kindly agent for the mind. This medicine is prepared from a Valeriana wallichi, herb. The rootstock of this herb is perfumed. It yields fragrant oil, which contains valeric acid. The other medicinal compounds of this herb are valerianine and Valerenic acid. It is a very fine relaxant and used in sleep disorders and insomnia.  For Beauty tips, tricks & more visit https://bigbasket.blog/	145.20	50	2020-01-12 00:00:00	\N	670	9
527	Masala - Pav Bhaji	Eastern Pav Bhaji Masala endeavours to offer the consumer and familiarity of authentic, home-made food at a reasonable price. This is 100% natural and has zero preservatives. The Pav bhaji masala is a combine of spices such as chilli, pepper, coriander seeds, dry mango powder etc. that make the flavor of the bhaji all the more stimulating. By adding this combine in your Pavbhaji, you will get the real tang of Mumbai Pavbhaji.	66.00	83	2020-11-07 00:00:00	\N	370	1
528	Cereal Flip Lid Container/Storage Jar - Assorted Colour	Multipurpose container with an attractive design and made from food-grade plastic for your hygiene and safety ideal for storing pulses. Grains, spices, and more with easy opening and closing flip-open lid.Strong, durable and transparent body for longevity and easy identification of contents. Multipurpose storage solution for your daily needs stores your everyday food essentials in style with the Nakoda container set. With transparent bodies, you can easily identify your stored items without having to open the lids. These containers are ideal for storing a large variety of items such as food grains, snacks and pulses to sugar, spices, condiments and more. Featuring unique flip-open lids, you can easily open and close this container without any hassles.\nThe Nakoda container is made from high-quality food-grade and BPA-free plastic that is 100% safe for storing food items. You can safely store your food items in this container without worrying about contamination and harmful toxins. As they are constructed using highly durable virgin plastic, these containers will last for a long time even with regular use. These containers can enhance the overall look of your kitchen decor. Being dishwasher safe, cleaning and maintaining these containers is an easy task. You can also use a simple soap solution to manually wash and retain their looks for a long time.	79.00	48	2020-08-08 00:00:00	\N	435	39
529	Greek Yogurt Smoothie - Strawberry	Epigamia Smoothies is just Like the lassi, with the added fuel of high protein and with real fruits for stimulating taste. This preservative-free smoothie is an ideal snack that will tame your hunger in no time.So say no to the all the junk and enjoy a healthy and tasty treat with Epigamia Smoothies. Tame your sweet craving with this tasty smoothie.	49.00	46	2021-02-02 00:00:00	\N	832	14
530	Marvel Spiderman Metal Kids Pencil Box	This licensed character themed pencil box is made of metal for long lasting durability. It provides better safeguarding to all personal and valuable items with a reliable lock system. The multi-level storage, divided by a tray, is useful enough to store and organize all the necessary stationery. The all-over printed part is the best part of the pencil box.	149.00	24	2019-08-12 00:00:00	\N	69	4
531	Jeera Nibbles	Dukes Jeera Nibbles is a tasty and crunchy baked snack, that gives you a typical Indian taste to fall in love with the delicious flavour of this crispy bite. This snack coupled with tea/coffee can really make your mornings and evenings full of happiness.	39.00	78	2022-05-12 00:00:00	\N	1044	20
532	Pure Aloe Vera Gel	Bring the lost glow back to your face with this Jeva Pure Aloe Vera Gel. It is your one-stop solution to prevent aging and add a natural glow. Enriched with Aloe Vera extracts this gentle gel will leave your skin moisturized for up to 72 hours.Made with real natural Aloe Vera, Jeva Aloe Vera Gel is free from chemicals and works wonders for skin and hair.Tip: Following a regular skin care regime can help you achieve flawless skin. For more tips on skin care, visit bigbasket lifestyle blog, Click Here to visit bigbasket’s lifestyle blog	107.00	18	2019-04-07 00:00:00	\N	438	14
533	Organic Quinoa Power Rice Cake	Wise Crack Organic Quinoa Power Rice Cake is a healthy alternative to bread, rotis, puris and chips. It's your anytime healthy snack. You can pair it up with your favourite topping or dips.	126.65	77	2020-07-10 00:00:00	\N	1578	10
534	Hair Styling Gel - High Hold With Wet Looks	With Man Arden Hair Styling Gel you can boast of a casual or funky cool wet-look hairstyle whenever you want with least effort. The viscosity and texture suits every hair type. Your hair shafts attain the grip they need to stay in place and maintain the desired shape. There are no flaky residues or risk of hair drying out by using this hair gel. Free from potentially harmful chemicals and loaded with natural ingredients, Man Arden Hair Styling Gel is second to none. High Hold Unlike most of the other hair gels, multiple applications are not needed to preserve your desired hairstyle. You are assured of a long-lasting hold regardless of your hair type, whether it is straight, curly or wavy. Your hair stays tamed and in place, the way you styled it at the beginning of the day, for hours. Moisturized & Smooth Your hair not only looks great. The well-conditioned hair also feels great. The wet exterior style complements the moisturized hair strands hydrated by aloe vera extract. Aloe vera is an excellent natural conditioner that keeps the hair smooth and eliminates risk of hair damage. Hair-Friendly Natural Ingredients A fusion of hair-friendly ingredients, the hair gel helps diminish risk of common hair problems. Tea Tree Oil, the natural oil extracted from the Australian tea tree is a natural antimicrobial agent. It is known to reduce dandruff. Bhringraj helps arrest excess hair fall and promotes hair growth. Neem helps in keeping the hair healthy and fights dandruff and itchy scalp. Man Arden Hair Styling Gel is unique because it encourages you to sport the hairstyle of your choice without damaging your hair. Hair dryness, residue buildup, dandruff, hair fall, hair breakage, the common side effects of the persistent application of hair styling products can be avoided by using this hair gel. Free of harmful chemicals and infused with hair-friendly natural ingredients, it helps in preserving the health of your hair. A novel Hair Styling Gel that keeps hair tamed and groomed with a single application for a long time. It holds the flyaway and unmanageable hair in place and smoothens frizzes. Suitable for all types of hair, the Hair Styling Gel allows you to effortlessness style your hair the way you want it for a particular occasion.	299.00	21	2020-02-10 00:00:00	\N	1659	38
535	Brazil - Single Origin Dark Chocolate	Tasting Toska’s single origin Brazil chocolate, is like indulging in a waterfall of intense cocoa flavors, intensified with amazing bitters and refreshing sours. The result is a wonderfully complex chocolate with powerful cocoa chords and bitter notes. They soon make place for a wave of fresh fruity and acid flavors that linger on for minutes. Toska Chocolates is a small batch, Gourmet, Artisan, Bean-To-Bar Chocolate Brand. Toska Chocolates doesn't use any kind of bad vegetable fat, our chocolate is made from well fermented and well-dried cocoa beans. The well-fermented and well-dried cocoa beans allow us to give the best flavour profile to our chocolate without using any kind of extra sugar unlike regular chocolates and hence makes our chocolates Healthy. Along with being healthy and very low on sugar; our Dark Chocolates are vegan, gluten-free and Keto-Friendly.	320.00	49	2021-09-04 00:00:00	\N	11	5
536	Sesame Chikki	The crunch of golden roasted sesame seeds, the earthy sweetness of jaggery - it is a match made in heaven. Imagine heavenly blend simply melting in your mouth as you're transcended back to fonder days, Yass, that's what we are talking about! But don't take our word for it, go on, give it a try, you'll come back again for more, we swear!	300.00	5	2020-12-10 00:00:00	\N	1604	31
537	Jerk Sauce	Bechef Jerk Sauce is Delicious Hot Sauce and marinade made in Jamaican Style. This Hot Sauce is famous for its peppery finish and rounded flavours imparted by Allspice and Soya Sauce.	160.00	78	2020-01-08 00:00:00	\N	624	20
538	Organic Elicoidali Pasta	We at Anmara, are driven to bring the highest quality artisanal foods to your home kitchen. Ensure a careful selection of raw material for all our pasta. The final product has been crafted using long-established & time-honoured Italian processes.	396.00	1	2020-01-07 00:00:00	\N	2046	33
539	Elegant Fruit Center Filled Choco Assortment	To wish your sweetheart with all the love of your heart, you got to have something endearing like the one displayed here. Buy Kokoleka Grand Fruit Center Filled Choco Assortments which is good in taste. It doesn't matter if time has drifted you apart you still can make up for it by reminding your friend that you still love them. Buy Kokoleka Royal Fruit Center Filled Choco Assortments.	267.75	53	2022-02-05 00:00:00	\N	799	23
540	Basting Brush Kitchen Oil Cooking Tool - Silicon Plastic, Pink/Peach Assorted, BB1166	This pink coloured kitchen brush is useful kitchen tool when it comes to cooking. These brushes come handy for applying oil while cooking food, barbequing or to add drizzles while making pastries. The brushes are made of silicone and silicone being heat resistant, can be directly used on hot food. Whereas, the handle of the brush is made using high quality plastic material. The brushes cool quickly and are easy to clean, lightweight, non-stick, flexible and easy to handle.	139.00	63	2021-07-12 00:00:00	\N	331	13
541	Baby Powder With Fragrance	It is mild & gentle on the skin of your babies. Enriched with organic extracts of chamomile, rosehip and organic olive oil, Pigeon baby powder with mild fragrance keeps the skin soft and smooth, giving it a fresh, dry and comfortable feeling.	99.00	25	2020-10-03 00:00:00	\N	1948	38
542	Supple Bounce Body Lotion	Enjoy the feeling of soft, supple & bouncy skin with New Dove, Nourishing Care, Supple Bounce Body Elasticizing Lotion enriched with NutriDUO that nourishes your skin deep down (within stratum corneum). It results in an irresistibly supple, bouncy, radiant skin that’s smooth to the touch. Its unique formulation combines rich nourishment and white tea extract, well known as an effective antioxidant, for more invigorating effect. So it’s supple and bouncy. Its fast-absorbing lotion is formulated with a plant-based moisturizer with goodness that lasts. It is dermatologically tested.  \nWhile you enjoy your active lifestyle, it also exposes you to multiple aggressors which may make your body skin loose, rough and dull. Give your body the Dove Difference: Made with care.	105.60	53	2020-02-01 00:00:00	\N	1925	6
543	Glass Serving Mixing Bowl	Famous for high quality and performance, we pour all our experience into creating beautifully designed, practical products like our trendsetting range. Strikingly elegant in every table setting, every piece helps transform simple gatherings into stylish occasions. Can be safely used in the microwave, oven, fridge, freezer and dishwasher. Unlike plastic will not leech chemicals into your food even over repeated usage. The non-porous glass will not absorb stains or odours. You can serve you're guests with yummy salads, puddings and vegetables by preparing them in this clear transparent glass bowl.Benefits: Stain Resistant3 Layered GlassFreezer SafeChip ResistantPatterns won’t wash, wear or scratch off	169.00	40	2019-05-05 00:00:00	\N	162	33
544	Tawa Pav Bhaji Masala	Keya Tawa Pav Bhaji Masala is an exotic blend made from the choicest of ingredients, that are hand-picked in the right proportion, gently blended and coarse ground to unlock taste and aroma only while cooking.\nPrepared by expert chefs, the magic of aroma-locked Tawa Pav Bhaji Masala comes alive with great taste and flavour.	39.60	1	2020-02-10 00:00:00	\N	1499	3
545	Bathing Bar Soap - Germ Protection, Original	Dettol is one of the worlds most trusted antiseptic protection brand which gives you 99. 99% protection against disease causing bacteria, germs and es. Their body bathing bar is guaranteed to provide you 100% better freshness than the other ordinary bodywashes. It is refreshing and rejuvenating properties will brighten up your mornings and will leave you energised and smelling great.  | With nourishing moisturisers that make skin softer and smoother.  | Use as a part of personal hygiene for healthy skin everyday.  | Dermatologically tested to be safe on skin.  | Recommended by the Indian Medical Association.	335.81	7	2019-01-01 00:00:00	\N	1876	33
546	Nylon Rope	Nylon rope is know for its elasticity and ability to absord tremendous shock loads	80.00	56	2020-03-06 00:00:00	\N	1893	2
547	Cleaner - Jewelery	Rinse with water and wipe dry for picture-perfect results.	575.00	81	2020-01-09 00:00:00	\N	1094	12
548	Tasty Ragi Chivda	Graminway Tasty Ragi Chivda will satisfy the taste buds of all age group people from children to adult. This Ragi Chivda is a perfect mix of ragi, spiced sev, and puffed rice. A snack that combines the nutritional values of ragi or foxtail millet with a crunchy texture and yummy flavours! At Graminway, they believe that everyone deserves to live a full and healthy life. The intake of their food supplements will provide a good foundation for a healthy lifestyle. They are committed to providing the highest quality products at affordable price. They are a company with a purpose beyond profit and want to make a lasting difference in the world. Graminway aims to provide clean, natural, and healthy products without compromising on the flavours and taste. They produce them in small batches, which helps maintain freshness and preserve the ingredient texture. By not stockpiling, each product is as fresh as possible when it reaches your doorstep.	99.00	68	2018-12-02 00:00:00	\N	1833	18
549	Crunchy & Creame Wafer Biscuit - Vanilla	This Harveys Crunchy & Creame is the crispiest & crunchiest cream-filled wafer. These crispy, sweet snacks are kids favourite, With there waffle surface pattern & thin layer, usually accompanied by ice cream. The other bakery products are incredible snacks which anyone can enjoy anytime, good munching partner while travelling and preferred by kids. Also, it is having zero trans fat.	89.10	84	2021-02-11 00:00:00	\N	1190	16
550	Fevicryl - Pearl Kit	This Fevicryl Kit Provides all Type of Colours required to Professional Artists. Enjoy painting with a wide range of Fevicryl Acrylic colours. These are fast-drying colours that are water-soluble but become water-resistant when dry. Available to you in a number of different shades and sizes. You can use them to decorate a variety of bases, such as earthenware, leather, glass, wood, paper and canvas. These colours are ready to use and do not require any special additives for preparation. This product is suitable for painting on clothes, glass, mirrors, and transparent acrylic sheets.\nBenefits :\n1. Bright and transparent.\n2. Provides full-colour intensity and a beautiful transparency.\n3. Easy to apply.	108.00	51	2018-04-12 00:00:00	\N	1836	27
652	Intense Gel Lime  Fresh	WC Net Gel intensely perfumes, cleans thoroughly and sanitizes your toilet. Thanks to its innovative anti-odour formula, it eliminates bad odours and odour-causing bacteria resulting in long-lasting protection & freshness.	175.00	79	2019-05-04 00:00:00	\N	2283	21
567	Camne Vid	Dabur Camne Vid is an effective and potent Ayurvedic formulation for men and it helps them restore vigour and vitality and improve their sexual performance. This medicine is used for increasing sperm count and is a powerful aphrodisiac for men. It is a mix of unique medicinal plants that help to increase the sperm count, treat premature ejaculation, and sexual weakness.	572.00	22	2020-01-08 00:00:00	\N	1186	22
568	Madrid - Dessert Spoons	Embracing beauty with opulence, Madrid's hammer finish handle is the paradigm of perfection to impress your guestsIt contains 6  pc spoons. Made of stainless steel, dishwasher safe, anti rust, hammer finish on gives madrid a designer look perfect to impress guests.	359.00	10	2020-03-07 00:00:00	\N	1994	7
610	Crushed Chikki Peanut Bar	Why reimagine a classic, you might ask. But wait until you taste our crushed peanut chikki. Made from golden roasted peanuts that have been crushed and melded with sticky-sweet jaggery, this chikki is an explosion of flavour and texture. All natural, there is nothing artificial about Paper Boat Crushed Peanut Chikki, after all your favorite childhood treat should find you just the way you like it, real and yummy!	300.00	90	2021-04-07 00:00:00	\N	1604	10
551	Deluxe Granite Non-Stick Omni Tawa, 250 mm (36301)	Prestige Omega Deluxe Granite 5-layered non-stick cookware series is made using German technology and it lasts three times longer than ordinary non-stick cookware. Its special spatter-coated surface looks new for longer and is also metal-spoon friendly. Omega Deluxe Granite can be used on both gas and induction cook-tops. Prestige Omega Deluxe Granite series comes with 5 layer coating. Topcoat - The highly efficient PTFE coating gives special granite finish to the cookware making it more attractive. Reinforced Spatter coat (2 layers) - Spatter coat helps in making the cookware look new for longer. This coat ensures that the cookware is metal spoon friendly and convenient to use. Intermediate Coat - This coat helps in even heating and also in retaining non-stick properties and making it durable. Base Coat - This coating works like adhesive between non-stick coating and substrate. It offers excellent abrasion resistance to the coating. This 5 layers non-stick coating lasts 3 times longer than ordinary non-stick cookware, which is also PFOA free, thus making us healthier and assures stain-free interior. The outer body is made from the best quality aluminium, it comes with black colour powder coating with granite finish which looks attractive and enhances the appearance of the kitchen. The outer coating helps in easy cleaning of the cookware. The handles are made from heat resistant material that enables ease and convenience while cooking and carrying the cookware. This cookware has a high-quality Aluminium body which comes with induction and gas compatible base, thus making it convenient to use. With the Glass Lid, this cookware can also be used to serve food. Designed with the tempering process this glass lid has increased strength and toughness Prestige Omega Deluxe Induction Base Non-Stick cookware is dishwasher safe so that you can wash it and reuse it without any hassle and there will be no smell of the leftovers.Tips To Maintain Non-stick Cookware1. Condition before the first use with a thin smear of cooking oil. 2. Cook over low to medium heat for best cooking results. High heat can burn food, waste energy and cause surface discolouration after some time. 3. Do not use sharp objects like knives/ forks and metal spoons with sharp corners/edges. 4. Cool pans before washing to safeguard against rapid temperature changes that can cause warping. 5. Clean you Cookware with soapy water using the sponge scrubber after each use to prevent oil deposition.	870.00	64	2021-02-02 00:00:00	\N	671	23
552	Granola - Choco, Almond & Cookies	Granola often considered as a breakfast food or a snack is a mixture consisting of rolled oats, nuts, seeds, honey or other sweeteners. Highly nutritious, this snack food can boost up your energy in a small serving as it is power-packed with the recommended daily requirement of nutrients and vitamins. Fit & Flex Granola is baked with multigrain crispies that consists of Wheat, Oats, Rice, Maize flour. It is loaded with Chocolaty Cookies along with traces of Almond Flakes. Our granola is perfectly baked from all side until it attains a crispy, toasted and golden-brown coloured desired texture to give you that feeling of a crunchy snack.	245.00	73	2020-10-08 00:00:00	\N	1889	25
553	Peanut Brittle - With Jaggery	Lindberg Brittles are Peanut based jaggery brittles enroped with chocolate. A perfect mix of crunchy praline and luscious chocolate.	119.00	46	2018-01-10 00:00:00	\N	284	4
554	For Man Eau De Toilette	Use this everlasting wonderful perfume to stay fresh all day. The captivating fragrance of this perfume from the brand Jacques Bogart is perfect to cheer your mood. Apply it to the pulse points like on your wrist, behind the ear, near the neck, behind the knee and on your elbows for the fragrance to last long.	2415.00	24	2020-12-04 00:00:00	\N	846	14
555	Novawhite Glutathione & Vitamin C Cream - For Men & Women, Suitable For all Skin Types	Combination of glutathione, vitamin C, niacin, collagen peptides and Siberian ginseng. Novawhite Glutathione lotion is a pain-free solution for brighter looking skin. It is an effective skin-lightening and wrinkle-reducing complex. Prolonged exposure to UV radiation and harmful pollutants leads to skin sagging, which in turn, reduces the skin luminosity and skin tone uniformity. Novawhite glutathione lotion restores the skin’s natural luminosity by improving the moisture absorption of the skin and suppressing the free-radical activity.	675.00	70	2021-06-01 00:00:00	\N	660	27
556	Klick Lead - 10HB, 10 Leads	Klick Lead 0.5 Mm (Hb 10) - 10 Leads is made with high polymer leads, one can expect smooth and breakage free writing while using these.• Leads are tough, smooth and dark.• 0.5 mm HB leads.• High polymer fine leads for smooth writing.	98.00	70	2021-01-08 00:00:00	\N	2163	39
557	Bhumyalakki Tablets	Bhumiamlaki tablets supports healthy blood sugar, liver and kidney effectively. These herbs are specially selected and manually graded to give best products. It is formulated to support the proper function of the gallbladder. The capsule helps to detoxify the liver and stimulate the urinary system.	120.00	61	2022-01-10 00:00:00	\N	1180	24
558	Juice/Milk Mugs	Yera is the pioneer in India’s glass Industry since 1958 and traditionally known for making high quality glassware products at the best prices We are a 100% Made in India Brand. Yera is a trusted name that has reached in almost every household of India. Now enjoy your favourite drinks with this crystal clear,non-toxic,easy to clean Yera Tumblers at best price.These high quality yet stylish range of robust Tumblers are available in variety of shapes with plain and moulded designs.These light weight,durable,easy to use glassware are heat and scratch resistant. So Now serve your guests juice,water and even alcoholic drink during parties.	229.00	58	2021-10-07 00:00:00	\N	86	2
559	Pizza Topping	Making restaurant-style pizzas at home has never been easier. Add our Happy Chef Pizza Topping to take your pizzas, sandwiches, burgers to the next level. The best quality baby corn, jalapenos, red bell peppers, yellow bell peppers & olives used in the topping will make your dishes healthier, crunchier, and tastier. Carry all that you need to make a pizza in a single bottle anywhere, anytime!\nFeatures:\nEverything you'd need for the perfect Pizza in one bottle!	139.00	43	2018-04-08 00:00:00	\N	456	1
560	Shaving Foam	Effective and rich lather acts as a lubricant that makes razor glide for a smooth and comfortable shaving experience.	68.00	63	2019-08-06 00:00:00	\N	2204	11
561	Mix - Rava Dosai	Gits Rava Dosai Mix is a tasty, crunchy, semolina pancake, prepared plain or with spicy vegetable/mince filling. It is usually served with sambhar and coconut chutney.	60.00	78	2019-07-03 00:00:00	\N	1950	4
562	Aloe Vera - Organically grown	Product image shown is for representation purpose only, the actually product may vary based on season, produce & availability.	40.00	72	2019-12-09 00:00:00	\N	2027	35
563	Green Tea - Mint, Good morning	Improves & stimulates Digestion.Mint is Popular for its cool flavour & subtle aroma.it is one of the oldest herbs & is also blessed with medicinal properties.	75.00	67	2019-05-01 00:00:00	\N	88	4
564	Bathing Soap - Cucumber & Coconut	Himalaya Herbals Refreshing Cucumber Soap is enriched with extracts of nut grass that sooth and moisturize the skin. It has turmeric which keeps the skin due to its antibacterial activities. The Cucumber sooth, rinse and energize and Oil of Coconut nourishes and moisturizes skin.For Beauty tips, tricks & more visit https://bigbasket.blog/	99.36	95	2022-01-11 00:00:00	\N	2097	1
565	Imitation - Crab Sticks	Gadre Jus-Like Crab Stick Ingredients: Surimi (Fish Meat, Sugar, Polyphosphate), Water, Wheat Starch, Corn Starch, Tapioca Stacrh, Salt, Crab Extract, Monosodium glutamtae, Mirin, Sorbitol, Sodium d-Gluconate, Glycine, Sugar, Modified Tapioca Starch, Egg White Powder, Nature identical, Crab Flavour, Carrageenan, Carmine colour, Paprika colour.	195.00	55	2019-02-07 00:00:00	\N	1409	17
566	Shot Body Spray - Royal Jade	For those who like to show the world outside what they are inside. Layerr presents Layerr Shot, Indias first clear fragrant body spray for men. An exquisite array of powerful international fragrances in clear bottles that show you whats inside from the outside.	165.75	96	2019-05-08 00:00:00	\N	1878	35
569	Raw Chia Basil Seeds	True Elements brings to you Chia Basil Raw Seeds that are loaded with health benefits and nutrients. The basil seeds are a little larger than chia seeds but have a similar nutritional profile. Chia seeds contain more than twice the omega-3 fat but a little less fibre compared to basil seeds. They swell and form a gel when soaked. Chia seeds have no taste they adapt to any dish that they are added to. Basil seeds on the other hand have a mild flavour of basil. They can be used in smoothies and baked goods. It also can be sprinkled on a salad, porridges, ice cream, oatmeal, yoghurt, etc.\nBenefits: 1. It is loaded with many health benefits and nutrients.\n2. It is a great healthy meal option.\n3. It is rich in antioxidants, dietary fibre and iron.	450.00	51	2021-06-07 00:00:00	\N	911	3
570	Jalapeno Pasta Sauce 385 g + Sriracha Chilli Sauce 185 g + Hot Sauce 75 ml	Habanero Jalapeno Pasta Sauce 385 g: Our delicious and chunky sauce is made from fresh, natural ingredients and with an extra helping of Jalapenos to spice up your day. Habanero pasta sauce is slowly simmered to give you an authentic taste. Enjoy our sauce with your favourite pasta or vegetables.\nHabanero Sriracha Chilli Sauce 185 g: Habanero Sriracha Chilli Sauce – Add a tinge of flavour to every dish with our Sriracha Sauce. A delicious mix of fermented jalapeno chilli pepper, garlic, sugar, salt, and vinegar. Our Sriracha Sauce adds the tanginess to anything you cook.  Relish the sauce with Fried, Rice cakes, sandwiches, fried vegetables, burgers, pizza and more.\nHabanero Hot Sauce 75 ml: Habanero's Hot Sauce is a yummy and spicy condiment for your fries and burgers. There is nothing that improves an austere soup dinner like a slice of crusty bread, toasted with a generous dollop of hot sauce and a sprinkle of cheddar cheese.	475.20	97	2020-08-09 00:00:00	\N	2197	23
571	Shot Body Spray - Gold, Passion	For those who like to show the world outside what they are inside. Layerr presents Layerr Shot, Indias first clear fragrant body spray for men. An exquisite array of powerful international fragrances in clear bottles that show you whats inside from the outside.	175.50	12	2020-07-05 00:00:00	\N	1878	18
572	Toilex With Roundy Cont.- Vf	Gala India's one of the largest manufacturer of home cleaning tools brings out Round Shape Toilet Brush with nylon bristles which are flexible & durable. Attractive containers to hold the brush & ensure no messy floor.	220.00	74	2022-04-11 00:00:00	\N	770	21
573	Toilet Roll - 4 Rolls, 3 ply	The perfect blend of pure fibre and pure softness ensuring you get nothing less than pure luxury. The PASEO difference lies in tissues that are free from optical brightening agent, hypoallergenic and made from 100% virgin plantation fibre.	325.00	11	2019-01-10 00:00:00	\N	1603	40
574	Pumpkin Oil - Cold Pressed	Pumpkin Oil is a highly nutritious and power-packed oil. It is rich in natural Vitamin E, phytosterol and unsaturated fatty acids. It has a smooth nutty flavour. Any dish cooked with this oil tastes better and different than usual. Additionally, it also adds a lot of health benefits to the dish you are consuming the oil with.	625.00	93	2021-03-01 00:00:00	\N	1453	1
575	Darjeeling White Teabags - Reeti	If belonging to nature was a virtue, Reeti White Tea would be the unambiguous winner. Of nature, for nature and completely true to its nature, this tea is the right name for Natural Propensity in Sanskrit. The delicate 'Pak ho' buds are plucked by thin nimble fingers to produce this exquisite white tea. The processing enriches it with the goodness of nature, combined with sun-drying and pan-frying, giving a tea that brims with vitality.	525.00	95	2019-01-06 00:00:00	\N	1544	14
576	Twin Bucket Spin Mop - Green - 2 Refills	The Scotch-Brite Twin Bucket Spin Mop has a sturdy 360 degree telescopic handle which is height adjustable and helps you reach nooks and corners of your house. The twin bucket mechanism helps you wash and wring the mop head easily. The microfiber refill ensures that it picks up even fine dust and hair. Overall the Scotch-Brite twin bucket spin mop is very easy to store and use which makes cleaning an easy task for all.\nAddtional Highlights:\n1. Dual refill ensures usage depending on cleaning occasion and frequency and ensures that it lasts longer.\n2. 360 degree telescopic handle to reach nooks and corners easily.\n3. Detachable handles: The handles of this adjustable mop that can be attached or detached to adjust the height of the mop as per the user's convenience.	1150.00	97	2020-05-06 00:00:00	\N	2056	12
577	Expanding Folder	The expanding folder holds loose papers and money together for organization and protection. They are often used in conjunction with a filing cabinet for storage. Super-durable poly material provides waterproof and tear-resistant performance. Ideal for school, work, or home. The handy file folder creates valuable space for important papers and documents, keeping everything neatly sorted into sections.	224.00	47	2021-09-07 00:00:00	\N	1018	18
772	Istanbul Juice/Whisky Glass Tumbler	This glass tumbler is made of tempered or toughened glassware for maximum safety of food service professionals as well as for the superior resistance and durability. Enhance the beauty of your in-house bar with this beautifully crafted crockery.	409.00	86	2020-04-02 00:00:00	\N	562	32
578	Mouthwash Liquid - Cool Mint With Mild Taste	Brushing can miss a billion germs, which may lead to various oral problems like bad breath, bleeding gums and plaque. Protect your mouth with this less intense, Alcohol-free Listerine mouthwash that reaches your whole mouth and removes 99.9% germs. With patented essential oil formulation, Listerine Cool Mint Mild Taste Mouthwash deeply penetrates to remove bacteria in plaque biofilm.\nListerine Mouthwash does more than just give fresh breath by providing 24-hour protection against germs causing gum problems, bad breath and plaque with twice-daily use. This mouthwash features a less-intense alcohol-free formula and cool mint flavour that works to leave your mouth feeling clean and refreshed than brushing alone.	220.50	67	2020-03-11 00:00:00	\N	131	32
579	Quick Chai Masala	There’s tea, and then there’s chai- that fresh, ghar-waali, full-on taste you only get when tea’s been boiled! Enjoy Tata Tea Quick Chai that is made just the way you would at home - boiled with milk & sugar before converting it to powder. This instant tea mix comes in a delicious natural masala flavour, just add hot water and have a pleasant evening! Masala chai made with the perfect blend of spices- Nutmeg, Ginger and Clove, it’s ready in a jiffy and tastes the same. Because when it comes to chai, we know you wouldn’t have it any other way!	109.20	21	2022-01-03 00:00:00	\N	2019	20
580	Non Alcoholic Beverage - Mango Chilli Mojito Mixer	Jimmy’s Cocktails brings to you Mango Chilli Mojito that is a refreshing summer twist on the classic Mojito cocktail. It is made with Indian Alphonso mango, Persian limes, mint, cane sugar and a hint of red chilli. It is finely crafted and infused with natural flavours. Jimmy's provides a convenient and consistent solution for serving a delicious Mojito cocktail. It is a non-alcoholic mix that can be mixed with what you like. This mix has a consistently smooth texture and gives you a complex balance of sour and sweet notes. Enjoy it straight up as a mocktail or you can even mix it with rum or vodka.	99.00	53	2020-08-08 00:00:00	\N	709	7
609	Touch 'N' Fresh - Wild Lavender	Eliminates odours and freshensUnique holder designIdeal for kitchen, living room, bedroom, or bathroomFight against germs.	120.00	82	2019-02-06 00:00:00	\N	262	24
581	Intimate Lightening Serum	We all adore flawless skin and wish to have a perfect skin tone to feel confident and happy. However, no one enjoys those darker skins of intimate areas due to extra pigmentation, scars or cellulite. Keeping this need in mind, Namyaa skincare has developed a revolutionary Intimate Skin Whitening Gel, specially formulated to let your intimate skin of delicate areas become flawless. This great formula not only lightens the dark pigmentation but also removes cellulite and scars of the skin to make it radiant and flowing. During this treatment, the skin of those delicate areas also tightens to gain its perfect shape and reduces the wrinkles caused by softening of the tissues. It's time to regain your lost confidence, no more embarrassment for your darker areas, get a flawless and graceful skin of intimate areas by Namyaa Intimate Skin Whitening gel in just 6 to 8 weeks.	750.00	23	2020-08-11 00:00:00	\N	1328	24
582	Olive Oil - Pomace	La Espanola Pomace Olive Oil is superbly suited for grilling and roasting due to its ability to withstand high temperatures without losing any of its natural goodness. The smooth and subtle flavor makes our Classic Olive Oil a versatile addition to your cooking routine. Characterized by mild flavor and aroma. La Espanola Pomace Olive Oil offers a smooth blend of pleasant bitterness, fruit, and spice. Well-balanced and easygoing, our Classic Pomace Olive Oil will gently enrich and complement the flavors of your dish.\nThe high smoking point and subtle character make it a go-to for grilling or roasting vegetables and meats at high temperatures. La Espanola Pomace Olive Oil is a versatile staple for all kitchens. Whether you own a business or are cooking at home, our full range of formats offers the right size for you.	309.00	33	2021-04-02 00:00:00	\N	1097	1
583	X-Tenso Care Straight Masque	L'Oreal Professional X-Tenso Care Straight Masque  Serving as a complete solution for the management of frizzy and rough hair, this masque uses the innovative Pro-Keratin plus Incel technology that provides intensive nourishment to damaged and unmanageable hair. Here, Pro-Keratin acts like a shield and protects the scalp from harsh weather conditions and all those pollutants that deteriorate hair quality. Incel (Intra Cuticular Reinforcement) is typically a lipid that perforates hair cuticles and helps in the protection and repair of unmanageable hair, from deep within. Specially formulated with added amino acids, this masque brings life into dull tresses to make them smooth and glossy. It treats unmanageable hair, as well as strengthens and toughens hair fibres from the roots, thus making them attractive, bouncy, and thick. L'Oreal Professional X-Tenso Straight Masque is highly recommended for rebounded, permed or other kinds of chemically treated hair.	685.00	65	2022-03-06 00:00:00	\N	940	16
584	Monosodium Glutamate	Monosodium glutamate (MSG) adds flavor to soups, sauces, seasonings, and instant snacks. It is a\ntaste enhancer imparts a sixth sense, described as savory, in addition to the five basic tastes like\nsweet, spicy, bitter, sour and salty.	31.50	79	2021-05-04 00:00:00	\N	345	24
585	Pomace Olive Oil	Fragata, backed by an experience of over a century, offers a selection of the finest Spanish olive oils in order to meet the specific needs & cooking habits of Spain and all other countries around the world.The traditional olive oil and olive pomace oil are ideal as a basic element of stews or for frying foods, preserving and highlighting the delicate flavours of prepared meals.	325.00	11	2018-09-08 00:00:00	\N	147	13
586	Puppy Dog Treat - Chicken & Liver Chunks, (Rs 25 Off ) Value Saver Pack	Pedigree Gravy is a nutritious and balanced food for your pet dog. Made with high-quality ingredients, Pedigree provides dogs with the 5 Signs of Good Health - stronger immune system, strong muscles, optimal digestion, strong bones & teeth and healthy skin and coat. Containing a higher moisture content, Pedigree gravy food pouches are ideal to keep your pooch hydrated and energetic. It can be mixed with any meal - Pedigree dry food or home-cooked food - to enhance taste and improve moisture-content.Pedigree dog food is suited for all puppy breeds from Pugs, Beagle to Labrador, Golden Retriever & German shepherd.	465.00	44	2019-08-12 00:00:00	\N	958	10
587	Masala - Vegetable	Eastern Vegetable Masala is a great blend of excellence spices and condiments to make savory, nourishing vegetable curries. It takes the reliable Indian flavor right to your kitchen. It is 100% vegetarian and has dietary fibre which assists digestion and satisfies hunger.	43.70	8	2019-07-04 00:00:00	\N	370	7
588	Cheese - Mozzarella & Cheddar	A unique combination of mozzarella & cheddar, that gives the pizza a great flavour. Mozzarella cheese aids in perfect melting over pizzas. While the subtle nutty taste of cheddar adds that extra aroma.	240.00	6	2018-04-05 00:00:00	\N	2301	15
590	Soya Milk - Vanilla	Want to do more with your day? Make the Vanilla flavored SOFIT a part of your balanced diet and have the energy to do more! SOFIT Soya Milk is a Delicious Healthy Drink for everyone in the Family. Enriched with Soy Proteins, Omega-3, Vitamins & Calcium, it gives you Healthy Energy to do more.  Available in 4 More Delicious Flavors: Chocolate, Mango, Kesar Pista, & Coffee Mocha	77.17	18	2018-12-02 00:00:00	\N	1111	15
591	Sunlite Spray	Aroma Magic Sunlite Spray is formulated with moringa extract and lavender, chamomile and helichrysum essential oil. It contains Vitamin B5, C, E and keeps you safe from the harmful sun rays. It is free from oxybenzone, paraben, harsh chemicals, alcohol and artificial fragrance. It has a non-greasy formula that creates a barrier between the skin and the sun.	475.00	41	2021-11-07 00:00:00	\N	42	13
592	Max Fresh New Super Plastic Lunch Box/Tiffin Box - Blue	Presenting an international concept cello max fresh products are made of sturdy fabric hygienic stainless steel containers for storing food free from any health hazard and fresh for long hours. As the name itself states cello max fresh, now enjoy freshly packed food in these airtight stainless steel containers. The lunch pack consists of food-grade containers made of stainless steel packed in a soft fabricated carry pouch which makes it easy to carry and ideal for office, school and travelling. The lid of the containers consists of food-grade silicone seal that locks in the freshness and retains the moisture of food for long hours. Stop your worries of spilling of food contents from the lunch box cello max fresh lunch packs is one shop solution that addresses all your precautions before carrying lunch.	469.00	51	2019-09-09 00:00:00	\N	2224	21
593	Fruit Yoghurt - Mango	Milky Mist Fruit yogurt Mango is favorite among many because of its silky consistency, real fruit pulp and tang-free, pudding quality. It offers the taste of real fruit Mango. The fruit, grain & nut mix-ins give lively flavor to yoghurt.	79.00	80	2020-02-02 00:00:00	\N	1566	10
594	Chipotle Pepper Sauce	Tabasco - Chipotle Pepper Sauce (Smoked Red Jalapeno Flavour) is a perfect topper for all your favourite foods. Add a few drops to the following for the ideal balance of slow-smoked heat and flavour: Soups, BBQ Sauce, Corn Chips, Salad Dressing, Chili, Dips, Burritos, Tacos, Fajitas, Grilled Vegetables. It can be poured over meats and vegetables when grilling or marinating.	749.00	12	2021-04-07 00:00:00	\N	1148	14
595	Dairy Milk Black Forest - Imported	Cadbury Dairy Milk Black Forest is milk chocolate that is made with the best quality of milk chocolate and black forest cake. It is a perfect mix of rich milk with creamy and silk chocolate. It is a 100% vegetarian chocolate bar. This chocolate has a creamy taste and texture. It is a great snack bar or a sweet treat. This delicious milk chocolate is sweet. Dairy milk is the best selling chocolate bar in the world. It is now available in different flavours and sizes. It is a good source of calcium which help maintain the bones density.\n\nIt is well suited for your dessert need or for your sweet collection.\nPerfect for your every day special moments, sharing or gift-giving with your friends and family.	350.00	59	2021-05-07 00:00:00	\N	272	26
596	Organic Brown Sugar/Sakkare	MeraKisan Organic Brown Sugar is a sucrose sugar product with a distinctive brown colour due to the presence of molasses. Because of its molasses content, MeraKisan Organic Brown Sugar does contain certain minerals, most notably calcium, potassium, iron and magnesium. Make it a healthy replacement for your regular sugar for a better living.	77.00	95	2020-09-08 00:00:00	\N	263	7
597	Ready to Eat - Chicken Darbari	Kitchens of India Darbari Chicken offer rich smell of the timeless preparations is the results of a great mix of tradition and cooking expertise. The right ingredients at just the right proportions culminate to a mouth watering feast of flavors. Chunks of tender chicken cooked with rich butter-laced tomato gravy bring a mouth watering practice like no other.	190.00	56	2019-04-08 00:00:00	\N	1015	12
598	Nuts Hazelnuts regular	Sapphire Nuts Hazelnuts regular 175 g	400.00	32	2021-07-05 00:00:00	\N	833	19
599	Roasted Sunflower Pumpkin & Flax Seeds	True Elements brings to you Roasted Sunflower Pumpkin & Flax Seeds that are loaded with health benefits and nutrients. It is perfectly crunchy and is 100% natural and high-quality. These seeds are slightly roasted to get maximum health benefits and the right crunch. This combination of seeds contains vitamins, minerals, essential amino acids, antioxidants, fatty acids, etc. that are important for your health. It is a great mid-meal snack, sprinkled over breakfast or soups.\nBenefits:\n1. It is loaded with many health benefits and nutrients.\n2. It is a great healthy snack or meal option.\n3. It contains vitamins, minerals, essential amino acids, antioxidants and fatty acids.\n4. It is 100% natural and made of high-quality.	500.00	37	2020-01-08 00:00:00	\N	911	15
600	Organic Paneer	Farm Connect Paneer gives you the authentic taste of homemade paneer. This creamy and tasty Paneer is made from farm-fresh milk free from antibiotics, hormones, adulterants, preservatives, artificial additives or emulsifiers. Organic paneer is made from organic milk. Organic milk is obtained from cows who obtain at least 30% of their diet from pasture. It is good for you as it is farm fresh, pure and safe and has a high taste. It is also good for the globe as it is farmer friendly, animal-friendly and chemical free. It contains no chemicals, no adulteration, no preservatives and no artificial substances.	115.00	36	2020-06-10 00:00:00	\N	1507	18
601	Multipurpose Plastic Basket - Laundry/Clothes, Blue, Oval	These laundry baskets are sturdy and easy to handle. These are easy to carry and are perfect to keep your home clean. You can store loads of clothes at once without any hassle. These can also be used as a dustbin to keep your home free from scrap. Use it anywhere in your house as per your need to keep the home scrap-free.	149.00	75	2020-03-07 00:00:00	\N	1966	37
602	Man-In-Charge - Aqua Blue, Eau De Parfum	This fragrance has marine nuances with aromatic notes like Lavender, Rosemary and Mint in the top. It also has sharp green hints along with Woody, Ambery, Mossy base. It contains woods like Cedarwood, Sandalwood along with floral notes like Geranium and Spices like Coriander. This fragrance will keep you fresh and lift your mood instantly.	700.00	3	2019-06-07 00:00:00	\N	1680	30
603	Ayurvedic Karela Powder	The Meghdoot's Karela Powder is an ayurvedic remedy which helps in regulating blood sugar level. It is enriched with pure karela extracts, it helps in regulating carbohydrate metabolism. This is useful in curing blood related disorders and is also beneficial for healthy functioning of the liver. It helps to maintain healthy blood sugar level. It is free from chemicals, preservatives, starch, additives, colours, yeast, binders, fillers.	60.00	3	2020-11-08 00:00:00	\N	458	33
604	Sweetss - Badam halwa	A delicacy rooted in indian tradition, badam halwa is indispensable for celebrations of any kind. It is good to have on normal days too! Infact, grandmas unfailingly advice their grandchildren to have a spoonful of this wholesome halwa every morning, all through the winter. This is one delicious morning ritual nobody would want to skip!	600.00	92	2020-10-11 00:00:00	\N	661	16
605	Pre Shave Foam - Classic Sensitive Skin	Simple.Honest.Classic. That's the Gillette Foam shave. The lightly fragranced for Sensitive Skin lather spreads easily and rinses clean for that foam shave men have enjoyed for generations.	180.00	52	2018-04-02 00:00:00	\N	1826	23
606	Tomato Ketchup	Fresh, tangy and delicious! Madhur brings to you the flavours of the tomato ketchup in a brand new look. Experience a burst of yummy flavours, and use it as a dip for your sandwiches, chips, French fries and all your evening snacks!	110.00	66	2019-12-05 00:00:00	\N	2180	37
607	Premium Flat Square Plastic Container Set - Blue	These containers are made of high-quality plastic which is microwave-safe without lid, refrigerator safe, and dishwasher safe. They are airtight and have an easily stackable design for smart storage. These food-grade quality products are hygienic for use, is strong and durable.	69.00	22	2019-03-08 00:00:00	\N	404	8
608	Lime Fresh 500 ml + Laundry San- Spring Blossom 480 ml	Dettol Disinfectant Multipurpose Liquid cleaner provides protection to you and your family against illness-causing germs and Coronavirus causing COVID19 virus. Proven to be >99.9% effective at inactivating SARS-CoV-2, the virus that causes COVID19, when used at 1:12 dilutions with 5 minutes contact time when tested under dirty conditions; As per standard testing protocol. This disinfectant liquid sanitizes your home and also helps maintain your personal hygiene. It can be used in bath, laundry, floor and surface cleaning, leaving everything clean and fresh. This multipurpose disinfectant cleaner for home is recommended by the Indian Medical Association.\n Keeping your laundry clean and germ-free every day requires a lot of pain and effort but Dettol Laundry Sanitizer makes hygienically cleaning your clothes an easy task by killing 99.99% germs. This clothes sanitizer eliminates bacteria that breed on synthetic fabrics and keep increasing from the excessive oil present in human skin. These are illness-causing germs and should be removed for a healthy and safe living. The clothes conditioner is gentle on clothes and freshens them with a delightful Spring Blossom fragrance. Use it as a winter clothes sanitizer to kill germs and give your family the trusted protection of Dettol. The laundry liquid sanitizer is recommended by the Indian Medical Association (IMA).Dettol has a wide range of products to protect your family against germs. Explore other products from Dettol: Handwash, Hand Sanitizer, Soaps, Bodywash, Antiseptic Liquid, Disinfectant Cleaner, Disinfectant Spray, Anti-pollution Mask and Laundry Sanitizer.	303.30	42	2018-11-09 00:00:00	\N	1876	4
611	Sausage - Chicken, Cocktail	Quickee presents their deliciously mouth-watering range of meat products which will enchant your taste buds and leave you craving for more as you rake up your favourite meals. Make your morning breakfasts more exciting by serving Quickees Chicken Cocktail Sausages along with eggs and toast for a scrumptious and a healthy meal.	205.00	46	2019-07-07 00:00:00	\N	2003	34
612	Make Up Remover+Brightening Nigt Cream	Hydra Cleanse Makeup Remover is a non-sticky yet moisturizing make-up remover. Specially formulated to remove regular, water-proof and long-lasting make-up without the use of water. End your day with clean, beautiful and healthy looking skin. This 3-in-1 alcohol-free formula is gentle on the skin, lips, and eyes. It retains the natural pH of the skin. Formula researched and developed by dermatologists.Brightening Night Cream is specially formulated to work at night to give you a notably lighter complexion. Potent whitening active azeloyl glycine works to give you lighter and brighter skin. Extracts of imperator cylindrical help restore radicals resulting in visibly soft, fresh and luminous skin. Formula researched and developed by dermatologists.	869.00	72	2018-06-04 00:00:00	\N	317	19
613	Pore Shrinking Face Pack	A face pack infused with the goodness of Indian gooseberry (amla) and organic oranges. This pack works to unclog pores and shrink them, making your skin clearer and also reducing signs of premature ageing.	299.40	42	2021-03-03 00:00:00	\N	1462	3
614	Wafers - Vanilla & Hazelnut	Harveys Wafers are crispy and crunchy wafers with a rich cream filling that are a favourite amongst children and adults, making it an ideal snack to pack for school or to be relished on-the-go. They can also be savoured as a sweet midday snack or can be used to decorate desserts and sundaes.	67.50	88	2018-07-05 00:00:00	\N	1190	28
615	Wasabi Coated Green Peas	Green peas are high in protein and fibre. They are generously coated in a flavoursome batter, an added bonus to an already addictive snack. When you're hungry and in a hurry, reach for one of these quick, easy and nutritious snack!	70.00	77	2020-04-02 00:00:00	\N	1184	22
616	Hair Spa Detoxifying Shampoo	Enriched with water lily and purified water, this deep nourishing shampoo intensely nourishes your hair. Hair Spa Detoxifying Shampoo gently cleanses and infuses the hair fibre with nutrients and moisture. Your hair feels re-hydrated, soft and shiny.	399.00	37	2020-07-08 00:00:00	\N	940	15
617	Fruit Power Juice- Mixed Berries	The preparation of Real fruit power begins with sourcing the freshest and the juiciest fruit from the finest orchards in the world so you could relish the real fruit goodness and unmatched taste. Presenting Real Mixed Berries, packed with the goodness of 6 superfruits - red grapes, cranberries, raspberries, strawberries, sea buckthorns and blueberries. With the antioxidants and essential nutrients like vitamins and minerals, berries help the immunity and breath health of kids. Every glass of 200 ml Real Mixed Berries contains the goodness of 1 full bowl of mixed berries, making it berry- berry healthy and berry-berry tasty.	96.80	19	2019-06-04 00:00:00	\N	1463	30
618	Nilgiris Green Tea - Zoho Lemongrass	How would you appreciate the peerless taste of tea for your senses- by perceiving and savoring its flavour in every single sip, as though you simply found a hidden treasure. In Zen speak, Zoho is synonymous to treasure, and what could be a better way to demonstrate this than our Zoho Lemongrass Green Tea? Lemongrass has a sensitive, botanical rose-like scent blended with a new and verdant smell, and has high range of oxidant properties. Reviving lemongrass with its profundity of flavour wakes up when converged with our fine loose leaf green tea from Nilgiris. This citrusy, reviving green tea with hints of lemon has a fragile scent coverted with a lush fragrance, that leaves you rejuvenated.	200.00	28	2020-09-06 00:00:00	\N	1544	28
619	Borosilicate Glass Round Food Container With Dark Blue Lid	These BB Home borosilicate food storage containers are crafted and manufactured to bring the best of the quality, clarity in glass and shine for elegance. These borosilicate food containers are very superior in quality with high wall thickness and with a heavy bottom to flaunt your style and elegance to your guest at the first impression. These containers are manufactured with high precision to ensure no wobbling on the rim or bottom of the glass. These are 100% food grade and dishwasher safe. These are airtight borosilicate container with high-quality gasket fitted on the lid to ensure freshness of food stored inside. It can withstand up to 400 degrees temperature. It can be used in the microwave, OTG/Oven or even it can be placed inside the electric cooker to cook your delicious food. These borosilicate containers come with coloured lids which are 100% food grade and BPA free. These containers are freezer safe as well. These food storage containers can be used to store fresh food and even leftovers so that, you can re-heat anytime without the hackles of using multiple containers. Even, these can be used as tiffin boxes for light bites.BB Home products are always high quality and at a very competitive price compared to other branded products in the market. So, when you get the best or better than the brands available in the market at a lower cost, definitely you save money and get the best quality product for your use.	239.00	92	2021-12-06 00:00:00	\N	1331	15
620	Cloth Clip	Indian cloth clips	240.00	61	2019-04-08 00:00:00	\N	146	15
621	Original Soap	Tabac original is a milestone in the development of fragrances and toiletries for men and since then offers optimum solutions for the fragrance.	517.50	96	2018-12-05 00:00:00	\N	17	1
622	Daily Defence Instant Fairness Cream	Prevent yourself with confidence by naturally covering widened pores, blemishes and uneven skin tone. Qraa Men Daily Defence Instant Fairness Cream is exclusively designed for men who desire gorgeous skin with not only whitening effect but also wrinkle improvement and UV protection. It helps damaged skin to regenerate. It naturally covers blemishes and uneven pores of men.	240.00	1	2019-07-05 00:00:00	\N	210	28
623	Kashmiri Kahwa Green Tea	Paradise of spice. Our take on the renowned beverage from the Kashmir valley as a green tea containing real saffron strands, almonds and authentic Indian spices. The first sip of the green tea transports you to ethereal snow-clad peaks of the Himalayas leaving behind a remarkable sweet aftertaste of Saffron. At the second sip, the warmth of Cardamom, Cloves, and Cinnamon seep in, reminding of a cosy evening by the bonfire. The experience is enriched by nutty nuances of almonds and slivers of Kashmiri Saffron along with the benefits of Green tea.	243.75	54	2019-03-09 00:00:00	\N	1253	22
624	Cookies - Atta Desi Ghee	A rich desi delight with the goodness of ghee, the richness of pista and other ingredients. The fresh aroma and delicious flavour will leave you craving for more. These eggless cookies can be a great accompainment to hot tea or coffee.	37.25	96	2022-02-04 00:00:00	\N	796	4
625	Biscuits - Badam Pista	These cookies have a delicious flavor and can be used as desserts too. These melt-in-the-mouth delights are made from premium almonds and pistachio nuts. These array of nuts gives these cookies its authentic delectable crunch. It is a rich delicacy with its fine spicy notes and is cherished amongst all age groups.	85.00	91	2019-05-12 00:00:00	\N	796	10
626	Gulabari Moisturising Cold Cream	For sensitive, problem-prone skin, use of regular skin care products may be the root of your problems. Dabur Gulabari Cold Cream the safer natural face cream option with rose oil and glycerin that protect your skin against damage, remove dryness & dullness, and hydrate it from within for a healthy and radiant rose-like skin glow.  For Beauty tips, tricks & more visitÂ https://bigbasket.blog/	76.80	89	2021-02-02 00:00:00	\N	1186	37
627	Glass Bottle With Removable Fabric Cover - Grey, BB1317	Carry this versatile and modish bottle whenever you go out. The glass body of the bottle is durable and is light in weight. The bottle's sleek design makes it fit anywhere in the backpack. It is ideal for students, travellers and people at the jobs. The wide mouth of the bottle makes it easy filling and prove to be perfect on the go bottle.	209.00	0	2021-08-11 00:00:00	\N	2238	21
628	All Time Plastic Soup Strainer - Assorted Colour	Straining is an everyday task in most kitchens, for which a tough, durable, easy-to-clean and maintain strainer is a necessity. All-Time Strainers are made of premium food-grade plastic that are elegant, tough and durable. Their innovative scoop design and handles with fissures prevent spillage while pouring and filtering. The strainer is a heavy duty which is suitable for both home and commercial use. They are resistant to rust and easy to store.	48.00	38	2020-03-12 00:00:00	\N	122	9
650	Breakfast Protein Variety Bar - Almond Coconut	Yogabar Breakfast bars are crunchy, fruity and delicious that are perfect for your everyday breakfast. Stacked with protein, antioxidants, omega-3, and fibre, it's much more than just a bar - it's healthy, nutritious and all natural. No preservatives. No artificial ingredients.	290.00	69	2019-06-01 00:00:00	\N	1609	25
629	Active Salt Toothpaste - Saver Pack 300 g + Mouthwash - Plax, Active Salt 250 ml	Colgate Active Salt Toothpaste - Saver Pack 300 gColgate Active Salt is an anti-cavity toothpaste with the goodness of salt and minerals which help fight germs. Refreshing minty flavour gives fresher breath when used as directed for oral hygiene. Colgate Active Saltâ€šÂ¬â€žÂ¢s unique formula helps fight germs and provide you with healthier and cleaner teeth. Brush twice a day with Colgate Active Salt toothpaste as recommended by dentists. Colgate is Indiaâ€šÂ¬â€žÂ¢s No. 1 brand recommended by Dentists and offers unique oral hygiene solutions to ensure complete protection against germs and plague build-up.Colgate Mouthwash - Plax, Active Salt 250 mlProtect your mouth from germs and get fresh breath every morning with Colgate Plax Active Salt Mouthwash. It removes over 99% of bad breath causing germs in your mouth, for a fresher and cleaner mouth. Colgate Plax Active Salt contains pure sea salt that is known to inhibit bacteria build-up and herbal essence of honeysuckle. It provides 24 hour bad breath control when used twice daily as directed. It is Alcohol-free so you experience no burning sensation, just fresher smiles between brushing!Make Colgate Plax a part of your daily oral hygiene for 10x longer cooling sensation vs brushing alone. Use it twice a day after brushing, for a cleaner, fresher and healthier mouth. When used as directed, Colgate Plax mouthwash can also help prevent cavities and provide up to 64% healthier gums vs. non-antiseptic mouthwashes.	171.50	15	2020-02-11 00:00:00	\N	2017	36
630	Baby Food with Sprouted Grains - Ragi Rich, 6+ Months, Rich in Vitamins & Minerals, No Milk	Manna ragi rich is the right mix of sprouted ragi, sprouted green gram and fortified with vitamins essential for child's growth and development. In Ragi and Green Gram, Sprouting helps in the break down of the complex sugars and proteins to much simpler forms which make digestion easier. The process of germination increases vitamin and mineral content. The product is rich in calcium, phosphorous and iron needed for growth and development of the child, making it highly recommended for infants.	99.00	97	2020-04-07 00:00:00	\N	2298	34
631	Biofluence Therapeutic Shampoo	Hair4U Shampoo contains bio-influencing keratin actives which protect the hair from external stressors such as pollution, chemical and heat treatments, harsh weather conditions, etc. Powered by five ingredients, it offers long-lasting, multiple benefits when used on a regular basis. Fision KeraVeg18 provides strength and elasticity to the hair shaft. TRIspire offers shine and manageability. Caffeine stimulates hair growth. Niacinamide increases scalp blood circulation and Vitamin E acts as a nourishing agent. Suitable for all hair types Hair4U Shampoo is an ideal formula for strong, healthy and shiny hair.	307.50	32	2021-07-01 00:00:00	\N	1189	19
632	Vitamin D3 Tablets - 5000 IU D3	Maintaining healthy levels of Vitamin D is an important part of overall health. Vitamin D helps support bone, teeth, muscle and immune health. Vitamin D is also referred to as “the sunshine vitamin” as Sun is the best source of this vitamin for human body.	550.00	85	2020-07-09 00:00:00	\N	655	25
633	Organic Kala Chana	Kala Chana or black Gram is well-known for its high iron content which makes it a favorable food for menstruating, lactating or pregnant women and growing children. So we make sure our produce is grown in conditions that keep high quantities of iron and completely no addition colors.	64.00	92	2019-11-08 00:00:00	\N	1061	2
634	Soya Nuts - Roasted	Nutty Yogi's Roasted Soy Nuts are light and crunchy. It is filled with the goodness of roasted grains and spices that gives you a tasty experience. It is rich in protein, fiber, fatty acids, and beneficial plant compounds called is flavones. It makes a perfect alternative for your evening junk food craving.	49.00	51	2019-11-03 00:00:00	\N	1986	29
635	Potato Crisp Chips - Original	Chizzpa Potato Crisp Original,Its an Original flavoured potato crisps with a very tasty and delicious potato crisps. Potato chip is a thin slice of potato that has been deep fried, baked until crunchy.Potato chips are commonly eat or served as a snack,side dish and appetizer.	175.00	91	2020-08-06 00:00:00	\N	1943	10
636	5 Star Oreo Chocolate Bar	Enjoy the all-new 5 Star Oreo with crunchy Oreo biscuits surrounded by flowing caramel. A delicious indulgent combination of chocolate and caramel with a twist of Oreo. Enjoy Longer-lasting chewy multi-textured chocolatey experience with Cadbury 5 Star Oreo Chocolate Bar.	35.00	59	2020-04-07 00:00:00	\N	272	31
637	Pad Thai Noodles	Real Thai Rice Pad Thai Noodles are 100 percent natural rice noodles. They can be served along with any curry according to your preference. It contains 90 percent rice flour and 10 percent water. Savour every moment of your meal with these delicious pad Thai noodles.\n Benefits \nMade with natural rice. It's easy to prepare and goes well with almost anything.	210.00	13	2020-12-06 00:00:00	\N	974	6
638	Xanthan Gum	Xanthan Gum is a natural emulsifier and stabiliser. With amazing properties including solubility in both hot and cold water, tolerance to salt, tolerance to pH and temperature changes, it is ideal for thickening and also works well as a suspension agent. Xanthan Gum provides a daily source of insoluble fiber and promotes a healthy digestive system. Xanthan gum can be used as an alternative to gluten, which improves the consistency of baked goods.\nXanthan Gum is also commonly used to thicken and stabilize foods and medications. This ingredient may be added to foods and beverages or smoothies and green drinks. It is a off-white-to-tannish powder and has no fillers or binders, additives or preservatives.	90.25	27	2021-02-10 00:00:00	\N	492	13
639	Mint Seasoning	Unlike any other mint seasoning you may have ever tried, Orika takes the ever fragrant, ever-refreshing mint to a whole new level of culinary delight. An arousing mix of freeze-dried mint, herbs and spices this seasoning is the go-to solution to produce a variety of Indian as well as middle eastern recipes. It also serves as an enchanting add-on to any dips served with crunchy munchies.	59.25	26	2019-03-11 00:00:00	\N	1062	37
651	Medium Wire Hooks	Damage-Free Hanging Solution Command Hooks is perfect when you are looking for simple ideas to organize your accessories and room, which suits your style and takes the least time? We bring to you an exclusive range of Command hooks that ensure damage-free hanging on walls and holds strongly on multiple surfaces. Command utility hooks blend into high-visibility surfaces so they don't distract from your decor. With Command Utility Hooks, you can easily organize your kitchen, home and office spaces.	219.00	71	2021-03-01 00:00:00	\N	484	20
640	Cranberry Kombucha	Toyo Kombucha begins as a sweet tea, beautifully brewed before adding the magic i.e., SCOBY, for fermentation. Our booch brewers use organic ingredients to create a low-calorie, guilt-free tasty treat. The result- a cool and crisp sparkling tea, bubbling with anti-oxidants. Toyo Kombucha lifts up your efforts to a healthy lifestyle with a wide range of low and zero sugar kombucha. Every booch manufacturer has his own recipe, but at Toyo, we craft superior flavour not through sugar dumping, but with delicate authentic flavours. This beverage is fairly low in sugar as compared to pop sodas. And to add more to it, it is free from all the chemical preservatives present in your other fizzy drinks, which makes it a bang-on health drink. Our brewers stay true to their stand on say no to artificial flavours and present an exotic range of lip-smacking flavours. Toyo Kombucha believes in taking small steps to a better lifestyle. Toyo serves flavours ranging from ginger lemon to exotic peach to lemon-grass and even mango. Thus, leaving you with a number of options to choose from. It also spices-up the boring monotonous diet of fitness freaks. Apart from their protein shakes, they hardly have any other health drinks to confide in. But, with kombucha in the game, they not only have a guilt-free escape but also a super delicious one.	95.00	69	2021-01-10 00:00:00	\N	975	40
641	Nomarks - Antimarks Soap For Normal Skin	It contains the goodness of natural ingredients for marks free glowing skin. It contains almonds to nourish and maintain the youthful skin lustre. It also contains oats powder for refreshing, glowing skin and aloe vera to gently cleanse and moisturize.	35.00	23	2021-04-01 00:00:00	\N	2102	22
642	M1 Perfume Spray - For Men	Engage M1 Perfume Spray for Men. It has the fragrance of fresh citrus and spice that gives you long lasting aroma. It gives you protection against bad odour for a long time. The spray is easy to use and apply. It keeps you feeling fresh all day long. It accompanies all the occasions be it a party, a business meeting or a date. Strike an impression with this spray.	231.00	95	2018-05-05 00:00:00	\N	141	19
643	Passiflora Herb Powder - Supports Low Stress, Strain & Low Blood Pressure	Passiflora (passiflora incarnate) plant is a widely grown perennial climber, and has been used in traditional medicine. It is native to the South-western United States (Southern Texas and Arizona), Mexico, the Caribbean, Central America, and much of South America. The plants grow in full sun and need direct sunlight for at least half of the day. Passiflora flowers have long been valued in traditional herbal medicine as sedative, anti spasmodic & anti hypertensive. Passion flower is included in the national pharmacopeia’s of France, Germany, and Switzerland, and is also monographed in the British Herbal Pharmacopoeia and in the German Standard Licences, the German Homoeopathic Pharmacopoeia, the Homoeopathic Pharmacopoeia of the United States, and the Pharmacopeia of Egypt. Passion flower’s scientific study was found to contain Flavonoids & Indole Alkaloids which are useful for treating mental overwork, nervous irritability, general restlessness, and nerve and menstrual pain. Passionflower was indicated for use in calming the nervous system and for allaying spasmodic conditions. It is useful remedy for people who worry too much or for those that exhaust themselves. Passiflora supports good quality of Sleep and helps to eliminate ill effects of insomnia.	295.00	69	2019-03-06 00:00:00	\N	803	2
644	Zeb Rise Wired 1200 DPI USB Optical High Precision Mouse	Zeb-Rise is a wired 1200 DPI USB optical high precision mouse that has 3 buttons and comes in a 1.2-meter cable length with an easy plug and play installation. This wired technology can provide a reliable connection with a sturdy 1.8-meter braided cable. Low energy consumption and low current design make the battery life longer, environment protection and energy-saving. It is convenient comes with a high-quality USB connector.	168.00	9	2020-04-04 00:00:00	\N	249	20
645	Glass Cleaner	Excel Plus Glass Cleaner carries automotive strength cleaning for glass and mirrors leaving a streak-free, clean shine. It is ideal for Glass Window, Fridge, Mirrors, TV and Oven, etc.	129.00	82	2021-10-08 00:00:00	\N	622	38
646	Aika Snack Bowl Set	These elegant looking bowls come with crystal cut design, made with food-grade material with good quality. With its high wall thickness, it is extra strong. It has a heavy bottom and is dishwash safe, moisture resistant, scratch resistant with no sharp edges & no wobbling.\nThese bowls are a kitchen essential and include the right size bowl for almost every storage, prep, mixing and serving need. Using glass for food storage provides a safer alternative to traditional plastic storage methods that contain harmful chemicals that can leach into food. These bowls are ideal for serving snacks.	159.00	15	2019-04-07 00:00:00	\N	2139	24
647	Hyderabadi Dum Biryani Masala	• Perfect Biryani Masala: With flavours that seem to flow straight out of the Nizam’s kitchens, this biryani masala is a blend of Mughlai and Iranian traditions. It’s rich, spicy and aromatic. So tasty, you’ll want to lick the plate clean! • Biryani Masala To Make Everyday Special: Why wait till the weekend to make biryani- with this masala, you can make biryani on any day of the week. Make a single serving to celebrate a good day or impress your guests with a biryani platter even if they’ve dropped in unannounced. • Versatile Biryani Masala: This biryani masala is perfect for vegetable, chicken or mutton biryani. One pack makes approximately 6 servings. • Easy To Use Vegetarian Biryani Masala: Making a pot of the perfect biryani is as easy as 1-2-3! Parboil the rice with salt and lime for 15 minutes. Mix veggies or your choice of meats with curd & Hyderabadi Dum Biryani Masala in a vessel. Add a layer of rice, cover and cook over low flame for 40 minutes. • Authentic Biryani Masala: We use only the best quality natural ingredients to create this delicious biryani masala. Our biryani masala is MSG-free and contains no added colours, preservatives or artificial flavours.	139.50	41	2022-03-09 00:00:00	\N	400	40
648	Mogo Mogo Fruit Green Tea Make Brew Iced Tea or Hot Tea	Cheery notes of bananas, mango, melons and guava hit your palate as you take in the first sip of this absolutely happy blend. Slowly you start feeling the temporise with rhythmic, flavourful beats from passionflower leaves, cornflowers and sunflowers. The tenor of this tea is calming and uplifting all at once. Trust us, you’ll be humming to every sip with this one!	449.25	66	2020-04-03 00:00:00	\N	1253	23
653	Cashew/Kaju Whole Small W320 500g + Raisins/Kishmish - Indian 500g	Whole kaju for cashew from the house of bb Popular are absolutely delicious and crunchy; this popular snack is loaded with nutritional values. It is said that a handful of cashews or kaju can be really good for your health as it has sufficient amounts of phosphorus, manganese, copper and magnesium. Cashews, unlike other oily tree nuts, contain starch which comprises 10% of their weight. This actually helps them to be more effective in dishes like milk-based desserts, stews and soups.\n Indian Raisins has mouth-watering taste, high dietary value and freshness. These raisins are used in cuisines and pleasant dishes all over the globe. It is wealthy in calcium and phosphorus that assists to fight against different diseases.  Click here for unique and delicious recipes - https://www.bigbasket.com/flavors/collections/231/dry-fruits-berries-nuts/	604.00	37	2020-12-09 00:00:00	\N	30	12
654	Tahini	Bechef Tahini is ultra smooth paste of toasted unsalted Sesame seeds. This middle eastern delicacy is used as an ingredient in number of Lebanese and Egyptian dishes. Bechef ensures best quality by using.	260.00	90	2018-05-08 00:00:00	\N	624	25
655	Atta Noodles - Masala	To discover the proper combination of Taste and Health, Crave for the best, get Top Ramen Atta Masala Noodles. Made from 100% wholesome Atta and packed with an exciting masala for delicious taste. Top Ramen Atta noodles is a stomach filling treat for all. Wheat or Atta is a rich source of Carbohydrates and Proteins that plays great role in reducing the risk of developing metabolic syndromes.	80.00	20	2020-10-07 00:00:00	\N	391	14
656	Original Deodorant For Women	New Dove Original Deodorant gives you smooth, even skin and 48 hr odour protection. Your underarm skin is delicate. Regular Shaving can damage your underarms making them rough and uneven. New Dove Original Deodorant is enriched with 1/4th Moisturising Cream & Natural Caring Oil that visibly reduces the signs of damage to your underarm skin and gives you smooth & even skin. Dove Deo gives you 48 hours of long-lasting sweat & odour protection. This, combined with its classic mild & clean scent, keeps you feeling fresh & clean for longer. What’s more? Dove Deo’s 0% Alcohol and Paraben-free formula give you effective protection while being skin-friendly.  Add Dove Original Deodorant to your daily routine for happier underarms. Also, explore the rest of the Dove Deodorants range & pick from Dove Eventone Deodorant spray, Dove Original Roll-on & Dove Eventone Roll-on.	143.00	15	2018-10-05 00:00:00	\N	1925	11
657	Noodles - Medium Egg	Blue Dragon Noodles - Medium Egg 300 g Pouch	275.00	34	2019-02-10 00:00:00	\N	205	5
658	Happy Chef Pasta- Penne Rigate 500g +Sauce - Arrabiata 270g +Borges Olive Oil 1L	Pastas are an integral part of the Italian Cuisine. Our Pastas are processed in a high-class facility and are hygienically extruded and processed. It undergoes a process of slow drying so that the pastas are dry and have a great texture. Enjoy our assorted shaped pasta with various sauces to prepare different recipes.\n This authentic Italian recipe of Happy Chef Arrabiata pasta sauce is made with fresh tomatoes, garlic, fresh basil and mild chilli. Sun ripened tomatoes, the symbol of Mediterranean cuisine are pleasured with hot piquant chilies and fresh basil to craft this intensely delightful sauce, giving your taste buds a jolt!  Pastas are an integral part of the Italian Cuisine. Our Pastas are processed in a high-class facility and are hygienically extruded and processed. It undergoes a process of slow drying so that the pastas are dry and have a great texture. Enjoy our assorted shaped pasta with various sauces to prepare different recipes.	912.00	54	2021-01-08 00:00:00	\N	1476	21
659	Blemishes & Acne Control Sheet Mask (Pack of 6)	Mirabelle Sandalwood ultra facial sheet mask has a natural and ayurvedic property that keeps away from skin problems like breakouts, pimples and dark spots. Gives you extra glow and makes it soft and silky. Suitable for both women and men.Argan oil, enriched with Vitamin E, it is one of the most useful essential oils. Mirabelle argan oil Koren ultra facial sheet mask makes your skin smooth and moist. In addition, it increases the resilience of the skin. Suitable for both women and men.Mirabelle Seabuckthorn Korea ultra facial sheet mask is richly formulated mask with nutrients from sea buckthorn oil! Leaves your face looking fresher, brighter, healthier and younger-looking. Suitable for both women and men.	425.73	15	2020-03-06 00:00:00	\N	2009	35
660	Super Tight Plastic Container - Printed, Assorted Colour	Joyo super tigh containers are strong, stylish and attractive with beautiful colour. They are ideal to store snacks, biscuits, and other small edibles, and the container can be easily stacked on the kitchen shelf which will help keep all the food items organised. This set of containers from Joyo is durable and safe to use and will also add charm to your modern kitchen.	209.00	64	2019-08-07 00:00:00	\N	1036	29
661	Under Eye Gel	Wake up to eyes that are fresh, and ready to take on the world, seeing it in a new and happy light, every day. Organic Harvest Under Eye Gel stimulates blood circulation, improves skin tone and colour, and combats dark circles and dull complexion, and reduces fine lines too, all the while pampering the delicate area around eyes.	505.75	8	2022-02-07 00:00:00	\N	1102	23
662	Dates Pickle	Double Horse Dates Pickle 400 g	150.00	15	2019-04-01 00:00:00	\N	1820	6
663	Instant Noodles - Pepper Crab Flavor	Koka Instant Noodles Pepper Crab Flavour Cooking Instructions: 1. Cook noodles in 450ml of boiling water for 2 minutes. 2. Add seasoning. 3. Mix well & serve.	45.00	11	2018-01-05 00:00:00	\N	635	36
664	Confeito Rainbow Vermicelli, Sprinkles	Put the finishing touch on all of your fun and festive baked treats with these rainbow sprinkles! Perfect for a consistent product that's sure to please you. Sprinkle these tiny, thin, rod-shaped colourful confections into your signature cookie batter, top a flavorful ice cream sundae, or use them to garnish frosted cupcakes. Can also be sprinkled on cake pops, cookies, cakesicles and more.	128.25	76	2020-08-08 00:00:00	\N	462	38
676	Focus - Super Dog Food, For Adults	Drools Focus Super Premium Adult dog food is for all breed formula. Wholesome nutrition with all the benefits from ensuring strong immunity to dental health, we guarantee the power-packed food that your pet will love the most. With the combination of vitamins, essential amino acids, minerals, antioxidants and other important ingredients Drools Focus adult provides a complete and balanced food to your pet. After intensive research by the experienced nutritionists and veterinarians, our ingredients go through thorough testing where it meets all the obligatory quality standards.	3612.50	17	2022-05-05 00:00:00	\N	1035	8
678	Toilet Cleaner Clinging Bleach Gel	With its thick formula and unique wide dispensing nozzle, Clorox Toilet Bowl Cleaner Clinging Bleach Gel delivers better bowl coverage, so you can have the sparkling toilet you want. No scrubbing required. It disinfects to kill 99. 9% of germs. This formula comes with 5x cleaning action: cleans, deodourises, clings 50% longer, whitens and destroys stains. It Kills germs like Staphylococcus aureus (Staph), Salmonella Enterica, Influenza A1, Rota WA and Candida albicans.	225.00	70	2021-03-11 00:00:00	\N	1119	35
665	Aroma Oil	Rajnigandha And Midnight Jasmine Aroma Oil: The Soulflower Rajnigandha aroma oil helps you to de-stress and create an energizing mood. Jasmine, also known as the ‘Queen of the Night’, has a narcotic aroma and is perfect to create a luxurious and seductive feel to the ambience. Temple Flower And Sandalwood Aroma Oil: Deep, richly intense floral tones of natural temple flower embrace every aspect of femininity. Traditional woody aroma of Sandalwood aroma oil enhances mental clarity and avoids confusion. Walk In The Wood And Mandarin Orange Aroma Oil: Walk in the Woods, inspired by the luscious Forests of Mahogany, builds an amazing and peaceful ambience that gives off a homely, warm feeling. Beautiful Day And Khus Aroma Oil: ‘Beautiful Day’ has a fresh and tangy note which stimulates bliss and optimism in the surroundings that provide energy to your soul and helps you lead a happy and healthy life. Khus’s intoxicating and complex aroma has the singular power to ease feelings of discomfort and stress and fortify your family's health. White Oudh And Soulgreen Aroma Oil: White Oudh has a complex, balsamic, deep woody aroma with a tenacious base note, that is mystical, mythical and magical. Soulgreen has a mild minty and refreshing woodsy aroma that is perfect to create an instant energizing atmosphere.	1500.00	88	2020-02-03 00:00:00	\N	221	31
666	Honey - Weight Watchers	Ginger is very effective in stimulating weight loss, especially for diminishing cholesterol levels. For a small vegetable, garlic sure has a big and well deserved reputation. It helps reduce unhealthy fats, hyper- tension and plaques that blocks the arteries. Cinnamon mixed with forest honey can reduce weight. Regular consumption of lemon helps detoxification and makes you slimmer, reducing your weight easily	550.00	97	2020-07-12 00:00:00	\N	399	30
667	Adhesive - All Fix Clear & Non Staining All Purpose	Pidilite Adhesive - All Fix Clear & Non-Staining All Purpose is a transparent synthetic liquid that is multifunctional and non-staining. It is used for craft purposes and general household fixes. It is the perfect adhesive for fixing pearls, precious stones, plastics, glass, metal, wood etc. This adhesive is waterproof and dries overnight, it starts working 15 minutes after application.	66.50	81	2021-05-12 00:00:00	\N	1836	18
668	Amaranth Grains	Amaranth grain, which has been cultivated for over 8,000 years, is comparable to rice or maize, but with a much higher nutritional value. Amaranthus, popularly known as Rajgira in India, is both tasty and healthy. For those looking for a nutritional boost in their diet, amaranth grains are an unsung hero. This gluten-free, fibre-packed superfood has a delightful peppery flavour that adds some spice to the typical health foods. As a baking essential, blend it into pancakes, porridge, cakes, and even risotto.	147.00	58	2018-11-08 00:00:00	\N	1531	20
669	Garlic Treat	This is a product of malnad region of Karnataka and it is made using good quality Garlic. It is naturally and organically cultivated in the heart of the Western Ghats of this region. It is prepared with the state-of-the-art healthy vacuum frying process. It retains all the nutritional contents of the fruits intact! The crispy, crunchy and tasty garlic with no added colour, sugar or any preservatives that leads to the original taste of Garlic relishment!! Grab your share of natural & healthy fruits - Treat and Taste now!	90.00	48	2018-10-10 00:00:00	\N	580	2
670	Steel Lunch/Tiffin Box With 4 Containers - 8X4	BB Home Tiffin Sada keeps food fresh for hours. Superior quality stainless steel which is scratch-resistant and comes in a compact size which fits easily in briefcase, schoolbag and handbag. Ideal for office executives and school going kids. This container helps promote a healthy lifestyle by avoiding plastic and in turn saving the environment.	349.00	76	2021-03-09 00:00:00	\N	1331	7
671	Disposable Bamboo Wood Skewers/Pickers - For Use With Barbecue, 8 Inch	Bamboooz Bamboo Wood Twister Skewer/Picker Barbeque Disposable Stick is made with high-quality bamboo. It is 100% safe, hygienically packed and infestation free. It is a multipurpose wood skewer. These skewers are disposable and easy to use. It can hold crispy bite-size food easily. It is typically used to make kebabs or for serving appetizers.	99.00	95	2018-01-11 00:00:00	\N	2060	33
672	Gulab Jamun - Gol M Gol	Gulab jamun gets its brownish red color because of the sugar content in the milk powder (khoya). In other types of gulab jamun,  sugar is added in the batter, and after frying, the sugar caramelization gives it its dark, almost black color, which is then called kala jam.	230.00	12	2019-02-05 00:00:00	\N	1017	36
673	Aloe Vera Kanti - Body Cleanser Soap	Patanjali Kanti Alovera Body Soap is helpful in nourishing, rejuvenating and worship the skin. It is also helpful in removing aridness and unevenness of skin. It is a polite soap that removes grime and filth off the skin making it yielding and high-pitched clean. It neither moisturizes the skin nor dries it out. It creates polite lather and smells good.  For Beauty tips, tricks & more visit https://bigbasket.blog/	15.00	66	2020-09-02 00:00:00	\N	2275	10
674	Refillable Gas Lighter With Flame (27.5cm)	Made Of Super Quality Stainless Steel, The Smart Gas Lighter From Fackelmann Is One Of The Safest Gas Lighters Out There. The Smart Gas Lighter Is Particularly Designed To Ignite Gas Stove In A Secure And Safe Way. The Gas Lighter Is Manufactured At The Best Manner Bearing High Quality In Mind.	185.00	38	2019-04-08 00:00:00	\N	471	8
675	Garbage Bags - Compostable, 100% Corn Starch, Large, Green, Mono-Carton(24x32 Inches)	BB Home Garbage disposable bags are made from cornstarch and take approximately 90 to 180 days to decompose. These durable garbage bags are made from biodegradable plastic that decomposes naturally in the environment and can carry up to 6 kg of garbage weight. When exposed to sunlight over time, these bags lose their plastic properties. These eco-friendly bags are ideal for your domestic day-to-day use. Bb Home comes from the house of Bigbasket with trust and quality to your doorstep.\nBenefits:\n\nYou can use the garbage bags at home or office, and they are great for cleaning up after a party as well.\nYou can set these easily in your waste bin and after a lot of garbage has piled up, simply take out the bag and tie its opening tightly.\nBy using these biodegradable bags, you can keep your home healthy and clean. You can also spread awareness in the neighbourhood. Biodegradable bags break down which means the plastic gets absorbed by the earth.	450.00	82	2021-07-07 00:00:00	\N	1331	33
677	Room Air Freshener Spray - Rose Garden	Unlike fragrance oil diffusers, Odonil Room Freshener Sprays can be used at any time, anywhere in your home. Just spray it and transform the mood of your family members with its premium fragrances. This Rose scent fills the air with the enchanting and enigmatic aroma of rose petals. It offers a fine selection of nature-inspired scents to keep your home's bedrooms & living rooms fresh and fragrant. It’s available in 2 different sizes – 108g & 153g; and also available in 7 different fragrances – Jasmine, Lavender, Sandal, Rose, Citrus, Floral Bliss & Ocean Breeze.	119.20	2	2020-06-11 00:00:00	\N	2174	28
731	Organic Red Gram/Tur Dal - Split, Skinned	pigeon peas. This traditional Indian dish is often served with rich spices over rice, and is a staple in many Indian restaurants and households. Toor dal is a member of the legume family, and this meal is not only delicious, it also has a number of health benefits.	135.00	73	2019-05-07 00:00:00	\N	1019	37
679	Organic - Sambar Powder	Organic Tattva Sambhar Powder is made from farm packed organic spices. It does not contain any chemicals or GMO. It is a chemical free vegetarian product. The Organic Tattva team works with accredited organic farmers who do not use fertilizers, pesticides and genetically modified seeds, so that their consumers can enjoy the benefits of nature and relish nutritious, healthy, pure and chemical-free food, which is an important factor contributing to overall well being. Certified by Control Union in compliance with United States Standards for Organic NOP, Indian Standards NPOP; the certificate is approved by APEDA, Ministry of Agriculture, Government of India.	57.00	40	2018-02-09 00:00:00	\N	1061	20
680	Choco Delite Bar	A SPECIAL TREAT FOR YOUR TASTEBUDS: A great blend of scrumptious nuts, superfoods enrobed with DARK CHOCOLATE. All of these accompanied by a subtle nutty texture which promises a modest crunch with every bite. It’s no less than a DELIGHT to your taste buds. NUTRITION AND LOT MORE: Almonds that serve as a source of protein, Oats for the richness of Fibre, Raisins that adds natural electrolytes and aid digestion, Cashews that are rich in magnesium and zinc and quinoa provides sustained energy with Low GI. A product with clean and natural ingredients and no preservatives. YOUR GO-TO SNACK: A pack full of goodness for all your sweet cravings. No more guilt for your midnight binge or when you have a craving for something sweet. This little pack can get you through all those tiring commutes or even those quick exercise sessions. We have got you covered. MADE IN INDIA: We are truly local & proudly vocal about it.	420.00	61	2018-03-07 00:00:00	\N	1390	14
681	Pain Relief Cream	Moov is fortified with the power of 'Nilgiri Oil'. It enters deep inside, makes warmth and assists you recover fast. It is 100% natural Ayurvedic made. Its quick relief formula relaxes the muscles and offers quick relief.A 100% Ayurvedic preparation for quick pain relief.Fast and long-lasting relief from muscle pain, neck and backache, inflammation, sprain, myositis, fibrositis and sciatica.Fortified "Four Active Ingredients" formula helps in relaxing muscle stiffness and relieving pain effectively.The special ingredients like Turpentine oil, Nilgiri oil, wintergreen oil and mint extract swiftly penetrate the targeted area of pain.Also available in easy-to-carry MOOV spray for easy application.For Beauty tips, tricks & more visitÃ‚Â https://bigbasket.blog/	112.50	60	2022-02-12 00:00:00	\N	1105	2
682	Luna Water/Juice/Whisky Tumbler	These tumbler glasses are ideal for serving juice and fizzy beverages. Enhance the beauty of your kitchen with this beautifully crafted tumblers.	499.00	92	2021-02-07 00:00:00	\N	562	17
683	Marvel Avengers Small 304 Stainless Steel Lunch Box/Tiffin Box - HMHTLB 73357-AV	This is the only lunch box where the inside of the lunch box is completely made of 304 stainless steel. Even the lid of the lunch box has steel at the bottom with insulation. This is the only lunch box where the food remains hot for up to 6 hours. The lunch box has a 4-side clip-lock lid and stainless-steel inside to keep food fresh and safe. The lunch box is easy to wash and clean and features Disney and Marvel cartoon design on the top. The lunch box comes along with one small container with a spoon. The lunch box for kids is ideal for daily use and holds just the right amount of food for lunch. Fits easily into a backpack or lunch bag. The outer body is made of PP plastic (non-toxic and BPA free) and has a 304 stainless steel wall inside. This bento is microwave and dishwasher safe and is easy to clean. The 4-side clip locking system adds to the beauty of the lunch box and makes it airtight and leak-proof as well. Because of the outer plastic body, carrying hot food is also easier.	349.00	17	2020-07-08 00:00:00	\N	69	33
684	Silicone Pacifier Step 2 - Purple Flower	Pigeon Oral Development Pacifier System supports the babies to have a natural suck. The pacifiers satisfy their needs and soothe their emotions. Apart from that, pacifiers also help babies to learn nasal breathing. When babies begin to wean and talk, they tend to breathe through their mouths. Unlike the nose, the mouth is not able to filter or humidify the air, which means the dust and infections can enter the mouth, affecting babies immunity directly. Also, the pacifiers thus promote natural nasal breathing, which helps to reduce the possibility of infection through mouth-breathing. It also promotes nasal breathing and the thin lip contact area promotes the healthy development of teeth. It perfectly fits the mouth of a teething baby and the snug-fitting shield conforms to the international safety standards. The soft tip underneath and firm tip on top facilitates the babys natural sucking reflex action activates the brain. It exudes a psychological stabilising effect and the breather holes on the shield for safety. The protective hood for covering the nipple when not in use. This nipple is of perfect shape and size to fit into the sucking fossa of the baby. The inner vertical lines make it collapse-resistant and the textured surface allows the baby to latch on easily. It is 100% silicone nipple, super soft and flexible, allows natural and smooth tongue movement. The air ventilation system reduces intake of gas, which is the potential cause of colic.	249.00	96	2020-10-02 00:00:00	\N	1546	28
697	Channa Masala	Our range of fresh and aromatic whole spices are carefully handpicked by our experts. They are cleaned, powdered and packed at our hygienic facilities. Our chana masala is a fine blend of dried mangoes that is sure to add that desi flavour to your dish. Enjoy nature's finest selection of powdered spices.	21.00	98	2021-05-05 00:00:00	\N	2281	23
698	Red Pasta Sauce	Weikfield Red Pasta Sauce 200 g	40.00	72	2018-05-02 00:00:00	\N	2314	18
685	Olive Oil	St. D'vencE 100% Pure and Natural Olive Oil in its purest form is loaded with Vitamin E and antioxidants that make it a perfect choice for moisturising the body. It exfoliates the skin by penetrating deep into the skin and removes dead skins. The nutrient-rich oil is quite effective in delaying the signs of ageing, so lesser fine lines and wrinkles appear with regular use. When used for hair, it reduces hair fall and its continuous use keeps hair moisturised with a softer appeal. It blends seamlessly with essential oils or any mix-ins. A major source of Omega-6 & Omega-3 fatty acids and powerful antioxidants, that moisturise and absorbs easily without greasy after-feel. Rich in Vitamin A, it works excellently as a skin nourishment and can be used as a face and body moisturiser as well.	299.00	36	2021-08-06 00:00:00	\N	1753	38
686	Cerelac Baby Cereal with Milk - Wheat Apple, From 6-12 Months, Rich in Iron	Nestle Cerelac Baby Cereal with Milk, Wheat Apple is a complementary food for babies from 6 to 12 months. While infants and children have higher requirements of nutrients than adults, 2 serves of Cerelac Wheat Apple Cereal provides 75% of a baby’s daily need of iron. It is also, a source of 19 important nutrients including vitamins and minerals. Nestle develops infant nutrition products backed by evolving science and research. Innovation has been at the heart of Nestle since its beginning.\nImportant Notice: Mother’s milk is best for your baby.\nSafety Warnings: Infant food should be used only on the advice of a health worker as to the need for its use and the proper method of its use. Infant food is not the sole source of nourishment for an infant. Use prepared feed within half an hour otherwise microbial deterioration may set in. Discard unused feed.	199.00	98	2020-01-02 00:00:00	\N	368	35
687	Rockers - Chocolate laddu	Traditional channa ladoo covered intensely with a thick layer of chocolate.\n\nCelebrations are incomplete without mithai. Misht is made with the finest ingredients without preservatives and is packed hygienically using cutting edge technology to bring out an authentic flavour. Celebrate with Misht! Every bite hits the sweet spot!	299.00	20	2019-12-08 00:00:00	\N	452	35
688	Muffin/Cup Cake - Vanilla	Moist and delicious in flavours of vanilla. Enjoy it with family and friends. It is ideal for bonding over tea. A good muffin is ideal for tea time. The muffins are fresh and true to their brand name. Made with premium quality ingredients, the taste is surely going to tame your tastebuds. Enjoy this sweet delight and say bye to small hunger pangs.	159.00	7	2021-06-01 00:00:00	\N	1973	16
689	Gunpowder Temple of Heaven Hand Rolled Green Tea	Tiny hand-rolled pearls of some of the finest Chinese green tea leaves give this tea its unique name. When hot water is poured over it, the little balls dance gracefully in the water and unfurl slowly producing a flavourful, pale brew with a mild, slightly bitter aftertaste which is intensely pleasing. Temple of heaven, as the name implies, is the highest grade of this type of tea and perfectly paired with most meat and vegetables. It also can be brewed into a refreshing iced tea with or without lemon.	539.10	73	2020-05-04 00:00:00	\N	1253	33
690	Cool Wind Eau De Toilette Deodorant	A brand inspired by the Greek goddess of victory, it personifies strength, speed and energy and it launched its first perfume in 1929. Since then, a wide assortment of fragrance collections has hit the marketplace with refreshing, and eye-catching proposals that capture the essence and lifestyle of today´s man and woman.	223.20	4	2020-05-08 00:00:00	\N	1134	3
691	Sausage - Chicken Piri Piri	Chicken meat (80%), Water, Spices Condiments & Herbs (Ginger, Garlic, Red chilli, Basil, Paprika,Onion) Edible common salt, Emulsifier E-452, Edible strach, Dextrose Lemon oil, Yeast extract powder, Antioxidants E-316 & E-300 Contains natural and identical flavouring substances.	325.00	2	2021-02-07 00:00:00	\N	2066	23
692	Kesari Shakti Kalp Chyawanprash - Immunity Booster With Gold, Silver & Saffron	Anti-ageing tonic for rejuvenation and vitality; enriched with Gold, Silver, and Saffron with 44 herbs and minerals. Baidyanath Kesari Shakti Kalp Chyawanprash is a unique research formula and excellent Ayurvedic tonic formulated with the combination of rare herbs, rich spices, and fruits by renowned Ayurvedic Scholars & Baidyanath Research Foundation. The materials are very carefully chosen to impart the right benefits that rejuvenate the body and bring back youthful energy and vigour.	450.00	99	2020-06-10 00:00:00	\N	2114	20
693	Immuniveda Golden Turmeric Milk Mix - Immunity Booster	This instant mix is made with the time-tested immunity-boosting recipe Haldi-Doodh, enriched with Cardamom, Cinnamon and Black Pepper. Each serve of this mix has the goodness of 2 spoons of Turmeric, which helps improving immunity and manage inflammation and is a natural source of anti-oxidants. \nBlack Pepper aids in digestion and helps in the absorption of turmeric in the body. Cinnamon helps support metabolism and cardamom is a source of antioxidants as well. Bites of real almond are a rich, natural source of protein and add a crunchy surprise to your turmeric milk.\nSaffola ImmuniVeda is a contemporary range of products that harness the power of Ayurveda to boost your immunity. Inspired by the ancient recipes, we have carefully selected potent ingredients and combined them to create unique Ayurvedic products. This can be consumed as a hot or cold drink and in any form – milkshake, cold latte, hot beverage or a dessert that even your kids will love. Now give your family the enhanced goodness of turmeric, without them even knowing it! The need to bolster this natural protective cover is becoming critical as new challenges keep emerging in the world.	798.00	92	2018-09-08 00:00:00	\N	1768	19
694	Air Freshener - Lavender Flavoured, Paper, BB1100	Fresh and graceful fragrance uplifts the mood of any person in seconds and creates some distressing mood. This lavender fragrance room freshener by Kuxuna helps to eliminates the bad and foul smell from the room and makes it the better and happy place to spend time in. The freshener can be placed anywhere in the room and fills the space with a delightful and pleasant smell.	58.00	89	2021-08-11 00:00:00	\N	1250	33
695	Edam Ball Cheese - Diced	Fresho Signature brings the traditional cheese from the Netherlands- the Edam Ball. Cheese for the voyagers, it is best known for how long it lasts and how well it travels. The red paraffin wax coating is not to be consumed. The yellow, hard cheese is crumbly and delicious and only hardens further on ageing. It goes well on its own and is also a great dessert cheese when paired with zest apples or pears. For your convenience, we prepare the cheese as per individual orders into slices/dices or blocks.	342.00	49	2020-11-08 00:00:00	\N	1973	29
696	Green Chilly - Chopped	Fresho brings to you chopped Green chillis with a fresh flavour and sharp bite to bring a tang of spiciness to your food	18.00	66	2019-08-07 00:00:00	\N	2027	12
699	100% Pure Honey - Worlds No.1 Honey Brand With No Sugar Adulteration	Do you want to boost your Immunity? Do you find it difficult to manage a healthy weight? Do you want to give a healthy start to your day? Do you wish to improve your digestion and metabolism? If the answer to the above questions asked is YES, then you can include World’s No 1 Honey brand - Dabur Honey as a part of your daily regime. Dabur Honey is 100% pure and entirely sourced from Indian beekeepers. Every batch of Dabur Honey conforms strictly with all the 22 parameters mandated by FSSAI (Food Safety and Standards Authority of India) for testing Honey. Dabur Honey undergoes 100+ tests and is LCMS/MS tested for antibiotics, IRMS tested for no sugar adulteration and LCMS/MS-SMR tested for zero sugar syrup adulteration. Dabur Honey is completely sourced, tested and packed by us ensuring that it is untouched by human hand. According to a recent clinical study, people who consumed Dabur honey with lukewarm water every morning, showed significant improvement in stamina, digestion and waist-hip size.* For a healthy start to your day, you can have Dabur Honey with lukewarm water daily to see results. Check purity certificate and report of your pack of Dabur Honey by sending your batch code as Whatsapp to 4071781666 or logon to daburhoney.com	138.00	79	2019-11-11 00:00:00	\N	1186	17
700	Disney Cinderella Princess PVC Embossed Pencil Bag - HMHTPB 72231-CIN	Take these adorable Cartoon Characters pencil pouch wherever you go. Great for holding stationery, study or craft supplies, cosmetics, makeup tools or small accessories. Made of high-quality durable PVC material with waterproof surface and metal zipper. Available in Disney Princess, Cars, Mickey Mouse, Minnie Mouse, Frozen, Cinderella, Belle Princess, Moana, Tsum Tsum, Marvel Avenger and Marvel Spider Man.	160.00	81	2021-05-05 00:00:00	\N	69	28
701	Prosto-8 Tablet	The Meghdoot's Prosto 8 Tablet is known as a natural medicine for prostate health that helps to improve and maintain healthy bladder functions while regulating the normal urinary output. This helps supports healthy prostate and improve normal male urogenital function. It is made using ayurvedic formulation that it is safe to use.	150.00	68	2020-07-07 00:00:00	\N	458	33
702	Exfoliating Walnut Scrub	New Exfoliating Walnut Scrub has natural Walnut Shell Particles and Nano Multi-Vita. Natural Walnut Shell Particles exfoliate dead skin cells and skin impurities which may\n\nblock pores and may cause blackheads & whiteheads. Nano Multi-Vita helps in nourishing and revitalising the skin, leaving your skin clean, clear and beautiful.	161.25	1	2018-08-11 00:00:00	\N	1199	35
703	Accurate Seal Plastic Tea, Coffee, Sugar Storage Container/Canister - Blue	Enhance the grace of your kitchen with this pastel coloured canister set. The set comes labelled with sugar, tea and coffee respectively that simplifies storage for you and manages the kitchen counter with much ease. The simple yet stylish looking design adds to the beauty of them. It is a great pick for any homemaker.	129.00	43	2020-02-10 00:00:00	\N	659	9
704	Mousepad With Gel & Wrist Support	KCL Office and Home Mousepad with Gel come with Wrist Support. It comes in assorted colours with radiation protection. Made from Silicon, Natural rubber and fabric, it can be used by all age groups.	87.00	2	2020-05-05 00:00:00	\N	1508	22
705	Premium Raw Organic Holy Basil Seeds	A traditionally native to India, organic, non-GMO, Premium basil Seeds pack a powerful superfood punch. These small, crunchy, gluten-free seeds are a rich source of protein, beneficial antioxidants, essential omega-3 fatty acids and wholesome fibre.Happilo provides food that is packed with the goodness of nature and taste that will keep you wanting for more. With a range of food items across categories like nuts, dry fruits, dried fruits, berries, seeds, mixed nuts, fusions, nut mix and other healthy items.Each of our products is not only 100% natural but is also made of 100% whole grains. While we stand strongly for health, wherein our products have a clear functional benefit, we believe that taste is the most important element when it comes to Snacks. We strive to bring the best range of snacks to you.	99.00	73	2020-01-12 00:00:00	\N	592	1
706	Namkeen - Murku, Ribbon	Made with gramflour&riceflour	55.00	86	2020-09-01 00:00:00	\N	1032	32
707	Organic - Green Peas/Ona Batani	Green Peas are small, round and green, and are generally harvested in the early summer. It gives delicious taste, as a fresh Green Peas. These are low in calories and contain negligible amounts of sodium, fat and cholesterol. Vitamins A, C, K and B6 are present in plenty.	135.00	54	2020-08-12 00:00:00	\N	2281	14
708	Chewy Mints - Lemon	Opportunities to connect with someone new happen often, but it can feel nerve-wracking and never lasts long. Doublemint’s chewy mint has two layers: a thin, crispy outer shell and a chewy, freshening core. They're great for an instant fresh feeling that's oh-so-satisfying to chew. Doublemint Lemon gives you the confidence to let your guards down and start something fresh. This chewy mint is specially designed for those who demand long-lasting fresh breath along with a minty blast. The bold flavours of Doublemint mint come in a convenient re-sealable bottle so you can pop a rush of freshness whenever the moment strikes you. Now be fresh breath ready with Doublemint, even with the mask on!\nThe next time you need a quick, fresh boost, pop the mint that’s fresh and delightfully chewy while working at home, studying, working out or even virtually meeting new people. Now with Wrigley’s Doublemint, you will never miss out on that ultimate moment of connection!	50.00	47	2020-09-09 00:00:00	\N	1779	29
709	Plain Container Jumbo Combo Set - Blue	3pcs of 600ml,800ml,1100ml or Virgin pp plastic container ,100% bpa free &  foodsafe container.	469.00	2	2020-08-08 00:00:00	\N	2257	18
710	Nacho Crisps - Cheese & Herbs	Cornitos Nacho Crisps Cheese and Herbs is the unique combination of cheddar cheese and cool Italian herbs, you will fall in love for sure. It is 100% corn snack and contains up to 40% less oil than regular potato chips. It has zero cholesterol and trans fat making it a healthier snack for you which you can munch any time of the day you like.Enjoy this amazing snack and say bye to your small hunger pangs.	13.40	22	2018-12-07 00:00:00	\N	1528	35
711	Syrup - Peach	Imported from France, used for Cocktails & Mocktails	895.00	6	2021-04-10 00:00:00	\N	1575	6
712	Disney Frozen 304 Stainless Steel Lunch Box/Tiffin Box - HMWWLB 85274-FZ	The age-old steel lunch box design is back in its newest avatar. The outer body is made of ABS plastic (non-toxic and BPA free) and has a detachable 304 stainless steel tray inside. It also comes with a chutney container. This bento is microwave and dishwasher safe and is easy to clean. The 2-side clip locking system adds to the beauty of the lunch box and makes it leak proof as well. Ideal size to be carried in your school bag or purse or office bag. Because of the outer plastic body, carrying hot food is also easier.	599.00	1	2021-08-07 00:00:00	\N	69	19
713	Jack Fruit Chips	A-1 Made with High Quality ingredients to make snack time better.	120.00	77	2020-01-11 00:00:00	\N	21	5
714	Organic Sona Masoori White Rice/Akki	Sona Masoori is a variety of medium grain, typically used to make fluffy plain rice, sweet Pongal, biryani, idlis and fried rice. Packed with natural minerals, it is nutritious and beneficial to one’s health. This variant is procured from paddy that has been aged for a duration of 12 months. Cook, your favourite dishes with this tasty rice which has been processed with expertise. It is lightweight and sweet-smelling and measured to be of the finest quality. It has a distinctive taste that is not matched by rice from any other region. It is the tastiest of all the Sona Masoori rice available in the state.	619.00	1	2019-04-12 00:00:00	\N	2281	17
715	Pet Food - Variety Stix	Jerhigh snacks are made of chicken meat. They are carefully prepared to provide a pure, tasty and highly digestible snack. Jerhigh contains goodness with nutritional benefits for your dogs well being. Jerhigh snacks are suitable for feeding as snack, or reward to show your pet love.	440.00	69	2019-02-08 00:00:00	\N	1914	40
716	Thyme & Rosemary Hair Tonic - Scalp-cleansing Treatment	Thyme and Rosemary is well-known for their utility in hair problems. Thyme has antiseptic properties and stops hair loss by stimulating blood circulation in the hair follicles. Rosemary is known for stimulating the hair-bulbs to renewed activity and preventing premature baldness. While Bhringaraj pacifies Vata-dominated hair problems, amla prevails over pitta-dominated hair problems. Bel nourishes the brain cells and makes sure that good quality hair is produced. This unique combination of herbs proves very effective in controlling excessive hair loss. The regular use of the oil provides nourishment to damaged and devitalized hair. It is extremely useful against premature greying, loss of lustre and thinning of hair leading to the strands breaking off. It is good for hair loss or alopecia and promotes hair growth.	95.00	74	2020-07-11 00:00:00	\N	901	14
717	Deccan Gold - Premium Filter Coffee, 80:20 Blend	Pristine Deccan Gold Filter Coffee are carefully combined and roasted to offer the full, rich savour and aroma. This is using superiority coffee beans under complete hygienic conditions. It is a wonderful blend of colour, savour and strength which is also first-class for your health. It has a different flavour that satisfies the most discerning coffee drinker. It is a delicate light to medium roast coffee. It completed from the highest quality of coffee beans.	100.00	16	2020-03-02 00:00:00	\N	1344	40
718	Multigrain Chips - Dahi Papdi Chaat	Too Yumm! has the goodness of vegetable and multigrain, It is smart snacking with a great taste and less guilt. Too Yumm! Multigrain Chips - made from 7 grains: Wheat, Rice, Corn, Gram, Oats, Soya and Ragi was the answer to fulfilling a king-sized appetite. It is baked and not fried.40% less fatGoodness of Protein	29.75	54	2019-07-01 00:00:00	\N	535	37
719	Shikanji & Chaat Savoury Taste Makers	Masala Shikanji is an Indian spiced version of sweet and delicious lemonade. This refreshing, revitalizing and energetic lemon-based drink is bursting with tangy, sweet and spicy flavours. It is easy to make, tastes great. Great for digestion, rich in nutrient, a natural coolant it is good for weight loss when made with honey, a great cure for hangovers, can be mixed in cocktails!	295.00	21	2018-02-08 00:00:00	\N	741	32
720	Value Pack - Blueberry Almond Crisps + California Pistachio Crunch	Our special combo pack includes a grouping of delectable yet invigorating treats in the form of Blueberry Almond Crisps and California Pistachio Crunch.\nA bite full of happiness and health, is what we like to call this little delight.	499.00	9	2019-09-07 00:00:00	\N	1011	32
721	Sensitive - With Anti-Sensitivity & Fluoride Toothpaste	Clove is your very own dental care expert made by Indians for Indians. Clove Sensitive helps relieve the sharp or sudden pain caused by sensitive teeth. The toothpaste is formulated with Dentist approved ingredients to provide long-lasting relief from sensitivity and help prevent cavities. With the goodness of clove oil & mint it helps reduce the formation of plaque and tartar above the gum line and fight against gingivitis, stains, tartar, and cavities. Fluoride gives protection against tooth decay and strengthens teeth. Clove Sensitive has excellent foaming action with smooth & easy flow ensuring it gets to every corner of your whole mouth and fights bacteria on teeth, tongue, cheeks, and gums, enamel protection and prevents bleeding gums. Say goodbye to sensitive teeth and gums as you welcome Clove Sensitive toothpaste. Clove Sensitive has a unique flavour (Clove + Mint) formulated by Symrise, a world-renowned flavouring company based in Germany and manufactured in India by Dabur.	152.00	30	2018-05-07 00:00:00	\N	827	27
722	Bucket - Super, Green	Cellos bucket range is not only rich in style and colour but is also high on durability. It is made of high-grade virgin plastic and has the most user-friendly design. It has a comfortable grip that makes lifting and movement easy. These buckets can be used for indoor needs like bathroom bucket, home cleaning bucket, water storage as well as outdoor purposes like gardening, cleaning etc. It comes with a range of capacities and colour options.	210.00	65	2021-07-08 00:00:00	\N	2224	24
723	Eau De Parfum - Hydra Energy, For Men	The fresh and energetic fragrances by Wild Stone deodorant sprays combine woody and musky notes which awaken the senses and eliminates the bacteria which cause sweat odor. The fragrance is long lasting and leaves your skin with a cool sensation.  For Beauty tips, tricks & more visitÃ‚Â https://bigbasket.blog/	299.25	51	2021-05-09 00:00:00	\N	1504	22
769	Green Tea - Tulsi, Good Morning	Tulsi, popularly known as Queen of Herbs, is the most sacred herb in India. It is infused with great heating power. Tulsi has recognized for its high medicinal properties and has found it useful in treating cough, cold and vocal disorders. Prepared by master tea blenders and tasters at Wagh Bakri Tea Group, the unique blend of Tulsi and green tea boosts health and well-being round the year.	75.00	48	2018-04-04 00:00:00	\N	88	1
724	Safe Sun Sun Block Cream PA+ - SPF 20	Lotus Herbals Sun Block Cream SPF 20 protects the skin from the harmful effects of the sun. If harsh summer is that time of the year that you dread for the sake of your skin, then you have got a reason to rejoice. The Lotus Herbals Sun Block creme helps prevent the darkening of your skin with amazing effect. With its chemical-free formulation, the product works amazingly well for your skin at all times. The SPF 20 in the sunblock creme helps maintain the skins youthful look without suffering damage from the severe rays of the sun. The sunblock offers complete protection against UVA and UVB exposure so that your outdoor travelling or commute does not become the reason for a loss of youthful and fresh looking skin you are endowed with. The extracts of berry and natural sunscreen agents provide a much more effective product adept at short-term skin care. It is suitable for all skin types and can be used daily without any effect on the skin. Any part of your skin exposed to the unforgiving sun rays can benefit from daily application.	142.50	72	2022-02-11 00:00:00	\N	454	26
725	Chandan Kesar Haldi Face Pack	Scientifically made skin whitening treatment that also reduces skin blemishes and removes skin pigmentation marks. This age-old combination of Chandan, Kesar & Haldi effectively exfoliates dead skin cells from the surface. It even fights tanning; fades dark spots and blemishes and lightens the overall tone of the skin.	436.50	44	2019-09-05 00:00:00	\N	1731	38
726	Hazel Nut	Sapphero Hazelnuts, because you deserve nothing but nature’s best offering. Filled with necessary vitamins, protein, dietary fiber and healthful fat, these little joyful nuts can have multiple uses. Consume them directly, make a healthy milkshake or put some in your baking recipes. They also help in reducing weight gain, keeping your heart healthy. Its recommended to consume these nuts on a daily basis.	455.00	9	2021-05-02 00:00:00	\N	2289	26
727	Pickle - Avakkai	Mambalam Iyers Aavaka pickle is made by raw mango with Chilly and mustard seeds. These ingredients are making the pickles extremely spicy and tasty.	57.00	23	2021-09-06 00:00:00	\N	67	25
728	French Lavender Oil & Rose Water Face Wash	ST. DVENCE Lavender Oil Face Wash is a refreshing lather with a balanced blend of French Lavender Oil, Rose Water and Aloe Vera. This gentle concoction works together to rejuvenate and fight against the harmful effects of pollutants on the skin. Versatile of all essential oils, Lavender is enriched with Vitamin E that acts as a skin regenerator, prevents sun damage and keeps the skin hydrated. Enhanced with a relaxing and harmonizing aroma, it detoxifies the skin's natural functions, making it ideal for everyday use.	310.00	87	2020-05-09 00:00:00	\N	1753	29
729	Green Moong//Hesaru Kaalu - Split	Moong beans are a well-liked food among vegetarians since it includes a lot of proteins and fiber. It is one of the easiest dals to digest and for this reason it is frequently given to people recovering from an illness, specially a stomach upset. It contains antioxidants which is extremely healthy for the good functioning of the human body. It is an excellent balanced diet and could be included in our daily.  Click here for unique and delicious recipes - https://www.bigbasket.com/flavors/collections/230/dals-pulses/	130.00	3	2020-11-11 00:00:00	\N	693	25
730	Bio Papaya Scrub Wash	This fresh foaming gel is blended with pure papaya fruit to dissolve dead surface cells, unclog pore openings and smooth the way for clear skin to surface. Gentle refining action uncovers skin's natural brightness for a younger-looking complexion.	202.50	64	2020-03-05 00:00:00	\N	848	29
732	Clothes Storage Laundry Bag - Text Printed, Blue, BB-549	This blue laundry bag helps you sort laundry, toss stuff and clear the clutter from the room. The bag is cylindrical. This laundry bag is made using washable fabric with printed sheep on it. The bag is lightweight, durable and easy to carry. It can fit all the dirty clothes or use it to keep other things like toys. The bag is excellent to keep your room organised.	519.00	83	2019-03-08 00:00:00	\N	2238	34
733	Ramen Noodle Soup - Kimchi	It is the original Korean Ramen Noodles with delicious Hot Chicken flavour. Enjoy the perfect balance of spices like sesame seeds and grilled seaweed flakes with an authentic taste. This noodles is the ideal choice for your evening snack or anytime hunger.	110.00	88	2021-10-04 00:00:00	\N	181	16
734	Eyeconic Kajal	Accentuate the beauty of your eyes with the Lakme Eyeconic Kajal. This dermatologically tested kajal is just what you need for completing your eye makeup or carrying a simple, only-kajal look. It is a smudge proof, waterproof kajal, and can add the dramatic and glamorous look to your eyes. It has an intense matte texture for Eyeconic eyes. You can experiment with a thin line or a bold wing. This kajal is great for day and night looks. It is long lasting, up to 22 hours without smudging and is completely waterproof. It is designed with an easy to use and convenient twist-up format. Just one stroke of the Lakme Eyeconic Kajal enhances your simple look to a more stylish avatar. Its beat all your timelines, be it meetings, traveling or just a day out and lasts for 22 hours. You are incomplete without kajal and this is a perfect everyday product! Get the Lakme Eyeconic Kajal in black now. The black Eyeconic goes best with your Eyeconic mascara to enhance your eyes further. You can also use from our 4 eye quartet pallets to enhance your eye for wedding, party and work look.	206.25	35	2021-04-12 00:00:00	\N	539	35
735	Stainless Steel Water Bottle - Red BB 508	Carry this versatile and stylish red bottle whenever you go out. The bottle is made of stainless steel, which is durable and is corrosion resistant. Also, it is lightweight and dishwasher safe. The bottle's sleek design makes it fit anywhere in the backpack. It is ideal for students, travellers and people at the jobs. The wide mouth of the bottle makes it easy filling and prove to be perfect on the go bottle.	440.00	84	2019-11-06 00:00:00	\N	2238	23
736	Nilgiris Green Teabags - Anicca Chamomile	The true thing about permanence is its impermanence. Except for our Anicca Chamomile Green Tea, whose taste and aroma, remain perpetual, no matter what. Tender leaves and buds, handpicked by nimble experienced fingers from selected bushes of the estate in Nilgiris, undergo a unique process of roasting and drying that is specially employed to craft this semi-fermented tea. They are then mixed with chamomile flowers where they impart their fragrance to green tea leaves.	297.50	5	2020-02-05 00:00:00	\N	1544	6
737	4mm Aluminium Kadai With Handle - Silver	Hazel Aluminium Kadhai is ideal for samosas, vegetables, making sweets and much more deep frying foods. This kadai has a classy finish and gives an elegant look to kitchen decor. This kadai is an ideal cookware for any kitchen. It is easy to clean and wash. It is used for preparing and cooking food or stylishly serving food. The aluminium kadai with handle is long-lasting and durable. Its design makes it a great addition to your antique cookware collection. This kadai has a comfortable handle which makes it easy to carry and handle.	699.00	78	2020-01-02 00:00:00	\N	2288	22
738	Select - Chhole Masala	Valley Spice Chhole Masala is made with Pure & Authentic ingredients.\nIt is a perfect blend of all the spices which are dried or roasted and coarse ground to keep the flavours of the spice intact.\nSo spice your dishes up with Chhole Masala and experience the joy of feeding the taste so delicious no one will ever forget.	75.00	9	2020-03-02 00:00:00	\N	466	27
739	Borosilicate Glass Round Container With Lid - Green	These BB Home Borosilicate Glass storage containers are crafted and manufactured to bring the best of the quality, clarity in glass and shine for elegance. These Borosilicate Glass containers are very superior in quality with high wall thickness and with a heavy bottom to flaunt your style and elegance to your guest at the first impression. \nThese containers are manufactured with high precision to ensure no wobbling on the rim or bottom of the glass. These are 100% food grade and dishwasher safe. These are airtight borosilicate container with high-quality gasket fitted on the lid to ensure freshness of food stored inside. It can withstand up to 400 Degree Celsius temperature. \nIt can be used in the microwave, OTG/Oven or even it can be placed inside the electric cooker to cook your delicious food. These borosilicate containers come with coloured lids which are 100% food grade and BPA free. \nThese containers are freezer safe as well. These food storage containers can be used to store fresh food and even leftovers so that, you can re-heat anytime without the hackles of using multiple containers. Even, these can be used as tiffin boxes for light bites.\nBB Home products are always high quality and at a very competitive price compared to other branded products in the market. So, when you get the best or better than the brands available in the market at a lower cost, definitely you save money and get the best quality product for your use.	249.00	36	2020-03-01 00:00:00	\N	1331	14
740	Protein Bars - Peanut Cocoa	Peanut butter and chocolate are just made for each other. A soft and chewy mix of smooth, nutty PB and indulgent, dark cocoa. The purest, tastiest, sweet and filling protein bars. Nothing artificial, no added sugar, no soy, no gluten. Nothing bad whatsoever. 100% natural. The Whole Truth is rebuilding the world's trust in its food.\nBenefits:\n1. Rich and decadent protein bars, made with 100% natural ingredients.\n2. Nothing artificial flavouring, no added sugar, no soy and no gluten.	510.00	81	2019-09-06 00:00:00	\N	1304	17
741	2X French Perfume Fabric Conditioner	Throw away your fancy perfumes because New Softouch 2X Fabric conditioner comes with an amazing fragrance inspired by famous French Perfume. It lasts longer than perfume on our clothes and gives you all day fragrance and freshness. It has 2 times fragrance dosage as compared to other fabric conditioners and comes with encapsulation technology which releases fragrance in bursts when clothes come in contact with your body, thus offering you a whole day of fragrance.\nNew Softouch 2X fabric conditioner comes with an amazing fragrance inspired by famous French perfume Rich notes of French Rose, Jasmine, Patchouli, sweetness of cotton candy, and vanilla Neutralizes the effect of harsh detergent and hard water While retaining the shine and softness of the clothes intact.	388.08	54	2018-02-08 00:00:00	\N	966	36
742	Chilli Powder/Menasina Pudi	Traditional Spice Mix (not curry powder) Chili powder blends are composed chiefly of chilli peppers and blended with other spices including cumin, onion, garlic powder, and sometimes salt. The chilis are most commonly red chilli peppers; "hot" varieties usually also include cayenne pepper.	60.00	49	2021-08-10 00:00:00	\N	1475	31
743	Madras Sambar Powder	Savour piping hot sambar sprinkled with the goodness of vegetables & spices that are extravagantly good. Sambar is a south Indian soupy dish made with lentils, mixed vegetables, tamarind, herbs, spices & a special spice powder known as sambar powder.	38.00	21	2019-09-06 00:00:00	\N	370	33
749	India's No 1 Fluoride Free Toothpaste	If you want to start your day with something that is truly unique go grab a pack of Dabur Meswak today. Dabur Meswak is made from pure extract of rare Miswak herb which grows slowly, resisting the brutal forces of nature amidst the sand dunes of Africa and South Asia. Even a small portion of this herb is capable of providing complete oral care to you. The ingredients of Miswak herb truly make Dabur Meswak unique. It has resins that form a layer over the enamel - protecting against caries; Silica which removes stains; Alkaloids exerts a bactericidal effect and stimulatory action on gingival, Essential oils stimulates the flow of saliva which works as an antiseptic, Vitamin C helps in healing and repair of tissues, etc. The best part of this unique toothpaste is the amazing mouthfeel it leaves behind, which lasts the whole day.	210.96	42	2020-11-03 00:00:00	\N	1931	6
770	Fabric Conditioner - Rose Fresh	Makes clothes comfortably soft & freshner, easy ironing, less wrinkles	450.00	55	2020-09-04 00:00:00	\N	303	34
750	Mild Cheddar - Red Portion	Authentic handmade Singleton Red Cheddar is a deliciously creamy cheese with both savoury and naturally sweet notes. Processed cheese is made by blending natural cheese, emulsifying, and pasteurizing, and contains no other ingredients, This Cheese is a snack food product consisting of crackers and cheese. Cheese can be used in the preparation of beer cheese spread. Cheese can be used in the preparation of cheese spread sandwich, pasta, sandwich cake, cheese rolls.	449.00	63	2021-01-03 00:00:00	\N	1870	33
751	Wassup Pup Sulphate Free Puppy Shampoo	1) For Pups/Kittens, Sensitive and Ageing Dogs: Captain Zack Wassup Pup is specially formulated for dry, sensitive, delicate skin and coat of your pup. It’s a great moisturising shampoo for fresh, clean and healthy puppy/kittens, sensitive and ageing dogs.\n2) Why Sulphate Free (no lather): Sulphates are known skin irritants and cause allergies. They are extremely harsh and strip away the natural oils, hence are very damaging to sensitive skin. Wassup Pup is a sulphate-free puppy shampoo.\n3) Natural Actives/Essential Oils: This Puppy shampoo contains natural botanical aroma oils such as lavender essential oil, lemongrass essential oil that carries antibacterial, antifungal and antiseptic properties along with vitamin E extracts. The calming and healing effects of Lavender along with Lemongrass’s natural deodorizing effects makes this shampoo useable for sensitive pups.\n4) Less Foaming, Gentle Ingredients, Effective Cleansing\n5) Anti-Irritant, Anti-Bacterial, Anti-Fungal and Antiseptic\n6) pH Neutralised: Ideal for Dogs\n7) Fragrance-Free and Paraben Free: We’ve gone to great lengths to ensure that our paraben free dog shampoo is devoid of harsh chemicals. The last thing you want is your pet’s skin to be irritated by the very pet care product that was supposed to condition and pamper him or her\n8) Moisturises and Conditions: At Captain Zack, we strive to formulate the best moisturizing dog shampoo and conditioner along with other products that put your pet first.\n9) Animal Cruelty-Free and Vegan: Our products are vegan, animal cruelty-free and not tested on animals at any stage of product development.\n10) No Harmful Chemicals and No Artificial Fragrances	390.00	90	2022-06-09 00:00:00	\N	44	36
752	Pinnacle Pride Lunch/Tiffin Kit - Yellow	Pride Lunch Kit fits everywhere and anywhere you go. Enjoy its multi uses and benefits of having hot food and cold food, the way you like. It has 2 Tritan containers of 600 ml and one container of 400 ml. These food containers are now available in vibrant and eye-catching fresh colours in a well-insulated thermal bag.	600.00	82	2019-01-11 00:00:00	\N	744	16
753	Red Hot Anti Germ Mouthwash	New Closeup Red Hot Mouthwash is for long-lasting freshness. Powered by natural clove oil and anti-germ formula, it fights germs 24/7. This is bought to you from Closeup, India’s leading freshness brand in the toothpaste category. This mouthwash comes with natural clove oil and antigerm formula. The clove oil is for long-lasting fresh breath and the antigerm formula is for 100% mouth clean up that mints can’t do. Moment of closeness can happen anywhere anytime and you need the confidence to seize those moments but bad breath can kill this confidence.With the new Closeup, Red Hot Mouthwash have the confidence to seize the unexpected opportunities to get closer anytime anywhere. No alcohol formulation (refers to ethyl alcohol), it is 100% proven action against germs which fight germs 24/7 to give you long-lasting freshness. Made in India, it is marketed by Hindustan Unilever LTD (HUL).	185.00	87	2020-11-04 00:00:00	\N	907	8
754	Premium Eau De Toilette	The Man Company Premium Eau De Toilette is the perfect choice for the party animal! Your party night look is incomplete without a fragrance that matches your style.	1319.40	97	2020-12-04 00:00:00	\N	1213	29
755	Coffee Roasters - Dark Vienna Roast, French Press	Roast Level - Dark Grind Type -French Press 100% Specialty Grade Indian Arabica Coffee (No added flavour or preservatives). We source through direct trade relationships with India's best farms.\nTasting Notes: Cocoa, Oaky, Bitter Sweet\nWe freshly roast our coffee only after your order and grind it to suit your particular brewing method. We recommend Channi Grind If you don't have any coffee brewing equipment yet. Our mission since we started has stayed simple: introduce our customers to the estates we directly buy our great tasting coffee from, roast the beans with care, and make high-quality coffee more accessible through our cafes and our website. The coffee we roast is the coffee we like to drink, and we hope you like it too.	450.00	78	2022-03-09 00:00:00	\N	1388	8
756	Pure Shilajit - Resin Form	Pure shilajit resin (semi-liquid) is the purest form of shilajit, with the benefits that are endless and provide a healthy body and mind.  Pure Shilajit resin is attained through a sophisticated all-natural process, sourcing the purest form of Shilajit from a location that is a well-guarded secret. It has a perfect concentration of essential minerals, nutrients like Fulvic Acid, Selenium that makes it the most exclusive Shilajit in the world and helps in achieving a balanced lifestyle. Pure Shilajit resin helps in boosting stamina and develop a healthy body and mind.	1450.00	0	2020-12-10 00:00:00	\N	673	9
757	Pickle - Chicken	Double Horse Pickle - Chicken 400 g	265.00	50	2020-05-03 00:00:00	\N	1820	40
758	Taft Ultimate Hair Lacquer Ultimately Strong 6	Taft hairspray Ultimate-6 offers the highest Taft fixation thanks to two combined polymers and also gives the hair a beautiful shine. This spray is great for all hair types and helps you get your desired hairstyle in a go. The strong hold feature of this hair styling lacquer will hold your desired hairstyle strong so that your hair does not need a touch-up or styling for every minute.	395.00	44	2019-01-10 00:00:00	\N	369	24
768	Beetroot - Julienne	These edible ruby red roots are smooth and bulbous. Beetroots have the highest sugar content than any other vegetable. We deliver them fresh and uniformly sliced into thin long strips called the Julienne cut. Enjoy an effortless cooking that is less messy and much quicker because we value your time!	26.00	76	2021-05-04 00:00:00	\N	2027	15
852	Green Tea - Jasmine	This light, refreshing tea with a sweet fragrance of jasmine is a fragile favourite. The mesmerisingly tasty and breezy Green Tea Jasmine that is ideal for your calming moments. Take a sip and let the floral flavor serenade your taste buds with its cleanness. Enjoy served with no milk.	166.00	99	2021-01-07 00:00:00	\N	328	13
771	Graphene Anion Day Use, L	COLLEEN INDIA'S 1st Graphene Anion Strip Sanitary Pad has Breathable layers that help to reduce menstrual cramps. It has a high absorbency and contains no toxins, perfumes, bleach. It leaves zero rashes and Itching. The enhanced embedded Graphene anion-chip negative ion and far-infrared ray function, within the sanitary napkins, inhibits the reproduction of anaerobic bacteria, micro-circulation, increases the growth of bio-enzyme, regulates acidic secretions in the vagina and improve women`s self-protection and disease prevention ability.\nThe surface of “Graphene Anion” sanitary napkin can absorb trice as much as the amount of fluid traditional sanitary napkin can. Sufficient hydrogel could hold the penetrated water in, instead of letting them side leak or backflow 360-degree wrapping with Edge-Lock leak-proof technology.	120.00	65	2022-04-02 00:00:00	\N	2196	8
759	Vinegar - Apple Cider Vinegar + Garcinia	UNFILTERED & Unpasteurized: Our Apple Cider Vinegar + Garcinia is unfiltered and unpasteurized infused with pure Garcinia and contains the purest form of vinegar called The Mother. To check the purity, hold the bottle against the light and you will see the liquid is hazy and contains fine strands of 'the mother' floating in the liquid.\nAPPLE CIDER VINEGAR FOR WEIGHT LOSS: This variant of our Apple Cider Vinegar with Mother is infused with Garcinia to help achieve your weight loss goals. All our Apple Cider Vinegars are made from real Himalayan Apples (not concentrates) that are sourced with great efforts so that only the purest forms reach you.\nAPPLE CIDER WITH GARCINIA: This product helps boost your metabolism and strengthens the digestive system. The infusion of Garcinia helps in weight loss and provides overall nutrition to your body. It helps lowering cholesterol levels and helps to keep your heart healthy.\nFIGHT MID-MEAL CRAVINGS: Garcinia helps control untimely cravings and stops hunger pangs. It helps suppress appetite and gives you the feeling of fullness that helps you avoid binging. It blocks fat production and converts excess sugar into energy so that you stay active throughout the day.\nDAILY DOSE OF 10ML: Since our Apple Cider Vinegars are pure and unpasteurised, they have a strong aroma and taste. We would recommend you to mix 10ml of our Apple Cider Vinegar+Garcinia with a glass of water and consume it on an empty stomach in the morning.	497.17	2	2021-11-12 00:00:00	\N	634	10
760	Baby Powder	Johnson's baby powder absorbs excess moisture and keeps baby's skin comfortable and dry.\nJohnson's baby powder is dermatologist tested and hypoallergenic.\nU.S. Pharmacopoeia grade talc to ensure it meets the highest quality and purity.\nHighest IFRA fragrance standard.\nNo Parabens, No Sulfates, No Dye.\nRecommended by doctors.\nJohnson's baby powder formula awakens and stimulates your baby's senses making your baby feel fresh and play happily with everyone.	235.00	69	2020-12-10 00:00:00	\N	898	18
761	Aloe 90% Soothing Gel	This soothing gel from Its Skin is formulated with 90% of fresh aloe, green tea, watermelon, and mango peel extracts. Aloe vera leaf extract with excellent hydration and soothing properties helps to soothe skin and also keeps the skin smooth and supple. This nongreasy moisturizer doesn't feel sticky on the skin and gives instant skin freshness	400.00	58	2021-02-01 00:00:00	\N	127	6
762	Assam Tea	Tea Profile: TE-A-ME brings the season's fine Assam Tea, that extrudes the amber to orange liquor, which is strong and has exotic flavour profile from one of the region’s fine estates. This tea is known for its tart, malty flavor, vigorous body and bright color. Assam tea is the perfect tea to keep you warm on a rainy day or in a winter month. The variety is known to maintain your body warmth by slightly increasing your natural metabolism. With its higher caffeine content, Assam tea may help you to remain focused for an extended period of time and keep your mind alert and active. No added aromas, No added flavors, No artificial essences, Just pure tea! Our teas are 100% Natural, crafted by leading experts.\nFresher the tea is, Healthier it is. TE-A-ME tea bags are heat-sealed, processed and packaged at our own Factory. This process locks in the freshness.\nAll our tea bags are Staple Free - no more dangers of the metallic pins that may not only alter the health benefits of the tea but may also prove to be harmful.\nWe use the choicest of leaves from among the premium Tea Estates. We are passionate about every little detail of tea processing, right from tea Gardens to your Tea Cups. TE-A-ME Teas brings you a range of natural Black Teas to choose from- Assam Tea, Darjeeling, Earl Grey, English Breakfast- to suit your mood, your taste and your palette. Energize your day with this full-bodied cup of Assam tea, crafted by experts using fine handpicked black tea leaves from the lush valleys of Assam. The leaves are picked from Camellia sinensis plant. The name “Assam” tea comes from the geographical area in India from where it originated. TE-A-ME brings alive a wide spectrum of feelings, through a fascinating range of Iced Brews, Black Teas, Green Teas, Fruit and Flower Infusions. Our Teas are 100% natural, made with nature’s pure ingredients. Crafted by leading tea experts, who blend tea leaves handpicked from among the premium tea estates with select natural ingredients - we bring you the TE-A-ME range. We are part of the Madhu Jayanti family - a 75-year-old company with a legacy of producing fine teas that are consumed over 10 million times every day across 42 countries.	80.00	14	2019-10-08 00:00:00	\N	995	4
763	In-Shower Hair Removal Cream For Men & Women - Normal Skin	Veet Hair Removal In-shower cream with Silky Fresh technology helps you experience silk smooth skin with a delightful scent while removing hair effectively. It not only hydrates your skin for up to 24 hours but is also clinically proven to provide up to 7 days of smoothness. Veet In Shower has been designed to fit in with your busy routine: with a unique combination of water-resisting ingredients, it works while you shower so you can get on with your day. Our Normal Skin formula enriched with Lotus flower extract, known for its softening properties, gives you nourished the skin - and hair regrowth feels softer, too. Takes from 3 - 6 minutes.	450.00	14	2020-01-04 00:00:00	\N	1055	38
764	Chicken Nuggets	Sumeru brings you tasty chicken nuggets, made with chicken mince, which is well-seasoned and beaded to give you a snack that you can enjoy anytime with your family, friends, or just with yourself.	269.00	8	2021-09-06 00:00:00	\N	2049	6
765	Organic - Pumpkin Seeds/Kumbalakayi Bija	These pumpkin seeds are abundant in protein, essential minerals and antioxidants. They are spiced and seasoned to make for a healthy yet tasty mid-meal snack. They are a rich source of minerals like manganese, phosphorus, magnesium, copper, zinc and iron and contain Vitamin E, which help prevent cardiac arrests and strokes and build immunity. They are rich in Omega-3 fatty acids, protein and antioxidants which makes them great for heart and liver health. Great and practical to carry on-the-go.\nBB Royal is a premium brand of organic staples by Big Basket. The entire range of products is sourced from the best of farms and products to ensure high-quality standards. All BB Royal products are cleaned and packed in hygienic facilities in high-quality food-grade packaging. There is a no questions asked return policy on all BB Royal products in a bid to provide you nothing but the best!	375.00	19	2020-06-06 00:00:00	\N	2281	27
766	Atlantic Salmon - Smoked  Presliced	Smoked & Pre sliced Salmon	1180.00	51	2019-05-09 00:00:00	\N	518	34
767	Evening Primrose Oil - Vegetarian Capsule (500 mg)	This Product contains Evening Primrose Oil that is known to help relive premenstrual tension, Skin allergies and dryness, nourish Scalp, hair and also reduce joint inflammation and Stiffness.  For Beauty tips, tricks & more visit https://bigbasket.blog/	295.00	24	2019-11-12 00:00:00	\N	1383	2
773	Organic - White Pepper	White pepper consists of only the inner seed with the pericarp removed by soaking and rubbing or by decorticating when dry. Its outer shrunken skin is rubbed off, exposing the dried, grayish-white pepper inside. Due to the anti-oxidant properties of pepper, it would promote the circulation of blood and oxygen in the skin making it more energized and fresh looking. It offers a tangy and spicy flavour when added to the preparations. White pepper is sharp in its taste and also has a pungent aroma.	70.00	95	2021-04-10 00:00:00	\N	2281	4
774	Diet Chivda	Garden Diet Chivda contains healthy ingredients and is well-known for its high purity, rich aroma, crispness and yummy taste. The delicious taste and low cholesterol content makes this chivda wonderful for evening coffee or tea.	50.00	63	2021-02-09 00:00:00	\N	710	30
775	Chilli Garlic Aioli Dip	Chilli Garlic Dip is one that excites everyone. Its has chunks of green chillies, garlic and a surprise of Mustard. All That Dips Aioli are creamy, rich and full of flavours. You can use as a dip, spread or as an ingredient in your cooking adventure.	160.00	75	2020-05-04 00:00:00	\N	515	13
776	Jasmine Heart Bath Personal Care Gift Set	Gift yourself or your loved ones Soulflower Jasmine Heart Bath set. Soulflower bath & body products provide you with your very own spa at home. The products range in our gift set are formulated by combining precious essential oils with the blend of natural and organic ingredients. The idea behind the whole creation is to provide you and your dear ones the natural and vegan skincare products which are healthy, regenerating and maintain body and skin balance.This aroma gift set was specially designed for those who love the richness of jasmine aroma and want to fully immerse in its exotic experience or want to gift their loved ones a mind alluring bath set. Each gift sets come in an attractive, colourful and handcrafted heart-shaped gift box to give to someone special containing Jasmine Aroma Massage Oil, Bhringraj Natural Oil, Jasmine Night Soap, Jasmine Aroma Potpourri, Jasmine Festive Big T-Light Aroma candles, Neck Roller and a Loofah.	1600.00	41	2020-09-02 00:00:00	\N	221	23
777	Loofah/Sponge Scrubber/Body - Pink, BH-064D PNK	Remove all the dirt and exfoliate your skin as you use this pink loofah scrubber. It is composed using a microfiber cloth, which helps in forming great lather and cleanses the skin making it look smooth and gleaming. This loofah/scrubber is fashioned in a hand glove shape for convenient use.	139.00	71	2020-10-02 00:00:00	\N	1331	16
778	Safe Sun Kids Sun Block Cream - SPF 25	Spare your children from the searing sun by applying them Lotus Herbals Safe Sun Kids Sun Block Cream with SPF-25. It contains concentrates of chamomile blossoms for mitigating and supporting a youngsters skin. Gives complete UVA and UVB assurance for tan and sun blaze counteractive action. Tried for utilization by pediatricians and dermatologists. It consists of Chamomile Extract which has anti-provocative & alleviating properties which is useful for touchy skins. It provides complete UVA and UVB protection for tan and sunburn prevention. It is specially formulated for young and delicate skin that soothes and nourishes a childs skin. Protect the skin of your child from solar radiations using Lotus Herbals Safe Sun Kids Sun Block Cream with SPF 25.	232.00	92	2020-02-05 00:00:00	\N	454	23
779	Pasta & Pizza Sauce - No Onion & No Garlic	Experience the full flavour of pasta-pizza sauce without any onion or garlic. It is made from 38% fresh tomatoes and herbs. Use it as a dressing or a dip sauce.	89.00	98	2019-02-12 00:00:00	\N	48	28
780	Soap Case - Glory	OurÂ Soap DishÂ is made of plastic infused with Microban which inhibits the growth of odor- and stain-causing bacteria  For Beauty tips, tricks & more visitÂ https://bigbasket.blog/	85.00	90	2019-01-01 00:00:00	\N	1813	29
781	Peanut Butter - Chunky		299.00	32	2019-01-06 00:00:00	\N	558	13
782	Skin Gel - Under Eye	Richfeel Under Eye Gel helps reduce fine lines. A soothing, revitalizing gel to counteract the effects of stress on the eyes. It is enriched with aromatic extracts of peach and plant extracts of badiaga.	189.00	78	2021-02-11 00:00:00	\N	1380	22
783	Honey Comb Touch Non-Stick Flat Tawa - 260 mm, Black	Nirlon Non-Stick Cookware with honeycomb structure is a premium product offering in the Flat Tawa category. This Flat Tawa is 5 layer cookware with Inner Surface Centre; Virgin Aluminum, Outer Compatible Aluminum. Its unique honeycomb design makes it metal spoon friendly and ensures prolonged non-stick performance compare to other non-stick cookware. It is more efficient than any aluminium cookware in terms of even-heat distribution, little or no hot spots and comes with 260 mm base thickness.	429.00	98	2019-11-09 00:00:00	\N	1794	2
784	Face Mask - Pro Tech 95, 6 layered, Medium, MK18003	T-base mask 6 layered reusable cotton fabric mask, Nose wire across the top of the mask allows it to be contoured over the nose for a better fit and protection against germ spread, soft elastic earloops for extra comfort. Available in an assortment of exclusively print and colours, extremely breathable fabric, washable and reusable.	249.00	70	2018-03-09 00:00:00	\N	1916	36
785	Hand Soap - Lavender & Chamomile	Calm Restore Refresh Made in Malaysia. Content - 500ml. pH - 5.5. Designed to gently cleanse and leave skin feeling refreshed. Delicately scented with a refreshingly Lavender & Chamomile.  For Beauty tips, tricks & more visitÂ https://bigbasket.blog/	225.00	34	2018-03-03 00:00:00	\N	232	2
795	Chemba Puttu Podi	Red Rice or chemba Podi is a vegetarian promise and it will be a perfect treat to your taste buds. It contains iron, vitamin E, protein, antioxidants, and other essential nutrients. This steamed food has a rich taste and flavour. Relish the soft and tasty Red Rice for your breakfast.	145.00	54	2020-05-10 00:00:00	\N	1820	26
796	Ratnagiri Alphonso	The new B Natural Transparent Range presents the most authentic indulgence of Mango. The Alphonso Mango is sourced from Ratnagiri to provide the best mango experience and the goodness of B Natural's new range of bottled beverages. And what's more? This beverage is made from 100% Indian fruits and not from concentrate.	114.00	15	2018-10-03 00:00:00	\N	896	31
797	Water Wiper - Nano	The Milton Spotzero Steel handle wiper is safe on all surfaces. The base of the product is made from rubber, which makes it easier to push water along the floor. The handle has a loop for hanging. This product is made from high-grade material which ensures long lasting life.	149.00	81	2020-05-04 00:00:00	\N	1311	30
811	Storewell Airtight Plastic Container - Transparent, With Purple Lid	These plastic airtight storewell containers are ideal for household kitchen use. Our kitchen storewell containers are made of high-quality food-grade plastic and they are easy to store in modular kitchen. They are available in size of 1750ml each.	339.00	30	2019-04-05 00:00:00	\N	2127	29
934	Hangable Dress Shaped Hand/Basin Towel - Cream, Bh-038 Crm	Add more fun, creativity and new experiences in your daily routine. It is made from cloth fibre and is shaped to look like a dress. The soft fabric is used keeping the softness of your skin in consideration. The unique feature of the towel includes inserting your hand inside the towel at once and drying/wiping it in no time. Its soft fabric will make you feel like you are wearing a glove and will get warmth in you.	209.00	61	2020-03-10 00:00:00	\N	1331	34
786	Durum Wheat Pasta- Penne Rigate 500 g Carton + Pasta Sauce- Arrabbiata 400 g Jar	Barilla Penne Rigate is one of the most versatile pasta, known for its adaptability with recipes and occasions, from a traditional family lunch or official grown dinner. Try Penne Rigate with easy tomato sauce, vegetables, with or without meat and enjoy an authentic Italian meal.Feature: It is made with 100% durum wheat semolina, GMO free. It has no maida. Nutrients: Excellent source of energy, naturally low in fat with a low glycemic index that keeps you fuller for longer. Trusted: Made in Italy with over 140 years of craftsmanship, making high quality pasta that cooks perfectly every time. Barilla arrabbiata combines carefully selected fresh tomatoes, garlic, and parsley with a tantalizing touch of crushed green chili peppers to create authentic Italian meals with a memorable kick. Simply combine with your favourite pasta for a delicious meal.FEATURE: Made from the highest quality vine-ripened Italian tomatoes and real chilies. It is suitable for vegetarian, vegan and gluten-free users.NUTRIENTS: Prepared like home-made Italian recipe, contains all-natural ingredients, no added preservatives.TRUSTED: Made in Italy, with over 140 years of craftsmanship, making high-quality pasta.	598.00	13	2018-04-04 00:00:00	\N	1066	36
787	Oil - Gingelly	Idhayam Gingelly Oil guarantees you the best health by pushing your Blood Pressure down, lowering your Cholesterol and maintains your skin healthy. It's soft for heart that adds zest to the cuisine. Sesame oil offers good oral health too. Furthermore it shows its major significance in stuffs like marinades, sauces, vinaigrettes and dressings that suggests you good flavor along with good health.	279.00	22	2019-10-12 00:00:00	\N	556	31
788	Ragi - Whole	For 1 Cup Serving : Calories - 286 g,Fat - 2.0 g	57.00	26	2018-02-02 00:00:00	\N	1061	31
789	Capsules - Shilajit Gold for Strength, Stamina & Power	Dabur Shilajit Gold, a 100% Ayurvedic formulation for effective strength & stamina.\n\nWith pure Shilajit for Power, and enriched with Gold for Stamina, Kesar for Strength, Ashwagandha for Energy, Safed Musli to Counter Weakness. Dabur Shilajit Gold is a unique combination of Shilajit, Gold, Kesar and other important herbs like Ashwagandha , Kaunch Beej and Safed Musali. Shilajit Gold is good for general health and helps increase strength, stamina and vigor.\n\nRecommended dosage (Adults) is One Capsule twice a day or as directed by Physician preferably with milk.\n\nBenefits of its ingredients : \n\nShilajit:\n\n• Brings about balanced and harmonious health.\n\n• It acts as a restorative tonic, helps in recovery of wear and tear of body tissues, helps to improve strength, stamina, vigour & power.\n\nGold:\n\n• Helps to increase strength, improves vigour and physical endurance\n\nSaffron:\n\n• Nutritious & has anti-fatigue property  For Beauty tips, tricks & more visitÃ‚ https://bigbasket.blog/	322.50	88	2019-12-12 00:00:00	\N	1186	34
790	100% Melamine 3D Soup Spoon - Blue	Iveos soup spoons are used to stir and drink the soups. It is made to consume soup or the soup made with particles of solid food, such as meat, vegetables, grains, and pasta. A soup spoon is a type of spoon with a large or rounded bowl, used for consuming soup. The term can either refer to the British soup spoon or the Chinese spoon. Round bowled soup spoons were a Victorian invention.	264.00	39	2018-07-09 00:00:00	\N	1706	31
791	Signature Gold Dark Vanilla & Oud Wood Perfume	The World’s # 1 Male Deodorant Axe, presents ‘Axe Signature Gold’ Ultra Premium Perfumes. A range of fine fragrances that are packaged in beautiful and stylish matte glass bottles. Designed by the world’s leading perfumers, each Axe Signature Gold fragrance is specially crafted with some of the world’s most exotic and refined ingredients to bring out what’s unique in you. A suave and warm, woody fragrance that will play with your senses. One moment it’s tart mandarin, the next warm oud, then the sweet scent of vanilla before diving into a dark and smoky cloud of tobacco. This unique blend of fragrance notes will mesmerise you. Make every special occasion extra special with Axe Signature Gold Dark Vanilla and Oud Wood Perfume. Spray it on your pulse points, the heat generated by your pulse intensifies the fragrance and amplifies its projection. Add that extra twist to your style. With this perfume, you’ll make an impression that lingers on. Catch attention and arouse curiosity in the moments that count. Rich, mesmerising fragrances in a slick and elegant glass bottle, the Axe Signature Gold range of ultra-premium perfumes is also a perfect gift for your loved ones.Features:, Fine fragrance in a beautifully crafted matte glass bottle., Premium long lasting fragrance crafted with unique exotic ingredients., Key Ingredients: Dark Vanilla & Royal Oud Wood., Suave & warm woody fragrance., Safe on skin.	360.00	2	2021-05-06 00:00:00	\N	1667	14
792	Super Moist Cake Mix - Yellow, Imported	Bowl to oven in minutes. Thank you for welcoming us into your home. We hope what’s inside this box helps you bring more love to your table. Cordially yours, Betty Crocker's super moist yellow cake mix is made with no preservatives and no artificial flavours. Just seven ingredients in the box. Bowl to oven in minutes. Makes one 13" x 9" pan. The red spoon is my promise of great taste, quality and convenience.\n1. Cake Mix an ideal treats sweet Dessert that enjoyment your taste buds.\n2. Cake Mix is a tasty, simple & quick solution for mothers to pamper their kids and family.\n3. A sweet companion to your evening tea.	445.00	26	2018-04-07 00:00:00	\N	1929	38
793	Organic Pure Sweetener Blend - 1:4 Sugar Replacement Powder, Unbleached	Sweetness in our superfood blend comes from organic green Stevia leaf powder (0 carbs & calories), blended with naturally nutrient-rich organic coconut sugar (GI=35, much lower than jaggery/dates). Our special blend gives you the satisfaction and satiety of eating sugar without empty carbs and addiction. Using selective ‘no nasty’ organic, ultra-low GI, nutrient-dense, slow-releasing ingredients, this superfood leaves you feeling satisfied! Plant-Based Healthy Sweetener Blend 1:4.	499.00	51	2020-05-09 00:00:00	\N	38	24
794	100% Whey Protein, Rich Chocolate	IN2 Whey Protein is an Ultra-Premium Muscle Building Protein Powder. This protein powder features multiple quality whey proteins resulting in a nutritious and multi-functional protein supplement that enables a superior bioavailable protein source for athletes. Whey is considered to be the best source of protein due to its high Biological Value (BV), Amino acid profile and fast absorption to give your body what it needs to build muscle and recover. IN2 Whey Protein uses a superior cold microfiltration process to guarantee a higher quality Whey Protein.	2000.00	30	2021-08-05 00:00:00	\N	2228	30
798	Tomato Salsa Dip - Enjoy With Nacho Chips	Traditional Mexican Style– A family gathering, having friends over or just to relax at home – dips and chips are the go-to snacks for any occasion. Made with flash-grilled tomatoes and onions, our Tomato Salsa is a traditional Mexican style dip, oozing with authentic taste.	157.50	80	2020-06-11 00:00:00	\N	2197	12
825	Glass Water Bottle With Round Base - Yellow, B1367	A stylish solution for all your homebrews is this elegantly designed bottle. The bottle is designed using high-quality glass, which proves to be solid and offers great finishing. It features a seal cap with a long-neck design for an easier grip. You can store water, juices, brews and more. Keep your drinks fresh and preserve them for a long time.	209.00	33	2022-04-08 00:00:00	\N	1331	28
799	Canadian Grade A Maple Syrup	A healthy way to satisfy your sweet tooth - Maple syrup makes for an excellent accompaniment for food. With its amber colour, its warm notes of caramel and vanilla, and its unique flavour, Maple Joe Maple Syrup should be used as an add-on to your delicious pancakes, wafers, oatmeal, and more. It offers a rich favour without the disadvantages of plain old sugar and is one reason why it is so popular and is growing to be a preferred natural sweetener. Great Source of Nutrients:-All things sweet need not necessarily be unhealthy. Maple Joe, additives free Maple syrup, contains four nutritious minerals, namely, calcium, potassium, magnesium, and manganese. These minerals work in tandem that benefits your body in many ways, starting from strengthening your bones, to regulating your blood sugar. Maple Joe's delicious caramelised flavour also makes it a super healthy alternative to sugar!	481.50	89	2021-02-09 00:00:00	\N	1149	25
800	Harippa Roasted Seeds - Pumpkin, Cheesy Onion	Inspired by natural foods consumed by our forefathers, True Elements provides a select range of Snacks and Supplements, that stand for what our forefathers believed in, but packed and modified for the current generation!\n\n\n\n\n\nHarippa is the fusion of Harappa and Hadippa, symbolising one of the oldest civilizations on this planet, and a true emotion of "Fun". This is exactly what we have attempted in this new range of snacks - bringing together ingredients from the oldest civilization, but seasoned with modern taste - the perfect fusion of Ancient Bites and Modern Taste. \n\n\n\n\n\nThis pack of Harippa Roasted Pumpkin Seeds laced with Mesopotamian-inspired seasonings of rich cheese and fresh onion. Taste once and get hooked forever.\n\n\nFeatures:\n\n\n\n\n\n100% natural product.\n\n\nNo added preservatives, artificial flavors or colorings.\n\n\nLow-calorie, robust snack.\n\n\nExcellent source of protein.\n\n\nContains heart-healthy fats and Vitamin E.\n\n\nProvides plant based omega 3 fatty acids.	120.00	72	2020-06-10 00:00:00	\N	911	39
801	Premium - 3 Follow-Up Formula	Dexolac Premium Stage 3 Follow Up Formula is a powdered milk substitute for babies after 12 months up to 24 months of age. It is specially designed for the baby’s overall growth & brain development. Dexolac Premium contains Neuronutrients like Omega 3 & 6 Fatty acids (precursors of DHA & ARA), Taurine, Choline, Iron & Iodine to help in overall brain development. Contains nutrients like Nucleotides, Selenium, Zinc, and Vitamins A, C, E that support immune function. Improves digestive health with easy to digest Whey proteins, Lactose, and Nucleotides to support the growth of useful bacteria. Formulated with Calcium, Phosphorus, Magnesium, and Vitamin D to help strengthen bones. Dexolac Premium contains optimal levels of Neuronutrients to facilitate the normal brain development of a baby.\nUnboiled water, unsterilized bowl and spoon or incorrect dilution may endanger the infant’s health. Prepare only one feed at a time. Use prepared feed immediately (within half an hour), otherwise, microbial deterioration may set in. Discard unused feed. Infant milk substitute should be used only on the advice of a health worker as to the need for its use and the proper method of its use. Careful and hygienic preparation of infant milk substitute is most essential for health. Do not use more scoops than directed, since concentrated feed will not provide the water needed by your infant. Do not use fewer scoops than directed, since diluted feeds will not provide adequate nutrients needed by your infants.	595.00	45	2018-05-02 00:00:00	\N	451	23
802	Hand Wash - Green Apple	This sweet, ultra-lathering hand wash with a scent of fresh green apples is delightful and uplifts your senses.For Beauty tips, tricks & more visit https://bigbasket.blog/	198.00	50	2019-08-12 00:00:00	\N	2177	36
803	Energy Bar Hazelnut Magic 6 pcs + Energy Bar Oat & Apricot 6 pcs	Dates, hazelnuts, oats and with the power of ashwagandha, it cannot get any better! Whether you need a pre-exercise boost or looking to balance your sugar levels, dates and honey will provide you with a nutritionally balanced blast of sustained energy. Use it as a mid-meal snack or when you crave for a sweet! Hazelnuts are high in healthy polyunsaturated and monounsaturated fats. Ashwagandha will keep you fighting fit!Looking for fibre? Looking for something healthy to keep yourself full for a longer time.This baked bar with oats, walnuts, cranberry, honey and apricot is just the thing you need when hungry. Mild in its sweetness, this bar derives its slightly sour taste from apricots. Oats contain high levels of soluble fibre giving the extended sensation of fullness. Also, the only cereal containing legume like protein, its protein content is equivalent to the soy protein.	600.00	11	2019-06-06 00:00:00	\N	2220	15
804	Stevia Tablets Dispenser	So Sweet Stevia Tablets are made of 100% natural Zero calorie sweetener and in the best and healthiest alternative to sugar and artificial sweeteners in daily life (Zindagi). No calories, no carbohydrates, and no artificial ingredients. The non-glycaemic response, no bitterness, no aftertaste. Verified NON-GMO Product. Zero glycaemic Index, safe for diabetics. Smooth taste, Sweet taste, Kosher Certified extract used. 100% natural extraction process of sweetener. Extraction is done, using only water.	120.00	59	2019-07-01 00:00:00	\N	27	38
805	Steel Spoon set - Ice cream, Monde	Anjali spoons simple yet elegant design adds class to the dining area and are a must for every home. They are made using stainless steel that enhance the durability of the utensils, and helps them retain their shine even after multiple wash cycles.	115.00	44	2021-06-04 00:00:00	\N	1143	26
806	My Dream For Him - Perfumed Deodorant Natural Spray	About My Dream For Him: Tomorrow is a blank slate. So bring those fresh ideas. Move out of the box. Ditch the common route. Go where your heart takes you. The woody, marine fragrance of My Dream, infused with energizing mandarin and grapefruit, is your carefree spirit and sense of adventure, bottled for eternity.A deep ever-lasting freshness.  Fragrance Family: Woody - Marine The Note Story- The Top Notes has Grapefruit and Mandarin, which gives the most impact and initial spark. The Heart Notes belongs to the character to the fragrances. The Base Notes contains Mossy and Amber, which provides long-lasting freshness.	295.00	70	2019-08-07 00:00:00	\N	1158	22
807	Imli Khajoor Chutney	Imli Khajoor Chutney is a classic Indian chutney made with dates that lend sweetness to the chutney and tamarind that makes it tangy. This khatta-meetha Date and Tamarind Chutney Recipe is a must when making chaat. Keep in a cool & dry place. 100% vegetarian.	90.00	53	2019-11-02 00:00:00	\N	2180	16
808	Water & Juice Glass - Long	Krosno glasses have been crafted by the finest artists and designs. These glasses combine unique design, exquisite workmanship and latest technological advancements, and are perfect to add to the sophistication and beauty of your home and bars. All of Krosno products are recognised at home and abroad for its quality, beauty, sophistication and crystal clarity.	1099.00	73	2019-12-02 00:00:00	\N	56	21
809	Dry Dates/Kharjura/Chuara	Brown dates are loaded with compound carbohydrates and natural sugars like sucrose, glucose and fructose which makes it a great source of instant and long-lasting energy.	699.00	16	2018-07-11 00:00:00	\N	1402	24
810	Express Shine Sponge - Black	Gives an instant shine to leather Extremely easy to handle and apply A unique polish indicator which shows the amount of polish left helps efficient and optimum use of the product.	72.00	60	2022-05-11 00:00:00	\N	1125	17
812	Olive Oil - Pomace	Olive-Pomace oil is made from the residue left after producing virgin olive oil. Olive Pomace Oil is the main cooking grade oil. It is a light oil with neutral taste and flavor and is the most suitable oil for Indian cuisine. Olive pomace oil is obtained by treating the olive residue paste (after the fruit has been pressed) with solvents to extract the oil and then blending this product with extra virgin oil in order to enhance the product and its health benefits. Olive pomace oil is the least expensive olive oil. Why Olive Oil :- Olive oil is the world´s healthiest cooking oil with the highest levels of MUFA 82% (good fat) and one of the lowest levels of saturated fat 10% (bad fat). MUFA in olive oil lowers cardiac risk, \nand also reduces the risk of diabetes.Fried is in Oily is out.	499.00	56	2022-03-12 00:00:00	\N	71	35
813	Chai/100% Melamine Water/Juice Tumbler - Red	This tumbler set is 100% food grade. Made from melamine, it is hygienic and odourless. It has a glazed finish. These glasses can be used for multiple purposes. It looks elegant and stylish at the same time.	149.00	40	2021-10-04 00:00:00	\N	1706	12
814	100% Green Tea	Energise & jumpstart your metabolism with green tea.\nScores of studies have indicated that green tea leaves can promote a healthy metabolism. This is vital to keep your energy levels up and cope with the stress of a typical workday. Our uplifting, 100% pure green tea supplies an abundance of anti-oxidants. These in turn, eliminate damaging free radicals in the body and help essential metabolic pathways perform optimally. Energise is an excellent tonic for a tired body and mind. Tea is crafted from tender green tea leaves with nothing else added. Hit refresh with a piping hot cup of Tea or enjoy it in a tall glass with ice and a twist of lime.	141.55	20	2020-06-09 00:00:00	\N	1732	16
815	Papad - Special Punjabi Masala	Urad Dal Flour, Salt, Water, Hings, Calcium Bi-Carbonate (Papad Khar), Edible Oil, Black Pepper etc.	90.00	72	2018-11-04 00:00:00	\N	2043	27
816	Anti Viral & Anti Pollution N95 Face Mask - Tesu, Large, Assorted	Airific Anti-Viral & Anti-Pollution Masks are advanced technology masks that keep out >95% of particulate matter, contaminants and >99% of bacteria. It is suitable for all and is available in various sizes. It's also a fashionable mask. Premium, reusable anti-viral and particle filtering mask Viral Filtration Efficiency(VFE) – > 99% Certified N95 and FFP2 respirator Comfortable with extremely low breathing resistance Leading-edge nanotechnology filter. Uses: It protects from harmful dust, pollution and bacteria to enter the body.Disclaimer - We have suspended returns on Face Mask products for the safety of our customers and delivery agents. We will update the policy once the situation has resolved. Thank you for your support and understanding.	1195.00	72	2019-03-11 00:00:00	\N	1194	6
817	Cookies - Cashew	Baked with Real Butter, Contains added artificial flavour ( Vanllin) Contains Gluten, Milk, Soy and Nut Store in a cool, dry place and away from direct sunlight. Once opened, store in an air tight container Please dispose of this package thoughtfully	36.00	85	2018-11-09 00:00:00	\N	1951	23
818	Plastic Bucket With Handle - Off Ivory, New Nova, 15400	These buckets come in a varied range and are strong yet lightweight. These buckets can be used for indoor needs like bathroom bucket, home cleaning bucket, water storage as well as outdoor purposes like gardening, cleaning etc. It comes with a range of capacities and colour options.	307.00	33	2020-02-10 00:00:00	\N	1966	22
819	Millet Idly & Dosa Batter	This batter makes fluffy idlis, crisp dosas, soft uthappams and crispy paniyaram equally well. There is no difference in colour, taste and texture of millet batter compared to regular batter. They are gluten-free, rich in fibre, magnesium, proteins, minerals and hence can be helpful in maintaining weight, blood pressure, controls diabetics and also promotes heart health. Strictly we do not use any undesirable ingredients like stabilizers, preservatives and soda.	100.00	50	2022-07-01 00:00:00	\N	275	38
820	Plastic Clip Mop - 350	Gebi presents their innovative range of household cleaning products that are made with premium quality material that ensures durability and strength making them last for a longer time. They can be used for all cleaning purposes and on all surfaces such as, bathrooms, kitchens, sofa, living room, etc. making them convenient and handy for your daily household cleaning.	249.00	44	2020-12-01 00:00:00	\N	2055	7
821	Prawns, Peeled & Deveined	Product weighed before cleaning and cutting. White Prawns are extraordinary for tender texture, their size and their mild aroma. They are great for Louisiana BBQ shrimp, shrimp boils and other preparations where they can infuse in the flavors of the dish and their feel really stands out. A 100 g serving of white tiger prawns has only 148 mg of sodium, 152 mg of cholesterol and 1.5 grams of fat, 20 grams of protein and 106 calories.	405.00	42	2019-08-03 00:00:00	\N	2027	15
879	Pasta - Orecchiette	Di Martino pasta is made using 100% Italian grain, durum wheat flour from Gragnano, Italy and has been awarded the prestigious IGP status, the Indicazione Geografica Protetta - protected geographical indication guaranteeing the quality and provenance of traditionally-made regional products. A cut that originated in Puglia. As the name suggests, the shape resembles that of small ears.	325.00	74	2019-03-02 00:00:00	\N	2034	30
822	Serum Vegital Perfecting Toning Lotion - For All Skin Types	This targets every type of wrinkle thanks to the powerful anti-wrinkle action of the ice plant. This fresh, invigorating Perfecting Toning Lotion is essential to perfect cleansing and makeup removal. It offers gentle exfoliating action that revives tone and radiance and refines the texture of the skin for an instant new-skin effect. It softy removes makeup and hydrates skin. This product is inspired from plants. It is paraben free, and colourant free. It is tested under dermatological supervision.	697.00	30	2020-09-09 00:00:00	\N	682	34
823	Spring Roll Sheets - 6"x6"	Switz is the only focused manufacturer of authentic, wheat batter-based, all-purpose spring roll pastry in India. Switz Spring Roll Sheets have high elasticity and strength. Big or small, fried or baked (at 180-degree Celsius or till its golden brown), sweet or savoury, what you will make at home will always be crispy. Just let your imagination go wild on the fillings, and make food magic.Switz Spring Roll Sheets Filling Suggestions: Chicken, mix veg, macaroni and cheese, noodle spring roll, baby corn lollipop Other recipes: Banana fritters, chocolate cigars, money bags, fried wontons, fish roll, tarts, cheese-filled bites. It is suitable for both fresh and frozen preparation.	100.00	25	2022-01-02 00:00:00	\N	449	15
824	Fiesta Serving Bowl With Serving Spoon - Assorted Colour	This serving bowls and spoons are made of high-quality food-grade BPA free virgin plastic that is strong and durable. These serving bowls are suitable for dining table, serving dishes to the guest, family dinner, party, etc.This double moulded designer serving bowl sets gives a very elegant look to your dining table and will leave a very good impression on your guests. Package contains one 800 ml bowl, one 1600 ml bowl, one 2200 ml bowl, 3 lids and 2 serving spoons. This can be safely used in fridge, freezer, dishwasher and microwave for reheating. Comes in a beautiful box pack, this is ideal for gifting to your friends and relatives for housewarming ceremonies.	349.00	99	2019-03-02 00:00:00	\N	435	38
826	Small Jars Set With Printed Lids	Yera is the pioneer in India’s glass Industry since 1958 and traditionally known for making high quality glassware products at the best prices. We are a 100% Made in India Brand. Yera is a trusted name that has reached almost every household of India. These classy jars from Yera available in 3 different sizes are sure to change the way your Kitchen looks. These BPA-free, Non-Toxic jars ensure the safety of you and your family and make food consumption a safer experience.These jars available in different sizes gives you the option of storing a dynamic range of food items like snacks, jars, pickles, etc, and are extremely easy to wash and clean.The sturdy tin lids are unbreakable and don’t let your food go stale and ensures zero leakage or spillage.	109.00	3	2018-10-12 00:00:00	\N	86	6
827	Tasty Masala Coated Peanuts	Tasties Namkeens are a range of traditional Indian Savouries that are, authentic, crisy and deliciously mouth watering. Made by skilled and experienced manufacturers in hygienic state-of-the-art facilities, these flavoursome namkeens will take you back to a time of light-hearted fun, while munching on your favourite snack.	105.00	27	2021-12-10 00:00:00	\N	796	31
828	Masala - Paneer	Made of select varieties of Naturally Rich ingredients and with the formulation of Chef Sanjeev Kapoor, Tata Sampann masalas add mouthwatering taste to your food.	37.80	15	2020-03-12 00:00:00	\N	1312	27
829	Singhara Atta - Gluten Free	Graminway Singhara Atta is flour made from water chestnut seeds. It is widely used in fasting in the Northern part of India. It is gluten-free with a glycemic index of 60. Singhara Atte ki Poori and Halwa is consumed when fasting, especially during Navratra. Singhara has antioxidant property. Singhara atta is high in fibre. At Graminway, they believe that everyone deserves to live a full and healthy life. The intake of their food supplements will provide a good foundation for a healthy lifestyle. They are committed to providing the highest quality products at affordable price. They are a company with a purpose beyond profit and want to make a lasting difference in the world. Graminway aims to provide clean, natural, and healthy products without compromising on the flavours and taste. They produce them in small batches, which helps maintain freshness and preserve the ingredient texture. By not stockpiling, each product is as fresh as possible when it reaches your doorstep.	140.00	58	2020-07-05 00:00:00	\N	1833	26
830	Plastic Dustbin/Garbage Bin - Green With Black, Polka Dots, Bon Bon, 12081P-M-B	These pedal bins are beautiful that goes well with the indoor aesthetics. These are very durable and sturdy and are easy to use and easy to clean. The dustbin has a foot pedal mechanism that permits you to open the dustbin easily with one foot.	199.00	11	2019-12-05 00:00:00	\N	1966	38
831	Steel Storage/Lunch Container - No.14, Blue, Klip It	Joyo Klip It Stainless steel container comes with easy locking. These containers are made from high quality non-magnetic stainless steel body. Joyo Klip It container has odourless lid cover with food-grade silicone seal (gasket) in lid & has all 4 sides locks which ensure airtight containers for keeping food fresh, 100% leak-proof containers for keeping food from spilling, stackable design for easily storing the containers on top of each other and the pioneering clip mechanism. Take this container to the office, school, camping or hiking.	219.00	19	2021-01-11 00:00:00	\N	1093	5
867	Complete Detergent Washing Powder	Recommended by top washing machine brands, New Ariel Complete Detergent Washing Powder gives you tough stain removal in just 1 wash. Designed to work in semi-automatic washing machine, Ariel gives brilliant results in both semi-automatic washing machine as well as in hand wash. Ariel dissolves in water completely to remove tough stains like juice, chocolate, tomato and butter/ghee. Perfect for all your clothes, Ariel washing powder helps to give you impeccable cleaning and keeps your clothes smelling fresh. Step out into the world with confidence knowing that you have Ariel as your partner in laundry.	280.00	70	2021-11-11 00:00:00	\N	474	24
832	Pink/Rosa Beauty Bathing Bar	We think that skin cleansing should be an act of beauty for your skin that leaves it feeling soft and cared for. And Dove Pink Rosa Beauty Bar has a delicate blush of colour that adds a touch of feminine sophistication to your bathroom. It is combined with our ¼ moisturising cream to create a beauty bar that helps nourish your skin during cleansing. Dove Beauty Bars are specially formulated to deliver skin nourishment, helping your skin to keep its natural moisture during cleansing. Pink Rosa Beauty Bar contains our ultra-mild cleansers, which don’t strip skin of moisture as a regular soap bar can. It’s mild enough to be used on your face, body and hands – the perfect addition to your daily skin cleansing routine. Dove is the No.1 Brand recommended by dermatologists in India. For best results, lather up your Dove Beauty Bar and massage the smooth, creamy lather over your face and body before rinsing thoroughly. For soft, smooth hands, you can also enjoy regular hand-washing throughout the day with your Dove bar. Soap may dry out your hands, but the classic moisturising formula of Dove bars will leave skin softer, smoother and more glowing. Buy Now!	193.50	10	2019-06-10 00:00:00	\N	1925	33
833	Sesame Oil - Cold Pressed	Sesame Oil is high in nutritional value - a rich source of Omega6 and Vitamin E. Due to its hearty, nutty flavour and its high levels of mono- and polyunsaturated fats, sesame oil has become one of the most popular oils for cooking.	195.00	81	2021-02-02 00:00:00	\N	1453	19
834	Purifying Neem Facial Wipes	Himalaya's Purifying Neem Facial Wipes are soft and non-alcoholic with a gentle formulation that mildly cleanses the skin to keep it clean and healthy. Himalaya's Purifying Neem Facial Wipes are soft and non-alcoholic with a gentle formulation that mildly cleanses the skin to keep it clean and healthy. Enriched with the power of Neem and Turmeric that are known for antibacterial properties, the wipes freshen skin and also help conveniently remove make-up.	150.00	25	2019-05-02 00:00:00	\N	2097	36
835	Fruit Juice - Mango Delight	Enjoy the refreshing and delicious taste of mangoes!\n\nA special 6-layer protection gives you the goodness of tasty, ready to serve fruit beverage in every glass of Tropicana.\n\nDid You Know?\n\nMango, believed to have originated in the sub-Himalayan plains of the Indian subcontinent, is a member of the cashew family of flowering plants & one of the good source of potassium among fruits.	164.00	52	2021-05-04 00:00:00	\N	178	2
849	Sanitary Pads - XL Plus Wings, Ultra	It is about living your life by your own rules despite what society says. It is about choosing for yourself, every day of the month. This revolutionary product Whisper Ultra Clean XL+ has odour lock gel that locks up to 100% wetness and even odour and gives you the freedom to live life by your own rules, even during periods. Because its Meri life, mere rules.	156.75	65	2018-06-03 00:00:00	\N	16	8
850	Herbal Peptide + Hyaluronic 4% Firming Serum - Complete Age Control Concentrate	Complete Age Control Youthful. Polished. Redefined A silky, lightweight, non-oily resculpting formula, supercharged with peptides that lift the look of your skin giving a corset-like effect, and making your features appear tightened & defined. Enhance your facial aesthetics and say bye to sag. Soulflower brings you a bi-functional treatment that nourishes while imparting a firmer, plush look. The technologies present in this concentrated formula contain Peptides that are chains of amino acids inhibiting damage free radicals while helping to improve your skin’s elasticity. These groups firm the look of skin, reducing the signs of fine lines and wrinkles. • Visibly firms and tightens your skin for a lifted, radiant appearance • Recontours & Reinvigorates ageing skin with a boost of cushiony plumping • Smooths the look of fine lines • Renews your skin, diminishes the appearance of wrinkles • Replenishes and recharges overworked/tired skin • Skin becomes smooth, firm, luminous and silky This potent anti-ageing formula is enriched with Natural extracts and a peptide composition that works on the natural collagen of your skin to lift the look of facial contours and reduce the visible effects of ageing. We know you’re always looking out for products that will give you youthful beauty and aid in your pursuit to age gracefully. Even if your skincare routine has all the steps from cleansing to moisturizing, Firming Serum is something you should integrate into your rotation. Why do you ask us? Because you’re ageing every day so you should be anti-ageing every day! If you begin to notice fine lines, wrinkles & sagging skin in your thirties, know that these date to your early twenties. So, you need to begin skin firming as and when you can! You didn’t hear it from us, dermatologists and skincare experts back up the same idea and suggest "Everyone is doing their skin a disservice if they don't have a great serum." This serum is power-packed with Hyaluronic acid that imparts a ‘sponge effect’ babying your skin making it supple and graceful. It combines the quality of soy protein to hold in skin moisture, providing a smoothing balanced effect while minimising roughness & wrinkles. Jojoba oil and Tetrapeptide 3 together possess anti-inflammatory properties and also help with acne. Macadamia Oil, Argan Oil, and Avacado extracts are rich in vitamin E. These replenish your skin and keep it naturally moisturized so it looks plump from inside out. Quinoa Seed Extract provides for smooth & effortless exfoliation. Acetyl helps improve skin elasticity and works as your skin’s natural moisture barrier. It’s ‘Botox in a Box’ property makes it an excellent non-toxic alternative to chemical-laden creams and serums. It helps in relaxing the facial muscles and reduces the depth of wrinkles. The velvety nourishing texture blends into your skin without any sticky residue and can be applied under makeup. If ‘faster & lighter’ is what grabs your attention then add Soulflower Peptide Firming Serum to your list! It’s Lightweight, fast-absorbing and melts seamlessly into your skin leaving no grease or oil whatsoever. This special formulation binds the moisture deep into your skin that keeps it naturally moisturized. This restores rough, dry, uneven skin to reveal a smooth, polished and velvety one. Our Firming serum gives a creamy texture to your skin that will have everyone obsessing over! Protects from environmental stressors Supercharged peptides in this proprietary formula fight free radicals and damage caused by UV rays. These recharge overworked skin, fix chafed, sore, dull, itchy skin imparting a sponge effect holding in moisture.	1530.00	79	2020-06-01 00:00:00	\N	221	31
851	Agar Agar Vegetarian Gelatin	Agar agar, also known as just agar, is a mix of carbohydrates extracted from seaweed, specifically red sea algae. It is a helpful culinary ingredient and can be used to thicken soups, make jams & jellies, custards, ice creams & other desserts that need to gelatinize & set.	449.00	0	2021-11-03 00:00:00	\N	731	25
836	International Italian Mushroom Soup	Craving for some restaurant-like soup at home? Try Knorr’s range of authentic appetising, international soups that are easy to make, and delicious to taste. The Knorr Italian Mushroom soup contains handpicked mushrooms and high-the best quality spices. Its perfect blend of authentic appetising flavours gives it a rich aroma and a , delicious, taste, and restaurant-like consistency taste. Made with 100% real vegetables and with no added preservatives, the Knorr range of international soups are ready to savour in 3 simple steps, and can be served to 4 people. Now make your home the centre for parties and dinners with Knorr’s wide range of 11 ready-to-cook soups and 7 cup-a-soup variants. With Knorr as your cooking partner, you can serve your loved ones flavourful meals at home. Our love for carefully selected ingredients, flavours and spices, pushes us to make recipes that will be enjoyed by your family, friends, relatives and guests, and the people that matter to you the most. Fun fact about soup: Soup isn’t always served hot. In warmer climates like Spain, cold soup alternatives, like tomato-based gazpacho, are popular.	58.50	32	2020-11-05 00:00:00	\N	2157	26
837	Plates - Marine Fish, Medium	Add fun to your party with these fish plates. They can be used to put snacks, dry fruits, biscuits or anything else. The neat finish of the product gives it the elegance and beauty that you would want in your kitchen.	929.00	33	2020-08-11 00:00:00	\N	562	19
838	Pumpkin - Organically Grown	It is organically grown and handpicked from farm  Product image shown is for representation purpose only, the actually product may vary based on season, produce & availability.	28.00	91	2020-11-12 00:00:00	\N	2027	9
839	Baby Wipes - Gentle	Cleanses, Moisturizes and keeps the delicate baby skin soft. An effective combination of herbs that moisturizes and keeps your baby's delicate skin soft, Aloe Vera ensure moisture balance to keep your baby's skin soft and supple. Indian Lotus keeps the skin dry and smooth, Your baby needs gentle care and Protection.Himalaya Herbal Healthcare range of baby product are specially to ensure the health of your baby's delicate and sensitive skin. Clinically tested for mildness, these product maintain the fragile and complete well-being of your baby's skin.	44.00	11	2022-05-10 00:00:00	\N	2078	1
840	Face Scrub De Tan With Walnut Granules	Exfoliate your tanned skin back to its natural fairness and health with this De-tan face scrub. Stress, unhealthy lifestyle affect your facial skin health leading to pimples, whiteheads, blackheads, uneven colour tone, & dryness. The Ustraa Face Scrub helps repair your skin from all these and much. With bigger walnut granules, it works more efficiently on the face of the men as they have thicker skin. This product is completely paraben and sulphate free.	226.00	73	2022-01-03 00:00:00	\N	2251	32
841	Hazelnut Kernel	Puramate Hazelnut kernels impart crunchy texture and flavour and taste pleasant in nut and fruit\nmixes  They have rich indulgent flavour and delicately sweet on the inside which makes it perfect match\nfor sweet and chocolate recipes. Hazelnuts are perfect to use for bakery, biscuit, chocolate, ice\ncream, muesli, cakes, desserts, trail mixes, delicious desserts like halva, kheer, custard etc.	153.00	2	2020-08-09 00:00:00	\N	345	36
842	Mutton Delicate Chops	Premier Mutton Delicate chops  are the meat in goat ribs is close to the bone, which makes them very flavorful. Goat ribs are perfect for braising and grilling. As they are mainly bone, they usually take a longer time to cook than most goat cuts.	550.00	24	2021-08-12 00:00:00	\N	1408	40
843	Snail Moisture Mask Sheet	Its Skin The Snail Moisture Mask Sheet is a must-have in your skincare routine. It trickles pleasantly over your face, allowing its superb caregiving powers to act. Snail secretion - the innovative beauty marvel smoothens the skin and gives it a beautiful sheen. Give your face an ideal rest with this treatment and revitalize your skin with the magical results of this mask.	180.00	34	2020-12-11 00:00:00	\N	127	34
880	Bio Green - Apple Fresh Daily Purifying Shampoo & Conditioner	Rejuvenate your oil hair or scalp in minutes with these nourishing daily shampoo and conditioner. Its special pH balanced formula is uber gentle on the hair and makes it shine.	74.25	5	2019-09-02 00:00:00	\N	848	30
844	Nutri-licious Masala Veg Atta Noodles - Pouch	Introducing the MAGGI NUTRI-LICIOUS Masala Veg Atta Noodles with appetizing aroma and delicious masala taste made using 20 Spices & Herbs. These masalas are roasted to perfection (Refer pack for more details) for an aroma & flavour which you will love. These MAGGI NUTRI-LICIOUS Masala Veg Atta Noodles are a truly a good combination of delicious and nutritious Whole Wheat Flour (Atta), Colorful Vegetables & 20 Spices & Herbs. Also, loaded with the goodness of whole wheat, each meal is deliciously filling. Each serve (72.5g) of the MAGGI Masala Veg Atta Noodles is a Source of Fibre & Iron (Refer pack for more details). Making MAGGI NUTRI-LICIOUS Masala Veg Atta Noodles is as easy as it could ever be – Simply empty the Masala Tastemaker(R) Sachet into 1 ½ teacup (225 ml) of boiling water, add the noodles cake, & stir. Cook for 3 minutes and wait for your favourite "Surprisingly Awesome" MAGGI Masala Veg Atta Noodles. In just 3 minutes, now you can enjoy a balance of taste & health at any time of the day! Enjoy your MAGGI noodles (steamed, dried and fried) and consume a variety of other foods like vegetables, fruits and milk. Storage: Store in a cool, dry and hygienic place. Your favourite MAGGI noodles now loaded with the goodness of whole wheat flour (atta) Masala taste made using 20 Spice & herbs roasted to perfection (refer pack) A source of Iron and Fibre, MAGGI Nutri-licious Masala Veg Atta Noodles is nutritious and delicious Easy to cook, MAGGI Masala Veg Atta Noodles takes just 3 minutes!	80.88	73	2020-05-04 00:00:00	\N	763	1
845	Masala - Mumbai Bhaji Pav	Bombay bhaji pav masala assures you the finest seasoning for this dish and badshah assures you the best value and savor of this dish. Pav bhaji is a dish from the western part of india that has long been one of indias preferred snack foods. It also boasts a very fine nutrition value. Make a pleasant bombay bhaji pav masala with this simple to use masala mix.	35.00	35	2020-07-05 00:00:00	\N	674	24
846	Squash - Sarasaparilla/Nannari/Sugandhi Root		140.00	94	2021-06-06 00:00:00	\N	1985	37
847	Pure Country Jaggery/Bella Powder	Country Jaggery powder. Natural and traditional country jaggery powder is good for health as it contains all the goodness of sugarcane. Add jaggery powder to all your favourite sweet dishes. Use it for traditional and religious functions where it is served to the deity. It is traditional jaggery powder and is healthy and tasty.	97.00	52	2020-07-04 00:00:00	\N	2306	12
848	Steel Storage/Lunch Container - No.21, Pink, Klip It	Joyo Klip It Stainless steel container comes with easy locking. These containers are made from high quality non-magnetic stainless steel body. Joyo Klip It container has odourless lid cover with food-grade silicone seal (gasket) in lid & has all 4 sides locks which ensure airtight containers for keeping food fresh, 100% leak-proof containers for keeping food from spilling, stackable design for easily storing the containers on top of each other and the pioneering clip mechanism. Take this container to the office, school, camping or hiking.	129.00	97	2019-01-02 00:00:00	\N	1093	20
853	Sapphire Storage Container - Assorted Colour	Different sized containers make it a perfect combo for your kitchen & fridge. Plastic is thin, bpa free, air tight, freezer safe, non toxic container,100% food grade. Transparent body for easy identification of contents, containers have an air tight seal that completely locks the crisp and flavor of the contents you put in as does not lose moisture, the taste and nutritive value of the contents remains intact for a long time. Ideal for any busy kitchen, the lidded food-storage containers make it simple to freeze meals ahead of time, store healthy snacks or leftovers in the fridge, or keep dry goods fresh in the pantry. Bpa free and stain resistant, the plastic containers offer long-lasting durable strength. The food-storage containers offer a space-saving stackable design. They fit one on top of the other.	249.00	26	2021-07-11 00:00:00	\N	435	32
854	Secondary Class Students - Online Learning	Classmate Notebooks are made to the highest quality standards. Made from superior quality paper and pulp, the pages are whiter, brighter and smoother. The superior cut and excellent finish ensure the pages are in perfect alignment without any folded corners. The superior binding strength and wrapper lamination make them as durable as ever. These notebooks come with a wide variety of covers with activities and trivias to make every classmate notebook unique in its own way.\n  Classmate Notebooks are made to the highest quality standards. Made from superior quality paper and pulp, the pages are whiter, brighter and smoother. The superior cut and excellent finish ensure the pages are in perfect alignment without any folded corners. The superior binding strength and wrapper lamination make them as durable as ever. These notebooks come with a wide variety of covers with activities and trivias to make every classmate notebook unique in its own way. Classmate Notebooks are made to the highest quality standards. Made from superior quality paper and pulp, the pages are whiter, brighter and smoother. The superior cut and excellent finish ensure the pages are in perfect alignment without any folded corners. The superior binding strength and wrapper lamination make them as durable as ever. These notebooks come with a wide variety of covers with activities and trivias to make every classmate notebook unique in its own way.Classmate Notebooks are made to the highest quality standards. Made from superior quality paper and pulp, the pages are whiter, brighter and smoother. The superior cut and excellent finish ensure the pages are in perfect alignment without any folded corners. The superior binding strength and wrapper lamination make them as durable as ever. These notebooks come with a wide variety of covers with activities and trivias to make every classmate notebook unique in its own way.Octane Neon Gel Pen comprises of 5 vibrant neon body colour pens, that help in smooth and fast writing, with their comfortable grip, stylish sculpted design and Japanese waterproof ink. It enables clear and good handwriting. It is ideal for students and professionals.	249.00	91	2020-11-01 00:00:00	\N	1605	22
855	Apple - Green, Premium	Green apples have a pleasing light-green coloured skin with a sweet and sour taste.\nThey contain more fiber, less carbohydrates and sugar than red apples.\nPremium apples are handpicked by our experts to give you the best quality apples. \nDo not forget to check our delicious fruit recipe - https://www.bigbasket.com/cookbook/recipes/1865/apple-cobbler/	145.00	0	2022-01-11 00:00:00	\N	2027	34
945	Lollygum	Pop and spiral into eternity with Lolly Gum. Travel across the taste of hard candy and take a dive into the chewy gum at the centre. Relish the best combination of bubble gum and candy, rolled into one mouthful of experience.	99.00	75	2020-03-12 00:00:00	\N	1044	33
856	3-In-1 Conditioning Shampoo	Men’s hair & scalp are different, men sweat more, are prone to dandruff & hair fall more and therefore need more. That’s why Brylcreem 3-In-1 Conditioning Shampoo for men. It is no ordinary shampoo. It nourishes 3 scalp layers deep, targets dandruff, itch & dryness at source & increases scalp’s natural resistance & strengthens hair from root to tip.What’s in the mix- Formulation contains dual actives ZPTO & Climbazole, known to target dandruff, itch & dryness at source & increases scalp’s natural resistance & strengthens hair from root to tip.About Brylcreem - Brylcreem is a classic men’s grooming brand established in 1928 in the UK, originally sold to barbers to keep hair in place after a cut. It gained prominence in popular culture when members of the British Royal Air Force were nicknamed ‘Brylcreem Boys’ during world war II. Brylcreem is synonymous with Style + Care and endorsed by successful men. Do check out Brylcreem’s entire beard and hair grooming range and give your style the care it needs.	225.00	11	2022-05-03 00:00:00	\N	584	23
857	Makhana - Himalayan Salt & Pepper	Nutty Yogi Himalayan Salt & Pepper Makhanas are roasted and healthy. Himalayan salt & pepper, when brought together, creates the perfect after taste. Save yourself from unhealthy junk and switch to this healthy and tasty option. Who said healthy food cant be tasty anyways?	79.00	1	2018-07-10 00:00:00	\N	1986	35
858	Gold Flash - Mosquito Repellent Combo Machine & Refill	Goodknight Gold Flash is India’s Most Powerful Liquid Vapouriser. It consists of a mosquito repellent cartridge (refill) and clip-on electronic machine. This vapouriser system is powered by Gold Flash technology which has 2 modes - Flash and Normal Mode. Use Flash Mode when there are more mosquitoes, and Normal Mode when there are fewer mosquitoes. Visible powerful Flash vapours instantly spread across the room and drive away mosquitoes, even the hidden ones. Flash mode releases visible vapours for 30 minutes every 4 hours.	160.20	38	2020-12-05 00:00:00	\N	616	40
859	Maharasnadi Kwath	Kerala Ayurveda Maharasnadi Kwath is a polyherbal decoction with potent anti-inflammatory benefits and effective in all types of Vata disorders. It helps checks the degeneration of bones and joints and also beneficial in musculoskeletal and nerve-related disorders. The intake of Maharasnadi Kwath also helps with male and female fertility issues.	175.00	96	2018-04-12 00:00:00	\N	949	20
860	Aloe Face Wash Gel	Green Leaf Aloe Face Wash Gel is an ayurvedic soap-free gel with scrub beads that combines the superior skin care of Aloe Vera with the skin healing qualities of Turmeric and Tea tree. Green Leaf aloe face wash gel has ISO-diametric scrub beads that gently exfoliate the dead skin tissue while maintaining the skin moisture, to give a fresh and radiant look. It is suitable for all skin types. Regular usage reduces Pimples and Acne as Turmeric heals, Tea tree clears and Aloe Vera moisturises your skin. Aloe Vera with turmeric and tea tree oil is known for retaining the natural oils of the skin yet effectively reducing skin impurities like pimples and acne without letting the skin dry. An Ayurvedic product with no known side-effects.	108.00	70	2019-08-01 00:00:00	\N	411	39
861	Energy Bars - Berry, 4+ Years, 100% Natural & Healthy	Timios Berry Energy Bars are made from 100% natural and real fruits with the wholesome and goodness of a wide variety of berries which are loaded and packed with antioxidants and various other essential nutrients that are ideal for the development of cognition and other physical attributes in your little one. This product does not contain processed sugar, artificial colours, added flavour and added preservatives.	700.00	53	2020-07-03 00:00:00	\N	1868	13
862	Hot & Cold Jug - Thermo Tuff	Asian Hot & Cold Jug Thermo Tuff is a storage vessel. It helps to keep your liquid hot or cold for hours without spilling it. The flask has a spill-proof lid that ensures no leakage. It has a strong and durable body. It has a double wall that stops the heat loss. It is ideal for home, office, school and travel use. Its outer body and the inner jar is made out of good quality stainless steel and its middle layer is insulation with quality PUF.	349.00	75	2021-10-01 00:00:00	\N	659	8
863	PP Apple Belt	Fini Fantan Apple Belts contains green apple flavoured licorice belts which are one of the best zest bites. These candies come in a sweet & sour green apple flavour which excite & tingles your sense like no other candies. These candies are coated with powdered sugar to get them that additional sugary punch. The fun belt-like shape of these jellies is the best way to make snack time fun for kids. These green apple flavour candies combined with some other soft & hard candies make an absolute gift for kids’ birthdays and Halloween parties trick-or-treat. As these candies can be stored for a long time as well.	30.00	50	2020-08-12 00:00:00	\N	824	28
864	Shade Revive Plant Based Liquid Laundry Detergent	Born Good™ Plant-Based Shade Revive Detergent is India’s first scientifically formulated fade-fighting detergent. This innovative performance detergent is created especially for your solid, dark-coloured garments and linen. From the first wash, it protects new garments from fading and restores the colour of used, dark-coloured garments. The microscopic residues left behind are not harmful to the environment as well. \nPET bottles used are 100% recyclable and reusable. This fabric shade revive detergent is lab-tested to be tough on stains and safe for skin in contact with garments; Infused with deep cleansing properties that are proven to be more effective than traditional laundry detergents This eco-friendly detergent is lab-tested to be tough on stains and safe for skin in contact with garments; Infused with deep cleansing properties that are proven to be more effective than traditional laundry detergents.\nOur products are formulated by a team of accredited bio-scientists and chemists. Every product we create is rooted in plant-based ingredients that are chosen for their plant-sourced goodness, and formulated with eco-conscious science. What this means, quite simply, is that our ingredients are Born, Good. The shade revive liquid laundry detergent is mildly scented with floral hints of vetiver & woody nutmeg that gives your clothes a natural scent and long-lasting freshness The liquid laundry detergent is packed with powerful plant-based surfactants that effectively remove stains and deep clean your garments. If your choice of laundry detergent liquid goes beyond its cleansing or stain-removal process then Born Good fragrance liquid detergent is the right detergent for you. The microscopic residues left behind by toxic ingredients in other, conventional detergents are transferred directly onto your skin. The effluents from the same detergents seep polluting toxins into our environment. At Born Good, we make a conscious choice to ensure our products are safer for you and our environment as well, with zero compromises on efficacy.	262.65	81	2019-02-02 00:00:00	\N	2126	1
865	Sensual - Handmade Jasmine Bathing Bar With Natural Chunks	The ayurvedic blend of jasmine with other herbs is a natural tonic for the skin which helps in maintaining moisture and hydration. The divine essential oil of jasmine inspires heightened sensuality. The chunks inside will ensure better cleansing and moisturising. Have a fresh start with this Handmade Jasmine Bathing Bar by BodyHerbals.	199.00	61	2020-09-05 00:00:00	\N	1786	28
866	El Paso Deodorant	Deodorants are made to remove your body odour while adding that much-needed zeal of freshness. When you are smelling bad, it can lower down your confidence level, changing the way you mingle with people and talk to them. Lomani El Paso can do it for you with its Wild West-inspired fragrance!	150.00	93	2022-04-11 00:00:00	\N	1814	31
868	Classic Chicken Delite Soup	The Knorr Chicken Delite Soup is made with Real Chicken and vegetables giving it a lip-smacking taste and perfect consistency every time. Made with 100% real vegetables and no added preservatives, this soup is ready in three simple steps and serves four. This is the perfect soup for all Chicken lovers. So now enjoy Restaurant like delicious Soup at home.Knorr Soups range comprises of 11 delicious flavours of 4 serve soups and 7 flavours of Cup-a-soup. Great taste is in our Nature! Knorr has gone to great lengths to ensure a perfect blend of Ingredients and consistency that give you Restaurant like Soup at home.About Knorr: Just like you, we love everything about food, because no delicious meal is cooked without love. Love for carefully selected Ingredients, flavours and spices, or the aroma of dinner wafting through your home. Love for the people you feed everyday; your family and friends, relatives and guests, the people that matter to you the most. With Knorr as your cooking partner, you can serve your loved ones nutritious and flavourful meals at home. Soup Fun Fact - The word soup is of Sanskrit origin! It is derived from the su and po, which means good nutrition.\n\n\n\n\n\nFeatures and Benefits:\n\n\n• Made with Real Chicken and 100% real vegetables\n\n\n• Contains no added preservatives\n\n\n• Ready to eat in 3 simple steps\n\n\n• Serves 4\n\n\n• Goes well with: White Sauce Pasta or Red Sauce Pasta\n\n\n• Chefs Tip: Garnish with grated cheese & garlic and serve with pan fried bread pieces	49.50	46	2018-01-09 00:00:00	\N	2157	8
869	Kitchen Cloth - Big	Rajus Kitchen Cloth is an essential for every household and is used to clean the kitchen. The big size of the cloth helps cover larger area to clean quicker.	99.00	17	2020-09-11 00:00:00	\N	119	15
870	Sugar Free Butter Cookies	Unibic Sugarfree Butter cookies are deliciously soft, chewy and healthy cookies with 20% Butter. It contains maltitol and no added sugar.	34.00	15	2020-01-11 00:00:00	\N	1951	24
871	Chef Curated Marinade Pahadi	Product in pack: A Hariyali delicacy, relished by many. Pahadi is a Ready to Use Powdered Marinade. Mix with oil to form a paste and use. Goes well with Chicken, Seafood, Paneer and more. Pack size: 100 g Try our "Chef Curated Marinades' These powdered marinades help make cooking convenient, flavourful and delicious. They are ready to use when mixed with oil to form a paste and applied to the protein ( chicken, fish, paneer) to be marinated. These delicious marinades help add flavour to daily mundane cooking and are easy to use. How it tastes: Mild spicy, masaledar mix with a hint of cumin and chillies.\nMeet the rest of the flavours: Butter Garlic I Cheese & Onion I Amritsar I Tikka I Pink Pepper Lime I Chili Garlic I Chili Lime	120.00	92	2020-05-12 00:00:00	\N	296	36
872	Pro 4 Shaving Razor for Men - Blade + Handle + Cap	LetsShave Pro 4 Razor is a 4-Blade razor with 4 Stainless Steel blades that are carefully positioned on the Angulated Blade Platform to deliver a perfect and gentle shave in a single stroke. The Moisturising Band at the top is enriched with Aloe Vera, Vitamin E, and Lavender Extract that moisturises and protects even sensitive skin against irritation. The Pivoting head makes the blades glide easily and smoothly along your facial contours to give you a close shave without nicks and cuts. Large, Soft Rubber Fin at the bottom Protects & Prepares your skin before shaving.\nThe Superior Open Flow Architecture at the back of the cartridge makes rinsing easy and quick thus keep the blades clean and hygienic. Ergonomically designed handle with non-slip Rubber grip gives excellent control for a comfortable shave, even in wet conditions. The Razor Cap made of high-quality plastic keeps your razor blades in optimal & hygienic condition until you are ready for the next shave.	299.00	66	2019-02-01 00:00:00	\N	1230	2
873	Curcumin Imbued Honey	This immunity booster is a blend of pure honey empowered by bioactive Curcumin, derived from turmeric. Add a tablespoon to a glass of warm milk, stir well and consume immediately. Curcumin is of immense scientific interest and is widely cited in Cancer research for its anti-inflammatory activity.	499.00	70	2021-05-04 00:00:00	\N	196	1
874	Flakes - Ragi	Highly nutrtious breafast cereal/Poha. Skip Oats/Cornflakes - Eat Millets. Made from Finger Millet (Ragi). These Ragi flakes can be had with hot milk for breakfast and can be used to make Poha/Chiwda. Millets are the desi way to stay fit.	60.00	45	2021-01-03 00:00:00	\N	1221	33
875	Sports Sunscreen Lotion SPF 50	Sports Sun Protection SPF 50 is a light, sweat-proof formula that stays on the skin and fights environmental damage for long hours. It is suggested to apply this lotion for long outdoor activities, beach sports, swimming and otherwise any long exposure to the sun. So no matter what game you play, this sunscreen lotion is a teammate that you can always count on. It contains MBBT - protects from the suns UVA rays and has anti-ageing properties, OMC - protects from UVB rays and prevents sunburn, Oxybenzone - prevents from the UVB rays of the sun and reduces melanin formation, Calendula extracts - help to soothe and tone the skin, acts as an astringent and has healing properties, Swiss moisturisers - anti-inflammatory and reduces sunburn.	247.00	18	2020-05-04 00:00:00	\N	1589	22
876	Tea - Masala Vasala	Full bodied and malty, this spicy, golden brown elixir is adorned with the magic and goodness of Indian spices pledged to rekindle your senses. An absolute must-have for any tea party!	449.00	48	2021-07-07 00:00:00	\N	2183	31
877	Diabetic Care - Apple Cider Vinegar Blended With Bermuda Grass, Guava Leaf Juice & Honey	The combined hypoglycemic effects of Bermuda Grass and Apple Cider Vinegar helps control blood sugar levels. With ginger and guava leaves, it is very efficient in managing diabetes-related disorders. Acts as potent alkalizer, helps in increasing the alkalise levels and lowers acidity. Helps during acidosis, lowering internal inflammation and battle gut infections. Bermuda Grass, a natural detoxifier helps in cleansing the liver and flushes out the toxins from the body. Its antiseptic and anti-inflamatory properties can help in cases of eczema, psoriasis, wound and fungal infections. Also boosts immunity.	449.10	3	2021-06-04 00:00:00	\N	264	12
878	Papaya & Apricot Anti Tan Scrub	This Papaya & Apricot Anti Tan Scrub deeply exfoliates & brightens, removes tanning & uneven skin tone and replenish & rejuvenate skin. The amazing formula smooths away dry & dull-looking skin. This scrub is easy to use. This 100% natural exfoliant is non-comedogenic, paraben-free and oil-free.	208.00	94	2020-02-12 00:00:00	\N	839	27
997	Nut Cracker	Bikaji Nut Cracker is made with spicy masala coated peanuts with an excellent taste. A perfect tea-time snack, enjoy munching it non-stop.	48.00	31	2020-03-05 00:00:00	\N	1017	9
881	Olive Pomace Oil	Since 1939, the family-owned and managed Pietro Coricelli has been making olive oil with passion, focus and commitment to innovation and tradition. An art that has been passed down from generation to generation. The Company can assert that all of its quality certifications confirm to the highest standards. Pietro Coricelli manufactures a full range of Mediterranean olive oils, extra virgin olive oils, pomace olive oils, as well as flavoured oils.Olive oil is rich in antioxidants and has strong inflammatory properties. It prevents strokes, reduces the risk of cancer, obesity, and prevent premature ageing.	2800.00	94	2021-03-04 00:00:00	\N	1696	13
882	Green Stuffed Hot Pepper Pickle	The Rajasthani Athana style influenced our Green Stuffed Hot Pepper Pickle. The long green hot chilli pepper is pickled whole, slit, stuffed with mustard and mixed spices and then matured in traditional style for a few months. A spoonful of this spicy pickle makes a fiery condiment for curries and dipping bread. All Sakurafresh pickles are made and cured by traditional methods and blended with spices and oil to give you truly authentic homemade taste.	250.00	75	2018-10-04 00:00:00	\N	1154	20
883	Organic Basmati Rice/Basmati Akki - White	Basmati, the king of rice is well-known to have the most delightful fragrance and beautiful long grains along with that our basmati comes with totally no artificial additions. All along with these qualities, our basmati also comes with totally no harmful additives and pesticides.	237.50	30	2019-05-09 00:00:00	\N	1061	14
884	UV Away Moist Jumbo Sun Block	Protect your skin from the harmful rays of the sun with the It's Skin UV Away Moist Jumbo Sun Block. It has a non sticky moisture finish that protects the skin from sun and external environment effectively. It has SPF50+ PA++ that takes care of both your face as well as the body.	1200.00	31	2021-04-12 00:00:00	\N	127	30
885	LED Bulb - 12 Watt, Cool White, B22	With a look that is very similar to traditional filament bulbs, C&S LED Bulbs are an instant replacement for them, as they fit into the same sockets and need no further reconfiguring while giving you regular brightness at a fraction of the wattage consumed. This LED Bulb has a long life span, they save up to 90% energy, and they have no mercury. It gives 25,000 hours omnidirectional illuminations.	149.00	56	2019-03-07 00:00:00	\N	1	14
886	Crunchy Cinnamon Almond Butter	Nutty Yogi Crunchy Cinnamon Almond Butter is healthy and nutritious. This almond butter is low in carbs and high in proteins. It is made with natural almonds, cinnamon, sugar and salt. This almond butter is flavoured with warm cinnamon. It is a good source of Vitamin E, magnesium and fibre. It is rich smooth and creamy and is perfect to start your morning.	389.00	68	2020-09-03 00:00:00	\N	1986	40
887	MaxFresh Pink Spicy Fresh Gel Toothpaste - Rajasthan Royals Special Edition Pack	Don’t let the trolls get you down. #MaxFreshTheTrolls with Colgate MaxFresh toothpaste which refreshes you and helps you seize the day. Infused with menthol and cooling crystals, this red gel toothpaste gives you intense cooling and a burst of freshness. This red gel toothpaste helps you fight cavities, prevents germ build-up and helps in teeth whitening with continuous use. And now, you can stand a chance to meet your favourite team with this special edition pack. Simply scan the QR code on the back of the pack, follow the instructions and you could meet them.	89.25	82	2020-01-02 00:00:00	\N	2017	33
888	Elegance Deodorant - For Men	This Yardley Perfumed deodorant body spray is packed with elegance and beauty with an ever-lasting fragrance. Enjoy the rich and the authentic fragrances from the house of Yardley, which will keep you energizing and rejuvenating.	159.20	52	2018-12-08 00:00:00	\N	1023	3
889	Natural Baby Wash	Our Natural Baby Wash is a toxin-free combination of Coconut based mild cleansers that gently clean, while oils like Avocado, Organic Chamomile, and Organic Aloe Vera gel help soften and soothe your baby's delicate skin. The Moms Co. Natural Baby Wash is a clinically-tested and tear-free baby wash that works great as a top to toe wash for babies or toddlers with little hair.	149.00	4	2021-11-03 00:00:00	\N	324	1
890	Bajra Pearls - Roasted	Nutty Yogi's Roasted Bajra Pearls are light and crunchy. It is filled with the goodness of roasted grains and spices that gives you a tasty experience. It has potassium, which dilates blood vessels, allowing blood to flow more easily. It makes a perfect alternative for your evening junk food craving.	89.00	44	2020-05-08 00:00:00	\N	1986	16
891	Tamarind/Hunisehannu	Tamarind is used in a number of Indian and Asian dishes to give food a tangy flavour. It is also believed to ease stomach discomfort and aid digestion.	65.00	18	2020-01-08 00:00:00	\N	370	12
892	Kitchen Towel Paper Reusable Tissue Washable	EAN Code: 8906023212029  Country of origin: India  For Queries/Feedback/Complaints, Contact our Customer Care Executive at: Phone: 1860 123 1000 | Address: Innovative Retail Concepts Private Limited, Ranka Junction 4th Floor, Tin Factory bus stop. KR Puram, Bangalore - 560016 Email:customerservice@bigbasket.com	180.00	75	2019-01-10 00:00:00	\N	315	11
893	Organic Bisibelebath Mix - Kodo Millet	Millets are micronutrients which are nutritious and is a replacement for rice and wheat. Bisibelebath is a popular dish in Karnataka. It is called Sambar Rice in other Southern states. This bisibelebath is made out of Kodo millet. Kodo millet is high in fibre and protein content, rich in B vitamins, gluten-free and it improves digestion. Certified organic products are only used.	115.00	69	2020-12-10 00:00:00	\N	2152	7
964	Opalware Ivory Multiutility Bowl Set - Autumn Shadow	As timeless as the tradition itself, ivory has adorned the walls and plates of kings and nawabs alike. Its soft milky glaze, its smooth texture has been adored through the centuries. Diva brings you a collection as refined as ivory. It is perfectly smooth and strikingly white while being microwave friendly, chip resistant, bone ash free, dishwasher safe and have greater resistance to impact and thermal shock. The secret of the classiest dinner parties is now in your hand.	225.00	33	2018-01-06 00:00:00	\N	749	30
894	Wisal Dhabab Perfume Deodorant For Men	Cast in a magnificent gilt-edged bottle, Wisal Dhahab is the new Mukhallat spray from the house of Ajmal. The fragrance opens with Fruity Fresh top notes embellished with Apple, Peach, Pear, Grapefruit and Mandarin. At its Heart, the essence engulfs Floral highlights of Rose, Jasmine, Orchid and Geranium. And to complete the sheer experience of the journey, the Base Notes are Woody Musky resonating with Sandalwood, Cedarwood, Patchouli and Musk. Wisal Dhahab is a fragrance that is perfectly crafted for those who wish to add an extra touch of gold and shimmer to their persona.	225.00	63	2019-12-03 00:00:00	\N	1733	37
998	Alphabytes	A' for Alpha, B" for Bite, "C" for yourself that they taste a delight! Have fun with the kids- eat, play, learn! Crispy outside & soft inside. Just remove the packet from the freezer and relish the tasty snacks with your family. It contains no added Preservatives.	137.75	16	2019-12-10 00:00:00	\N	1201	31
895	Palakkad Red Matta Boiled Rice - Unda	The matta rice is brown in colour and has a lot of health benefits. The matta rice that is not polished is called 'whole grain matta rice or 'brown rice'. Matta rice is ideal for daily use to make idlis, appams, Kondattam, Murukku & more. With its earthy flavour, Matta rice is the perfect accompaniment for many curries. All the nutrients continue to remain in the unpolished rice, while it is lost in polished rice. Polishing removes all the nutrients, leaving behind only the carbohydrates.	242.00	37	2021-10-05 00:00:00	\N	2281	10
896	Olive Vegetable Oil	Olive oil has numerous beneficial qualities. Apart from being a good cooking aid, it is also known to have unique medicinal qualities. The phenols present in olive oil have anti-inflammatory properties. The antimicrobial characteristics of the oil are a result of its strong aroma. Rich in antioxidants, olive oil slows the natural aging process of the human body. Used in cosmetic products and natural herbal therapy, olive oil does wonders for the skin, which gets a natural shine and glow from the enriching oil. It is well known to aid in the digestive process. It is used as a medicinal oil to clean the digestive tract and to improve bowel movements.	156.75	83	2020-10-04 00:00:00	\N	1874	32
897	Hearts & Kisses For Women	Hearts & Kisses by Dorall Collection is a celebration of sunshine and modern femininity, and it presents a distinctly sweet, floral experience that’s perfect for any warm-weather wardrobe. This fragrance is elected to embrace the warmth of the sun with each and every ingredient.The top notes include hints of apple and a variety of aqueous. This attention-grabbing opener blends into heart notes of rose and jasmine, which in turn fades into the base notes of sandalwood and musk to add just a touch of a warm, earthy effect. This fragrance is ideal for use during warm spring or summer daytime events.	419.30	34	2020-06-06 00:00:00	\N	316	16
898	Chocos - Moons & Stars	Wheat-based breakfast cereal with yummy chocolaty taste and the goodness of wholegrain shaped liked moons and stars. At Kellogg, we're always trying to look for ways to brighten your life, from quality and safe products to informative labels. We focus on things that encourage a healthier tomorrow. We do things you love the most about us: our taste, convenience, and nutrition. Helping You Be Your Best. Now, for Over 100 Years we have been making quality products for a healthier world. We are improving the nutrition credentials of our foods – without sacrificing the delicious taste you love – A nourishing tastier breakfast every day!\n\nLow in Fat\nNaturally Cholesterol free\nHigh in protein\nSource of fiber\nHigh in calcium\nHigh in Iron\nHigh in B group vitamins	175.00	4	2018-07-12 00:00:00	\N	1654	38
899	Instant Diet Popcorn - Contains Olive Oil	The health-conscious need not worry about snacking any more, as with PIPO's Instant Diet popcorn- you can have unlimited fun. It is gluten and cholesterol free which makes it a very light and healthy snack. It is an anytime snack to get rid of your food cravings. Just Cook, serve in 3 minutes.	10.00	21	2020-03-09 00:00:00	\N	2132	13
901	Con Con Corn Chips - BBQ	Tong Garden Con Con-Corn Chips Barbeque, best quality chips from imported brand specially prepared for snacks. When you think of nuts, you probably think of peanuts, beans or even peas products. But there is a lot more to tong garden than candy bars and snack	120.00	39	2020-05-11 00:00:00	\N	1184	38
902	Disinfectant Surface Sanitizer	Disinfectant Surface Cleaner from Maxkleen helps to kill 99.9% of Bacteria and Germs. It is an ideal and very effective surface maintainer. Sanitize the surfaces with this disinfectant and keep your home germ-free.\nAdditional Highlights: \n1. Removes tough stains without any residue.\n2. Leaves a pleasant floral fragrance.\n3. Safe to use on all surfacesL Ceramic, Mosaic, Granite, Marble, etc.	71.10	85	2018-03-03 00:00:00	\N	1816	6
903	Surekha Boiled Rice	Boiled Rice is the rice that has been partially boiled in the husk. Ponni Boiled Rice is fresh, it is cleaned and packed at our hygienic facilities. It is relishing in flavour and provides a high nutrition value to anyone's diet. They are parboiled by soaking, steaming and drying. The steaming enables the rice to absorb nutrients and changes the starch so that it cooks into a firmer, less sticky dish of rice than regular white rice.	228.00	34	2020-06-03 00:00:00	\N	2281	2
904	Peri Peri Masala	Peri Peri - A Spice Mix from the house of Smith & Jones. It is a Spice mix which is tangy and spicy hot in flavour. It can be used as a Mix or a Sprinkler. It is popularly known as the modern-day chaat masala. Experience the exotic spicy twist with a tangy note that turns your food extra delicious. You can add this to your Fries, Pastas, Pizzas, Pakoras, Chicken, BBQ, Salads, Fruits, Sabzi, Curry, Chaats, Dals etc to make it more exciting. Kids will just love this twist on any snack.	42.24	83	2020-04-07 00:00:00	\N	1303	15
905	Haldi Drops	Zandu brings "Zandu Haldi Drops", a unique formulation with the goodness of Haldi, along with Saffron, Cinnamon, Cardamom and Black pepper. It has immunomodulatory (Rasayana), Anti-inflammatory (Shothahar), Analgesic (Shulahar) as well as Blood purifier (Rakta shodhaka) properties. Useful in the management of skin disorders (Tvagroga), Cough, cold and allergic rhinitis (Kasa, Pratishyaya & Pinasa) and helps improve overall health and well being.	190.00	98	2020-04-04 00:00:00	\N	1229	24
965	Cheese Crunchy Layered Crackers	Malkist choco weelz crunchy coated biscuit an unexpected treat that combines the playfulness of a cookie and elegance of a cake. Experience the unique combination of chunky.MALKIST is more than just a crispy cracker, its enriched with Malt & Vit. B to give you the energy and delicious toppings for taste you just cant resist.	140.00	83	2021-01-05 00:00:00	\N	511	5
906	Pasta - 37B Penne Rigate	A product of Italy! The Colavita Pasta company was founded in 1912 in the small hilltop town of Sant'Elia a Pianisi, in Molise, Italy, a region where the rolling hills are still today covered by golden fields of wheat. The people of Molise hold an unwavering respect for the craft of pasta making and it's in this spirit that the Colavita family continues to draw upon the resources of their homeland to produce superb pasta using only 100% durum wheat semolina and fresh mountain spring water with no salts or artificial ingredients added. Pasta is a fundamental component of the Mediterranean diet, so it's no wonder Colavita Pasta is the authentic Italian choice for home cooks and chefs around the world.	92.00	31	2020-05-02 00:00:00	\N	1009	11
907	Asafoetida Powder	G.D Asafoetida (Hing) is traditionally used as a carminative. G.D Asafoetida is one of the most preferred asafoetida brands across the southern states. Asafoetida is the queen of spices and it enhances the food taste and serves as a digestive aid for humans. Minute quantities of G.D Asafoetida (Hing) in food are beneficial for proper digestion. It is effective over various digestive disorders like flatulence, colic and stomach spasm, acidity, intestinal worms and digestive weakness.	160.00	18	2019-04-04 00:00:00	\N	1369	25
908	Face Wash - Blush & Glow Strawberry Gel	Use the Lakme Blush and Glow  Gel Face Wash to give your skin a gorgeous kissed glow, every day. Formulated by Lakme Salon experts & enriched with the goodness of rich Strawberry extracts. The face wash has fruit anti-oxidants and beads that cleanse your skin washing away dirt and other impurities. For the best results. Follow this simple Blush & Glow regime every day for a fruit-kissed glow every day. The beautiful texture & fragrance will make you fall in love instantly.Tip: Following a regular skin care regime can help you achieve flawless skin. For more tips on skin care, visit bigbasket lifestyle blog, Click Here to visit bigbasket’s lifestyle blog	153.75	33	2019-05-03 00:00:00	\N	539	17
909	Blueberry Almond Crisps	A bite full of happiness and health; is what we like to call this little treat. The playful sweetness of blueberries gets complimented by Vitamin E rich California almonds, perfectly balanced in our Blueberry Almond Crisps. These energy boosters are light yet filling and offer a flush of deliciousness in your mouth and moment, with its juicy handpicked blueberries married with roasted California Almond bits.	225.00	9	2021-03-12 00:00:00	\N	1011	26
910	Toothpaste - Whitening, Cavity Protection, 150 G	Get pearly white teeth with this Pepsodent Whitening Germ check+ Toothpaste. The specially designed formula of this toothpaste helps fight tooth cavities and decay. The protective elements in this toothpaste helps prevent plaque formation and gum sensitivity. With a fresh flavour, the toothpaste gives an everlasting fresh and clean breath. Regular use of it results in lesser bacteria and germ formation. This toothpaste is perfect for every member of your family from toddlers to elders. So dont worry about indulging in your favorite foods ever again!	85.00	88	2021-03-10 00:00:00	\N	175	7
911	Bathing/Cleaning Bucket - With Plastic Handle, Mango Yellow, L1145PH-LT MY	It is made of polypropylene and it is really durable with high endurance. It features strong and sturdy construction and is ideal for daily use due to its compact weight. The polypropylene material adds to a great mix of quality and style.	249.00	66	2020-05-01 00:00:00	\N	1647	8
912	Organic Puttu - Pearl Millet	Puttu originates from Kerala and is mainly made out of Rice. This recipe is adopted using Pearl Millets and presented in a convenient form. Pearl Millet is beneficial in treating stomach ulcers and for heart health. High in magnesium, it helps in bone growth, reduces cancer risk, helps in weight loss, reduces cholesterol, and is beneficial for diabetes. Certified organic products are only used to prepare this puttu.	68.00	68	2021-11-01 00:00:00	\N	2152	12
913	Muesli - Gluten Free	Gluten-Free Muesli is inspired by the traditional Swiss cereal developed by Dr. Maximilian Bircher-Benner. This lovely blend of gluten-free oats, dried fruits, nuts, and seeds can be enjoyed a plethora of ways: with yoghurt, milk, or juice, hot or cold, straight out of the bag or soaked overnight.	790.00	90	2021-01-08 00:00:00	\N	2006	24
914	Organic Powder - Red Chilly	Make tempting vegetables, curries and other delicacies with this Organic Tattva Red Chilli Powder. It is prepared by grinding different types of chillies in a fine powder. Some chilli powders present a dim red color but are low in spice content. The chilli powder is rich in vitamin C and vitamin A content. Vitamin A from this spice helps to keep your teeth, eyesight, skin, bones and reproductive system.	52.25	98	2019-05-02 00:00:00	\N	1061	1
915	Thyme	A medicinal Mediterranean herb that comes with a mild mint flavour. It is an excellent source of dietary fibre, calcium, vitamin K and Iron. It adds a warm and distinct taste to the dishes. You can add it in chicken and fish marinades, stews, vegetables, etc. It can also be used as a garnish to add a piquant flavour.	79.00	58	2020-06-08 00:00:00	\N	456	5
916	Steel Deep Dabba/Storage Container - No. 14, Plain	BB Home Canister/Container Deep Dabba is a long cylindrical-shaped storage container, made of fine quality stainless steel that is durable and ideal for storing grains, snacks and other edibles. They are easy to clean and maintain. They add a great addition to your modular kitchen.	329.00	57	2021-01-11 00:00:00	\N	1331	30
917	Coco Oval Basket With Lid - Medium, Assorted Colour	This Coco Oval Basket With Lid is a premium quality BPA free having a smooth finish, highest quality, lightweight and appealing design.\nMulti-utility baskets: -store anything and everything, from fruits, vegetables, pantry items, toiletries, beauty products, school supplies, mail, magazines and more.	159.00	34	2020-04-04 00:00:00	\N	435	38
918	Aluminium Induction Base Flat Bottom Patila Tope Pot - Silver	Hazel Aluminium Flat Bottom Pot has a great thickness that is fantastic to even heat food. It is made from high quality food grade aluminium. It is made in the traditional way so that it can be used to serve food to your dinner table. This induction base pot adds a perfect finishing touch on an Indian meal. It is easy to clean and wash. this pot is highly durable and made of fine quality material making it long-lasting. It ensures even heat distribution and fast cooking. It is used to make curry, vegetables, etc.	399.00	8	2018-05-06 00:00:00	\N	2288	26
919	Ultra-Fresh Fairness Face Wash With Milk, Licorice, Saffron	Give your skin a fresh and healthy look all day long! Enriched with the goodness of Saffron, Milk and Licorice extracts, Olivia Ultra Fresh Fairness Face Wash will give your skin an even-toned and glistening complexion.	12.75	51	2021-03-12 00:00:00	\N	1182	7
920	Pickle - Prawn	Sea caught fresh Prawns ( Chemmeen) are used in the making of Prawn pickles. The Prawn pickle is a mouth-watering nostalgia made by South Indian recipe. Processed using CFTRI know-how in a HACCP implemented factory.	225.00	30	2022-06-12 00:00:00	\N	245	10
966	Kitchen & Household Daily Cleaning - Reusable Cloth	York is a Leading European manufacturer of household cleaning products. Multipurpose cottonlike cloth is soft to touch and can be used dry or wet. Intended to polish, wash or wipe on different types of surfaces such as plastic, laminate, leather, tiles, wood, particularly delicate areas in kitchen, bathroom or car.	151.20	11	2020-02-09 00:00:00	\N	217	2
921	Stand & Pee Reusable Portable Urination Funnel For Women	Female reusable urination device allows women's of all ages to STAND & Urinate with its unique designed funnel - when you don't want to sit on an unfriendly toilet. A must-have device for hospital & medical needs, highways & outdoor, railway & metro as well as public toilets. Made in India, first portable, reusable female urination device for women using which women can stand and urinate in all public and common toilets. It is a revolutionary product for women who hate dirty toilets when travelling fights or train or highways for work or leisure treks, marathons, road trips, events or those with medical condition joint pains or pregnancy. Using Pee device you can simply stand and pee and avoid all utis or infections or yucky experiences at dirty toilets. It comes with simple open place pee throw instructions and is very convenient to use with no spills. Now use reusable pee device and stay away from infections, UTI. No more wiping of the seat, no more squats, no more holding it in. It's a quality product by FSD.	225.50	18	2019-09-10 00:00:00	\N	858	24
922	Original Scent - Dry Skin Moisturiser With Cherry Almond Essence	Enjoy the soft and silky feel of your skin when you nourish and rejuvenate it with this moisturiser from Jergens. Absorbed excellently by your skin, this moisturiser gives you a glowing skin. Moisturising your skin thoroughly, Original Scent Skin Moisturises & Softens reduces dryness and hydrates your skin.\nApply this moisturiser regularly and religiously to experience a skin that is so soft, silky and fragranced.	449.10	74	2021-12-01 00:00:00	\N	468	14
923	Cookies-Choco Ripple Cookies	Craving for Chocolate? One bite of these cookies can put an end to that. Cookies infused with heavenly Cocoa to make every bite feel divine. Calling all Chocolate lovers, this one's for you.	36.00	85	2019-02-09 00:00:00	\N	1951	9
924	Executive Lunch Box - Small, T Blue	Signorawares Executive lunch boxes are perfect for the health conscious workers of today. When you eat healthy and perform your best, your colleagues will be inspired by you. The unique insulated bag keeps food warm for hours and is ideal for office executives and school kids. The set contains 2 spill proof and air tight containers that help keep food fresh and warm. It is easy to fit and store in briefcase or hand bag.	390.00	78	2019-09-01 00:00:00	\N	1171	26
925	Room Freshener - Soul Blossom Jasmine	Good Home Soul Blossom leaves a subtle hint of jasmine in your home, giving you the chance to lose yourself in a pleasant garden. Packed with refreshing fragrances, Good home room fresheners will fill every corner of your rooms with pleasant aromas. Now unwind at home surrounded by the best fragrances from Good home room fresheners.	149.00	21	2019-02-11 00:00:00	\N	633	38
926	Sauce - Chilli	Remia Chili sauce is a fierce sweet sauce which goes completely with spring rolls and other deep-fried snacks. It is favored to be consumed with veggies and also for fish, meat and poultry.	200.00	20	2020-08-08 00:00:00	\N	1395	17
927	Copper Water Fliptop Bottle - Hammered, Plain	Frestol sipper bottle Sipper is made of pure copper. Drinking water stored in copper bottles is strongly recommended by Science and Ayurveda because water stored in a copper bottle is loaded with anti-oxidants. Just fill this bottle and leave it for a minimum 3 hours, best if kept overnight as the water gets copper properties and its benefits during this time. Copper kills undesirable bacteria and germs and gets water charged with the health-benefiting qualities of copper. It is recommended to drink the water at room temperature, experts say that drinking from a copper water bottle on a regular basis, especially early in the morning, can make a significant difference to health.	549.00	96	2022-07-03 00:00:00	\N	373	5
929	Toothbrush - 360 Degree Flosstip, Soft	Colgate 360° Floss-Tip Toothbrush comes with a unique floss-tip bristle design, for deep cleaning and gentle action. It provides 4x deeper reach to clean mouth thoroughly. The brush is designed to clean parts of the mouth other flat trim brushes can miss. The special purple-ended tapered bristles provide a deep clean action on both sides of the teeth and along the gumline, while the cheek & tongue cleaner works to clean more than just teeth. Easy-to-hold brush handle ensures to give a comfortable grip during brushing. The toothbrush cleans your whole mouth including teeth, tongue, cheeks & gums, to give you a healthier whole mouth clean.	142.50	5	2019-12-11 00:00:00	\N	2017	3
930	Purifying Neem Face Wash	Made from an exceptional blend of Neem & Cinnamon, Chandrika Purifying Neem face wash prevents the occurrence of acne/pimples and removes post pimple marks and serves as an excellent "Beauty Tonic" for your skin. Its deep cleansing action flushes out impurities to give you a visibly clear, flawless skin with every wash	63.00	48	2019-06-03 00:00:00	\N	938	16
931	Opalware Classique 2 Dinner Set - Mystrio Black	Divas newest collection, the Classique collection comprises of an exquisite range of tableware that stands out for its striking milky white glaze and consumer-friendly properties like being microwave friendly, chip resistant, bone ash free, dishwasher safe and has greater resistance to impact and thermal shock. Its Classique Collections exquisitely chic international design that makes owing it the ultimate reason for pride.	2379.00	70	2020-05-07 00:00:00	\N	749	8
932	Black Sliced Olives	Habit Olives have first-rate flavour, texture and colour. Black olives are olives which are ripened completely before curing. They have a different flavour from green olives. It can be utilised in any recipe, as it makes them yummy and healthy.	180.00	3	2020-05-04 00:00:00	\N	1137	17
933	Diatrin Tablets - Controls Sugar Naturally	The most significant indication of diabetes insipid us is persistent high urine output regardless of fluid intake while the indication of diabetes mellitus is an excessive amount of sugar in the blood. This Jiva Diatrin Tablet is highly active against Diabetes and contains an ayurvedic combination of diuretic herbs like the leaves of the Jamun fruit and the bark of the Udumber. All the leaves and roots including those of the gudmar and fruits like amla and Jamun are collected, finely sorted and then ground into powder, which is then made into small tablets. The tablet alleviates the aggravated tridosha and increases the general strength of the body besides being effective in Diabetes Mellitus and Insipidus and other urinary system related disorders.\nWe have chosen quality ingredients from organic environs for you and sorted them to ensure unmatched efficiency. We employ processes that are primed to give you a balanced product without contamination or loss of potency.	65.00	2	2022-04-06 00:00:00	\N	901	21
935	6 Oil Nourish Conditioner	Does your hair get frizzy and unmanageable? Are you left wishing for a remedy to fix your frizzy tassels? Do you want to know the secret to fixing frizzy hair? Try New Dove Intense Repair Conditioner. Control frizz with a nourishing conditioner that’s formulated to nourish and help with frizz prevention. Formulated with Keratin Actives, Dove Intense Repair Conditioner helps to nourish dry and frizzy hair with two-way care. It controls external signs of dryness in the form of frizz while nourishing strands to help them look their best. This conditioner for frizzy, damaged hair Leaves hair visibly smooth and more manageable – giving you smoother hair* that you will be proud of. Use it after your shampoo on damp hair for best results. This nourishing conditioner works immediately to smoothen the hair surface, deeply nourishing to moisturize hair strands for healthier looking and smoother hair use Dove repair conditioner. With every use, you’ll be left with shiny and beautiful hair. Buy New Dove Intense Repair conditioner and treat your hair to a look that will be the cause of envy among all your friends. Dove Conditioners, for 100% care. *Based on lab test with Dove Intense Repair system vs non-conditioning shampoo	159.00	17	2021-02-03 00:00:00	\N	1851	5
936	Stainless Steel  Induction Compatible Pressure Cooker - Silver, HSS10	The body and lid of this Stainless Steel Pressure Cooker With Induction Compatible Base are 100% stainless steel. To ensure uniform heating, the bottom has a core of 4.06 mm thick aluminium sandwiched between two sheets of stainless steel. The base always stays flat, never bulges. Stainless steel stays bright, does not pit or corrode, is easy to clean and extremely hygienic. Can be used safely for light and deep frying and pressure-cooking. Suitable for gas, electric, ceramic, halogen and induction cooktops. Suitable for gas, electric, ceramic, halogen and induction cooktops. Ideal to cook for 3 or 4 persons.	5320.00	68	2022-03-08 00:00:00	\N	1074	23
937	Chips - Potato, Masala	Made with Potato	45.00	19	2020-04-09 00:00:00	\N	1032	26
938	Dates Powder - Natural Sweetener	100% dried dates made into a fine powder. A natural sweetener and healthy replacement for sugar. It can be used to sweeten porridges, milkshakes, kheer, halwa and even partly mixed in cake and cookie doughs. Rich iron content. It contains no preservatives, additives or artificial flavours.	300.00	81	2022-06-03 00:00:00	\N	2122	8
939	Coconut Scraper - Sleek	Anjali coconut scraper has a plastic body with SS scrapping blade & handle. It helps scrape coconuts faster and the sharp blades scrape the coconut white effortlessly. The high quality rubber base pad fixes the product firmly for better grip.	199.00	33	2019-03-11 00:00:00	\N	1143	22
940	Infant Formula Baby Food Powder - Stage 1	Enfamil A+ Stage 1 has DHA & ARA at levels close to FAO/WHO recommendations for infants of 0-6 months. Enfamil formulas for infants are individually tailored to help nourish brain development and help support infant milestones. As your baby grows and develops, he/she reaches new and more complex milestones. These milestones are driven by a cognitive, motor, social and communication areas of the brain. Enfamil Infant has DHA, a fatty acid recommended by experts and important for infant brain development.	715.00	41	2020-03-01 00:00:00	\N	292	33
941	Organic - Whole Wheat Ajwain Jaggery Teething Sticks	This product is recommended for little ones who are ready for all grains and nuts and it is a vegan snack. Best if they have 1-2 teeth to chew. If not, you can always dip in milk to help them bite. organic whole wheat teething breadsticks with the goodness of ajwain and jeera. It is made from organically certified whole grains and 0% maida. No baking powder, no soda or raising agents, no egg, 0% sugar, sweetness from organic jaggery and dates. Also, no hydrogenated fats, and it is made from pure cow butter. No preservatives or artificial flavours are added.	175.00	20	2018-05-03 00:00:00	\N	2122	1
942	Pre Shave Foam - Classic Lemon Lime	Gillette Shave Foam Lemon-Lime leaves your skin feeling radiant and fresh, with a delicate burst of lemon-lime aroma. Like its thick, extra rich, creamy lather for a shave that is as fresh as the great outdoors. A Comfort Glide Formula and a rich, citrus-scented lather that spreads easily and rinses clean for that foamy shave men have enjoyed for generations.	195.02	54	2020-06-01 00:00:00	\N	1826	30
943	Onion - Organically Grown	It is organically grown and handpicked from farm  Product image shown is for representation purpose only, the actually product may vary based on season, produce & availability.	35.00	31	2020-06-12 00:00:00	\N	2027	2
944	Cheese Spread - Asli Pepper	Britannia Cheese Spread- Asli Pepper is a soft, smooth & creamy spread made with the goodness of cow's milk. Give your food the real taste of pepper & cheesy flavours with this delicious Britannia cheese spread. Spread this on toast, sandwich or use it as a dip for a truly cheesy delight. Believing in delivering fresh and healthy products, Britannia manufactures some of India's widest range of cheese slices, cheese cubes, cheese blocks, cheese spread, pizza cheese and much more.	101.25	62	2019-12-11 00:00:00	\N	2215	37
946	Pet Selo Container Set - Silver	Steelo plastic container set is made of 100% food-grade PET plastic that can help store pulses, spices and other edibles in a safe way. These containers are Bisphenol A (BPA) free which makes it safe from health hazards and will help lead a healthy lifestyle. The PET material makes the containers odor-free, so you donot have to worry about the contents smelling different. The airtight seal completely locks the container and conserves the nutritional value of the stored items.	279.00	91	2021-01-10 00:00:00	\N	723	12
947	Amritsari Marinade	Every street in Amritsar exudes vibes of deliciousness and Orika's Amritsari Marinade captures that spirit perfectly. A fine blend of Ajwain, red chilli powder and our signature Garam Masala, our Amritsari Marinade is a quick fix to infuse those piquant, earthy notes typical to Amritsar. Besides, the best part of using this marinade is that it imparts an almost tannic finish to your dishes without making them too hot or dry.	51.75	95	2021-01-08 00:00:00	\N	1062	39
948	Sriracha Hot Chilli Sauce	Real Thai Sriracha Chilli Sauce is a hot, spicy dipping sauce which is common throughout Thailand and rest of the world. It works great with soups, sauces, pasta, pizzas, hot dogs, hamburgers, stir-fried noodles or on anything else to give delicious and spicy taste to your meal.\n Benefits \n1. Made from all-natural ingredients and free for added flavouring.\n2. It contains healthy ingredients and is best accompanied by pasta, pizzas, hot dogs, hamburgers, stir-fried noodles, etc.	180.00	49	2019-09-08 00:00:00	\N	974	17
949	Brightening Booster Orange Shower Gel	Escape to the shower for an ultimate bathing experience. This naturally soothing orange shower gel is infused with gentle foaming body cleanser and conditioner. The aromatherapy blend of essential oil will pamper your skin and leave it wonderfully scented and rejuvenated.	299.00	89	2021-02-09 00:00:00	\N	1786	23
967	Glass Water/Juice Tumbler - Summer	Tumbler is a flat-bottomed container usually made of plastic or glass. This tumbler by Iveo, made of glass, can be used to serve water, juices and other beverages. It will surely increase the elegance of your kitchen and dining space.	439.00	6	2018-04-12 00:00:00	\N	1706	9
950	Icecream Mix- Chocolate	There’s always a room for ice cream! With puramate ice cream mix, you are well prepared for a rush on hot days and can always offer ice cream in the winter. Ready to use, our ice cream mixes are designed to be quickly and easily prepared. Enjoy the delicious simplicity of creamy ice cream mix or add your own touch by mixing in nuts, candy, or toppings. Puramate ice cream mix is indulgent, wholesome and fun. Puramate’s ice-cream powder premix makes it easier for you to make pure and hygienic homemade ice creams of your choice. You can make mouth-watering ice creams using fresh cream, fruit, or fruit pulps. Ice creams taste even more delicious when had with puramate’s ice cream premixes. It makes delicious ice cream in the comfort of home. Instant mix to make delicious ice creams in a convenient way. Just mix/whip with chilled milk and freeze, your delicious ice cream is ready to serve and enjoy the magic taste ice cream mix. Everybody knows nothing compares to homemade ice cream – especially when it’s made with our puramate ice cream mix. The special recipes for our puramate ice cream mixes deliver a deliciously sweet and creamy flavour that’s worth screaming for.	43.20	78	2020-05-09 00:00:00	\N	345	21
951	Spices - Whole White Pepper	This high quality White Pepper is created from the Black Pepper grown in the House of Ramapuram’s family plantations in the hill district of Coorg, in Karnataka, India. Ripened Pepper corns are handpicked and soaked in water for days and the outer skin layer removed to create White Pepper.White Pepper is used in light-coloured dishes such as white sauces and mashed potatoes for aesthetic reasons. With its origins in French cuisine, white pepper is also used in some cuisines for its specific flavour. Once opened, store in an air tight container to retain flavour and aroma.	250.00	91	2022-05-10 00:00:00	\N	2231	39
952	Comb - Derby Deluxe No 61	comb is a toothed device used for styling, cleaning and managing hair and scalp. Combs are among the oldest tools found by archaeologists  For Beauty tips, tricks & more visit https://bigbasket.blog/	40.00	92	2021-03-12 00:00:00	\N	1195	20
953	Scissors - Stylish Cut	These scissors are suitable for men's hairdressing saloons. It has a grip on the handle which ensures that it doesn't slip while in use. These Cartini scissors are perfect to get the stylish hair cut.	220.00	68	2020-03-03 00:00:00	\N	573	1
954	Sylvana Shot Glass Tumbler	These simple yet elegant-looking glasses are ideal for your party-time tequila shots. Enhance the beauty of your in-house bar with this beautifully crafted crockery.	359.00	38	2021-08-05 00:00:00	\N	562	38
955	Padded Lead - 1 inch, Blue Colour	These are soft padded lead for your active pets with light weight metal fitings making them completely safe for your pets.	730.00	94	2019-09-01 00:00:00	\N	1256	10
956	Pimple Clear & Germ Removal Face Wash	All of us have dealt with pimples and acne at some point in time in our lives. Environmental factors are only some of the causes of this problem, but hormones and genetics also play a part in triggering acne. Stress, lifestyle choices, hygiene issues, make-up residue and food can make the situation worse.\nPond’s Pimple Clear Face Wash, it offers the best solution for pimples and acne thanks to its unique formula that includes active Thymo-T Essence. The formula works well with this face wash for oily and dry skin types. It penetrates deep into your skin’s epidermis to lock pimple-causing germs at the root and helps clear them away.\nPond’s Pimple Clear face wash is a gentle face wash with the world's first Lock + Clear Technology that is clinically proven to start showing results in just three days giving you clearer, healthier, smoother skin.\nThe Power of Active Thymo-T Essence and the world's first Lock + Clear Technology enables this face wash for pimples to clear them at the root. You will see a visible difference in 3 days with smoother, clearer skin thanks to this exfoliating face wash.	186.00	81	2020-07-04 00:00:00	\N	1416	5
957	Organic Peanut Flax Chutney - Spicy Podi Flavour	This delicious and nutritious chutney is made from peanuts and flax seeds, with flavouring from herbs and masalas such as cumin powder, garlic powder, chilli powder and some rock salt. Bursting with nutrition (27% protein, rich in iron, calcium, omega-3, dietary fibre), this spicy chutney is made from 100% Organic Ingredients. This "spicy podi" flavoured chutney is a great way to add nutrition to your daily favourites such as dosas, idlis, parathas and chapatis.	120.00	6	2021-08-09 00:00:00	\N	712	26
958	Manuka Honey Multifloral	Nelson Honey’s Manuka Honey 100+MG (Multiforal) is sourced from pure, clean and natural environments in remote parts of the top of the South Island of New Zealand. This area is free of pollution, chemicals and other contaminants. This honey is known for its distinct flavour and special aroma. It is widely used for medicinal purposes as it contains antibacterial properties.\nManuka honey is collected by the honeybees from the flower named Manuka. It contains no additional ingredients, preservative or GMO. It is not blended or heat treated.	1999.00	74	2020-02-04 00:00:00	\N	1577	32
959	Everfresh Morning Rose Dew Gel Blocks	Airwicks Everfresh Gel come with upto 2,400 fragrant sprays per refill and one pack fills the room for up to 60 days making them last longer. Their advanced technique eradicates odour causing bacteria eliminating foul smell leaving your room smelling like a bunch of roses or any other wide variety of fragrance that it comes in.\n\nEnjoy the lifting fragrance of roses with 33% more fragrance.\nDrives away odours to enhance the bathroom.\nLasts for up to 30 days.\nAvailable in - Lavender Meadows, Morning Rose Dew, Lemon Garden and Velvet Rose	59.00	60	2019-09-07 00:00:00	\N	2018	19
960	Organic Tamarind/Hunisehannu	BB Royal tamarind is sweet and tasty. Tamarind is high in vitamin C and several B vitamins along with potassium iron and phosphorus. It has been used to break the fever and cool down the body. Traditionally it is also employed to help with digestion issues relieve a sore throat and alleviate sunstroke.\nTamarind contains a variety of biologically active phytochemical compounds which combine with the nutrients of tamarind act in synergy to produce its miraculous benefits. It is an extensively used condiment spice that is necessary for kitchens. One can make a variety of dishes and pickles with these tamarinds.	239.00	20	2021-01-11 00:00:00	\N	2281	3
961	Muffin - Rich Chocolate, Whole Wheat (Eggless)	All your chocolate desires in a Rich Chocolate Centered Muffin.	289.00	64	2019-11-10 00:00:00	\N	561	23
962	Cheesy Corn Triangles	Triangles of indulgence! Italian seasoned, cheese & corn-filled gooey delights that are sure to leave you asking for more. ITC master chef is a high-quality brand and its quality is of a gold standard. It adheres to absolute benchmark and its products are of the highest standards in taste and quality.	152.00	41	2022-02-10 00:00:00	\N	1201	14
963	Rejuvenating Cucumber & Aloe Vera Face Pack For Skin	Do not let those slumbers go to waste. Have a face pack party! Try Everyuth Naturals Skin Firming Cucumber Face Pack with Nano Multi-vitamin A and Cucumber Extracts.	171.00	89	2019-06-02 00:00:00	\N	1199	4
995	Shot Body Spray - Absolute Series, Craze	You are not ready until You are Absolute ready. Layerr Shot Absolute - a collection of exceptional fragrances crafted for the uber-cool urban man. Each fragrance exudes charm, machismo and effortless style. So dont forget to complete the look with Layerr Shot Absolute.	168.75	63	2019-11-02 00:00:00	\N	1878	28
968	Pearl Whitening Peel Off Mask	Glamveda pearl mask mildly calms sensitive skin with rich essence, the saffron & rose petals are here to transform your skin! Your skin will be soft and supple in a couple of minutes with this mask, leaving you looking effortlessly flawless. The rich extracts, with soothing properties, offers softness and hydration to skin.	144.00	50	2022-06-05 00:00:00	\N	839	10
969	Plastic Watering Can - Green	Let your planters reflect your personality with Klassic Planters. These Planters are suitable for all the intents: balcony, indoor as well as outdoor gardening. The design supports almost all the variety of flowers and plants. Colourful flowers grown along with the amazing designs of this planter will give an unique look for your garden. The planters can withstand direct sunlight, rainfall and can be kept outside all over the year - making it a perfect choice for outdoor gardening. They are also ideal for indoor gardening, and a lightweight option to decorate your table top, sleeves with beautiful plants. And the best part is that these high-quality beautiful planters are available at pocket-friendly rates!	599.00	41	2018-04-06 00:00:00	\N	1927	33
970	Lemon Grass	Lemon Grass is a culinary herb that comes with an excellent aroma. It is also used as a medicinal herb in India. It has a subtle citrusy flavour and can be used fresh or even dried and powdered.\nDo not forget to check out our delicious recipe- https://www.bigbasket.com/cookbook/recipes/2255/lemongrass-tea/	10.00	86	2021-07-03 00:00:00	\N	2027	34
971	Professional Salon Series Platinum Silver Facial Kit	VLCC Platinum Facial Kit helps to cleanse your skin and restores the natural balance of the skin to keep it healthy. It provides nourishment to the root of skin and brings the natural glow out so that your skin looks softer and more radiant. This kit contains one Comfrey Cleanser Cum Toner, one Platinum Scrub, one Platinum Gel, one Platinum Cream, and one Platinum Pack.	1120.00	52	2018-04-05 00:00:00	\N	875	16
972	Medium Prawns	Sumeru Five Senses Medium Prawns is the choicest catch from the deep, fresh and hygienically packed. Fresh juicy prawns are wonderful for your curries.	225.00	38	2019-02-09 00:00:00	\N	2049	23
973	Stainless Steel Spices Bottle/Holder - Silver, BB 543	Complete your dining set to enhance the beauty of your dining table by placing this set of silver-coloured spice bottles. The bottles are small and perfect in size making it easy for you to organise the spices. The bottles are made using stainless steel, which is lightweight, durable and easy to handle. These bottles come with a stand for convenient and safe rotating. You can fill up these cute little bottles with salt and crushed black pepper. Great for the dining room, kitchen counter, picnic table, or office cafeteria.	389.00	91	2019-07-11 00:00:00	\N	2238	3
974	Organic - Chana Masala	Pure & Sure is a range of Certified Organic Foods Products from Phalada Agro, It is a natural step to extend our know-how and expertise of Organic food, to provide the consumer a healthy and delectable experience of Pure organic food, The ethos of the brand lies in the name itself which urges you to, Take a step towards a more healthy living,Unlike many others, Pure & Sure is a healthy result of a seamless effortof Phalada Agro which is involved throughout the supply chain, right from the development of Organic Agri-inputs to a nourishing finalproduct which reaches your kitchen, By choosing to go the organic way, heres how Pure & Sure contributes to your health No more chemical concoctions entering your body An authentic taste at all meals, A surge of vitamins, minerals, enzymes and other micro-nutrients adding to your health Preventing you from perilous Ingredients which may cause fatal diseases like cancer, respiratory problems and other major diseases, All of Phalada products are sourced directly from farmers and processed under hygienic condition in a GMP Certified Processing Facility with more than 10 years of experience.	65.00	70	2020-06-09 00:00:00	\N	1721	37
975	Body Bath Loofah/Sponge/Scrubber - Double Loop Hangable - Grey, BH011GRY	BB Home presents this multi-coloured loofah scrubber for hard to reach body parts. It is perfect for cleaning the back, neck, feet etc. Just hold the loofah from the ends and gently scrub your body. It improves your skin's blood circulation and eliminates dead skin cells. The loofah is composed of cloth fibres that exfoliate the skin, resulting in smooth and glowing skin. Care Instruction: - Do not use harsh chemicals to clean.	219.00	35	2021-11-05 00:00:00	\N	1331	16
976	Fibre Rich Muesli For Breakfast + Cranberry Blueberry Muesli Fibre (each 1kg)	No Added Sugar Muesli 1kg\nTrue Elements brings to you No Added Sugar Muesli that is loaded with health benefits and nutrients. It is 100% natural, free from any chemicals or preservatives and best-selected ingredients. It is a very crunchy breakfast treat. This muesli is rich in whole grains and seeds. It is a great source of protein, fibre, and nutrients. It is great for your health. Enjoy it with milk, yoghurt or curd and top it off with fruits or seeds of your choice.\nBenefits:\n\nIt is loaded with many health benefits and nutrients.\nIt is a great healthy snack option.\nIt is a great source of protein, fibre, and nutrients.\nIt is 100% natural and made of high quality.\n\nCranberry and Blueberry Muesli 1kg\nTrue Elements brings to you Cranberry And Blueberry Muesli that is loaded with health benefits and nutrients. It is 100% natural, free from any chemicals or preservatives and best-selected ingredients. It is a very crunchy breakfast treat. It contains whole grains oats, dried fruits and nuts etc. It is enhanced with the sweetness of luscious blueberries, tangy flavour of cranberries. This muesli is rich in whole grains and seeds. It is a great source of protein, fibre, extremely rich in vitamins and minerals. It is great for your health. Enjoy it with milk, yoghurt or curd and top it off with fruits or seeds of your choice.\nBenefits:\n\nIt is loaded with many health benefits and nutrients.\nIt is a great healthy snack option.\nIt is a great source of protein, fibre, extremely rich in vitamins and minerals.\nIt is 100% natural and made of high quality.	988.00	26	2019-10-05 00:00:00	\N	911	28
977	Immunity Booster Natural Remedial Drink	Immunity booster for the complete family. A potent mix of our Lakadong Turmeric and our Heirloom Chai ka Masala. This mix has therapeutic properties to increase immunity and clear chest congestion and sinus. It also helps indigestion.	395.00	25	2018-04-01 00:00:00	\N	741	21
978	Copper Bottle - Matt Finish, Duke, BBCB03	Now free your environment, and yourself from the unhealthy plastic bottles and get a healthier one-time product for all your needs. Copper is one of the metals that has the ability to kill bacteria and protects from health risk. Drinking water from Copper Bottles/Jugs creates a natural purification process. Water stored in a copper jug/ bottle, preferably overnight or at least for four hours, acquires a certain quality from the copper.  Drinking water in copper bottles may aid in weight loss and helps boost the immune system.	649.00	30	2020-07-12 00:00:00	\N	1331	15
979	Syrup	High Fructose Corn Syrup, Corn Syrup, Water, Cocoa, Sugar, Salt, Emulsifier, Vanillin, Artificial Flavour.	200.00	47	2019-03-10 00:00:00	\N	422	8
980	Microfiber Multipurpose Cloth	These microfiber cleaning cloths from Gala are an effective and reusable tool for cleaning your wet and dry household surfaces, its made of Polyester and Nylon which leaves no stains or marks on any gadgets.	140.00	96	2019-05-05 00:00:00	\N	770	22
981	Paste - Ginger & Garlic	Mothers Recipe Ginger Garlic Paste is guarantees that the paste comes to you in its tastiest appearance. And whenever you use it any dish you will get the unusual yummy tang of homemade paste. It has one of the most necessary ingredients in Indian cuisines it is additional to almost all non-veg dishes and some veg dishes like pulao biryani matar paneer chana masala etc.	68.25	51	2019-10-09 00:00:00	\N	1351	15
982	Sugar/Sakkare - Refined	Madhur sugar is pure, hygienic and meets international standards. It is available in small and medium crystal sizes packed in 1kg and 5kg quantity.\nMadhur has brought together knowledge of sweetening passion to develop a product that is untouched by hand for the consumers.\nFrom the morning cuppa, the favourite cake and the special recipe, we make it better. No matter what the occasion is we are there with a brand you know and trust.	234.00	94	2020-04-04 00:00:00	\N	2180	38
983	Namkeen - Lite Chiwda	Haldirams brings to you Lite Chiwda which is also known as diet chiwda. It is spicy, really crispy, slightly tangy and very tasty. It is made with rice flakes, gram flour and flavourful spices. A perfect delightful snack that can be enjoyed with tea or as a evening snack. It is a great healthy snack option. Satisfy your taste buds with something crispy and traditional yet healthy. It is a zingy, light and perfect snack. It does not contain artificial colours or preservatives.	10.00	12	2021-07-04 00:00:00	\N	2278	13
984	Men Expert White Activ Intensive Whitening Foam	LOreal Men Expert White Activ intensive whitening foam has a special pro-exfoliating formula which helps men in removing the dead cells from their skins, thus leaving it luminous and bright. It uses effective ingredients that act as good peeling agents. It not only smoothes out irregularities but also helps in stimulating a healthy dead skin-cell removal routine. This face wash not only helps whiten the skin fair but also removes dirt or makeup. It removes all impurities from the skin.	499.00	80	2019-12-11 00:00:00	\N	1851	30
985	Shai Mix	Marudhar brings to you premium quality refreshing and flavoursome mouth fresheners. 100% Natural, Immunity Boosting & Rich in Anti Oxidants. Helps in Digestion & improves stomach health. Relish the delicious combination of sweet and mint in every bite that will refresh your mouth. Delicious & Tasty Mukhwas Mouth freshener, prepared using the most high-quality ingredients in hygienic condition to ensure better quality & authentic flavour.	131.75	44	2019-06-01 00:00:00	\N	1530	33
986	Menthol Cool 500 ml + Laundry San- Fresh Linen 480 ml	Dettol Disinfectant Multipurpose Liquid cleaner provides protection to you and your family against illness-causing germs and Coronavirus causing COVID19 virus. Proven to be >99.9% effective at inactivating SARS-CoV-2, the virus that causes COVID19, when used at 1:12 dilutions with 5 minutes contact time when tested under dirty conditions; As per standard testing protocol. This disinfectant liquid sanitizes your home and also helps maintain your personal hygiene. It can be used in bath, laundry, floor and surface cleaning, leaving everything clean and fresh. This multipurpose disinfectant cleaner for home is recommended by the Indian Medical Association.\n Keeping your laundry clean and germ-free every day requires a lot of pain and effort but Dettol Laundry Sanitizer makes hygienically cleaning your clothes an easy task. This clothes sanitizer eliminates bacteria that breed on synthetic fabrics and keep increasing from the excessive oil present in human skin. These are illness-causing germs and should be removed for a healthy and safe living. The clothes conditioner is gentle on clothes and freshens them with a delightful fresh linen fragrance. Use it as a winter clothes sanitizer to kill germs and give your family the trusted protection of Dettol. The laundry liquid sanitizer is recommended by the Indian Medical Association (IMA).Dettol has a wide range of products to protect your family against germs. Explore other products from Dettol: Handwash, Hand Sanitizer, Soaps, Bodywash, Antiseptic Liquid, Disinfectant Cleaner, Disinfectant Spray, Anti-pollution Mask and Laundry Sanitizer.	309.60	96	2018-04-02 00:00:00	\N	1876	1
987	Daily Face Care Lotion Oil Balance - Combination To Normal Skin	A clay-based lotion which provides Oil Balance for up-to 8-hrs through its unique 3-way action to give you a soft and supple skin every day without drying out your skinflint Calamine Oil Balance Lotion provides oil balance through its unique Kaolin Clay Therapy and 3-way action.	117.00	17	2021-01-10 00:00:00	\N	1626	16
988	Nano Sun Block Sun Protective Cream Spf 60	This superior sun block product is a perfect combination of the highly advanced nanotechnology and organic ingredients. SPF 60, it is specially designed for sun-sensitive skin, offering total broad spectrum protection from the sun’s harmful UV rays. Containing castor oil, manjeet, cucumber seeds, padmakha, sunflower oil, zinc oxide and titanium dioxide, it delivers a surge of moisture into the skin’s deeper layers, removing tan and gradually lightening skin colour. This waterproof formulation, with a matte, non-greasy finish, is easily absorbed, leaving the skin soft, supple, radiant and youthful.	455.00	93	2019-12-03 00:00:00	\N	1471	22
989	Women Well Being Capsules	These Women Well Being (WWB) Capsules are a herbal women health supplement which cares for women at all stages of their life-restores and balances the hormone system from puberty to menopause.	210.00	35	2020-03-07 00:00:00	\N	460	3
990	Men Expert Hydra Power Duo Foam Cleanser	Detoxifying Anti-Roughness, the foam deeply cleanses and purifies the skin, which leaves a comfortable feeling without tightness. French Mountain Water purifies skin and efficiently removes impurities, dirt and pollution. G-Cyclic Resurfacing Complex TM instantly hydrates skin, removes dead skin cells, and smooth skin texture	367.54	53	2019-12-05 00:00:00	\N	1851	11
991	Bounce Biscuits - Orange Creme	Deliciously creamy and deliciously fun - Sunfeast Bounce. These biscuits are available in four tasty flavours- Chocolate, Orange, Elaichi and Pineapple. The flavoured biscuit shell encasing the soft creamy centre transports you to a world of fun and excitement!	27.00	93	2020-01-04 00:00:00	\N	213	29
992	Organic - Parmal Rice	Rice Parmal is long grain (6.8 - 7.2 mm Length) cylindrical double polished, non-sticky, creamy white, dry and fine-textured rice. As our variety of Rice Parmal has a marked degree of natural aroma, high culinary properties and good nutritional content, it is popular as consumer’s choice of rice.	424.15	28	2021-01-02 00:00:00	\N	2281	40
993	Chicken Classic Salami	At La Carne, we take pride in offering products of high quality. La Carne brings to you the authentic taste of premium Chicken Products. Quick Freezing technology used to preserve all the goodness and freshness inside. Made with lean ground chicken with low fat. Traditional Chicken Salami serves as anytime snack. Perfect snack or Salad combo for any meal of the day.	140.00	4	2021-06-01 00:00:00	\N	2066	27
994	EDT Spray - Sport Style For Men	Brut SPORT was launched in 1986 as an elegant fragrance. A high musk fragrance for men stays with you whole day. Base notes are made with a blend of tonka & leather musk. Its an Actual SPORT!  For Beauty tips, tricks & more visit https://bigbasket.blog/	595.00	92	2020-05-10 00:00:00	\N	1033	34
996	W3 Perfume Spray - For Women	Engage W3 Perfume Spray is fresh that helps open your day on a refreshing note. It also has fruity-floral scent with clean and crisp elements of apple and lime that keeps you fresh all through the day. It consists of refreshing and long lasting fragrance. It gives you full protection against odour and sweat by keeping you refreshed. The spray is easy to use and apply. It keeps you feeling fresh all day long. It accompanies all the occasions be it a party, a business meeting or a date. Strike an impression with this spray.	250.90	24	2022-01-01 00:00:00	\N	141	29
26557	pildoras para dormirr	solo se venden bajo preescripcion medica	25.00	89	2023-01-20 00:00:00	2023-02-08 00:00:00	383	8
1000	cargador de celularrr	entrada tipo c	78.00	150	2023-01-25 00:00:00	\N	383	8
1003	celular	gama media	78.00	150	2023-02-03 00:00:00	\N	383	8
1004	mouse	inalambricos	78.00	260	2023-02-03 00:00:00	\N	383	8
1002	celular	gama media	78.00	150	2023-01-25 00:00:00	\N	383	8
1005	mouse	inalambricos	78.00	260	2023-02-03 00:00:00	\N	383	8
1006	mouse	inalambricos	100.00	260	2023-02-03 00:00:00	\N	383	8
1007	mouse	inalambricos	78.00	260	2023-02-03 00:00:00	\N	383	8
1008	mouse	gama media	78.00	260	2023-02-03 00:00:00	\N	383	8
1009	mouse	gama media	78.00	260	2023-02-03 00:00:00	\N	383	8
1010	mouse2	gama media	78.00	260	2023-02-03 00:00:00	\N	383	8
1012	monitor	23 pulgadas	200.00	100	2023-02-03 00:00:00	\N	383	8
1035	botellas	de plastico	3.00	5	2023-02-08 00:00:00	2023-02-13 00:00:00	975	9
1038	toma todos	material plastico	8.00	7	2023-02-13 00:00:00	\N	2094	15
1013	televisores	tactiles	150.00	155	2023-02-06 00:00:00	\N	293	15
1014	televisores	tactiles	150.00	155	2023-02-06 00:00:00	\N	712	9
1015	televisores	tactiles	150.00	155	2023-02-06 00:00:00	\N	712	9
1016	televisores	pantallas tactil	1500.00	185	2023-02-06 00:00:00	\N	1102	11
1017	asdf	asdfd	5.00	6	2023-02-06 00:00:00	\N	1186	2
1018	televisores	pantallas planas	7.00	6	2023-02-06 00:00:00	\N	712	11
1019	computadoras	portatiles	3.00	3	2023-02-06 00:00:00	\N	1102	10
1020	lo que sea 	tambien	3.00	5	2023-02-07 00:00:00	\N	975	12
1022	mouses	inaamlaambricos	4.00	4	2023-02-08 00:00:00	\N	712	10
928	Himalayan Raw Apple Cider Vinegarrrr	Dabur presents a 100% natural, unfiltered, undiluted & unpasteurized Apple Cider Vinegar with genuine mother of Vinegar content. It is made by fermenting the real apple juice, extracted from the finest of Himalayan apples, in order to obtain maximum health & wellness benefits. It is naturally rich in antioxidants and contains no added colours or preservatives.\nThis apple cider vinegar has numerous health and wellness benefits like it helps in boosting immunity, promotes healthy liver, improves digestion and metabolism, assists in managing weight, and healthy lipid levels. It is can be used as a preservative. Apart from this it serves as the nourishment for dry scalp and makes your skin and hair, glow and shine. It also has beneficial effects for sore throat, teeth whitening & bad breath.	296.00	25	2018-09-05 00:00:00	2023-02-08 00:00:00	1186	16
1026	cargador	tres entradas	6.00	5	2023-02-08 00:00:00	\N	1111	12
1031	microfonos	asdfsdf	4.00	4	2023-02-08 00:00:00	\N	712	10
1039	tripodes	solo tienen dos patas	9.00	8	2023-02-13 00:00:00	\N	1186	2
1028	productossss	asdfsdf	4.00	5	2023-02-08 00:00:00	2023-02-08 00:00:00	975	11
1029	nuevo nombre	asdfdf	3.00	3	2023-02-08 00:00:00	2023-02-08 00:00:00	561	8
1021	teclados 222	lizos	4.00	6	2023-02-07 00:00:00	2023-02-08 00:00:00	1186	3
1033	aaaaaaaa	asdfds	3.00	4	2023-02-08 00:00:00	2023-02-08 00:00:00	1186	6
1036	focos 	bajo consumo	6.00	4	2023-02-08 00:00:00	2023-02-08 00:00:00	975	9
1037	coca cola	cero azucas	6.00	7	2023-02-13 00:00:00	\N	1533	8
\.


--
-- Data for Name: producto_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto_categoria (id, producto_id, categoria_id) FROM stdin;
23	35	4
26	25	4
28	27	3
31	30	8
32	31	11
33	32	9
34	33	8
35	34	11
36	36	10
37	37	10
38	38	8
39	39	8
40	40	3
41	41	8
42	42	8
43	43	6
44	44	4
45	45	6
46	46	10
47	47	8
48	58	8
49	48	7
50	49	6
51	50	3
52	51	10
53	52	6
54	53	8
55	54	3
56	55	6
57	56	8
59	59	1
60	60	7
61	61	4
62	62	4
63	63	6
64	64	3
65	65	8
66	66	8
67	67	4
68	68	8
69	69	10
70	70	4
71	71	8
72	72	8
73	73	8
74	74	6
75	75	4
77	77	4
78	78	8
79	79	6
80	80	8
81	81	3
82	82	6
83	83	10
84	84	6
85	97	8
86	271	8
87	85	7
88	86	4
89	87	6
90	88	7
91	89	8
92	90	2
93	91	8
94	92	4
95	93	9
96	94	3
97	95	4
98	96	8
99	98	8
100	99	8
101	100	1
102	101	10
103	102	6
104	103	8
105	104	8
106	105	3
107	106	4
108	107	11
109	108	8
110	109	4
111	110	1
112	111	7
113	112	8
114	113	10
115	114	6
116	115	8
117	116	2
118	117	11
119	118	4
120	119	4
121	120	9
122	121	4
123	122	7
124	123	2
125	124	4
126	125	10
127	126	4
128	424	8
129	127	3
130	128	8
131	129	8
132	130	4
133	131	3
134	132	2
135	133	2
136	134	3
137	135	6
138	136	4
139	137	6
140	138	6
141	139	3
142	140	4
143	141	4
144	142	10
145	143	10
146	144	3
147	145	10
148	146	9
149	147	6
150	148	3
151	149	6
152	150	4
153	151	4
154	152	8
155	153	4
156	154	6
157	155	8
158	156	6
159	157	6
160	158	4
161	159	6
162	160	8
163	161	7
164	162	4
165	163	8
166	164	8
167	165	6
168	166	1
169	167	7
170	168	6
171	501	1
172	169	3
173	170	4
174	171	11
175	172	8
176	173	8
177	174	1
178	175	8
179	176	8
180	177	8
181	178	8
182	179	8
183	180	4
184	181	2
185	182	10
186	183	10
187	184	7
188	185	8
189	186	3
190	187	8
191	188	3
192	202	8
193	203	8
194	189	8
195	190	4
196	191	4
197	192	8
198	193	8
199	194	9
200	195	6
201	196	7
202	197	2
203	198	7
204	199	6
205	200	6
206	201	3
207	514	8
208	204	10
209	205	8
210	206	3
211	207	8
212	208	8
213	209	4
214	210	9
215	211	8
216	212	8
217	213	8
218	214	6
219	215	2
220	216	9
221	217	3
222	218	10
223	219	3
224	220	1
225	221	2
226	222	7
227	223	2
228	224	10
229	225	8
230	226	2
231	227	8
232	240	8
233	228	4
234	229	4
235	230	8
236	231	8
237	232	3
238	233	2
239	234	6
240	235	4
241	236	3
242	237	6
243	238	4
244	239	9
245	241	5
246	242	6
247	243	6
248	244	4
249	245	3
250	246	8
251	247	8
252	248	8
253	249	4
254	250	3
255	251	8
256	252	8
257	253	4
258	270	8
259	254	8
260	255	8
261	256	6
262	257	8
263	258	4
264	259	10
265	260	8
266	261	5
267	262	8
268	263	8
269	264	6
270	265	3
271	266	10
272	267	10
273	268	8
274	269	4
275	272	3
276	273	6
277	274	4
278	275	7
279	276	8
280	277	8
281	278	7
282	279	2
283	280	6
284	281	8
285	282	10
286	283	1
287	284	8
288	295	7
289	285	8
290	286	8
291	287	3
292	288	10
293	289	6
294	290	3
295	291	6
296	292	8
297	293	8
298	294	5
299	296	4
300	297	3
301	298	6
302	299	8
303	300	6
304	301	6
305	302	10
306	303	3
307	304	8
308	305	8
309	306	6
310	307	4
311	308	6
312	309	4
313	310	8
314	311	6
315	312	4
316	313	10
317	314	5
318	315	8
319	316	1
320	317	4
321	318	5
322	319	8
323	320	8
324	438	7
325	321	11
326	322	6
327	323	7
328	324	8
329	325	4
330	326	4
331	327	8
332	328	4
333	329	7
334	330	11
335	331	3
336	332	6
337	333	3
338	334	2
339	335	6
340	336	3
341	337	6
342	338	8
343	339	9
344	340	3
345	341	8
346	342	8
347	343	4
348	344	8
349	345	8
350	346	8
351	347	6
352	348	4
353	349	8
354	350	6
355	351	2
356	352	6
357	353	6
358	354	6
359	355	8
360	356	8
361	357	8
362	358	1
363	359	10
364	360	8
365	361	3
366	362	6
367	363	10
368	364	4
369	365	4
370	366	5
371	367	3
372	368	1
373	369	3
374	370	5
375	382	6
376	371	6
377	372	9
378	373	6
379	374	6
380	375	3
381	376	6
382	377	7
383	378	10
384	379	11
385	380	6
386	381	8
387	383	11
388	384	8
389	385	6
390	386	11
391	387	6
392	388	7
393	389	8
394	390	8
395	391	6
396	392	6
397	393	6
398	394	8
399	395	9
400	396	10
401	397	10
402	398	3
403	399	4
404	400	9
405	401	6
406	402	8
407	403	4
408	404	8
409	405	3
410	406	6
411	407	6
412	408	8
413	409	8
414	410	4
415	411	7
416	412	8
417	413	8
418	414	4
419	415	8
420	416	7
421	417	4
422	418	2
423	419	8
424	420	8
425	421	10
426	422	4
427	423	3
428	425	4
429	426	8
430	427	8
431	428	7
432	429	10
433	430	9
434	431	3
435	432	10
436	433	8
437	434	4
438	435	2
439	436	6
440	437	7
441	439	8
442	440	7
443	441	4
444	442	4
445	443	6
446	444	11
447	445	8
448	446	3
449	459	4
450	460	10
451	461	8
452	447	4
453	448	8
454	449	6
455	450	8
456	451	7
457	452	8
458	453	8
459	454	8
460	455	10
461	456	2
462	457	10
463	458	6
464	462	4
465	463	8
466	464	4
467	465	6
468	466	3
469	467	7
470	468	10
471	469	8
472	470	6
473	471	6
474	472	8
475	473	4
476	474	3
477	475	3
478	476	10
479	477	8
480	478	8
481	479	7
482	480	3
483	481	8
484	482	6
485	483	6
486	484	7
487	485	7
488	486	8
489	487	10
490	488	7
491	489	6
492	490	8
493	491	8
494	492	10
495	493	8
496	494	10
497	495	6
498	496	8
499	497	8
500	498	5
501	499	8
502	500	6
503	502	11
504	503	3
505	504	6
506	505	8
507	506	8
508	507	6
509	508	8
510	509	4
511	510	6
512	511	7
513	512	1
514	513	2
515	515	8
516	516	10
517	517	8
518	518	9
519	519	6
520	520	6
521	521	8
522	522	6
523	523	10
524	524	6
525	525	8
526	526	8
527	527	10
528	589	1
529	528	7
530	529	6
531	530	7
532	531	3
533	532	8
534	533	6
535	534	8
536	535	6
537	536	3
538	537	3
539	538	6
540	539	6
541	540	4
542	541	1
543	542	8
544	543	4
545	544	10
546	545	8
547	546	7
548	547	7
549	548	6
550	549	6
551	550	7
552	652	7
553	551	4
554	552	3
555	553	6
556	554	8
557	555	8
558	556	7
559	557	8
560	558	4
561	559	6
562	560	8
563	561	3
564	562	2
565	563	11
566	564	8
567	565	5
568	566	8
569	567	8
570	568	4
571	569	6
572	570	3
573	571	8
574	572	7
575	573	7
576	574	6
577	575	11
578	576	7
579	577	7
580	772	4
581	578	8
582	579	11
583	580	6
584	581	8
585	582	6
586	583	8
587	584	6
588	585	6
589	586	4
590	587	10
591	588	6
592	590	9
593	591	8
594	592	4
595	593	9
596	594	6
597	595	6
598	596	10
599	597	3
600	598	6
601	599	6
602	600	9
603	601	7
604	602	8
605	603	8
606	604	3
607	605	8
608	606	3
609	607	4
610	608	7
611	609	7
612	610	3
613	611	5
614	612	8
615	613	8
616	614	6
617	615	6
618	616	8
619	617	11
620	618	11
621	619	4
622	620	7
623	621	8
624	622	8
625	623	6
626	624	9
627	625	9
628	626	8
629	627	4
630	628	4
631	650	6
632	629	8
633	630	1
634	631	8
635	632	8
636	633	10
637	634	6
638	635	6
639	636	3
640	637	6
641	638	6
642	639	10
643	651	4
644	640	6
645	641	8
646	642	8
647	643	8
648	644	7
649	645	7
650	646	4
651	647	6
652	648	6
653	649	4
654	653	10
655	654	10
656	655	3
657	656	8
658	657	3
659	658	6
660	659	8
661	660	4
662	661	8
663	662	3
664	663	6
665	664	6
666	676	4
667	665	7
668	666	3
669	667	7
670	668	6
671	669	3
672	670	4
673	671	4
674	672	3
675	673	8
676	674	4
677	675	7
678	677	7
679	678	7
680	679	10
681	680	3
682	681	8
683	682	4
684	683	4
685	684	1
686	697	10
687	698	3
688	685	8
689	686	1
690	687	3
691	688	9
692	689	6
693	690	8
694	691	5
695	692	8
696	693	6
697	694	7
698	695	6
699	696	2
700	699	3
701	700	7
702	701	8
703	702	8
704	703	4
705	704	7
706	705	6
707	706	3
708	707	10
709	708	3
710	709	4
711	710	6
712	711	6
713	712	4
714	713	3
715	714	10
716	715	4
717	716	8
718	717	11
719	718	3
720	719	6
721	720	6
722	721	8
723	722	7
724	723	8
725	769	11
726	724	8
727	725	8
728	726	6
729	727	3
730	728	8
731	729	10
732	730	8
733	731	10
734	732	7
735	733	6
736	734	8
737	735	4
738	736	11
739	737	4
740	738	10
741	739	4
742	740	6
743	741	7
744	742	10
745	743	10
746	744	6
747	745	3
748	746	4
749	747	4
750	748	9
751	749	8
752	770	7
753	750	6
754	751	4
755	752	4
756	753	8
757	754	8
758	755	6
759	756	8
760	757	3
761	758	8
762	771	8
763	759	6
764	760	1
765	761	8
766	762	6
767	763	8
768	764	3
769	765	10
770	766	5
771	767	8
772	768	2
773	773	10
774	774	3
775	775	3
776	776	8
777	777	8
778	778	8
779	779	3
780	780	8
781	781	6
782	782	8
783	783	4
784	784	8
785	785	8
786	795	10
787	796	11
788	797	7
789	786	6
790	787	10
791	788	10
792	789	8
793	790	4
794	791	8
795	792	6
796	793	6
797	794	8
798	798	6
799	799	6
800	800	6
801	801	1
802	802	8
803	803	3
804	804	6
805	805	4
806	806	8
807	807	10
808	808	4
809	809	10
810	810	7
811	811	4
812	812	6
813	813	4
814	814	11
815	815	3
816	816	8
817	817	3
818	818	7
819	819	3
820	820	7
821	821	5
822	879	6
823	822	8
824	823	3
825	824	4
826	825	4
827	826	4
828	827	3
829	828	10
830	829	6
831	830	7
832	831	4
833	867	7
834	832	8
835	833	6
836	834	8
837	835	11
838	836	3
839	837	4
840	838	2
841	839	1
842	840	8
843	841	6
844	842	5
845	843	8
846	880	8
847	844	3
848	845	10
849	846	11
850	847	10
851	848	4
852	849	8
853	850	8
854	851	6
855	852	11
856	853	7
857	854	7
858	855	2
859	945	3
860	856	8
861	857	6
862	858	7
863	859	8
864	860	8
865	861	3
866	862	4
867	863	6
868	864	7
869	865	8
870	866	8
871	868	3
872	869	7
873	870	3
874	871	10
875	872	8
876	873	6
877	874	3
878	875	8
879	876	6
880	877	6
881	878	8
882	997	3
883	881	6
884	882	6
885	883	10
886	884	8
887	885	4
888	886	6
889	887	8
890	888	8
891	889	1
892	890	6
893	891	10
894	892	7
895	893	3
896	894	8
897	998	3
898	895	10
899	896	8
900	897	8
901	898	3
902	899	3
904	901	6
905	902	7
906	903	10
907	904	10
908	905	8
909	906	6
910	907	10
911	908	8
912	909	6
913	910	8
914	911	7
915	912	3
916	913	6
917	914	10
918	915	10
919	916	4
920	917	7
921	918	4
922	919	8
923	920	5
924	921	8
925	922	8
926	923	3
927	924	4
928	925	7
929	926	6
930	927	4
931	928	3
932	929	8
933	930	8
934	931	4
935	932	6
936	933	8
937	934	8
938	935	8
939	936	4
940	937	3
941	938	1
942	939	4
943	940	1
944	941	1
945	942	8
946	943	2
947	944	9
948	946	4
949	947	10
950	948	6
951	949	8
952	950	6
953	951	6
954	952	8
955	953	7
956	954	4
957	955	4
958	956	8
959	957	3
960	958	6
961	959	7
962	960	10
963	961	9
964	962	3
965	963	8
966	964	4
967	965	9
968	966	7
969	967	4
970	968	8
971	969	4
972	970	2
973	971	8
974	972	3
975	973	4
976	974	10
977	975	4
978	976	6
979	977	6
980	978	4
981	979	6
982	980	7
983	981	10
984	982	10
985	983	3
986	984	8
987	985	10
988	986	7
989	987	8
990	988	8
991	989	8
992	990	8
993	991	3
994	992	10
995	993	5
996	994	8
997	995	8
998	996	8
1022	35	53
1025	25	33
1027	27	20
1030	30	26
1031	31	23
1032	32	92
1033	33	51
1034	34	59
1035	36	86
1036	37	86
1037	38	51
1038	39	98
1039	40	89
1040	41	51
1041	42	37
1042	43	65
1043	44	22
1044	45	19
1045	46	54
1046	47	98
1047	58	15
1048	48	74
1049	49	48
1050	50	39
1051	51	86
1052	52	82
1053	53	98
1054	54	89
1055	55	19
1056	56	26
1058	59	80
1059	60	34
1060	61	33
1061	62	42
1062	63	48
1063	64	41
1064	65	15
1065	66	26
1066	67	42
1067	68	68
1068	69	86
1069	70	42
1070	71	68
1071	72	26
1072	73	26
1073	74	60
1074	75	53
1076	77	33
1077	78	37
1078	79	60
1079	80	68
1080	81	45
1081	82	97
1082	83	54
1083	84	12
1084	97	57
1085	271	40
1086	85	50
1087	86	35
1088	87	12
1089	88	28
1090	89	37
1091	90	100
1092	91	40
1093	92	13
1094	93	25
1095	94	45
1096	95	22
1097	96	51
1098	98	37
1099	99	26
1100	100	46
1101	101	85
1102	102	36
1103	103	15
1104	104	37
1105	105	41
1106	106	53
1107	107	23
1108	108	15
1109	109	13
1110	110	31
1111	111	28
1112	112	26
1113	113	54
1114	114	60
1115	115	26
1116	116	84
1117	117	59
1118	118	22
1119	119	42
1120	120	92
1121	121	13
1122	122	93
1123	123	67
1124	124	53
1125	125	85
1126	126	53
1127	424	15
1128	127	45
1129	128	26
1130	129	40
1131	130	35
1132	131	41
1133	132	84
1134	133	55
1135	134	89
1136	135	19
1137	136	35
1138	137	36
1139	138	65
1140	139	43
1141	140	53
1142	141	22
1143	142	54
1144	143	66
1145	144	39
1146	145	86
1147	146	94
1148	147	36
1149	148	20
1150	149	99
1151	150	35
1152	151	35
1153	152	68
1154	153	35
1155	154	60
1156	155	57
1157	156	36
1158	157	99
1159	158	53
1160	159	36
1161	160	26
1162	161	93
1163	162	35
1164	163	15
1165	164	37
1166	165	82
1167	166	58
1168	167	34
1169	168	60
1170	501	46
1171	169	43
1172	170	53
1173	171	77
1174	172	26
1175	173	15
1176	174	46
1177	175	26
1178	176	26
1179	177	37
1180	178	37
1181	179	40
1182	180	81
1183	181	55
1184	182	29
1185	183	86
1186	184	74
1187	185	26
1188	186	43
1189	187	26
1190	188	43
1191	202	51
1192	203	51
1193	189	40
1194	190	13
1195	191	42
1196	192	26
1197	193	26
1198	194	56
1199	195	60
1200	196	71
1201	197	52
1202	198	34
1203	199	97
1204	200	36
1205	201	83
1206	514	26
1207	204	54
1208	205	26
1209	206	43
1210	207	68
1211	208	26
1212	209	33
1213	210	92
1214	211	40
1215	212	37
1216	213	15
1217	214	99
1218	215	67
1219	216	25
1220	217	41
1221	218	86
1222	219	89
1223	220	46
1224	221	84
1225	222	90
1226	223	84
1227	224	86
1228	225	26
1229	226	52
1230	227	37
1231	240	26
1232	228	13
1233	229	22
1234	230	40
1235	231	37
1236	232	89
1237	233	100
1238	234	36
1239	235	53
1240	236	45
1241	237	60
1242	238	81
1243	239	25
1244	241	32
1245	242	60
1246	243	36
1247	244	35
1248	245	41
1249	246	40
1250	247	26
1251	248	37
1252	249	13
1253	250	43
1254	251	51
1255	252	26
1256	253	21
1257	270	51
1258	254	26
1259	255	40
1260	256	65
1261	257	40
1262	258	33
1263	259	54
1264	260	37
1265	261	27
1266	262	26
1267	263	40
1268	264	82
1269	265	88
1270	266	86
1271	267	86
1272	268	37
1273	269	53
1274	272	43
1275	273	36
1276	274	35
1277	275	74
1278	276	51
1279	277	40
1280	278	78
1281	279	84
1282	280	36
1283	281	26
1284	282	64
1285	283	58
1286	284	51
1287	295	93
1288	285	26
1289	286	37
1290	287	49
1291	288	64
1292	289	48
1293	290	89
1294	291	82
1295	292	26
1296	293	98
1297	294	27
1298	296	22
1299	297	43
1300	298	82
1301	299	26
1302	300	99
1303	301	60
1304	302	72
1305	303	41
1306	304	15
1307	305	98
1308	306	36
1309	307	13
1310	308	82
1311	309	53
1312	310	51
1313	311	82
1314	312	33
1315	313	86
1316	314	27
1317	315	68
1318	316	58
1319	317	53
1320	318	27
1321	319	26
1322	320	26
1323	438	34
1324	321	77
1325	322	82
1326	323	90
1327	324	15
1328	325	35
1329	326	35
1330	327	40
1331	328	53
1332	329	50
1333	330	59
1334	331	20
1335	332	65
1336	333	20
1337	334	67
1338	335	19
1339	336	43
1340	337	60
1341	338	26
1342	339	75
1343	340	45
1344	341	26
1345	342	26
1346	343	22
1347	344	51
1348	345	15
1349	346	68
1350	347	99
1351	348	35
1352	349	15
1353	350	48
1354	351	84
1355	352	36
1356	353	48
1357	354	60
1358	355	68
1359	356	26
1360	357	15
1361	358	31
1362	359	86
1363	360	15
1364	361	24
1365	362	60
1366	363	54
1367	364	22
1368	365	42
1369	366	27
1370	367	39
1371	368	46
1372	369	20
1373	370	32
1374	382	65
1375	371	19
1376	372	25
1377	373	65
1378	374	60
1379	375	20
1380	376	17
1381	377	74
1382	378	64
1383	379	23
1384	380	12
1385	381	68
1386	383	23
1387	384	37
1388	385	36
1389	386	59
1390	387	60
1391	388	71
1392	389	40
1393	390	26
1394	391	48
1395	392	82
1396	393	48
1397	394	57
1398	395	25
1399	396	85
1400	397	54
1401	398	89
1402	399	22
1403	400	25
1404	401	99
1405	402	51
1406	403	13
1407	404	26
1408	405	20
1409	406	60
1410	407	60
1411	408	98
1412	409	37
1413	410	35
1414	411	28
1415	412	57
1416	413	26
1417	414	21
1418	415	26
1419	416	74
1420	417	21
1421	418	52
1422	419	98
1423	420	26
1424	421	86
1425	422	33
1426	423	89
1427	425	53
1428	426	51
1429	427	26
1430	428	74
1431	429	72
1432	430	25
1433	431	24
1434	432	86
1435	433	51
1436	434	22
1437	435	67
1438	436	82
1439	437	14
1440	439	26
1441	440	74
1442	441	35
1443	442	53
1444	443	99
1445	444	23
1446	445	37
1447	446	45
1448	459	35
1449	460	54
1450	461	26
1451	447	53
1452	448	15
1453	449	36
1454	450	68
1455	451	74
1456	452	15
1457	453	40
1458	454	40
1459	455	72
1460	456	67
1461	457	54
1462	458	60
1463	462	53
1464	463	51
1465	464	42
1466	465	36
1467	466	43
1468	467	71
1469	468	54
1470	469	37
1471	470	82
1472	471	36
1473	472	98
1474	473	81
1475	474	43
1476	475	89
1477	476	86
1478	477	15
1479	478	15
1480	479	90
1481	480	41
1482	481	37
1483	482	99
1484	483	48
1485	484	71
1486	485	34
1487	486	26
1488	487	54
1489	488	93
1490	489	48
1491	490	26
1492	491	40
1493	492	85
1494	493	40
1495	494	86
1496	495	48
1497	496	40
1498	497	40
1499	498	91
1500	499	26
1501	500	60
1502	502	44
1503	503	41
1504	504	65
1505	505	37
1506	506	15
1507	507	12
1508	508	40
1509	509	33
1510	510	60
1511	511	71
1512	512	46
1513	513	67
1514	515	37
1515	516	86
1516	517	68
1517	518	101
1518	519	60
1519	520	60
1520	521	37
1521	522	48
1522	523	86
1523	524	48
1524	525	40
1525	526	40
1526	527	86
1527	589	80
1528	528	90
1529	529	82
1530	530	34
1531	531	41
1532	532	26
1533	533	60
1534	534	98
1535	535	65
1536	536	83
1537	537	24
1538	538	97
1539	539	65
1540	540	76
1541	541	80
1542	542	26
1543	543	35
1544	544	86
1545	545	37
1546	546	90
1547	547	74
1548	548	60
1549	549	65
1550	550	34
1551	652	74
1552	551	13
1553	552	20
1554	553	65
1555	554	51
1556	555	26
1557	556	34
1558	557	40
1559	558	35
1560	559	19
1561	560	98
1562	561	43
1563	562	38
1564	563	59
1565	564	37
1566	565	32
1567	566	51
1568	567	40
1569	568	35
1570	569	60
1571	570	24
1572	571	51
1573	572	71
1574	573	78
1575	574	99
1576	575	59
1577	576	71
1578	577	34
1579	772	35
1580	578	68
1581	579	59
1582	580	82
1583	581	26
1584	582	99
1585	583	15
1586	584	36
1587	585	99
1588	586	42
1589	587	86
1590	588	12
1591	590	101
1592	591	26
1593	592	53
1594	593	25
1595	594	36
1596	595	65
1597	596	54
1598	597	43
1599	598	65
1600	599	60
1601	600	25
1602	601	90
1603	602	51
1604	603	40
1605	604	83
1606	605	98
1607	606	24
1608	607	53
1609	608	74
1610	609	93
1611	610	83
1612	611	27
1613	612	26
1614	613	26
1615	614	65
1616	615	60
1617	616	15
1618	617	23
1619	618	59
1620	619	53
1621	620	90
1622	621	37
1623	622	98
1624	623	82
1625	624	92
1626	625	92
1627	626	26
1628	627	53
1629	628	33
1630	650	17
1631	629	68
1632	630	31
1633	631	15
1634	632	40
1635	633	54
1636	634	60
1637	635	60
1638	636	89
1639	637	97
1640	638	36
1641	639	86
1642	651	53
1643	640	82
1644	641	40
1645	642	98
1646	643	40
1647	644	34
1648	645	74
1649	646	35
1650	647	36
1651	648	82
1652	649	42
1653	653	66
1654	654	86
1655	655	49
1656	656	51
1657	657	49
1658	658	48
1659	659	26
1660	660	53
1661	661	26
1662	662	39
1663	663	97
1664	664	36
1665	676	42
1666	665	93
1667	666	24
1668	667	34
1669	668	36
1670	669	45
1671	670	22
1672	671	33
1673	672	43
1674	673	37
1675	674	33
1676	675	78
1677	677	93
1678	678	74
1679	679	54
1680	680	20
1681	681	40
1682	682	35
1683	683	53
1684	684	30
1685	697	86
1686	698	43
1687	685	26
1688	686	31
1689	687	83
1690	688	75
1691	689	82
1692	690	98
1693	691	27
1694	692	40
1695	693	82
1696	694	93
1697	695	12
1698	696	100
1699	699	24
1700	700	34
1701	701	40
1702	702	26
1703	703	53
1704	704	34
1705	705	60
1706	706	45
1707	707	54
1708	708	89
1709	709	53
1710	710	60
1711	711	82
1712	712	53
1713	713	45
1714	714	54
1715	715	42
1716	716	40
1717	717	63
1718	718	45
1719	719	36
1720	720	60
1721	721	68
1722	722	90
1723	723	51
1724	769	59
1725	724	26
1726	725	26
1727	726	60
1728	727	39
1729	728	26
1730	729	64
1731	730	26
1732	731	64
1733	732	90
1734	733	97
1735	734	62
1736	735	53
1737	736	59
1738	737	13
1739	738	86
1740	739	53
1741	740	17
1742	741	50
1743	742	86
1744	743	86
1745	744	82
1746	745	49
1747	746	42
1748	747	35
1749	748	25
1750	749	68
1751	770	74
1752	750	12
1753	751	42
1754	752	53
1755	753	68
1756	754	51
1757	755	82
1758	756	40
1759	757	39
1760	758	15
1761	771	57
1762	759	99
1763	760	80
1764	761	26
1765	762	82
1766	763	57
1767	764	88
1768	765	54
1769	766	32
1770	767	15
1771	768	100
1772	773	54
1773	774	45
1774	775	24
1775	776	37
1776	777	37
1777	778	26
1778	779	24
1779	780	37
1780	781	48
1781	782	26
1782	783	13
1783	784	40
1784	785	37
1785	795	16
1786	796	23
1787	797	71
1788	786	48
1789	787	85
1790	788	54
1791	789	40
1792	790	35
1793	791	51
1794	792	36
1795	793	48
1796	794	40
1797	798	48
1798	799	48
1799	800	60
1800	801	31
1801	802	37
1802	803	20
1803	804	36
1804	805	35
1805	806	51
1806	807	86
1807	808	35
1808	809	66
1809	810	18
1810	811	53
1811	812	99
1812	813	35
1813	814	59
1814	815	43
1815	816	40
1816	817	41
1817	818	90
1818	819	43
1819	820	71
1820	821	32
1821	879	97
1822	822	26
1823	823	88
1824	824	35
1825	825	53
1826	826	35
1827	827	45
1828	828	86
1829	829	16
1830	830	90
1831	831	22
1832	867	50
1833	832	37
1834	833	99
1835	834	26
1836	835	23
1837	836	43
1838	837	35
1839	838	67
1840	839	46
1841	840	98
1842	841	36
1843	842	96
1844	843	26
1845	880	15
1846	844	49
1847	845	86
1848	846	23
1849	847	29
1850	848	22
1851	849	57
1852	850	26
1853	851	36
1854	852	59
1855	853	90
1856	854	34
1857	855	84
1858	945	89
1859	856	15
1860	857	60
1861	858	93
1862	859	40
1863	860	26
1864	861	89
1865	862	35
1866	863	65
1867	864	50
1868	865	37
1869	866	51
1870	868	43
1871	869	71
1872	870	41
1873	871	86
1874	872	98
1875	873	48
1876	874	20
1877	875	26
1878	876	82
1879	877	99
1880	878	26
1881	997	45
1882	881	99
1883	882	48
1884	883	54
1885	884	26
1886	885	81
1887	886	12
1888	887	68
1889	888	98
1890	889	80
1891	890	60
1892	891	86
1893	892	78
1894	893	43
1895	894	51
1896	998	88
1897	895	72
1898	896	26
1899	897	51
1900	898	20
1901	899	45
1903	901	60
1904	902	74
1905	903	72
1906	904	86
1907	905	40
1908	906	99
1909	907	86
1910	908	26
1911	909	60
1912	910	68
1913	911	90
1914	912	43
1915	913	17
1916	914	54
1917	915	86
1918	916	22
1919	917	90
1920	918	13
1921	919	26
1922	920	32
1923	921	57
1924	922	26
1925	923	41
1926	924	53
1927	925	93
1928	926	48
1929	927	22
1930	928	24
1931	929	68
1932	930	26
1933	931	35
1934	932	19
1935	933	40
1936	934	37
1937	935	15
1938	936	13
1939	937	45
1940	938	31
1941	939	33
1942	940	31
1943	941	31
1944	942	98
1945	943	67
1946	944	25
1947	946	53
1948	947	86
1949	948	48
1950	949	37
1951	950	36
1952	951	36
1953	952	15
1954	953	34
1955	954	35
1956	955	42
1957	956	26
1958	957	39
1959	958	48
1960	959	93
1961	960	86
1962	961	75
1963	962	88
1964	963	26
1965	964	35
1966	965	92
1967	966	71
1968	967	35
1969	968	26
1970	969	79
1971	970	55
1972	971	26
1973	972	88
1974	973	53
1975	974	54
1976	975	33
1977	976	17
1978	977	36
1979	978	22
1980	979	48
1981	980	71
1982	981	86
1983	982	29
1984	983	45
1985	984	98
1986	985	66
1987	986	74
1988	987	26
1989	988	26
1990	989	40
1991	990	26
1992	991	41
1993	992	54
1994	993	27
1995	994	98
1996	995	51
1997	996	51
\.


--
-- Data for Name: seccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seccion (id, codigo, descripcion, almacen_id) FROM stdin;
1	SEC 1	Seccion 1	2
2	SEC 2	Seccion 2	4
3	SEC 3	Seccion 3	1
4	SEC 4	Seccion 4	4
5	SEC 5	Seccion 5	1
6	SEC 6	Seccion 6	2
7	SEC 7	Seccion 7	3
8	SEC 8	Seccion 8	1
9	SEC 9	Seccion 9	3
10	SEC 10	Seccion 10	4
11	SEC 11	Seccion 11	2
12	SEC 12	Seccion 12	4
13	SEC 13	Seccion 13	1
14	SEC 14	Seccion 14	4
15	SEC 15	Seccion 15	4
16	SEC 16	Seccion 16	5
17	SEC 17	Seccion 17	1
18	SEC 18	Seccion 18	2
19	SEC 19	Seccion 19	3
20	SEC 20	Seccion 20	3
21	SEC 21	Seccion 21	3
22	SEC 22	Seccion 22	2
23	SEC 23	Seccion 23	5
24	SEC 24	Seccion 24	4
25	SEC 25	Seccion 25	2
26	SEC 26	Seccion 26	3
27	SEC 27	Seccion 27	4
28	SEC 28	Seccion 28	4
29	SEC 29	Seccion 29	3
30	SEC 30	Seccion 30	4
31	SEC 31	Seccion 31	1
32	SEC 32	Seccion 32	2
33	SEC 33	Seccion 33	1
34	SEC 34	Seccion 34	2
35	SEC 35	Seccion 35	1
36	SEC 36	Seccion 36	4
37	SEC 37	Seccion 37	3
38	SEC 38	Seccion 38	3
39	SEC 39	Seccion 39	2
40	SEC 40	Seccion 40	3
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, nombres, username, password, password_hash, access_token, auth_key) FROM stdin;
1	adrian lucas	adrian-lucas	123456	$2y$13$bzYuCSI6F8udpCuekio73.w9cdyy0dnEPyy8mPkpAD118AHnIGjua	Zr2esjVc8O58XLNKLeHDaMNZGk_vFUwV	\N
2	juan pablo	juanP	7898547	$2y$13$M4TgdzTaAcCfRxIvwjtIt.69WB5EPWyvKdewioVMgApcleCEuxOIi	-7lLYmdbXuH9OR19UwGC4dDJUpIcu9Vt	\N
4	rodrigo	rodri	789456	$2y$13$f66F.fMVOgsfMWPdGN3HqedlH/4zVsq9tBQElCUNxhqvl4svtp0zC	BTpNb6Q-7yoyC4qdtQsvAcKrakv3SaPH	\N
5	Ana Salguero	Anita	789456	$2y$13$2B/RKpt9PQdAev3r0oZ58uPbOi56Z5Al6hhun1jlsK4CVER3uJZ7G	KaC1XC1xS_fsAh0krHipCFqp69jcVcZ0	\N
6	belinda	i_belinda	123456	$2y$13$PKEgb2TkK0ijfXwpPhrBzukJEHUE.wcFsec7y5Le9Q4XjAKkmep6C	yfGDav8t89vDDOLNe14bHqm_55XLAoII	\N
7	mariana	mari	789456	$2y$13$uM4kVJmhFepCL068TNhrLe01JNQZepLg.6XEgKgDBMDSwc0IcU8iu	4kHAN0m8jwXM7k7uEixtGKlRANqlHtbz	\N
8	asdf	sdfdsf	qwer	$2y$13$A9whE9JrAI7QtuGbbc4.6eEJouY5zWElEYuCopHAUXCiXha7T5zAm	b0HyzzV1ClR3c1mvwEDJG8QBfGs_khyL	\N
10	post	put	get	$2y$13$8OdRz8M4I7eTP0li308aJ.onbtWD7poBS04aQSNCFmE0qzIPhFJey	q8UFegZ5OEQZs8qu_BVX5AMQdQquoLcT	\N
11	maria	marimar	789456	$2y$13$6TVYpGnP1JgnDHtSlGiYVu1EPb2LcxxfoH0Y0vf/qNNNs21VARudm	04oMV55T_PEFhmfUXsj-gXRi5yk13llW	\N
\.


--
-- Name: almacen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.almacen_id_seq', 5, true);


--
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 1, false);


--
-- Name: marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marca_id_seq', 1, false);


--
-- Name: producto_categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_categoria_id_seq', 2005, true);


--
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_id_seq', 1039, true);


--
-- Name: seccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seccion_id_seq', 42, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 11, true);


--
-- Name: almacen almacen_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.almacen
    ADD CONSTRAINT almacen_pk PRIMARY KEY (id);


--
-- Name: auth_assignment auth_assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_pkey PRIMARY KEY (item_name, user_id);


--
-- Name: auth_item_child auth_item_child_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_pkey PRIMARY KEY (parent, child);


--
-- Name: auth_item auth_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_pkey PRIMARY KEY (name);


--
-- Name: auth_rule auth_rule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_rule
    ADD CONSTRAINT auth_rule_pkey PRIMARY KEY (name);


--
-- Name: categoria categoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pk PRIMARY KEY (id);


--
-- Name: marca marca_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pk PRIMARY KEY (id);


--
-- Name: migration migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration
    ADD CONSTRAINT migration_pkey PRIMARY KEY (version);


--
-- Name: producto_categoria producto_categoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_categoria
    ADD CONSTRAINT producto_categoria_pk PRIMARY KEY (id);


--
-- Name: producto producto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pk PRIMARY KEY (id);


--
-- Name: seccion seccion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seccion
    ADD CONSTRAINT seccion_pk PRIMARY KEY (id);


--
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id);


--
-- Name: usuario usuario_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_un UNIQUE (username);


--
-- Name: idx-auth_assignment-user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx-auth_assignment-user_id" ON public.auth_assignment USING btree (user_id);


--
-- Name: idx-auth_item-type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "idx-auth_item-type" ON public.auth_item USING btree (type);


--
-- Name: auth_assignment auth_assignment_item_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_assignment
    ADD CONSTRAINT auth_assignment_item_name_fkey FOREIGN KEY (item_name) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_child auth_item_child_child_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_child_fkey FOREIGN KEY (child) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item_child auth_item_child_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item_child
    ADD CONSTRAINT auth_item_child_parent_fkey FOREIGN KEY (parent) REFERENCES public.auth_item(name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_item auth_item_rule_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_item
    ADD CONSTRAINT auth_item_rule_name_fkey FOREIGN KEY (rule_name) REFERENCES public.auth_rule(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: producto_categoria producto_categoria_categoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_categoria
    ADD CONSTRAINT producto_categoria_categoria_fk FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: producto_categoria producto_categoria_producto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_categoria
    ADD CONSTRAINT producto_categoria_producto_fk FOREIGN KEY (producto_id) REFERENCES public.producto(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: producto producto_marca_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_marca_fk FOREIGN KEY (marca_id) REFERENCES public.marca(id);


--
-- Name: producto producto_seccion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_seccion_fk FOREIGN KEY (seccion_id) REFERENCES public.seccion(id);


--
-- Name: seccion seccion_almacen_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seccion
    ADD CONSTRAINT seccion_almacen_fk FOREIGN KEY (almacen_id) REFERENCES public.almacen(id);


--
-- PostgreSQL database dump complete
--

