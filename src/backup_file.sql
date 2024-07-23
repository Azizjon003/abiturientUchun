--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

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
-- Name: RoleEnum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RoleEnum" AS ENUM (
    'ADMIN',
    'USER'
);


ALTER TYPE public."RoleEnum" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Direction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Direction" (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    first_science integer NOT NULL,
    second_science integer NOT NULL
);


ALTER TABLE public."Direction" OWNER TO postgres;

--
-- Name: Direction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Direction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Direction_id_seq" OWNER TO postgres;

--
-- Name: Direction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Direction_id_seq" OWNED BY public."Direction".id;


--
-- Name: Science; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Science" (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL
);


ALTER TABLE public."Science" OWNER TO postgres;

--
-- Name: Science_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Science_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Science_id_seq" OWNER TO postgres;

--
-- Name: Science_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Science_id_seq" OWNED BY public."Science".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    username text,
    name text,
    role public."RoleEnum" DEFAULT 'USER'::public."RoleEnum" NOT NULL,
    telegram_id text NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    working boolean DEFAULT false NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: general; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.general (
    id integer NOT NULL,
    univer_id integer NOT NULL,
    direction_id integer NOT NULL,
    lang_id integer NOT NULL,
    year_id integer NOT NULL,
    type_id integer NOT NULL,
    "grandBall" double precision NOT NULL,
    "kontraktBall" double precision NOT NULL,
    "kontraktPeople" integer NOT NULL,
    "grandPeople" integer NOT NULL
);


ALTER TABLE public.general OWNER TO postgres;

--
-- Name: general_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.general_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_id_seq OWNER TO postgres;

--
-- Name: general_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.general_id_seq OWNED BY public.general.id;


--
-- Name: lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lang (
    id integer NOT NULL,
    name text NOT NULL,
    univer_id integer NOT NULL,
    location text NOT NULL
);


ALTER TABLE public.lang OWNER TO postgres;

--
-- Name: lang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lang_id_seq OWNER TO postgres;

--
-- Name: lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lang_id_seq OWNED BY public.lang.id;


--
-- Name: request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.request (
    id text NOT NULL,
    user_id text NOT NULL,
    univer_name text NOT NULL,
    abiturient_id text,
    objects jsonb,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    type text
);


ALTER TABLE public.request OWNER TO postgres;

--
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    id integer NOT NULL,
    name text NOT NULL,
    univer_id integer NOT NULL,
    location text NOT NULL
);


ALTER TABLE public.type OWNER TO postgres;

--
-- Name: type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_id_seq OWNER TO postgres;

--
-- Name: type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_id_seq OWNED BY public.type.id;


--
-- Name: universities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universities (
    id integer NOT NULL,
    name text NOT NULL,
    location text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.universities OWNER TO postgres;

--
-- Name: universities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universities_id_seq OWNER TO postgres;

--
-- Name: universities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universities_id_seq OWNED BY public.universities.id;


--
-- Name: years; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.years (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.years OWNER TO postgres;

--
-- Name: years_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.years_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.years_id_seq OWNER TO postgres;

--
-- Name: years_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.years_id_seq OWNED BY public.years.id;


--
-- Name: Direction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Direction" ALTER COLUMN id SET DEFAULT nextval('public."Direction_id_seq"'::regclass);


--
-- Name: Science id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Science" ALTER COLUMN id SET DEFAULT nextval('public."Science_id_seq"'::regclass);


--
-- Name: general id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general ALTER COLUMN id SET DEFAULT nextval('public.general_id_seq'::regclass);


--
-- Name: lang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lang ALTER COLUMN id SET DEFAULT nextval('public.lang_id_seq'::regclass);


--
-- Name: type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type ALTER COLUMN id SET DEFAULT nextval('public.type_id_seq'::regclass);


--
-- Name: universities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities ALTER COLUMN id SET DEFAULT nextval('public.universities_id_seq'::regclass);


--
-- Name: years id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.years ALTER COLUMN id SET DEFAULT nextval('public.years_id_seq'::regclass);


--
-- Data for Name: Direction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Direction" (id, name, code, first_science, second_science) FROM stdin;
2284	Pediatriya ishi-Romitan tumani	60910300154	38	39
2285	Pediatriya ishi-Shofirkon tumani	60910300155	38	39
2736	Gidrometeorologiya	60520100	42	40
2737	Ijtimoiy ish: oila va bolalar bilan ishlash-Toshkent shahri	60920102114	38	31
2738	Iqtisodiyot: matematika iqtisodiyoti	60310104	40	30
2739	Jahon iqtisodiyoti va xalqaro iqtisodiy munosabatlar (mintaqalar va faoliyat turlari bo‘yicha)	60411900	40	30
2740	Kimyo: oziq-ovqat mahsulotlari kimyosi	60530101	39	40
2741	Matematik injiniring (ishlab chiqarish sohalari bo‘yicha)	60540301	40	41
2742	Matematik va kompyuterli modellashtirish	99999999	40	41
2743	Patentshunoslik	60421100	40	30
2744	Seysmologiya va seysmometriya	60531300	40	42
2745	Tabiiy va fiziologik faol birikmalar kimyosi	60530300	39	38
2746	Tibbiyot fizikasi	60531200	41	40
2747	Yurisprudensiya : biznes huquqi	60420106	45	30
2748	Jurnalistika: ommaviy axborot vositalari faoliyati	60320105	43	30
2749	Maʼlumotlar ilmi (Data Science)	60612200	40	41
2750	Soliqlar va soliqqa tortish (faoliyat turlari bo‘yicha)	60410200	40	30
2751	Yurisprudensiya: prokurorlik faoliyati	60420100	45	30
2752	Axborot xavfsizligini boshqarish	60610400	40	30
2753	Dinshunoslik	60220100	44	43
2754	Islom iqtisodiyoti va moliyasi	60411100	40	30
2755	Islomshunoslik: Qurʼonshunoslik, hadisshunoslik, Islom huquqi, aqida va tasavvuf, Islom tarixi va manbashunosligi	60220200	44	43
2756	Matnshunoslik va adabiy manbashunoslik: arab tili	60230301	30	31
2757	Psixologiya: din sotsiopsixologiyasi	60310901	38	31
2758	Turizm: ziyorat turizmi	61010402	44	30
2759	Yurisprudensiya: islom huquqi	60420101	45	30
2760	Boshlang‘ich taʼlim-Ishtixon tumani	60110500216	31	40
2761	Boshlang‘ich taʼlim-Kattaqo‘rg‘on tumani	60110500218	31	40
2762	Boshlang‘ich taʼlim-Nurobod tumani	60110500220	31	40
2763	Boshlang‘ich taʼlim-Payariq tumani	60110500224	31	40
2764	Boshlang‘ich taʼlim-Qo‘shrabot tumani	60110500225	31	40
2765	Boshlang‘ich taʼlim-Urgut tumani	60110500228	31	40
2766	Matematika va informatika-Kattaqo‘rg‘on tumani	60110600218	40	41
2767	Matematika va informatika-Nurobod tumani	60110600220	40	41
2768	Matematika va informatika-Payariq tumani	60110600224	40	41
2769	Matematika va informatika-Qo‘shrabot tumani	60110600225	40	41
2770	Matematika va informatika-Urgut tumani	60110600228	40	41
2771	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Ishtixon tumani	60111701216	36	37
2772	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Kattaqo‘rg‘on tumani	60111701218	36	37
2773	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Narpay tumani	60111701219	36	37
2774	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Paxtachi tumani	60111701223	36	37
2775	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Payariq tumani	60111701224	36	37
2776	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Qo‘shrabot tumani	60111701225	36	37
2777	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Urgut tumani	60111701228	36	37
2778	Amaliy filologiya	60230700	31	30
2779	Biologiya (turlari bo‘yicha)-Chiroqchi tumani	60510102182	38	39
2780	Biologiya (turlari bo‘yicha)-Dehqonobod tumani	60510102183	38	39
2781	Biologiya (turlari bo‘yicha)-Kitob tumani	60510102186	38	39
2782	Biologiya (turlari bo‘yicha)-Nishon tumani	60510102190	38	39
2783	Davolash ishi-Chiroqchi tumani	60910200182	38	39
2784	Davolash ishi-Dehqonobod tumani	60910200183	38	39
2785	Davolash ishi-G‘uzor tumani	60910200184	38	39
2786	Davolash ishi-Kasbi tumani	60910200185	38	39
2787	Davolash ishi-Koson tumani	60910200187	38	39
2788	Davolash ishi-Mirishkor tumani	60910200188	38	39
2789	Filologiya va tillarni o‘qitish: ingliz tili-Dehqonobod tumani	60230103183	33	31
2790	Filologiya va tillarni o‘qitish: ingliz tili-G‘uzor tumani	60230103184	33	31
2791	Filologiya va tillarni o‘qitish: ingliz tili-Koson tumani	60230103187	33	31
2792	Filologiya va tillarni o‘qitish: ingliz tili-Nishon tumani	60230103190	33	31
2793	Filologiya va tillarni o‘qitish: o‘zbek tili-Chiroqchi tumani	60230119182	37	30
2794	Filologiya va tillarni o‘qitish: o‘zbek tili-Dehqonobod tumani	60230119183	37	30
2795	Filologiya va tillarni o‘qitish: o‘zbek tili-Nishon tumani	60230119190	37	30
2796	Filologiya va tillarni o‘qitish: o‘zbek tili-Qamashi tumani	60230119191	37	30
2797	Filologiya va tillarni o‘qitish: o‘zbek tili-Shahrisabz tumani	60230119193	37	30
2798	Fizika-Chiroqchi tumani	60530901182	41	40
2799	Fizika-Dehqonobod tumani	60530901183	41	40
2800	Fizika-Kitob tumani	60530901186	41	40
2801	Fizika-Nishon tumani	60530901190	41	40
2802	Folklorshunoslik va shevashunoslik	60230900	37	30
2803	Geografiya-Chiroqchi tumani	60530400182	42	40
2804	Geografiya-Kitob tumani	60530400186	42	40
2805	Geografiya-Shahrisabz tumani	60530400193	42	40
2806	Kimyo (turlari bo‘yicha)-Chiroqchi tumani	60530102182	39	40
2807	Kimyo (turlari bo‘yicha)-Dehqonobod tumani	60530102183	39	40
2808	Kimyo (turlari bo‘yicha)-Kitob tumani	60530102186	39	40
2809	Kimyo (turlari bo‘yicha)-Nishon tumani	60530102190	39	40
2810	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)-Kitob tumani	60610100186	40	41
2811	Matematika va informatika-Chiroqchi tumani	60110600182	40	41
2812	Matematika va informatika-Dehqonobod tumani	60110600183	40	41
2813	Matematika va informatika-Qamashi tumani	60110600191	40	41
2814	Matematika-Chiroqchi tumani	60540100182	40	41
2815	Matematika-Dehqonobod tumani	60540100183	40	41
2286	Pediatriya ishi-Vobkent tumani	60910300156	38	39
2287	Tibbiy profilaktika ishi-Buxoro shahri	6091040043	39	38
2288	Tibbiy profilaktika ishi-G‘ijduvon tumani	60910400147	39	38
2289	Tibbiy profilaktika ishi-Jondor tumani	60910400148	39	38
2290	Tibbiy profilaktika ishi-Karmana tumani	60910400207	39	38
2291	Tibbiy profilaktika ishi-Kogon tumani	60910400149	39	38
2292	Tibbiy profilaktika ishi-Navoiy shahri	6091040051	39	38
2293	Tibbiy profilaktika ishi-Qiziltepa tumani	60910400211	39	38
2294	Tibbiy profilaktika ishi-Qorako‘l tumani	60910400152	39	38
2295	Tibbiy profilaktika ishi-Xatirchi tumani	60910400214	39	38
2296	Tibbiy-biologik ish	60910600	39	38
2297	Tibbiy-biologik ish-G‘ijduvon tumani	60910600147	39	38
2298	Tibbiy-biologik ish-Jondor tumani	60910600148	39	38
2299	Tibbiy-biologik ish-Karmana tumani	60910600207	39	38
2300	Tibbiy-biologik ish-Kogon tumani	60910600149	39	38
2301	Tibbiy-biologik ish-Nurota tumani	60910600210	39	38
2302	Tibbiy-biologik ish-Olot tumani	60910600150	39	38
2303	Tibbiy-biologik ish-Qiziltepa tumani	60910600211	39	38
2304	Tibbiy-biologik ish-Qorako‘l tumani	60910600152	39	38
2305	Tibbiy-biologik ish-Romitan tumani	60910600154	39	38
2306	Tibbiy-biologik ish-Shofirkon tumani	60910600155	39	38
2307	Tibbiy-biologik ish-Buxoro shahri	6091060043	39	38
2308	Tibbiy-biologik ish-Navoiy shahri	6091060051	39	38
2309	Arxeologiya	60220400	44	42
2310	Axborot xizmati va jamoatchilik bilan aloqalar	60320200	43	30
2311	Elektronika va asbobsozlik (tarmoqlar bo‘yicha)	60711200	41	40
2312	Falsafa (yo‘nalishlar bo‘yicha)	60220501	44	31
2313	Gid hamrohligi va tarjimonlik faoliyati: fransuz tili	61010505	32	31
2314	Gid hamrohligi va tarjimonlik faoliyati: nemis tili	61010503	34	31
2315	Ijtimoiy ish: oila va bolalar bilan ishlash	60920102	38	31
2316	Ijtimoiy ish: oila va bolalar bilan ishlash-Buxoro viloyati	60920102105	38	31
2317	Jurnalistika: bosma ommaviy axborot vositalari jurnalistikasi	60320102	43	30
2318	Madaniyat va sanʼat muassasalarini tashkil etish hamda boshqarish	60212000	44	31
2319	Marketing (tarmoqlar va sohalar bo‘yicha)	60412504	40	30
2320	Matnshunoslik va adabiy manbashunoslik: o‘zbek tili	60230302	37	30
2321	Moliya va moliyaviy texnologiyalar	60410400	40	30
2322	Neft va gaz kimyosi	60530200	39	40
2323	Psixologiya: sport psixologiyasi	60310905	38	31
2324	Sanʼatshunoslik: musiqashunoslik	60211006	43	43
2325	Sanʼatshunoslik: tasviriy va amaliy sanʼat	60211004	43	43
2326	Siyosatshunoslik	60310700	44	30
2327	Sport faoliyati: dzyudo	61010313	43	43
2328	Sport faoliyati: erkin kurash	61010362	43	43
2329	Sport faoliyati: qo‘l to‘pi	61010321	43	43
2330	Sport faoliyati: yengil atletika	61010314	43	43
2331	Statistika (tarmoqlar va sohalar bo‘yicha)	60410800	40	30
2332	Suv bioresurslari va akvakultura	60830100	38	39
2333	Tarix: islom tarixi va manbashunosligi	60220301	44	42
2334	Yurisprudensiya (faoliyat turlari bo‘yicha)	60420103	45	30
2335	Ijtimoiy ish: fuqarolarning o‘z-o‘zini boshqarish organlari	60920101	38	31
2336	Aholi va turistlarning ovqatlanishini tashkil etish servisi	61010200	39	33
2337	Dizayn: libos va gazlamalar	60210402	43	43
2338	Dizayn: poyabzal va aksessuarlar dizayni	60210410	43	43
2339	Energetika (tarmoqlar bo‘yicha)	60710500	40	41
2340	Funksional ovqatlanish va bolalar mahsulotlari texnologiyasi	60720500	39	38
2341	Gazni chuqur qayta ishlash texnologiyasi	60721000	39	40
2342	Kimyoviy texnologiya: ishlab chiqarish turlari bo‘yicha	60710101	39	40
2343	Kimyoviy texnologiya: silikat materiallari	60710104	39	40
2344	Konservalash texnologiyasi	60720400	39	38
2345	Matbaa va qadoqlash jarayonlari texnologiyasi	60710300	39	40
2346	Materialshunoslik va yangi materiallar texnologiyasi: mashinasozlik	60720605	39	40
2347	Materialshunoslik va yangi materiallar texnologiyasi: qurilish	60720604	39	40
2348	Neft va gaz ishi (faoliyat turlari bo‘yicha)	60721805	41	40
2349	Neftgazkimyo sanoati texnologiyasi	60720900	39	40
2350	Qurilish muhandisligi: devorbop va pardozbop qurilish materiallari texnologiyasi	60730304	40	41
2351	Suv taʼminoti va kanalizatsiya tizimlarini loyihalashtirish va ekspluatatsiyasi	60730501	40	41
2352	Texnologik jarayonlarni boshqarishning axborot-kommunikatsiya tizimlari	60711900	40	41
2353	Vinochilik texnologiyasi, bijg‘ish mahsulotlari va alkogolsiz ichimliklar texnologiyasi	60720300	39	38
2354	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: ipak mahsulotlari ishlab chiqarish	60721207	40	41
2355	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: to‘qima	60721212	40	41
2356	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: yigirilgan ip ishlab chiqarish	60721208	40	41
2357	Yengil sanoat texnologiyalari va jihozlari (ishlab chiqarish turlari bo‘yicha)	60721401	40	41
2358	Yog‘lar, efir moylari va parfumeriya-kosmetika mahsulotlari texnologiyasi	60720200	39	38
2359	Geodeziya va geoinformatika	60722600	40	41
2360	Gidrologiya: daryo va suv omborlari gidrologiyasi	60530801	40	42
2361	Gidrotexnika qurilishi: suv xo‘jaligida	60730901	40	41
2362	Meliorativ gidrogeologiya	60812600	41	40
2363	Qishloq xo‘jaligida innovatsion texnika va texnologiyalarni qo‘llash	60810400	40	41
2364	Suv taʼminoti muhandislik tizimlari	60812900	40	41
2365	Suv xo‘jaligida innovatsion texnologiyalar va ulardan foydalanish	60813000	40	41
2366	Yer kadastri va yer tuzish	60813100	40	41
2367	Biologiya-Parkent tumani	60110900244	38	39
2368	Biologiya-Quyichirchiq tumani	60110900247	38	39
2369	Boshlang‘ich taʼlim-Bo‘stonliq tumani	60110500239	31	40
2370	Boshlang‘ich taʼlim-Parkent tumani	60110500244	31	40
2371	Boshlang‘ich taʼlim-Quyichirchiq tumani	60110500247	31	40
2372	Fizika va astronomiya-Bo‘stonliq tumani	60110700239	41	40
2373	Fizika va astronomiya-Parkent tumani	60110700244	41	40
2374	Fizika va astronomiya-Quyichirchiq tumani	60110700247	41	40
2375	Geografiya va iqtisodiy bilim asoslari-Parkent tumani	60111000244	42	40
2376	Geografiya va iqtisodiy bilim asoslari-Quyichirchiq tumani	60111000247	42	40
2377	Kimyo-Bo‘stonliq tumani	60110800239	39	40
2378	Kimyo-Parkent tumani	60110800244	39	40
2379	Kimyo-Quyichirchiq tumani	60110800247	39	40
2380	Matematika va informatika-Bo‘stonliq tumani	60110600239	40	41
2381	Matematika va informatika-Parkent tumani	60110600244	40	41
2382	Matematika va informatika-Quyichirchiq tumani	60110600247	40	41
2383	Maxsus pedagogika : tiflopedagogika	60112705	38	31
2384	Maxsus pedagogika: surdotarjimonlik faoliyati	60112702	43	31
2385	Maxsus pedagogika: surdotarjimonlik faoliyati (oila aʼzolaridan biri kar va soqov bo‘lgan abituriyentlar uchun)	60112702306	43	31
2386	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Bo‘stonliq tumani	60112100239	44	31
2387	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Parkent tumani	60112100244	44	31
2388	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Quyichirchiq tumani	60112100247	44	31
2389	O‘zbek tili va adabiyoti-Parkent tumani	60111400244	37	30
2390	O‘zbek tili va adabiyoti-Quyichirchiq tumani	60111400247	37	30
2391	Tarix-Bo‘stonliq tumani	60111100239	44	42
2392	Tarix-Parkent tumani	60111100244	44	42
2393	Tarix-Quyichirchiq tumani	60111100247	44	42
2394	Xorijiy til va adabiyoti: ingliz tili-Bo‘stonliq tumani	60111802239	33	31
2395	Xorijiy til va adabiyoti: ingliz tili-Parkent tumani	60111802244	33	31
2396	Xorijiy til va adabiyoti: ingliz tili-Quyichirchiq tumani	60111802247	33	31
2397	Xorijiy til va adabiyoti: nemis tili	60111803	34	31
2398	Ona tili va adabiyot: rus tili va adabiyoti	60111501	35	44
2399	Ona tili va adabiyot: rus tili va adabiyoti-Bo‘stonliq tumani	60111501239	35	44
2400	Ona tili va adabiyot: rus tili va adabiyoti-Quyichirchiq tumani	60111501247	35	44
2401	Agronomiya: anorchilik	60810904	38	39
2402	Ijtimoiy ish: oila va bolalar bilan ishlash-Andijon viloyati	60920102102	38	31
2403	Ijtimoiy ish: oila va bolalar bilan ishlash-Farg‘ona viloyati	60920102104	38	31
2404	Ijtimoiy ish: oila va bolalar bilan ishlash-Namangan viloyati	60920102103	38	31
2405	Maxsus pedagogika : oligofrenopedagogika	60112703	38	31
2406	Maxsus pedagogika : supdopedagogika	60112701	38	31
2407	Mintaqaviy iqtisodiyot	60310300	40	30
2408	Muzeyshunoslik (turlari bo‘yicha)	60212101	44	31
2409	Xorijiy til va adabiyoti: fransuz tili	60111804	32	31
2410	Zooinjeneriya: asalarichilik	60811504	38	39
2411	Davolash ishi-Buvayda tumani	60910200132	38	39
2412	Davolash ishi-Farg‘ona shahri	6091020039	38	39
2413	Pediatriya ishi-Beshariq tumani	60910300130	38	39
2414	Pediatriya ishi-So‘x tumani	60910300142	38	39
2415	Pediatriya ishi-Uchko‘prik tumani	60910300144	38	39
2416	Tibbiy profilaktika ishi-Beshariq tumani	60910400130	39	38
2417	Tibbiy profilaktika ishi-Bog‘dod tumani	60910400131	39	38
2418	Tibbiy profilaktika ishi-Buvayda tumani	60910400132	39	38
2419	Tibbiy profilaktika ishi-Dang‘ara tumani	60910400133	39	38
2420	Tibbiy profilaktika ishi-Farg‘ona shahri	6091040039	39	38
2421	Tibbiy profilaktika ishi-Farg‘ona tumani	60910400134	39	38
2422	Tibbiy profilaktika ishi-Furqat tumani	60910400135	39	38
2423	Tibbiy profilaktika ishi-Marg‘ilon shahri	6091040040	39	38
2424	Tibbiy profilaktika ishi-Oltiariq tumani	60910400137	39	38
2425	Tibbiy profilaktika ishi-O‘zbekiston tumani	60910400139	39	38
2426	Tibbiy profilaktika ishi-Qo‘qon shahri	6091040041	39	38
2427	Tibbiy profilaktika ishi-Qo‘shtepa tumani	60910400252	39	38
2428	Tibbiy profilaktika ishi-Quva tumani	60910400140	39	38
2429	Tibbiy profilaktika ishi-Quvasoy shahri	6091040042	39	38
2430	Tibbiy profilaktika ishi-Rishton tumani	60910400141	39	38
2431	Tibbiy profilaktika ishi-Toshloq tumani	60910400143	39	38
2432	Tibbiy profilaktika ishi-Uchko‘prik tumani	60910400144	39	38
2433	Tibbiy profilaktika ishi-Yozyovon tumani	60910400145	39	38
2816	Matematika-Kitob tumani	60540100186	40	41
2817	Matematika-Nishon tumani	60540100190	40	41
2818	Matematika-Qamashi tumani	60540100191	40	41
2819	Pediatriya ishi-Chiroqchi tumani	60910300182	38	39
2820	Pediatriya ishi-Dehqonobod tumani	60910300183	38	39
2821	Pediatriya ishi-G‘uzor tumani	60910300184	38	39
2822	Pediatriya ishi-Kasbi tumani	60910300185	38	39
2823	Pediatriya ishi-Koson tumani	60910300187	38	39
2824	Pediatriya ishi-Mirishkor tumani	60910300188	38	39
2825	Savdo ishi (turlari bo‘yicha)	60412600	40	30
2826	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Dehqonobod tumani	60220302183	44	42
2827	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Kitob tumani	60220302186	44	42
2828	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Qamashi tumani	60220302191	44	42
2829	Filologiya va tillarni o‘qitish: rus tili-G‘uzor tumani	60230113184	35	30
2830	Filologiya va tillarni o‘qitish: rus tili-Kasbi tumani	60230113185	35	30
2831	Filologiya va tillarni o‘qitish: rus tili-Koson tumani	60230113187	35	30
2434	Elektron apparaturalar ishlab chiqarish texnologiyasi	60712000	41	40
2435	Geodeziya, kartografiya va kadastr (funksiyalari bo‘yicha)	60722500	40	41
2436	Materialshunoslik va yangi materiallar texnologiyasi: qurilish	60720601	39	40
2437	Muhandislik kommunikatsiyalari qurilishi va montaji (turlari bo‘yicha)	60730402	40	41
2438	Professional taʼlim: elektr texnikasi, elektr mexanikasi va elektr texnologiyalari	60112416	41	40
2439	Telekommunikatsiya texnologiyalari: “Telekommunikatsiyalar”, “Teleradioeshittirish”, “Mobil tizimlar”	60611002	40	41
2440	Transport vositalari muhandisligi: avtomobil transporti	60712504	40	41
2441	Transport vositalari muhandisligi: ixtisoslashtirilgan transport vositalari	60712506	40	41
2442	Transportda tashishni tashkil etish va boshqarish (transport turlari bo‘yicha)	60713202	40	41
2443	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: charm buyumlari texnologiyasi	60721203	40	41
2444	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: tikuv buyumlari texnologiyasi	60721210	40	41
2445	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: trikotaj	60721211	40	41
2446	Geologiya (faoliyat sohasi bo‘yicha)	60530503	40	41
2447	Geologiya-qidiruv ishlari texnikasi va texnologiyasi	60722300	40	41
2448	Geologiya: neft va gaz geologiyasi	60530501	40	41
2449	Gidrogeologiya va muhandislik geologiyasi	60721700	41	40
2450	Geologiya: neft va gaz geofizikasi	60530502	40	41
2451	Amaliy sanʼat: badiiy kulolchilik	60210802	43	43
2452	Biznesni boshqarish (tarmoqlar bo‘yicha)	60411303	40	30
2453	Cholg‘u ijrochiligi: xalq cholg‘ulari (rubob prima, qashqar va afg‘on rubobi)	60211513	43	43
2454	Davolash ishi-Guliston shahri	6091020055	38	39
2455	Dizayn: interyerni loyihalash	60210407	43	43
2456	Ijtimoiy ish: oila va bolalar bilan ishlash-Jizzax viloyati	60920102109	38	31
2457	Ijtimoiy ish: oila va bolalar bilan ishlash-Sirdaryo viloyati	60920102112	38	31
2458	Ijtimoiy ish: oila va bolalar bilan ishlash-Toshkent viloyati	60920102113	38	31
2459	Pediatriya ishi-Guliston shahri	6091030055	38	39
2460	Vokal sanʼati: anʼanaviy xonandalik	60211402	43	43
2461	Logistika: turizm logistikasi	60411703	40	30
2462	Madaniy meros obyektlarini asrash	60212200	40	31
2463	Menejment: mehmonxonalarni boshqarish	60411207	40	30
2464	Menejment: ommaviy tadbirlar menejmenti	60411208	40	30
2465	Menejment: turizm biznesini boshqarish	60411210	40	30
2466	Xalqaro iqtisodiyot va menejment (mintaqalar va faoliyat yo‘nalishlari bo‘yicha)	60412000	40	30
2467	Xalqaro munosabatlar	60310800	44	30
2468	Yurisprudensiya: xalqaro huquqiy faoliyat	60420105	45	30
2469	Biologiya-Forish tumani	60110900198	38	39
2470	Boshlang‘ich taʼlim-G‘allaorol tumani	60110500199	31	40
2471	Boshlang‘ich taʼlim-Zomin tumani	60110500206	31	40
2472	Davolash ishi-Do‘stlik tumani	60910200197	38	39
2473	Davolash ishi-Zafarobod tumani	60910200204	38	39
2474	Fizika va astronomiya-Forish tumani	60110700198	41	40
2475	Fizika va astronomiya-Zomin tumani	60110700206	41	40
2476	Geografiya va iqtisodiy bilim asoslari-Zomin tumani	60111000206	42	40
2477	Matematika va informatika-Baxmal tumani	60110600196	40	41
2478	Matematika va informatika-Forish tumani	60110600198	40	41
2479	Matematika va informatika-G‘allaorol tumani	60110600199	40	41
2480	Matematika va informatika-Zomin tumani	60110600206	40	41
2481	O‘zbek tili va adabiyoti-Forish tumani	60111400198	37	30
2482	O‘zbek tili va adabiyoti-G‘allaorol tumani	60111400199	37	30
2483	O‘zbek tili va adabiyoti-Zomin tumani	60111400206	37	30
2484	Pediatriya ishi-Arnasoy tumani	60910300195	38	39
2485	Pediatriya ishi-Mirzacho‘l tumani	60910300201	38	39
2486	Professional taʼlim: yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (tikuv buyumlari texnologiyasi)	60112432	40	41
2487	Xorijiy til va adabiyoti: ingliz tili-Baxmal tumani	60111802196	33	31
2488	Xorijiy til va adabiyoti: ingliz tili-Forish tumani	60111802198	33	31
2489	Xorijiy til va adabiyoti: ingliz tili-G‘allaorol tumani	60111802199	33	31
2490	Xorijiy til va adabiyoti: ingliz tili-Zomin tumani	60111802206	33	31
2491	Ona tili va adabiyot: rus tili va adabiyoti-Baxmal tumani	60111501196	35	44
2492	Ona tili va adabiyot: rus tili va adabiyoti-Forish tumani	60111501198	35	44
2493	Ona tili va adabiyot: rus tili va adabiyoti-G‘allaorol tumani	60111501199	35	44
2494	Ona tili va adabiyot: rus tili va adabiyoti-Zomin tumani	60111501206	35	44
2495	Metallurgiya (metall turlari bo‘yicha)	60712101	39	40
2496	Professional taʼlim: iqtisodiyot	60112434	40	30
2497	Professional taʼlim: transport vositalari muhandisligi (avtotransport)	60112402	40	41
2498	Radioelektron qurilmalar va tizimlar (tarmoqlar bo‘yicha)	60611502	40	41
2499	Bastakorlik sanʼati	60210900	43	43
2500	Cholg‘u ijrochiligi: estrada cholg‘ulari (fortepiano)	60211527	43	43
2501	Cholg‘u ijrochiligi: estrada cholg‘ulari (gitara bas)	60211521	43	43
2502	Cholg‘u ijrochiligi: estrada cholg‘ulari (gitara)	60211522	43	43
2503	Cholg‘u ijrochiligi: estrada cholg‘ulari (saksofon)	60211524	43	43
2504	Cholg‘u ijrochiligi: estrada cholg‘ulari (trombon)	60211525	43	43
2505	Cholg‘u ijrochiligi: estrada cholg‘ulari (truba)	60211526	43	43
2506	Cholg‘u ijrochiligi: estrada cholg‘ulari (zarbli cholg‘ular)	60211523	43	43
2507	Dirijyorlik: estrada orkestri dirijyorligi	60211303	43	43
2508	Professional taʼlim: cholg‘u ijrochiligi (estrada cholg‘ulari)	60112415	43	43
2509	Professional taʼlim: vokal sanʼati (estrada xonandaligi)	60112428	43	43
2510	Texnogen sanʼat: musiqiy ovoz rejissorligi	60210102	43	43
2511	Vokal sanʼati: estrada xonandaligi	60211403	43	43
2512	Amaliy sanʼat: amaliy sanʼat asarlarini taʼmirlash	60210805	43	43
2513	Amaliy sanʼat: badiiy naqqoshlik	60210803	43	43
2514	Amaliy sanʼat: badiiy zargarlik	60210801	43	43
2515	Amaliy sanʼat: meʼmoriy yodgorliklar bezagini taʼmirlash	60210804	43	43
2516	Dizayn: kompyuter grafikasi va badiiy foto	60210413	43	43
2517	Dizayn: reklama va amaliy grafika	60210404	43	43
2518	Dizayn: sanoat dizayni	60210403	43	43
2519	Grafika: dastgoh va kitob grafikasi	60210601	43	43
2520	Grafika: xattotlik va miniatyura	60210602	43	43
2521	Haykaltaroshlik: mahobatli	60210702	43	43
2522	Haykaltaroshlik: mayda plastika	60210701	43	43
2523	Menejment: art menejment va galereya ishi	60411201	40	30
2524	Muzeyshunoslik: muzey menejmenti va madaniy turizm	60212102	44	31
2525	Muzeyshunoslik: muzey predmetlari ekspertizasi, konservatsiyalash va taʼmirlash	60212103	44	31
2526	Professional taʼlim: amaliy sanʼat (amaliy sanʼat asarlarini taʼmirlash)	60112419	43	43
2527	Professional taʼlim: dizayn (interyerni loyihalash)	60112430	43	43
2528	Professional taʼlim: dizayn (libos va gazlamalar)	60112431	43	43
2529	Professional taʼlim: rangtasvir (dastgohli)	60112405	43	43
2530	Qadimiy yozma manbalar konservatsiyasi va restavratsiyasi	60212300	43	43
2531	Rangtasvir: filmning tasviriy yechimi	60210505	43	43
2532	Rangtasvir: mahobatli rangtasvir	60210502	43	43
2533	Rangtasvir: multfilm va kompyuter multiplikatsiyasi	60210503	43	43
2534	Rangtasvir: teatr-bezak rangtasvir	60210504	43	43
2535	Sanʼatshunoslik: sanʼat jurnalistikasi	60211007	43	43
2536	Axborot xavfsizligi (sohalar bo‘yicha)	60610300	40	41
2537	Psixologiya: yoshlar psixologiyasi	60310903	38	31
2538	Filologiya va tillarni o‘qitish: fors tili	60230120	30	31
2539	Kompyuter lingvistikasi	60230800	31	40
2540	Davolash ishi-Namangan shahri	6091020038	38	39
2541	Hayotiy faoliyat xavfsizligi	61020100	40	41
2542	Iqtisodiy xavfsizlik	60310400	40	30
2543	Jurnalistika: internet jurnalistika	60320104	43	30
2544	Jurnalistika: teleradio jurnalistikasi	60320109	43	30
2545	Kutubxona-axborot faoliyati (faoliyat turlari bo‘yicha)	60320402	40	31
2546	Logistika (yo‘nalishlar bo‘yicha)	60411702	40	30
2547	Meteorologiya va iqlimshunoslik	60520200	40	42
2548	Moliya sohasida boshqaruv	60412200	40	30
2549	O‘simlikshunoslik: gulchilik	60812201	38	39
2550	Professional taʼlim: texnologik mashinalar va jihozlar	60112403	40	41
2551	Sport faoliyati: xotin-qizlar sporti yo‘nalishi bo‘yicha	61010301	43	43
2552	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi (kon turlari bo‘yicha)	60721604	41	40
2553	Korporativ boshqaruv	60411600	40	30
2554	Shahar qurilishi hamda kommunal infratuzilmani tashkil etish va boshqarish	60730200	40	41
2555	Axborot texnologiyalarining dasturiy taʼminoti	60610800	40	41
2556	Dizayn: to‘qimachilik va yengil sanoat dizayni	60210411	43	43
2557	Texnologik mashinalar va jihozlar: to‘qimachilik mashinalari muhandisligi	60720707	40	41
2558	Yengil sanoat texnologiyalari va jihozlari: to‘qimachilik muhandisligi	60721404	40	41
2559	Konchilik elektr mexanikasi	60721900	41	40
2560	Konchilik ishi (faoliyat turlari bo‘yicha)	60721502	41	40
2561	Noyob va radioaktiv metallar rudalarini qazib olish, qayta ishlash texnikasi va texnologiyasi	60722400	39	40
2562	Professional taʼlim: konchilik ishi	60112429	41	40
2563	Biologiya-Konimex tumani	60110900208	38	39
2564	Biologiya-Tomdi tumani	60110900212	38	39
2565	Boshlang‘ich taʼlim-Uchquduq tumani	60110500213	31	40
2566	Davolash ishi-Navoiy shahri	6091020051	38	39
2567	Fizika va astronomiya-Konimex tumani	60110700208	41	40
2568	Geografiya va iqtisodiy bilim asoslari-Tomdi tumani	60111000212	42	40
2569	Kimyo-Konimex tumani	60110800208	39	40
2570	Kimyo-Nurota tumani	60110800210	39	40
2571	Kimyo-Tomdi tumani	60110800212	39	40
2572	Kimyo-Uchquduq tumani	60110800213	39	40
2573	Matematika va informatika-Tomdi tumani	60110600212	40	41
2574	Matematika va informatika-Uchquduq tumani	60110600213	40	41
2575	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Konimex tumani	60112100208	44	31
2576	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Xatirchi tumani	60112100214	44	31
2577	O‘zbek tili va adabiyoti-Konimex tumani	60111400208	37	30
2578	Pedagogika-Nurota tumani	60110100210	44	31
2579	Pediatriya ishi-Navoiy shahri	6091030051	38	39
2580	Professional taʼlim: axborot tizimlari va texnologiyalari	60112424	40	41
2581	Professional taʼlim: cholg‘u ijrochiligi (turlari bo‘yicha)	60112412	43	43
2582	Professional taʼlim: vokal sanʼati (turlari bo‘yicha)	60112417	43	43
2583	Tarix-Konimex tumani	60111100208	44	42
2584	Tarix-Nurota tumani	60111100210	44	42
2585	Xorijiy til va adabiyoti: ingliz tili-Konimex tumani	60111802208	33	31
2586	Xorijiy til va adabiyoti: ingliz tili-Nurota tumani	60111802210	33	31
2587	Xorijiy til va adabiyoti: ingliz tili-Tomdi tumani	60111802212	33	31
2588	Xorijiy til va adabiyoti: ingliz tili-Uchquduq tumani	60111802213	33	31
2589	Xorijiy til va adabiyoti: ingliz tili-Xatirchi tumani	60111802214	33	31
2590	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Konimex tumani	60111701208	36	37
2591	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Uchquduq tumani	60111701213	36	37
2592	Ona tili va adabiyot: rus tili va adabiyoti-Bo‘zatov tumani	60111501258	35	44
2593	Ona tili va adabiyot: rus tili va adabiyoti-Ellikqalʼa tumani	6011150194	35	44
2594	Ona tili va adabiyot: rus tili va adabiyoti-Mo‘ynoq tumani	6011150196	35	44
2595	Ona tili va adabiyot: rus tili va adabiyoti-Taxtako‘pir tumani	60111501102	35	44
2596	Ona tili va adabiyot: rus tili va adabiyoti-To‘rtko‘l tumani	60111501103	35	44
2597	O‘zga tilli guruhlarda o‘zbek tili (rus guruhlari uchun)	60111602	46	35
2598	O‘zga tilli guruhlarda rus tili (qoraqalpoq guruhlari uchun)	60111702	36	47
2599	Sport faoliyati: akademik eshkak eshish	61010302	43	43
2600	Sport faoliyati: baydarka va kanoeda eshkak eshish	61010305	43	43
2601	Sport faoliyati: og‘ir atletika	61010324	43	43
2602	Sport faoliyati: para dzyu-do	61010326	43	43
2603	Sport faoliyati: para paurlifting	61010328	43	43
2604	Sport faoliyati: para suzish	61010329	43	43
2605	Sport faoliyati: para taekvondo WTF	61010330	43	43
2606	Sport faoliyati: para yengil atletika	61010327	43	43
2607	Sport faoliyati: suzish	61010336	43	43
2608	Sport faoliyati: taekvondo WTF	61010337	43	43
2609	Sport faoliyati: yunon-rum kurashi	61010364	43	43
2610	Iqtisodiyot: oziq-ovqat va resurslar iqtisodiyoti	60310111	40	30
2611	Xoreografiya (turlari bo‘yicha)	60211602	43	43
2612	Cholg‘u ijrochiligi: anʼanaviy cholg‘ular	60211502	43	43
2613	Professional taʼlim: cholg‘u ijrochiligi (anʼanaviy cholg‘ular)	60112418	43	43
2614	Professional taʼlim: vokal sanʼati (anʼanaviy xonandalik)	60112427	43	43
2615	Xalq ijodiyoti: baxshichilik va dostonchilik	60211903	43	43
2616	Filologiya va tillarni o‘qitish: ispan tili	60230105	30	31
2617	Filologiya va tillarni o‘qitish: turk tili	60230115	30	31
2618	Jurnalistika: xalqaro jurnalistika	60320110	43	30
2619	Tarjima nazariyasi va amaliyoti: arab tili	60230201	30	31
2620	Tarjima nazariyasi va amaliyoti: italyan tili	60230203	30	31
2621	Tarjima nazariyasi va amaliyoti: turk tili	60230207	30	31
2622	Adaptiv jismoniy tarbiya va sport (parasport)	61010800	43	43
2623	Jismoniy tarbiya va sport menejmenti, sport tadbirlarini tashkil etish va boshqarish	61010900	40	30
2624	Sport faoliyati: badminton	61010304	43	43
2625	Sport faoliyati: belbog‘li kurash	61010307	43	43
2626	Sport faoliyati: biatlon	61010308	43	43
2627	Sport faoliyati: chim ustida xokkey	61010360	43	43
2628	Sport faoliyati: eshkak eshish	61010363	43	43
2629	Sport faoliyati: figurali uchish	61010341	43	43
2630	Sport faoliyati: gimnastika	61010312	43	43
2631	Sport faoliyati: kamondan otish	61010315	43	43
2632	Sport faoliyati: karate VKF	61010316	43	43
2633	Sport faoliyati: kibersport	61010317	43	43
2634	Sport faoliyati: kikboksing	61010318	43	43
2635	Sport faoliyati: minifutbol	61010322	43	43
2636	Sport faoliyati: muaytay	61010323	43	43
2637	Sport faoliyati: ot sporti	61010325	43	43
2638	Sport faoliyati: qilichbozlik	61010319	43	43
2639	Sport faoliyati: regbi	61010331	43	43
2640	Sport faoliyati: sambo	61010332	43	43
2641	Sport faoliyati: shaxmat	61010361	43	43
2642	Sport faoliyati: sinxron suzish	61010333	43	43
2643	Sport faoliyati: stol tennisi	61010334	43	43
2644	Sport faoliyati: suv polosi	61010335	43	43
2645	Sport faoliyati: tennis	61010338	43	43
2646	Sport faoliyati: tog‘ chang‘isi	61010339	43	43
2647	Sport faoliyati: triatlon	61010340	43	43
2648	Sport faoliyati: velosport	61010310	43	43
2649	Sport faoliyati: xokkey	61010343	43	43
2650	Sport faoliyati: xotin-qizlar sportini rivojlantirish (belbog‘li kurash)	61010344	43	43
2651	Sport faoliyati: xotin-qizlar sportini rivojlantirish (boks)	61010345	43	43
2652	Sport faoliyati: xotin-qizlar sportini rivojlantirish (dzyudo)	61010347	43	43
2653	Sport faoliyati: xotin-qizlar sportini rivojlantirish (figurali uchish)	61010357	43	43
2654	Sport faoliyati: xotin-qizlar sportini rivojlantirish (futbol)	61010358	43	43
2655	Sport faoliyati: xotin-qizlar sportini rivojlantirish (gandbol)	61010346	43	43
2656	Sport faoliyati: xotin-qizlar sportini rivojlantirish (karate VKF)	61010349	43	43
2657	Sport faoliyati: xotin-qizlar sportini rivojlantirish (kurash)	61010350	43	43
2658	Sport faoliyati: xotin-qizlar sportini rivojlantirish (regbi)	61010351	43	43
2659	Sport faoliyati: xotin-qizlar sportini rivojlantirish (shaxmat)	61010359	43	43
2660	Sport faoliyati: xotin-qizlar sportini rivojlantirish (sinxron suzish)	61010352	43	43
2661	Sport faoliyati: xotin-qizlar sportini rivojlantirish (stol tennisi)	61010353	43	43
2662	Sport faoliyati: xotin-qizlar sportini rivojlantirish (suzish)	61010354	43	43
2663	Sport faoliyati: xotin-qizlar sportini rivojlantirish (taekvondo WTF)	61010355	43	43
2664	Sport faoliyati: xotin-qizlar sportini rivojlantirish (tennis)	61010356	43	43
2665	Sport faoliyati: xotin-qizlar sportini rivojlantirish (yengil atletika)	61010348	43	43
2666	Cholg‘u ijrochiligi: fortepiano (organ)	60211501	43	43
2667	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (fleyta, goboy, fagot)	60211509	43	43
2668	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (klarnet, saksofon)	60211505	43	43
2669	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (trombon, tuba)	60211507	43	43
2670	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (valtorna, truba)	60211503	43	43
2671	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (zarbli cholg‘ular)	60211504	43	43
2672	Cholg‘u ijrochiligi: torli cholg‘ular (skripka, alt)	60211512	43	43
2673	Cholg‘u ijrochiligi: torli cholg‘ular (violonchel kontrabas)	60211510	43	43
2674	Cholg‘u ijrochiligi: Xalq cholg‘ulari (chang)	60211520	43	43
2912	Davolash ishi-Bulung‘ur tumani	60910200215	38	39
2001	Filologiya va tillarni o‘qitish: arab tili	60230101	30	31
2002	Filologiya va tillarni o‘qitish: fransuz tili	60230121	32	31
2003	Filologiya va tillarni o‘qitish: ingliz tili	60230103	33	31
2004	Filologiya va tillarni o‘qitish: koreys tili	60230109	30	31
2005	Filologiya va tillarni o‘qitish: nemis tili	60230112	34	31
2006	Filologiya va tillarni o‘qitish: xitoy tili	60230123	30	31
2007	Filologiya va tillarni o‘qitish: yapon tili	60230124	30	31
2008	Gid hamrohligi va tarjimonlik faoliyati: ingliz tili	61010501	33	31
2009	Maktabgacha va boshlang‘ich taʼlimda xorijiy til: ingliz tili	60112600	33	31
2010	Tarjima nazariyasi va amaliyoti: fransuz tili	60230208	32	31
2011	Tarjima nazariyasi va amaliyoti: ingliz tili	60230202	33	31
2012	Tarjima nazariyasi va amaliyoti: nemis tili	60230205	34	31
2013	Xorijiy til va adabiyoti: ingliz tili	60111802	33	31
2014	Filologiya va tillarni o‘qitish: rus tili	60230113	35	30
2015	Tarjima nazariyasi va amaliyoti: rus tili	60230206	36	37
2016	Xorijiy til va adabiyoti: rus tili	60111801	35	31
2017	Biologiya	60110900	38	39
2018	Boshlang‘ich taʼlim	60110500	31	40
2019	Fizika va astronomiya	60110700	41	40
2020	Geografiya va iqtisodiy bilim asoslari	60111000	42	40
2021	Jismoniy madaniyat	60112200	43	43
2022	Jismoniy madaniyat: xotin-qizlar sporti yo‘nalishi bo‘yicha	60112201	43	43
2023	Kimyo	60110800	39	40
2024	Maktabgacha taʼlim	60110200	38	31
2025	Maktabgacha taʼlim psixologiyasi va pedagogikasi	60110300	38	31
2026	Maktabgacha va boshlang‘ich taʼlimda jismoniy tarbiya va sport	60111900	43	43
2027	Matematika va informatika	60110600	40	41
2028	Maxsus pedagogika : logopediya	60112704	38	31
2029	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi	60112100	44	31
2030	Musiqa taʼlimi	60111300	43	43
2031	O‘zbek tili va adabiyoti	60111400	37	30
2032	Pedagogika	60110100	44	31
2033	Tarix	60111100	44	42
2034	Tasviriy sanʼat va muhandislik grafikasi	60111200	43	43
2035	Texnologik taʼlim	60112300	41	40
2036	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)	60111701	36	37
2037	Davolash ishi	60910200	38	39
2038	Davolash ishi-Andijon tumani	60910200105	38	39
2039	Davolash ishi-Asaka tumani	60910200106	38	39
2040	Davolash ishi-Baliqchi tumani	60910200107	38	39
2041	Davolash ishi-Beshariq tumani	60910200130	38	39
2042	Davolash ishi-Bog‘dod tumani	60910200131	38	39
2043	Davolash ishi-Bo‘ston tumani	60910200257	38	39
2044	Davolash ishi-Buloqboshi tumani	60910200109	38	39
2045	Davolash ishi-Dang‘ara tumani	60910200133	38	39
2046	Davolash ishi-Farg‘ona tumani	60910200134	38	39
2047	Davolash ishi-Furqat tumani	60910200135	38	39
2048	Davolash ishi-Izboskan tumani	60910200110	38	39
2049	Davolash ishi-Jalaquduq tumani	60910200111	38	39
2050	Davolash ishi-Kosonsoy tumani	60910200121	38	39
2051	Davolash ishi-Marg‘ilon shahri	6091020040	38	39
2052	Davolash ishi-Marxamat tumani	60910200112	38	39
2053	Davolash ishi-Oltiariq tumani	60910200137	38	39
2054	Davolash ishi-Oltinko‘l tumani	60910200113	38	39
2055	Davolash ishi-O‘zbekiston tumani	60910200139	38	39
2056	Davolash ishi-Paxtaobod tumani	60910200114	38	39
2057	Davolash ishi-Qorasuv shahri	60910200260	38	39
2058	Davolash ishi-Qo‘qon shahri	6091020041	38	39
2059	Davolash ishi-Qo‘rg‘ontepa tumani	60910200115	38	39
2060	Davolash ishi-Qo‘shtepa tumani	60910200252	38	39
2061	Davolash ishi-Quva tumani	60910200140	38	39
2062	Davolash ishi-Quvasoy shahri	6091020042	38	39
2063	Davolash ishi-Rishton tumani	60910200141	38	39
2064	Davolash ishi-Shaxrixon tumani	60910200116	38	39
2065	Davolash ishi-So‘x tumani	60910200142	38	39
2066	Davolash ishi-Toshloq tumani	60910200143	38	39
2067	Davolash ishi-Uchko‘prik tumani	60910200144	38	39
2068	Davolash ishi-Ulug‘nor tumani	60910200117	38	39
2069	Davolash ishi-Uychi tumani	60910200128	38	39
2070	Davolash ishi-Xo‘jaobod tumani	60910200118	38	39
2071	Davolash ishi-Yozyovon tumani	60910200145	38	39
2072	Farmatsiya (turlari bo‘yicha)	60910700	39	38
2073	Oliy hamshiralik ishi	60911200	38	39
2074	Pediatriya ishi	60910300	38	39
2075	Pediatriya ishi-Andijon shahri	6091030033	38	39
2076	Pediatriya ishi-Andijon tumani	60910300105	38	39
2077	Pediatriya ishi-Asaka tumani	60910300106	38	39
2078	Pediatriya ishi-Baliqchi tumani	60910300107	38	39
2079	Pediatriya ishi-Bog‘dod tumani	60910300131	38	39
2080	Pediatriya ishi-Bo‘ston tumani	60910300257	38	39
2081	Pediatriya ishi-Buloqboshi tumani	60910300109	38	39
2082	Pediatriya ishi-Buvayda tumani	60910300132	38	39
2083	Pediatriya ishi-Dang‘ara tumani	60910300133	38	39
2084	Pediatriya ishi-Farg‘ona shahri	6091030039	38	39
2085	Pediatriya ishi-Farg‘ona tumani	60910300134	38	39
2086	Pediatriya ishi-Furqat tumani	60910300135	38	39
2087	Pediatriya ishi-Izboskan tumani	60910300110	38	39
2088	Pediatriya ishi-Jalaquduq tumani	60910300111	38	39
2089	Pediatriya ishi-Marg‘ilon shahri	6091030040	38	39
2090	Pediatriya ishi-Marxamat tumani	60910300112	38	39
2091	Pediatriya ishi-Namangan shahri	6091030038	38	39
2092	Pediatriya ishi-Oltiariq tumani	60910300137	38	39
2093	Pediatriya ishi-Oltinko‘l tumani	60910300113	38	39
2094	Pediatriya ishi-O‘zbekiston tumani	60910300139	38	39
2095	Pediatriya ishi-Paxtaobod tumani	60910300114	38	39
2096	Pediatriya ishi-Qorasuv shahri	60910300260	38	39
2097	Pediatriya ishi-Qo‘qon shahri	6091030041	38	39
2098	Pediatriya ishi-Qo‘rg‘ontepa tumani	60910300115	38	39
2099	Pediatriya ishi-Qo‘shtepa tumani	60910300252	38	39
2100	Pediatriya ishi-Quva tumani	60910300140	38	39
2101	Pediatriya ishi-Quvasoy shahri	6091030042	38	39
2102	Pediatriya ishi-Rishton tumani	60910300141	38	39
2103	Pediatriya ishi-Shaxrixon tumani	60910300116	38	39
2104	Pediatriya ishi-Toshloq tumani	60910300143	38	39
2105	Pediatriya ishi-Ulug‘nor tumani	60910300117	38	39
2106	Pediatriya ishi-Xonobod shahri	6091030037	38	39
2107	Pediatriya ishi-Xo‘jaobod tumani	60910300118	38	39
2108	Pediatriya ishi-Yozyovon tumani	60910300145	38	39
2109	Sanoat farmatsiyasi (turlari bo‘yicha)	60910800	39	38
2110	Stomatologiya (yo‘nalishlar bo‘yicha)	60910100	38	39
2111	Tibbiy profilaktika ishi	60910400	39	38
2112	Tibbiy profilaktika ishi-Baliqchi tumani	60910400107	39	38
2113	Tibbiy profilaktika ishi-Bo‘ston tumani	60910400257	39	38
2114	Tibbiy profilaktika ishi-Buloqboshi tumani	60910400109	39	38
2115	Tibbiy profilaktika ishi-Izboskan tumani	60910400110	39	38
2116	Tibbiy profilaktika ishi-Marxamat tumani	60910400112	39	38
2117	Tibbiy profilaktika ishi-Qo‘rg‘ontepa tumani	60910400115	39	38
2118	Tibbiy profilaktika ishi-So‘x tumani	60910400142	39	38
2119	Tibbiy profilaktika ishi-Ulug‘nor tumani	60910400117	39	38
2120	Tibbiy profilaktika ishi-Xo‘jaobod tumani	60910400118	39	38
2121	Xalq tabobati	60911100	38	39
2122	Davolash ishi-Andijon shahri	6091020033	38	39
2123	Davolash ishi-Xonobod shahri	6091020037	38	39
2124	Amaliy matematika	60540200	40	41
2125	Arxivshunoslik	60320300	44	40
2126	Axborot-kommunikatsiya texnologiyalari sohasida kasb taʼlimi	60611300	40	41
2127	Biologiya (turlari bo‘yicha)	60510102	38	39
2128	Dasturiy injiniring	60610600	40	41
2129	Ekologiya va atrof-muhit muhofazasi (tarmoqlar va sohalar bo‘yicha)	60710403	39	38
2130	Filologiya va tillarni o‘qitish: o‘zbek tili	60230119	37	30
2131	Fizika	60530901	41	40
2132	Geografiya	60530400	42	40
2133	Inson resurslarini boshqarish	60411400	40	30
2134	Iqtisodiyot: tarmoqlar va sohalar bo‘yicha	60310106	40	30
2135	Kimyo (turlari bo‘yicha)	60530102	39	40
2136	Kompyuter ilmlari va dasturlash texnologiyalari (yo‘nalishlar bo‘yicha)	60610100	40	41
2137	Kompyuter injiniringi: AT-Servis	60610504	40	41
2138	Kompyuter injiniringi: “Kompyuter injiniringi”	60610503	40	41
2139	Matematika	60540100	40	41
2140	Mehmonxona xo‘jaligini tashkil etish va boshqarish	61010100	40	30
2141	Mexanika va matematik modellashtirish	60531000	41	40
2142	Muqobil energiya manbalari (turlari bo‘yicha)	60711003	41	40
2143	Oziq-ovqat texnologiyasi (mahsulot turlari bo‘yicha)	60720100	39	38
2144	Psixologiya: amaliy psixologiya	60310902	38	31
2145	Psixologiya: oila psixologiyasi	60310904	38	31
2146	Rangtasvir: dastgohli	60210501	43	43
2147	Sotsiologiya	60311000	40	31
2148	Sport faoliyati: badiiy gimnastika	61010303	43	43
2149	Sport faoliyati: basketbol	61010306	43	43
2150	Sport faoliyati: boks	61010309	43	43
2151	Sport faoliyati: futbol	61010342	43	43
2152	Sport faoliyati: kurash	61010320	43	43
2153	Sport faoliyati: voleybol	61010311	43	43
2154	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)	60220302	44	42
2155	Turizm (faoliyat yo‘nalishlari bo‘yicha )	61010403	44	30
2156	Arxitektura (turlari bo‘yicha)	60730100	40	31
2157	Bank ishi va auditi	60410500	40	30
2158	Buxgalteriya hisobi va audit (tarmoqlar bo‘yicha)	60410103	40	30
2159	Gidrotexnika qurilishi (turlari bo‘yicha)	60730902	40	41
2160	Qurilish muhandisligi: bino va inshootlar qurilishi	60730303	40	41
2161	Qurilish muhandisligi: qurilish materiallari, buyumlari va konstruksiyalarini ishlab chiqarish	60730305	40	41
2162	Avtomobilsozlik va traktorsozlik	60712400	40	41
2163	Axborot tizimlari va texnologiyalari (tarmoqlar va sohalar bo‘yicha)	60610203	40	41
2164	Biotibbiyot muhandisligi	60711800	41	40
2165	Dizayn: avtomobilsozlik dizayni	60210408	43	43
2166	Elektr energetikasi (tarmoqlar va yo‘nalishlar bo‘yicha)	60710601	40	41
2167	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari (tarmoqlar bo‘yicha)	60710705	41	40
2168	Energiya mashinasozligi (tarmoqlar bo‘yicha)	60711100	40	41
2169	Energiya tejamkorligi va energoaudit	60710900	40	41
2170	Intellektual muhandislik tizimlari (tarmoqlar va sohalar bo‘yicha)	60711602	41	40
2171	Mashinasozlik texnologiyasi, mashinasozlik ishlab chiqarishini jihozlash va avtomatlashtirish	60720800	40	41
2172	Materialshunoslik va yangi materiallar texnologiyasi (tarmoqlar bo‘yicha)	60720602	39	40
2173	Mehnat muhofazasi va texnika xavfsizligi (tarmoqlar bo‘yicha)	61020202	40	41
2174	Menejment (tarmoqlar va sohalar bo‘yicha)	60411204	40	30
2175	Metallar texnologiyalari (jarayon turlari bo‘yicha)	60712301	40	41
2176	Metrologiya, standartlashtirish va mahsulot sifati menejmenti (tarmoqlar bo‘yicha)	60711302	41	40
2177	Mexatronika va robototexnika	60711500	41	40
2178	Neft va neft-gazni qayta ishlash texnologiyasi	60721100	39	40
2179	Sunʼiy intellekt	60610700	40	41
2180	Tabiiy tolalarni dastlabki ishlash texnologiyasi (xomashyo va jarayon turlari bo‘yicha)	60721300	41	40
2181	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	60711404	41	40
2182	Texnologik mashinalar va jihozlar (tarmoqlar bo‘yicha)	60720705	40	41
2183	Transport logistikasi (transport turlari bo‘yicha)	61040103	40	41
2184	Transport vositalari muhandisligi (turlari bo‘yicha)	60712503	40	41
2185	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi (ishlab chiqarish turlari bo‘yicha)	60721201	40	41
2186	Yo‘l harakatini tashkil etish	61040300	40	41
2187	Yo‘l muhandisligi (sohalar va faoliyat turlari bo‘yicha)	60730802	40	41
2188	Transport logistikasi: avtomobil transporti	61040101	40	41
2189	Agrokimyo va agrotuproqshunoslik	60810700	38	39
2190	Agronomiya (dehqonchilik mahsulotlari turlari bo‘yicha)	60810901	38	39
2191	Biotexnologiya (tarmoqlar bo‘yicha)	60710200	38	39
2192	Biznesni boshqarish: qishloq xo‘jaligida	60411302	40	30
2193	Buxgalteriya hisobi va audit: qishloq xo‘jaligida	60410102	40	30
2194	Chorvachilik mahsulotlarini qayta ishlash texnologiyasi	60811600	39	38
2195	Dorivor o‘simliklarni yetishtirish va qayta ishlash texnologiyasi	60812100	38	39
2196	Gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	60812500	40	41
2197	Ipakchilik va tutchilik	60811700	38	39
2198	Iqtisodiyot: qishloq xo‘jaligida	60310102	40	30
2199	Issiqxona xo‘jaligini tashkil etish va yuritish	60812000	38	39
2200	Logistika: agrologistika	60411701	40	30
2201	Marketing: qishloq xo‘jaligida	60412502	40	30
2202	Meva-sabzavotchilik va uzumchilik	60811800	38	39
2203	Organik qishloq xo‘jaligi mahsulotlarini yetishtirish, saqlash va qayta ishlash	60811400	38	39
2204	O‘rmonchilik (o‘rmonchilar va ularning farzandlari uchun)	60820100303	38	39
2205	O‘rmonchilik va aholi yashash joylarini ko‘kalamzorlashtirish	60820100	38	39
2206	O‘simliklar karantini va himoyasi	60811000	39	38
2207	Professional taʼlim: agronomiya	60112422	38	39
2208	Professional taʼlim: qishloq xo‘jaligini mexanizatsiyalashtirish	60112436	40	41
2209	Qishloq va suv xo‘jaligida energiya taʼminoti	60810500	40	41
2210	Qishloq va suv xo‘jaligida texnik servis	60810300	40	41
2211	Qishloq xo‘jaligi ekinlari seleksiyasi va urug‘chiligi (ekin turlari bo‘yicha)	60811200	38	39
2212	Qishloq xo‘jaligini mexanizatsiyalashtirish	60810100	40	41
2213	Qishloq xo‘jalik mahsulotlarini saqlash va qayta ishlash texnologiyasi (mahsulotlar turlari bo‘yicha)	60811300	39	38
2214	Raqamli iqtisodiyot (tarmoqlar va sohalar bo‘yicha)	60310501	40	30
2215	Sug‘urta ishi	60410600	40	30
2216	Suv xo‘jaligi va melioratsiya	60812300	40	41
2217	Suv xo‘jaligi va melioratsiya ishlarini mexanizatsiyalashtirish	60812400	40	41
2218	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish: qishloq xo‘jaligida	60711402	41	40
2219	Tuproq bonitirovkasi va yer resurslaridan foydalanish	60810800	38	39
2220	Turizm: agroturizm	61010401	44	30
2221	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)	60840102	38	39
2222	Yurisprudensiya: qishloq xo‘jaligi huquqi	60420102	45	30
2223	Zooinjeneriya (turlari bo‘yicha)	60811503	38	39
2224	Zooinjeneriya: baliqchilik	60811505	38	39
2225	Zooinjeneriya: qoramolchilik	60811502	38	39
2226	Biologiya-G‘ijduvon tumani	60110900147	38	39
2227	Biologiya-Romitan tumani	60110900154	38	39
2228	Boshlang‘ich taʼlim-G‘ijduvon tumani	60110500147	31	40
2229	Boshlang‘ich taʼlim-Romitan tumani	60110500154	31	40
2230	Chaqiriqqacha harbiy taʼlim	60112000	40	43
2231	Chaqiriqqacha harbiy taʼlim-G‘ijduvon tumani	60112000147	40	43
2232	Fizika va astronomiya-Romitan tumani	60110700154	41	40
2233	Fizika va astronomiya-Shofirkon tumani	60110700155	41	40
2234	Kimyo-Romitan tumani	60110800154	39	40
2235	Kimyo-Shofirkon tumani	60110800155	39	40
2236	Matematika va informatika-Peshku tumani	60110600151	40	41
2237	Matematika va informatika-Romitan tumani	60110600154	40	41
2238	Matematika va informatika-Shofirkon tumani	60110600155	40	41
2239	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-G‘ijduvon tumani	60112100147	44	31
2240	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Romitan tumani	60112100154	44	31
2241	O‘zbek tili va adabiyoti-Peshku tumani	60111400151	37	30
2242	O‘zbek tili va adabiyoti-Romitan tumani	60111400154	37	30
2243	O‘zbek tili va adabiyoti-Shofirkon tumani	60111400155	37	30
2244	Pedagogika-G‘ijduvon tumani	60110100147	44	31
2245	Pedagogika-Romitan tumani	60110100154	44	31
2246	Tarix-Shofirkon tumani	60111100155	44	42
2247	Xorijiy til va adabiyoti: ingliz tili-Peshku tumani	60111802151	33	31
2248	Xorijiy til va adabiyoti: ingliz tili-Romitan tumani	60111802154	33	31
2249	Xorijiy til va adabiyoti: ingliz tili-Shofirkon tumani	60111802155	33	31
2250	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Peshku tumani	60111701151	36	37
2251	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Romitan tumani	60111701154	36	37
2252	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Shofirkon tumani	60111701155	36	37
2253	Davolash ishi-Buxoro shahri	6091020043	38	39
2254	Davolash ishi-Buxoro tumani	60910200146	38	39
2255	Davolash ishi-G‘ijduvon tumani	60910200147	38	39
2256	Davolash ishi-G‘ozg‘on shahri	6091020064	38	39
2257	Davolash ishi-Jondor tumani	60910200148	38	39
2258	Davolash ishi-Karmana tumani	60910200207	38	39
2259	Davolash ishi-Kogon shahri	6091020044	38	39
2260	Davolash ishi-Kogon tumani	60910200149	38	39
2261	Davolash ishi-Konimex tumani	60910200208	38	39
2262	Davolash ishi-Navbahor tumani	60910200209	38	39
2263	Davolash ishi-Nurota tumani	60910200210	38	39
2264	Davolash ishi-Olot tumani	60910200150	38	39
2265	Davolash ishi-Peshku tumani	60910200151	38	39
2266	Davolash ishi-Qiziltepa tumani	60910200211	38	39
2267	Davolash ishi-Qorako‘l tumani	60910200152	38	39
2268	Davolash ishi-Qorovulbozor tumani	60910200153	38	39
2269	Davolash ishi-Romitan tumani	60910200154	38	39
2270	Davolash ishi-Shofirkon tumani	60910200155	38	39
2271	Davolash ishi-Vobkent tumani	60910200156	38	39
2272	Davolash ishi-Xatirchi tumani	60910200214	38	39
2273	Davolash ishi-Zarafshon shahri	6091020052	38	39
2274	Pediatriya ishi-Buxoro shahri	6091030043	38	39
2275	Pediatriya ishi-Buxoro tumani	60910300146	38	39
2276	Pediatriya ishi-G‘ijduvon tumani	60910300147	38	39
2277	Pediatriya ishi-Jondor tumani	60910300148	38	39
2278	Pediatriya ishi-Kogon shahri	6091030044	38	39
2279	Pediatriya ishi-Kogon tumani	60910300149	38	39
2280	Pediatriya ishi-Olot tumani	60910300150	38	39
2281	Pediatriya ishi-Peshku tumani	60910300151	38	39
2282	Pediatriya ishi-Qorako‘l tumani	60910300152	38	39
2283	Pediatriya ishi-Qorovulbozor tumani	60910300153	38	39
2675	Cholg‘u ijrochiligi: xalq cholg‘ulari (dutor, dutor bas, dutor kontrabas, tanbur)	60211517	43	43
2676	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak qobus bas, g‘ijjak qobus-kontrabas)	60211514	43	43
2677	Cholg‘u ijrochiligi: xalq cholg‘ulari (g‘ijjak, g‘ijjakalʼt)	60211515	43	43
2678	Cholg‘u ijrochiligi: xalq cholg‘ulari (nay-qo‘shnay, bayan-akkordeyon)	60211519	43	43
2679	Cholg‘u ijrochiligi: xalq cholg‘ulari (zarbli cholg‘ular)	60211518	43	43
2680	Dirijyorlik: akademik xor dirijyorligi	60211301	43	43
2681	Dirijyorlik: opera-simfoniya dirijyorligi	60211302	43	43
2682	Professional taʼlim: cholg‘u ijrochiligi (fortepiano)	60112408	43	43
2683	Professional taʼlim: cholg‘u ijrochiligi (xalq cholg‘ulari, torli cholg‘ular, puflama va zarbli cholg‘ular)	60112414	43	43
2684	Professional taʼlim: vokal sanʼati (akademik xonandalik)	60112426	43	43
2685	Vokal sanʼati: akademik xonandalik	60211401	43	43
2686	Cholg‘u ijrochiligi: puflama va zarbli cholg‘ular (fleyta, goboy)	60211508	43	43
2687	Cholg‘u ijrochiligi: torli cholg‘ular (violonchel, kontrabas)	60211511	43	43
2688	Cholg‘u ijrochiligi: xalq cholg‘ulari (dutor, dutor bas, dutor kontrabas, dombira)	60211516	43	43
2689	Aktyorlik sanʼati: dramatik teatr va kino aktyorligi	60211110	43	43
2690	Aktyorlik sanʼati: musiqali teatr aktyorligi	60211108	43	43
2691	Aktyorlik sanʼati: qo‘g‘irchoq teatri aktyorligi	60211111	43	43
2692	Kutubxona-axborot faoliyati: kutubxonachilik va bibliografiya	60320401	40	31
2693	Professional taʼlim: xalq ijodiyoti (chog‘u ijrochiligi)	60112410	43	43
2694	Qo‘g‘irchoqlar ishlab chiqarish texnologiyasi	60723100	40	41
2695	Rejissorlik: dramatik teatr rejissorligi	60211201	43	43
2696	Rejissorlik: qo‘g‘irchoq teatri rejissorligi	60211203	43	43
2697	Xalq ijodiyoti: ashula va raqs	60211902	43	43
2698	Xalq ijodiyoti: askiya sanʼati	60211901	43	43
2699	Xalq ijodiyoti: folklor va etnografiya	60211904	43	43
2700	Aktyorlik sanʼati: estrada aktyorligi	60211109	43	43
2701	Grim sanʼati	60211700	43	43
2702	Kino-teleoperatorlik	60210200	43	43
2703	Menejment: madaniyat va sanʼat sohasi menejmenti	60411206	40	30
2704	Professional taʼlim: xalq ijodiyoti (vokal ijrochiligi)	60112406	43	43
2705	Rejissorlik: estrada va ommaviy tomoshalar rejissorligi	60211205	43	43
2706	Rejissorlik: kino va televideniye rejissorligi	60211202	43	43
2707	Rejissorlik: musiqali teatr rejissorligi	60211204	43	43
2708	Sanʼat sohasida prodyuserlik	60211800	40	30
2709	Sanʼatda animatsiyaviy va multimediyaviy loyihalash	60210300	43	43
2710	Sanʼatshunoslik: kino sanʼati tanqidi va tahlili	60211001	43	43
2711	Sanʼatshunoslik: sahna va ekran sanʼati dramaturgiyasi	60211005	43	43
2712	Sanʼatshunoslik: teatrshunoslik	60211003	43	43
2713	Texnogen sanʼat: kino, televideniye va radio ovoz rejissorligi	60210101	43	43
2714	Professional taʼlim: xoreografiya	60112411	43	43
2715	Sanʼatshunoslik: xoreografiya	60211002	43	43
2716	Xoreografiya: xoreografiya jamoalari rahbari	60211603	43	43
2717	Xoreografiya: zamonaviy raqs	60211601	43	43
2718	Dizayn: mediadizayn	60210412	43	43
2719	Jurnalistika: harbiy jurnalistika	60320111	43	30
2720	Jurnalistika: iqtisodiy jurnalistika	60320103	43	30
2721	Jurnalistika: sanʼat jurnalistikasi	60320107	43	30
2722	Jurnalistika: sayohat jurnalistikasi	60320106	43	30
2723	Jurnalistika: sport jurnalistikasi	60320108	43	30
2724	Marketing: mediamarketing va reklama	60412503	40	30
2725	Menejment: mediamenejment	60411202	40	30
2726	Amaliy etika	60220600	44	31
2727	Antropologiya va etnologiya	60230500	44	42
2728	Astronomiya	60531100	41	40
2729	Biologiya: matematik biologiya	60510101	38	39
2730	Budjet nazorati va g‘aznachiligi	60410700	40	30
2731	Ekonometrika	60310200	40	30
2732	Falsafa: tizimli tahlil va mantiq	60220502	44	31
2733	Fizika: matematik fizika	60530902	41	40
2734	Geoaxborot tizimlari va geofazoviy tahlil	99999998	40	41
2735	Gidrologiya (tarmoqlar bo‘yicha)	60530802	40	42
2832	Filologiya va tillarni o‘qitish: rus tili-Nishon tumani	60230113190	35	30
2833	Boshlang‘ich taʼlim-Chiroqchi tumani	60110500182	31	40
2834	Boshlang‘ich taʼlim-Dehqonobod tumani	60110500183	31	40
2835	Boshlang‘ich taʼlim-Kitob tumani	60110500186	31	40
2836	Boshlang‘ich taʼlim-Nishon tumani	60110500190	31	40
2837	Boshlang‘ich taʼlim-Shahrisabz tumani	60110500193	31	40
2838	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Dehqonobod tumani	60112100183	44	31
2839	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Kitob tumani	60112100186	44	31
2840	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Shahrisabz tumani	60112100193	44	31
2841	Pedagogika-Chiroqchi tumani	60110100182	44	31
2842	Pedagogika-Kitob tumani	60110100186	44	31
2843	Pedagogika-Shahrisabz tumani	60110100193	44	31
2844	Xorijiy til va adabiyoti: ingliz tili-Chiroqchi tumani	60111802182	33	31
2845	Xorijiy til va adabiyoti: ingliz tili-Kitob tumani	60111802186	33	31
2846	Xorijiy til va adabiyoti: ingliz tili-Qamashi tumani	60111802191	33	31
2847	Xorijiy til va adabiyoti: ingliz tili-Shahrisabz tumani	60111802193	33	31
2848	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Chiroqchi tumani	60111701182	36	37
2849	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Dehqonobod tumani	60111701183	36	37
2850	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Kitob tumani	60111701186	36	37
2851	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Qamashi tumani	60111701191	36	37
2852	O‘simlikshunoslik (ekin turlari bo‘yicha)	60812202	38	39
2853	Professional taʼlim: gidrotexnika inshootlari va nasos stansiyalaridan foydalanish	60112421	40	41
2854	Professional taʼlim: suv xo‘jaligi va melioratsiya	60112404	40	41
2855	Professional taʼlim: yer kadastri va yer tuzish	60112433	40	41
2856	Ekologiya va atrof-muhit muhofazasi: suv xo‘jaligida	60710402	39	38
2857	Gidroenergetika	60710800	40	41
2858	Kadastr: ko‘chmas mulk kadastri	60722801	40	41
2859	Marksheyderlik ishi	60722000	40	41
2860	Qurilish muhandisligi: neft-gazni qayta ishlash sanoati obyektlari qurilishi	60730306	40	41
2861	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish (tarmoqlar bo‘yicha)	60711401	41	40
2862	Axborot tizimlari va texnologiyalari: qishloq xo‘jaligida raqamli texnologiyalar	60610201	40	41
2863	Veterinariya meditsinasi: yirik shoxli mollar kasalliklari	60840101	38	39
2864	Yer kadastri va yerdan foydalanish	60810600	40	42
2865	Davolash ishi-Beruniy tumani	6091020092	38	39
2866	Davolash ishi-Chimboy tumani	6091020093	38	39
2867	Davolash ishi-Ellikqalʼa tumani	6091020094	38	39
2868	Davolash ishi-Nukus shahri	6091020031	38	39
2869	Davolash ishi-To‘rtko‘l tumani	60910200103	38	39
2870	Pediatriya ishi-Beruniy tumani	6091030092	38	39
2871	Pediatriya ishi-Chimboy tumani	6091030093	38	39
2872	Pediatriya ishi-Ellikqalʼa tumani	6091030094	38	39
2873	Pediatriya ishi-To‘rtko‘l tumani	60910300103	38	39
2874	Arxitektura yodgorliklari rekonstruktsiyasi va restavratsiyasi	60731100	40	31
2875	Dizayn: landshaft dizayni	60210406	43	43
2876	Jurnalistika (faoliyat turlari bo‘yicha)	60320101	43	30
2877	Noshirlik ishi	60230600	31	30
2878	Professional taʼlim: qurilish muhandisligi (bino va inshootlar qurilishi)	60112423	40	41
2879	Tuproqshunoslik	60530700	38	39
2880	Boshlang‘ich taʼlim-Farg‘ona tumani	60110500134	31	40
2881	Boshlang‘ich taʼlim-Rishton tumani	60110500141	31	40
2882	Geografiya va iqtisodiy bilim asoslari-Farg‘ona tumani	60111000134	42	40
2883	Geografiya va iqtisodiy bilim asoslari-So‘x tumani	60111000142	42	40
2884	Kimyo-So‘x tumani	60110800142	39	40
2885	Matematika va informatika-Farg‘ona tumani	60110600134	40	41
2886	Matematika va informatika-Rishton tumani	60110600141	40	41
2887	Matematika va informatika-So‘x tumani	60110600142	40	41
2888	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Farg‘ona tumani	60112100134	44	31
2889	Tarix-Farg‘ona tumani	60111100134	44	42
2890	Tarix-So‘x tumani	60111100142	44	42
2891	Xorijiy til va adabiyoti: ingliz tili-Farg‘ona tumani	60111802134	33	31
2892	Xorijiy til va adabiyoti: ingliz tili-So‘x tumani	60111802142	33	31
2893	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Farg‘ona tumani	60111701134	36	37
2894	Atrof-muhit muhandisligi	60713400	39	38
2895	Dizayn: interyer dizayni	60210409	43	43
2896	Geomatika muhandisligi	60723300	40	41
2897	Ko‘chmas mulkni boshqarish	60731300	40	41
2898	Mehnat muhofazasi va salomatlik muhandisligi	61020300	40	41
2899	Mexanika muhandisligi	60713500	41	40
2900	Professional taʼlim: muhandislik kommunikatsiyalari qurilish va montaji (turlari bo‘yicha)	60112437	40	41
2901	Professional taʼlim: qurilish muhandisligi (faoliyat turlari bo‘yicha)	60112413	40	41
2902	Qurilish muhandisligi (faoliyat turlari bo‘yicha)	60730302	40	41
2903	Shahar qurilishi va loyihalash	60731500	40	41
2904	Filologiya va tillarni o‘qitish: italyan tili	60230106	30	31
2905	Xorijiy til va adabiyoti: ingliz tili-Kattaqo‘rg‘on tumani	60111802218	33	31
2906	Xorijiy til va adabiyoti: ingliz tili-Narpay tumani	60111802219	33	31
2907	Xorijiy til va adabiyoti: ingliz tili-Nurobod tumani	60111802220	33	31
2908	Xorijiy til va adabiyoti: ingliz tili-Paxtachi tumani	60111802223	33	31
2909	Xorijiy til va adabiyoti: ingliz tili-Payariq tumani	60111802224	33	31
2910	Xorijiy til va adabiyoti: ingliz tili-Qo‘shrabot tumani	60111802225	33	31
2911	Xorijiy til va adabiyoti: ingliz tili-Urgut tumani	60111802228	33	31
2913	Davolash ishi-Ishtixon tumani	60910200216	38	39
2914	Davolash ishi-Jomboy tumani	60910200217	38	39
2915	Davolash ishi-Kattaqo‘rg‘on shahri	6091020053	38	39
2916	Davolash ishi-Kattaqo‘rg‘on tumani	60910200218	38	39
2917	Davolash ishi-Kitob tumani	60910200186	38	39
2918	Davolash ishi-Ko‘kdala tumani	60910200263	38	39
2919	Davolash ishi-Narpay tumani	60910200219	38	39
2920	Davolash ishi-Nishon tumani	60910200190	38	39
2921	Davolash ishi-Nurobod tumani	60910200220	38	39
2922	Davolash ishi-Oqdaryo tumani	60910200221	38	39
2923	Davolash ishi-Pastdarg‘om tumani	60910200222	38	39
2924	Davolash ishi-Paxtachi tumani	60910200223	38	39
2925	Davolash ishi-Payariq tumani	60910200224	38	39
2926	Davolash ishi-Qamashi tumani	60910200191	38	39
2927	Davolash ishi-Qarshi shahri	6091020048	38	39
2928	Davolash ishi-Qarshi tumani	60910200192	38	39
2929	Davolash ishi-Samarqand shahri	6091020054	38	39
2930	Davolash ishi-Samarqand tumani	60910200226	38	39
2931	Davolash ishi-Shahrisabz shahri	60910200253	38	39
2932	Davolash ishi-Tayloq tumani	60910200227	38	39
2933	Davolash ishi-Urgut tumani	60910200228	38	39
2934	Davolash ishi-Yakkabog‘ tumani	60910200194	38	39
2935	Menejment : sog‘liqni saqlash menejmenti	60411209	40	30
2936	Pediatriya ishi-Bandixon tumani	60910300255	38	39
2937	Pediatriya ishi-Denov tumani	60910300171	38	39
2938	Pediatriya ishi-G‘ozg‘on shahri	6091030064	38	39
2939	Pediatriya ishi-Ishtixon tumani	60910300216	38	39
2940	Pediatriya ishi-Karmana tumani	60910300207	38	39
2941	Pediatriya ishi-Kattaqo‘rg‘on tumani	60910300218	38	39
2942	Pediatriya ishi-Kitob tumani	60910300186	38	39
2943	Pediatriya ishi-Ko‘kdala tumani	60910300263	38	39
2944	Pediatriya ishi-Muborak tumani	60910300189	38	39
2945	Pediatriya ishi-Navbahor tumani	60910300209	38	39
2946	Pediatriya ishi-Nishon tumani	60910300190	38	39
2947	Pediatriya ishi-Nurobod tumani	60910300220	38	39
2948	Pediatriya ishi-Nurota tumani	60910300210	38	39
2949	Pediatriya ishi-Oltinsoy tumani	60910300174	38	39
2950	Pediatriya ishi-Payariq tumani	60910300224	38	39
2951	Pediatriya ishi-Qarshi shahri	6091030048	38	39
2952	Pediatriya ishi-Qarshi tumani	60910300192	38	39
2953	Pediatriya ishi-Qiziltepa tumani	60910300211	38	39
2954	Pediatriya ishi-Qiziriq tumani	60910300175	38	39
2955	Pediatriya ishi-Qo‘shrabot tumani	60910300225	38	39
2956	Pediatriya ishi-Samarqand shahri	6091030054	38	39
2957	Pediatriya ishi-Shahrisabz shahri	60910300253	38	39
2958	Pediatriya ishi-Shahrisabz tumani	60910300193	38	39
2959	Pediatriya ishi-Termiz shahri	6091030047	38	39
2960	Pediatriya ishi-Xatirchi tumani	60910300214	38	39
2961	Pediatriya ishi-Zarafshon shahri	6091030052	38	39
2962	Tibbiy profilaktika ishi-Chiroqchi tumani	60910400182	39	38
2963	Tibbiy profilaktika ishi-G‘uzor tumani	60910400184	39	38
2964	Tibbiy profilaktika ishi-Kasbi tumani	60910400185	39	38
2965	Tibbiy profilaktika ishi-Kattaqo‘rg‘on tumani	60910400218	39	38
2966	Tibbiy profilaktika ishi-Kitob tumani	60910400186	39	38
2967	Tibbiy profilaktika ishi-Ko‘kdala tumani	60910400263	39	38
2968	Tibbiy profilaktika ishi-Narpay tumani	60910400219	39	38
2969	Tibbiy profilaktika ishi-Nurobod tumani	60910400220	39	38
2970	Tibbiy profilaktika ishi-Oqdaryo tumani	60910400221	39	38
2971	Tibbiy profilaktika ishi-Paxtachi tumani	60910400223	39	38
2972	Tibbiy profilaktika ishi-Qamashi tumani	60910400191	39	38
2973	Tibbiy profilaktika ishi-Qo‘shrabot tumani	60910400225	39	38
2974	Tibbiy profilaktika ishi-Shahrisabz shahri	60910400253	39	38
2975	Tibbiy profilaktika ishi-Shahrisabz tumani	60910400193	39	38
2976	Tibbiy profilaktika ishi-Urgut tumani	60910400228	39	38
2977	Tibbiy profilaktika ishi-Yakkabog‘ tumani	60910400194	39	38
2978	Tibbiy-biologik ish-Payariq tumani	60910600224	39	38
2979	Tibbiy-biologik ish-Qo‘shrabot tumani	60910600225	39	38
2980	Tibbiy-biologik ish-Samarqand tumani	60910600226	39	38
2981	Biologiya (turlari bo‘yicha)-Kattaqo‘rg‘on tumani	60510102218	38	39
2982	Biologiya (turlari bo‘yicha)-Nurobod tumani	60510102220	38	39
2983	Biologiya (turlari bo‘yicha)-Payariq tumani	60510102224	38	39
2984	Biologiya (turlari bo‘yicha)-Qo‘shrabot tumani	60510102225	38	39
2985	Filologiya va tillarni o‘qitish: o‘zbek tili-Ishtixon tumani	60230119216	37	30
2986	Filologiya va tillarni o‘qitish: o‘zbek tili-Nurobod tumani	60230119220	37	30
2987	Filologiya va tillarni o‘qitish: o‘zbek tili-Payariq tumani	60230119224	37	30
2988	Filologiya va tillarni o‘qitish: o‘zbek tili-Qo‘shrabot tumani	60230119225	37	30
2989	Filologiya va tillarni o‘qitish: o‘zbek tili-Urgut tumani	60230119228	37	30
2990	Fizika-Nurobod tumani	60530901220	41	40
2991	Fizika-Payariq tumani	60530901224	41	40
2992	Fizika-Urgut tumani	60530901228	41	40
2993	Geografiya-Nurobod tumani	60530400220	42	40
2994	Geografiya-Qo‘shrabot tumani	60530400225	42	40
2995	Geografiya-Urgut tumani	60530400228	42	40
2996	Ijtimoiy ish: oila va bolalar bilan ishlash-Navoiy viloyati	60920102110	38	31
2997	Ijtimoiy ish: oila va bolalar bilan ishlash-Samarqand viloyati	60920102111	38	31
2998	Kimyo (turlari bo‘yicha)-Ishtixon tumani	60530102216	39	40
2999	Kimyo (turlari bo‘yicha)-Kattaqo‘rg‘on tumani	60530102218	39	40
3000	Kimyo (turlari bo‘yicha)-Nurobod tumani	60530102220	39	40
3001	Kimyo (turlari bo‘yicha)-Qo‘shrabot tumani	60530102225	39	40
3002	Kimyo (turlari bo‘yicha)-Urgut tumani	60530102228	39	40
3003	Matematika-Nurobod tumani	60540100220	40	41
3004	Matematika-Paxtachi tumani	60540100223	40	41
3005	Matematika-Payariq tumani	60540100224	40	41
3006	Matematika-Urgut tumani	60540100228	40	41
3007	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Ishtixon tumani	60220302216	44	42
3008	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Kattaqo‘rg‘on tumani	60220302218	44	42
3009	Tarix (mamlakatlar va yo‘nalishlar bo‘yicha)-Payariq tumani	60220302224	44	42
3010	Filologiya va tillarni o‘qitish: rus tili-Nurobod tumani	60230113220	35	30
3011	Pedagogika-Ishtixon tumani	60110100216	44	31
3012	Pedagogika-Nurobod tumani	60110100220	44	31
3013	Pedagogika-Qo‘shrabot tumani	60110100225	44	31
3014	Boshlang‘ich taʼlim-Bobotog‘ hududi	60110500301	31	40
3015	Boshlang‘ich taʼlim-Sariosiyo tumani	60110500177	31	40
3016	Filologiya va tillarni o‘qitish: o‘zbek tili-Bobotog‘ hududi	60230119301	37	30
3017	Filologiya va tillarni o‘qitish: o‘zbek tili-Oltinsoy tumani	60230119174	37	30
3018	Filologiya va tillarni o‘qitish: o‘zbek tili-Sariosiyo tumani	60230119177	37	30
3019	Kompyuter injiniringi: “Kompyuter injiniringi”, “AT-servis”, “Axborot xavfsizligi”, “Multimedia texnologiyalari”	60610501	40	41
3020	Xorijiy til va adabiyoti: ingliz tili-Bobotog‘ hududi	60111802301	33	31
3021	Xorijiy til va adabiyoti: ingliz tili-Denov tumani	60111802171	33	31
3022	Xorijiy til va adabiyoti: ingliz tili-Sariosiyo tumani	60111802177	33	31
3023	Xorijiy til va adabiyoti: ingliz tili-Uzun tumani	60111802181	33	31
3024	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Bobotog‘ hududi	60111701301	36	37
3025	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Denov tumani	60111701171	36	37
3026	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Sariosiyo tumani	60111701177	36	37
3027	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Uzun tumani	60111701181	36	37
3028	Baholash ishi	60412700	40	30
3029	Biznes-tahlil	60411500	40	30
3030	Investitsion loyihalarga xizmat ko‘rsatish va moliyalashtirish	60411000	40	30
3031	Agronomiya: yem-xashak ekinlari	60810902	38	39
3032	O‘simlikshunoslik: yaylov cho‘l o‘simlikshunosligi	60812203	38	39
3033	Veterinariya biotexnologiyasi	60840500	38	39
3034	Veterinariya diagnostikasi va laboratoriya ishlari	60840300	38	39
3035	Veterinariya farmatsevtikasi	60840200	38	39
3036	Veterinariya sanitariya ekspertizasi	60840400	38	39
3037	Zooinjeneriya: qorako‘lchilik	60811507	38	39
3038	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Ellikqalʼa tumani	6084010294	38	39
3039	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Kegeyli tumani	6084010295	38	39
3040	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-Shumanay tumani	60840102101	38	39
3041	Veterinariya meditsinasi (faoliyat turlari bo‘yicha)-To‘rtko‘l tumani	60840102103	38	39
3042	Zooinjeneriya (turlari bo‘yicha)-Amudaryo tumani	6081150391	38	39
3043	Zooinjeneriya (turlari bo‘yicha)-Beruniy tumani	6081150392	38	39
3044	Zooinjeneriya (turlari bo‘yicha)-Qanliko‘l tumani	6081150398	38	39
3045	Zooinjeneriya: yilqichilik va tuyachilik	60811506	38	39
3046	Biologiya-Bobotog‘ hududi	60110900301	38	39
3047	Biologiya-Boysun tumani	60110900170	38	39
3048	Biologiya-Uzun tumani	60110900181	38	39
3049	Fizika va astronomiya-Bobotog‘ hududi	60110700301	41	40
3050	Fizika va astronomiya-Sherobod tumani	60110700178	41	40
3051	Fizika va astronomiya-Uzun tumani	60110700181	41	40
3052	Geografiya va iqtisodiy bilim asoslari-Bobotog‘ hududi	60111000301	42	40
3053	Geografiya va iqtisodiy bilim asoslari-Boysun tumani	60111000170	42	40
3054	Geografiya va iqtisodiy bilim asoslari-Jarqo‘rg‘on tumani	60111000172	42	40
3055	Geografiya va iqtisodiy bilim asoslari-Qumqo‘rg‘on tumani	60111000176	42	40
3056	Geografiya va iqtisodiy bilim asoslari-Uzun tumani	60111000181	42	40
3057	Matematika va informatika-Bobotog‘ hududi	60110600301	40	41
3058	Matematika va informatika-Boysun tumani	60110600170	40	41
3059	Matematika va informatika-Jarqo‘rg‘on tumani	60110600172	40	41
3060	Matematika va informatika-Oltinsoy tumani	60110600174	40	41
3061	Matematika va informatika-Sariosiyo tumani	60110600177	40	41
3062	Matematika va informatika-Uzun tumani	60110600181	40	41
3063	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Bobotog‘ hududi	60112100301	44	31
3064	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Jarqo‘rg‘on tumani	60112100172	44	31
3065	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Oltinsoy tumani	60112100174	44	31
3066	Milliy g‘oya, maʼnaviyat asoslari va huquq taʼlimi-Uzun tumani	60112100181	44	31
3067	O‘zbek tili va adabiyoti-Bobotog‘ hududi	60111400301	37	30
3068	O‘zbek tili va adabiyoti-Oltinsoy tumani	60111400174	37	30
3069	O‘zbek tili va adabiyoti-Sariosiyo tumani	60111400177	37	30
3070	Pedagogika-Bobotog‘ hududi	60110100301	44	31
3071	Pedagogika-Uzun tumani	60110100181	44	31
3072	Tarix-Bobotog‘ hududi	60111100301	44	42
3073	Tarix-Qumqo‘rg‘on tumani	60111100176	44	42
3074	Tarix-Sariosiyo tumani	60111100177	44	42
3075	Tarix-Uzun tumani	60111100181	44	42
3076	Xorijiy til va adabiyoti: ingliz tili-Boysun tumani	60111802170	33	31
3077	Xorijiy til va adabiyoti: ingliz tili-Jarqo‘rg‘on tumani	60111802172	33	31
3078	Xorijiy til va adabiyoti: ingliz tili-Muzrabot tumani	60111802173	33	31
3079	Xorijiy til va adabiyoti: ingliz tili-Oltinsoy tumani	60111802174	33	31
3080	Xorijiy til va adabiyoti: ingliz tili-Qumqo‘rg‘on tumani	60111802176	33	31
3081	Xorijiy til va adabiyoti: ingliz tili-Sho‘rchi tumani	60111802179	33	31
3082	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Boysun tumani	60111701170	36	37
3083	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Jarqo‘rg‘on tumani	60111701172	36	37
3084	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Muzrabot tumani	60111701173	36	37
3085	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Oltinsoy tumani	60111701174	36	37
3086	O‘zga tilli guruhlarda rus tili (o‘zbek guruhlari uchun)-Qumqo‘rg‘on tumani	60111701176	36	37
3087	Dizayn: milliy kostyum	60210405	43	43
3088	Ijtimoiy ish: oila va bolalar bilan ishlash-Qashqadaryo viloyati	60920102108	38	31
3089	Ijtimoiy ish: oila va bolalar bilan ishlash-Surxondaryo viloyati	60920102107	38	31
3090	Kimyo (turlari bo‘yicha)-Bobotog‘ hududi	60530102301	39	40
3091	Kimyo (turlari bo‘yicha)-Boysun tumani	60530102170	39	40
3092	Kimyo (turlari bo‘yicha)-Jarqo‘rg‘on tumani	60530102172	39	40
3093	Kimyo (turlari bo‘yicha)-Oltinsoy tumani	60530102174	39	40
3094	Kimyo (turlari bo‘yicha)-Sariosiyo tumani	60530102177	39	40
3095	Mahsulotlarning kimyoviy tahlili (oziq-ovqat mahsulotlari)	60723000	39	40
3096	Matematika-Jarqo‘rg‘on tumani	60540100172	40	41
3097	Matematika-Muzrabot tumani	60540100173	40	41
3098	Matematika-Oltinsoy tumani	60540100174	40	41
3099	Matematika-Sariosiyo tumani	60540100177	40	41
3100	Matematika-Sherobod tumani	60540100178	40	41
3101	Matematika-Sho‘rchi tumani	60540100179	40	41
3102	Matematika-Uzun tumani	60540100181	40	41
3103	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: milliy tikuv buyumlari	60721202	40	41
3104	Gidrotexnika va geotexnika muhandisligi	60731200	40	41
3105	Qurilish muhandisligi: qurilish materiallari texnologiyasi va standartlashtirish	60730301	40	41
3106	Urbanistika	60731400	40	41
3107	Iqtisodiyot: qurilish	60310103	40	30
3108	Professional taʼlim: qurilish muhandisligi	60112420	40	41
3109	Axborot-kommunikatsiya texnologiyalari sohasida iqtisodiyot va menejment	60611200	40	30
3110	Elektr aloqa injiniringi	60612400	40	41
3111	Elektron tijorat	60412800	40	30
3112	Infokommunikatsiya injiniringi	60612000	40	41
3113	Kiberxavfsizlik injiniringi	60612100	40	41
3114	Kompyuter injiniringi: multimedia texnologiyalari	60610505	40	41
3115	Logistika injiniringi	61011000	40	30
3116	Pochta aloqa texnologiyasi	60611400	40	41
3117	Sunʼiy yo‘ldoshli aloqa tizimlari	60612300	40	41
3118	Telekommunikatsiya texnologiyalari: mobil tizimlar	60611003	40	41
3119	Telekommunikatsiya texnologiyalari: teleradioeshittirish	60611004	40	41
3120	Telekommunikatsiya texnologiyalari: “Telekommunikatsiyalar”	60611001	40	41
3121	Televizion texnologiyalar: audiovizual texnologiyalar	60611105	40	41
3122	Televizion texnologiyalar: telestudiya tizimlari va ilovalari	60611106	40	41
3123	Kompyuter injiniringi: “Kompyuter injiniringi”, “AT-Servis”, “Multimediya texnologiyalari”	60610502	40	41
3124	Ekologiya va atrof-muhit muhofazasi: qishloq xo‘jaligida	60710401	39	38
3125	Professional taʼlim: iqtisodiyot (qishloq xo‘jaligida)	60112435	40	30
3126	Professional taʼlim: o‘rmonchilik va aholi yashash joylarini ko‘kalamzorlashtirish	60112401	38	39
3127	Professional taʼlim: veterinariya meditsinasi (faoliyat turlari bo‘yicha)	60112425	38	39
3128	Zooinjeneriya: asalarichilik	60811501	38	39
3129	Biznesni boshqarish: barqaror biznes	60411301	40	30
3130	Iqtisodiyot: shaharlar iqtisodiyoti	60310108	40	30
3131	Iqtisodiyot: taraqqiyot iqtisodiyoti	60310105	40	30
3132	Iqtisodiyot: yashil iqtisodiyot	60310109	40	30
3133	Xalqaro valyuta-kredit munosabatlari	60412100	40	30
3134	Iqtisodiyot: qishloq xo‘jaligi iqtisodiyoti	60310110	40	30
3135	Ona tili va adabiyot: koreys tili va adabiyot	60111504	30	31
3136	Falsafa: sharq falsafasi va madaniyati	60220503	44	31
3137	Filologiya va tillarni o‘qitish: dariy tili	60230102	30	31
3138	Filologiya va tillarni o‘qitish: hind tili	60230122	30	31
3139	Filologiya va tillarni o‘qitish: indonez tili	60230104	30	31
3140	Filologiya va tillarni o‘qitish: malay tili	60230110	30	31
3141	Filologiya va tillarni o‘qitish: mumtoz sharq tillari (fors tili)	60230111	30	31
3142	Filologiya va tillarni o‘qitish: urdu tili	60230118	30	31
3143	Filologiya va tillarni o‘qitish: uyg‘ur tili	60230117	30	31
3144	Gid hamrohligi va tarjimonlik faoliyati: malay tili	61010502	30	31
3145	Gid hamrohligi va tarjimonlik faoliyati: urdu tili	61010504	30	31
3146	Matnshunoslik va adabiy manbashunoslik: fors tili	60230303	30	31
3147	Tarix: Afg‘oniston tarixi	60220303	44	42
3148	Tarix: Eron tarixi	60220309	44	42
3149	Tarix: Koreya tarixi	60220304	44	42
3150	Tarix: Markaziy Osiyo xalqlari tarixi	60220305	44	42
3151	Tarix: Turkiya tarixi	60220307	44	42
3152	Tarix: Yaponiya tarixi	60220310	44	42
3153	Tarjima nazariyasi va amaliyoti: koreys tili	60230204	30	31
3154	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Koreya	60411802	40	30
3155	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Malayziya	60411803	40	30
3156	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Turkiya	60411804	40	30
3157	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Xitoy	60411805	40	30
3158	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: Yaponiya	60411806	40	30
3159	Tarix: Hindiston tarixi	60220308	44	42
3160	Tarix: Pokiston tarixi	60220306	44	42
3161	Xorijiy mamlakatlar iqtisodiyoti va mamlakatshunoslik: arab mamlakatlari	60411801	40	30
3162	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari: elektr mashinasozlik	60710706	41	40
3163	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari: mashinasozlik	60710704	41	40
3164	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi: geofizik usullar	60721602	41	40
3165	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi: geologiya-razvedka ishlarining texnika va texnologiyasi	60721601	41	40
3166	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi: mis konlari	60721605	41	40
3167	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi: neft va gaz konlari	60721606	41	40
3168	Foydali qazilma konlari geologiyasi, qidiruv va razvedkasi: qattiq foydali qazilmalar	60721603	41	40
3169	Gaz jihozlaridan foydalanish va ularga xizmat ko‘rsatish	60713000	40	41
3170	Konchilik ishi: mis rudalarini boyitish	60721501	41	40
3171	Lazer-yorug‘lik texnologiyalari va optoelektronika	60711700	41	40
3172	Menejment: sanoat korxonalarida innovatsion loyihalar boshqaruvi	60411203	40	30
3173	Metallar texnologiyalari: metallarga bosim bilan ishlov berish	60712303	40	41
3174	Metallar texnologiyalari: prokatlash texnologiyasi	60712304	40	41
3175	Metallar texnologiyalari: quymakorlik texnologiyalari	60712302	40	41
3176	Metallurgiya: mis va noyob metallar	60712102	39	40
3177	Muqobil energiya manbalari: quyosh va shamol energiyasi texnologiyalari	60711002	41	40
3178	Muqobil energiya manbalari: vodorod energetikasi	60711001	41	40
3179	Neft va gaz ishi: neft va gaz kon geologiyasi	60721801	41	40
3180	Neft va gaz ishi: neft va gaz konlarini ishga tushirish va ulardan foydalanish	60721802	41	40
3181	Neft va gaz ishi: neft va gaz quduqlarini burg‘ilash	60721804	41	40
3182	Neft va gaz ishi: neft va gaz quvurlari, baza va omborlarini qurish va ulardan foydalanish	60721803	41	40
3183	Payvandlash texnologiyasi va jihozlari	60712200	40	41
3184	Professional taʼlim: mexatronika va robototexnika	60112407	41	40
3185	Texnologik mashinalar va jihozlar: konchilik	60720701	40	41
3186	Texnologik mashinalar va jihozlar: neft-gaz sanoati mashina jihozlari	60720702	40	41
3187	Texnologik mashinalar va jihozlar: oziq-ovqat sanoati	60720703	40	41
3188	Texnologik mashinalar va jihozlar: sovitish mashinasozligi	60720704	40	41
3189	Transport vositalari muhandisligi: transport vositalariga xizmat ko‘rsatish	60712502	40	41
3190	Transport vositalari muhandisligi: yerusti transport tizimlari va ularning ekspluatatsiyasi	60712501	40	41
3191	Amaliy kosmik texnologiyalar	60712900	40	41
3192	Aviatsiya injiniringi: aviasozlik	60712801	41	40
3193	Aviatsiya injiniringi: uchuvchisiz uchish apparatlari aviatsiya majmualari	60712802	41	40
3194	Avtomobil servisi	61040400	40	41
3195	Axborot tizimlari va texnologiyalari: temir yo‘l transporti	60610204	40	41
3196	Buxgalteriya hisobi va audit: avtomobil transporti	60410101	40	30
3197	Buxgalteriya hisobi va audit: temir yo‘l transporti	60410104	40	30
3198	Elektr energetikasi: temir yo‘l transporti	60710602	40	41
3199	Elektr texnikasi, elektr mexanikasi va elektr texnologiyalari: temir yo‘l transporti	60710703	41	40
3200	Havodagi harakatni boshqarish	61040200	41	30
3201	Intellektual muhandislik tizimlari: avtomobil transporti	60711601	41	40
3202	Iqtisodiyot: avtomobil transporti	60310101	40	30
3203	Iqtisodiyot: temir yo‘l transporti	60310107	40	30
3204	Kommunal infratuzilma va uy-joy kommunal xo‘jaligini tashkil etish va boshqarish	61010700	40	41
3205	Marketing: avtomobil transporti	60412501	40	30
3206	Matematik injiniring: transport	60540302	40	41
3207	Materialshunoslik va yangi materiallar texnologiyasi: temir yo‘l transporti	60720603	39	40
3208	Mehnat muhofazasi va texnika xavfsizligi: transport	61020203	40	41
3209	Menejment: transport sohasida loyihalar boshqaruvi	60411205	40	30
3210	Metrologiya, standartlashtirish va mahsulot sifati menejmenti: avtomobil transporti va yo‘l qurilishi mashinalari	60711301	41	40
3211	Muhandislik kommunikatsiyalari qurilishi va montaji: transport tizimlarida suv taʼminoti va kanalizatsiya	60730401	40	41
3212	Radioelektron qurilmalar va tizimlar: aviatsiya transporti	60611501	40	41
3213	Radoielektron qurilmalar va tizimlar: temir yo‘l transporti	60611503	40	41
3214	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish: temir yo‘l transporti	60711405	41	40
3215	Texnologik masinalar va jihozlar: temir yo‘l transporti	60720706	40	41
3216	Transport logistikasi: temir yo‘l transporti	61040102	40	41
3217	Transport vositalari muhandisligi: elektr transporti	60712510	40	41
3218	Transport vositalari muhandisligi: elektromobil transporti	60712511	40	41
3219	Transport vositalari muhandisligi: ko‘tarish-tashish, yo‘l va qurilish mashinalari	60712507	40	41
3220	Transport vositalari muhandisligi: lokomotivlar	60712508	40	41
3221	Transport vositalari muhandisligi: metropoliten	60712509	40	41
3222	Transport vositalari muhandisligi: vagonlar	60712505	40	41
3223	Transportda tashishni tashkil etish va boshqarish: temir yo‘l transporti	60713201	40	41
3224	Yo‘l muhandisligi: avtomobil yo‘llari ekspluatatsiyasi	60730803	40	41
3225	Yo‘l muhandisligi: avtomobil yo‘llaridagi sunʼiy inshootlar	60730804	40	41
3226	Yo‘l muhandisligi: avtomobil yo‘llarini arxitektura-landshaft konstruktsiyalash	60730805	40	41
3227	Yo‘l muhandisligi: avtomobil yo‘llarini loyihalash	60730807	40	41
3228	Yo‘l muhandisligi: avtomobil yo‘llarini qurish	60730806	40	41
3229	Yo‘l muhandisligi: ko‘priklar va tonellar	60730808	40	41
3230	Yo‘l muhandisligi: shahar yo‘llari va ko‘chalar	60730811	40	41
3231	Yo‘l muhandisligi: temir yo‘l ekspluatatsiyasi	60730810	40	41
3232	Yo‘l muhandisligi: temir yo‘l qurilishi	60730809	40	41
3233	Yurisprudensiya: xalqaro transport huquqi	60420104	45	30
3234	Havo kemalarining texnik ekspluatatsiyasi	60712600	40	41
3235	Biznesni boshqarish: transport	60411304	40	30
3236	Marketing: temir yo‘l transporti	60412505	40	30
3237	Raqamli iqtisodiyot: transport	60310502	40	30
3238	Davlat boshqaruvi	60421200	44	30
3239	Yurisprudensiya: davlat-huquqiy faoliyat	60420107	45	30
3240	Yurisprudensiya: fuqarolik va biznes huquqi	60420111	45	30
3241	Yurisprudensiya: jinoyat-huquqiy faoliyat	60420109	45	30
3242	Yurisprudensiya: xalqaro huquq va qiyosiy huquqshunoslik	60420112	45	30
3243	Dori vositalarini standartlashtirish, sertifikatsiyalash va sifat menejmenti	60911000	39	38
3244	Farmatsevtik biotexnologiya	60910900	38	39
3245	Kimyoviy texnologiya: chinni va fayans	60710106	39	40
3246	Kimyoviy texnologiya: qurilish materiallari	60710103	39	40
3247	Professional taʼlim: oziq-ovqat texnologiyasi	60112409	39	38
3248	Kimyoviy texnologiya: noorganik moddalar kimyoviy texnologiyasi	60710108	39	40
3249	Kimyoviy texnologiya: qurilish materiallari kimyoviy texnologiyasi	60710107	39	40
3250	Axborot tizimlari va texnologiyalari: moliya-bank tizimida	60610202	40	41
3251	Birja ishi	60410900	40	30
3252	Davolash ishi-Chinoz tumani	60910200240	38	39
3253	Davolash ishi-Chortoq tumani	60910200119	38	39
3254	Davolash ishi-Chust tumani	60910200120	38	39
3255	Davolash ishi-Oqqo‘rg‘on tumani	60910200242	38	39
3256	Davolash ishi-Pop tumani	60910200125	38	39
3257	Davolash ishi-Toshkent shahri	6091020014	38	39
3258	Davolash ishi-Toshkent tumani	60910200248	38	39
3259	Davolash ishi-To‘raqo‘rg‘on tumani	60910200126	38	39
3260	Davolash ishi-Yangiyo‘l tumani	60910200249	38	39
3261	Pediatriya ishi-Angren shahri	6091030058	38	39
3262	Pediatriya ishi-Bekobod shahri	6091030059	38	39
3263	Pediatriya ishi-Bekobod tumani	60910300237	38	39
3264	Pediatriya ishi-Boyovut tumani	60910300229	38	39
3265	Pediatriya ishi-Bo‘ka tumani	60910300238	38	39
3266	Pediatriya ishi-Bo‘stonliq tumani	60910300239	38	39
3267	Pediatriya ishi-Chinoz tumani	60910300240	38	39
3268	Pediatriya ishi-Chirchiq shahri	6091030060	38	39
3269	Pediatriya ishi-Guliston tumani	60910300230	38	39
3270	Pediatriya ishi-Mirzaobod tumani	60910300231	38	39
3271	Pediatriya ishi-Nurafshon shahri	60910300254	38	39
3272	Pediatriya ishi-Ohangaron shahri	6091030061	38	39
3273	Pediatriya ishi-Ohangaron tumani	60910300241	38	39
3274	Pediatriya ishi-Olmaliq shahri	6091030062	38	39
3275	Pediatriya ishi-Oqoltin tumani	60910300232	38	39
3276	Pediatriya ishi-Oqqo‘rg‘on tumani	60910300242	38	39
3277	Pediatriya ishi-O‘rtachirchiq tumani	60910300243	38	39
3278	Pediatriya ishi-Parkent tumani	60910300244	38	39
3279	Pediatriya ishi-Piskent tumani	60910300245	38	39
3280	Pediatriya ishi-Qibray tumani	60910300246	38	39
3281	Pediatriya ishi-Quyichirchiq tumani	60910300247	38	39
3282	Pediatriya ishi-Sayxunobod tumani	60910300234	38	39
3283	Pediatriya ishi-Shirin shahri	6091030056	38	39
3284	Pediatriya ishi-Sirdaryo tumani	60910300235	38	39
3285	Pediatriya ishi-Toshkent shahri	6091030014	38	39
3286	Pediatriya ishi-Toshkent tumani	60910300248	38	39
3287	Pediatriya ishi-Yangiyer shahri	6091030057	38	39
3288	Pediatriya ishi-Yangiyo‘l tumani	60910300249	38	39
3289	Pediatriya ishi-Yuqorichirchiq tumani	60910300250	38	39
3290	Pediatriya ishi-Zangiota tumani	60910300251	38	39
3291	Tibbiy-biologik ish-Bekobod tumani	60910600237	39	38
3292	Tibbiy-biologik ish-Bo‘ka tumani	60910600238	39	38
3293	Tibbiy-biologik ish-Bo‘stonliq tumani	60910600239	39	38
3294	Tibbiy-biologik ish-Chinoz tumani	60910600240	39	38
3295	Tibbiy-biologik ish-Ohangaron tumani	60910600241	39	38
3296	Tibbiy-biologik ish-Oqqo‘rg‘on tumani	60910600242	39	38
3297	Tibbiy-biologik ish-Quyichirchiq tumani	60910600247	39	38
3298	Tibbiy-biologik ish-Yuqorichirchiq tumani	60910600250	39	38
3299	Davolash ishi-Arnasoy tumani	60910200195	38	39
3300	Davolash ishi-Baxmal tumani	60910200196	38	39
3301	Davolash ishi-Boyovut tumani	60910200229	38	39
3302	Davolash ishi-Forish tumani	60910200198	38	39
3303	Davolash ishi-Guliston tumani	60910200230	38	39
3304	Davolash ishi-G‘allaorol tumani	60910200199	38	39
3305	Davolash ishi-Jarqo‘rg‘on tumani	60910200172	38	39
3306	Davolash ishi-Jizzax shahri	6091020050	38	39
3307	Davolash ishi-Mingbuloq tumani	60910200122	38	39
3308	Davolash ishi-Mirzacho‘l tumani	60910200201	38	39
3309	Davolash ishi-Mirzaobod tumani	60910200231	38	39
3310	Davolash ishi-Namangan tumani	60910200123	38	39
3311	Davolash ishi-Norin tumani	60910200124	38	39
3312	Davolash ishi-Oqoltin tumani	60910200232	38	39
3313	Davolash ishi-Paxtakor tumani	60910200202	38	39
3314	Davolash ishi-Sardoba tumani	60910200233	38	39
3315	Davolash ishi-Sayxunobod tumani	60910200234	38	39
3316	Davolash ishi-Sharof Rashidov tumani	60910200200	38	39
3317	Davolash ishi-Shirin shahri	6091020056	38	39
3318	Davolash ishi-Sirdaryo tumani	60910200235	38	39
3319	Davolash ishi-Termiz shahri	6091020047	38	39
3320	Davolash ishi-Uchqo‘rg‘on tumani	60910200127	38	39
3321	Davolash ishi-Xovos tumani	60910200236	38	39
3322	Davolash ishi-Yangiobod tumani	60910200203	38	39
3323	Davolash ishi-Yangiqo‘rg‘on tumani	60910200129	38	39
3324	Davolash ishi-Yangiyer shahri	6091020057	38	39
3325	Davolash ishi-Zarbdor tumani	60910200205	38	39
3326	Davolash ishi-Zomin tumani	60910200206	38	39
3327	Tibbiy profilaktika ishi-Bandixon tumani	60910400255	39	38
3328	Tibbiy profilaktika ishi-Boysun tumani	60910400170	39	38
3329	Tibbiy profilaktika ishi-Do‘stlik tumani	60910400197	39	38
3330	Tibbiy profilaktika ishi-Forish tumani	60910400198	39	38
3331	Tibbiy profilaktika ishi-G‘allaorol tumani	60910400199	39	38
3332	Tibbiy profilaktika ishi-Jarqo‘rg‘on tumani	60910400172	39	38
3333	Tibbiy profilaktika ishi-Mirzacho‘l tumani	60910400201	39	38
3334	Tibbiy profilaktika ishi-Mirzaobod tumani	60910400231	39	38
3335	Tibbiy profilaktika ishi-Muzrabot tumani	60910400173	39	38
3336	Tibbiy profilaktika ishi-Oltinsoy tumani	60910400174	39	38
3337	Tibbiy profilaktika ishi-Paxtakor tumani	60910400202	39	38
3338	Tibbiy profilaktika ishi-Qiziriq tumani	60910400175	39	38
3339	Tibbiy profilaktika ishi-Qumqo‘rg‘on tumani	60910400176	39	38
3340	Tibbiy profilaktika ishi-Sariosiyo tumani	60910400177	39	38
3341	Tibbiy profilaktika ishi-Sherobod tumani	60910400178	39	38
3342	Tibbiy profilaktika ishi-Sho‘rchi tumani	60910400179	39	38
3343	Tibbiy profilaktika ishi-Sirdaryo tumani	60910400235	39	38
3344	Tibbiy profilaktika ishi-Uzun tumani	60910400181	39	38
3345	Tibbiy profilaktika ishi-Yangiobod tumani	60910400203	39	38
3346	Tibbiy profilaktika ishi-Zafarobod tumani	60910400204	39	38
3347	Tibbiy profilaktika ishi-Zarbdor tumani	60910400205	39	38
3348	Tibbiy-biologik ish-Denov tumani	60910600171	39	38
3349	Tibbiy-biologik ish-Farg‘ona tumani	60910600134	39	38
3350	Tibbiy-biologik ish-Jarqo‘rg‘on tumani	60910600172	39	38
3351	Tibbiy-biologik ish-Muzrabot tumani	60910600173	39	38
3352	Tibbiy-biologik ish-Namangan tumani	60910600123	39	38
3353	Tibbiy-biologik ish-Oltinsoy tumani	60910600174	39	38
3354	Tibbiy-biologik ish-Qiziriq tumani	60910600175	39	38
3355	Tibbiy-biologik ish-Qo‘shtepa tumani	60910600252	39	38
3356	Tibbiy-biologik ish-Qumqo‘rg‘on tumani	60910600176	39	38
3357	Tibbiy-biologik ish-Quva tumani	60910600140	39	38
3358	Tibbiy-biologik ish-Sherobod tumani	60910600178	39	38
3359	Tibbiy-biologik ish-Uchqo‘rg‘on tumani	60910600127	39	38
3360	Tibbiy-biologik ish-Uychi tumani	60910600128	39	38
3361	Tibbiy-biologik ish-Uzun tumani	60910600181	39	38
3362	Tibbiy-biologik ish-Yangiqo‘rg‘on tumani	60910600129	39	38
3363	Davolash ishi-Amudaryo tumani	6091020091	38	39
3364	Davolash ishi-Bog‘ot tumani	60910200157	38	39
3365	Davolash ishi-Gurlan tumani	60910200158	38	39
3366	Davolash ishi-Hazorasp tumani	60910200163	38	39
3367	Davolash ishi-Nukus q.a.p.	60910200304	38	39
3368	Davolash ishi-Pitnak shahri	6091020065	38	39
3369	Davolash ishi-Qo‘shko‘pir tumani	60910200160	38	39
3370	Davolash ishi-Shovot tumani	60910200161	38	39
3371	Davolash ishi-Tuproqqalʼa  q.a.p.	60910200305	38	39
3372	Davolash ishi-Tuproqqalʼa tumani	60910200261	38	39
3373	Davolash ishi-Urganch shahri	6091020045	38	39
3374	Davolash ishi-Urganch tumani	60910200162	38	39
3375	Davolash ishi-Xiva shahri	6091020046	38	39
3376	Davolash ishi-Xiva tumani	60910200164	38	39
3377	Davolash ishi-Xonqa tumani	60910200165	38	39
3378	Davolash ishi-Yangiariq tumani	60910200166	38	39
3379	Davolash ishi-Yangibozor tumani	60910200167	38	39
3380	Pediatriya ishi-Baxmal tumani	60910300196	38	39
3381	Pediatriya ishi-Bog‘ot tumani	60910300157	38	39
3382	Pediatriya ishi-Do‘stlik tumani	60910300197	38	39
3383	Pediatriya ishi-Gurlan tumani	60910300158	38	39
3384	Pediatriya ishi-G‘allaorol tumani	60910300199	38	39
3385	Pediatriya ishi-Hazorasp tumani	60910300163	38	39
3386	Pediatriya ishi-Paxtakor tumani	60910300202	38	39
3387	Pediatriya ishi-Qo‘shko‘pir tumani	60910300160	38	39
3388	Pediatriya ishi-Sharof Rashidov tumani	60910300200	38	39
3389	Pediatriya ishi-Shovot tumani	60910300161	38	39
3390	Pediatriya ishi-Urganch tumani	60910300162	38	39
3391	Pediatriya ishi-Yangiariq tumani	60910300166	38	39
3392	Pediatriya ishi-Yangibozor tumani	60910300167	38	39
3393	Pediatriya ishi-Zafarobod tumani	60910300204	38	39
3394	Pediatriya ishi-Zarbdor tumani	60910300205	38	39
3395	Pediatriya ishi-Zomin tumani	60910300206	38	39
3396	Tibbiy profilaktika ishi-Hazorasp tumani	60910400163	39	38
3397	Tibbiy profilaktika ishi-Shovot tumani	60910400161	39	38
3398	Tibbiy profilaktika ishi-Tuproqqalʼa tumani	60910400261	39	38
3399	Tibbiy profilaktika ishi-Xiva tumani	60910400164	39	38
3400	Pediatriya ishi-Jizzax shahri	6091030050	38	39
3401	Pediatriya ishi-Urganch shahri	6091030045	38	39
3402	Davolash ishi-Angor tumani	60910200168	38	39
3403	Davolash ishi-Bandixon tumani	60910200255	38	39
3404	Davolash ishi-Bobotog‘ hududi	60910200301	38	39
3405	Davolash ishi-Boysun tumani	60910200170	38	39
3406	Davolash ishi-Denov tumani	60910200171	38	39
3407	Davolash ishi-Muborak tumani	60910200189	38	39
3408	Davolash ishi-Muzrabot tumani	60910200173	38	39
3409	Davolash ishi-Oltinsoy tumani	60910200174	38	39
3410	Davolash ishi-Qiziriq tumani	60910200175	38	39
3411	Davolash ishi-Qumqo‘rg‘on tumani	60910200176	38	39
3412	Davolash ishi-Sariosiyo tumani	60910200177	38	39
3413	Davolash ishi-Shahrisabz tumani	60910200193	38	39
3414	Davolash ishi-Sherobod tumani	60910200178	38	39
3415	Davolash ishi-Sho‘rchi tumani	60910200179	38	39
3416	Davolash ishi-Termiz tumani	60910200180	38	39
3417	Davolash ishi-Uzun tumani	60910200181	38	39
3418	Pediatriya ishi-Boysun tumani	60910300170	38	39
3419	Pediatriya ishi-Jarqo‘rg‘on tumani	60910300172	38	39
3420	Pediatriya ishi-Muzrabot tumani	60910300173	38	39
3421	Pediatriya ishi-Qumqo‘rg‘on tumani	60910300176	38	39
3422	Pediatriya ishi-Sariosiyo tumani	60910300177	38	39
3423	Pediatriya ishi-Sherobod tumani	60910300178	38	39
3424	Pediatriya ishi-Sho‘rchi tumani	60910300179	38	39
3425	Pediatriya ishi-Uzun tumani	60910300181	38	39
3426	Dizayn: kostyum dizayni	60210401	43	43
3427	Kimyoviy texnologiya: qog‘oz sanoati	60710102	39	40
3428	Kimyoviy texnologiya: to‘qimachilik sanoati	60710105	39	40
3429	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: charm buyumlarida innovatsion texnologiyalar	60721204	40	41
3430	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: charm va mo‘yna sanoatida innovatsion texnologiyalar	60721205	40	41
3431	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: gilamchilik	60721206	40	41
3432	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: noto‘qima materiallar texnologiyasi	60721209	40	41
3433	Yengil sanoat buyumlari konstruksiyasini ishlash va texnologiyasi: shaxsiy buyurtma asosida kiyim tayyorlash	60721213	40	41
3434	Yengil sanoat texnologiyalari va jihozlari: charm va mo‘ynani qayta ishlash  va jihozlari	60721407	40	41
3435	Yengil sanoat texnologiyalari va jihozlari: mashinalarga texnik xizmat ko‘rsatish	60721402	40	41
3436	Yengil sanoat texnologiyalari va jihozlari: poyabzal, charm-attorlik buyumlari ishlab chiqarish va jihozlari	60721405	40	41
3437	Yengil sanoat texnologiyalari va jihozlari: tarmoq mashinalarini ekspluatatsiyasi va loyihalash	60721403	40	41
3438	Yengil sanoat texnologiyalari va jihozlari: tikuvchilik sanoatida kreativ loyihalash va innovatsion texnologiyalar	60721406	40	41
3439	Agronomiya: sabzavotchilik va polizchilik	60810903	38	39
3440	Ijtimoiy ish: oila va bolalar bilan ishlash-Qoraqalpog‘iston Respublikasi	60920102101	38	31
3441	Ijtimoiy ish: oila va bolalar bilan ishlash-Xorazm viloyati	60920102106	38	31
3442	Aerokosmik texnologiyalar va barqaror rivojlanish (tarmoqlar va sohalar bo‘yicha)	60713300	41	40
3443	Kadastr (faoliyat turlari bo‘yicha)	60722802	40	41
3444	Texnika va texnologiyalarning texnik ekspertizasi va marketingi (turlari bo‘yicha)	60722900	41	40
3445	Yerni masofaviy zondlashda innovatsion texnologiyalar	60722700	40	42
3446	Yurisprudensiya: transchegaraviy suv munosabatlari	60420110	45	30
3447	Yurisprudensiya: yer munosabatlari	60420108	45	30
3448	Mehnat muhofazasi va texnika xavfsizligi: suv xo‘jaligida	61020201	40	41
3449	Texnologik jarayonlar va ishlab chiqarishni avtomatlashtirish va boshqarish: suv xo‘jaligida	60711403	41	40
\.


--
-- Data for Name: Science; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Science" (id, name, code) FROM stdin;
30	Chet tili	60230101
31	Ona tili va adabiyoti	60230101
32	Fransuz tili	60230121
33	Ingliz tili	60230103
34	Nemis tili	60230112
35	Rus tili va adabiyoti	60230113
36	Rus tili	60230206
37	O‘zbek tili va adabiyoti	60230206
38	Biologiya	60110900
39	Kimyo	60110900
40	Matematika	60110500
41	Fizika	60110700
42	Geografiya	60111000
43	Kasbiy	60112200
44	Tarix	60112100
45	Huquqshunoslik fanlari	60420102
46	O‘zbek tili	60111602
47	Qoraqalpoq tili va adabiyoti	60111702
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, username, name, role, telegram_id, "isActive", working, created_at, updated_at) FROM stdin;
ddda7bb1-8236-43ce-a18a-42212cb66f71	Azizjon	Azizjon	USER	6322528596	t	f	2024-07-23 08:03:49.125	2024-07-23 08:03:49.125
e10a008e-845c-416b-85fd-2c8054ae4a76	Guzal Kholmirzaeva	Guzal Kholmirzaeva	USER	1788579109	t	f	2024-07-23 08:11:49.4	2024-07-23 08:11:49.4
\.


--
-- Data for Name: general; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.general (id, univer_id, direction_id, lang_id, year_id, type_id, "grandBall", "kontraktBall", "kontraktPeople", "grandPeople") FROM stdin;
13853	9	2111	908	1	1062	127	105.1	55	5
15279	36	2035	959	1	1119	0	57.6	50	0
15280	36	2019	959	1	1120	0	61	60	0
15281	36	2020	959	1	1120	0	66.2	25	0
15282	36	2023	959	1	1120	0	64	25	0
15283	36	2024	959	1	1120	0	82.4	25	0
15284	36	2027	959	1	1120	0	79.7	50	0
15285	36	2028	959	1	1120	0	86	50	0
15286	36	2032	959	1	1120	0	75	25	0
15287	36	2013	959	1	1120	0	127.1	50	0
15288	36	2017	960	1	1118	71.1	61.4	8	2
15289	36	2018	960	1	1118	102	78.4	7	3
15290	36	2019	960	1	1118	73.4	57	20	5
15291	36	2020	960	1	1118	68.2	57.7	20	5
15292	36	2021	960	1	1118	167	148.8	5	3
15293	36	2022	960	1	1118	81.7	60.3	5	3
15294	36	2023	960	1	1118	72.6	56.8	12	3
15295	36	2024	960	1	1118	75.7	61.7	15	5
15296	36	2027	960	1	1118	81.1	56.7	20	5
15297	36	2398	960	1	1118	95.7	75.6	50	25
15298	36	2036	960	1	1118	141.5	114.3	50	22
15299	36	2590	960	1	1118	81.5	0	0	2
15300	36	2591	960	1	1118	123.8	0	0	1
15301	36	2580	960	1	1118	78	56.8	20	5
15302	36	2013	960	1	1118	156.9	127.2	20	5
15303	36	2018	960	1	1119	0	62.8	25	0
15304	36	2021	960	1	1119	0	0	25	0
15305	36	2024	960	1	1119	0	70.7	25	0
15306	36	2027	960	1	1120	0	58.6	25	0
15307	36	2036	960	1	1120	0	107.3	25	0
15308	37	2017	961	1	1121	123.3	109.9	22	12
15309	37	2018	961	1	1121	129.1	106.1	32	7
15310	37	2019	961	1	1121	85.4	64.2	22	12
15311	37	2020	961	1	1121	89.3	68.5	22	10
15312	37	2021	961	1	1121	143.7	123.8	28	12
15313	37	2022	961	1	1121	116.4	61.2	16	4
15314	37	2023	961	1	1121	71.5	64.2	22	12
15315	37	2024	961	1	1121	100.5	83	30	10
15316	37	2026	961	1	1121	122.8	81.4	8	4
15317	37	2027	961	1	1121	124.8	91.3	40	20
15318	37	2028	961	1	1121	101.9	83	58	24
15319	37	2029	961	1	1121	129.3	104.4	6	4
15320	37	2030	961	1	1121	117.2	61.2	26	6
15321	37	2031	961	1	1121	128.9	109.8	70	30
15322	37	2032	961	1	1121	114.2	75.2	32	8
15323	37	2033	961	1	1121	135.3	118.4	22	10
15324	37	2034	961	1	1121	118.1	61.2	20	6
15325	37	2035	961	1	1121	78.9	64.1	18	6
15326	37	2013	961	1	1121	164.7	137.7	48	12
15327	37	2018	961	1	1122	0	69.4	25	0
15328	37	2021	961	1	1122	0	0	25	0
15329	37	2024	961	1	1122	0	82.1	50	0
15330	37	2029	961	1	1122	0	78.8	25	0
15331	37	2030	961	1	1122	0	91.7	25	0
15332	37	2032	961	1	1122	0	76.9	25	0
15333	37	2033	961	1	1122	0	99.7	25	0
15334	37	2034	961	1	1122	0	74.8	25	0
15335	37	2035	961	1	1122	0	57.6	10	0
15336	37	2017	961	1	1123	0	89.9	25	0
15337	37	2019	961	1	1123	0	59.7	25	0
15338	37	2020	961	1	1123	0	64.1	25	0
15339	37	2023	961	1	1123	0	56.9	25	0
15340	37	2027	961	1	1123	0	69.6	25	0
15341	37	2031	961	1	1123	0	96.6	50	0
15342	37	2017	962	1	1121	84	69.3	8	3
15343	37	2018	962	1	1121	118.8	82.9	9	2
15344	37	2019	962	1	1121	70.4	0	8	3
15345	37	2020	962	1	1121	0	62	8	3
15346	37	2021	962	1	1121	141.5	119	7	2
15347	37	2022	962	1	1121	109	67.4	7	2
15348	37	2023	962	1	1121	70.3	62	8	3
15349	37	2024	962	1	1121	77	69.2	10	3
15350	37	2026	962	1	1121	115	77.8	4	2
15351	37	2027	962	1	1121	95.8	63.7	10	3
15352	37	2028	962	1	1121	79.3	68.1	12	7
15353	37	2398	962	1	1121	103.5	68.5	65	7
15354	37	2592	962	1	1121	68.2	0	0	2
15355	37	2593	962	1	1121	83	0	0	2
15356	37	2594	962	1	1121	89	0	0	1
15357	37	2595	962	1	1121	0	0	0	1
15358	37	2596	962	1	1121	0	0	0	2
15359	37	2597	962	1	1121	69.2	66.9	40	10
15360	37	2036	962	1	1121	133.8	111.5	20	5
15361	37	2598	962	1	1121	100.5	79	20	5
15362	37	2032	962	1	1121	71.4	57.6	11	3
15363	37	2033	962	1	1121	122.6	73.6	8	3
15364	37	2035	962	1	1121	0	56.8	7	2
15365	37	2013	962	1	1121	155.9	139.8	12	3
15366	37	2018	962	1	1122	0	64	25	0
15367	37	2024	962	1	1122	0	69.6	25	0
15368	38	2129	963	1	1124	73.7	62	20	5
15369	38	2166	963	1	1124	93.7	65.4	20	5
15370	38	2342	963	1	1124	68.5	58.8	15	10
15371	38	2559	963	1	1124	68.4	58.9	20	5
15372	38	2560	963	1	1124	71.7	64.2	15	10
15373	38	2171	963	1	1124	91.3	66.5	20	5
15374	38	2495	963	1	1124	68.3	57.9	20	5
13854	9	2287	908	1	1062	138.3	0	0	1
13855	9	2288	908	1	1062	113.3	0	0	2
13856	9	2289	908	1	1062	109	0	0	2
13857	9	2290	908	1	1062	117.6	0	0	2
13858	9	2291	908	1	1062	120.8	0	0	1
13859	9	2292	908	1	1062	118.8	0	0	1
13860	9	2293	908	1	1062	100.8	0	0	2
13861	9	2294	908	1	1062	105.9	0	0	2
13862	9	2295	908	1	1062	119	0	0	2
13863	9	2296	908	1	1062	138.4	110.3	35	5
13864	9	2297	908	1	1062	135.2	0	0	1
13865	9	2298	908	1	1062	125.4	0	0	1
13866	9	2299	908	1	1062	129.3	0	0	1
13867	9	2300	908	1	1062	119.6	0	0	1
13868	9	2301	908	1	1062	121.7	0	0	1
13869	9	2302	908	1	1062	128.2	0	0	1
13870	9	2303	908	1	1062	135.1	0	0	1
13871	9	2304	908	1	1062	132.4	0	0	1
13872	9	2305	908	1	1062	139.2	0	0	1
13873	9	2306	908	1	1062	137.4	0	0	1
13874	9	2121	908	1	1062	140.5	137.2	7	8
13875	9	2037	909	1	1062	134	110.1	45	25
13876	9	2253	909	1	1062	166.8	0	0	1
13877	9	2254	909	1	1062	144.9	0	0	1
13878	9	2256	909	1	1062	0	0	0	1
13879	9	2259	909	1	1062	128.2	0	0	1
13880	9	2273	909	1	1062	161.3	0	0	1
13881	9	2072	909	1	1062	83.1	70.8	10	3
13882	9	2073	909	1	1062	118.7	71.5	9	1
13883	9	2074	909	1	1062	121.7	108	13	10
13884	9	2274	909	1	1062	124.8	0	0	1
13885	9	2278	909	1	1062	95.7	0	0	1
13886	9	2110	909	1	1062	127.2	103.7	40	10
13887	9	2111	909	1	1062	75.1	67.5	15	7
13888	9	2287	909	1	1062	87.4	0	0	1
13889	9	2291	909	1	1062	0	0	0	1
13890	9	2292	909	1	1062	0	0	0	1
13891	9	2296	909	1	1062	80.9	68	15	8
13892	9	2307	909	1	1062	86.9	0	0	1
13893	9	2308	909	1	1062	96.8	0	0	1
13894	9	2121	909	1	1062	109.4	93.4	8	2
13895	10	2189	910	1	1063	112.3	85.1	20	5
13896	10	2190	910	1	1063	86.8	63.1	20	5
13897	10	2124	910	1	1063	157.4	114.2	35	15
13898	10	2309	910	1	1063	145.6	100.3	20	5
13899	10	2163	910	1	1063	135.5	101.8	15	10
13900	10	2310	910	1	1063	119.3	56.8	20	5
13901	10	2157	910	1	1063	153	109.5	20	5
13902	10	2127	910	1	1063	137.2	131.9	20	15
13903	10	2191	910	1	1063	122.4	111.3	15	10
13904	10	2192	910	1	1063	101.2	57	20	5
13905	10	2158	910	1	1063	165.6	110.3	20	5
13906	10	2195	910	1	1063	111	80.9	20	5
13907	10	2129	910	1	1063	104.2	94.7	20	5
13908	10	2311	910	1	1063	70.8	60.2	20	5
13909	10	2312	910	1	1063	123.3	71	20	5
13910	10	2002	910	1	1063	116.7	79.4	20	10
13911	10	2003	910	1	1063	181.6	164.6	45	15
13912	10	2005	910	1	1063	90.4	60.1	20	20
13913	10	2130	910	1	1063	152.5	125	45	30
13914	10	2131	910	1	1063	132.1	76.7	20	10
13915	10	2132	910	1	1063	99.7	76.7	20	15
13916	10	2313	910	1	1063	99.8	73.6	10	5
13917	10	2008	910	1	1063	168.5	158.9	14	16
13918	10	2314	910	1	1063	87.2	63.4	10	5
13919	10	2315	910	1	1063	117.7	84.9	18	5
13920	10	2316	910	1	1063	0	0	0	2
13921	10	2133	910	1	1063	113.8	70.6	20	5
13922	10	2134	910	1	1063	170.2	137.7	18	7
13923	10	2199	910	1	1063	90.1	59.7	20	5
13924	10	2317	910	1	1063	106	66.8	20	5
13925	10	2135	910	1	1063	95.7	71.6	20	15
13926	10	2136	910	1	1063	125.6	95.5	30	20
13927	10	2200	910	1	1063	128.6	73.9	20	5
13928	10	2318	910	1	1063	114.4	71.4	20	5
13929	10	2319	910	1	1063	141.7	87.3	20	5
13930	10	2139	910	1	1063	157.6	118.5	35	15
13931	10	2320	910	1	1063	131.1	108.7	20	5
13932	10	2140	910	1	1063	122.2	75.1	20	5
13933	10	2174	910	1	1063	152.8	87.4	20	5
13934	10	2141	910	1	1063	85	66.2	15	10
13935	10	2321	910	1	1063	158.3	86	20	5
13936	10	2322	910	1	1063	70.5	61.9	20	5
13937	10	2204	910	1	1063	0	0	0	1
13938	10	2205	910	1	1063	95.3	57	20	4
13939	10	2206	910	1	1063	93.8	67.6	20	5
13940	10	2144	910	1	1063	145.9	99.7	40	10
13941	10	2145	910	1	1063	119.4	86.3	20	5
13942	10	2323	910	1	1063	108	83.9	20	5
13943	10	2213	910	1	1063	77.9	67.1	15	10
13944	10	2214	910	1	1063	158.6	82.7	20	5
13945	10	2324	910	1	1063	136.9	57.9	23	2
13946	10	2325	910	1	1063	142.1	67.6	22	3
13947	10	2326	910	1	1063	175.3	153.3	20	5
13948	10	2147	910	1	1063	94.9	71.8	20	5
13949	10	2149	910	1	1063	119.8	67.4	13	2
13950	10	2150	910	1	1063	170.3	90	12	2
13951	10	2327	910	1	1063	173.6	72.3	13	2
13952	10	2328	910	1	1063	144.4	73.8	14	2
13953	10	2151	910	1	1063	141.1	83.4	22	3
13954	10	2152	910	1	1063	132.8	118.3	12	2
13955	10	2329	910	1	1063	78.3	59.9	12	3
13956	10	2153	910	1	1063	174.7	121.6	12	2
13957	10	2330	910	1	1063	88.3	74.3	13	2
13958	10	2331	910	1	1063	137.7	61.3	20	5
13959	10	2332	910	1	1063	89.4	57.2	20	5
13960	10	2154	910	1	1063	172.9	129	43	7
13961	10	2333	910	1	1063	159.2	111.1	20	5
13962	10	2011	910	1	1063	171.8	153.9	25	10
13963	10	2012	910	1	1063	85.8	56.8	10	5
13964	10	2155	910	1	1063	177.1	141.4	20	5
13965	10	2334	910	1	1063	181.5	157.4	45	5
13966	10	2190	910	1	1064	0	71.4	25	0
13967	10	2310	910	1	1064	0	90	20	0
13968	10	2157	910	1	1064	0	89.4	25	0
13969	10	2127	910	1	1064	0	122.2	25	0
13970	10	2158	910	1	1064	0	80.1	25	0
13971	10	2130	910	1	1064	0	115.2	25	0
13972	10	2132	910	1	1064	0	72.8	25	0
13973	10	2335	910	1	1064	0	61.3	25	0
13974	10	2133	910	1	1064	0	69.6	25	0
13975	10	2134	910	1	1064	0	108.5	25	0
13976	10	2317	910	1	1064	0	60.3	20	0
13977	10	2136	910	1	1064	0	80.1	25	0
13978	10	2319	910	1	1064	0	74.7	20	0
13979	10	2139	910	1	1064	0	105	25	0
13980	10	2174	910	1	1064	0	74.9	20	0
13981	10	2321	910	1	1064	0	76	25	0
13982	10	2322	910	1	1064	0	65.2	25	0
13983	10	2144	910	1	1064	0	90.4	25	0
13984	10	2324	910	1	1064	0	109.8	25	0
13985	10	2325	910	1	1064	0	115	25	0
13986	10	2150	910	1	1064	0	111.9	15	0
13987	10	2327	910	1	1064	0	130.1	15	0
13988	10	2328	910	1	1064	0	119.8	15	0
13989	10	2151	910	1	1064	0	97.5	25	0
13990	10	2154	910	1	1064	0	108.1	25	0
13991	10	2155	910	1	1064	0	125	25	0
13992	10	2334	910	1	1064	0	146.8	40	0
13993	10	2124	910	1	1065	0	84	25	0
13994	10	2157	910	1	1065	0	77.9	25	0
13995	10	2158	910	1	1065	0	73.2	25	0
13996	10	2129	910	1	1065	0	65.5	25	0
13997	10	2003	910	1	1065	0	146.4	25	0
13998	10	2130	910	1	1065	0	110.3	25	0
13999	10	2134	910	1	1065	0	87.1	25	0
14000	10	2319	910	1	1065	0	66.4	25	0
14001	10	2324	910	1	1065	0	56.9	25	0
14002	10	2325	910	1	1065	0	152.6	25	0
14003	10	2334	910	1	1065	0	151.2	25	0
14004	10	2163	910	1	1066	0	63.5	50	0
14005	10	2136	910	1	1066	0	63.2	50	0
14006	10	2124	911	1	1063	90.4	58.2	20	5
14007	10	2163	911	1	1063	73.5	62.3	10	10
14008	10	2127	911	1	1063	96.2	74.5	15	5
14009	10	2003	911	1	1063	170.5	145.1	25	5
14010	10	2014	911	1	1063	133.2	105	45	30
14011	10	2131	911	1	1063	73.9	57.8	15	5
14012	10	2132	911	1	1063	0	0	10	5
14013	10	2008	911	1	1063	157.1	131.3	16	4
14014	10	2315	911	1	1063	78	59.3	22	3
14015	10	2134	911	1	1063	140.8	101.1	22	3
14016	10	2135	911	1	1063	70.4	57.3	10	5
14017	10	2139	911	1	1063	94.9	57.1	20	5
14018	10	2144	911	1	1063	88.6	69.3	20	5
14019	10	2154	911	1	1063	110.8	58.7	22	3
14020	10	2011	911	1	1063	157.9	131.6	15	5
14021	10	2127	911	1	1064	0	69.4	25	0
14022	10	2158	911	1	1064	0	74.6	25	0
14023	10	2134	911	1	1064	0	81.9	25	0
14024	10	2144	911	1	1064	0	79.2	25	0
14025	11	2336	912	1	1067	70.3	56.8	15	10
14026	11	2156	912	1	1067	97.9	69.5	20	5
14027	11	2163	912	1	1067	123.9	83.1	20	5
14028	11	2337	912	1	1067	140.9	103.8	20	5
14029	11	2338	912	1	1067	123.6	103.9	20	5
14030	11	2166	912	1	1067	107.3	71.1	40	10
14031	11	2167	912	1	1067	92.3	65.2	40	10
14032	11	2339	912	1	1067	99.7	64.3	40	10
14033	11	2169	912	1	1067	89.1	57.7	40	10
14034	11	2340	912	1	1067	83.1	58	20	5
14035	11	2341	912	1	1067	69.2	56.7	40	10
14036	11	2134	912	1	1067	148.2	95.5	20	5
14037	11	2342	912	1	1067	78.1	61	63	12
14038	11	2343	912	1	1067	70.8	57.2	20	5
14039	11	2344	912	1	1067	0	56.7	15	10
14040	11	2319	912	1	1067	105.4	70.6	20	5
14041	11	2171	912	1	1067	106.1	68.5	20	5
14042	11	2345	912	1	1067	68.5	56.8	20	5
14043	11	2346	912	1	1067	72.3	57.3	20	5
14044	11	2347	912	1	1067	73.2	57.6	20	5
14045	11	2173	912	1	1067	89.4	60.2	40	10
14046	11	2174	912	1	1067	127.1	75.9	22	3
14047	11	2176	912	1	1067	77.6	58.1	40	10
14048	11	2202	912	1	1067	100.6	71.3	15	10
14049	11	2142	912	1	1067	74.5	58	40	10
14050	11	2348	912	1	1067	118	68.1	20	5
14051	11	2178	912	1	1067	75.9	63.9	20	5
14052	11	2349	912	1	1067	71.6	57.8	60	15
14053	11	2143	912	1	1067	76.6	58.3	80	20
14054	11	2212	912	1	1067	68	58.9	15	10
14055	11	2213	912	1	1067	68	57.8	15	10
14056	11	2160	912	1	1067	100.7	62.9	60	15
14057	11	2350	912	1	1067	68.5	56.7	35	15
14058	11	2161	912	1	1067	71.4	56.8	40	10
14059	11	2351	912	1	1067	68.5	58.7	15	10
14060	11	2180	912	1	1067	70.2	58.4	20	5
14061	11	2352	912	1	1067	112.3	72.3	40	10
14062	11	2182	912	1	1067	100.7	62.2	60	15
14063	11	2184	912	1	1067	90.4	66.3	40	10
14064	11	2353	912	1	1067	0	57.7	15	10
14065	11	2354	912	1	1067	68.4	57.7	25	4
14066	11	2355	912	1	1067	75.8	56.8	22	3
14067	11	2356	912	1	1067	69.6	56.8	22	3
14068	11	2357	912	1	1067	72.7	56.7	180	45
14069	11	2358	912	1	1067	96.9	76.4	20	5
14070	11	2336	912	1	1068	0	57.7	25	0
14071	11	2163	912	1	1068	0	74.4	25	0
14072	11	2166	912	1	1068	0	69.4	50	0
14073	11	2167	912	1	1068	0	65.8	50	0
14074	11	2339	912	1	1068	0	69.4	25	0
14075	11	2169	912	1	1068	0	64.3	50	0
14076	11	2340	912	1	1068	0	64.1	25	0
14077	11	2341	912	1	1068	0	61.1	25	0
14078	11	2134	912	1	1068	0	87.2	25	0
14079	11	2342	912	1	1068	0	63.7	100	0
14080	11	2343	912	1	1068	0	62.2	25	0
14081	11	2171	912	1	1068	0	70.5	25	0
14082	11	2346	912	1	1068	0	62.9	25	0
14083	11	2347	912	1	1068	0	61.2	25	0
14084	11	2173	912	1	1068	0	66.9	50	0
14085	11	2174	912	1	1068	0	71.7	50	0
14086	11	2176	912	1	1068	0	63	50	0
14087	11	2142	912	1	1068	0	60.9	75	0
14088	11	2348	912	1	1068	0	69.9	50	0
14089	11	2178	912	1	1068	0	63.7	50	0
14090	11	2349	912	1	1068	0	62.1	50	0
14091	11	2143	912	1	1068	0	60.5	100	0
14092	11	2212	912	1	1068	0	64.5	25	0
14093	11	2160	912	1	1068	0	69.2	50	0
14094	11	2350	912	1	1068	0	62.2	25	0
14095	11	2161	912	1	1068	0	62.1	50	0
14096	11	2180	912	1	1068	0	61.1	25	0
14097	11	2352	912	1	1068	0	63.2	75	0
14098	11	2182	912	1	1068	0	62.1	75	0
14099	11	2184	912	1	1068	0	66.4	50	0
14100	11	2354	912	1	1068	0	61	25	0
14101	11	2355	912	1	1068	0	59.9	25	0
14102	11	2357	912	1	1068	0	60	175	0
14103	11	2156	912	1	1069	0	63	25	0
14104	11	2163	912	1	1069	0	67.1	25	0
14105	11	2134	912	1	1069	0	72.7	25	0
14106	11	2171	912	1	1069	0	65.1	25	0
14107	11	2174	912	1	1069	0	64.5	50	0
14108	11	2349	912	1	1069	0	57	50	0
14109	11	2352	912	1	1069	0	60.7	50	0
14110	11	2156	913	1	1067	86.3	58.9	20	5
14111	11	2167	913	1	1067	68.3	56.7	20	5
14112	11	2169	913	1	1067	68.4	56.8	20	5
14113	11	2342	913	1	1067	73.9	59.7	22	3
14114	11	2174	913	1	1067	133.9	73.2	23	2
14115	11	2348	913	1	1067	70.6	57.9	20	5
14116	11	2178	913	1	1067	69.6	60.3	20	5
14117	11	2349	913	1	1067	0	58.5	20	5
14118	11	2352	913	1	1067	76.8	61	20	5
14119	11	2357	913	1	1067	81	56.8	20	5
14120	12	2129	914	1	1070	88.4	80.9	15	10
14121	12	2166	914	1	1070	89.3	66.3	15	10
14122	12	2359	914	1	1070	76.5	58	35	15
14123	12	2360	914	1	1070	68.7	57.7	30	20
14124	12	2196	914	1	1070	69.3	56.8	30	20
14125	12	2361	914	1	1070	69.4	56.8	35	15
14126	12	2134	914	1	1070	118.6	70.8	20	5
14127	12	2362	914	1	1070	0	56.7	15	10
14128	12	2142	914	1	1070	71.2	56.7	35	15
14129	12	2210	914	1	1070	68.5	59.1	20	5
14130	12	2363	914	1	1070	71.2	58.1	40	10
14131	12	2212	914	1	1070	69.5	56.7	35	15
14132	12	2364	914	1	1070	73.8	57.7	15	10
14133	12	2216	914	1	1070	74.8	56.7	45	30
14134	12	2217	914	1	1070	68.2	56.7	35	15
14135	12	2365	914	1	1070	71.1	57.9	15	10
14136	12	2181	914	1	1070	69.5	59.2	35	15
14137	12	2219	914	1	1070	85.2	69.1	15	10
14138	12	2366	914	1	1070	92.3	67.7	30	20
14139	12	2166	914	1	1071	0	64.9	50	0
14140	12	2196	914	1	1071	0	60.9	50	0
14141	12	2159	914	1	1071	0	56.8	50	0
14142	12	2212	914	1	1071	0	57.9	50	0
14143	12	2364	914	1	1071	0	62.2	25	0
14144	12	2216	914	1	1071	0	58	50	0
14145	12	2217	914	1	1071	0	59.1	50	0
14146	12	2181	914	1	1071	0	63.1	50	0
14147	12	2366	914	1	1071	0	66.9	50	0
14148	12	2166	915	1	1070	72.8	0	20	5
14149	12	2361	915	1	1070	0	0	20	5
14150	12	2217	915	1	1070	0	60	20	5
14151	12	2181	915	1	1070	69.5	57.6	20	5
14152	13	2017	916	1	1072	136.2	123.8	55	17
14153	13	2367	916	1	1072	109.9	0	0	1
14154	13	2368	916	1	1072	127.9	0	0	2
14155	13	2018	916	1	1072	148	111.3	90	3
14156	13	2369	916	1	1072	99.9	0	0	4
14157	13	2370	916	1	1072	114.6	0	0	2
14158	13	2371	916	1	1072	82.9	0	0	1
14159	13	2019	916	1	1072	114.8	70.7	55	11
14160	13	2372	916	1	1072	81.9	0	0	3
14161	13	2373	916	1	1072	71.5	0	0	3
14162	13	2374	916	1	1072	75	0	0	3
14163	13	2020	916	1	1072	111.5	76.8	35	12
14164	13	2375	916	1	1072	115.9	0	0	1
14165	13	2376	916	1	1072	95.4	0	0	2
14166	13	2008	916	1	1072	164.4	134.2	45	5
14167	13	2021	916	1	1072	155.9	134.6	65	10
14168	13	2022	916	1	1072	116.8	77.1	15	10
14169	13	2023	916	1	1072	87.3	66.4	55	11
14170	13	2377	916	1	1072	87.3	0	0	2
14171	13	2378	916	1	1072	80.8	0	0	3
14172	13	2379	916	1	1072	71.5	0	0	4
14173	13	2024	916	1	1072	110.7	86	40	10
14174	13	2026	916	1	1072	143.6	99	40	10
14175	13	2009	916	1	1072	160.2	133.4	45	5
14176	13	2027	916	1	1072	140.7	106.3	65	15
14177	13	2380	916	1	1072	99.7	0	0	9
14178	13	2381	916	1	1072	105.2	0	0	5
14179	13	2382	916	1	1072	91.2	0	0	6
14180	13	2028	916	1	1072	112.7	93.7	45	30
14181	13	2383	916	1	1072	101.7	81	35	20
14182	13	2384	916	1	1072	80.4	0	35	10
14183	13	2385	916	1	1072	113.3	0	0	5
14184	13	2140	916	1	1072	133.7	77.2	20	5
14185	13	2174	916	1	1072	125.8	78	45	5
14186	13	2029	916	1	1072	148.9	101.2	40	4
14187	13	2386	916	1	1072	78	0	0	3
14188	13	2387	916	1	1072	73.6	0	0	2
14189	13	2388	916	1	1072	83.4	0	0	1
14190	13	2030	916	1	1072	121.4	76.2	35	15
14191	13	2031	916	1	1072	141.4	120.4	50	22
14192	13	2389	916	1	1072	139.4	0	0	1
14193	13	2390	916	1	1072	112.4	0	0	2
14194	13	2032	916	1	1072	136.1	89.5	50	10
14195	13	2144	916	1	1072	110.4	86.3	40	10
14196	13	2033	916	1	1072	156.9	129.1	35	8
14197	13	2391	916	1	1072	134	0	0	2
14198	13	2392	916	1	1072	123.9	0	0	2
14199	13	2393	916	1	1072	90.5	0	0	3
14200	13	2034	916	1	1072	143	102.8	35	15
14201	13	2035	916	1	1072	76.6	65.2	35	15
14202	13	2155	916	1	1072	154.3	137.9	15	10
14203	13	2013	916	1	1072	170.8	143.3	105	8
14204	13	2394	916	1	1072	136.8	0	0	4
14205	13	2395	916	1	1072	163.3	0	0	1
14206	13	2396	916	1	1072	118.1	0	0	2
14207	13	2397	916	1	1072	99.3	74.3	15	10
14208	13	2018	916	1	1073	0	66.4	175	0
14209	13	2335	916	1	1073	0	56.8	80	0
14210	13	2021	916	1	1073	0	67	55	0
14211	13	2024	916	1	1073	0	83.5	75	0
14212	13	2026	916	1	1073	0	120	80	0
14213	13	2029	916	1	1073	0	81.7	60	0
14214	13	2030	916	1	1073	0	73.7	60	0
14215	13	2032	916	1	1073	0	82.9	40	0
14216	13	2144	916	1	1073	0	82.3	80	0
14217	13	2033	916	1	1073	0	108.1	65	0
14218	13	2034	916	1	1073	0	66.5	60	0
14219	13	2035	916	1	1073	0	56.8	60	0
14220	13	2155	916	1	1073	0	104.7	60	0
14221	13	2017	916	1	1074	0	114.5	50	0
14222	13	2018	916	1	1074	0	106.9	75	0
14223	13	2019	916	1	1074	0	64.2	50	0
14224	13	2020	916	1	1074	0	66.2	50	0
14225	13	2023	916	1	1074	0	61.3	50	0
14226	13	2024	916	1	1074	0	83.2	50	0
14227	13	2026	916	1	1074	0	86.5	50	0
14228	13	2027	916	1	1074	0	85.5	50	0
14229	13	2034	916	1	1074	0	79.6	50	0
14230	13	2013	916	1	1074	0	129.9	75	0
14231	13	2017	917	1	1072	84.2	75.6	15	10
14232	13	2018	917	1	1072	101.6	84.8	20	5
14233	13	2019	917	1	1072	0	58.8	15	10
14234	13	2023	917	1	1072	75.9	56.8	15	10
14235	13	2024	917	1	1072	77	67.2	20	5
14236	13	2027	917	1	1072	83.2	64.5	15	10
14237	13	2028	917	1	1072	77	68.3	15	10
14238	13	2398	917	1	1072	98.3	79.7	50	21
14239	13	2399	917	1	1072	95.3	0	0	1
14240	13	2400	917	1	1072	92.4	0	0	3
14241	13	2036	917	1	1072	140.6	115	40	10
14242	13	2144	917	1	1072	87.2	75.9	20	5
14243	13	2033	917	1	1072	98.7	72	20	5
14244	13	2013	917	1	1072	154.9	141.1	20	10
14245	13	2018	917	1	1073	0	60	25	0
14246	13	2021	917	1	1073	0	76.3	25	0
14247	13	2024	917	1	1073	0	78.1	25	0
14248	13	2032	917	1	1073	0	84.3	20	0
14249	13	2033	917	1	1073	0	67.7	25	0
14250	13	2018	917	1	1074	0	74.7	25	0
14251	14	2189	918	1	1075	109	88	20	5
14252	14	2401	918	1	1075	107	74.2	20	5
14253	14	2124	918	1	1075	144.4	112.6	55	20
14254	14	2309	918	1	1075	150.6	112.1	20	5
14255	14	2163	918	1	1075	115.3	87.3	40	10
14256	14	2127	918	1	1075	139.3	131.7	55	20
14257	14	2018	918	1	1075	146.9	114.4	65	15
14258	14	2158	918	1	1075	143.5	101	45	5
14259	14	2230	918	1	1075	80.4	62.9	100	20
14260	14	2195	918	1	1075	117.2	107.1	15	10
14261	14	2129	918	1	1075	103.9	93.5	20	5
14262	14	2003	918	1	1075	178.3	163.2	60	20
14263	14	2130	918	1	1075	151	132.1	85	40
14264	14	2131	918	1	1075	123.7	91.1	35	15
14265	14	2132	918	1	1075	112.1	78.8	40	10
14266	14	2315	918	1	1075	97.5	78.1	35	9
14267	14	2402	918	1	1075	0	0	0	2
14268	14	2403	918	1	1075	0	0	0	2
14269	14	2404	918	1	1075	0	0	0	2
14270	14	2134	918	1	1075	168	118.2	45	5
14271	14	2021	918	1	1075	172.5	149.7	25	5
14272	14	2022	918	1	1075	174.7	134	20	5
14273	14	2135	918	1	1075	93.4	71.7	35	15
14274	14	2136	918	1	1075	119.7	93.7	30	20
14275	14	2024	918	1	1075	108.1	82.3	85	20
14276	14	2139	918	1	1075	145.6	117.7	70	30
14277	14	2028	918	1	1075	132.1	101.8	15	10
14278	14	2405	918	1	1075	95.9	74.7	20	5
14279	14	2406	918	1	1075	104.6	84	15	10
14280	14	2202	918	1	1075	99.4	66.2	40	10
14281	14	2029	918	1	1075	158.3	94.5	45	5
14282	14	2407	918	1	1075	134.2	91.1	45	5
14283	14	2321	918	1	1075	150.3	96.6	45	5
14284	14	2030	918	1	1075	126.9	96.6	40	10
14285	14	2408	918	1	1075	93.3	69.5	20	5
14286	14	2032	918	1	1075	121.8	86	40	10
14287	14	2144	918	1	1075	113.6	85.4	70	30
14288	14	2147	918	1	1075	97.6	69.5	45	5
14289	14	2151	918	1	1075	113.2	88	20	5
14290	14	2152	918	1	1075	141.4	81.3	20	5
14291	14	2153	918	1	1075	86.5	57.4	20	5
14292	14	2154	918	1	1075	165.7	144.5	27	8
14293	14	2034	918	1	1075	165.5	137.3	40	10
14294	14	2035	918	1	1075	87.3	68.8	45	5
14295	14	2409	918	1	1075	109	84.4	35	15
14296	14	2013	918	1	1075	174	160	70	30
14297	14	2397	918	1	1075	98.6	68.4	45	30
14298	14	2334	918	1	1075	182.4	158.7	45	5
14299	14	2410	918	1	1075	103.7	71.2	20	5
14300	14	2127	918	1	1076	0	122	50	0
14301	14	2018	918	1	1076	0	67.4	150	0
14302	14	2158	918	1	1076	0	81.2	25	0
14303	14	2130	918	1	1076	0	118.5	50	0
14304	14	2132	918	1	1076	0	73	25	0
14305	14	2335	918	1	1076	0	57.2	25	0
14306	14	2134	918	1	1076	0	89.9	50	0
14307	14	2021	918	1	1076	0	56.7	75	0
14308	14	2024	918	1	1076	0	79.1	200	0
14309	14	2029	918	1	1076	0	88.3	25	0
14310	14	2030	918	1	1076	0	58.1	50	0
14311	14	2144	918	1	1076	0	81	100	0
14312	14	2154	918	1	1076	0	117.6	25	0
14313	14	2034	918	1	1076	0	0	50	0
14314	14	2035	918	1	1076	0	56.7	75	0
14315	14	2334	918	1	1076	0	150	50	0
14316	14	2018	919	1	1075	106	82.9	15	5
14317	14	2003	919	1	1075	165.4	148.5	15	5
14318	14	2014	919	1	1075	144.8	113	50	25
14319	14	2131	919	1	1075	69.2	60	20	5
14320	14	2021	919	1	1075	170.3	125.6	15	5
14321	14	2135	919	1	1075	69.2	58.8	20	5
14322	14	2024	919	1	1075	79.1	67.6	15	5
14323	14	2139	919	1	1075	81	63.5	15	10
14324	14	2036	919	1	1075	152.1	124.7	55	20
14325	14	2154	919	1	1075	109.9	65.4	13	2
14326	14	2013	919	1	1075	159.2	146.1	15	10
14327	14	2014	919	1	1076	0	100.6	25	0
14328	15	2164	920	1	1077	85.4	64	23	5
14329	15	2037	920	1	1077	167.5	147.5	82	7
14330	15	2041	920	1	1077	161.1	0	0	2
14331	15	2042	920	1	1077	168.8	0	0	2
14332	15	2411	920	1	1077	156.1	0	0	2
14333	15	2045	920	1	1077	161.5	0	0	2
14334	15	2412	920	1	1077	178.2	0	0	1
14335	15	2046	920	1	1077	167.6	0	0	1
14336	15	2047	920	1	1077	164.4	0	0	2
14337	15	2051	920	1	1077	173.8	0	0	1
14338	15	2053	920	1	1077	162.2	0	0	2
14339	15	2055	920	1	1077	168.7	0	0	2
14340	15	2058	920	1	1077	158.2	0	0	2
14341	15	2060	920	1	1077	165.7	0	0	2
14342	15	2061	920	1	1077	178.2	0	0	1
14343	15	2062	920	1	1077	151.8	0	0	1
14344	15	2063	920	1	1077	155.1	0	0	2
14345	15	2065	920	1	1077	147.1	0	0	2
14346	15	2066	920	1	1077	169.7	0	0	2
14347	15	2067	920	1	1077	168.8	0	0	2
14348	15	2071	920	1	1077	164.5	0	0	2
14349	15	2072	920	1	1077	136.6	112.6	28	12
14350	15	2073	920	1	1077	143.4	132	16	4
14351	15	2074	920	1	1077	159.2	144.5	32	5
14352	15	2413	920	1	1077	157.4	0	0	1
14353	15	2079	920	1	1077	157.5	0	0	1
14354	15	2082	920	1	1077	154.2	0	0	1
14355	15	2083	920	1	1077	164.6	0	0	1
14356	15	2086	920	1	1077	163.6	0	0	1
14357	15	2092	920	1	1077	149.8	0	0	1
14358	15	2094	920	1	1077	164.6	0	0	1
14359	15	2099	920	1	1077	154.8	0	0	1
14360	15	2100	920	1	1077	160.3	0	0	1
14361	15	2101	920	1	1077	141.1	0	0	1
14362	15	2102	920	1	1077	152.8	0	0	1
14363	15	2414	920	1	1077	145.8	0	0	1
14364	15	2104	920	1	1077	152.8	0	0	1
14365	15	2415	920	1	1077	161.5	0	0	1
14366	15	2108	920	1	1077	160.5	0	0	1
14367	15	2110	920	1	1077	159.3	141.5	28	12
14368	15	2111	920	1	1077	118.5	105	90	21
14369	15	2416	920	1	1077	118.6	0	0	1
14370	15	2417	920	1	1077	111.5	0	0	1
14371	15	2418	920	1	1077	116.7	0	0	1
14372	15	2419	920	1	1077	129.4	0	0	1
14373	15	2420	920	1	1077	116	0	0	1
14374	15	2421	920	1	1077	107	0	0	1
14375	15	2422	920	1	1077	133.4	0	0	1
14376	15	2423	920	1	1077	128.6	0	0	1
14377	15	2424	920	1	1077	116.3	0	0	1
14378	15	2425	920	1	1077	115.2	0	0	1
14379	15	2426	920	1	1077	103.2	0	0	1
14380	15	2427	920	1	1077	128.7	0	0	1
14381	15	2428	920	1	1077	129.7	0	0	1
14382	15	2429	920	1	1077	121.9	0	0	1
14383	15	2430	920	1	1077	145.6	0	0	1
14384	15	2118	920	1	1077	95.5	0	0	1
14385	15	2431	920	1	1077	121.9	0	0	1
14386	15	2432	920	1	1077	129.2	0	0	1
14387	15	2433	920	1	1077	145.4	0	0	1
14388	15	2296	920	1	1077	120.7	107.3	20	5
14389	15	2121	920	1	1077	130.1	120.2	22	10
14390	15	2037	921	1	1077	141.4	112.2	20	5
14391	15	2412	921	1	1077	147.8	0	0	1
14392	15	2046	921	1	1077	141	0	0	1
14393	15	2051	921	1	1077	95.9	0	0	1
14394	15	2061	921	1	1077	115.1	0	0	1
14395	15	2062	921	1	1077	112	0	0	1
14396	15	2072	921	1	1077	109.4	72.7	7	3
15375	38	2181	963	1	1124	73.5	61.2	20	5
15376	38	2129	963	1	1125	0	64.9	25	0
15377	38	2166	963	1	1125	0	68.4	25	0
15378	38	2342	963	1	1125	0	63.6	25	0
15379	38	2560	963	1	1125	0	70.2	25	0
15380	38	2171	963	1	1125	0	68.5	25	0
15381	38	2181	963	1	1125	0	65.2	25	0
15382	39	2599	964	1	1126	0	0	0	8
15383	39	2149	964	1	1126	0	0	0	6
15384	39	2600	964	1	1126	0	0	0	8
15385	39	2150	964	1	1126	0	0	0	8
15386	39	2327	964	1	1126	0	0	0	9
15387	39	2328	964	1	1126	0	0	0	8
15388	39	2601	964	1	1126	0	0	0	7
15389	39	2602	964	1	1126	0	0	0	2
15390	39	2603	964	1	1126	0	0	0	2
15391	39	2604	964	1	1126	0	0	0	2
15392	39	2605	964	1	1126	0	0	0	2
15393	39	2606	964	1	1126	0	0	0	2
15394	39	2329	964	1	1126	0	0	0	7
15395	39	2607	964	1	1126	0	0	0	10
15396	39	2608	964	1	1126	0	0	0	5
15397	39	2330	964	1	1126	0	0	0	10
15398	39	2609	964	1	1126	0	0	0	4
15399	40	2336	965	1	1127	68.6	58.7	75	15
15400	40	2610	965	1	1127	83	56.7	75	15
15401	40	2176	965	1	1127	68	57	75	20
15402	40	2143	965	1	1127	69.6	58.7	75	20
15403	40	2336	966	1	1127	0	98.2	25	0
15404	40	2610	966	1	1127	0	57.9	25	0
15405	40	2176	966	1	1127	0	57.9	25	0
15406	40	2143	966	1	1127	0	56.8	25	0
15407	41	2611	967	1	1128	96.3	63.2	30	10
15408	41	2611	967	1	1129	0	73.2	50	0
15409	42	2499	968	1	1130	100.5	0	5	5
15410	42	2612	968	1	1130	137.2	109.3	25	25
15411	42	2030	968	1	1130	118.4	85.4	20	5
15412	42	2613	968	1	1130	132.1	113.8	9	6
15413	42	2614	968	1	1130	94.9	0	6	4
14397	15	2073	921	1	1077	85.2	79	4	1
14398	15	2074	921	1	1077	124.8	106.5	8	2
14399	15	2085	921	1	1077	134.5	0	0	1
14400	15	2089	921	1	1077	94.2	0	0	1
14401	15	2097	921	1	1077	100.5	0	0	1
14402	15	2110	921	1	1077	126.7	107.1	7	3
14403	15	2111	921	1	1077	72.3	66.2	22	10
14404	16	2156	922	1	1078	82.3	63.5	60	15
14405	16	2162	922	1	1078	68.1	56.7	40	10
14406	16	2163	922	1	1078	114.2	75.8	40	10
14407	16	2157	922	1	1078	146.1	98.9	45	5
14408	16	2191	922	1	1078	121.6	106.8	40	10
14409	16	2164	922	1	1078	72.9	59.9	40	10
14410	16	2158	922	1	1078	150.3	78.7	45	5
14411	16	2167	922	1	1078	73.8	60.9	55	20
14412	16	2434	922	1	1078	70.4	56.7	40	10
14413	16	2311	922	1	1078	71.4	57.6	40	10
14414	16	2339	922	1	1078	94.5	70.7	65	35
14415	16	2169	922	1	1078	80.9	63.7	35	15
14416	16	2340	922	1	1078	82.2	62.1	55	20
14417	16	2341	922	1	1078	0	56.9	35	15
14418	16	2435	922	1	1078	111	71.3	40	10
14419	16	2170	922	1	1078	68	56.7	40	10
14420	16	2134	922	1	1078	154.3	113.5	40	10
14421	16	2342	922	1	1078	68.4	60.2	72	28
14422	16	2344	922	1	1078	69.9	56.7	35	15
14423	16	2171	922	1	1078	84.1	66.2	54	21
14424	16	2172	922	1	1078	68.6	57	40	10
14425	16	2436	922	1	1078	0	56.8	40	10
14426	16	2174	922	1	1078	135.7	83.3	44	6
14427	16	2176	922	1	1078	68	56.8	50	25
14428	16	2321	922	1	1078	137.6	84.4	45	5
14429	16	2437	922	1	1078	68.3	56.7	65	35
14430	16	2142	922	1	1078	68.6	56.7	40	10
14431	16	2178	922	1	1078	68	60.1	35	15
14432	16	2143	922	1	1078	93.4	80.7	35	15
14433	16	2438	922	1	1078	68	56.7	40	10
14434	16	2212	922	1	1078	68.6	58.7	40	10
14435	16	2213	922	1	1078	70.5	57.5	70	30
14436	16	2160	922	1	1078	83.2	66.5	50	25
14437	16	2161	922	1	1078	68.3	58.6	50	25
14438	16	2214	922	1	1078	147.9	74.8	45	5
14439	16	2179	922	1	1078	100.1	66.5	40	10
14440	16	2180	922	1	1078	68.5	56.7	55	20
14441	16	2439	922	1	1078	89.7	60.9	60	15
14442	16	2181	922	1	1078	71.3	59.1	40	10
14443	16	2352	922	1	1078	76.7	57.9	40	10
14444	16	2182	922	1	1078	73.7	58	90	35
14445	16	2183	922	1	1078	109	70.7	40	10
14446	16	2440	922	1	1078	78.7	59.3	60	15
14447	16	2441	922	1	1078	71.3	56.7	40	10
14448	16	2442	922	1	1078	69.1	56.8	40	10
14449	16	2443	922	1	1078	68.3	56.8	35	15
14450	16	2444	922	1	1078	70.3	56.7	35	15
14451	16	2445	922	1	1078	68.8	56.8	35	15
14452	16	2357	922	1	1078	68	56.7	90	35
14453	16	2186	922	1	1078	97.5	68.3	40	10
14454	16	2187	922	1	1078	73.7	58.4	35	15
14455	16	2163	922	1	1079	0	68.5	50	0
14456	16	2157	922	1	1079	0	72.7	50	0
14457	16	2158	922	1	1079	0	77	25	0
14458	16	2339	922	1	1079	0	70.7	50	0
14459	16	2435	922	1	1079	0	68.2	50	0
14460	16	2134	922	1	1079	0	78	50	0
14461	16	2342	922	1	1079	0	61.9	50	0
14462	16	2174	922	1	1079	0	68.6	50	0
14463	16	2321	922	1	1079	0	70.4	50	0
14464	16	2178	922	1	1079	0	61.9	50	0
14465	16	2143	922	1	1079	0	68.2	50	0
14466	16	2160	922	1	1079	0	68.3	25	0
14467	16	2161	922	1	1079	0	67.2	50	0
14468	16	2214	922	1	1079	0	67.6	50	0
14469	16	2180	922	1	1079	0	62.1	50	0
14470	16	2182	922	1	1079	0	65.4	50	0
14471	16	2440	922	1	1079	0	67.6	50	0
14472	16	2185	922	1	1079	0	61.9	100	0
14473	16	2357	922	1	1079	0	65.2	50	0
14474	16	2186	922	1	1079	0	65.3	50	0
14475	16	2339	923	1	1078	74.4	57.9	20	5
14476	16	2134	923	1	1078	143.7	112.7	20	5
14477	16	2342	923	1	1078	83.1	57.7	18	7
14478	16	2171	923	1	1078	70.3	60.1	21	4
14479	16	2174	923	1	1078	130.4	98.9	21	4
14480	16	2181	923	1	1078	68.7	57.6	20	5
14481	16	2182	923	1	1078	68.3	56.9	20	5
14482	16	2444	923	1	1078	0	56.7	20	5
14483	16	2357	923	1	1078	73.7	56.8	20	5
14484	16	2158	923	1	1079	0	78.1	25	0
14485	16	2134	923	1	1079	0	85.5	25	0
14486	16	2160	923	1	1079	0	67.4	25	0
14487	17	2129	924	1	1080	81.9	71.9	15	10
14488	17	2435	924	1	1080	97.6	72.4	15	10
14489	17	2446	924	1	1080	122.6	81.1	15	10
14490	17	2447	924	1	1080	95.4	81.2	15	10
14491	17	2448	924	1	1080	113.6	81.1	15	10
14492	17	2449	924	1	1080	85.1	65.3	15	10
14493	17	2134	924	1	1080	148.4	103	17	8
14494	17	2129	924	1	1081	0	63.2	50	0
14495	17	2435	924	1	1081	0	65.2	50	0
14496	17	2446	924	1	1081	0	66.6	25	0
14497	17	2447	924	1	1081	0	68.5	25	0
14498	17	2450	924	1	1081	0	67.5	25	0
14499	17	2449	924	1	1081	0	62.8	50	0
14500	17	2134	924	1	1081	0	74.7	25	0
14501	17	2446	925	1	1080	68.1	57.6	15	10
14502	17	2448	925	1	1080	69.3	57.8	15	10
14503	17	2134	925	1	1080	132.8	106.6	18	7
14504	17	2446	925	1	1081	0	59.8	25	0
14505	17	2447	925	1	1081	0	59.9	25	0
14506	17	2450	925	1	1081	0	61.3	25	0
14507	17	2134	925	1	1081	0	68.6	25	0
14508	18	2017	926	1	1082	125.8	118.1	15	10
14509	18	2018	926	1	1082	131.3	111.2	35	15
14510	18	2019	926	1	1082	92.5	69.8	15	10
14511	18	2020	926	1	1082	93.5	69.7	35	15
14512	18	2021	926	1	1082	150.3	129.9	65	10
14513	18	2022	926	1	1082	102	69.4	15	10
14514	18	2023	926	1	1082	76.5	68.1	15	10
14515	18	2024	926	1	1082	107.1	83.3	35	15
14516	18	2027	926	1	1082	125.9	91.5	40	10
14517	18	2029	926	1	1082	143.6	100.9	15	10
14518	18	2030	926	1	1082	105.5	66.2	15	10
14519	18	2031	926	1	1082	137.2	118.7	15	10
14520	18	2032	926	1	1082	124.9	92.4	35	15
14521	18	2033	926	1	1082	145.6	113.5	40	10
14522	18	2034	926	1	1082	139.9	114.4	15	10
14523	18	2035	926	1	1082	76.9	65	40	10
14524	18	2013	926	1	1082	165.4	131	60	15
14525	18	2018	926	1	1083	0	67.2	100	0
14526	18	2021	926	1	1083	0	76.5	100	0
14527	18	2024	926	1	1083	0	80.1	100	0
14528	18	2029	926	1	1083	0	78.7	50	0
14529	18	2030	926	1	1083	0	81.2	50	0
14530	18	2032	926	1	1083	0	77.6	50	0
14531	18	2033	926	1	1083	0	101.6	50	0
14532	18	2034	926	1	1083	0	57.8	50	0
14533	18	2035	926	1	1083	0	56.7	50	0
14534	18	2018	927	1	1082	91.4	75.6	20	5
14535	18	2024	927	1	1082	72.7	59.8	20	5
14536	18	2036	927	1	1082	135.1	112.2	50	25
14537	18	2013	927	1	1082	147.5	118.3	20	5
14538	18	2018	927	1	1083	0	66.1	25	0
14539	18	2024	927	1	1083	0	72.9	25	0
14540	19	2189	928	1	1084	101.6	70.7	40	10
14541	19	2401	928	1	1084	80.7	58.8	40	10
14542	19	2124	928	1	1084	120.9	79.2	55	20
14543	19	2451	928	1	1084	136.9	74.7	20	5
14544	19	2163	928	1	1084	95.7	69.4	55	20
14545	19	2127	928	1	1084	127.9	116.2	45	30
14546	19	2191	928	1	1084	122.6	104.8	40	10
14547	19	2452	928	1	1084	128.6	86.4	20	5
14548	19	2158	928	1	1084	137.7	97.9	20	5
14549	19	2453	928	1	1084	168.5	80.6	20	5
14550	19	2037	928	1	1084	153.8	140.3	35	12
14551	19	2454	928	1	1084	132	0	0	3
14552	19	2455	928	1	1084	129.8	73.2	20	5
14553	19	2195	928	1	1084	102	83.7	40	10
14554	19	2129	928	1	1084	94.9	72.3	40	10
14555	19	2003	928	1	1084	174.1	153.9	20	5
14556	19	2130	928	1	1084	140.4	118.5	70	30
14557	19	2131	928	1	1084	91.8	69.5	45	30
14558	19	2435	928	1	1084	84.2	69.3	15	10
14559	19	2132	928	1	1084	100	70.2	35	15
14560	19	2315	928	1	1084	105.9	78.7	40	4
14561	19	2456	928	1	1084	0	0	0	2
14562	19	2457	928	1	1084	0	0	0	2
14563	19	2458	928	1	1084	0	0	0	2
14564	19	2134	928	1	1084	145.9	103	40	10
14565	19	2199	928	1	1084	75.8	62	15	10
14566	19	2135	928	1	1084	79.1	66.2	45	30
14567	19	2139	928	1	1084	126.5	94.6	40	35
14568	19	2173	928	1	1084	68.3	63	15	10
14569	19	2174	928	1	1084	133.2	92.2	20	5
14570	19	2202	928	1	1084	70.3	58.9	30	20
14571	19	2321	928	1	1084	118.6	80	20	5
14572	19	2142	928	1	1084	68.2	59.2	40	10
14573	19	2143	928	1	1084	76.1	64.6	40	10
14574	19	2206	928	1	1084	69.4	62	15	10
14575	19	2074	928	1	1084	148.5	138.4	35	12
14576	19	2459	928	1	1084	129.9	0	0	3
14577	19	2144	928	1	1084	104.9	84.9	30	20
14578	19	2212	928	1	1084	68.1	56.9	40	10
14579	19	2213	928	1	1084	73.7	62.1	40	10
14580	19	2146	928	1	1084	143.7	109.5	20	5
14581	19	2149	928	1	1084	86.7	57.4	14	6
14582	19	2151	928	1	1084	120.6	97.2	14	6
14583	19	2152	928	1	1084	113.9	69.3	14	6
14584	19	2329	928	1	1084	69.3	58.8	14	6
14585	19	2153	928	1	1084	94.6	57.2	14	6
14586	19	2216	928	1	1084	68.5	56.8	20	5
14587	19	2217	928	1	1084	68.7	56.8	20	5
14588	19	2180	928	1	1084	68.4	57.8	40	10
14589	19	2154	928	1	1084	159.3	124.6	35	15
14590	19	2460	928	1	1084	164.3	100.3	20	5
14591	19	2185	928	1	1084	69.6	59.7	40	10
14592	19	2189	928	1	1085	0	77.7	50	0
14593	19	2124	928	1	1085	0	80.9	25	0
14594	19	2127	928	1	1085	0	119.4	50	0
14595	19	2452	928	1	1085	0	69.1	50	0
14596	19	2158	928	1	1085	0	74.1	50	0
14597	19	2129	928	1	1085	0	71.1	25	0
14598	19	2130	928	1	1085	0	113.1	75	0
14599	19	2132	928	1	1085	0	73.4	25	0
14600	19	2335	928	1	1085	0	56.8	50	0
14601	19	2134	928	1	1085	0	85.2	50	0
14602	19	2139	928	1	1085	0	82	50	0
14603	19	2173	928	1	1085	0	70.4	25	0
14604	19	2174	928	1	1085	0	69.5	50	0
14605	19	2321	928	1	1085	0	71.3	25	0
14606	19	2143	928	1	1085	0	66.8	50	0
14607	19	2144	928	1	1085	0	82.4	50	0
14608	19	2212	928	1	1085	0	67.2	25	0
14609	19	2213	928	1	1085	0	66.3	25	0
14610	19	2151	928	1	1085	0	131.7	25	0
14611	19	2152	928	1	1085	0	108.8	25	0
14612	19	2153	928	1	1085	0	60.9	25	0
14613	19	2154	928	1	1085	0	103.7	50	0
14614	19	2185	928	1	1085	0	66	50	0
14615	19	2003	929	1	1084	147.6	128.3	20	5
14616	19	2014	929	1	1084	114.6	93.4	50	25
14617	19	2134	929	1	1084	109.5	80.2	20	5
14618	20	2309	930	1	1086	0	0	10	10
14619	20	2008	930	1	1086	169.7	148.4	15	8
14620	20	2461	930	1	1086	143.9	108.7	15	6
14621	20	2462	930	1	1086	0	0	10	5
14622	20	2174	930	1	1086	136.8	114.7	20	8
14623	20	2155	930	1	1086	175.1	123.8	25	8
14624	20	2463	930	1	1087	0	66	200	0
14625	20	2464	930	1	1087	0	61.8	100	0
14626	20	2465	930	1	1087	0	69.2	150	0
14627	20	2155	930	1	1087	0	108.3	300	0
14628	20	2309	931	1	1086	0	63.3	5	5
14629	20	2008	931	1	1086	159.1	145.1	10	7
14630	20	2461	931	1	1086	122.2	111.8	10	6
14631	20	2462	931	1	1086	0	0	5	5
14632	20	2174	931	1	1086	129.9	115.1	18	7
14633	20	2155	931	1	1086	146.3	113.1	15	7
14634	20	2463	931	1	1087	0	62	150	0
14635	20	2464	931	1	1087	0	65.4	50	0
14636	20	2465	931	1	1087	0	73.7	100	0
14637	20	2155	931	1	1087	0	71.4	150	0
14638	21	2167	932	1	1088	69.5	59.1	15	10
14639	21	2434	932	1	1088	69.7	56.7	15	10
14640	21	2311	932	1	1088	0	56.7	15	10
14641	21	2435	932	1	1088	89.4	67.3	15	10
14642	21	2134	932	1	1088	132.4	92.6	20	5
14643	21	2342	932	1	1088	68.4	56.7	15	10
14644	21	2172	932	1	1088	68.4	57.1	15	10
14645	21	2174	932	1	1088	105.4	65.5	20	5
14646	21	2181	932	1	1088	76.9	57.8	15	10
14647	21	2182	932	1	1088	69.5	62.2	15	10
14648	21	2184	932	1	1088	75.8	63.3	15	10
14649	21	2185	932	1	1088	68.1	56.9	15	10
14650	21	2167	932	1	1089	0	61.7	25	0
14651	21	2434	932	1	1089	0	59.9	25	0
14652	21	2311	932	1	1089	0	59	25	0
14653	21	2134	932	1	1089	0	71.3	25	0
14654	21	2342	932	1	1089	0	60.8	25	0
14655	21	2172	932	1	1089	0	58.2	25	0
14656	21	2174	932	1	1089	0	65.1	25	0
14657	21	2181	932	1	1089	0	60.2	25	0
14658	21	2182	932	1	1089	0	65.1	25	0
14659	21	2184	932	1	1089	0	66.1	25	0
14660	22	2326	933	1	1090	189	179.5	35	3
14661	22	2466	933	1	1090	182.8	164.2	100	10
14662	22	2467	933	1	1090	205.2	184.6	40	3
14663	22	2468	933	1	1090	187.9	172.2	79	6
14664	22	2326	934	1	1090	167.1	137.7	30	2
14665	22	2466	934	1	1090	179.5	155.4	47	5
14666	22	2467	934	1	1090	193	162.9	34	2
14667	22	2468	934	1	1090	180.4	156.3	50	4
14668	23	2134	935	1	1091	0	91.5	25	0
14669	23	2144	935	1	1091	0	91.3	25	0
14670	23	2334	935	1	1091	0	153	80	0
14671	24	2017	936	1	1092	137	130.7	25	24
14672	24	2469	936	1	1092	171.8	0	0	1
14673	24	2018	936	1	1092	136.4	114.7	90	33
14674	24	2470	936	1	1092	144.8	0	0	1
14675	24	2471	936	1	1092	149	0	0	1
14676	24	2037	936	1	1092	161.2	146.4	20	3
14677	24	2472	936	1	1092	160.4	0	0	1
14678	24	2473	936	1	1092	166.5	0	0	1
14679	24	2019	936	1	1092	94.6	69.6	70	28
14680	24	2474	936	1	1092	80	0	0	1
14681	24	2475	936	1	1092	121.6	0	0	1
14682	24	2020	936	1	1092	102.2	75.5	50	24
14683	24	2476	936	1	1092	125.6	0	0	1
14684	24	2021	936	1	1092	167	137.1	40	10
14685	24	2022	936	1	1092	118.3	90.7	15	10
14686	24	2023	936	1	1092	83.1	72.4	25	25
14687	24	2024	936	1	1092	110.3	87.8	75	25
14688	24	2009	936	1	1092	163.3	133.1	35	15
14689	24	2027	936	1	1092	130.2	96.5	120	47
14690	24	2477	936	1	1092	133.3	0	0	1
14691	24	2478	936	1	1092	118.7	0	0	3
14692	24	2479	936	1	1092	145.7	0	0	2
14693	24	2480	936	1	1092	137.3	0	0	2
14694	24	2028	936	1	1092	124.9	95.4	30	20
14695	24	2405	936	1	1092	109	90.3	30	20
14696	24	2384	936	1	1092	84.8	61.1	40	5
14697	24	2385	936	1	1092	105.7	0	0	5
14698	24	2030	936	1	1092	127	75.5	40	10
14699	24	2031	936	1	1092	146.3	122.6	75	20
14700	24	2481	936	1	1092	133	0	0	1
14701	24	2482	936	1	1092	151.8	0	0	1
14702	24	2483	936	1	1092	138.5	0	0	3
14703	24	2074	936	1	1092	154.9	144.3	20	3
14704	24	2484	936	1	1092	150.7	0	0	1
14705	24	2485	936	1	1092	153.6	0	0	1
14706	24	2486	936	1	1092	87.7	67.5	15	10
14707	24	2144	936	1	1092	122.8	84.2	65	10
14708	24	2152	936	1	1092	131.6	111	20	5
14709	24	2153	936	1	1092	119.1	84.7	15	10
14710	24	2033	936	1	1092	154.7	129	55	20
14711	24	2034	936	1	1092	134.8	110.5	15	10
14712	24	2035	936	1	1092	78.9	67.5	40	10
14713	24	2013	936	1	1092	178.4	147.5	70	6
14714	24	2487	936	1	1092	173	0	0	2
14715	24	2488	936	1	1092	115.6	0	0	5
14716	24	2489	936	1	1092	149.7	0	0	5
14717	24	2490	936	1	1092	167.5	0	0	2
14718	24	2018	936	1	1093	0	66.2	175	0
14719	24	2021	936	1	1093	0	57.6	75	0
14720	24	2024	936	1	1093	0	81	200	0
14721	24	2030	936	1	1093	0	69	100	0
14722	24	2144	936	1	1093	0	83.3	50	0
14723	24	2033	936	1	1093	0	103.8	50	0
14724	24	2034	936	1	1093	0	79.3	50	0
14725	24	2035	936	1	1093	0	56.7	50	0
14726	24	2017	937	1	1092	81.5	65	20	5
14727	24	2018	937	1	1092	92.3	74.5	20	5
14728	24	2023	937	1	1092	77.1	56.8	20	5
14729	24	2024	937	1	1092	72.9	64.4	20	5
14730	24	2398	937	1	1092	95.6	75.8	45	19
14731	24	2491	937	1	1092	79.6	0	0	1
14732	24	2492	937	1	1092	70.3	0	0	1
14733	24	2493	937	1	1092	69.6	0	0	5
14734	24	2494	937	1	1092	77.8	0	0	4
14735	24	2036	937	1	1092	135.5	110.9	80	15
14736	24	2033	937	1	1092	86.9	65.2	20	5
14737	24	2013	937	1	1092	150.6	133.5	20	10
14738	25	2156	938	1	1094	81.2	68.6	30	20
14739	25	2162	938	1	1094	79.3	68.6	15	10
14740	25	2158	938	1	1094	129.5	92.1	20	5
14741	25	2129	938	1	1094	83.9	73	15	10
14742	25	2166	938	1	1094	98	73.6	30	20
14743	25	2167	938	1	1094	73.9	64.2	30	20
14744	25	2311	938	1	1094	73.1	63.2	20	5
14745	25	2339	938	1	1094	86.3	69.6	30	20
14746	25	2342	938	1	1094	70.9	64.2	30	20
14747	25	2171	938	1	1094	92.6	72.9	15	10
14748	25	2436	938	1	1094	68.6	60.8	15	10
14749	25	2173	938	1	1094	86.3	64.2	20	5
14750	25	2174	938	1	1094	129.2	83.3	22	3
14751	25	2495	938	1	1094	69.2	59	30	20
14752	25	2176	938	1	1094	69.3	63	30	20
14753	25	2437	938	1	1094	68.1	57.8	45	30
14754	25	2143	938	1	1094	72.5	65	30	20
14755	25	2496	938	1	1094	94.9	77	15	10
14756	25	2497	938	1	1094	79.8	66.2	15	10
14757	25	2212	938	1	1094	68.3	61.1	35	15
14758	25	2213	938	1	1094	68.1	61	30	20
14759	25	2160	938	1	1094	73	63.8	60	40
14760	25	2161	938	1	1094	71.5	60.3	50	25
14761	25	2498	938	1	1094	84.6	63.1	23	7
14762	25	2351	938	1	1094	68.3	59.5	30	20
14763	25	2180	938	1	1094	68	61.1	30	20
14764	25	2181	938	1	1094	73.4	63.2	30	20
14765	25	2182	938	1	1094	79.6	67.3	15	10
14766	25	2183	938	1	1094	111.1	73.9	23	7
14767	25	2184	938	1	1094	87.4	64.2	75	25
14768	25	2185	938	1	1094	74.1	60.9	65	35
14769	25	2187	938	1	1094	79	64	75	25
14770	25	2166	938	1	1095	0	71.5	50	0
14771	25	2167	938	1	1095	0	66.5	50	0
14772	25	2342	938	1	1095	0	68.5	25	0
14773	25	2174	938	1	1095	0	83	25	0
14774	25	2176	938	1	1095	0	67.5	25	0
14775	25	2437	938	1	1095	0	67.1	25	0
14776	25	2143	938	1	1095	0	66.7	25	0
14777	25	2212	938	1	1095	0	66.1	50	0
14778	25	2160	938	1	1095	0	68.2	50	0
14779	25	2161	938	1	1095	0	65.1	75	0
14780	25	2180	938	1	1095	0	64.9	25	0
14781	25	2183	938	1	1095	0	73	25	0
14782	25	2184	938	1	1095	0	69.4	50	0
14783	25	2185	938	1	1095	0	69.4	25	0
14784	25	2187	938	1	1095	0	70.5	25	0
14785	25	2166	939	1	1094	72.8	56.8	20	5
14786	25	2342	939	1	1094	0	56.7	20	5
14787	25	2174	939	1	1094	119.1	72.9	23	2
14788	25	2160	939	1	1094	69.4	57	15	10
14789	25	2161	939	1	1094	69.1	57.9	20	5
14790	25	2498	939	1	1094	69.4	56.8	17	3
14791	25	2183	939	1	1094	71.9	59.8	17	3
14792	25	2184	939	1	1094	69.4	56.9	20	5
14793	25	2185	939	1	1094	0	57.2	20	5
14794	25	2187	939	1	1094	70.5	56.7	20	5
14795	26	2499	940	1	1096	163.2	157.4	1	1
14796	26	2500	940	1	1096	164.4	83.6	7	2
14797	26	2501	940	1	1096	119.6	103.6	2	1
14798	26	2502	940	1	1096	166.2	115.4	5	1
14799	26	2503	940	1	1096	164	132.5	3	1
14800	26	2504	940	1	1096	174.3	73.9	4	1
14801	26	2505	940	1	1096	149.4	111.4	4	1
14802	26	2506	940	1	1096	164	146	3	1
14803	26	2507	940	1	1096	162.9	136	1	1
14804	26	2508	940	1	1096	133.1	70.7	13	2
14805	26	2509	940	1	1096	160.4	94.1	10	2
14806	26	2324	940	1	1096	170.1	79	5	2
14807	26	2510	940	1	1096	78.6	77.3	1	1
14808	26	2511	940	1	1096	162.7	129.2	9	5
14809	26	2499	941	1	1096	0	139.4	2	0
14810	26	2500	941	1	1096	173.9	161.8	2	1
14811	26	2501	941	1	1096	139.2	90.9	1	1
14812	26	2502	941	1	1096	170.6	97.3	2	1
14813	26	2503	941	1	1096	165.3	132.6	1	1
14814	26	2504	941	1	1096	0	0	1	1
14815	26	2505	941	1	1096	162.5	87.4	1	1
14816	26	2506	941	1	1096	188.8	168	1	1
14817	26	2507	941	1	1096	0	0	1	0
14818	26	2508	941	1	1096	132	61.1	4	1
14819	26	2509	941	1	1096	128	98.8	4	1
14820	26	2324	941	1	1096	0	0	2	1
14821	26	2510	941	1	1096	171.5	155.1	1	1
14822	26	2511	941	1	1096	163.3	109.4	4	2
14823	27	2512	942	1	1097	126.5	109.9	14	3
14824	27	2451	942	1	1097	154.9	128.9	15	3
14825	27	2513	942	1	1097	150.7	116.3	6	3
14826	27	2514	942	1	1097	161.6	107.7	8	3
14827	27	2515	942	1	1097	135.5	91.4	17	3
14828	27	2455	942	1	1097	152.3	94.3	30	2
14829	27	2516	942	1	1097	165.3	100.2	7	2
14830	27	2337	942	1	1097	170	113.2	46	2
14831	27	2517	942	1	1097	175.8	142.3	9	2
14832	27	2518	942	1	1097	153.9	76.7	9	2
14833	27	2519	942	1	1097	142.1	120.4	13	5
14834	27	2520	942	1	1097	137.3	117.4	10	3
14835	27	2521	942	1	1097	137.9	98.7	8	2
14836	27	2522	942	1	1097	162.5	102.6	5	1
14837	27	2523	942	1	1097	115.3	80.2	10	3
14838	27	2524	942	1	1097	139.3	75.6	10	3
14839	27	2525	942	1	1097	108.3	70.8	10	3
14840	27	2526	942	1	1097	153.7	101.5	10	2
14841	27	2527	942	1	1097	163.4	80.7	20	2
14842	27	2528	942	1	1097	169.5	94.5	30	2
14843	27	2529	942	1	1097	173.6	135.4	10	2
14844	27	2530	942	1	1097	127	99.1	10	3
14845	27	2146	942	1	1097	181.6	156	6	1
14846	27	2531	942	1	1097	169.8	129.4	5	1
14847	27	2532	942	1	1097	148.7	118.4	7	1
14848	27	2533	942	1	1097	165.8	144.6	5	1
14849	27	2534	942	1	1097	180.7	78.8	5	1
14850	27	2535	942	1	1097	148.1	84.3	11	3
14851	27	2325	942	1	1097	115.9	70.2	24	4
14852	27	2516	942	1	1098	0	77.4	15	0
14853	27	2523	942	1	1098	0	70.8	15	0
14854	27	2524	942	1	1098	0	74.8	20	0
14855	27	2525	942	1	1098	0	70.6	20	0
14856	27	2526	942	1	1098	0	106.6	20	0
14857	27	2528	942	1	1098	0	90.6	40	0
14858	27	2325	942	1	1098	0	135.4	20	0
14859	27	2455	943	1	1097	169.2	101.6	18	1
14860	27	2516	943	1	1097	181.3	127.6	4	1
14861	27	2337	943	1	1097	162.2	87.8	22	1
14862	27	2517	943	1	1097	165.3	106.2	5	1
14863	27	2518	943	1	1097	163.9	108.2	5	1
14864	27	2519	943	1	1097	148	127	7	2
14865	27	2521	943	1	1097	0	0	4	1
14866	27	2522	943	1	1097	145.4	67.7	3	1
14867	27	2523	943	1	1097	130.4	100.9	5	2
14868	27	2524	943	1	1097	77.8	60.9	5	2
14869	27	2525	943	1	1097	75.9	57.8	5	2
14870	27	2527	943	1	1097	167.6	96.2	10	1
14871	27	2528	943	1	1097	144.7	107.6	10	1
14872	27	2530	943	1	1097	132.4	0	0	2
14873	27	2146	943	1	1097	167.9	133.7	4	1
14874	27	2531	943	1	1097	161.4	135.6	3	1
14875	27	2532	943	1	1097	166.2	134	4	1
14876	27	2533	943	1	1097	168.7	162.2	3	1
14877	27	2534	943	1	1097	161.2	102.1	3	1
14878	27	2535	943	1	1097	148.8	100.1	5	1
14879	27	2325	943	1	1097	97	0	10	2
14880	27	2516	943	1	1098	0	90.2	10	0
14881	27	2523	943	1	1098	0	77.7	10	0
14882	27	2524	943	1	1098	0	79.9	10	0
14883	27	2525	943	1	1098	0	78	10	0
14884	27	2528	943	1	1098	0	80.4	10	0
14885	27	2325	943	1	1098	0	67.4	10	0
14886	28	2124	944	1	1099	125.7	91.3	55	20
14887	28	2163	944	1	1099	102.9	76.1	70	30
14888	28	2536	944	1	1099	113.3	82	30	20
14889	28	2191	944	1	1099	122.7	104.8	50	25
14890	28	2003	944	1	1099	167.7	140.1	55	20
14891	28	2134	944	1	1099	140.8	96.9	55	20
14892	28	2136	944	1	1099	105.9	77.9	50	25
14893	28	2145	944	1	1099	101.9	80.5	55	20
14894	28	2537	944	1	1099	105	81	55	20
14895	28	2155	944	1	1099	143.9	120.7	35	15
14896	28	2163	944	1	1100	0	68.6	75	0
14897	28	2536	944	1	1100	0	71.5	25	0
14898	28	2134	944	1	1100	0	81.9	50	0
14899	28	2136	944	1	1100	0	68.4	50	0
14900	28	2144	944	1	1100	0	80.9	75	0
14901	29	2001	945	1	1101	158	139.8	15	10
14902	29	2538	945	1	1101	93.2	66.4	15	10
14903	29	2002	945	1	1101	86.3	58.3	15	10
14904	29	2003	945	1	1101	169.8	155.9	40	35
14905	29	2004	945	1	1101	140.1	96.6	15	10
14906	29	2005	945	1	1101	68.7	61.6	25	25
14907	29	2006	945	1	1101	97.8	59.5	15	10
14908	29	2007	945	1	1101	106.5	76.3	15	10
14909	29	2008	945	1	1101	161.2	148.5	15	10
14910	29	2539	945	1	1101	118.8	102.7	15	10
14911	29	2009	945	1	1101	165.5	147.4	30	20
14912	29	2011	945	1	1101	163.3	147.5	15	10
14913	29	2012	945	1	1101	70	0	15	10
14914	29	2013	945	1	1101	170.8	150.8	150	50
14915	29	2003	945	1	1102	0	126.2	50	0
14916	29	2009	945	1	1102	0	125	25	0
14917	29	2013	945	1	1102	0	130.4	50	0
14918	29	2003	946	1	1101	166.4	144.3	20	5
14919	29	2014	946	1	1101	135.3	112.3	25	25
14920	29	2036	946	1	1101	142.8	121.8	35	15
14921	29	2014	946	1	1102	0	93.1	25	0
14922	29	2036	946	1	1102	0	112.2	25	0
14923	30	2017	947	1	1103	131.1	114.2	40	10
14924	30	2018	947	1	1103	134.3	108.4	80	20
14925	30	2019	947	1	1103	96.8	69.4	35	15
14926	30	2020	947	1	1103	102.6	71.1	40	10
14927	30	2021	947	1	1103	173.6	146	30	10
14928	30	2022	947	1	1103	102.1	71.4	10	5
14929	30	2023	947	1	1103	81.8	67	35	15
14930	30	2024	947	1	1103	106	82	60	15
14931	30	2025	947	1	1103	88.3	74.5	40	10
14932	30	2027	947	1	1103	134.3	100.8	35	15
14933	30	2028	947	1	1103	116.6	92.3	50	25
14934	30	2029	947	1	1103	131	71.8	40	10
14935	30	2030	947	1	1103	137.9	96.4	40	10
14936	30	2031	947	1	1103	143.4	120.4	40	10
14937	30	2032	947	1	1103	119	70.3	40	10
14938	30	2144	947	1	1103	103.8	84.5	20	5
14939	30	2033	947	1	1103	152.1	118.4	40	10
14940	30	2034	947	1	1103	153.7	74.2	40	10
14941	30	2035	947	1	1103	81.5	67.1	40	10
14942	30	2018	947	1	1104	0	64.3	175	0
14943	30	2021	947	1	1104	0	57.1	75	0
14944	30	2024	947	1	1104	0	78.2	175	0
14945	30	2030	947	1	1104	0	58.6	50	0
14946	30	2032	947	1	1104	0	78.8	50	0
14947	30	2033	947	1	1104	0	89.6	50	0
14948	30	2034	947	1	1104	0	64.8	50	0
14949	30	2035	947	1	1104	0	57	50	0
14950	30	2017	947	1	1105	0	113	25	0
14951	30	2018	947	1	1105	0	102.2	50	0
14952	30	2024	947	1	1105	0	76.2	50	0
14953	30	2027	947	1	1105	0	95.7	25	0
14954	30	2033	947	1	1105	0	100.9	25	0
14955	30	2018	948	1	1103	109.4	80.1	20	5
14956	30	2021	948	1	1103	176.9	134.1	15	5
14957	30	2024	948	1	1103	70.7	59.7	20	5
14958	30	2018	948	1	1104	0	69.6	25	0
14959	30	2024	948	1	1104	0	69.8	25	0
14960	31	2190	949	1	1106	108.1	82	15	10
14961	31	2124	949	1	1106	131.2	102.7	50	25
14962	31	2309	949	1	1106	144.8	107	20	5
14963	31	2125	949	1	1106	114.5	67.5	20	5
14964	31	2127	949	1	1106	141.3	131.3	30	20
14965	31	2191	949	1	1106	134.4	118.7	20	5
14966	31	2452	949	1	1106	106.3	71.5	40	10
14967	31	2037	949	1	1106	164.9	145.7	15	7
14968	31	2540	949	1	1106	151.9	0	0	3
14969	31	2518	949	1	1106	80.1	64.3	20	5
14970	31	2195	949	1	1106	122.7	108.2	15	10
14971	31	2130	949	1	1106	154.9	133.6	30	20
14972	31	2131	949	1	1106	107.2	78.9	30	20
14973	31	2132	949	1	1106	107.7	83.7	35	15
14974	31	2520	949	1	1106	102	59.4	20	5
14975	31	2541	949	1	1106	76.2	63.2	20	5
14976	31	2542	949	1	1106	104.3	73	35	15
14977	31	2134	949	1	1106	140.1	108.3	30	20
14978	31	2199	949	1	1106	102.7	65.9	20	5
14979	31	2543	949	1	1106	73.3	0	20	5
14980	31	2544	949	1	1106	104.4	77.6	20	5
14981	31	2135	949	1	1106	91.5	72.6	30	20
14982	31	2136	949	1	1106	107.3	79.1	30	20
14983	31	2545	949	1	1106	88.3	72	20	5
14984	31	2546	949	1	1106	106.1	72.8	40	10
14985	31	2139	949	1	1106	141.6	117.6	45	30
14986	31	2174	949	1	1106	125.3	89.5	35	15
14987	31	2547	949	1	1106	68.8	57.2	35	15
14988	31	2202	949	1	1106	107.3	83.2	15	10
14989	31	2548	949	1	1106	109.3	75.6	40	10
14990	31	2549	949	1	1106	108.1	87.9	20	5
14991	31	2074	949	1	1106	155	143.3	15	7
14992	31	2091	949	1	1106	142.8	0	0	3
14993	31	2550	949	1	1106	70.9	62.8	15	10
14994	31	2144	949	1	1106	106.3	84	35	15
14995	31	2146	949	1	1106	119.4	62	17	8
14996	31	2147	949	1	1106	87.4	70.5	20	5
14997	31	2152	949	1	1106	119.2	97.8	17	8
14998	31	2329	949	1	1106	71.9	57.1	17	8
14999	31	2551	949	1	1106	151.4	95.2	16	9
15000	31	2332	949	1	1106	92.2	61.7	20	5
15001	31	2154	949	1	1106	161.3	136.3	35	15
15002	31	2334	949	1	1106	182.4	162.5	20	5
15003	31	2130	949	1	1107	0	112.5	50	0
15004	31	2132	949	1	1107	0	70.3	50	0
15005	31	2542	949	1	1107	0	71.8	50	0
15006	31	2134	949	1	1107	0	82.9	50	0
15007	31	2543	949	1	1107	0	74	25	0
15008	31	2544	949	1	1107	0	66.8	25	0
15009	31	2545	949	1	1107	0	74.7	25	0
15010	31	2154	949	1	1107	0	100.7	50	0
15011	31	2190	949	1	1108	0	70.2	25	0
15012	31	2127	949	1	1108	0	128.2	25	0
15013	31	2131	949	1	1108	0	67.2	25	0
15014	31	2132	949	1	1108	0	66.3	25	0
15015	31	2134	949	1	1108	0	87	25	0
15016	31	2543	949	1	1108	0	96.9	25	0
15017	31	2135	949	1	1108	0	65	25	0
15018	31	2136	949	1	1108	0	77.7	25	0
15019	31	2127	950	1	1106	96.7	86.1	20	5
15020	31	2037	950	1	1106	135.4	103.2	20	5
15021	31	2131	950	1	1106	78.6	57	15	10
15022	31	2135	950	1	1106	0	56.8	15	10
15023	31	2139	950	1	1106	77	62.7	15	10
15024	31	2074	950	1	1106	116.6	95.1	20	5
15025	31	2154	950	1	1106	94.4	64.1	20	5
15026	32	2156	951	1	1109	72.8	65	30	20
15027	32	2162	951	1	1109	68.5	59	35	15
15028	32	2163	951	1	1109	91.4	67.3	53	22
15029	32	2158	951	1	1109	123	89.5	17	8
15030	32	2128	951	1	1109	80.9	61.3	35	15
15031	32	2129	951	1	1109	93.7	70.2	40	10
15032	32	2166	951	1	1109	79.9	65.9	50	25
15033	32	2167	951	1	1109	76.5	59.8	20	5
15034	32	2552	951	1	1109	71.8	59	20	5
15035	32	2159	951	1	1109	68.4	57.1	30	20
15036	32	2134	951	1	1109	131.2	89.8	40	10
15037	32	2342	951	1	1109	68.1	57.8	50	25
15038	32	2553	951	1	1109	100.2	73	20	5
15039	32	2171	951	1	1109	75.9	60.2	40	10
15040	32	2172	951	1	1109	0	56.7	15	10
15041	32	2173	951	1	1109	69.3	56.8	40	10
15042	32	2174	951	1	1109	118.9	81.9	20	5
15043	32	2175	951	1	1109	78.9	56.9	17	8
15044	32	2176	951	1	1109	68	56.7	50	25
15045	32	2437	951	1	1109	69.5	56.7	45	30
15046	32	2142	951	1	1109	68.9	57	30	20
15047	32	2178	951	1	1109	68.1	56.7	40	10
15048	32	2143	951	1	1109	81.9	63	40	10
15049	32	2363	951	1	1109	68.5	59.7	15	10
15050	32	2212	951	1	1109	70.1	56.7	40	10
15051	32	2160	951	1	1109	76.8	64.3	45	30
15052	32	2161	951	1	1109	68.1	56.7	50	25
15053	32	2554	951	1	1109	69.5	60.3	30	20
15054	32	2182	951	1	1109	68.1	56.7	40	35
15055	32	2183	951	1	1109	90.4	62.2	40	10
15056	32	2184	951	1	1109	71.5	60	48	27
15057	32	2442	951	1	1109	69.4	56.7	35	15
15058	32	2186	951	1	1109	85.2	65.2	50	25
15059	32	2187	951	1	1109	73.1	62.2	45	30
15060	32	2163	951	1	1110	0	66.2	75	0
15061	32	2158	951	1	1110	0	72.8	25	0
15062	32	2166	951	1	1110	0	66.2	75	0
15063	32	2167	951	1	1110	0	59.4	50	0
15064	32	2159	951	1	1110	0	59.1	50	0
15065	32	2134	951	1	1110	0	82.1	25	0
15066	32	2553	951	1	1110	0	62	75	0
15067	32	2171	951	1	1110	0	64.3	50	0
15068	32	2172	951	1	1110	0	58.7	50	0
15069	32	2175	951	1	1110	0	58	25	0
15070	32	2176	951	1	1110	0	61	50	0
15071	32	2437	951	1	1110	0	59.2	75	0
15072	32	2142	951	1	1110	0	57.8	50	0
15073	32	2160	951	1	1110	0	66.4	50	0
15074	32	2161	951	1	1110	0	60	75	0
15075	32	2182	951	1	1110	0	60.3	75	0
15076	32	2184	951	1	1110	0	63.2	50	0
15077	32	2186	951	1	1110	0	63.3	75	0
15078	32	2187	951	1	1110	0	63.1	100	0
15079	32	2163	952	1	1109	79.2	64.3	22	3
15080	32	2158	952	1	1109	129.3	83.2	23	2
15081	32	2175	952	1	1109	68.4	0	23	2
15082	32	2161	952	1	1109	69.9	56.7	20	5
15083	32	2184	952	1	1109	69.4	56.7	22	3
15084	33	2555	953	1	1111	70.6	59.2	35	15
15085	33	2163	953	1	1111	79.9	64.1	30	20
15086	33	2536	953	1	1111	81.8	61.2	30	20
15087	33	2126	953	1	1111	94.5	61.2	20	5
15088	33	2191	953	1	1111	104.9	92.2	30	20
15089	33	2158	953	1	1111	123.6	89.4	18	7
15090	33	2166	953	1	1111	83.8	63	70	30
15091	33	2434	953	1	1111	0	56.7	15	10
15092	33	2169	953	1	1111	68.1	57.7	15	10
15093	33	2340	953	1	1111	83.8	65.1	15	10
15094	33	2170	953	1	1111	68.3	56.9	15	10
15095	33	2134	953	1	1111	134.6	93.4	40	10
15096	33	2342	953	1	1111	68.3	57.1	70	30
15097	33	2546	953	1	1111	88.7	61.2	40	10
15098	33	2319	953	1	1111	120.8	72.5	45	5
15099	33	2171	953	1	1111	71.6	65.3	15	10
15100	33	2172	953	1	1111	0	56.7	35	15
15101	33	2174	953	1	1111	103.6	71	40	10
15102	33	2175	953	1	1111	74.9	56.9	15	10
15103	33	2176	953	1	1111	68.3	56.7	35	15
15104	33	2178	953	1	1111	69.3	57.6	15	10
15105	33	2143	953	1	1111	75.5	63.1	52	23
15106	33	2204	953	1	1111	0	0	0	4
15107	33	2205	953	1	1111	72.3	62.1	30	16
15108	33	2363	953	1	1111	69.3	56.7	35	15
15109	33	2213	953	1	1111	68.1	56.8	70	30
15110	33	2181	953	1	1111	71.4	58	35	15
15111	33	2352	953	1	1111	68.1	56.7	50	25
15112	33	2182	953	1	1111	68.1	56.7	95	30
15113	33	2442	953	1	1111	68.2	61	15	10
15114	33	2155	953	1	1111	145.9	129.9	15	10
15115	33	2358	953	1	1111	68.7	59	15	10
15116	33	2555	953	1	1112	0	65.1	25	0
15117	33	2163	953	1	1112	0	65	50	0
15118	33	2536	953	1	1112	0	65.6	25	0
15119	33	2126	953	1	1112	0	66.6	25	0
15120	33	2158	953	1	1112	0	72.7	50	0
15121	33	2166	953	1	1112	0	66.1	50	0
15122	33	2434	953	1	1112	0	59.8	25	0
15123	33	2169	953	1	1112	0	63	25	0
15124	33	2134	953	1	1112	0	78.1	75	0
15125	33	2342	953	1	1112	0	62	25	0
15126	33	2319	953	1	1112	0	66.5	50	0
15127	33	2171	953	1	1112	0	67.1	25	0
15128	33	2174	953	1	1112	0	65.7	75	0
15129	33	2175	953	1	1112	0	58.9	25	0
15130	33	2178	953	1	1112	0	60.4	25	0
15131	33	2143	953	1	1112	0	62.1	75	0
15132	33	2363	953	1	1112	0	63.2	25	0
15133	33	2213	953	1	1112	0	59.2	50	0
15134	33	2181	953	1	1112	0	62.8	50	0
15135	33	2182	953	1	1112	0	62.9	50	0
15136	33	2358	953	1	1112	0	61.1	25	0
15137	33	2166	953	1	1113	0	64.5	25	0
15138	33	2169	953	1	1113	0	58.1	25	0
15139	33	2134	953	1	1113	0	74.8	25	0
15140	33	2174	953	1	1113	0	68	25	0
15141	33	2143	953	1	1113	0	60.8	25	0
15142	33	2213	953	1	1113	0	57.8	25	0
15143	33	2182	953	1	1113	0	63.1	25	0
15144	33	2158	954	1	1111	132.3	93.9	22	3
15145	33	2143	954	1	1111	68.9	56.9	18	7
15146	34	2556	955	1	1114	158.8	128.2	45	5
15147	34	2180	955	1	1114	68.5	56.7	40	10
15148	34	2557	955	1	1114	69.4	56.7	60	15
15149	34	2558	955	1	1114	68.9	57.1	60	40
15150	34	2556	955	1	1115	0	63.5	25	0
15151	34	2180	955	1	1115	0	58.9	50	0
15152	34	2557	955	1	1115	0	63.4	25	0
15153	34	2558	955	1	1115	0	63.8	25	0
15154	34	2557	956	1	1114	70.4	58.1	15	10
15155	35	2190	957	1	1116	82.6	68.3	15	5
15156	35	2191	957	1	1116	136.3	121.5	15	5
15157	35	2166	957	1	1116	136	99.7	23	15
15158	35	2339	957	1	1116	129.9	92.3	15	5
15159	35	2134	957	1	1116	159.6	109.6	22	3
15160	35	2342	957	1	1116	113.3	71.4	27	11
15161	35	2559	957	1	1116	123.1	80.9	12	12
15162	35	2560	957	1	1116	130.9	87	23	17
15163	35	2546	957	1	1116	128.6	89.7	15	5
15164	35	2171	957	1	1116	135.3	99	23	17
15165	35	2172	957	1	1116	77.9	66.4	15	5
15166	35	2173	957	1	1116	126.7	94.3	15	5
15167	35	2495	957	1	1116	103.7	70.4	23	17
15168	35	2176	957	1	1116	110.3	71.5	15	5
15169	35	2437	957	1	1116	77.9	66	12	12
15170	35	2561	957	1	1116	86	71.5	12	12
15171	35	2562	957	1	1116	98.7	70.6	10	10
15172	35	2160	957	1	1116	91.6	72.5	12	12
15173	35	2161	957	1	1116	78	64.4	12	12
15174	35	2181	957	1	1116	136.4	82	23	15
15175	35	2182	957	1	1116	127	98.4	12	12
15176	35	2223	957	1	1116	93.2	64.2	15	5
15177	35	2190	957	1	1117	0	68.1	20	0
15178	35	2191	957	1	1117	0	103.4	20	0
15179	35	2166	957	1	1117	0	79.3	38	0
15180	35	2339	957	1	1117	0	77.8	20	0
15181	35	2134	957	1	1117	0	91.8	25	0
15182	35	2342	957	1	1117	0	72.8	35	0
15183	35	2559	957	1	1117	0	74.2	25	0
15184	35	2560	957	1	1117	0	78.1	40	0
15185	35	2546	957	1	1117	0	75.1	20	0
15186	35	2171	957	1	1117	0	76.7	40	0
15187	35	2172	957	1	1117	0	69.1	20	0
15188	35	2173	957	1	1117	0	74.9	20	0
15189	35	2495	957	1	1117	0	70.3	40	0
15190	35	2176	957	1	1117	0	70.6	20	0
15191	35	2437	957	1	1117	0	68.1	20	0
15192	35	2561	957	1	1117	0	70.7	25	0
15193	35	2160	957	1	1117	0	68.7	20	0
15194	35	2161	957	1	1117	0	68.5	20	0
15195	35	2181	957	1	1117	0	73.8	35	0
15196	35	2182	957	1	1117	0	72.7	25	0
15197	35	2223	957	1	1117	0	67.1	20	0
15198	35	2166	958	1	1116	93.8	66.3	7	5
15199	35	2134	958	1	1116	147	83.4	13	2
15200	35	2342	958	1	1116	70	61.7	8	4
15201	35	2559	958	1	1116	71.3	62.5	8	8
15202	35	2560	958	1	1116	75.6	64	12	8
15203	35	2171	958	1	1116	81.2	63.9	12	8
15204	35	2495	958	1	1116	69.5	59.8	12	8
15205	35	2437	958	1	1116	70.4	59.8	8	8
15206	35	2561	958	1	1116	68	56.7	8	8
15207	35	2160	958	1	1116	0	56.7	8	8
15208	35	2161	958	1	1116	71.5	57.5	8	8
15209	35	2181	958	1	1116	100.9	66.6	7	5
15210	35	2182	958	1	1116	70.2	58.8	8	8
15211	35	2166	958	1	1117	0	69.6	12	0
15212	35	2134	958	1	1117	0	75.9	15	0
15213	35	2342	958	1	1117	0	65.2	15	0
15214	35	2559	958	1	1117	0	66.4	15	0
15215	35	2560	958	1	1117	0	69.4	20	0
15216	35	2171	958	1	1117	0	68.6	20	0
15217	35	2495	958	1	1117	0	62.4	20	0
15218	35	2561	958	1	1117	0	63.6	15	0
15219	35	2181	958	1	1117	0	68.9	15	0
15220	35	2182	958	1	1117	0	68.4	15	0
15221	36	2017	959	1	1118	134.1	120.4	55	23
15222	36	2563	959	1	1118	130.9	0	0	1
15223	36	2564	959	1	1118	93.4	0	0	1
15224	36	2018	959	1	1118	139.3	114.8	52	17
15225	36	2565	959	1	1118	131.9	0	0	1
15226	36	2037	959	1	1118	154	142.4	15	7
15227	36	2566	959	1	1118	147.5	0	0	3
15228	36	2019	959	1	1118	102.3	71.7	40	19
15229	36	2567	959	1	1118	100.8	0	0	1
15230	36	2020	959	1	1118	106.8	71.4	55	18
15231	36	2568	959	1	1118	0	0	0	2
15232	36	2021	959	1	1118	168.1	156.5	10	7
15233	36	2022	959	1	1118	157.3	125.6	10	7
15234	36	2023	959	1	1118	85.4	65.5	58	15
15235	36	2569	959	1	1118	68.3	0	0	8
15236	36	2570	959	1	1118	103	0	0	1
15237	36	2571	959	1	1118	0	0	0	2
15238	36	2572	959	1	1118	0	0	0	1
15239	36	2024	959	1	1118	119.7	91.8	60	20
15240	36	2027	959	1	1118	141.2	106.9	40	29
15241	36	2573	959	1	1118	100.8	0	0	2
15242	36	2574	959	1	1118	74.6	0	0	4
15243	36	2029	959	1	1118	154.2	108.5	15	6
15244	36	2575	959	1	1118	68	0	0	1
15245	36	2576	959	1	1118	75.7	0	0	3
15246	36	2030	959	1	1118	144.3	98.5	35	15
15247	36	2031	959	1	1118	140.5	121.9	50	19
15248	36	2577	959	1	1118	132.9	0	0	1
15249	36	2032	959	1	1118	140.7	92.6	38	9
15250	36	2578	959	1	1118	106.6	0	0	3
15251	36	2074	959	1	1118	148.6	138.3	15	7
15252	36	2579	959	1	1118	118.2	0	0	3
15253	36	2580	959	1	1118	113.4	77.2	35	15
15254	36	2581	959	1	1118	146.9	93	20	5
15255	36	2528	959	1	1118	131.3	81.7	20	5
15256	36	2529	959	1	1118	137	59.8	20	5
15257	36	2582	959	1	1118	111.3	65.6	20	5
15258	36	2152	959	1	1118	147.8	103.8	20	5
15259	36	2033	959	1	1118	157.4	125	55	18
15260	36	2583	959	1	1118	0	0	0	1
15261	36	2584	959	1	1118	136.2	0	0	1
15262	36	2034	959	1	1118	147.8	98.3	40	10
15263	36	2035	959	1	1118	76.7	65.5	45	30
15264	36	2013	959	1	1118	178.2	146.3	100	13
15265	36	2585	959	1	1118	108.2	0	0	2
15266	36	2586	959	1	1118	179.3	0	0	1
15267	36	2587	959	1	1118	0	0	0	1
15268	36	2588	959	1	1118	74.7	0	0	6
15269	36	2589	959	1	1118	176.2	0	0	2
13382	1	2001	894	1	1044	156.9	146.4	15	10
13383	1	2002	894	1	1044	82.3	58.7	15	10
13384	1	2003	894	1	1044	174.1	159.1	15	10
13385	1	2004	894	1	1044	144	112.6	15	10
13386	1	2005	894	1	1044	73	58.3	20	20
13387	1	2006	894	1	1044	88.2	67.3	15	10
13388	1	2007	894	1	1044	108.4	84.9	15	10
13389	1	2008	894	1	1044	162.3	151.7	15	10
13390	1	2009	894	1	1044	161.3	152.7	20	20
13391	1	2010	894	1	1044	71.8	57.3	15	10
13392	1	2011	894	1	1044	166.4	152.7	15	10
13393	1	2012	894	1	1044	76.5	57.6	15	10
13394	1	2013	894	1	1044	171.8	158	35	15
13395	1	2014	895	1	1044	141.7	118.7	15	10
13396	1	2015	895	1	1044	128.9	112	15	10
13397	1	2013	895	1	1044	160.2	146.2	15	10
13398	1	2016	895	1	1044	70.2	57.9	15	10
13399	2	2017	896	1	1045	135.4	123.8	40	10
13400	2	2018	896	1	1045	138.6	108	90	10
13401	2	2019	896	1	1045	101.2	73	55	20
13402	2	2020	896	1	1045	106	72.7	40	10
13403	2	2021	896	1	1045	172.5	164.8	25	5
13404	2	2022	896	1	1045	165.9	86.6	15	5
13405	2	2023	896	1	1045	87.4	70.3	40	10
13406	2	2024	896	1	1045	114.5	81.5	90	10
13407	2	2025	896	1	1045	96	83.9	15	10
13408	2	2026	896	1	1045	129.9	106.2	40	10
13409	2	2009	896	1	1045	162.2	149.4	15	10
13410	2	2027	896	1	1045	132.4	103.1	55	20
13411	2	2028	896	1	1045	111.1	93.4	10	15
13412	2	2029	896	1	1045	128.3	82.4	45	5
13413	2	2030	896	1	1045	134.4	87.5	40	10
13414	2	2031	896	1	1045	144.2	118.6	85	15
13415	2	2032	896	1	1045	127.6	78.9	45	5
13416	2	2033	896	1	1045	159.1	125	45	5
13417	2	2034	896	1	1045	114.9	78.2	40	10
13418	2	2035	896	1	1045	80.6	69.1	40	10
13419	2	2018	896	1	1046	0	66.6	125	0
13420	2	2021	896	1	1046	0	0	50	0
13421	2	2024	896	1	1046	0	79	125	0
13422	2	2026	896	1	1046	0	109.1	25	0
13423	2	2029	896	1	1046	0	81.9	25	0
13424	2	2030	896	1	1046	0	58.6	25	0
13425	2	2032	896	1	1046	0	79.9	50	0
13426	2	2033	896	1	1046	0	96.5	50	0
13427	2	2034	896	1	1046	0	57	25	0
13428	2	2035	896	1	1046	0	56.7	50	0
13429	2	2017	896	1	1047	0	117.8	25	0
13430	2	2018	896	1	1047	0	103.8	50	0
13431	2	2023	896	1	1047	0	64.1	25	0
13432	2	2024	896	1	1047	0	77.5	50	0
13433	2	2027	896	1	1047	0	84.1	50	0
13434	2	2031	896	1	1047	0	113.5	25	0
13435	2	2032	896	1	1047	0	71.6	25	0
13436	2	2033	896	1	1047	0	101.8	25	0
13437	2	2018	897	1	1045	108.9	81.9	20	5
13438	2	2024	897	1	1045	71.7	62.3	20	5
13439	2	2036	897	1	1045	144.2	112	45	5
13440	2	2018	897	1	1046	0	0	25	0
13441	2	2024	897	1	1046	0	70.9	25	0
13442	3	2037	898	1	1048	169.1	153.1	180	41
13443	3	2038	898	1	1048	174	0	0	2
13444	3	2039	898	1	1048	179.3	0	0	1
13445	3	2040	898	1	1048	171.7	0	0	2
13446	3	2041	898	1	1048	168.8	0	0	2
13447	3	2042	898	1	1048	181.4	0	0	2
13448	3	2043	898	1	1048	163.6	0	0	2
13449	3	2044	898	1	1048	163.6	0	0	2
13450	3	2045	898	1	1048	165.8	0	0	2
13451	3	2046	898	1	1048	173.9	0	0	4
13452	3	2047	898	1	1048	184.8	0	0	2
13453	3	2048	898	1	1048	179.4	0	0	2
13454	3	2049	898	1	1048	151	0	0	2
13455	3	2050	898	1	1048	178.1	0	0	2
13456	3	2051	898	1	1048	177.1	0	0	1
13457	3	2052	898	1	1048	162.3	0	0	1
13458	3	2053	898	1	1048	172	0	0	2
13459	3	2054	898	1	1048	163.1	0	0	2
13460	3	2055	898	1	1048	176.4	0	0	2
13461	3	2056	898	1	1048	165.7	0	0	2
13462	3	2057	898	1	1048	152.8	0	0	1
13463	3	2058	898	1	1048	175.2	0	0	1
13464	3	2059	898	1	1048	170	0	0	2
13465	3	2060	898	1	1048	177	0	0	2
13466	3	2061	898	1	1048	172	0	0	1
13467	3	2062	898	1	1048	180.4	0	0	1
13468	3	2063	898	1	1048	165.6	0	0	2
13469	3	2064	898	1	1048	178.2	0	0	2
13470	3	2065	898	1	1048	147.9	0	0	8
13471	3	2066	898	1	1048	171	0	0	2
13472	3	2067	898	1	1048	175.2	0	0	2
13473	3	2068	898	1	1048	161.5	0	0	2
13474	3	2069	898	1	1048	172.1	0	0	2
13475	3	2070	898	1	1048	166.8	0	0	2
13476	3	2071	898	1	1048	175.4	0	0	2
13477	3	2072	898	1	1048	134.4	115.4	30	15
13478	3	2073	898	1	1048	137.4	132	15	10
13479	3	2074	898	1	1048	162.4	144.7	130	21
13480	3	2075	898	1	1048	152.9	0	0	1
13481	3	2076	898	1	1048	165.7	0	0	2
13482	3	2077	898	1	1048	168.8	0	0	1
13483	3	2078	898	1	1048	162	0	0	2
13484	3	2079	898	1	1048	157.3	0	0	2
13485	3	2080	898	1	1048	154.8	0	0	2
13486	3	2081	898	1	1048	159.2	0	0	2
13487	3	2082	898	1	1048	154.8	0	0	2
13488	3	2083	898	1	1048	163.7	0	0	2
13489	3	2084	898	1	1048	167.7	0	0	1
13490	3	2085	898	1	1048	165.5	0	0	1
13491	3	2086	898	1	1048	166.7	0	0	2
13492	3	2087	898	1	1048	153	0	0	2
13493	3	2088	898	1	1048	150.7	0	0	2
13494	3	2089	898	1	1048	157.4	0	0	1
13495	3	2090	898	1	1048	160.2	0	0	2
13496	3	2091	898	1	1048	156.1	0	0	2
13497	3	2092	898	1	1048	151.7	0	0	2
13498	3	2093	898	1	1048	158.1	0	0	2
13499	3	2094	898	1	1048	156.5	0	0	2
13500	3	2095	898	1	1048	152.9	0	0	2
13501	3	2096	898	1	1048	128.7	0	0	1
13502	3	2097	898	1	1048	153.4	0	0	1
13503	3	2098	898	1	1048	152.2	0	0	2
13504	3	2099	898	1	1048	157.2	0	0	2
13505	3	2100	898	1	1048	164.4	0	0	2
13506	3	2101	898	1	1048	148.8	0	0	1
13507	3	2102	898	1	1048	148.8	0	0	2
13508	3	2103	898	1	1048	163.5	0	0	2
13509	3	2104	898	1	1048	148.6	0	0	2
13510	3	2105	898	1	1048	146.6	0	0	2
13511	3	2106	898	1	1048	162.6	0	0	1
13512	3	2107	898	1	1048	151.7	0	0	2
13513	3	2108	898	1	1048	163.2	0	0	2
13514	3	2109	898	1	1048	121.6	111.7	15	10
13515	3	2110	898	1	1048	161.7	143.5	30	15
13516	3	2111	898	1	1048	130.1	110.7	30	6
13517	3	2112	898	1	1048	133.8	0	0	1
13518	3	2113	898	1	1048	106.1	0	0	1
13519	3	2114	898	1	1048	108.2	0	0	1
13520	3	2115	898	1	1048	132.2	0	0	1
13521	3	2116	898	1	1048	111.1	0	0	1
13522	3	2117	898	1	1048	114.2	0	0	1
13523	3	2118	898	1	1048	104.9	0	0	1
13524	3	2119	898	1	1048	121.8	0	0	1
13525	3	2120	898	1	1048	96.9	0	0	1
13526	3	2121	898	1	1048	139.6	131.8	15	10
13527	3	2037	899	1	1048	137.3	117.6	60	30
13528	3	2122	899	1	1048	174.9	0	0	1
13529	3	2039	899	1	1048	146.7	0	0	1
13530	3	2046	899	1	1048	154.1	0	0	1
13531	3	2051	899	1	1048	142.6	0	0	1
13532	3	2052	899	1	1048	141.3	0	0	1
13533	3	2057	899	1	1048	111.2	0	0	1
13534	3	2058	899	1	1048	100.1	0	0	1
13535	3	2061	899	1	1048	132	0	0	1
13536	3	2062	899	1	1048	144.8	0	0	1
13537	3	2123	899	1	1048	109.1	0	0	1
13538	3	2072	899	1	1048	102.4	76.8	10	10
13539	3	2074	899	1	1048	121.4	106	46	21
13540	3	2075	899	1	1048	116.8	0	0	1
13541	3	2077	899	1	1048	133.3	0	0	1
13542	3	2084	899	1	1048	134.1	0	0	1
13543	3	2085	899	1	1048	87	0	0	1
13544	3	2089	899	1	1048	108.8	0	0	1
13545	3	2096	899	1	1048	109.1	0	0	1
13546	3	2097	899	1	1048	113.1	0	0	1
13547	3	2101	899	1	1048	116.5	0	0	1
13548	3	2106	899	1	1048	86.2	0	0	1
13549	3	2109	899	1	1048	81.1	72.8	9	5
13550	3	2110	899	1	1048	128.6	112.7	10	10
13551	3	2111	899	1	1048	74.5	69.5	10	10
13552	4	2124	900	1	1049	136.6	107.9	15	10
13553	4	2125	900	1	1049	108	69.4	20	5
13554	4	2126	900	1	1049	116.5	72.6	20	5
13555	4	2127	900	1	1049	141.6	130.1	60	15
13556	4	2128	900	1	1049	103.8	76	20	5
13557	4	2129	900	1	1049	98.6	89.7	15	10
13558	4	2130	900	1	1049	152.2	124.9	80	20
13559	4	2131	900	1	1049	122.6	88	17	8
13560	4	2132	900	1	1049	117	100.2	10	15
13561	4	2008	900	1	1049	167.6	153.8	15	10
13562	4	2133	900	1	1049	112.7	76.5	20	5
13563	4	2134	900	1	1049	143	112.7	20	5
13564	4	2135	900	1	1049	107.1	82.3	15	10
13565	4	2136	900	1	1049	115.5	77.8	40	10
13566	4	2137	900	1	1049	118.4	81.2	20	5
13567	4	2138	900	1	1049	118.7	82	20	5
13568	4	2139	900	1	1049	142.8	110.9	60	15
13569	4	2140	900	1	1049	113.5	77.7	20	5
13570	4	2141	900	1	1049	84.2	69.5	15	10
13571	4	2142	900	1	1049	74.8	65.1	15	10
13572	4	2143	900	1	1049	96.4	89.1	15	10
13573	4	2144	900	1	1049	126.5	91.9	40	10
13574	4	2145	900	1	1049	103	83.1	15	10
13575	4	2146	900	1	1049	151.4	80	20	5
13576	4	2147	900	1	1049	90.6	71.4	20	5
13577	4	2148	900	1	1049	126.3	66	23	2
13578	4	2149	900	1	1049	137.6	64.3	20	5
13579	4	2150	900	1	1049	169.2	82.9	20	5
13580	4	2151	900	1	1049	132.8	92.9	20	5
13581	4	2152	900	1	1049	164.9	105.5	20	5
13582	4	2153	900	1	1049	155.2	58.5	22	3
13583	4	2154	900	1	1049	161.5	137.2	20	5
13584	4	2155	900	1	1049	160.5	141.8	15	10
13585	4	2127	900	1	1050	0	127.5	25	0
13586	4	2130	900	1	1050	0	112.3	50	0
13587	4	2132	900	1	1050	0	75.6	25	0
13588	4	2133	900	1	1050	0	70.6	25	0
13589	4	2134	900	1	1050	0	82.2	25	0
13590	4	2137	900	1	1050	0	81.9	25	0
13591	4	2144	900	1	1050	0	86.9	25	0
13592	4	2150	900	1	1050	0	87.6	25	0
13593	4	2151	900	1	1050	0	93	25	0
13594	4	2154	900	1	1050	0	110.1	25	0
13595	4	2137	900	1	1051	0	64	50	0
13596	4	2138	900	1	1051	0	66	50	0
13597	4	2127	901	1	1049	100.6	87.2	20	5
13598	4	2131	901	1	1049	70.7	57.1	18	7
13599	4	2135	901	1	1049	76.6	59	15	10
13600	4	2139	901	1	1049	83.9	65.4	20	5
13601	4	2154	901	1	1049	94.5	69.1	20	5
13602	5	2156	902	1	1052	75.8	67.1	30	20
13603	5	2157	902	1	1052	152.2	89.7	45	5
13604	5	2158	902	1	1052	126	83.7	65	10
13605	5	2159	902	1	1052	69.5	59.7	30	20
13606	5	2134	902	1	1052	140.6	99.8	60	15
13607	5	2160	902	1	1052	81	64.1	50	25
13608	5	2161	902	1	1052	68.1	61.2	30	20
13609	5	2156	902	1	1053	0	69	25	0
13610	5	2157	902	1	1053	0	78.7	25	0
13611	5	2158	902	1	1053	0	75.6	25	0
13612	5	2159	902	1	1053	0	65.9	25	0
13613	5	2134	902	1	1053	0	83	25	0
13614	5	2160	902	1	1053	0	70.5	25	0
13615	5	2161	902	1	1053	0	65.5	25	0
13616	5	2156	902	1	1054	0	60.9	25	0
13617	5	2157	902	1	1054	0	74.8	25	0
13618	5	2158	902	1	1054	0	76.9	25	0
13619	5	2134	902	1	1054	0	85.4	25	0
13620	5	2160	902	1	1054	0	63.1	25	0
13621	5	2161	902	1	1054	0	59.9	25	0
13622	6	2162	903	1	1055	70.6	64.9	25	25
13623	6	2163	903	1	1055	102	71.6	35	15
13624	6	2164	903	1	1055	70.2	63	15	10
13625	6	2158	903	1	1055	136.3	87.4	45	5
13626	6	2165	903	1	1055	82.1	0	15	10
13627	6	2166	903	1	1055	88.3	70.5	15	10
13628	6	2167	903	1	1055	71.5	60.9	35	15
13629	6	2168	903	1	1055	75	66.1	15	10
13630	6	2169	903	1	1055	69.4	62.8	15	10
13631	6	2170	903	1	1055	68.5	61.1	15	10
13632	6	2134	903	1	1055	135.3	102.1	20	5
13633	6	2171	903	1	1055	104	74.2	20	5
13634	6	2172	903	1	1055	68.6	61.2	15	10
13635	6	2173	903	1	1055	68.4	63	15	10
13636	6	2174	903	1	1055	135.5	83.9	20	5
13637	6	2175	903	1	1055	68.1	58.9	15	10
13638	6	2176	903	1	1055	69.1	62.2	15	10
13639	6	2177	903	1	1055	73.5	60.8	40	10
13640	6	2142	903	1	1055	69.5	60.6	15	10
13641	6	2178	903	1	1055	68.1	62.1	15	10
13642	6	2179	903	1	1055	82.3	69.1	15	10
13643	6	2180	903	1	1055	0	56.8	25	0
13644	6	2181	903	1	1055	68.1	62	15	10
13645	6	2182	903	1	1055	69.3	62.9	15	10
13646	6	2183	903	1	1055	102.2	70.7	35	15
13647	6	2184	903	1	1055	77.7	65.1	30	20
13648	6	2185	903	1	1055	70.4	61.9	15	10
13649	6	2186	903	1	1055	96.4	77.9	15	10
13650	6	2187	903	1	1055	77.9	67.6	10	15
13651	6	2162	903	1	1056	0	67.5	25	0
13652	6	2163	903	1	1056	0	71.7	25	0
13653	6	2158	903	1	1056	0	79	25	0
13654	6	2166	903	1	1056	0	69.1	25	0
13655	6	2167	903	1	1056	0	65.2	25	0
13656	6	2168	903	1	1056	0	65.2	25	0
13657	6	2169	903	1	1056	0	63.4	25	0
13658	6	2170	903	1	1056	0	63.2	25	0
13659	6	2134	903	1	1056	0	84.4	25	0
13660	6	2171	903	1	1056	0	71.6	25	0
13661	6	2172	903	1	1056	0	62.3	25	0
13662	6	2173	903	1	1056	0	66.4	25	0
13663	6	2174	903	1	1056	0	78.2	25	0
13664	6	2175	903	1	1056	0	66	25	0
13665	6	2176	903	1	1056	0	64	25	0
13666	6	2177	903	1	1056	0	63	25	0
13667	6	2142	903	1	1056	0	62	25	0
13668	6	2178	903	1	1056	0	62.1	25	0
13669	6	2179	903	1	1056	0	66.6	25	0
13670	6	2181	903	1	1056	0	65.1	25	0
13671	6	2182	903	1	1056	0	65.5	25	0
13672	6	2188	903	1	1056	0	71.5	25	0
13673	6	2184	903	1	1056	0	67.1	25	0
13674	6	2185	903	1	1056	0	64.2	25	0
13675	6	2186	903	1	1056	0	70.5	25	0
13676	6	2187	903	1	1056	0	66.1	25	0
13677	6	2134	904	1	1055	130.4	97.2	20	5
13678	6	2171	904	1	1055	74.9	59.8	20	5
13679	6	2134	904	1	1056	0	80	25	0
13680	6	2171	904	1	1056	0	68.3	25	0
13681	7	2189	905	1	1057	89.5	67.2	40	10
13682	7	2190	905	1	1057	104.9	73.7	35	15
13683	7	2191	905	1	1057	122.9	94.6	40	10
13684	7	2192	905	1	1057	96.1	64.3	20	5
13685	7	2193	905	1	1057	111.6	75.9	20	5
13686	7	2194	905	1	1057	68.1	57.1	20	5
13687	7	2195	905	1	1057	121.3	99.6	35	15
13688	7	2129	905	1	1057	88.4	74.7	20	5
13689	7	2196	905	1	1057	69.2	59	20	5
13690	7	2197	905	1	1057	68	57.9	55	45
13691	7	2198	905	1	1057	107	72.2	20	5
13692	7	2199	905	1	1057	120.5	85.2	20	5
13693	7	2200	905	1	1057	112	69.7	20	5
13694	7	2201	905	1	1057	90.8	67.6	20	5
13695	7	2202	905	1	1057	87.3	64.2	55	20
13696	7	2203	905	1	1057	97.6	72.3	20	5
13697	7	2204	905	1	1057	0	0	0	2
13698	7	2205	905	1	1057	91.5	67.1	40	8
13699	7	2206	905	1	1057	75.7	60.7	70	30
13700	7	2207	905	1	1057	104.9	80	20	5
13701	7	2208	905	1	1057	70.5	60.8	20	5
13702	7	2209	905	1	1057	68.3	58.7	20	5
13703	7	2210	905	1	1057	0	59.3	20	5
13704	7	2211	905	1	1057	102.7	79.6	35	15
13705	7	2212	905	1	1057	68.5	59.7	35	15
13706	7	2213	905	1	1057	71.4	60.2	35	15
13707	7	2214	905	1	1057	123.1	74.9	20	5
13708	7	2215	905	1	1057	90.4	72.5	20	5
13709	7	2216	905	1	1057	69.1	56.7	35	15
13710	7	2217	905	1	1057	68.2	59.2	20	5
13711	7	2218	905	1	1057	70.5	61.9	20	5
13712	7	2219	905	1	1057	86.1	60	20	5
13713	7	2220	905	1	1057	128.8	103.7	35	15
13714	7	2221	905	1	1057	116.4	91.1	20	5
13715	7	2222	905	1	1057	161.4	143.7	20	5
13716	7	2223	905	1	1057	85	66.3	20	5
13717	7	2224	905	1	1057	70.5	56.9	20	5
13718	7	2225	905	1	1057	71.2	57.7	20	5
13719	7	2189	905	1	1058	0	78.8	25	0
13720	7	2190	905	1	1058	0	71.1	50	0
13721	7	2191	905	1	1058	0	97.5	25	0
13722	7	2192	905	1	1058	0	60	50	0
13723	7	2193	905	1	1058	0	66.3	50	0
13724	7	2195	905	1	1058	0	82.6	25	0
13725	7	2129	905	1	1058	0	66.5	50	0
13726	7	2196	905	1	1058	0	64.3	25	0
13727	7	2197	905	1	1058	0	69.2	25	0
13728	7	2198	905	1	1058	0	65.1	50	0
13729	7	2200	905	1	1058	0	66.4	25	0
13730	7	2201	905	1	1058	0	61.9	50	0
13731	7	2202	905	1	1058	0	67.1	50	0
13732	7	2205	905	1	1058	0	70.5	25	0
13733	7	2206	905	1	1058	0	64.3	50	0
13734	7	2209	905	1	1058	0	63.9	25	0
13735	7	2210	905	1	1058	0	64.9	25	0
13736	7	2211	905	1	1058	0	70.1	25	0
13737	7	2212	905	1	1058	0	66.4	25	0
13738	7	2213	905	1	1058	0	62.1	50	0
13739	7	2214	905	1	1058	0	66.4	50	0
13740	7	2215	905	1	1058	0	66.3	25	0
13741	7	2216	905	1	1058	0	64.9	25	0
13742	7	2217	905	1	1058	0	64	25	0
13743	7	2218	905	1	1058	0	62.8	25	0
13744	7	2220	905	1	1058	0	101.9	25	0
13745	7	2221	905	1	1058	0	75.6	25	0
13746	7	2224	905	1	1058	0	62.7	25	0
13747	8	2017	906	1	1059	135.3	124.8	50	21
13748	8	2226	906	1	1059	146.9	0	0	1
13749	8	2227	906	1	1059	124.6	0	0	3
13750	8	2018	906	1	1059	140.6	120.5	50	23
13751	8	2228	906	1	1059	147.2	0	0	1
13752	8	2229	906	1	1059	127.1	0	0	1
13753	8	2230	906	1	1059	90.7	65.9	90	29
13754	8	2231	906	1	1059	0	0	0	1
13755	8	2019	906	1	1059	97.7	70.4	40	32
13756	8	2232	906	1	1059	85	0	0	2
13757	8	2233	906	1	1059	80.9	0	0	1
13758	8	2020	906	1	1059	97.1	72.3	40	35
13759	8	2021	906	1	1059	165.9	139.8	30	20
13760	8	2022	906	1	1059	126	91.9	15	10
13761	8	2023	906	1	1059	79	65.1	40	32
13762	8	2234	906	1	1059	69.3	0	0	2
13763	8	2235	906	1	1059	87.1	0	0	1
13764	8	2024	906	1	1059	120	97.6	30	20
13765	8	2025	906	1	1059	112.6	91.5	30	20
13766	8	2026	906	1	1059	120.8	85.8	35	15
13767	8	2009	906	1	1059	166.5	151.6	25	25
13768	8	2027	906	1	1059	144.9	106.3	40	32
13769	8	2236	906	1	1059	139.4	0	0	1
13770	8	2237	906	1	1059	147.7	0	0	1
13771	8	2238	906	1	1059	108.1	0	0	1
13772	8	2029	906	1	1059	146.9	109.5	35	13
13773	8	2239	906	1	1059	181.6	0	0	1
13774	8	2240	906	1	1059	161.4	0	0	1
13775	8	2030	906	1	1059	100.1	66	30	20
13776	8	2031	906	1	1059	140.5	122.3	45	26
13777	8	2241	906	1	1059	132.4	0	0	2
13778	8	2242	906	1	1059	140.5	0	0	1
13779	8	2243	906	1	1059	134.3	0	0	1
13780	8	2032	906	1	1059	129	93.5	30	17
13781	8	2244	906	1	1059	73.7	0	0	1
13782	8	2245	906	1	1059	118.5	0	0	2
13783	8	2033	906	1	1059	158.4	128.2	30	19
13784	8	2246	906	1	1059	134.7	0	0	1
13785	8	2034	906	1	1059	153.6	124.4	30	20
13786	8	2035	906	1	1059	78.7	67.1	30	20
13787	8	2013	906	1	1059	173.9	160.2	75	45
13788	8	2247	906	1	1059	176.2	0	0	1
13789	8	2248	906	1	1059	174.1	0	0	3
13790	8	2249	906	1	1059	163.2	0	0	1
13791	8	2018	906	1	1060	0	69.5	75	0
13792	8	2021	906	1	1060	0	0	25	0
13793	8	2024	906	1	1060	0	84.5	75	0
13794	8	2030	906	1	1060	0	88.6	50	0
13795	8	2032	906	1	1060	0	85.4	25	0
13796	8	2034	906	1	1060	0	0	25	0
13797	8	2035	906	1	1060	0	61.8	25	0
13798	8	2018	906	1	1061	0	108.2	50	0
13799	8	2021	906	1	1061	0	120.3	50	0
13800	8	2024	906	1	1061	0	81	50	0
13801	8	2031	906	1	1061	0	114.8	25	0
13802	8	2033	906	1	1061	0	105.7	25	0
13803	8	2017	907	1	1059	82.5	68.2	15	10
13804	8	2018	907	1	1059	93.4	80.7	15	10
13805	8	2024	907	1	1059	69.3	63.1	15	10
13806	8	2036	907	1	1059	142.6	118.5	65	30
13807	8	2250	907	1	1059	159.1	0	0	1
13808	8	2251	907	1	1059	132.1	0	0	3
13809	8	2252	907	1	1059	122.4	0	0	1
13810	8	2013	907	1	1059	151.6	130.5	30	20
13811	8	2018	907	1	1060	0	62.9	25	0
13812	8	2021	907	1	1060	0	0	25	0
13813	8	2024	907	1	1060	0	71.5	25	0
13814	9	2037	908	1	1062	167.3	146.6	240	53
13815	9	2253	908	1	1062	176.4	0	0	2
13816	9	2254	908	1	1062	178.3	0	0	2
13817	9	2255	908	1	1062	168.8	0	0	3
13818	9	2256	908	1	1062	114.4	0	0	2
13819	9	2257	908	1	1062	177.3	0	0	3
13820	9	2258	908	1	1062	161.3	0	0	3
13821	9	2259	908	1	1062	175.2	0	0	2
13822	9	2260	908	1	1062	171.6	0	0	3
13823	9	2261	908	1	1062	145.9	0	0	3
13824	9	2262	908	1	1062	151.8	0	0	3
13825	9	2263	908	1	1062	141.2	0	0	3
13826	9	2264	908	1	1062	161.6	0	0	3
13827	9	2265	908	1	1062	162.4	0	0	3
13828	9	2266	908	1	1062	165.9	0	0	2
13829	9	2267	908	1	1062	165.7	0	0	3
13830	9	2268	908	1	1062	173.1	0	0	3
13831	9	2269	908	1	1062	174.1	0	0	3
13832	9	2270	908	1	1062	165.4	0	0	3
13833	9	2271	908	1	1062	174	0	0	3
13834	9	2272	908	1	1062	166.5	0	0	3
13835	9	2273	908	1	1062	152.1	0	0	2
13836	9	2072	908	1	1062	138	114.8	30	7
13837	9	2073	908	1	1062	140.7	135	11	4
13838	9	2074	908	1	1062	159.4	142.5	102	24
13839	9	2274	908	1	1062	165.6	0	0	1
13840	9	2275	908	1	1062	156.4	0	0	2
13841	9	2276	908	1	1062	162.4	0	0	2
13842	9	2277	908	1	1062	163.6	0	0	2
13843	9	2278	908	1	1062	156.1	0	0	1
13844	9	2279	908	1	1062	154	0	0	2
13845	9	2280	908	1	1062	147.9	0	0	2
13846	9	2281	908	1	1062	159.1	0	0	2
13847	9	2282	908	1	1062	159.5	0	0	2
13848	9	2283	908	1	1062	165.5	0	0	2
13849	9	2284	908	1	1062	165.5	0	0	2
13850	9	2285	908	1	1062	153.8	0	0	2
13851	9	2286	908	1	1062	160.2	0	0	2
13852	9	2110	908	1	1062	155.9	142.3	60	40
15270	36	2018	959	1	1119	0	67.4	75	0
15271	36	2335	959	1	1119	0	59.1	50	0
15272	36	2021	959	1	1119	0	62.9	75	0
15273	36	2024	959	1	1119	0	82.8	125	0
15274	36	2029	959	1	1119	0	89.7	25	0
15275	36	2030	959	1	1119	0	82.9	25	0
15276	36	2032	959	1	1119	0	78	75	0
15277	36	2033	959	1	1119	0	108.1	25	0
15278	36	2034	959	1	1119	0	70	25	0
15414	42	2324	968	1	1130	120.5	100.5	5	5
15415	42	2460	968	1	1130	131.4	120.2	25	25
15416	42	2615	968	1	1130	111.1	73	10	5
15417	42	2613	968	1	1131	0	59	25	0
15418	42	2614	968	1	1131	0	88.6	25	0
15419	43	2310	969	1	1132	124.6	107.6	20	15
15420	43	2001	969	1	1132	176.2	157.8	40	15
15421	43	2002	969	1	1132	138.7	82.3	20	7
15422	43	2003	969	1	1132	183.5	168.6	110	50
15423	43	2616	969	1	1132	166.6	146.6	11	7
15424	43	2004	969	1	1132	173	155.8	30	10
15425	43	2005	969	1	1132	111.1	57.3	70	35
15426	43	2617	969	1	1132	164.4	136.6	20	10
15427	43	2006	969	1	1132	167.6	137.7	40	15
15428	43	2007	969	1	1132	167.7	142.2	40	15
15429	43	2618	969	1	1132	157.4	132.5	15	10
15430	43	2326	969	1	1132	175.3	164.9	15	10
15431	43	2147	969	1	1132	99.7	76.6	20	5
15432	43	2619	969	1	1132	167.5	148.5	40	20
15433	43	2010	969	1	1132	100.4	70.2	20	7
15434	43	2011	969	1	1132	173.2	159	60	30
15435	43	2620	969	1	1132	162.3	136.7	30	15
15436	43	2012	969	1	1132	85.2	57	40	20
15437	43	2621	969	1	1132	162.3	142	11	7
15438	43	2467	969	1	1132	186.8	173	20	3
15439	43	2013	969	1	1132	174	159.1	660	285
15440	43	2310	969	1	1133	0	78	30	0
15441	43	2618	969	1	1133	0	98.1	30	0
15442	43	2002	969	1	1134	0	57.7	85	0
15443	43	2003	969	1	1134	0	148.4	105	0
15444	43	2616	969	1	1134	0	95.9	85	0
15445	43	2004	969	1	1134	0	106.2	85	0
15446	43	2005	969	1	1134	0	58.6	85	0
15447	43	2006	969	1	1134	0	93.1	85	0
15448	43	2007	969	1	1134	0	94.2	85	0
15449	43	2011	969	1	1134	0	136.9	105	0
15450	43	2013	969	1	1134	0	144.2	190	0
15451	43	2310	970	1	1132	101.7	72.1	10	10
15452	43	2002	970	1	1132	73.4	0	10	3
15453	43	2003	970	1	1132	173	156	50	20
15454	43	2616	970	1	1132	148.6	110.4	9	3
15455	43	2004	970	1	1132	161.2	145.5	10	5
15456	43	2005	970	1	1132	94.8	57.7	30	15
15457	43	2014	970	1	1132	155.9	122.7	60	25
15458	43	2617	970	1	1132	136.7	92.5	10	5
15459	43	2006	970	1	1132	148.4	119.7	10	10
15460	43	2007	970	1	1132	147.5	121.7	10	10
15461	43	2618	970	1	1132	132.2	78.4	20	5
15462	43	2036	970	1	1132	147.8	126	60	30
15463	43	2010	970	1	1132	0	61.2	10	3
15464	43	2011	970	1	1132	167.9	153.8	20	10
15465	43	2620	970	1	1132	133.8	97.8	10	5
15466	43	2012	970	1	1132	70.2	65.1	20	10
15467	43	2621	970	1	1132	124.7	91.8	9	3
15468	43	2467	970	1	1132	160.9	132.2	10	2
15469	43	2013	970	1	1132	157.9	141.1	330	150
15470	43	2310	970	1	1133	0	61.6	20	0
15471	43	2618	970	1	1133	0	62.8	20	0
15472	43	2002	970	1	1134	0	83.4	15	0
15473	43	2003	970	1	1134	0	135.8	45	0
15474	43	2616	970	1	1134	0	63.5	15	0
15475	43	2004	970	1	1134	0	85.3	15	0
15476	43	2005	970	1	1134	0	64.6	15	0
15477	43	2014	970	1	1134	0	88.3	200	0
15478	43	2006	970	1	1134	0	58	15	0
15479	43	2007	970	1	1134	0	59.3	15	0
15480	43	2011	970	1	1134	0	125	45	0
15481	43	2013	970	1	1134	0	129.6	60	0
15482	44	2622	971	1	1135	106.3	90.1	14	30
15483	44	2623	971	1	1135	78.9	71.6	14	25
15484	44	2148	971	1	1135	136.5	105.1	21	10
15485	44	2624	971	1	1135	139.7	123	4	2
15486	44	2149	971	1	1135	93.9	61.1	7	4
15487	44	2625	971	1	1135	170.3	66.1	24	6
15488	44	2626	971	1	1135	133	66.6	6	3
15489	44	2150	971	1	1135	141	108.6	28	15
15490	44	2627	971	1	1135	165.9	73.5	6	3
15491	44	2327	971	1	1135	122.2	61.8	14	8
15492	44	2328	971	1	1135	129.7	98.6	8	4
15493	44	2628	971	1	1135	176.9	173.6	6	3
15494	44	2629	971	1	1135	0	0	4	2
15495	44	2151	971	1	1135	114.2	61.9	45	22
15496	44	2630	971	1	1135	96.5	74.2	17	8
15497	44	2631	971	1	1135	126	0	4	2
15498	44	2632	971	1	1135	167	74.1	7	3
15499	44	2633	971	1	1135	0	0	4	3
15500	44	2634	971	1	1135	173.6	115.1	4	2
15501	44	2152	971	1	1135	91.5	58.3	27	14
15502	44	2635	971	1	1135	106.5	73.3	8	4
15503	44	2636	971	1	1135	173.6	122.2	10	4
15504	44	2601	971	1	1135	167	66.5	14	6
15505	44	2637	971	1	1135	96.7	78.7	6	3
15506	44	2638	971	1	1135	168.2	126.3	5	2
15507	44	2329	971	1	1135	81.7	0	7	5
15508	44	2639	971	1	1135	89.6	0	6	3
15509	44	2640	971	1	1135	102.3	67.8	10	4
15510	44	2641	971	1	1135	78.7	64.7	5	5
15511	44	2642	971	1	1135	0	0	4	2
15512	44	2643	971	1	1135	132.2	121.2	5	3
15513	44	2644	971	1	1135	81.5	0	6	3
15514	44	2607	971	1	1135	129.1	58.4	11	4
15515	44	2608	971	1	1135	165.9	83.2	11	7
15516	44	2645	971	1	1135	82.3	80.1	4	2
15517	44	2646	971	1	1135	0	0	6	3
15518	44	2647	971	1	1135	86.2	78.6	4	2
15519	44	2648	971	1	1135	116.3	79	10	5
15520	44	2153	971	1	1135	162.6	58.2	9	3
15521	44	2649	971	1	1135	88.9	0	6	3
15522	44	2650	971	1	1135	0	0	2	0
15523	44	2651	971	1	1135	0	90.4	1	0
15524	44	2652	971	1	1135	0	0	0	1
15525	44	2653	971	1	1135	0	0	1	0
15526	44	2654	971	1	1135	101.5	86.9	5	2
15527	44	2655	971	1	1135	0	0	2	1
15528	44	2656	971	1	1135	0	167	1	0
15529	44	2657	971	1	1135	0	134.6	2	0
15530	44	2658	971	1	1135	100.7	74.6	1	1
15531	44	2659	971	1	1135	87.7	0	0	1
15532	44	2660	971	1	1135	0	165.9	1	0
15533	44	2661	971	1	1135	0	139	1	0
15534	44	2662	971	1	1135	85.8	77.8	1	1
15535	44	2663	971	1	1135	0	173.6	1	0
15536	44	2664	971	1	1135	0	96.9	1	0
15537	44	2665	971	1	1135	171.4	78.1	2	1
15538	44	2330	971	1	1135	103	63.2	20	6
15539	44	2609	971	1	1135	143.2	91.7	10	4
15540	44	2148	971	1	1136	0	59.6	20	0
15541	44	2624	971	1	1136	0	118.1	6	0
15542	44	2149	971	1	1136	0	62.4	8	0
15543	44	2625	971	1	1136	0	70.2	20	0
15544	44	2626	971	1	1136	0	83.9	9	0
15545	44	2150	971	1	1136	0	124.6	20	0
15546	44	2627	971	1	1136	0	88.9	12	0
15547	44	2327	971	1	1136	0	70.5	20	0
15548	44	2328	971	1	1136	0	80.5	12	0
15549	44	2628	971	1	1136	0	72	15	0
15550	44	2629	971	1	1136	0	0	6	0
15551	44	2151	971	1	1136	0	63.3	35	0
15552	44	2630	971	1	1136	0	60.8	14	0
15553	44	2632	971	1	1136	0	168.1	8	0
15554	44	2634	971	1	1136	0	172.5	7	0
15555	44	2152	971	1	1136	0	63.6	30	0
15556	44	2635	971	1	1136	0	67.2	20	0
15557	44	2601	971	1	1136	0	111.2	20	0
15558	44	2637	971	1	1136	0	85.3	8	0
15559	44	2638	971	1	1136	0	98.2	8	0
15560	44	2329	971	1	1136	0	73.5	8	0
15561	44	2639	971	1	1136	0	0	8	0
15562	44	2640	971	1	1136	0	165.9	8	0
15563	44	2641	971	1	1136	0	81.2	6	0
15564	44	2642	971	1	1136	0	167.2	5	0
15565	44	2643	971	1	1136	0	128.7	7	0
15566	44	2607	971	1	1136	0	70.6	10	0
15567	44	2608	971	1	1136	0	76	8	0
15568	44	2645	971	1	1136	0	66.4	6	0
15569	44	2646	971	1	1136	0	75.8	6	0
15570	44	2647	971	1	1136	0	69.6	8	0
15571	44	2648	971	1	1136	0	78.8	8	0
15572	44	2153	971	1	1136	0	65.4	8	0
15573	44	2649	971	1	1136	0	64.2	8	0
15574	44	2330	971	1	1136	0	62.9	20	0
15575	44	2609	971	1	1136	0	135.2	8	0
15576	44	2622	972	1	1135	117.2	91.7	6	10
15577	44	2623	972	1	1135	77.3	69.4	8	15
15578	44	2148	972	1	1135	136.4	0	10	8
15579	44	2624	972	1	1135	114.5	82.4	4	2
15580	44	2149	972	1	1135	111.4	62.2	6	3
15581	44	2626	972	1	1135	143.6	89.8	4	2
15582	44	2150	972	1	1135	119.2	84.3	14	8
15583	44	2627	972	1	1135	0	0	6	3
15584	44	2327	972	1	1135	111	76.1	8	5
15585	44	2328	972	1	1135	105.6	71	5	3
15586	44	2628	972	1	1135	175.8	57.9	6	3
15587	44	2629	972	1	1135	131	0	3	1
15588	44	2151	972	1	1135	114.3	90.9	15	11
15589	44	2630	972	1	1135	116	0	10	6
15590	44	2631	972	1	1135	181.3	0	3	1
15591	44	2632	972	1	1135	157.7	93.7	3	2
15592	44	2633	972	1	1135	0	0	2	1
15593	44	2634	972	1	1135	116.2	94.1	3	1
15594	44	2635	972	1	1135	102.2	96.1	6	2
15595	44	2636	972	1	1135	167	93.6	4	2
15596	44	2601	972	1	1135	114.6	83.2	6	4
15597	44	2637	972	1	1135	112.2	0	4	2
15598	44	2638	972	1	1135	0	0	2	1
15599	44	2329	972	1	1135	89.7	0	6	4
15600	44	2639	972	1	1135	107.3	0	4	2
15601	44	2640	972	1	1135	142.8	78.3	4	2
15602	44	2641	972	1	1135	77.5	62.6	3	2
15603	44	2642	972	1	1135	0	0	3	1
15604	44	2643	972	1	1135	174.7	0	5	2
15605	44	2644	972	1	1135	179.1	174.7	4	2
15606	44	2607	972	1	1135	172.5	75.1	6	4
15607	44	2608	972	1	1135	100	90.4	6	4
15608	44	2645	972	1	1135	130.4	107.2	4	2
15609	44	2646	972	1	1135	0	0	4	2
15610	44	2647	972	1	1135	80.1	0	4	2
15611	44	2648	972	1	1135	110.8	104.2	6	3
15612	44	2153	972	1	1135	122.3	58.8	6	2
15613	44	2649	972	1	1135	134.6	0	4	2
15614	44	2651	972	1	1135	0	0	1	0
15615	44	2652	972	1	1135	0	0	0	1
15616	44	2653	972	1	1135	0	0	1	0
15617	44	2654	972	1	1135	136	0	2	1
15618	44	2655	972	1	1135	0	0	1	1
15619	44	2656	972	1	1135	0	107.8	1	0
15620	44	2658	972	1	1135	172.5	89.8	1	1
15621	44	2659	972	1	1135	0	0	0	1
15622	44	2660	972	1	1135	0	0	1	0
15623	44	2661	972	1	1135	0	0	1	0
15624	44	2662	972	1	1135	180.2	179.1	1	1
15625	44	2663	972	1	1135	0	0	1	0
15626	44	2664	972	1	1135	0	0	1	0
15627	44	2665	972	1	1135	0	0	1	1
15628	44	2330	972	1	1135	172.5	70.1	10	4
15629	44	2609	972	1	1135	86.7	59.8	4	2
15630	44	2148	972	1	1136	0	67.8	10	0
15631	44	2624	972	1	1136	0	0	6	0
15632	44	2149	972	1	1136	0	107.2	6	0
15633	44	2626	972	1	1136	0	91	5	0
15634	44	2150	972	1	1136	0	87.3	10	0
15635	44	2627	972	1	1136	0	122.8	8	0
15636	44	2327	972	1	1136	0	73	10	0
15637	44	2328	972	1	1136	0	87.7	8	0
15638	44	2628	972	1	1136	0	89.4	10	0
15639	44	2629	972	1	1136	0	90	4	0
15640	44	2151	972	1	1136	0	98.6	15	0
15641	44	2630	972	1	1136	0	178	6	0
15642	44	2632	972	1	1136	0	157.5	4	0
15643	44	2634	972	1	1136	0	122.2	5	0
15644	44	2635	972	1	1136	0	70.9	10	0
15645	44	2601	972	1	1136	0	89.1	5	0
15646	44	2637	972	1	1136	0	0	4	0
15647	44	2638	972	1	1136	0	139.4	5	0
15648	44	2329	972	1	1136	0	102.7	6	0
15649	44	2639	972	1	1136	0	0	4	0
15650	44	2640	972	1	1136	0	66.7	5	0
15651	44	2641	972	1	1136	0	61	4	0
15652	44	2642	972	1	1136	0	123.4	5	0
15653	44	2643	972	1	1136	0	112.5	6	0
15654	44	2607	972	1	1136	0	93.5	6	0
15655	44	2608	972	1	1136	0	77.3	6	0
15656	44	2645	972	1	1136	0	81.6	6	0
15657	44	2646	972	1	1136	0	162.5	4	0
15658	44	2647	972	1	1136	0	102.4	4	0
15659	44	2648	972	1	1136	0	112.5	6	0
15660	44	2153	972	1	1136	0	72.8	6	0
15661	44	2649	972	1	1136	0	173.7	4	0
15662	44	2330	972	1	1136	0	62.2	10	0
15663	44	2609	972	1	1136	0	103.2	7	0
15664	45	2148	973	1	1137	163.6	141.2	9	1
15665	45	2624	973	1	1137	131.9	93.4	2	1
15666	45	2149	973	1	1137	147	64.9	2	1
15667	45	2150	973	1	1137	171.4	131.1	3	1
15668	45	2327	973	1	1137	121.6	90.1	2	1
15669	45	2328	973	1	1137	0	0	2	1
15670	45	2628	973	1	1137	169.2	78.3	2	1
15671	45	2151	973	1	1137	135.5	61.6	9	1
15672	45	2152	973	1	1137	146.8	0	2	1
15673	45	2601	973	1	1137	165	132.7	3	1
15674	45	2638	973	1	1137	125.9	101.2	2	1
15675	45	2329	973	1	1137	106	63.8	3	1
15676	45	2641	973	1	1137	0	115.9	2	0
15677	45	2607	973	1	1137	119.3	105.8	2	1
15678	45	2648	973	1	1137	172.5	111.7	2	1
15679	45	2153	973	1	1137	143	94.7	2	1
15680	45	2330	973	1	1137	144.8	61.4	7	1
15681	45	2609	973	1	1137	152.3	138.1	2	1
15682	45	2148	973	1	1138	0	72.3	10	0
15683	45	2624	973	1	1138	0	64.8	6	0
15684	45	2149	973	1	1138	0	123.7	6	0
15685	45	2150	973	1	1138	0	109	4	0
15686	45	2327	973	1	1138	0	127	2	0
15687	45	2328	973	1	1138	0	86.3	4	0
15688	45	2628	973	1	1138	0	169.2	2	0
15689	45	2151	973	1	1138	0	57.3	11	0
15690	45	2152	973	1	1138	0	115.3	4	0
15691	45	2601	973	1	1138	0	132.6	5	0
15692	45	2638	973	1	1138	0	71.4	2	0
15693	45	2329	973	1	1138	0	59.4	6	0
15694	45	2641	973	1	1138	0	0	2	0
15695	45	2607	973	1	1138	0	73.9	3	0
15696	45	2648	973	1	1138	0	132	2	0
15697	45	2153	973	1	1138	0	58.2	6	0
15698	45	2330	973	1	1138	0	69	4	0
15699	45	2609	973	1	1138	0	91.4	4	0
15700	46	2499	974	1	1139	153.4	60.4	1	5
15701	46	2666	974	1	1139	157.9	122.6	16	4
15702	46	2667	974	1	1139	156.3	123.9	2	3
15703	46	2668	974	1	1139	118.5	88.4	5	3
15704	46	2669	974	1	1139	128.6	74.5	2	2
15705	46	2670	974	1	1139	136.4	82.1	4	2
15706	46	2671	974	1	1139	99.2	86.5	2	1
15707	46	2672	974	1	1139	152.3	95.9	6	3
15708	46	2673	974	1	1139	99.6	74.6	3	2
15709	46	2674	974	1	1139	150	123.4	3	2
15710	46	2675	974	1	1139	153	140.8	4	3
15711	46	2676	974	1	1139	120.1	96.1	2	3
15712	46	2677	974	1	1139	133.2	115.5	4	4
15713	46	2678	974	1	1139	116.7	75.6	4	2
15714	46	2453	974	1	1139	165.1	142.1	6	3
15715	46	2679	974	1	1139	135.6	128.9	1	3
15716	46	2680	974	1	1139	110.6	82	8	4
15717	46	2681	974	1	1139	0	0	1	1
15718	46	2030	974	1	1139	107.2	0	15	4
15719	46	2682	974	1	1139	154.6	130.4	7	1
15720	46	2683	974	1	1139	137	120.8	6	3
15721	46	2684	974	1	1139	126.5	91.9	2	1
15722	46	2324	974	1	1139	128.2	77.9	8	4
15723	46	2510	974	1	1139	170.2	68.1	3	1
15724	46	2685	974	1	1139	126.5	109.3	11	7
15725	46	2499	975	1	1139	0	0	1	1
15726	46	2666	975	1	1139	173.8	143.8	6	2
15727	46	2667	975	1	1139	103.4	0	1	1
15728	46	2668	975	1	1139	142.7	0	1	1
15729	46	2669	975	1	1139	141.2	96.1	1	1
15730	46	2670	975	1	1139	129.4	110.8	1	1
15731	46	2671	975	1	1139	141	112.6	1	1
15732	46	2672	975	1	1139	149.6	126.9	3	2
15733	46	2673	975	1	1139	164.3	147.8	2	1
15734	46	2678	975	1	1139	0	132.5	1	0
15735	46	2680	975	1	1139	139.1	118	2	2
15736	46	2030	975	1	1139	145.7	0	5	1
15737	46	2682	975	1	1139	145	107.8	3	1
15738	46	2683	975	1	1139	137.6	0	1	2
15739	46	2684	975	1	1139	0	86.1	2	0
15740	46	2324	975	1	1139	152.2	81.2	4	1
15741	46	2510	975	1	1139	0	101.4	1	0
15742	46	2685	975	1	1139	130.6	96.2	4	3
15743	47	2666	976	1	1140	102.1	0	2	1
15744	47	2686	976	1	1140	0	94.1	1	0
15745	47	2669	976	1	1140	0	91.7	1	0
15746	47	2670	976	1	1140	0	0	1	0
15747	47	2672	976	1	1140	95.1	0	1	1
15748	47	2687	976	1	1140	0	0	1	0
15749	47	2688	976	1	1140	143.5	76.1	2	1
15750	47	2677	976	1	1140	0	94.8	1	0
15751	47	2453	976	1	1140	70.4	0	2	1
15752	47	2679	976	1	1140	0	92.7	1	0
15753	47	2680	976	1	1140	126.1	59.2	1	2
15754	47	2581	976	1	1140	105.4	0	1	1
15755	47	2582	976	1	1140	0	0	1	1
15756	47	2324	976	1	1140	97.8	56.8	1	2
15757	47	2685	976	1	1140	134.7	121.3	1	2
15758	47	2666	977	1	1140	139.2	110.1	2	1
15759	47	2672	977	1	1140	0	0	1	0
15760	47	2680	977	1	1140	0	0	0	1
15761	47	2324	977	1	1140	136.7	0	1	1
15762	47	2685	977	1	1140	136.6	0	0	1
15763	48	2689	978	1	1141	154.8	96.8	10	2
15764	48	2690	978	1	1141	160.2	85.5	9	3
15765	48	2691	978	1	1141	144.3	107.1	9	3
15766	48	2666	978	1	1141	149.5	132	9	3
15767	48	2692	978	1	1141	85.4	67.5	20	5
15768	48	2693	978	1	1141	99.3	71.1	20	10
15769	48	2694	978	1	1141	0	61	10	5
15770	48	2695	978	1	1141	142	73.2	4	2
15771	48	2696	978	1	1141	160.4	99.9	4	2
15772	48	2460	978	1	1141	166.3	68.5	13	2
15773	48	2697	978	1	1141	118.6	98.1	9	3
15774	48	2698	978	1	1141	156.5	0	4	2
15775	48	2699	978	1	1141	108.1	101	6	3
15776	48	2689	978	1	1142	0	98.8	12	0
15777	48	2690	978	1	1142	0	120.4	12	0
15778	48	2691	978	1	1142	0	73.8	12	0
15779	48	2666	978	1	1142	0	104.8	15	0
15780	48	2692	978	1	1142	0	70.7	50	0
15781	48	2693	978	1	1142	0	61.7	25	0
15782	48	2460	978	1	1142	0	99.8	25	0
15783	49	2689	979	1	1143	155.8	131	22	3
15784	49	2700	979	1	1143	144.8	103.8	23	2
15785	49	2690	979	1	1143	175.9	95.2	23	2
15786	49	2691	979	1	1143	154.3	68.7	22	3
15787	49	2701	979	1	1143	137.1	68.2	8	5
15788	49	2702	979	1	1143	121.6	57.5	20	5
15789	49	2692	979	1	1143	87.9	70.4	140	35
15790	49	2318	979	1	1143	125.1	73.5	60	15
15791	49	2703	979	1	1143	106.6	70.6	45	5
15792	49	2693	979	1	1143	135.4	68.5	17	3
15793	49	2704	979	1	1143	166.4	100.6	4	1
15794	49	2694	979	1	1143	68.3	57.7	20	5
15795	49	2705	979	1	1143	161.2	68.3	14	1
15796	49	2706	979	1	1143	144.2	106.5	14	2
15797	49	2707	979	1	1143	144.8	71.2	14	2
15798	49	2696	979	1	1143	135.4	91	9	1
15799	49	2708	979	1	1143	109.8	62.3	20	5
15800	49	2709	979	1	1143	125.3	63.2	20	5
15801	49	2710	979	1	1143	137	109.2	9	3
15802	49	2711	979	1	1143	134.7	91.9	9	3
15803	49	2712	979	1	1143	130.5	96.1	5	1
15804	49	2713	979	1	1143	139.9	69.2	10	5
15805	49	2697	979	1	1143	147.8	108.8	37	3
15806	49	2699	979	1	1143	145.6	93.1	18	2
15807	49	2690	979	1	1144	0	84.1	25	0
15808	49	2691	979	1	1144	0	101	25	0
15809	49	2702	979	1	1144	0	98.7	25	0
15810	49	2692	979	1	1144	0	71.3	130	0
15811	49	2318	979	1	1144	0	74.4	50	0
15812	49	2703	979	1	1144	0	63.4	60	0
15813	49	2706	979	1	1144	0	86.5	15	0
15814	49	2696	979	1	1144	0	94.3	5	0
15815	49	2710	979	1	1144	0	123.9	13	0
15816	49	2711	979	1	1144	0	110.6	12	0
15817	49	2713	979	1	1144	0	93	25	0
15818	49	2697	979	1	1144	0	114.1	25	0
15819	49	2699	979	1	1144	0	87.4	15	0
15820	49	2692	980	1	1143	71.7	57.8	20	5
15821	49	2318	980	1	1143	77.3	56.8	20	5
15822	49	2704	980	1	1143	173.1	89.3	4	1
15823	49	2706	980	1	1143	132.1	92	9	1
15824	49	2692	980	1	1144	0	57.8	20	0
15825	50	2689	981	1	1145	125.8	94.3	5	2
15826	50	2700	981	1	1145	122.8	67.7	5	2
15827	50	2690	981	1	1145	116	90.4	5	2
15828	50	2692	981	1	1145	86.3	68.8	20	4
15829	50	2318	981	1	1145	85.3	56.8	20	4
15830	50	2693	981	1	1145	77.8	0	5	3
15831	50	2704	981	1	1145	131.1	83	5	2
15832	50	2710	981	1	1145	0	0	5	2
15833	50	2712	981	1	1145	0	0	5	2
15834	50	2697	981	1	1145	77.9	0	21	4
15835	50	2692	981	1	1146	0	70.6	20	0
15836	50	2318	981	1	1146	0	73.4	20	0
15837	50	2710	981	1	1146	0	118	10	0
15838	50	2697	981	1	1146	0	68.2	20	0
15839	51	2714	982	1	1147	155.2	96.5	7	5
15840	51	2715	982	1	1147	131.2	58.9	7	3
15841	51	2716	982	1	1147	145.5	82	35	25
15842	51	2716	982	1	1148	0	66.6	55	0
15843	51	2714	983	1	1147	167	109.8	8	5
15844	51	2716	983	1	1147	122.7	74.6	10	5
15845	51	2717	983	1	1147	163.5	66.5	7	3
15846	51	2716	983	1	1148	0	73.2	20	0
15847	52	2310	984	1	1149	136.2	87.2	32	3
15848	52	2718	984	1	1149	128.3	91.1	20	5
15849	52	2317	984	1	1149	88.4	59.3	15	10
15850	52	2719	984	1	1149	113.8	94.7	15	10
15851	52	2543	984	1	1149	120.6	73.2	15	10
15852	52	2720	984	1	1149	115.1	80.3	15	10
15853	52	2721	984	1	1149	106.2	96.4	15	10
15854	52	2722	984	1	1149	110.1	90.8	15	10
15855	52	2723	984	1	1149	102.7	83.9	15	10
15856	52	2544	984	1	1149	129.2	88.6	28	7
15857	52	2618	984	1	1149	156.7	116.7	28	7
15858	52	2724	984	1	1149	139.7	103	15	10
15859	52	2725	984	1	1149	142.8	98.3	20	5
15860	52	2144	984	1	1149	116.7	92.6	15	10
15861	52	2326	984	1	1149	176.2	163.6	15	10
15862	52	2147	984	1	1149	97	78.3	20	5
15863	52	2467	984	1	1149	181.3	172	15	10
15864	52	2310	984	1	1150	0	78	50	0
15865	52	2317	984	1	1150	0	72.9	25	0
15866	52	2719	984	1	1150	0	69.9	25	0
15867	52	2543	984	1	1150	0	70.1	25	0
15868	52	2720	984	1	1150	0	74.3	25	0
15869	52	2721	984	1	1150	0	57.2	25	0
15870	52	2722	984	1	1150	0	67.9	25	0
15871	52	2723	984	1	1150	0	77.6	25	0
15872	52	2544	984	1	1150	0	68.4	35	0
15873	52	2618	984	1	1150	0	59.6	35	0
15874	52	2724	984	1	1150	0	81.4	25	0
15875	52	2725	984	1	1150	0	73.7	25	0
15876	52	2144	984	1	1150	0	84.1	25	0
15877	52	2147	984	1	1150	0	71.5	25	0
15878	52	2467	984	1	1150	0	141.6	25	0
15879	52	2310	984	1	1151	0	60.3	20	0
15880	52	2718	984	1	1151	0	61.5	20	0
15881	52	2317	984	1	1151	0	106	20	0
15882	52	2543	984	1	1151	0	62.6	20	0
15883	52	2723	984	1	1151	0	60	20	0
15884	52	2544	984	1	1151	0	62.1	20	0
15885	52	2618	984	1	1151	0	71.3	20	0
15886	52	2144	984	1	1151	0	84.2	20	0
15887	52	2467	984	1	1151	0	147.8	20	0
15888	52	2310	985	1	1149	136.3	61.8	13	2
15889	52	2544	985	1	1149	131.5	68.4	12	3
15890	52	2618	985	1	1149	158.8	91.1	12	3
15891	52	2310	985	1	1150	0	69.1	25	0
15892	52	2544	985	1	1150	0	62.1	15	0
15893	52	2618	985	1	1150	0	73.1	15	0
15894	53	2189	986	1	1152	99.4	76.9	35	15
15895	53	2726	986	1	1152	120.4	103	10	20
15896	53	2124	986	1	1152	157.2	126	27	23
15897	53	2727	986	1	1152	161.4	117.5	20	5
15898	53	2309	986	1	1152	142.6	105	25	10
15899	53	2728	986	1	1152	95.6	71.4	15	10
15900	53	2536	986	1	1152	161.6	120.5	20	5
15901	53	2310	986	1	1152	118.1	76.6	25	5
15902	53	2157	986	1	1152	173.1	126.2	27	3
15903	53	2127	986	1	1152	139.3	124.7	85	40
15904	53	2729	986	1	1152	134.3	126.6	15	10
15905	53	2191	986	1	1152	132.7	122	35	15
15906	53	2730	986	1	1152	163.8	110.7	40	5
15907	53	2129	986	1	1152	103.9	90.5	23	7
15908	53	2731	986	1	1152	155.4	66.8	20	5
15909	53	2312	986	1	1152	141.5	86.1	20	5
15910	53	2732	986	1	1152	149.8	109.1	20	5
15911	53	2002	986	1	1152	133.1	94.6	13	7
15912	53	2003	986	1	1152	176	161.1	55	20
15913	53	2005	986	1	1152	117.6	87.9	10	15
15914	53	2130	986	1	1152	159.2	128.7	80	20
15915	53	2131	986	1	1152	133.2	77.6	120	55
15916	53	2733	986	1	1152	139.4	91.6	15	10
15917	53	2734	986	1	1152	79.9	65.3	15	10
15918	53	2435	986	1	1152	123.9	86.9	44	6
15919	53	2132	986	1	1152	127.7	85.1	30	20
15920	53	2446	986	1	1152	99.7	72.6	110	55
15921	53	2735	986	1	1152	80	60.2	15	10
15922	53	2736	986	1	1152	118.6	81.8	15	10
15923	53	2541	986	1	1152	94.8	76.4	20	10
15924	53	2315	986	1	1152	123	90	23	3
15925	53	2737	986	1	1152	0	0	0	4
15926	53	2738	986	1	1152	160.7	119.4	20	5
15927	53	2134	986	1	1152	172	132.1	40	10
15928	53	2739	986	1	1152	174.2	143.9	22	3
15929	53	2317	986	1	1152	114.6	56.8	35	15
15930	53	2543	986	1	1152	104.5	60.6	25	5
15931	53	2135	986	1	1152	101.7	71.7	80	70
15932	53	2740	986	1	1152	78	67.6	15	10
15933	53	2741	986	1	1152	140.7	103	15	10
15934	53	2742	986	1	1152	141.4	97.8	40	10
15935	53	2139	986	1	1152	157.9	122.9	107	68
15936	53	2320	986	1	1152	139.5	114.3	20	5
15937	53	2174	986	1	1152	151.9	118.9	20	5
15938	53	2547	986	1	1152	84.1	57.7	20	5
15939	53	2141	986	1	1152	97.9	69.3	30	20
15940	53	2029	986	1	1152	165.6	140.5	20	10
15941	53	2407	986	1	1152	164.5	106.3	20	5
15942	53	2321	986	1	1152	170	119.8	20	5
15943	53	2322	986	1	1152	85.1	66.3	15	10
15944	53	2743	986	1	1152	134.2	67.3	20	5
15945	53	2144	986	1	1152	129	91.7	105	25
15946	53	2145	986	1	1152	118	96.5	13	7
15947	53	2537	986	1	1152	118.4	93.9	13	7
15948	53	2744	986	1	1152	80.5	56.8	15	10
15949	53	2326	986	1	1152	185.7	170.2	40	10
15950	53	2147	986	1	1152	100.2	83.1	17	8
15951	53	2327	986	1	1152	168.1	111.1	22	3
15952	53	2152	986	1	1152	155.5	132.2	20	5
15953	53	2639	986	1	1152	167	57.8	22	3
15954	53	2608	986	1	1152	171.4	89.2	22	3
15955	53	2215	986	1	1152	151.4	109.3	20	5
15956	53	2179	986	1	1152	144.8	103.8	30	20
15957	53	2745	986	1	1152	106.2	102	15	10
15958	53	2154	986	1	1152	173.1	143.6	80	15
15959	53	2010	986	1	1152	114.3	81.9	13	2
15960	53	2011	986	1	1152	172.9	153.9	19	6
15961	53	2012	986	1	1152	94.5	75.2	10	5
15962	53	2746	986	1	1152	101.5	68.8	30	20
15963	53	2013	986	1	1152	175.1	154.8	165	25
15964	53	2747	986	1	1152	185.7	169.6	27	3
15965	53	2189	986	1	1153	0	78.9	25	0
15966	53	2309	986	1	1153	0	97.8	25	0
15967	53	2157	986	1	1153	0	93.7	30	0
15968	53	2127	986	1	1153	0	129.9	30	0
15969	53	2730	986	1	1153	0	82	25	0
15970	53	2129	986	1	1153	0	71.7	30	0
15971	53	2312	986	1	1153	0	82	25	0
15972	53	2130	986	1	1153	0	116.4	75	0
15973	53	2435	986	1	1153	0	74.7	30	0
15974	53	2132	986	1	1153	0	79.9	30	0
15975	53	2446	986	1	1153	0	67.3	55	0
15976	53	2735	986	1	1153	0	57.6	25	0
15977	53	2736	986	1	1153	0	70.6	25	0
15978	53	2541	986	1	1153	0	71	25	0
15979	53	2335	986	1	1153	0	59.8	50	0
15980	53	2315	986	1	1153	0	86.5	25	0
15981	53	2134	986	1	1153	0	95.8	50	0
15982	53	2739	986	1	1153	0	109.9	30	0
15983	53	2317	986	1	1153	0	67.1	25	0
15984	53	2543	986	1	1153	0	57	25	0
15985	53	2748	986	1	1153	0	56.7	25	0
15986	53	2029	986	1	1153	0	97.8	25	0
15987	53	2321	986	1	1153	0	73.9	50	0
15988	53	2144	986	1	1153	0	86.4	75	0
15989	53	2147	986	1	1153	0	71.5	50	0
15990	53	2327	986	1	1153	0	101.7	25	0
15991	53	2152	986	1	1153	0	145.6	25	0
15992	53	2639	986	1	1153	0	72.5	25	0
15993	53	2608	986	1	1153	0	82	25	0
15994	53	2154	986	1	1153	0	131	30	0
15995	53	2747	986	1	1153	0	153.1	25	0
15996	53	2124	986	1	1154	0	94.3	50	0
15997	53	2309	986	1	1154	0	108.9	30	0
15998	53	2127	986	1	1154	0	124.6	30	0
15999	53	2003	986	1	1154	0	146.2	30	0
16000	53	2130	986	1	1154	0	116.3	75	0
16001	53	2131	986	1	1154	0	65.3	50	0
16002	53	2132	986	1	1154	0	78.8	30	0
16003	53	2446	986	1	1154	0	64.3	50	0
16004	53	2135	986	1	1154	0	66.1	30	0
16005	53	2139	986	1	1154	0	93.5	50	0
16006	53	2154	986	1	1154	0	139.5	30	0
16007	53	2134	986	1	1155	0	72.6	50	0
16008	53	2174	986	1	1155	0	67.8	50	0
16009	53	2124	987	1	1152	125.5	65.6	18	7
16010	53	2310	987	1	1152	102.5	72.3	15	5
16011	53	2157	987	1	1152	159.8	121.1	18	2
16012	53	2127	987	1	1152	124.5	111.2	20	5
16013	53	2129	987	1	1152	72.8	61.1	17	3
16014	53	2002	987	1	1152	119.5	77.5	12	3
16015	53	2003	987	1	1152	169.6	150.6	20	5
16016	53	2005	987	1	1152	72.9	58.1	15	10
16017	53	2014	987	1	1152	152	118.5	35	15
16018	53	2131	987	1	1152	95.5	56.7	20	5
16019	53	2435	987	1	1152	76	60.2	21	4
16020	53	2132	987	1	1152	71.3	56.9	15	10
16021	53	2446	987	1	1152	68.3	56.7	20	5
16022	53	2541	987	1	1152	68.5	56.7	15	5
16023	53	2315	987	1	1152	91.9	75.6	17	3
16024	53	2134	987	1	1152	157.6	126.4	20	5
16025	53	2739	987	1	1152	168.8	133.7	18	2
16026	53	2135	987	1	1152	97.7	57.8	20	5
16027	53	2742	987	1	1152	109.4	67.6	20	5
16028	53	2139	987	1	1152	135.6	71.8	18	7
16029	53	2036	987	1	1152	146.7	118.6	100	20
16030	53	2144	987	1	1152	108.3	87.8	20	5
16031	53	2145	987	1	1152	103.1	79.2	12	3
16032	53	2537	987	1	1152	101	85.7	12	3
16033	53	2147	987	1	1152	87.4	62.3	18	7
16034	53	2327	987	1	1152	156.6	56.9	23	2
16035	53	2639	987	1	1152	144.2	59.5	13	2
16036	53	2608	987	1	1152	160.1	67.3	13	2
16037	53	2154	987	1	1152	119.5	80.5	20	5
16038	53	2011	987	1	1152	162.5	145.4	21	4
16039	53	2013	987	1	1152	164.2	148.7	35	15
16040	53	2747	987	1	1152	173.1	149.8	18	2
16041	53	2157	987	1	1153	0	94.8	20	0
16042	53	2127	987	1	1153	0	92.1	20	0
16043	53	2129	987	1	1153	0	62.7	20	0
16044	53	2435	987	1	1153	0	69.2	20	0
16045	53	2132	987	1	1153	0	56.9	20	0
16046	53	2446	987	1	1153	0	63.3	20	0
16047	53	2315	987	1	1153	0	81.1	25	0
16048	53	2739	987	1	1153	0	110.9	20	0
16049	53	2144	987	1	1153	0	87.2	25	0
16050	53	2154	987	1	1153	0	81.3	20	0
16051	53	2309	987	1	1154	0	59.8	20	0
16052	53	2127	987	1	1154	0	76.9	20	0
16053	53	2003	987	1	1154	0	139.8	20	0
16054	53	2014	987	1	1154	0	90.2	50	0
16055	53	2132	987	1	1154	0	60	20	0
16056	53	2135	987	1	1154	0	56.7	20	0
16057	53	2154	987	1	1154	0	66.4	20	0
16058	53	2134	987	1	1155	0	70.7	25	0
16059	54	2158	988	1	1156	0	79	75	0
16060	54	2749	988	1	1156	0	64.5	50	0
16061	54	2321	988	1	1156	0	65.5	50	0
16062	54	2214	988	1	1156	0	78.5	50	0
16063	54	2750	988	1	1156	0	82.2	100	0
16064	54	2158	988	1	1157	0	68.3	275	0
16065	54	2750	988	1	1157	0	68.4	225	0
16066	54	2158	989	1	1156	0	101.2	25	0
16067	54	2750	989	1	1156	0	91.3	25	0
16068	54	2158	989	1	1157	0	85	25	0
16069	54	2750	989	1	1157	0	72.8	25	0
16070	55	2751	990	1	1158	184.8	171.6	36	4
16071	55	2751	990	1	1159	0	155.6	22	0
16072	55	2751	991	1	1158	182.6	165.6	9	1
16073	56	2752	992	1	1160	162.5	145.7	10	5
16074	56	2753	992	1	1160	150.8	144.5	10	5
16075	56	2001	992	1	1160	183.5	169.7	10	5
16076	56	2754	992	1	1160	172.9	149.9	10	5
16077	56	2755	992	1	1160	161.3	156.3	10	5
16078	56	2739	992	1	1160	175.1	156.5	10	5
16079	56	2756	992	1	1160	175.1	163.3	10	5
16080	56	2757	992	1	1160	143.6	110.1	10	5
16081	56	2333	992	1	1160	172	148.9	10	5
16082	56	2758	992	1	1160	182.6	164.6	10	5
16083	56	2467	992	1	1160	187.9	178.2	10	5
16084	56	2759	992	1	1160	179.3	168	10	5
16085	56	2752	992	1	1161	0	113.6	15	0
16086	56	2753	992	1	1161	0	133.1	15	0
16087	56	2739	992	1	1161	0	126.9	15	0
16088	56	2758	992	1	1161	0	142.4	15	0
16089	56	2753	992	1	1162	0	135.5	15	0
16090	56	2754	992	1	1162	0	119.1	15	0
16091	56	2755	992	1	1162	0	141.5	15	0
16092	56	2757	992	1	1162	0	89.4	15	0
16093	56	2333	992	1	1162	0	131	15	0
16094	57	2017	993	1	1163	134.1	127	23	17
16095	57	2018	993	1	1163	150	126.2	30	5
16096	57	2760	993	1	1163	134	0	0	1
16097	57	2761	993	1	1163	122.8	0	0	4
16098	57	2762	993	1	1163	131	0	0	3
16099	57	2763	993	1	1163	136.3	0	0	3
16100	57	2764	993	1	1163	133.3	0	0	1
16101	57	2765	993	1	1163	121.6	0	0	3
16102	57	2019	993	1	1163	96.5	70.3	23	17
16103	57	2020	993	1	1163	103.2	73.9	24	6
16104	57	2021	993	1	1163	167	140.7	30	20
16105	57	2023	993	1	1163	82.9	68.6	23	17
16106	57	2024	993	1	1163	111.1	89.5	30	20
16107	57	2026	993	1	1163	129.7	94.8	35	15
16108	57	2027	993	1	1163	132.7	101	60	28
16109	57	2766	993	1	1163	135.3	0	0	1
16110	57	2767	993	1	1163	110.3	0	0	3
16111	57	2768	993	1	1163	121.6	0	0	3
16112	57	2769	993	1	1163	113.4	0	0	1
16113	57	2770	993	1	1163	111.4	0	0	4
16114	57	2030	993	1	1163	129.3	77.9	40	10
16115	57	2031	993	1	1163	142.4	120.5	70	30
16116	57	2151	993	1	1163	126.9	99	20	6
16117	57	2152	993	1	1163	154.7	120.8	20	7
16118	57	2329	993	1	1163	81.7	57.1	20	6
16119	57	2153	993	1	1163	108.5	58.1	20	6
16120	57	2033	993	1	1163	155.3	129.1	40	10
16121	57	2034	993	1	1163	127.1	86.7	20	10
16122	57	2035	993	1	1163	71.8	64	35	15
16123	57	2013	993	1	1163	170.8	141.5	40	10
16124	57	2018	993	1	1164	0	64	125	0
16125	57	2021	993	1	1164	0	57.4	100	0
16126	57	2024	993	1	1164	0	78.8	125	0
16127	57	2026	993	1	1164	0	96.9	50	0
16128	57	2030	993	1	1164	0	63.2	50	0
16129	57	2152	993	1	1164	0	99.5	25	0
16130	57	2033	993	1	1164	0	102.9	50	0
16131	57	2034	993	1	1164	0	61.1	50	0
16132	57	2035	993	1	1164	0	56.9	50	0
16133	57	2017	993	1	1165	0	114	50	0
16134	57	2019	993	1	1165	0	62.8	50	0
16135	57	2020	993	1	1165	0	68.2	25	0
16136	57	2023	993	1	1165	0	59.9	50	0
16137	57	2027	993	1	1165	0	83.1	50	0
16138	57	2017	994	1	1163	100	79.5	16	4
16139	57	2018	994	1	1163	105.3	84.9	17	8
16140	57	2019	994	1	1163	68	62	16	4
16141	57	2020	994	1	1163	75.2	59.7	16	4
16142	57	2023	994	1	1163	0	62.1	16	4
16143	57	2024	994	1	1163	80.3	67.5	17	8
16144	57	2027	994	1	1163	70.4	57	18	12
16145	57	2036	994	1	1163	138.3	115.5	60	21
16146	57	2771	994	1	1163	122.6	0	0	1
16147	57	2772	994	1	1163	109.9	0	0	3
16148	57	2773	994	1	1163	123.6	0	0	1
16149	57	2774	994	1	1163	165.5	0	0	1
16150	57	2775	994	1	1163	137.3	0	0	3
16151	57	2776	994	1	1163	101	0	0	4
16152	57	2777	994	1	1163	121.4	0	0	6
16153	57	2034	994	1	1163	115	59.3	15	5
16154	57	2018	994	1	1164	0	69.4	25	0
16155	57	2024	994	1	1164	0	75.9	25	0
16156	58	2148	995	1	1166	135.6	63.9	5	2
16157	58	2624	995	1	1166	99.2	84.9	3	2
16158	58	2625	995	1	1166	170.3	96.5	8	4
16159	58	2150	995	1	1166	169.2	130.2	8	3
16160	58	2327	995	1	1166	137.3	82.9	5	2
16161	58	2151	995	1	1166	132.6	101.2	10	5
16162	58	2152	995	1	1166	71.8	65.9	9	3
16163	58	2601	995	1	1166	133.3	85.2	5	2
16164	58	2329	995	1	1166	110.6	59.4	7	3
16165	58	2641	995	1	1166	108.6	103.6	5	2
16166	58	2607	995	1	1166	126.7	76.2	5	2
16167	58	2608	995	1	1166	171.4	96.6	7	3
16168	58	2648	995	1	1166	168.1	110.4	2	1
16169	58	2153	995	1	1166	165.9	78.7	7	4
16170	58	2330	995	1	1166	129.2	64.9	9	4
16171	58	2148	995	1	1167	0	62.1	7	0
16172	58	2624	995	1	1167	0	59.6	5	0
16173	58	2625	995	1	1167	0	124	10	0
16174	58	2150	995	1	1167	0	79	10	0
16175	58	2327	995	1	1167	0	62	10	0
16176	58	2151	995	1	1167	0	92.4	15	0
16177	58	2152	995	1	1167	0	88.3	10	0
16178	58	2601	995	1	1167	0	109.5	5	0
16179	58	2329	995	1	1167	0	57.3	10	0
16180	58	2641	995	1	1167	0	62.3	5	0
16181	58	2607	995	1	1167	0	91.6	7	0
16182	58	2608	995	1	1167	0	73.8	10	0
16183	58	2648	995	1	1167	0	82.2	6	0
16184	58	2153	995	1	1167	0	75.2	10	0
16185	58	2330	995	1	1167	0	58.4	10	0
16186	58	2148	996	1	1166	121.9	109.4	2	1
16187	58	2624	996	1	1166	88.2	0	2	1
16188	58	2150	996	1	1166	143.9	105.1	3	1
16189	58	2327	996	1	1166	128.3	0	2	1
16190	58	2151	996	1	1166	128.8	73.8	7	3
16191	58	2601	996	1	1166	0	0	2	1
16192	58	2329	996	1	1166	76.5	65.3	3	2
16193	58	2641	996	1	1166	0	0	2	1
16194	58	2607	996	1	1166	179.1	116.1	2	1
16195	58	2608	996	1	1166	172.5	99.5	3	2
16196	58	2648	996	1	1166	0	0	1	1
16197	58	2153	996	1	1166	0	0	3	1
16198	58	2330	996	1	1166	0	63.7	5	2
16199	58	2148	996	1	1167	0	98.8	3	0
16200	58	2624	996	1	1167	0	0	3	0
16201	58	2150	996	1	1167	0	100.1	5	0
16202	58	2327	996	1	1167	0	77.1	3	0
16203	58	2151	996	1	1167	0	102.2	5	0
16204	58	2601	996	1	1167	0	131.3	3	0
16205	58	2329	996	1	1167	0	62.2	5	0
16206	58	2641	996	1	1167	0	60.5	3	0
16207	58	2607	996	1	1167	0	84.8	3	0
16208	58	2608	996	1	1167	0	87.2	5	0
16209	58	2648	996	1	1167	0	0	2	0
16210	58	2153	996	1	1167	0	0	5	0
16211	58	2330	996	1	1167	0	68.3	5	0
16212	59	2189	997	1	1168	101.9	79.8	20	5
16213	59	2778	997	1	1168	133.9	116.2	20	5
16214	59	2124	997	1	1168	134.5	108	25	25
16215	59	2156	997	1	1168	74.6	63.4	30	20
16216	59	2127	997	1	1168	134.2	128.6	25	19
16217	59	2779	997	1	1168	137.2	0	0	3
16218	59	2780	997	1	1168	140.6	0	0	1
16219	59	2781	997	1	1168	140.7	0	0	1
16220	59	2782	997	1	1168	139.3	0	0	1
16221	59	2191	997	1	1168	125.6	111	20	5
16222	59	2018	997	1	1168	146.6	121.6	15	10
16223	59	2037	997	1	1168	163.7	141.9	40	4
16224	59	2783	997	1	1168	148.9	0	0	1
16225	59	2784	997	1	1168	158.2	0	0	1
16226	59	2785	997	1	1168	144.8	0	0	1
16227	59	2786	997	1	1168	162.7	0	0	1
16228	59	2787	997	1	1168	158	0	0	1
16229	59	2788	997	1	1168	148.7	0	0	1
16230	59	2337	997	1	1168	147.6	122.6	15	10
16231	59	2129	997	1	1168	98.7	83	20	5
16232	59	2002	997	1	1168	98.5	72.2	10	5
16233	59	2003	997	1	1168	178.4	151.6	65	2
16234	59	2789	997	1	1168	156.5	0	0	4
16235	59	2790	997	1	1168	162	0	0	1
16236	59	2791	997	1	1168	153.8	0	0	2
16237	59	2792	997	1	1168	150.3	0	0	1
16238	59	2005	997	1	1168	82.1	64	25	25
16239	59	2130	997	1	1168	149.7	130.7	25	13
16240	59	2793	997	1	1168	145.6	0	0	2
16241	59	2794	997	1	1168	133.1	0	0	5
16242	59	2795	997	1	1168	141.7	0	0	2
16243	59	2796	997	1	1168	138.2	0	0	2
16244	59	2797	997	1	1168	134.9	0	0	1
16245	59	2131	997	1	1168	103.8	82	25	15
16246	59	2798	997	1	1168	76.2	0	0	4
16247	59	2799	997	1	1168	84.2	0	0	2
16248	59	2800	997	1	1168	79.7	0	0	3
16249	59	2801	997	1	1168	111.4	0	0	1
16250	59	2802	997	1	1168	116.3	100.9	20	5
16251	59	2132	997	1	1168	105.7	81.7	30	15
16252	59	2803	997	1	1168	123.2	0	0	1
16253	59	2804	997	1	1168	81.2	0	0	2
16254	59	2805	997	1	1168	97.5	0	0	2
16255	59	2133	997	1	1168	102.5	77	20	5
16256	59	2134	997	1	1168	146.9	107.2	15	10
16257	59	2199	997	1	1168	69.8	60.8	20	5
16258	59	2135	997	1	1168	87	73.3	25	15
16259	59	2806	997	1	1168	83	0	0	2
16260	59	2807	997	1	1168	71.5	0	0	5
16261	59	2808	997	1	1168	71.3	0	0	2
16262	59	2809	997	1	1168	78.9	0	0	1
16263	59	2136	997	1	1168	109	84	35	12
16264	59	2810	997	1	1168	68.2	0	0	3
16265	59	2545	997	1	1168	91.8	78.2	20	5
16266	59	2024	997	1	1168	108.4	91.1	15	10
16267	59	2319	997	1	1168	116.7	77.9	20	5
16268	59	2139	997	1	1168	146.7	113.2	25	15
16269	59	2027	997	1	1168	140.1	110.2	15	5
16270	59	2811	997	1	1168	135	0	0	3
16271	59	2812	997	1	1168	116.6	0	0	1
16272	59	2813	997	1	1168	143.2	0	0	1
16273	59	2814	997	1	1168	152.1	0	0	1
16274	59	2815	997	1	1168	117.3	0	0	3
16275	59	2816	997	1	1168	118.9	0	0	3
16276	59	2817	997	1	1168	138.7	0	0	2
16277	59	2818	997	1	1168	170.2	0	0	1
16278	59	2320	997	1	1168	120.4	103.8	20	5
16279	59	2140	997	1	1168	97	70.4	20	5
16280	59	2173	997	1	1168	78.6	63.4	20	5
16281	59	2202	997	1	1168	89.7	72.6	15	10
16282	59	2321	997	1	1168	136.7	88.2	20	5
16283	59	2142	997	1	1168	78.1	63.3	20	5
16284	59	2030	997	1	1168	133.9	111.1	15	10
16285	59	2074	997	1	1168	151.7	137.5	40	4
16286	59	2819	997	1	1168	147.8	0	0	1
16287	59	2820	997	1	1168	136.9	0	0	1
16288	59	2821	997	1	1168	143.4	0	0	1
16289	59	2822	997	1	1168	143.5	0	0	1
16290	59	2823	997	1	1168	144.8	0	0	1
16291	59	2824	997	1	1168	143.2	0	0	1
16292	59	2144	997	1	1168	123.8	91.5	40	10
16293	59	2146	997	1	1168	146.9	56.7	20	5
16294	59	2825	997	1	1168	89.7	68.4	20	5
16295	59	2327	997	1	1168	83	57.4	5	5
16296	59	2151	997	1	1168	169.2	119.6	13	5
16297	59	2152	997	1	1168	145.1	112.8	20	5
16298	59	2153	997	1	1168	96.5	57	7	5
16299	59	2330	997	1	1168	105.9	61.8	5	5
16300	59	2154	997	1	1168	169	144.3	15	4
16301	59	2826	997	1	1168	155.8	0	0	1
16302	59	2827	997	1	1168	128.9	0	0	3
16303	59	2828	997	1	1168	145.6	0	0	2
16304	59	2034	997	1	1168	139.1	100.4	15	10
16305	59	2035	997	1	1168	76.6	71.3	15	10
16306	59	2183	997	1	1168	107.1	82.3	20	5
16307	59	2155	997	1	1168	150.8	129.8	30	10
16308	59	2185	997	1	1168	68.3	59.3	15	10
16309	59	2189	997	1	1169	0	73.8	25	0
16310	59	2129	997	1	1169	0	68.7	25	0
16311	59	2132	997	1	1169	0	76.5	25	0
16312	59	2133	997	1	1169	0	68.5	25	0
16313	59	2134	997	1	1169	0	82.6	25	0
16314	59	2199	997	1	1169	0	66	25	0
16315	59	2024	997	1	1169	0	86.4	25	0
16316	59	2319	997	1	1169	0	74.8	25	0
16317	59	2173	997	1	1169	0	73.3	25	0
16318	59	2202	997	1	1169	0	67.1	25	0
16319	59	2144	997	1	1169	0	90.3	25	0
16320	59	2327	997	1	1169	0	61.2	25	0
16321	59	2151	997	1	1169	0	84.2	25	0
16322	59	2152	997	1	1169	0	121.2	25	0
16323	59	2153	997	1	1169	0	62.6	25	0
16324	59	2330	997	1	1169	0	60.3	25	0
16325	59	2154	997	1	1169	0	123.5	25	0
16326	59	2155	997	1	1169	0	108	25	0
16327	59	2014	998	1	1168	163.6	101.4	20	1
16328	59	2829	998	1	1168	142.7	0	0	1
16329	59	2830	998	1	1168	75.9	0	0	1
16330	59	2831	998	1	1168	116.8	0	0	1
16331	59	2832	998	1	1168	69.8	0	0	1
16332	60	2017	999	1	1170	127.3	121.2	30	20
16333	60	2018	999	1	1170	139.8	109.2	80	10
16334	60	2833	999	1	1170	128.2	0	0	4
16335	60	2834	999	1	1170	140.6	0	0	1
16336	60	2835	999	1	1170	116.6	0	0	2
16337	60	2836	999	1	1170	120.7	0	0	2
16338	60	2837	999	1	1170	123.6	0	0	1
16339	60	2019	999	1	1170	92.2	72.4	30	20
16340	60	2020	999	1	1170	100.4	70.5	40	10
16341	60	2021	999	1	1170	162.2	143.4	20	5
16342	60	2022	999	1	1170	128.8	112.3	15	10
16343	60	2024	999	1	1170	105.8	83	80	20
16344	60	2027	999	1	1170	128.1	103.9	30	20
16345	60	2029	999	1	1170	140.5	110.6	15	3
16346	60	2838	999	1	1170	106	0	0	5
16347	60	2839	999	1	1170	130	0	0	1
16348	60	2840	999	1	1170	143.8	0	0	1
16349	60	2030	999	1	1170	127.4	111.3	15	10
16350	60	2031	999	1	1170	146.1	123.8	40	10
16351	60	2032	999	1	1170	135.4	79.9	40	7
16352	60	2841	999	1	1170	113.4	0	0	1
16353	60	2842	999	1	1170	113.3	0	0	1
16354	60	2843	999	1	1170	139.7	0	0	1
16355	60	2033	999	1	1170	153.9	120.2	40	10
16356	60	2034	999	1	1170	152.5	85.9	40	10
16357	60	2035	999	1	1170	73.5	68.2	15	10
16358	60	2013	999	1	1170	172.9	140	50	6
16359	60	2844	999	1	1170	119.9	0	0	7
16360	60	2845	999	1	1170	137.4	0	0	6
16361	60	2846	999	1	1170	136.4	0	0	5
16362	60	2847	999	1	1170	153.9	0	0	1
16363	60	2018	999	1	1171	0	80.7	75	0
16364	60	2021	999	1	1171	0	57.7	25	0
16365	60	2024	999	1	1171	0	82.5	75	0
16366	60	2030	999	1	1171	0	61	25	0
16367	60	2032	999	1	1171	0	81	50	0
16368	60	2033	999	1	1171	0	113.2	25	0
16369	60	2034	999	1	1171	0	62.5	25	0
16370	60	2035	999	1	1171	0	62.3	25	0
16371	60	2036	1000	1	1170	145.5	123.6	15	2
16372	60	2848	1000	1	1170	118.3	0	0	2
16373	60	2849	1000	1	1170	108.3	0	0	3
16374	60	2850	1000	1	1170	130.1	0	0	1
16375	60	2851	1000	1	1170	93	0	0	2
16376	61	2194	1001	1	1172	70.5	56.8	35	15
16377	61	2129	1001	1	1172	71.2	61	35	15
16378	61	2166	1001	1	1172	93.4	66.3	35	15
16379	61	2359	1001	1	1172	74.2	60.2	35	15
16380	61	2196	1001	1	1172	71.2	56.8	30	20
16381	61	2159	1001	1	1172	70.4	57.7	15	10
16382	61	2134	1001	1	1172	136.2	83.8	20	5
16383	61	2852	1001	1	1172	86.1	71.6	15	10
16384	61	2853	1001	1	1172	69.3	56.7	20	5
16385	61	2854	1001	1	1172	69.4	57.5	20	5
16386	61	2855	1001	1	1172	80.8	61	20	5
16387	61	2363	1001	1	1172	69	61.9	15	10
16388	61	2212	1001	1	1172	69.7	56.8	50	25
16389	61	2213	1001	1	1172	68.2	56.8	35	15
16390	61	2216	1001	1	1172	68.4	56.7	50	25
16391	61	2181	1001	1	1172	68	60.8	30	20
16392	61	2366	1001	1	1172	82.2	66.5	50	25
16393	61	2194	1001	1	1173	0	56.7	50	0
16394	61	2856	1001	1	1173	0	63.3	25	0
16395	61	2166	1001	1	1173	0	67.4	75	0
16396	61	2359	1001	1	1173	0	61	50	0
16397	61	2196	1001	1	1173	0	60.7	50	0
16398	61	2159	1001	1	1173	0	58.8	50	0
16399	61	2134	1001	1	1173	0	71.6	50	0
16400	61	2852	1001	1	1173	0	71.2	25	0
16401	61	2212	1001	1	1173	0	60	75	0
16402	61	2213	1001	1	1173	0	58.6	50	0
16403	61	2216	1001	1	1173	0	60.2	75	0
16404	61	2181	1001	1	1173	0	62.9	75	0
16405	61	2366	1001	1	1173	0	66.9	75	0
16406	63	2336	1002	1	1174	0	59.1	20	5
16407	63	2162	1002	1	1174	69.4	62.8	15	10
16408	63	2163	1002	1	1174	90	65	35	15
16409	63	2157	1002	1	1174	137.7	97.4	40	10
16410	63	2191	1002	1	1174	91.1	76.7	15	10
16411	63	2158	1002	1	1174	135.2	87.8	45	5
16412	63	2129	1002	1	1174	73.7	65.1	15	10
16413	63	2166	1002	1	1174	98.7	71.2	55	20
16414	63	2167	1002	1	1174	78.9	63	15	10
16415	63	2311	1002	1	1174	68.1	57.8	30	20
16416	63	2339	1002	1	1174	91.4	69.2	30	20
16417	63	2169	1002	1	1174	81.2	62.7	20	5
16418	63	2552	1002	1	1174	69.5	60.1	50	25
16419	63	2340	1002	1	1174	70.6	56.7	20	5
16420	63	2435	1002	1	1174	82	62.1	55	20
16421	63	2857	1002	1	1174	73.6	60.7	20	5
16422	63	2735	1002	1	1174	72.6	57.9	15	10
16423	63	2134	1002	1	1174	153.1	88.5	45	5
16424	63	2858	1002	1	1174	110.9	74.6	20	5
16425	63	2342	1002	1	1174	68.3	58.7	70	30
16426	63	2560	1002	1	1174	73	62.2	50	25
16427	63	2200	1002	1	1174	99.6	75.8	15	10
16428	63	2859	1002	1	1174	82.9	61	20	5
16429	63	2172	1002	1	1174	69.1	56.7	20	5
16430	63	2173	1002	1	1174	80.1	58.9	35	15
16431	63	2174	1002	1	1174	117.5	80.9	20	5
16432	63	2176	1002	1	1174	71.5	56.7	40	10
16433	63	2177	1002	1	1174	68.1	57.7	15	10
16434	63	2321	1002	1	1174	151.4	81.6	45	5
16435	63	2142	1002	1	1174	68.6	59.1	30	20
16436	63	2348	1002	1	1174	82.5	65.5	50	25
16437	63	2178	1002	1	1174	68.5	59	35	15
16438	63	2349	1002	1	1174	68.5	58.6	35	15
16439	63	2143	1002	1	1174	68.2	60.2	45	30
16440	63	2208	1002	1	1174	69.5	56.8	15	10
16441	63	2363	1002	1	1174	68.1	56.8	20	5
16442	63	2212	1002	1	1174	0	56.8	20	5
16443	63	2213	1002	1	1174	69.6	56.7	40	10
16444	63	2160	1002	1	1174	75.7	60.9	30	20
16445	63	2860	1002	1	1174	81.7	65.3	50	25
16446	63	2331	1002	1	1174	82.2	62.2	20	5
16447	63	2215	1002	1	1174	96.8	64.3	20	5
16448	63	2351	1002	1	1174	68.3	56.8	35	15
16449	63	2861	1002	1	1174	74.7	59.9	50	25
16450	63	2182	1002	1	1174	93.3	62	60	15
16451	63	2184	1002	1	1174	89.2	64.2	80	20
16452	63	2358	1002	1	1174	70.8	56.8	20	5
16453	63	2336	1002	1	1175	0	57.7	25	0
16454	63	2162	1002	1	1175	0	64.9	25	0
16455	63	2163	1002	1	1175	0	69.1	25	0
16456	63	2157	1002	1	1175	0	77.1	50	0
16457	63	2191	1002	1	1175	0	82.1	25	0
16458	63	2158	1002	1	1175	0	75.1	50	0
16459	63	2129	1002	1	1175	0	63.5	25	0
16460	63	2166	1002	1	1175	0	70.4	50	0
16461	63	2339	1002	1	1175	0	67.4	50	0
16462	63	2552	1002	1	1175	0	65.3	50	0
16463	63	2340	1002	1	1175	0	58	25	0
16464	63	2435	1002	1	1175	0	67.3	50	0
16465	63	2735	1002	1	1175	0	56.8	25	0
16466	63	2134	1002	1	1175	0	80.7	50	0
16467	63	2342	1002	1	1175	0	63.2	50	0
16468	63	2173	1002	1	1175	0	64.9	50	0
16469	63	2174	1002	1	1175	0	68.5	25	0
16470	63	2321	1002	1	1175	0	72.6	50	0
16471	63	2348	1002	1	1175	0	67.5	75	0
16472	63	2178	1002	1	1175	0	62.2	75	0
16473	63	2143	1002	1	1175	0	61.1	50	0
16474	63	2208	1002	1	1175	0	58.6	25	0
16475	63	2363	1002	1	1175	0	61.2	25	0
16476	63	2212	1002	1	1175	0	62.3	25	0
16477	63	2213	1002	1	1175	0	57.8	25	0
16478	63	2331	1002	1	1175	0	64.6	25	0
16479	63	2215	1002	1	1175	0	67.5	25	0
16480	63	2351	1002	1	1175	0	60.9	50	0
16481	63	2181	1002	1	1175	0	65.1	25	0
16482	63	2182	1002	1	1175	0	63.1	75	0
16483	63	2184	1002	1	1175	0	66.6	50	0
16484	63	2358	1002	1	1175	0	56.7	25	0
16485	63	2166	1003	1	1174	69.6	56.7	20	5
16486	63	2339	1003	1	1174	69.2	56.8	20	5
16487	63	2348	1003	1	1174	71.4	56.8	20	5
16488	63	2182	1003	1	1174	68.5	56.7	20	5
16489	64	2189	1004	1	1176	70.5	56.7	17	8
16490	64	2190	1004	1	1176	72.5	57.8	15	10
16491	64	2862	1004	1	1176	75.4	59.7	20	5
16492	64	2195	1004	1	1176	89.5	62.9	21	4
16493	64	2196	1004	1	1176	69.5	59	15	10
16494	64	2197	1004	1	1176	70.9	56.9	21	4
16495	64	2134	1004	1	1176	111.3	66	20	5
16496	64	2200	1004	1	1176	98.8	59.7	20	5
16497	64	2202	1004	1	1176	68.3	56.8	17	8
16498	64	2204	1004	1	1176	0	0	0	3
16499	64	2205	1004	1	1176	83.3	56.7	19	3
16500	64	2206	1004	1	1176	69.5	56.8	15	10
16501	64	2211	1004	1	1176	74.9	56.7	15	10
16502	64	2212	1004	1	1176	81.1	56.9	21	4
16503	64	2213	1004	1	1176	70.8	58	15	10
16504	64	2218	1004	1	1176	68	58	18	7
16505	64	2863	1004	1	1176	73.7	60.8	20	5
16506	64	2864	1004	1	1176	74.5	57.2	21	4
16507	64	2222	1004	1	1176	161.6	130.9	23	2
16508	64	2205	1004	1	1177	0	68.3	25	0
16509	64	2212	1004	1	1177	0	65.1	25	0
16510	64	2216	1004	1	1177	0	65	25	0
16511	65	2037	1005	1	1178	151.1	138.8	24	14
16512	65	2865	1005	1	1178	146.4	0	0	1
16513	65	2866	1005	1	1178	140.6	0	0	2
16514	65	2867	1005	1	1178	139.3	0	0	2
16515	65	2868	1005	1	1178	155.3	0	0	3
16516	65	2869	1005	1	1178	137	0	0	2
16517	65	2072	1005	1	1178	118.5	110.1	5	5
16518	65	2073	1005	1	1178	128.9	119.4	5	5
16519	65	2074	1005	1	1178	148.4	136.3	14	10
16520	65	2870	1005	1	1178	142.8	0	0	1
16521	65	2871	1005	1	1178	132.2	0	0	1
16522	65	2872	1005	1	1178	139.3	0	0	1
16523	65	2873	1005	1	1178	133.8	0	0	1
16524	65	2110	1005	1	1178	147.8	140.5	5	5
16525	65	2111	1005	1	1178	109.9	104	6	6
16526	65	2296	1005	1	1178	101.2	95	5	5
16527	65	2037	1006	1	1178	121.6	106.2	16	16
16528	65	2072	1006	1	1178	75.8	70.3	5	5
16529	65	2074	1006	1	1178	106.3	98.6	9	9
16530	65	2110	1006	1	1178	130.9	104	5	5
16531	65	2111	1006	1	1178	69.4	67.7	4	4
16532	66	2778	1007	1	1179	116.2	100.6	16	4
16533	66	2124	1007	1	1179	142.4	109	12	8
16534	66	2451	1007	1	1179	0	0	8	2
16535	66	2309	1007	1	1179	129.5	97.9	8	2
16536	66	2156	1007	1	1179	79	67.5	14	8
16537	66	2874	1007	1	1179	70.4	58.5	14	6
16538	66	2310	1007	1	1179	93.3	0	8	2
16539	66	2127	1007	1	1179	126.5	111	48	12
16540	66	2730	1007	1	1179	134.1	79.6	8	2
16541	66	2158	1007	1	1179	153.2	105.1	9	2
16542	66	2612	1007	1	1179	145.1	76.5	8	2
16543	66	2875	1007	1	1179	70.1	0	18	7
16544	66	2337	1007	1	1179	80.8	57.6	8	2
16545	66	2195	1007	1	1179	107.2	84.7	16	4
16546	66	2129	1007	1	1179	76.6	68.5	16	4
16547	66	2731	1007	1	1179	128.9	69.3	8	4
16548	66	2166	1007	1	1179	101.6	74.9	14	8
16549	66	2167	1007	1	1179	73.6	62	14	8
16550	66	2339	1007	1	1179	109.1	76.8	14	8
16551	66	2312	1007	1	1179	117.3	57.8	8	2
16552	66	2003	1007	1	1179	166.4	145.1	25	8
16553	66	2005	1007	1	1179	91.9	63.8	16	8
16554	66	2130	1007	1	1179	132.2	109.1	80	20
16555	66	2131	1007	1	1179	91.6	65.5	45	20
16556	66	2341	1007	1	1179	68.3	57.6	8	2
16557	66	2435	1007	1	1179	100.4	70.5	14	8
16558	66	2132	1007	1	1179	100.5	70.5	16	4
16559	66	2446	1007	1	1179	73.6	57.1	14	6
16560	66	2008	1007	1	1179	146.7	107	15	8
16561	66	2736	1007	1	1179	93.3	68.1	6	4
16562	66	2159	1007	1	1179	69.3	56.7	14	6
16563	66	2134	1007	1	1179	155.9	115.9	16	4
16564	66	2021	1007	1	1179	133.5	102.9	27	4
16565	66	2022	1007	1	1179	111.2	57.2	8	4
16566	66	2876	1007	1	1179	95.7	62.9	19	6
16567	66	2135	1007	1	1179	73.4	61.2	45	20
16568	66	2342	1007	1	1179	71.2	60.1	16	6
16569	66	2136	1007	1	1179	121.8	83.9	20	6
16570	66	2539	1007	1	1179	114.5	97.6	8	2
16571	66	2318	1007	1	1179	116.6	65.1	8	2
16572	66	2319	1007	1	1179	120.4	76.8	8	2
16573	66	2139	1007	1	1179	132.9	96.5	40	12
16574	66	2172	1007	1	1179	0	56.8	14	6
16575	66	2174	1007	1	1179	140.6	104.3	8	2
16576	66	2176	1007	1	1179	76.9	61.9	14	6
16577	66	2029	1007	1	1179	133.2	83.4	8	2
16578	66	2321	1007	1	1179	161.5	112.3	8	2
16579	66	2437	1007	1	1179	80.2	58.7	14	8
16580	66	2348	1007	1	1179	80.6	62.1	24	8
16581	66	2178	1007	1	1179	69.4	59.8	14	6
16582	66	2877	1007	1	1179	112.2	96.4	8	2
16583	66	2143	1007	1	1179	69.6	61.9	14	6
16584	66	2878	1007	1	1179	80.7	61.9	8	4
16585	66	2144	1007	1	1179	105.8	83.3	20	12
16586	66	2160	1007	1	1179	89.5	65.3	14	8
16587	66	2350	1007	1	1179	74.6	58.7	16	6
16588	66	2161	1007	1	1179	81	60.5	16	8
16589	66	2146	1007	1	1179	87.8	62.2	8	2
16590	66	2214	1007	1	1179	147.9	77.4	8	2
16591	66	2554	1007	1	1179	78.8	59.9	14	8
16592	66	2326	1007	1	1179	153.4	138.2	14	6
16593	66	2750	1007	1	1179	138.6	87	8	2
16594	66	2147	1007	1	1179	84.3	66.6	8	2
16595	66	2151	1007	1	1179	117.4	67.3	6	4
16596	66	2152	1007	1	1179	170.5	127.8	8	2
16597	66	2331	1007	1	1179	121.9	67.8	8	2
16598	66	2154	1007	1	1179	154.2	125.3	14	6
16599	66	2011	1007	1	1179	157.2	118.5	8	2
16600	66	2182	1007	1	1179	98.8	63.2	8	2
16601	66	2188	1007	1	1179	114	71.5	8	2
16602	66	2879	1007	1	1179	95.4	69.5	16	4
16603	66	2155	1007	1	1179	150.1	116.8	8	2
16604	66	2460	1007	1	1179	104.9	61.8	4	1
16605	66	2511	1007	1	1179	112.1	0	4	1
16606	66	2013	1007	1	1179	167.7	136.8	34	6
16607	66	2185	1007	1	1179	71.6	56.9	25	10
16608	66	2186	1007	1	1179	134	88.3	8	2
16609	66	2187	1007	1	1179	90.5	63.4	16	6
16610	66	2334	1007	1	1179	177.1	152.3	40	10
16611	66	2127	1007	1	1180	0	113.4	10	0
16612	66	2158	1007	1	1180	0	79.1	20	0
16613	66	2129	1007	1	1180	0	71.4	10	0
16614	66	2166	1007	1	1180	0	71.3	20	0
16615	66	2167	1007	1	1180	0	65.4	20	0
16616	66	2130	1007	1	1180	0	107.7	75	0
16617	66	2435	1007	1	1180	0	77.8	10	0
16618	66	2132	1007	1	1180	0	73.1	10	0
16619	66	2335	1007	1	1180	0	61.9	10	0
16620	66	2134	1007	1	1180	0	81	20	0
16621	66	2021	1007	1	1180	0	72.2	10	0
16622	66	2543	1007	1	1180	0	79.2	20	0
16623	66	2139	1007	1	1180	0	90.6	10	0
16624	66	2321	1007	1	1180	0	73.9	10	0
16625	66	2144	1007	1	1180	0	80.4	30	0
16626	66	2154	1007	1	1180	0	109.1	10	0
16627	66	2334	1007	1	1180	0	146.9	25	0
16628	66	2127	1007	1	1181	0	93	25	0
16629	66	2131	1007	1	1181	0	57.9	25	0
16630	66	2135	1007	1	1181	0	57.8	25	0
16631	66	2139	1007	1	1181	0	67.3	25	0
16632	66	2334	1007	1	1181	0	143.2	25	0
16633	66	2134	1007	1	1182	0	69.6	25	0
16634	66	2136	1007	1	1182	0	62.9	60	0
16635	66	2334	1007	1	1182	0	144.9	25	0
16636	66	2124	1008	1	1179	126.3	69.6	4	2
16637	66	2156	1008	1	1179	76.9	66.4	5	2
16638	66	2127	1008	1	1179	90.7	76.1	20	5
16639	66	2158	1008	1	1179	155.2	122.1	3	1
16640	66	2731	1008	1	1179	150.3	112.9	3	1
16641	66	2166	1008	1	1179	92.4	64.1	5	2
16642	66	2167	1008	1	1179	70.7	58.4	5	2
16643	66	2339	1008	1	1179	88.5	60.4	5	2
16644	66	2003	1008	1	1179	180.3	149.7	8	2
16645	66	2005	1008	1	1179	134.6	0	6	2
16646	66	2014	1008	1	1179	126.1	100.6	35	15
16647	66	2131	1008	1	1179	125.1	57	15	5
16648	66	2132	1008	1	1179	68.2	58	4	1
16649	66	2446	1008	1	1179	0	56.8	5	2
16650	66	2008	1008	1	1179	165.4	145.2	5	2
16651	66	2134	1008	1	1179	172	129.5	5	1
16652	66	2021	1008	1	1179	175.8	124.4	4	2
16653	66	2022	1008	1	1179	174.7	81.8	3	1
16654	66	2876	1008	1	1179	81.4	74.9	6	2
16655	66	2135	1008	1	1179	75.8	56.8	15	5
16656	66	2342	1008	1	1179	68.1	57.2	4	1
16657	66	2139	1008	1	1179	119.6	63.3	15	5
16658	66	2437	1008	1	1179	79.2	60	5	2
16659	66	2178	1008	1	1179	83	59.2	4	1
16660	66	2144	1008	1	1179	82.1	74.8	7	5
16661	66	2160	1008	1	1179	85.2	66.2	5	2
16662	66	2214	1008	1	1179	166.9	115.3	3	1
16663	66	2554	1008	1	1179	92.5	60.2	5	2
16664	66	2326	1008	1	1179	154.7	101.9	6	2
16665	66	2154	1008	1	1179	152.9	95.7	6	2
16666	66	2013	1008	1	1179	165.6	148.7	12	3
16667	66	2185	1008	1	1179	76.8	57.9	7	3
16668	66	2334	1008	1	1179	170.1	150.1	12	3
16669	66	2136	1008	1	1182	0	57.9	20	0
16670	67	2158	1009	1	1183	103.9	64	8	2
16671	67	2134	1009	1	1183	120.9	68.4	8	2
16672	67	2021	1009	1	1183	100.2	0	8	2
16673	67	2139	1009	1	1183	105.2	75.8	8	4
16674	67	2144	1009	1	1183	96.7	78.6	8	4
16675	67	2013	1009	1	1183	145.2	110.4	15	2
16676	68	2017	1010	1	1184	134	125.9	30	20
16677	68	2018	1010	1	1184	137.3	113.3	55	15
16678	68	2880	1010	1	1184	139.6	0	0	2
16679	68	2881	1010	1	1184	113.7	0	0	3
16680	68	2019	1010	1	1184	99.9	75.7	55	20
16681	68	2020	1010	1	1184	100.6	69.2	55	15
16682	68	2882	1010	1	1184	68.2	0	0	2
16683	68	2883	1010	1	1184	68.4	0	0	3
16684	68	2021	1010	1	1184	165	141.4	20	5
16685	68	2022	1010	1	1184	132.1	67.3	15	10
16686	68	2023	1010	1	1184	88.2	67.4	30	19
16687	68	2884	1010	1	1184	85.1	0	0	1
16688	68	2024	1010	1	1184	105.8	85.1	30	20
16689	68	2025	1010	1	1184	100.5	78.1	35	15
16690	68	2009	1010	1	1184	166.7	147.6	40	10
16691	68	2027	1010	1	1184	139.4	109	85	36
16692	68	2885	1010	1	1184	123.1	0	0	2
16693	68	2886	1010	1	1184	144.2	0	0	1
16694	68	2887	1010	1	1184	123.5	0	0	1
16695	68	2028	1010	1	1184	117.3	91.5	30	20
16696	68	2405	1010	1	1184	97.5	84.1	30	20
16697	68	2406	1010	1	1184	101.6	84.9	30	20
16698	68	2384	1010	1	1184	131.1	108.6	15	5
16699	68	2385	1010	1	1184	115	0	0	5
16700	68	2029	1010	1	1184	131.2	76.6	40	9
16701	68	2888	1010	1	1184	145.9	0	0	1
16702	68	2030	1010	1	1184	140.4	114	30	20
16703	68	2031	1010	1	1184	145.8	122.9	80	20
16704	68	2032	1010	1	1184	112.6	73.6	50	25
16705	68	2144	1010	1	1184	101.9	84.3	30	20
16706	68	2033	1010	1	1184	155	128.8	35	11
16707	68	2889	1010	1	1184	143.6	0	0	1
16708	68	2890	1010	1	1184	97.5	0	0	3
16709	68	2034	1010	1	1184	146.9	104	35	15
16710	68	2035	1010	1	1184	83.1	65.2	60	15
16711	68	2013	1010	1	1184	171.9	154.9	95	20
16712	68	2891	1010	1	1184	168.8	0	0	2
16713	68	2892	1010	1	1184	68.1	0	0	8
16714	68	2018	1010	1	1185	0	68.3	75	0
16715	68	2021	1010	1	1185	0	75.7	50	0
16716	68	2024	1010	1	1185	0	81	75	0
16717	68	2030	1010	1	1185	0	67.5	50	0
16718	68	2032	1010	1	1185	0	79.6	50	0
16719	68	2033	1010	1	1185	0	104.9	25	0
16720	68	2034	1010	1	1185	0	67.8	50	0
16721	68	2035	1010	1	1185	0	56.8	50	0
16722	68	2017	1011	1	1184	91.1	75	20	5
16723	68	2018	1011	1	1184	96.8	77.6	20	5
16724	68	2021	1011	1	1184	141	88.4	20	5
16725	68	2023	1011	1	1184	0	56.8	20	5
16726	68	2024	1011	1	1184	73.8	59.6	20	5
16727	68	2027	1011	1	1184	77.7	57	40	10
16728	68	2398	1011	1	1184	109.6	83.8	35	15
16729	68	2036	1011	1	1184	146.5	121.4	35	14
16730	68	2893	1011	1	1184	147.8	0	0	1
16731	68	2033	1011	1	1184	89.7	59.2	20	5
16732	68	2013	1011	1	1184	157	138.8	40	10
16733	68	2018	1011	1	1185	0	61.4	25	0
16734	68	2024	1011	1	1185	0	70.6	25	0
16735	69	2156	1012	1	1186	87.4	64.8	155	45
16736	69	2874	1012	1	1186	74.7	64	25	15
16737	69	2894	1012	1	1186	68.1	56.7	130	30
16738	69	2452	1012	1	1186	128.4	76.7	45	5
16739	69	2895	1012	1	1186	150.8	69.1	45	5
16740	69	2875	1012	1	1186	132.7	60.4	35	5
16741	69	2896	1012	1	1186	71.6	56.7	135	25
16742	69	2134	1012	1	1186	135.6	78.9	65	10
16743	69	2897	1012	1	1186	97.8	68.1	60	20
16744	69	2462	1012	1	1186	74.1	65.3	20	20
16745	69	2898	1012	1	1186	81.1	64.3	30	10
16746	69	2899	1012	1	1186	68.3	57.7	125	35
16747	69	2900	1012	1	1186	84	65.4	30	10
16748	69	2901	1012	1	1186	91.5	71.1	30	10
16749	69	2902	1012	1	1186	85.1	62	440	120
16750	69	2903	1012	1	1186	98.7	69.8	60	20
16751	69	2894	1012	1	1187	0	64.6	40	0
16752	69	2452	1012	1	1187	0	67.5	80	0
16753	69	2896	1012	1	1187	0	67.4	40	0
16754	69	2134	1012	1	1187	0	72.9	80	0
16755	69	2899	1012	1	1187	0	66.4	40	0
16756	69	2902	1012	1	1187	0	72.8	80	0
16757	69	2156	1013	1	1186	101	68.6	35	5
16758	69	2896	1013	1	1186	68.6	57	35	5
16759	69	2899	1013	1	1186	69.2	58.5	35	5
16760	69	2902	1013	1	1186	69.6	57.6	60	20
16761	70	2001	1014	1	1188	161	135.7	35	15
16762	70	2002	1014	1	1188	104	65.9	40	10
16763	70	2003	1014	1	1188	176.1	148.5	260	54
16764	70	2616	1014	1	1188	143.4	104.3	40	10
16765	70	2904	1014	1	1188	142	102.1	35	15
16766	70	2004	1014	1	1188	162.3	114.7	72	13
16767	70	2005	1014	1	1188	84	56.8	58	27
16768	70	2617	1014	1	1188	150.6	108.9	25	5
16769	70	2006	1014	1	1188	151.6	98.9	85	15
16770	70	2007	1014	1	1188	148.3	101.9	60	15
16771	70	2008	1014	1	1188	169.7	149.5	23	11
16772	70	2618	1014	1	1188	127.4	95.1	25	5
16773	70	2539	1014	1	1188	127	107	25	5
16774	70	2009	1014	1	1188	165.7	143.1	31	19
16775	70	2031	1014	1	1188	143.9	120.7	40	10
16776	70	2011	1014	1	1188	167.4	148.3	24	36
16777	70	2013	1014	1	1188	170.8	147.3	315	103
16778	70	2905	1014	1	1188	166.6	0	0	4
16779	70	2906	1014	1	1188	169.5	0	0	1
16780	70	2907	1014	1	1188	144.1	0	0	11
16781	70	2908	1014	1	1188	176	0	0	1
16782	70	2909	1014	1	1188	170.7	0	0	2
16783	70	2910	1014	1	1188	110.4	0	0	6
16784	70	2911	1014	1	1188	151.5	0	0	7
16785	70	2002	1014	1	1190	0	58.8	25	0
16786	70	2003	1014	1	1190	0	102.9	230	0
16787	70	2616	1014	1	1190	0	97.3	25	0
16788	70	2004	1014	1	1190	0	105.9	25	0
16789	70	2005	1014	1	1190	0	57.4	25	0
16790	70	2006	1014	1	1190	0	95.3	25	0
16791	70	2007	1014	1	1190	0	95	25	0
16792	70	2009	1014	1	1190	0	103.2	50	0
16793	70	2011	1014	1	1190	0	105.1	50	0
16794	70	2013	1014	1	1190	0	103.2	360	0
16795	70	2003	1015	1	1188	165.6	146.5	30	6
16796	70	2004	1015	1	1188	159.2	133.7	13	2
16797	70	2005	1015	1	1188	79.1	57.7	12	3
16798	70	2014	1015	1	1188	137.5	101.9	40	10
16799	70	2008	1015	1	1188	153.8	140.9	12	4
16800	70	2036	1015	1	1188	141.7	112.4	40	10
16801	70	2011	1015	1	1188	155.9	136.6	16	4
16802	70	2013	1015	1	1188	155.8	139	35	15
16803	70	2014	1015	1	1189	0	95.7	50	0
16804	70	2003	1015	1	1190	0	121.1	20	0
16805	70	2014	1015	1	1190	0	91.9	25	0
16806	70	2036	1015	1	1190	0	108.7	25	0
16807	70	2013	1015	1	1190	0	108	40	0
16808	71	2009	1016	1	1191	160.1	116.5	22	3
16809	71	2013	1016	1	1191	165.5	119.5	60	15
16810	72	2009	1017	1	1192	156.8	108.4	22	3
16811	72	2013	1017	1	1192	165.3	116	60	15
16812	73	2037	1018	1	1193	169.5	156.7	100	62
16813	73	2912	1018	1	1193	170.7	0	0	3
16814	73	2783	1018	1	1193	158.4	0	0	2
16815	73	2784	1018	1	1193	160	0	0	3
16816	73	2785	1018	1	1193	162.3	0	0	2
16817	73	2913	1018	1	1193	171	0	0	3
16818	73	2914	1018	1	1193	172.7	0	0	3
16819	73	2786	1018	1	1193	168.5	0	0	3
16820	73	2915	1018	1	1193	165.6	0	0	2
16821	73	2916	1018	1	1193	168.7	0	0	3
16822	73	2917	1018	1	1193	159	0	0	2
16823	73	2787	1018	1	1193	170	0	0	2
16824	73	2918	1018	1	1193	174	0	0	2
16825	73	2788	1018	1	1193	159.2	0	0	3
16826	73	2919	1018	1	1193	168.6	0	0	3
16827	73	2920	1018	1	1193	160.1	0	0	3
16828	73	2921	1018	1	1193	169.9	0	0	3
16829	73	2922	1018	1	1193	175	0	0	2
16830	73	2923	1018	1	1193	171.8	0	0	3
16831	73	2924	1018	1	1193	164.5	0	0	3
16832	73	2925	1018	1	1193	162.4	0	0	4
16833	73	2926	1018	1	1193	170.7	0	0	2
16834	73	2927	1018	1	1193	172.9	0	0	1
16835	73	2928	1018	1	1193	168.6	0	0	3
16836	73	2929	1018	1	1193	174.9	0	0	4
16837	73	2930	1018	1	1193	171.9	0	0	3
16838	73	2931	1018	1	1193	140.8	0	0	2
16839	73	2932	1018	1	1193	175.3	0	0	3
16840	73	2933	1018	1	1193	163.7	0	0	3
16841	73	2934	1018	1	1193	163.4	0	0	3
16842	73	2072	1018	1	1193	136.2	117	30	25
16843	73	2935	1018	1	1193	0	85.2	15	0
16844	73	2073	1018	1	1193	144.4	132.3	20	5
16845	73	2074	1018	1	1193	161.7	150.8	70	22
16846	73	2936	1018	1	1193	153	0	0	2
16847	73	2819	1018	1	1193	151	0	0	3
16848	73	2937	1018	1	1193	148.9	0	0	3
16849	73	2938	1018	1	1193	116.6	0	0	3
16850	73	2821	1018	1	1193	154	0	0	2
16851	73	2939	1018	1	1193	158.7	0	0	3
16852	73	2940	1018	1	1193	151.9	0	0	2
16853	73	2822	1018	1	1193	152.2	0	0	2
16854	73	2941	1018	1	1193	152.1	0	0	2
16855	73	2942	1018	1	1193	155.1	0	0	3
16856	73	2823	1018	1	1193	168.6	0	0	2
16857	73	2943	1018	1	1193	163.8	0	0	3
16858	73	2944	1018	1	1193	157	0	0	2
16859	73	2945	1018	1	1193	150.8	0	0	3
16860	73	2579	1018	1	1193	144.5	0	0	2
16861	73	2946	1018	1	1193	149.7	0	0	3
16862	73	2947	1018	1	1193	156	0	0	2
16863	73	2948	1018	1	1193	142.6	0	0	3
16864	73	2949	1018	1	1193	140.2	0	0	3
16865	73	2950	1018	1	1193	158.5	0	0	2
16866	73	2951	1018	1	1193	154.1	0	0	1
16867	73	2952	1018	1	1193	161.4	0	0	2
16868	73	2953	1018	1	1193	136.5	0	0	2
16869	73	2954	1018	1	1193	148.1	0	0	3
16870	73	2955	1018	1	1193	159.9	0	0	2
16871	73	2956	1018	1	1193	157	0	0	3
16872	73	2957	1018	1	1193	136.4	0	0	1
16873	73	2958	1018	1	1193	150.3	0	0	2
16874	73	2959	1018	1	1193	150.8	0	0	2
16875	73	2960	1018	1	1193	151.1	0	0	3
16876	73	2961	1018	1	1193	135.2	0	0	2
16877	73	2110	1018	1	1193	160.4	152.9	20	30
16878	73	2111	1018	1	1193	126.2	112.4	25	9
16879	73	2962	1018	1	1193	97.5	0	0	1
16880	73	2963	1018	1	1193	127.9	0	0	1
16881	73	2964	1018	1	1193	99.9	0	0	1
16882	73	2965	1018	1	1193	118.8	0	0	1
16883	73	2966	1018	1	1193	108.1	0	0	1
16884	73	2967	1018	1	1193	121.5	0	0	1
16885	73	2968	1018	1	1193	115.5	0	0	1
16886	73	2969	1018	1	1193	112.1	0	0	1
16887	73	2970	1018	1	1193	116.5	0	0	1
16888	73	2971	1018	1	1193	111.2	0	0	1
16889	73	2972	1018	1	1193	120.7	0	0	1
16890	73	2973	1018	1	1193	124.2	0	0	1
16891	73	2974	1018	1	1193	102.9	0	0	1
16892	73	2975	1018	1	1193	107.1	0	0	1
16893	73	2976	1018	1	1193	126.8	0	0	1
16894	73	2977	1018	1	1193	103.4	0	0	1
16895	73	2296	1018	1	1193	130.2	118.4	15	7
16896	73	2978	1018	1	1193	129.7	0	0	1
16897	73	2979	1018	1	1193	110.6	0	0	1
16898	73	2980	1018	1	1193	130	0	0	1
16899	73	2121	1018	1	1193	140.3	131.2	15	10
16900	73	2037	1019	1	1193	149.2	120.1	50	26
16901	73	2915	1019	1	1193	134.5	0	0	1
16902	73	2927	1019	1	1193	146.7	0	0	1
16903	73	2929	1019	1	1193	166.8	0	0	2
16904	73	2072	1019	1	1193	83	71.7	20	10
16905	73	2074	1019	1	1193	121.7	114.7	30	22
16906	73	2579	1019	1	1193	108.2	0	0	1
16907	73	2951	1019	1	1193	117.3	0	0	1
16908	73	2952	1019	1	1193	84	0	0	1
16909	73	2956	1019	1	1193	144.8	0	0	2
16910	73	2957	1019	1	1193	132.8	0	0	1
16911	73	2959	1019	1	1193	133.9	0	0	1
16912	73	2961	1019	1	1193	81	0	0	1
16913	73	2110	1019	1	1193	129.1	114.3	30	20
16914	73	2111	1019	1	1193	73.7	68.2	20	10
16915	74	2189	1020	1	1194	79.9	68.9	50	50
16916	74	2124	1020	1	1194	137.3	103.7	40	20
16917	74	2309	1020	1	1194	131	102.9	15	10
16918	74	2157	1020	1	1194	145.9	108.7	20	5
16919	74	2127	1020	1	1194	140.1	131.2	30	22
16920	74	2981	1020	1	1194	121.7	0	0	2
16921	74	2982	1020	1	1194	129.8	0	0	4
16922	74	2983	1020	1	1194	144.8	0	0	1
16923	74	2984	1020	1	1194	139	0	0	1
16924	74	2191	1020	1	1194	129	118.3	35	15
16925	74	2128	1020	1	1194	121.7	83.4	35	15
16926	74	2875	1020	1	1194	122.7	64.5	20	5
16927	74	2129	1020	1	1194	110.1	90.4	20	5
16928	74	2311	1020	1	1194	79.8	60.9	20	5
16929	74	2003	1020	1	1194	173	153.8	25	10
16930	74	2130	1020	1	1194	155.1	124.6	65	8
16931	74	2985	1020	1	1194	132	0	0	2
16932	74	2986	1020	1	1194	137.2	0	0	9
16933	74	2987	1020	1	1194	144.8	0	0	3
16934	74	2988	1020	1	1194	149	0	0	2
16935	74	2989	1020	1	1194	165.6	0	0	1
16936	74	2131	1020	1	1194	109.3	73.8	40	21
16937	74	2990	1020	1	1194	82	0	0	6
16938	74	2991	1020	1	1194	78.2	0	0	2
16939	74	2992	1020	1	1194	84.3	0	0	1
16940	74	2132	1020	1	1194	105.8	80.8	30	17
16941	74	2993	1020	1	1194	93.9	0	0	1
16942	74	2994	1020	1	1194	85.3	0	0	1
16943	74	2995	1020	1	1194	82.2	0	0	1
16944	74	2446	1020	1	1194	91.4	67.7	15	10
16945	74	2315	1020	1	1194	103.6	87.4	15	6
16946	74	2996	1020	1	1194	0	0	0	2
16947	74	2997	1020	1	1194	0	0	0	2
16948	74	2133	1020	1	1194	119.1	84.3	20	5
16949	74	2170	1020	1	1194	68.5	57.9	30	20
16950	74	2134	1020	1	1194	149.2	104.2	40	10
16951	74	2135	1020	1	1194	99.3	72.8	30	14
16952	74	2998	1020	1	1194	114.4	0	0	1
16953	74	2999	1020	1	1194	72.6	0	0	3
16954	74	3000	1020	1	1194	90.2	0	0	3
16955	74	3001	1020	1	1194	76.8	0	0	6
16956	74	3002	1020	1	1194	98.5	0	0	3
16957	74	2342	1020	1	1194	70.4	65.2	30	20
16958	74	2136	1020	1	1194	107.9	83.1	25	25
16959	74	2171	1020	1	1194	89.2	71.6	15	10
16960	74	2741	1020	1	1194	116.2	86.3	15	10
16961	74	2139	1020	1	1194	147.2	109.1	68	21
16962	74	3003	1020	1	1194	125.5	0	0	9
16963	74	3004	1020	1	1194	146.9	0	0	1
16964	74	3005	1020	1	1194	137.3	0	0	3
16965	74	3006	1020	1	1194	121.5	0	0	3
16966	74	2202	1020	1	1194	74.5	58.2	35	15
16967	74	2141	1020	1	1194	83.1	67.6	30	20
16968	74	2204	1020	1	1194	0	0	0	1
16969	74	2205	1020	1	1194	99.5	60	20	4
16970	74	2206	1020	1	1194	76.8	64.1	30	20
16971	74	2144	1020	1	1194	114.5	90.7	60	40
16972	74	2211	1020	1	1194	71.3	58.2	30	20
16973	74	2147	1020	1	1194	94.9	77	15	10
16974	74	2179	1020	1	1194	106.2	79	15	10
16975	74	2154	1020	1	1194	173.1	148.8	20	6
16976	74	3007	1020	1	1194	140.4	0	0	1
16977	74	3008	1020	1	1194	132.2	0	0	2
16978	74	3009	1020	1	1194	172	0	0	1
16979	74	2746	1020	1	1194	81	67.7	15	15
16980	74	2124	1020	1	1195	0	86	50	0
16981	74	2127	1020	1	1195	0	115.2	25	0
16982	74	2130	1020	1	1195	0	117.3	25	0
16983	74	2132	1020	1	1195	0	73.1	50	0
16984	74	2134	1020	1	1195	0	92.5	25	0
16985	74	2139	1020	1	1195	0	86.1	50	0
16986	74	2144	1020	1	1195	0	84	50	0
16987	74	2124	1020	1	1196	0	83	25	0
16988	74	2127	1020	1	1196	0	122.4	25	0
16989	74	2130	1020	1	1196	0	115.2	25	0
16990	74	2131	1020	1	1196	0	67	25	0
16991	74	2132	1020	1	1196	0	71.9	25	0
16992	74	2135	1020	1	1196	0	64.2	25	0
16993	74	2139	1020	1	1196	0	86.9	25	0
16994	74	2144	1020	1	1196	0	80.9	50	0
16995	74	2154	1020	1	1196	0	113.2	50	0
16996	74	2124	1021	1	1194	80.4	60.1	10	5
16997	74	2127	1021	1	1194	109.9	104.9	10	5
16998	74	2014	1021	1	1194	149	112.5	15	3
16999	74	3010	1021	1	1194	76.6	0	0	7
17000	74	2131	1021	1	1194	71.7	56.7	15	5
17001	74	2135	1021	1	1194	71.4	56.7	10	5
17002	74	2139	1021	1	1194	92.9	67.2	12	8
17003	74	2154	1021	1	1194	99.5	73.7	10	5
17004	75	2017	1022	1	1197	130.2	119.5	35	15
17005	75	2018	1022	1	1197	140.6	115.4	35	5
17006	75	2762	1022	1	1197	104.8	0	0	10
17007	75	2134	1022	1	1197	130.8	84.8	20	5
17008	75	2023	1022	1	1197	77.9	64.2	35	15
17009	75	2024	1022	1	1197	106.1	85	35	15
17010	75	2027	1022	1	1197	127.1	90.5	40	10
17011	75	2031	1022	1	1197	139.1	115.3	40	10
17012	75	2032	1022	1	1197	124.3	79.6	40	7
17013	75	3011	1022	1	1197	108.2	0	0	1
17014	75	3012	1022	1	1197	113.3	0	0	1
17015	75	3013	1022	1	1197	81.8	0	0	1
17016	75	2013	1022	1	1197	165.3	137.3	35	15
17017	75	2018	1022	1	1198	0	69.2	50	0
17018	75	2024	1022	1	1198	0	81.3	50	0
17019	75	2036	1023	1	1197	130.8	112.2	15	10
17020	77	2157	1024	1	1199	130.1	93.8	20	5
17021	77	2127	1024	1	1199	129	116	35	15
17022	77	2452	1024	1	1199	106.1	79	20	5
17023	77	2018	1024	1	1199	124.7	108.2	35	13
17024	77	3014	1024	1	1199	90.1	0	0	1
17025	77	3015	1024	1	1199	117.4	0	0	1
17026	77	2158	1024	1	1199	126	87.4	20	5
17027	77	2130	1024	1	1199	138.1	117.3	30	15
17028	77	3016	1024	1	1199	74.9	0	0	2
17029	77	3017	1024	1	1199	139.3	0	0	1
17030	77	3018	1024	1	1199	140.2	0	0	2
17031	77	2131	1024	1	1199	84.9	68.2	30	20
17032	77	2134	1024	1	1199	130.2	93.4	30	20
17033	77	2021	1024	1	1199	132.9	118.1	40	10
17034	77	2135	1024	1	1199	74.5	64.1	30	20
17035	77	2342	1024	1	1199	68.2	58.7	40	10
17036	77	3019	1024	1	1199	88.3	70.6	30	20
17037	77	2024	1024	1	1199	96.6	77.8	55	20
17038	77	2139	1024	1	1199	115.6	87.2	30	20
17039	77	2027	1024	1	1199	117.6	85.1	30	20
17040	77	2321	1024	1	1199	126.7	83.4	20	5
17041	77	2030	1024	1	1199	120.9	99.9	15	10
17042	77	2032	1024	1	1199	120.5	69.4	40	10
17043	77	2213	1024	1	1199	68.3	59.9	20	5
17044	77	2160	1024	1	1199	71.3	61.9	35	15
17045	77	2154	1024	1	1199	152.6	116.4	15	10
17046	77	2155	1024	1	1199	145.9	121.3	20	5
17047	77	2013	1024	1	1199	166.5	144.1	30	10
17048	77	3020	1024	1	1199	68.4	0	0	2
17049	77	3021	1024	1	1199	172.9	0	0	2
17050	77	3022	1024	1	1199	164.9	0	0	2
17051	77	3023	1024	1	1199	128.3	0	0	4
17052	77	2157	1024	1	1200	0	70.5	25	0
17053	77	2127	1024	1	1200	0	113.1	25	0
17054	77	2018	1024	1	1200	0	69.4	50	0
17055	77	2158	1024	1	1200	0	68.4	50	0
17056	77	2134	1024	1	1200	0	71.6	50	0
17057	77	2138	1024	1	1200	0	74.7	25	0
17058	77	2024	1024	1	1200	0	80.7	50	0
17059	77	2321	1024	1	1200	0	67.3	25	0
17060	77	2030	1024	1	1200	0	71.7	25	0
17061	77	2154	1024	1	1200	0	103.1	25	0
17062	77	2024	1025	1	1199	68.4	58.8	20	5
17063	77	2036	1025	1	1199	127.9	105.9	35	6
17064	77	3024	1025	1	1199	68.5	0	0	1
17065	77	3025	1025	1	1199	132.3	0	0	2
17066	77	3026	1025	1	1199	146.4	0	0	1
17067	77	3027	1025	1	1199	101.7	0	0	5
17068	80	2336	1026	1	1201	69.1	57.5	25	7
17069	80	3028	1026	1	1201	135.9	87.3	30	5
17070	80	2157	1026	1	1201	162	107.4	47	3
17071	80	3029	1026	1	1201	132.2	69.8	30	3
17072	80	2158	1026	1	1201	145.9	98.3	65	10
17073	80	2133	1026	1	1201	106.5	68.7	30	3
17074	80	3030	1026	1	1201	130	60.2	30	3
17075	80	2542	1026	1	1201	143.9	86.3	45	5
17076	80	2134	1026	1	1201	164.6	109.2	95	5
17077	80	2739	1026	1	1201	163.6	107.6	30	3
17078	80	2546	1026	1	1201	136.1	95.6	30	5
17079	80	2319	1026	1	1201	144.8	89.2	47	3
17080	80	2140	1026	1	1201	131.7	75.2	30	3
17081	80	2174	1026	1	1201	139.7	86.7	68	7
17082	80	2321	1026	1	1201	145	101.2	30	7
17083	80	2155	1026	1	1201	164.7	132.3	65	10
17084	80	2336	1026	1	1202	0	56.7	50	0
17085	80	3028	1026	1	1202	0	72	50	0
17086	80	2157	1026	1	1202	0	86.3	25	0
17087	80	2158	1026	1	1202	0	83.6	25	0
17088	80	2133	1026	1	1202	0	66.1	50	0
17089	80	2542	1026	1	1202	0	75.1	50	0
17090	80	2134	1026	1	1202	0	103.1	25	0
17091	80	2546	1026	1	1202	0	77	50	0
17092	80	2319	1026	1	1202	0	73.8	50	0
17093	80	2140	1026	1	1202	0	68.5	50	0
17094	80	2174	1026	1	1202	0	76.9	50	0
17095	80	2321	1026	1	1202	0	80.1	25	0
17096	80	2155	1026	1	1202	0	117.5	25	0
17097	80	2336	1026	1	1203	0	56.8	50	0
17098	80	3028	1026	1	1203	0	70.8	50	0
17099	80	2157	1026	1	1203	0	94.9	25	0
17100	80	2158	1026	1	1203	0	87.2	25	0
17101	80	2133	1026	1	1203	0	61.4	50	0
17102	80	2542	1026	1	1203	0	75	50	0
17103	80	2134	1026	1	1203	0	99.9	25	0
17104	80	2546	1026	1	1203	0	77.7	50	0
17105	80	2319	1026	1	1203	0	70.6	50	0
17106	80	2140	1026	1	1203	0	64.1	50	0
17107	80	2174	1026	1	1203	0	70.8	50	0
17108	80	2321	1026	1	1203	0	82.7	25	0
17109	80	2155	1026	1	1203	0	121.6	25	0
17110	80	2336	1027	1	1201	0	60.8	15	3
17111	80	3028	1027	1	1201	0	59.9	15	0
17112	80	2157	1027	1	1201	136.8	87.4	23	2
17113	80	3029	1027	1	1201	121.1	64.2	15	2
17114	80	2158	1027	1	1201	123.3	86.8	20	5
17115	80	2133	1027	1	1201	94.6	68.4	15	2
17116	80	3030	1027	1	1201	122.4	61.1	15	2
17117	80	2134	1027	1	1201	134.8	88.6	45	5
17118	80	2739	1027	1	1201	136.6	104.7	15	2
17119	80	2546	1027	1	1201	0	79.3	15	0
17120	80	2319	1027	1	1201	122.6	75.1	23	2
17121	80	2140	1027	1	1201	120.9	76.9	15	2
17122	80	2174	1027	1	1201	123.5	84.4	22	3
17123	80	2321	1027	1	1201	131.5	100.3	10	3
17124	80	2155	1027	1	1201	125.5	92.8	20	5
17125	80	2157	1027	1	1202	0	76.6	25	0
17126	80	2158	1027	1	1202	0	72.8	25	0
17127	80	2134	1027	1	1202	0	85	25	0
17128	80	2321	1027	1	1202	0	73.8	25	0
17129	80	2155	1027	1	1202	0	71.7	25	0
17130	80	2157	1027	1	1203	0	70.9	25	0
17131	80	2158	1027	1	1203	0	69.2	25	0
17132	80	2134	1027	1	1203	0	70.5	25	0
17133	80	2321	1027	1	1203	0	67.2	25	0
17134	80	2155	1027	1	1203	0	66.2	25	0
17135	81	3031	1028	1	1204	68.6	56.7	30	20
17136	81	2191	1028	1	1204	107.1	92.5	45	30
17137	81	2193	1028	1	1204	86.4	63.8	60	15
17138	81	2194	1028	1	1204	68.4	56.7	30	20
17139	81	2195	1028	1	1204	98.9	85	15	10
17140	81	2129	1028	1	1204	71.3	64	30	20
17141	81	2198	1028	1	1204	91.7	63.1	55	20
17142	81	2204	1028	1	1204	0	0	0	4
17143	81	2205	1028	1	1204	68.2	57.7	30	16
17144	81	2206	1028	1	1204	69.2	58.2	15	10
17145	81	3032	1028	1	1204	68.3	56.7	30	20
17146	81	2211	1028	1	1204	82	69.2	15	10
17147	81	2212	1028	1	1204	69.4	58.8	35	15
17148	81	2213	1028	1	1204	69.5	56.7	35	15
17149	81	2332	1028	1	1204	71.5	57.7	15	10
17150	81	2218	1028	1	1204	68.1	59.8	15	10
17151	81	3033	1028	1	1204	94.3	74.9	15	10
17152	81	3034	1028	1	1204	97.5	83	25	25
17153	81	3035	1028	1	1204	110.3	93.5	30	20
17154	81	2221	1028	1	1204	94.4	80.5	90	110
17155	81	3036	1028	1	1204	93	77.9	25	25
17156	81	2223	1028	1	1204	68.2	56.7	70	55
17157	81	3037	1028	1	1204	69.3	58.7	30	20
17158	81	3031	1028	1	1205	0	66.3	25	0
17159	81	2191	1028	1	1205	0	88.4	25	0
17160	81	2193	1028	1	1205	0	65.2	50	0
17161	81	2194	1028	1	1205	0	62.9	25	0
17162	81	2129	1028	1	1205	0	68.5	25	0
17163	81	2198	1028	1	1205	0	65.3	50	0
17164	81	2852	1028	1	1205	0	68.4	25	0
17165	81	2213	1028	1	1205	0	63.9	25	0
17166	81	3034	1028	1	1205	0	75.5	25	0
17167	81	3035	1028	1	1205	0	83.8	25	0
17168	81	3036	1028	1	1205	0	73.6	50	0
17169	81	2223	1028	1	1205	0	68	25	0
17170	81	3037	1028	1	1205	0	64.5	25	0
17171	81	2213	1029	1	1204	68.1	57.1	20	5
17172	81	3034	1029	1	1204	82.3	58.1	20	5
17173	81	2221	1029	1	1204	84.4	56.8	40	10
17174	81	3036	1029	1	1204	78.7	57.3	20	5
17175	82	3031	1030	1	1206	85.7	57.7	20	5
17176	82	2158	1030	1	1206	78	60.9	15	10
17177	82	2221	1030	1	1206	84.8	69.8	20	8
17178	82	3038	1030	1	1206	74.5	0	0	1
17179	82	3039	1030	1	1206	0	0	0	1
17180	82	3040	1030	1	1206	0	0	0	1
17181	82	3041	1030	1	1206	0	0	0	1
17182	82	2223	1030	1	1206	87.5	62.1	12	5
17183	82	3042	1030	1	1206	72.7	0	0	1
17184	82	3043	1030	1	1206	0	0	0	1
17185	82	3044	1030	1	1206	0	0	0	1
17186	83	3031	1031	1	1208	69.6	56.7	15	10
17187	83	2191	1031	1	1208	111.5	92.3	35	15
17188	83	2193	1031	1	1208	99.8	66.5	20	5
17189	83	2195	1031	1	1208	100.5	81.5	15	10
17190	83	2129	1031	1	1208	70.7	64	15	10
17191	83	2198	1031	1	1208	88	62.2	20	5
17192	83	2205	1031	1	1208	70.4	57.5	15	8
17193	83	3032	1031	1	1208	72.2	56.7	35	15
17194	83	2211	1031	1	1208	79.8	63.3	15	10
17195	83	3034	1031	1	1208	96	75.8	15	10
17196	83	3035	1031	1	1208	115.1	94.5	15	10
17197	83	2221	1031	1	1208	109.1	86.3	30	20
17198	83	3036	1031	1	1208	97.5	79.7	15	10
17199	83	2223	1031	1	1208	68.5	59	30	20
17200	83	3045	1031	1	1208	73.3	59.7	20	5
17201	83	3031	1031	1	1209	0	59.2	50	0
17202	83	2193	1031	1	1209	0	63.1	50	0
17203	83	2195	1031	1	1209	0	64.4	50	0
17204	83	2198	1031	1	1209	0	61.7	50	0
17205	83	3032	1031	1	1209	0	59.7	50	0
17206	83	3034	1031	1	1209	0	67.3	50	0
17207	83	3035	1031	1	1209	0	69.5	50	0
17208	83	3036	1031	1	1209	0	66.9	50	0
17209	83	2223	1031	1	1209	0	62.1	50	0
17210	83	2191	1031	1	1210	0	73.7	50	0
17211	83	2193	1031	1	1210	0	62.3	50	0
17212	83	2198	1031	1	1210	0	62.3	50	0
17213	83	3032	1031	1	1210	0	58.8	50	0
17214	83	2223	1031	1	1210	0	59.8	50	0
17215	83	2221	1032	1	1208	78.2	62.1	20	5
17216	84	2189	1033	1	1211	75.6	56.8	55	20
17217	84	2190	1033	1	1211	70.5	56.7	55	20
17218	84	2401	1033	1	1211	71.3	60	15	10
17219	84	2192	1033	1	1211	91.2	69.6	17	8
17220	84	2193	1033	1	1211	111.2	79	20	5
17221	84	2195	1033	1	1211	97.4	77.1	40	10
17222	84	2197	1033	1	1211	84.1	56.8	20	5
17223	84	2199	1033	1	1211	81.2	57.7	40	10
17224	84	2202	1033	1	1211	73.6	56.8	40	10
17225	84	2204	1033	1	1211	0	0	0	3
17226	84	2205	1033	1	1211	84.8	56.7	60	12
17227	84	2206	1033	1	1211	68.1	57.7	55	20
17228	84	2211	1033	1	1211	74.1	57.7	35	15
17229	84	2212	1033	1	1211	72.2	60	40	10
17230	84	2213	1033	1	1211	68.6	56.8	35	15
17231	84	2221	1033	1	1211	99.4	71.7	40	10
17232	84	2223	1033	1	1211	87	60	20	5
17233	84	2190	1033	1	1212	0	69.6	25	0
17234	84	2192	1033	1	1212	0	66.5	25	0
17235	84	2193	1033	1	1212	0	71.4	25	0
17236	84	2197	1033	1	1212	0	66.5	25	0
17237	84	2202	1033	1	1212	0	67.7	25	0
17238	84	2205	1033	1	1212	0	67.2	25	0
17239	84	2212	1033	1	1212	0	65.1	25	0
17240	84	2213	1033	1	1212	0	63.1	25	0
17241	84	2221	1033	1	1212	0	71.3	25	0
17242	84	2223	1033	1	1212	0	63	25	0
17243	84	2192	1033	1	1213	0	63.9	25	0
17244	84	2193	1033	1	1213	0	68.3	25	0
17245	85	2017	1034	1	1214	130	116.3	45	27
17246	85	3046	1034	1	1214	117	0	0	1
17247	85	3047	1034	1	1214	132.9	0	0	1
17248	85	3048	1034	1	1214	139.2	0	0	1
17249	85	2018	1034	1	1214	126	110.2	60	40
17250	85	2019	1034	1	1214	87	66.6	55	15
17251	85	3049	1034	1	1214	0	0	0	2
17252	85	3050	1034	1	1214	89.5	0	0	1
17253	85	3051	1034	1	1214	70.3	0	0	2
17254	85	2020	1034	1	1214	101.1	77	30	15
17255	85	3052	1034	1	1214	0	0	0	1
17256	85	3053	1034	1	1214	103.9	0	0	1
17257	85	3054	1034	1	1214	120.4	0	0	1
17258	85	3055	1034	1	1214	107	0	0	1
17259	85	3056	1034	1	1214	116.3	0	0	1
17260	85	2021	1034	1	1214	139	130.3	25	25
17261	85	2022	1034	1	1214	145.4	76.7	20	5
17262	85	2023	1034	1	1214	75	65.3	30	20
17263	85	2024	1034	1	1214	102	79.4	90	30
17264	85	2025	1034	1	1214	94.7	79	35	15
17265	85	2026	1034	1	1214	104.4	67.4	20	5
17266	85	2009	1034	1	1214	155.8	131.2	35	15
17267	85	2027	1034	1	1214	120.8	90.5	45	18
17268	85	3057	1034	1	1214	70.7	0	0	2
17269	85	3058	1034	1	1214	122.9	0	0	1
17270	85	3059	1034	1	1214	92.4	0	0	1
17271	85	3060	1034	1	1214	121.6	0	0	2
17272	85	3061	1034	1	1214	100.9	0	0	1
17273	85	3062	1034	1	1214	85.9	0	0	5
17274	85	2029	1034	1	1214	143.7	97.9	35	10
17275	85	3063	1034	1	1214	85.4	0	0	1
17276	85	3064	1034	1	1214	135.3	0	0	1
17277	85	3065	1034	1	1214	146.7	0	0	1
17278	85	3066	1034	1	1214	109.4	0	0	2
17279	85	2030	1034	1	1214	153.7	137.4	15	10
17280	85	2031	1034	1	1214	141.4	116.4	60	11
17281	85	3067	1034	1	1214	73.7	0	0	1
17282	85	3068	1034	1	1214	140.4	0	0	1
17283	85	3069	1034	1	1214	138.5	0	0	2
17284	85	2032	1034	1	1214	122	81.9	35	13
17285	85	3070	1034	1	1214	85.3	0	0	1
17286	85	3071	1034	1	1214	114.4	0	0	1
17287	85	2144	1034	1	1214	119.4	86	20	5
17288	85	2033	1034	1	1214	152.1	113.4	55	16
17289	85	3072	1034	1	1214	100.8	0	0	1
17290	85	3073	1034	1	1214	160.1	0	0	1
17291	85	3074	1034	1	1214	145.9	0	0	1
17292	85	3075	1034	1	1214	146.7	0	0	1
17293	85	2034	1034	1	1214	145.2	117.1	35	15
17294	85	2035	1034	1	1214	72.3	64.9	50	25
17295	85	2013	1034	1	1214	172.8	144.3	55	8
17296	85	3076	1034	1	1214	165.2	0	0	1
17297	85	3077	1034	1	1214	170.8	0	0	2
17298	85	3078	1034	1	1214	173	0	0	1
17299	85	3079	1034	1	1214	157	0	0	2
17300	85	3080	1034	1	1214	170.5	0	0	1
17301	85	3081	1034	1	1214	165.1	0	0	1
17302	85	3023	1034	1	1214	147.1	0	0	4
17303	85	2397	1034	1	1214	83.1	61.1	32	18
17304	85	2018	1034	1	1215	0	71.4	125	0
17305	85	2021	1034	1	1215	0	57.1	100	0
17306	85	2024	1034	1	1215	0	79.7	100	0
17307	85	2030	1034	1	1215	0	87.9	25	0
17308	85	2034	1034	1	1215	0	58.2	25	0
17309	85	2035	1034	1	1215	0	57.8	50	0
17310	85	2024	1034	1	1216	0	76.3	50	0
17311	85	2018	1035	1	1214	87.4	69.4	20	5
17312	85	2036	1035	1	1214	131.1	108.1	45	20
17313	85	3082	1035	1	1214	134.3	0	0	1
17314	85	3083	1035	1	1214	142.3	0	0	1
17315	85	3084	1035	1	1214	108.2	0	0	1
17316	85	3085	1035	1	1214	98.8	0	0	5
17317	85	3086	1035	1	1214	122.6	0	0	2
17318	85	2013	1035	1	1214	152.4	119.9	20	5
17319	86	2778	1036	1	1217	141.3	113.1	45	5
17320	86	2124	1036	1	1217	131.2	92.4	35	15
17321	86	2309	1036	1	1217	147.7	106.8	20	5
17322	86	2127	1036	1	1217	129	114.1	50	25
17323	86	2158	1036	1	1217	142.1	102.1	20	5
17324	86	2128	1036	1	1217	98.4	72.6	30	20
17325	86	2516	1036	1	1217	91.5	75.9	20	5
17326	86	3087	1036	1	1217	136.6	110.5	15	10
17327	86	2129	1036	1	1217	87.5	72.6	20	5
17328	86	2002	1036	1	1217	97.9	73.8	15	10
17329	86	2003	1036	1	1217	178.5	153.7	40	10
17330	86	2130	1036	1	1217	144.6	121.7	75	25
17331	86	2131	1036	1	1217	92.3	68.4	65	10
17332	86	2132	1036	1	1217	111.9	77.8	40	10
17333	86	2008	1036	1	1217	158.2	136.8	15	10
17334	86	2315	1036	1	1217	101.1	73.5	65	6
17335	86	3088	1036	1	1217	0	0	0	2
17336	86	3089	1036	1	1217	0	0	0	2
17337	86	2134	1036	1	1217	147	113.6	40	10
17338	86	2135	1036	1	1217	92.2	64.1	85	5
17339	86	3090	1036	1	1217	93.7	0	0	1
17340	86	3091	1036	1	1217	100.3	0	0	1
17341	86	3092	1036	1	1217	69.1	0	0	3
17342	86	3093	1036	1	1217	73.3	0	0	3
17343	86	3094	1036	1	1217	76.8	0	0	2
17344	86	2136	1036	1	1217	103.9	74.9	55	20
17345	86	3019	1036	1	1217	110.2	77.5	30	20
17346	86	2545	1036	1	1217	88.7	76.7	20	5
17347	86	3095	1036	1	1217	68.5	56.8	40	10
17348	86	2139	1036	1	1217	124.9	90.3	85	29
17349	86	3096	1036	1	1217	123.9	0	0	1
17350	86	3097	1036	1	1217	128.2	0	0	1
17351	86	3098	1036	1	1217	126	0	0	1
17352	86	3099	1036	1	1217	120.7	0	0	2
17353	86	3100	1036	1	1217	114	0	0	1
17354	86	3101	1036	1	1217	126.7	0	0	1
17355	86	3102	1036	1	1217	100.6	0	0	4
17356	86	2172	1036	1	1217	68	56.7	40	10
17357	86	2321	1036	1	1217	147	107.6	20	5
17358	86	2322	1036	1	1217	68.2	57.9	35	15
17359	86	2580	1036	1	1217	105.7	75.7	20	5
17360	86	2550	1036	1	1217	71.4	57.8	40	10
17361	86	2144	1036	1	1217	126.4	85	65	10
17362	86	2214	1036	1	1217	141.7	95.8	20	5
17363	86	2327	1036	1	1217	158.4	69.5	20	5
17364	86	2151	1036	1	1217	142.5	102.9	20	5
17365	86	2152	1036	1	1217	154	128.6	20	5
17366	86	2153	1036	1	1217	136.2	79.8	20	5
17367	86	2330	1036	1	1217	105.1	58.4	20	5
17368	86	2745	1036	1	1217	93.7	78.8	15	10
17369	86	2154	1036	1	1217	161.6	125.6	60	15
17370	86	2011	1036	1	1217	165.5	140.2	15	10
17371	86	2879	1036	1	1217	85.2	77.2	15	10
17372	86	2155	1036	1	1217	156.5	129	20	5
17373	86	3103	1036	1	1217	69.1	58.8	35	15
17374	86	2334	1036	1	1217	181.3	158.5	45	5
17375	86	2127	1036	1	1218	0	105.7	75	0
17376	86	2158	1036	1	1218	0	77.7	25	0
17377	86	2130	1036	1	1218	0	110.9	100	0
17378	86	2132	1036	1	1218	0	74.4	25	0
17379	86	2335	1036	1	1218	0	58.5	75	0
17380	86	2134	1036	1	1218	0	81.1	50	0
17381	86	2139	1036	1	1218	0	81	100	0
17382	86	2321	1036	1	1218	0	79	25	0
17383	86	2580	1036	1	1218	0	72.5	25	0
17384	86	2550	1036	1	1218	0	64.1	50	0
17385	86	2214	1036	1	1218	0	71.5	25	0
17386	86	2154	1036	1	1218	0	106.9	75	0
17387	86	2155	1036	1	1218	0	101.8	25	0
17388	86	2334	1036	1	1218	0	146.6	50	0
17389	86	2127	1036	1	1219	0	103.8	50	0
17390	86	2131	1036	1	1219	0	60.8	50	0
17391	86	2135	1036	1	1219	0	59.1	50	0
17392	86	2014	1037	1	1217	125.1	93	40	10
17393	87	2156	1038	1	1220	78.3	67.7	30	20
17394	87	2129	1038	1	1220	74.5	65.2	15	10
17395	87	2166	1038	1	1220	92	65.3	55	20
17396	87	2167	1038	1	1220	69.2	61.7	15	10
17397	87	2552	1038	1	1220	68.2	58.9	15	10
17398	87	2435	1038	1	1220	91.3	68.6	20	5
17399	87	2196	1038	1	1220	69	60	15	10
17400	87	2541	1038	1	1220	72.8	63	20	5
17401	87	2342	1038	1	1220	68.1	58.8	50	25
17402	87	2559	1038	1	1220	68.1	59.7	20	5
17403	87	2560	1038	1	1220	68.6	59.1	40	10
17404	87	2859	1038	1	1220	72.7	57.8	20	5
17405	87	2176	1038	1	1220	68.6	57	20	5
17406	87	2348	1038	1	1220	68.3	62.8	25	25
17407	87	2143	1038	1	1220	69.3	59.8	30	20
17408	87	2160	1038	1	1220	83.3	64.8	30	20
17409	87	2161	1038	1	1220	68.5	57.8	30	20
17410	87	2216	1038	1	1220	68.4	57.9	15	10
17411	87	2180	1038	1	1220	70	58.6	15	10
17412	87	2861	1038	1	1220	69.9	60.1	20	5
17413	87	2182	1038	1	1220	69.3	60.7	30	20
17414	87	2188	1038	1	1220	93.2	74.4	15	10
17415	87	2184	1038	1	1220	88.6	70.3	20	5
17416	87	2185	1038	1	1220	68.3	56.9	35	15
17417	87	2186	1038	1	1220	92.3	70.3	40	10
17418	87	2187	1038	1	1220	80.6	65	70	30
17419	87	2129	1038	1	1221	0	66.8	25	0
17420	87	2166	1038	1	1221	0	66.5	75	0
17421	87	2167	1038	1	1221	0	64.3	25	0
17422	87	2552	1038	1	1221	0	63.2	25	0
17423	87	2435	1038	1	1221	0	66.3	25	0
17424	87	2541	1038	1	1221	0	63.1	25	0
17425	87	2342	1038	1	1221	0	61.7	50	0
17426	87	2559	1038	1	1221	0	64.2	25	0
17427	87	2560	1038	1	1221	0	64.1	50	0
17428	87	2348	1038	1	1221	0	66.1	50	0
17429	87	2143	1038	1	1221	0	60	50	0
17430	87	2160	1038	1	1221	0	63.9	50	0
17431	87	2216	1038	1	1221	0	62.5	25	0
17432	87	2181	1038	1	1221	0	63	25	0
17433	87	2182	1038	1	1221	0	61.9	50	0
17434	87	2188	1038	1	1221	0	67.5	25	0
17435	87	2184	1038	1	1221	0	65.3	25	0
17436	87	2185	1038	1	1221	0	63.2	25	0
17437	87	2186	1038	1	1221	0	66	50	0
17438	87	2187	1038	1	1221	0	64.1	100	0
17439	88	2156	1039	1	1222	118.9	81.1	45	15
17440	88	2894	1039	1	1222	76.9	60	45	15
17441	88	2895	1039	1	1222	169.7	160.1	30	10
17442	88	2518	1039	1	1222	148.6	71.8	30	10
17443	88	2896	1039	1	1222	72.6	56.7	45	15
17444	88	3104	1039	1	1222	95.6	69.1	35	10
17445	88	2134	1039	1	1222	158.3	115.5	18	7
17446	88	2897	1039	1	1222	131	86.9	18	7
17447	88	2898	1039	1	1222	70.7	56.8	60	20
17448	88	2174	1039	1	1222	151.2	107.4	18	7
17449	88	2878	1039	1	1222	143.5	94.8	30	10
17450	88	2902	1039	1	1222	136.4	84.1	60	20
17451	88	3105	1039	1	1222	106.1	70.5	60	20
17452	88	3106	1039	1	1222	110.2	57.6	35	10
17453	88	3107	1039	1	1223	0	75.9	75	0
17454	88	2160	1039	1	1223	0	76.8	75	0
17455	88	2350	1039	1	1223	0	68.4	50	0
17456	88	2161	1039	1	1223	0	69.3	50	0
17457	88	2156	1039	1	1224	0	65.2	75	0
17458	88	2894	1039	1	1224	0	59.7	75	0
17459	88	2895	1039	1	1224	0	63.4	50	0
17460	88	2518	1039	1	1224	0	58.6	50	0
17461	88	2896	1039	1	1224	0	56.9	50	0
17462	88	3104	1039	1	1224	0	57.5	50	0
17463	88	2134	1039	1	1224	0	83.2	50	0
17464	88	2897	1039	1	1224	0	64.2	50	0
17465	88	2898	1039	1	1224	0	56.7	50	0
17466	88	2174	1039	1	1224	0	75.8	50	0
17467	88	3108	1039	1	1224	0	59.8	50	0
17468	88	2902	1039	1	1224	0	61.7	100	0
17469	88	3105	1039	1	1224	0	61.2	75	0
17470	88	3106	1039	1	1224	0	57.7	50	0
17471	88	2174	1039	1	1225	0	66.5	75	0
17472	88	2156	1040	1	1222	121	95.9	15	5
17473	88	2894	1040	1	1222	68.2	57	15	5
17474	88	2895	1040	1	1222	162.8	137	15	5
17475	88	2518	1040	1	1222	138.1	63.6	15	5
17476	88	2896	1040	1	1222	68.6	57.6	15	5
17477	88	3104	1040	1	1222	71.4	61.3	10	5
17478	88	2134	1040	1	1222	154.1	117.8	12	3
17479	88	2897	1040	1	1222	86.3	68.6	12	3
17480	88	2898	1040	1	1222	68.6	57.5	15	5
17481	88	2174	1040	1	1222	140.8	117.8	12	3
17482	88	2902	1040	1	1222	104.9	71.6	15	5
17483	88	3105	1040	1	1222	94.3	66.8	15	5
17484	88	3106	1040	1	1222	78.1	59	10	5
17485	88	3107	1040	1	1223	0	86.6	25	0
17486	88	2160	1040	1	1223	0	72.7	25	0
17487	88	2350	1040	1	1223	0	63.3	25	0
17488	88	2161	1040	1	1223	0	66.6	25	0
17489	88	2156	1040	1	1224	0	66.7	25	0
17490	88	2894	1040	1	1224	0	56.7	25	0
17491	88	2895	1040	1	1224	0	75.7	25	0
17492	88	2518	1040	1	1224	0	0	25	0
17493	88	2897	1040	1	1224	0	56.7	25	0
17494	88	3108	1040	1	1224	0	57	25	0
17495	88	2902	1040	1	1224	0	57.8	25	0
17496	88	3105	1040	1	1224	0	56.7	25	0
17497	88	3106	1040	1	1224	0	57	25	0
17498	88	2174	1040	1	1225	0	64.6	25	0
17499	89	2536	1041	1	1226	167.8	133.4	55	20
17500	89	3109	1041	1	1226	160.5	123.9	36	14
17501	89	2126	1041	1	1226	130	103	29	21
17502	89	2128	1041	1	1226	162.5	118.8	90	35
17503	89	3110	1041	1	1226	102.8	74.1	33	17
17504	89	2166	1041	1	1226	134.2	104.2	18	7
17505	89	3111	1041	1	1226	156.3	123.5	15	10
17506	89	3112	1041	1	1226	134.3	96.3	36	14
17507	89	3113	1041	1	1226	172.1	129.8	36	14
17508	89	2137	1041	1	1226	147.4	110.5	30	20
17509	89	3114	1041	1	1226	141.7	94.2	36	14
17510	89	2138	1041	1	1226	158.1	114.4	65	35
17511	89	2545	1041	1	1226	98.9	82.1	18	7
17512	89	3115	1041	1	1226	157.2	125.1	18	7
17513	89	2741	1041	1	1226	138.7	112.2	10	15
17514	89	2177	1041	1	1226	111.3	85.1	11	14
17515	89	3116	1041	1	1226	107.1	74.6	40	10
17516	89	2498	1041	1	1226	124.1	96.4	11	14
17517	89	2214	1041	1	1226	172	139.5	16	9
17518	89	2179	1041	1	1226	159.4	105.1	36	14
17519	89	3117	1041	1	1226	130.7	91.3	18	7
17520	89	3118	1041	1	1226	135.3	87.2	51	24
17521	89	3119	1041	1	1226	92.5	62.2	51	24
17522	89	3120	1041	1	1226	142.4	104.9	40	35
17523	89	3121	1041	1	1226	109.9	71.5	33	17
17524	89	3122	1041	1	1226	119.6	78.2	33	17
17525	89	2536	1041	1	1227	0	99.8	75	0
17526	89	3109	1041	1	1227	0	95.7	50	0
17527	89	2126	1041	1	1227	0	75.8	75	0
17528	89	2128	1041	1	1227	0	92.4	75	0
17529	89	3111	1041	1	1227	0	85.9	50	0
17530	89	3113	1041	1	1227	0	90.6	75	0
17531	89	2137	1041	1	1227	0	88.1	25	0
17532	89	3114	1041	1	1227	0	73.9	25	0
17533	89	2138	1041	1	1227	0	92.7	25	0
17534	89	2545	1041	1	1227	0	74.4	50	0
17535	89	2214	1041	1	1227	0	107.4	50	0
17536	89	3118	1041	1	1227	0	76.1	25	0
17537	89	3119	1041	1	1227	0	70.5	25	0
17538	89	3120	1041	1	1227	0	77.7	50	0
17539	89	3121	1041	1	1227	0	69.4	25	0
17540	89	3122	1041	1	1227	0	68.6	25	0
17541	89	2128	1041	1	1228	0	69.2	100	0
17542	89	2137	1041	1	1228	0	64	50	0
17543	89	3114	1041	1	1228	0	65	50	0
17544	89	2138	1041	1	1228	0	64.5	75	0
17545	89	2536	1042	1	1226	123.8	84	15	10
17546	89	3109	1042	1	1226	148.1	126.6	19	6
17547	89	2126	1042	1	1226	80.2	63.4	16	9
17548	89	2128	1042	1	1226	124	86.6	35	15
17549	89	3110	1042	1	1226	68.3	56.8	17	8
17550	89	2166	1042	1	1226	90.4	60.4	22	3
17551	89	3111	1042	1	1226	147	114.7	20	5
17552	89	3112	1042	1	1226	88.5	67.3	19	6
17553	89	3113	1042	1	1226	131.4	88.5	19	6
17554	89	2137	1042	1	1226	105	80.3	15	10
17555	89	3114	1042	1	1226	102	70.8	19	6
17556	89	2138	1042	1	1226	113.6	77	35	15
17557	89	2545	1042	1	1226	86.6	58.1	22	3
17558	89	3115	1042	1	1226	151.2	120.4	22	3
17559	89	2741	1042	1	1226	84.6	59.6	15	10
17560	89	2177	1042	1	1226	88.9	58	19	6
17561	89	3116	1042	1	1226	68.5	60.1	20	5
17562	89	2498	1042	1	1226	82	62	19	6
17563	89	2214	1042	1	1226	155.2	126.4	19	6
17564	89	2179	1042	1	1226	119.6	79.3	19	6
17565	89	3117	1042	1	1226	104.4	58.2	22	3
17566	89	3118	1042	1	1226	82.3	67.4	14	11
17567	89	3119	1042	1	1226	68.3	56.8	14	11
17568	89	3120	1042	1	1226	87.5	61.3	35	15
17569	89	3121	1042	1	1226	68.6	57.1	17	8
17570	89	3122	1042	1	1226	72.4	58.2	17	8
17571	89	2536	1042	1	1227	0	70.3	25	0
17572	89	3109	1042	1	1227	0	103.2	25	0
17573	89	2126	1042	1	1227	0	68.2	25	0
17574	89	2128	1042	1	1227	0	75.2	25	0
17575	89	3111	1042	1	1227	0	85.8	25	0
17576	89	3113	1042	1	1227	0	73.8	25	0
17577	89	2137	1042	1	1227	0	70.6	25	0
17578	89	3114	1042	1	1227	0	65.3	25	0
17579	89	2138	1042	1	1227	0	71.4	25	0
17580	89	2545	1042	1	1227	0	56.8	25	0
17581	89	2214	1042	1	1227	0	104.1	25	0
17582	89	3118	1042	1	1227	0	65.7	25	0
17583	89	3119	1042	1	1227	0	58	25	0
17584	89	3120	1042	1	1227	0	66.4	25	0
17585	89	3121	1042	1	1227	0	58.9	25	0
17586	89	3122	1042	1	1227	0	61	25	0
17587	89	2128	1042	1	1228	0	58.8	50	0
17588	89	2137	1042	1	1228	0	58.7	25	0
17589	89	3114	1042	1	1228	0	56.9	25	0
17590	89	2138	1042	1	1228	0	61.1	25	0
17591	90	2536	1043	1	1229	147.8	99.9	50	10
17592	90	2126	1043	1	1229	124.9	86.3	35	5
17593	90	2128	1043	1	1229	142.5	89.7	50	10
17594	90	3113	1043	1	1229	140.6	105	15	5
17595	90	2137	1043	1	1229	138.5	84.1	50	5
17596	90	2138	1043	1	1229	129.3	87.2	95	25
17597	90	2545	1043	1	1229	77.9	69.6	15	10
17598	90	2177	1043	1	1229	84.7	61.6	15	5
17599	90	3116	1043	1	1229	95.2	72.7	15	10
17600	90	2214	1043	1	1229	159.4	113.8	15	5
17601	90	2179	1043	1	1229	120.7	75.6	15	5
17602	90	3120	1043	1	1229	123.6	71.6	50	10
17603	90	2536	1043	1	1230	0	82.9	25	0
17604	90	2128	1043	1	1230	0	78	25	0
17605	90	2137	1043	1	1230	0	71.7	25	0
17606	90	2138	1043	1	1230	0	73.8	35	0
17607	90	3116	1043	1	1230	0	69.4	25	0
17608	90	3120	1043	1	1230	0	67.5	55	0
17609	90	2128	1043	1	1231	0	61.2	70	0
17610	90	2138	1043	1	1231	0	62.1	70	0
17611	90	2536	1044	1	1229	79	62.1	15	5
17612	90	2126	1044	1	1229	68.4	57.3	15	5
17613	90	2128	1044	1	1229	88.5	69.2	15	5
17614	90	3113	1044	1	1229	84.2	66	15	5
17615	90	2137	1044	1	1229	76.1	58.7	20	5
17616	90	2138	1044	1	1229	83.3	59.2	20	5
17617	90	2177	1044	1	1229	0	57.7	10	5
17618	90	2214	1044	1	1229	124.2	100.1	15	5
17619	90	2179	1044	1	1229	75.8	61.9	10	5
17620	90	3120	1044	1	1229	69.4	58.1	15	5
17621	90	2138	1044	1	1230	0	68.2	15	0
17622	90	3120	1044	1	1230	0	65.5	20	0
17623	90	2128	1044	1	1231	0	56.7	30	0
17624	90	2138	1044	1	1231	0	56.8	30	0
17625	91	2536	1045	1	1232	121.5	86.2	12	4
17626	91	2126	1045	1	1232	113.7	66.9	12	4
17627	91	2128	1045	1	1232	133	76.6	32	6
17628	91	3111	1045	1	1232	115.9	74.4	8	2
17629	91	3113	1045	1	1232	127.6	67.6	12	4
17630	91	2137	1045	1	1232	117.7	78.9	18	6
17631	91	3114	1045	1	1232	109.2	72.4	12	4
17632	91	2138	1045	1	1232	115.5	77	18	6
17633	91	2214	1045	1	1232	137.1	84.1	12	4
17634	91	2179	1045	1	1232	99.4	67.3	8	2
17635	91	3120	1045	1	1232	109.2	67.2	16	4
17636	91	2536	1045	1	1233	0	66.3	20	0
17637	91	2128	1045	1	1233	0	68.5	20	0
17638	91	2138	1045	1	1233	0	68.3	30	0
17639	91	2214	1045	1	1233	0	69.5	20	0
17640	91	3120	1045	1	1233	0	65.5	30	0
17641	91	2128	1045	1	1234	0	61.3	30	0
17642	91	2138	1045	1	1234	0	63.4	20	0
17643	91	2536	1046	1	1232	129.1	75.9	6	2
17644	91	2126	1046	1	1232	88.3	63.2	6	2
17645	91	2128	1046	1	1232	114.2	67.7	16	3
17646	91	3111	1046	1	1232	139.9	87.1	4	1
17647	91	3113	1046	1	1232	129.1	79	6	2
17648	91	2137	1046	1	1232	97.5	63.4	9	3
17649	91	3114	1046	1	1232	91.5	63.3	6	2
17650	91	2138	1046	1	1232	108.3	65.2	9	3
17651	91	2214	1046	1	1232	152.3	109.2	6	2
17652	91	2179	1046	1	1232	119.8	61.2	4	1
17653	91	3120	1046	1	1232	93.1	58.9	8	2
17654	91	2536	1046	1	1233	0	64.3	10	0
17655	91	2128	1046	1	1233	0	63.5	10	0
17656	91	2138	1046	1	1233	0	63.9	15	0
17657	91	2214	1046	1	1233	0	72.5	10	0
17658	91	3120	1046	1	1233	0	65	15	0
17659	93	2126	1047	1	1235	97.8	77.7	30	20
17660	93	2128	1047	1	1235	124.8	83.8	50	20
17661	93	2137	1047	1	1235	103.9	79.7	30	20
17662	93	2138	1047	1	1235	108.9	81	65	35
17663	93	3116	1047	1	1235	84.7	70.6	15	10
17664	93	2214	1047	1	1235	129.8	87.6	15	10
17665	93	2439	1047	1	1235	96.9	68.2	50	20
17666	93	2138	1047	1	1236	0	72.2	100	0
17667	93	3120	1047	1	1236	0	66.4	100	0
17668	94	2536	1048	1	1237	145.6	111.1	10	10
17669	94	2126	1048	1	1237	107	70.3	28	7
17670	94	2128	1048	1	1237	131.9	94.3	60	20
17671	94	2137	1048	1	1237	119.6	79.6	45	15
17672	94	3114	1048	1	1237	113.2	82	20	15
17673	94	2138	1048	1	1237	128.7	82.2	60	15
17674	94	2214	1048	1	1237	140.7	102.1	8	7
17675	94	2179	1048	1	1237	102.1	85.3	8	7
17676	94	3120	1048	1	1237	111.4	76.9	45	15
17677	94	2126	1048	1	1238	0	70.2	35	0
17678	94	2137	1048	1	1238	0	75.7	25	0
17679	94	2138	1048	1	1238	0	78.7	25	0
17680	94	2545	1048	1	1238	0	74.7	25	0
17681	94	3120	1048	1	1238	0	70.5	35	0
17682	94	2128	1048	1	1239	0	63.9	35	0
17683	94	3123	1048	1	1239	0	66.4	35	0
17684	94	2536	1049	1	1237	90.6	73.7	5	5
17685	94	2126	1049	1	1237	74.7	58.6	12	3
17686	94	2128	1049	1	1237	87.5	68.5	15	5
17687	94	2137	1049	1	1237	81.1	61.3	15	5
17688	94	3114	1049	1	1237	72.7	58.1	10	5
17689	94	2138	1049	1	1237	71.7	57.1	15	5
17690	94	2214	1049	1	1237	132.6	109.9	7	3
17691	94	2179	1049	1	1237	83.3	58.9	7	3
17692	94	3120	1049	1	1237	73.5	56.7	15	5
17693	94	2126	1049	1	1238	0	67.1	15	0
17694	94	2137	1049	1	1238	0	67.9	15	0
17695	94	2138	1049	1	1238	0	66.5	15	0
17696	94	3120	1049	1	1238	0	66.4	15	0
17697	94	2128	1049	1	1239	0	58.8	15	0
17698	94	3123	1049	1	1239	0	59.7	15	0
17699	95	2536	1050	1	1240	120.6	85.1	30	15
17700	95	2126	1050	1	1240	106.4	82.9	20	15
17701	95	2128	1050	1	1240	128.3	88.4	30	15
17702	95	2138	1050	1	1240	114.5	80.5	50	25
17703	95	3116	1050	1	1240	90	72.7	20	10
17704	95	3120	1050	1	1240	101	75	30	15
17705	95	2128	1050	1	1241	0	63.5	75	0
17706	95	2138	1050	1	1241	0	68.4	75	0
17707	95	3120	1050	1	1241	0	68	50	0
17708	95	2128	1050	1	1242	0	56.7	100	0
17709	95	2138	1050	1	1242	0	58	100	0
17710	95	2138	1051	1	1240	93.5	68.7	20	5
17711	96	2189	1052	1	1243	88.8	71.5	60	40
17712	96	2190	1052	1	1243	76.2	58.5	90	60
17713	96	2862	1052	1	1243	106	73.7	40	10
17714	96	2191	1052	1	1243	127.3	114.1	35	15
17715	96	2192	1052	1	1243	107.4	61	65	10
17716	96	2193	1052	1	1243	124.3	83.4	45	5
17717	96	2195	1052	1	1243	109.1	88.4	55	20
17718	96	3124	1052	1	1243	81.1	67.2	35	15
17719	96	2197	1052	1	1243	74	57.9	55	20
17720	96	2198	1052	1	1243	129.4	86.3	60	15
17721	96	2199	1052	1	1243	89.4	69	55	20
17722	96	2200	1052	1	1243	127.1	78.2	45	5
17723	96	2201	1052	1	1243	124.3	87.2	40	10
17724	96	2176	1052	1	1243	68.4	61.3	35	15
17725	96	2202	1052	1	1243	83	61.9	100	50
17726	96	2203	1052	1	1243	108.1	76.9	20	5
17727	96	2143	1052	1	1243	81.4	64.1	60	15
17728	96	2204	1052	1	1243	71.7	0	0	12
17729	96	2205	1052	1	1243	75.8	62.1	70	43
17730	96	2206	1052	1	1243	75.5	60.2	110	65
17731	96	2207	1052	1	1243	106.4	73.6	17	8
17732	96	3125	1052	1	1243	83.1	58.5	18	7
17733	96	3126	1052	1	1243	94.5	65.7	17	8
17734	96	3127	1052	1	1243	96.5	62.4	18	7
17735	96	2211	1052	1	1243	89.3	66.3	60	40
17736	96	2363	1052	1	1243	82.1	64.2	60	15
17737	96	2213	1052	1	1243	68.4	59.1	60	40
17738	96	2214	1052	1	1243	143	105.3	35	15
17739	96	2332	1052	1	1243	81.9	62.2	35	15
17740	96	2218	1052	1	1243	68.3	61.1	35	15
17741	96	2219	1052	1	1243	69.4	57	45	30
17742	96	2220	1052	1	1243	141.7	130	35	15
17743	96	2221	1052	1	1243	113.4	87.4	40	10
17744	96	2222	1052	1	1243	178.4	149	47	3
17745	96	3128	1052	1	1243	78.6	58.8	35	15
17746	96	3037	1052	1	1243	68.6	58	35	15
17747	96	2225	1052	1	1243	75.7	56.7	35	15
17748	96	2189	1052	1	1244	0	72.5	50	0
17749	96	2190	1052	1	1244	0	67.3	50	0
17750	96	2862	1052	1	1244	0	70.6	50	0
17751	96	2192	1052	1	1244	0	65.9	50	0
17752	96	2193	1052	1	1244	0	74.4	50	0
17753	96	2195	1052	1	1244	0	76.6	50	0
17754	96	3124	1052	1	1244	0	66.1	50	0
17755	96	2197	1052	1	1244	0	62.2	50	0
17756	96	2198	1052	1	1244	0	69.6	75	0
17757	96	2199	1052	1	1244	0	61.8	50	0
17758	96	2200	1052	1	1244	0	70.9	50	0
17759	96	2201	1052	1	1244	0	69.6	50	0
17760	96	2176	1052	1	1244	0	64.9	25	0
17761	96	2202	1052	1	1244	0	62.4	75	0
17762	96	2143	1052	1	1244	0	66.2	50	0
17763	96	2205	1052	1	1244	0	65.3	75	0
17764	96	2206	1052	1	1244	0	62.1	100	0
17765	96	2211	1052	1	1244	0	60.6	75	0
17766	96	2213	1052	1	1244	0	62.5	75	0
17767	96	2332	1052	1	1244	0	66.2	50	0
17768	96	2218	1052	1	1244	0	65	25	0
17769	96	2219	1052	1	1244	0	61.1	50	0
17770	96	2220	1052	1	1244	0	103.7	50	0
17771	96	2221	1052	1	1244	0	69.1	75	0
17772	96	2222	1052	1	1244	0	141.5	50	0
17773	96	3128	1052	1	1244	0	63	25	0
17774	96	3037	1052	1	1244	0	59	25	0
17775	96	2225	1052	1	1244	0	61.1	25	0
17776	96	2862	1053	1	1243	72.9	62	20	5
17777	96	2198	1053	1	1243	131.8	103.4	20	5
17778	96	2205	1053	1	1243	85	62.3	20	5
17779	96	2206	1053	1	1243	69.4	60.3	20	5
17780	96	2221	1053	1	1243	96	72.5	20	5
17781	96	2222	1053	1	1243	154	135	23	2
17782	96	2192	1053	1	1244	0	72.4	25	0
17783	96	2193	1053	1	1244	0	74.7	25	0
17784	96	2198	1053	1	1244	0	72.6	25	0
17785	96	2205	1053	1	1244	0	65.4	25	0
17786	96	2221	1053	1	1244	0	66.3	25	0
17787	97	2189	1054	1	1245	88.2	70.2	15	10
17788	97	2190	1054	1	1245	69.7	56.9	30	20
17789	97	2862	1054	1	1245	78.2	64.9	15	10
17790	97	2192	1054	1	1245	86.3	61	20	5
17791	97	2193	1054	1	1245	101.1	68.9	40	10
17792	97	2195	1054	1	1245	102.5	85.9	15	10
17793	97	2198	1054	1	1245	109.4	67.4	40	10
17794	97	2202	1054	1	1245	68.2	56.7	30	20
17795	97	2204	1054	1	1245	0	0	0	1
17796	97	2205	1054	1	1245	79.6	58.5	20	4
17797	97	2206	1054	1	1245	71.5	61.8	15	10
17798	97	2211	1054	1	1245	69.2	56.7	35	15
17799	97	2212	1054	1	1245	68.7	58.1	35	15
17800	97	2213	1054	1	1245	68	56.8	35	15
17801	97	2220	1054	1	1245	137.5	120.2	15	10
17802	97	2223	1054	1	1245	68	58	15	10
17803	97	2190	1054	1	1246	0	68.9	50	0
17804	97	2193	1054	1	1246	0	66.7	50	0
17805	97	2198	1054	1	1246	0	64.9	50	0
17806	98	2163	1055	1	1247	165.9	111.4	44	6
17807	98	2536	1055	1	1247	164.6	116.7	20	5
17808	98	2157	1055	1	1247	176.4	137	73	2
17809	98	3029	1055	1	1247	0	126.6	25	0
17810	98	2452	1055	1	1247	0	118.2	50	0
17811	98	3129	1055	1	1247	161.8	125.9	22	3
17812	98	2730	1055	1	1247	169.8	118.9	20	5
17813	98	2158	1055	1	1247	176.2	132.2	92	8
17814	98	2731	1055	1	1247	163.8	106.5	45	5
17815	98	2133	1055	1	1247	166	98.8	47	3
17816	98	2542	1055	1	1247	169.1	123	22	3
17817	98	3130	1055	1	1247	163.8	112.2	20	5
17818	98	3131	1055	1	1247	159.4	110.5	45	5
17819	98	2134	1055	1	1247	179.5	145.9	170	5
17820	98	3132	1055	1	1247	142.8	77.9	45	5
17821	98	2739	1055	1	1247	178.6	157.4	68	7
17822	98	2553	1055	1	1247	0	111.2	50	0
17823	98	2546	1055	1	1247	170.4	125	45	5
17824	98	2319	1055	1	1247	170.9	121.8	47	3
17825	98	2140	1055	1	1247	158.5	109.4	22	3
17826	98	2174	1055	1	1247	170.2	125.3	47	3
17827	98	2465	1055	1	1247	165.8	130.2	20	5
17828	98	2407	1055	1	1247	165.8	119.6	45	5
17829	98	2321	1055	1	1247	172.4	124.7	69	6
17830	98	2496	1055	1	1247	161.6	114.5	40	10
17831	98	2214	1055	1	1247	175.1	142.7	22	3
17832	98	2750	1055	1	1247	170.2	122.2	27	3
17833	98	2331	1055	1	1247	161.6	92.8	70	5
17834	98	2215	1055	1	1247	153.2	97.7	25	3
17835	98	2179	1055	1	1247	157.4	92.5	22	3
17836	98	2155	1055	1	1247	0	160.3	25	0
17837	98	3133	1055	1	1247	162.9	118.2	20	5
17838	98	2163	1055	1	1248	0	93.6	30	0
17839	98	2157	1055	1	1248	0	100.1	150	0
17840	98	2452	1055	1	1248	0	112.5	25	0
17841	98	2730	1055	1	1248	0	78.6	25	0
17842	98	2158	1055	1	1248	0	105.8	75	0
17843	98	2731	1055	1	1248	0	71.7	25	0
17844	98	2133	1055	1	1248	0	75.8	25	0
17845	98	2542	1055	1	1248	0	99	25	0
17846	98	2134	1055	1	1248	0	128.6	75	0
17847	98	2739	1055	1	1248	0	141	30	0
17848	98	2553	1055	1	1248	0	87.5	25	0
17849	98	2546	1055	1	1248	0	102.1	50	0
17850	98	2319	1055	1	1248	0	105.4	30	0
17851	98	2140	1055	1	1248	0	84.2	30	0
17852	98	2174	1055	1	1248	0	101.2	30	0
17853	98	2465	1055	1	1248	0	92.8	30	0
17854	98	2407	1055	1	1248	0	83.4	25	0
17855	98	2321	1055	1	1248	0	85.1	75	0
17856	98	2214	1055	1	1248	0	107.5	25	0
17857	98	2750	1055	1	1248	0	92.3	25	0
17858	98	2331	1055	1	1248	0	82.1	75	0
17859	98	2215	1055	1	1248	0	73.8	25	0
17860	98	2155	1055	1	1248	0	131.2	30	0
17861	98	2158	1055	1	1249	0	71.2	70	0
17862	98	2134	1055	1	1249	0	72.8	110	0
17863	98	2319	1055	1	1249	0	69.5	70	0
17864	98	2163	1056	1	1247	104.8	70.7	22	3
17865	98	2157	1056	1	1247	173.1	136.6	24	1
17866	98	3029	1056	1	1247	0	114.9	25	0
17867	98	3129	1056	1	1247	160.5	127.5	23	2
17868	98	2158	1056	1	1247	161.8	123.5	45	5
17869	98	2133	1056	1	1247	155	107.4	23	2
17870	98	2542	1056	1	1247	157.6	121.1	23	2
17871	98	2134	1056	1	1247	172.4	132.6	72	3
17872	98	2739	1056	1	1247	175.1	149.9	22	3
17873	98	2319	1056	1	1247	158.7	126	23	2
17874	98	2140	1056	1	1247	149.2	112.7	23	2
17875	98	2174	1056	1	1247	166.7	131.5	23	2
17876	98	2321	1056	1	1247	161.8	120.7	47	3
17877	98	2214	1056	1	1247	161.6	123.1	23	2
17878	98	2750	1056	1	1247	161.8	117.8	19	1
17879	98	2215	1056	1	1247	157.4	117.8	20	2
17880	98	2179	1056	1	1247	125.1	64.4	23	2
17881	98	2155	1056	1	1247	0	124.2	25	0
17882	98	2163	1056	1	1248	0	68.6	20	0
17883	98	2157	1056	1	1248	0	96.9	50	0
17884	98	2158	1056	1	1248	0	108.3	25	0
17885	98	2134	1056	1	1248	0	117.1	25	0
17886	98	2739	1056	1	1248	0	125.3	20	0
17887	98	2319	1056	1	1248	0	111.8	20	0
17888	98	2140	1056	1	1248	0	84.1	20	0
17889	98	2174	1056	1	1248	0	110.7	20	0
17890	98	2465	1056	1	1248	0	104.5	20	0
17891	98	2321	1056	1	1248	0	87.2	25	0
17892	98	2750	1056	1	1248	0	90.2	25	0
17893	98	2155	1056	1	1248	0	103.2	20	0
17894	98	2158	1056	1	1249	0	69.8	30	0
17895	98	2134	1056	1	1249	0	72.4	40	0
17896	98	2319	1056	1	1249	0	70.7	30	0
17897	99	2157	1057	1	1250	151.2	110.2	20	5
17898	99	2192	1057	1	1250	86.3	61.9	20	5
17899	99	2158	1057	1	1250	154.1	92.5	45	5
17900	99	2610	1057	1	1250	109.8	62.2	45	5
17901	99	3134	1057	1	1250	122.2	82.4	20	5
17902	99	2134	1057	1	1250	166	119.7	22	3
17903	99	2321	1057	1	1250	145.2	88.7	20	5
17904	99	2214	1057	1	1250	162.7	95.8	45	5
17905	99	2750	1057	1	1250	145.2	103.1	20	5
17906	99	2331	1057	1	1250	113.6	72.6	20	5
17907	99	2157	1057	1	1251	0	82.3	25	0
17908	99	2158	1057	1	1251	0	80.2	50	0
17909	99	2134	1057	1	1251	0	97.8	25	0
17910	99	2321	1057	1	1251	0	72.3	25	0
17911	99	2750	1057	1	1251	0	81	25	0
17912	99	2134	1058	1	1250	150.3	104.5	23	2
17913	100	2163	1059	1	1252	128.1	64.2	49	1
17914	100	2157	1059	1	1252	132.5	73.4	48	2
17915	100	2158	1059	1	1252	139.7	70.8	48	2
17916	100	2134	1059	1	1252	150.3	77	48	2
17917	100	2321	1059	1	1252	155.2	71.8	24	1
17918	100	2750	1059	1	1252	148.8	72.9	24	1
17919	100	2155	1059	1	1252	0	69.1	50	0
17920	101	2778	1060	1	1253	142.5	126.7	15	10
17921	101	2130	1060	1	1253	154.3	124.9	160	40
17922	101	2802	1060	1	1253	132	111	20	5
17923	101	2539	1060	1	1253	135.6	110.5	20	5
17924	101	2320	1060	1	1253	138.1	120.6	15	10
17925	101	2877	1060	1	1253	138.5	117.2	20	5
17926	101	2031	1060	1	1253	147.3	129.9	60	40
17927	101	2144	1060	1	1253	109	87.2	30	20
17928	101	2147	1060	1	1253	90.7	74.3	35	15
17929	101	2010	1060	1	1253	109.4	74.9	20	5
17930	101	2011	1060	1	1253	170.8	151.6	60	15
17931	101	2012	1060	1	1253	102.7	71.2	15	10
17932	101	2031	1060	1	1254	0	117.5	100	0
17933	101	2597	1061	1	1253	89	58.6	75	25
17934	101	2015	1061	1	1253	133	117.5	15	10
17935	102	2017	1062	1	1255	142.3	133.1	35	15
17936	102	2018	1062	1	1255	153.5	124.9	40	10
17937	102	2230	1062	1	1255	95.9	69.3	65	10
17938	102	2019	1062	1	1255	124.8	82.9	35	20
17939	102	2020	1062	1	1255	119.4	87.2	20	15
17940	102	2021	1062	1	1255	157.2	137.4	30	5
17941	102	2022	1062	1	1255	146.4	90.9	10	5
17942	102	2023	1062	1	1255	92.3	70.5	40	20
17943	102	2024	1062	1	1255	110.9	91.3	55	20
17944	102	2025	1062	1	1255	112.6	87.6	35	15
17945	102	2027	1062	1	1255	151.9	119.6	40	35
17946	102	2028	1062	1	1255	148.8	114.9	30	20
17947	102	2405	1062	1	1255	123	104.9	15	10
17948	102	2406	1062	1	1255	130.2	99.6	30	20
17949	102	2384	1062	1	1255	110.4	70	40	5
17950	102	2385	1062	1	1255	122.2	0	0	5
17951	102	2029	1062	1	1255	161.4	118.3	20	5
17952	102	2030	1062	1	1255	154.7	118.1	45	5
17953	102	2031	1062	1	1255	147.1	125.8	55	15
17954	102	2032	1062	1	1255	153.5	115.4	17	8
17955	102	2580	1062	1	1255	123.9	92.7	28	7
17956	102	2550	1062	1	1255	106	66.2	20	5
17957	102	2486	1062	1	1255	74.6	61.7	20	5
17958	102	2144	1062	1	1255	123.6	94.4	70	30
17959	102	2033	1062	1	1255	168.8	145.7	25	10
17960	102	2034	1062	1	1255	145.4	107	40	10
17961	102	2035	1062	1	1255	84.3	67.2	40	10
17962	102	2013	1062	1	1255	173.1	158.1	55	20
17963	102	2397	1062	1	1255	82.2	57.1	15	10
17964	102	2018	1062	1	1256	0	69.2	75	0
17965	102	2021	1062	1	1256	0	137.2	25	0
17966	102	2024	1062	1	1256	0	83	100	0
17967	102	2030	1062	1	1256	0	91.7	50	0
17968	102	2032	1062	1	1256	0	90.1	25	0
17969	102	2144	1062	1	1256	0	88.3	50	0
17970	102	2033	1062	1	1256	0	112.4	25	0
17971	102	2034	1062	1	1256	0	76.8	25	0
17972	102	2035	1062	1	1256	0	56.8	50	0
17973	102	2017	1062	1	1257	0	114.5	50	0
17974	102	2018	1062	1	1257	0	111.5	25	0
17975	102	2019	1062	1	1257	0	64.9	50	0
17976	102	2020	1062	1	1257	0	68.3	50	0
17977	102	2023	1062	1	1257	0	62.8	50	0
17978	102	2027	1062	1	1257	0	100.9	25	0
17979	102	2032	1062	1	1257	0	86.1	25	0
17980	102	2017	1063	1	1255	119.2	105	20	5
17981	102	2018	1063	1	1255	133.3	97.7	20	5
17982	102	2230	1063	1	1255	80.8	58.1	20	5
17983	102	2019	1063	1	1255	71.9	59.9	10	5
17984	102	2020	1063	1	1255	69	56.8	10	5
17985	102	2023	1063	1	1255	73.7	63.3	10	5
17986	102	2024	1063	1	1255	91	75.7	20	5
17987	102	2025	1063	1	1255	92.6	78.1	20	5
17988	102	2027	1063	1	1255	107.1	63.4	20	5
17989	102	2028	1063	1	1255	116.4	84.8	20	5
17990	102	2405	1063	1	1255	93.8	69.8	20	5
17991	102	2406	1063	1	1255	90.7	68.4	20	5
17992	102	2029	1063	1	1255	86.2	65.2	20	5
17993	102	3135	1063	1	1255	108.1	59.2	20	5
17994	102	2398	1063	1	1255	115.4	92.5	25	25
17995	102	2036	1063	1	1255	139.4	124.7	25	25
17996	102	2032	1063	1	1255	84	70.7	18	7
17997	102	2580	1063	1	1255	76.7	63.3	12	3
17998	102	2144	1063	1	1255	98.1	91.4	15	10
17999	102	2033	1063	1	1255	106.7	84.7	10	5
18000	102	2013	1063	1	1255	164.3	148.6	20	5
18001	102	2018	1063	1	1256	0	57.5	50	0
18002	102	2024	1063	1	1256	0	77	50	0
18003	102	2032	1063	1	1256	0	84.2	25	0
18004	102	2144	1063	1	1256	0	85.4	25	0
18005	102	2033	1063	1	1256	0	67.6	25	0
18006	102	2018	1063	1	1257	0	78	25	0
18007	102	2027	1063	1	1257	0	56.9	25	0
18008	103	2727	1064	1	1258	154.9	125.8	20	5
18009	103	3136	1064	1	1258	148.1	108.4	20	5
18010	103	2001	1064	1	1258	184.7	171.8	8	2
18011	103	3137	1064	1	1258	158.9	134.5	8	2
18012	103	2538	1064	1	1258	164.4	124	8	2
18013	103	3138	1064	1	1258	162.2	104.8	8	2
18014	103	3139	1064	1	1258	150.5	114.4	8	2
18015	103	2004	1064	1	1258	184.6	161.1	18	2
18016	103	3140	1064	1	1258	150.5	104.6	8	2
18017	103	3141	1064	1	1258	172.6	122.6	8	2
18018	103	2617	1064	1	1258	177.2	145.3	18	2
18019	103	3142	1064	1	1258	157.8	128.4	7	3
18020	103	3143	1064	1	1258	150.6	123	7	3
18021	103	2006	1064	1	1258	180.4	144.3	18	2
18022	103	2007	1064	1	1258	174	141.1	18	2
18023	103	3144	1064	1	1258	159.3	101.6	11	2
18024	103	3145	1064	1	1258	146.4	112.6	9	3
18025	103	2739	1064	1	1258	174	146.1	27	3
18026	103	2618	1064	1	1258	157.3	108.2	20	5
18027	103	2756	1064	1	1258	172	160.2	5	7
18028	103	3146	1064	1	1258	138.9	111.9	5	8
18029	103	3147	1064	1	1258	168.7	121.6	9	1
18030	103	3148	1064	1	1258	163.5	109.1	9	1
18031	103	3149	1064	1	1258	184.7	159.4	10	1
18032	103	3150	1064	1	1258	171.8	135.4	46	4
18033	103	3151	1064	1	1258	183.6	144.6	10	1
18034	103	3152	1064	1	1258	178.3	147.6	10	1
18035	103	3153	1064	1	1258	176.9	149.6	10	2
18036	103	2621	1064	1	1258	171.9	142	10	3
18037	103	2155	1064	1	1258	184.6	158.5	16	4
18038	103	2467	1064	1	1258	201.4	176.4	27	3
18039	103	3154	1064	1	1258	174.2	126.8	9	1
18040	103	3155	1064	1	1258	170.7	111.3	9	1
18041	103	3156	1064	1	1258	0	115.6	10	0
18042	103	3157	1064	1	1258	0	112.7	10	0
18043	103	3158	1064	1	1258	0	117.9	10	0
18044	103	3136	1064	1	1259	0	81.2	30	0
18045	103	2739	1064	1	1259	0	108.5	30	0
18046	103	3150	1064	1	1259	0	101.5	30	0
18047	103	3151	1064	1	1259	0	117.5	30	0
18048	103	2155	1064	1	1259	0	137.7	30	0
18049	103	2467	1064	1	1259	0	157.6	30	0
18050	103	3156	1064	1	1259	0	84.4	30	0
18051	103	3136	1064	1	1260	0	74.7	25	0
18052	103	2739	1064	1	1260	0	101	25	0
18053	103	3159	1064	1	1260	0	114.1	10	0
18054	103	3150	1064	1	1260	0	122.7	30	0
18055	103	3160	1064	1	1260	0	111.3	10	0
18056	103	3151	1064	1	1260	0	130.3	10	0
18057	103	2155	1064	1	1260	0	139.4	25	0
18058	103	2467	1064	1	1260	0	160.5	25	0
18059	103	3161	1064	1	1260	0	87.8	13	0
18060	103	3157	1064	1	1260	0	75.4	12	0
18061	103	2001	1065	1	1258	170	162.3	8	2
18062	103	2538	1065	1	1258	154.8	95.7	8	2
18063	103	2004	1065	1	1258	176	145.1	18	2
18064	103	2617	1065	1	1258	165.4	107.6	18	2
18065	103	2006	1065	1	1258	164.7	123.5	18	2
18066	103	2007	1065	1	1258	161.3	129.3	18	2
18067	103	2739	1065	1	1258	167.1	137	18	2
18068	103	3149	1065	1	1258	161.6	82.1	10	1
18069	103	3152	1065	1	1258	0	73.7	11	0
18070	103	2155	1065	1	1258	164	129.1	9	1
18071	103	2467	1065	1	1258	170.2	135.6	18	2
18072	103	3161	1065	1	1258	0	120.2	10	0
18073	103	3154	1065	1	1258	165.6	121.3	9	1
18074	103	3156	1065	1	1258	0	96.1	10	0
18075	103	3157	1065	1	1258	175.5	112.9	9	1
18076	103	3158	1065	1	1258	152.5	120.4	9	1
18077	103	3136	1065	1	1259	0	81	20	0
18078	103	2739	1065	1	1259	0	109.6	20	0
18079	103	3150	1065	1	1259	0	66.4	20	0
18080	103	3151	1065	1	1259	0	63	20	0
18081	103	2155	1065	1	1259	0	99.8	20	0
18082	103	2467	1065	1	1259	0	114.5	20	0
18083	103	3156	1065	1	1259	0	85.6	20	0
18084	104	2037	1066	1	1261	172.1	154.1	95	35
18085	104	2073	1066	1	1261	133.8	114.1	42	8
18086	104	2110	1066	1	1261	165.3	145.7	215	80
18087	104	2121	1066	1	1261	142.7	133.1	25	10
18088	104	2037	1067	1	1261	165.4	135.3	15	5
18089	104	2073	1067	1	1261	98.9	71.7	8	2
18090	104	2110	1067	1	1261	163.4	143.8	35	20
18091	105	2162	1068	1	1262	107.8	72.5	43	7
18092	105	2163	1068	1	1262	145.7	106.2	18	7
18093	105	2191	1068	1	1262	119.3	107.9	15	10
18094	105	2164	1068	1	1262	94	66.1	22	3
18095	105	2518	1068	1	1262	141.1	67.9	20	5
18096	105	2129	1068	1	1262	89.2	69.7	40	10
18097	105	2166	1068	1	1262	126.8	85.2	85	40
18098	105	3162	1068	1	1262	107.8	66.9	35	15
18099	105	3163	1068	1	1262	88.8	63.5	35	15
18100	105	2434	1068	1	1262	87.1	63.7	22	3
18101	105	2311	1068	1	1262	85	64.2	40	10
18102	105	2339	1068	1	1262	124.1	85.2	105	45
18103	105	2168	1068	1	1262	102.8	75.6	15	10
18104	105	2169	1068	1	1262	105.7	68.1	32	18
18105	105	3164	1068	1	1262	86.1	57.5	21	4
18106	105	3165	1068	1	1262	105.9	65.2	21	4
18107	105	3166	1068	1	1262	76.7	64.2	20	5
18108	105	3167	1068	1	1262	95.9	65.5	21	4
18109	105	3168	1068	1	1262	81.2	65.2	20	5
18110	105	3169	1068	1	1262	100.5	66.2	15	10
18111	105	2435	1068	1	1262	113.6	85.3	15	10
18112	105	2857	1068	1	1262	102	72.9	18	7
18113	105	2449	1068	1	1262	77.4	64	40	10
18114	105	2541	1068	1	1262	96.7	72.5	18	7
18115	105	2170	1068	1	1262	96.8	62.2	20	5
18116	105	2134	1068	1	1262	156.5	107.6	47	3
18117	105	2559	1068	1	1262	91.5	70.5	15	10
18118	105	2560	1068	1	1262	106.4	76	30	20
18119	105	3170	1068	1	1262	77.7	65	20	5
18120	105	2553	1068	1	1262	146.1	81.2	47	3
18121	105	3171	1068	1	1262	75.6	62.3	18	7
18122	105	2859	1068	1	1262	109.4	88.2	10	15
18123	105	2171	1068	1	1262	120.6	90.1	30	20
18124	105	2172	1068	1	1262	68.4	59.8	35	15
18125	105	2173	1068	1	1262	109	74.5	18	7
18126	105	3172	1068	1	1262	153.2	97.1	47	3
18127	105	3173	1068	1	1262	95.4	64.2	17	8
18128	105	3174	1068	1	1262	77.2	59.1	17	8
18129	105	3175	1068	1	1262	84.4	60.7	17	8
18130	105	2495	1068	1	1262	76.3	61.2	35	15
18131	105	3176	1068	1	1262	70.5	59	15	10
18132	105	2176	1068	1	1262	89.4	62.7	43	7
18133	105	2177	1068	1	1262	99.9	66.1	18	7
18134	105	3177	1068	1	1262	82.1	63.9	15	10
18135	105	3178	1068	1	1262	78.7	57.9	15	10
18136	105	3179	1068	1	1262	114.4	64.1	20	5
18137	105	3180	1068	1	1262	120.9	64.1	18	7
18138	105	3181	1068	1	1262	105.2	69.4	18	7
18139	105	3182	1068	1	1262	103.1	61.2	20	5
18140	105	2349	1068	1	1262	75.8	61.2	18	7
18141	105	3183	1068	1	1262	82.1	67.1	12	13
18142	105	3184	1068	1	1262	81.2	62.7	18	7
18143	105	2497	1068	1	1262	101.6	74.7	17	8
18144	105	2363	1068	1	1262	68.4	58.8	15	10
18145	105	2860	1068	1	1262	113.3	82.3	15	10
18146	105	2498	1068	1	1262	112	77.7	18	7
18147	105	2179	1068	1	1262	135.5	98.8	12	13
18148	105	2181	1068	1	1262	120.5	70.6	32	18
18149	105	3185	1068	1	1262	112.1	82	18	7
18150	105	3186	1068	1	1262	120.2	78.8	18	7
18151	105	3187	1068	1	1262	74.5	58.8	18	7
18152	105	3188	1068	1	1262	93.3	67.5	18	7
18153	105	3189	1068	1	1262	113.3	73.5	43	7
18154	105	3190	1068	1	1262	118.6	68.2	40	10
18155	105	2163	1068	1	1263	0	82.2	25	0
18156	105	2166	1068	1	1263	0	78.2	30	0
18157	105	3162	1068	1	1263	0	71.3	15	0
18158	105	3163	1068	1	1263	0	68.6	15	0
18159	105	2434	1068	1	1263	0	63	20	0
18160	105	2311	1068	1	1263	0	69.4	20	0
18161	105	2339	1068	1	1263	0	76.8	15	0
18162	105	2168	1068	1	1263	0	68.2	20	0
18163	105	2552	1068	1	1263	0	70.5	25	0
18164	105	2435	1068	1	1263	0	73.3	25	0
18165	105	2857	1068	1	1263	0	69.4	20	0
18166	105	2134	1068	1	1263	0	88.7	25	0
18167	105	2560	1068	1	1263	0	72.8	25	0
18168	105	2171	1068	1	1263	0	77.6	15	0
18169	105	2172	1068	1	1263	0	64.3	20	0
18170	105	2173	1068	1	1263	0	72.9	20	0
18171	105	3173	1068	1	1263	0	70.2	15	0
18172	105	3175	1068	1	1263	0	64.8	20	0
18173	105	2176	1068	1	1263	0	65.8	25	0
18174	105	2142	1068	1	1263	0	68.1	20	0
18175	105	3179	1068	1	1263	0	67.8	25	0
18176	105	3180	1068	1	1263	0	70.8	25	0
18177	105	2498	1068	1	1263	0	70.5	15	0
18178	105	2181	1068	1	1263	0	70.2	25	0
18179	105	2182	1068	1	1263	0	71.3	40	0
18180	105	2163	1068	1	1264	0	84.3	25	0
18181	105	2166	1068	1	1264	0	79.8	25	0
18182	105	2311	1068	1	1264	0	61	25	0
18183	105	2170	1068	1	1264	0	61.2	25	0
18184	105	2560	1068	1	1264	0	67.1	25	0
18185	105	2171	1068	1	1264	0	73.8	25	0
18186	105	2495	1068	1	1264	0	59.8	25	0
18187	105	2177	1068	1	1264	0	61.7	25	0
18188	105	3177	1068	1	1264	0	60.7	25	0
18189	105	2498	1068	1	1264	0	68.1	25	0
18190	105	2162	1069	1	1262	68.3	59.1	22	3
18191	105	2163	1069	1	1262	103.1	70.7	22	3
18192	105	2191	1069	1	1262	105.1	85.2	20	5
18193	105	2164	1069	1	1262	80.1	63.1	23	2
18194	105	2518	1069	1	1262	125.5	82.5	20	5
18195	105	2129	1069	1	1262	68.8	56.7	20	5
18196	105	2166	1069	1	1262	80.1	56.9	40	10
18197	105	3162	1069	1	1262	70.2	56.7	20	5
18198	105	3163	1069	1	1262	72.6	57.9	20	5
18199	105	2434	1069	1	1262	69.5	57	23	2
18200	105	2311	1069	1	1262	108.8	57.6	20	5
18201	105	2339	1069	1	1262	74.3	56.7	60	15
18202	105	2168	1069	1	1262	74.8	56.7	20	5
18203	105	2169	1069	1	1262	71.9	57.8	18	7
18204	105	3164	1069	1	1262	0	0	23	2
18205	105	3165	1069	1	1262	0	57.7	23	2
18206	105	3167	1069	1	1262	70.7	56.9	23	2
18207	105	3168	1069	1	1262	68.7	56.8	23	2
18208	105	3169	1069	1	1262	68.2	57.1	20	5
18209	105	2435	1069	1	1262	72.7	57	20	5
18210	105	2857	1069	1	1262	71.1	56.8	22	3
18211	105	2449	1069	1	1262	77.9	0	20	5
18212	105	2541	1069	1	1262	69.4	56.7	22	3
18213	105	2134	1069	1	1262	150.3	116.9	23	2
18214	105	2559	1069	1	1262	0	56.8	20	5
18215	105	2560	1069	1	1262	72.9	57.5	20	5
18216	105	2553	1069	1	1262	135.7	96.8	23	2
18217	105	3171	1069	1	1262	0	61.1	22	3
18218	105	2171	1069	1	1262	88.4	62.2	20	5
18219	105	2172	1069	1	1262	71.9	0	20	5
18220	105	2173	1069	1	1262	81.7	56.7	22	3
18221	105	3172	1069	1	1262	149	110.5	23	2
18222	105	3173	1069	1	1262	73.6	0	20	5
18223	105	3174	1069	1	1262	69.3	58.7	19	6
18224	105	3175	1069	1	1262	69.5	58.8	20	5
18225	105	2495	1069	1	1262	68.4	58.1	20	5
18226	105	2176	1069	1	1262	71.4	56.7	22	3
18227	105	2177	1069	1	1262	69.4	59.1	22	3
18228	105	3177	1069	1	1262	82.3	61	20	5
18229	105	3180	1069	1	1262	88.5	56.7	22	3
18230	105	3181	1069	1	1262	82.2	58.2	22	3
18231	105	2349	1069	1	1262	80.2	58	22	3
18232	105	3183	1069	1	1262	0	58	13	12
18233	105	2860	1069	1	1262	79.9	58.6	20	5
18234	105	2498	1069	1	1262	70.3	57.1	22	3
18235	105	2179	1069	1	1262	90.5	70.7	18	7
18236	105	2181	1069	1	1262	71.4	56.8	18	7
18237	105	3185	1069	1	1262	76.8	58.1	22	3
18238	105	3186	1069	1	1262	87.8	57	22	3
18239	105	3187	1069	1	1262	70.4	57.1	22	3
18240	105	3188	1069	1	1262	74.6	57	22	3
18241	105	3189	1069	1	1262	69.3	56.9	22	3
18242	105	3190	1069	1	1262	68.6	57.1	20	5
18243	105	2163	1069	1	1263	0	69.1	15	0
18244	105	2166	1069	1	1263	0	69.7	20	0
18245	105	3162	1069	1	1263	0	64.2	10	0
18246	105	3163	1069	1	1263	0	63	10	0
18247	105	2339	1069	1	1263	0	72.7	10	0
18248	105	2552	1069	1	1263	0	62.7	25	0
18249	105	2134	1069	1	1263	0	91.7	25	0
18250	105	2560	1069	1	1263	0	64.8	25	0
18251	105	2171	1069	1	1263	0	71.1	10	0
18252	105	3173	1069	1	1263	0	65.3	10	0
18253	105	2176	1069	1	1263	0	66.3	15	0
18254	105	3180	1069	1	1263	0	65.6	25	0
18255	105	2498	1069	1	1263	0	66.9	10	0
18256	105	2181	1069	1	1263	0	67.3	15	0
18257	105	2182	1069	1	1263	0	67.1	20	0
18258	105	2163	1069	1	1264	0	62.5	25	0
18259	105	2166	1069	1	1264	0	60.2	25	0
18260	105	2560	1069	1	1264	0	56.9	25	0
18261	105	2171	1069	1	1264	0	59.8	25	0
18262	106	2166	1070	1	1265	105	77.8	18	7
18263	106	2167	1070	1	1265	90.3	64.8	18	7
18264	106	2342	1070	1	1265	73.9	61	40	10
18265	106	2559	1070	1	1265	82	64.3	18	7
18266	106	2560	1070	1	1265	84.1	66.5	49	26
18267	106	2171	1070	1	1265	102	73.7	35	15
18268	106	2495	1070	1	1265	72.2	59.8	40	10
18269	106	2182	1070	1	1265	93.2	67.1	40	10
18270	106	2166	1070	1	1266	0	69.7	50	0
18271	106	2167	1070	1	1266	0	64	75	0
18272	106	2342	1070	1	1266	0	64.4	75	0
18273	106	2559	1070	1	1266	0	65.1	75	0
18274	106	2560	1070	1	1266	0	67.1	100	0
18275	106	2171	1070	1	1266	0	69.3	75	0
18276	106	2495	1070	1	1266	0	64	75	0
18277	106	2182	1070	1	1266	0	65.9	75	0
18278	106	2167	1070	1	1267	0	62.3	25	0
18279	106	2342	1070	1	1267	0	59.8	25	0
18280	106	2559	1070	1	1267	0	61.8	25	0
18281	106	2560	1070	1	1267	0	62.1	25	0
18282	106	2171	1070	1	1267	0	68.8	25	0
18283	106	2495	1070	1	1267	0	58.9	25	0
18284	106	2182	1070	1	1267	0	65.8	25	0
18285	106	2166	1071	1	1265	72.5	56.7	22	3
18286	106	2167	1071	1	1265	68.5	56.7	22	3
18287	106	2342	1071	1	1265	69.2	57.7	20	5
18288	106	2559	1071	1	1265	0	57	22	3
18289	106	2560	1071	1	1265	71.8	56.8	66	9
18290	106	2171	1071	1	1265	71.7	56.7	20	5
18291	106	2495	1071	1	1265	83.6	56.8	20	5
18292	106	2182	1071	1	1265	0	57.7	20	5
18293	106	2166	1071	1	1266	0	64.4	25	0
18294	106	2167	1071	1	1266	0	61.9	25	0
18295	106	2342	1071	1	1266	0	61.8	25	0
18296	106	2559	1071	1	1266	0	60.8	25	0
18297	106	2560	1071	1	1266	0	59.8	75	0
18298	106	2171	1071	1	1266	0	64.2	25	0
18299	106	2495	1071	1	1266	0	62	25	0
18300	106	2182	1071	1	1266	0	64	25	0
18301	107	3191	1072	1	1268	129.5	86.8	20	5
18302	107	3192	1072	1	1268	147.9	112.4	18	7
18303	107	3193	1072	1	1268	122.8	80.9	18	7
18304	107	3194	1072	1	1268	116.5	95.6	15	10
18305	107	3195	1072	1	1268	149	118.4	17	8
18306	107	3196	1072	1	1268	149	97.9	23	2
18307	107	3197	1072	1	1268	158.5	107.4	22	3
18308	107	2128	1072	1	1268	149	103.8	20	5
18309	107	2129	1072	1	1268	76.5	64.2	15	10
18310	107	3198	1072	1	1268	141.5	115.1	12	13
18311	107	3199	1072	1	1268	113.6	79.9	17	8
18312	107	2359	1072	1	1268	0	59.6	25	0
18313	107	3200	1072	1	1268	120.3	82.4	20	5
18314	107	3201	1072	1	1268	88.4	69	35	15
18315	107	3202	1072	1	1268	139.9	87.4	23	2
18316	107	2738	1072	1	1268	0	57.8	25	0
18317	107	3203	1072	1	1268	165.1	109.3	22	3
18318	107	3204	1072	1	1268	98	70.5	20	5
18319	107	2553	1072	1	1268	128.3	64.6	20	5
18320	107	3205	1072	1	1268	143.9	81.5	23	2
18321	107	2171	1072	1	1268	123.9	88.4	15	10
18322	107	3206	1072	1	1268	0	79.2	25	0
18323	107	3207	1072	1	1268	71.9	62	15	10
18324	107	3208	1072	1	1268	111.2	90.4	10	15
18325	107	3209	1072	1	1268	144.8	93.8	20	5
18326	107	3210	1072	1	1268	83.9	68	15	10
18327	107	3211	1072	1	1268	96.4	74.7	17	8
18328	107	2160	1072	1	1268	126	88.4	17	8
18329	107	3212	1072	1	1268	137.3	90.6	17	8
18330	107	3213	1072	1	1268	130.9	95.7	18	7
18331	107	2326	1072	1	1268	0	154.1	25	0
18332	107	2147	1072	1	1268	0	68.5	25	0
18333	107	2011	1072	1	1268	0	141	25	0
18334	107	3214	1072	1	1268	115.7	80.2	12	13
18335	107	3215	1072	1	1268	137.2	93.5	20	5
18336	107	2188	1072	1	1268	160.4	123.3	17	8
18337	107	3216	1072	1	1268	165.7	133.1	17	8
18338	107	2440	1072	1	1268	124.7	89.8	16	9
18339	107	3217	1072	1	1268	120.5	95.5	14	11
18340	107	3218	1072	1	1268	125.2	88.1	16	9
18341	107	2441	1072	1	1268	107.9	72.6	16	9
18342	107	3219	1072	1	1268	102.8	71.5	33	17
18343	107	3220	1072	1	1268	143.7	116.5	13	12
18344	107	3221	1072	1	1268	126.6	94.3	14	11
18345	107	3222	1072	1	1268	127.8	108.3	13	12
18346	107	3223	1072	1	1268	152.1	124.5	26	24
18347	107	2186	1072	1	1268	141	110.1	17	8
18348	107	3224	1072	1	1268	113.3	95.9	13	12
18349	107	3225	1072	1	1268	95.9	76.7	31	19
18350	107	3226	1072	1	1268	108.1	72.4	15	10
18351	107	3227	1072	1	1268	122.9	84.3	15	10
18352	107	3228	1072	1	1268	116.5	87.1	13	12
18353	107	3229	1072	1	1268	104.8	76.6	15	10
18354	107	3230	1072	1	1268	102.6	78.9	32	18
18355	107	3231	1072	1	1268	130	106.8	13	12
18356	107	3232	1072	1	1268	116.5	92.4	14	11
18357	107	3233	1072	1	1268	180.2	165.8	22	3
18358	107	3192	1072	1	1269	0	73.7	25	0
18359	107	3195	1072	1	1269	0	85.4	25	0
18360	107	3196	1072	1	1269	0	78.9	25	0
18361	107	3197	1072	1	1269	0	77.2	25	0
18362	107	3198	1072	1	1269	0	81.8	25	0
18363	107	3199	1072	1	1269	0	69.5	25	0
18364	107	3234	1072	1	1269	0	76.9	25	0
18365	107	3203	1072	1	1269	0	87.1	25	0
18366	107	2171	1072	1	1269	0	74.8	25	0
18367	107	3207	1072	1	1269	0	64.3	25	0
18368	107	3208	1072	1	1269	0	72.9	25	0
18369	107	3211	1072	1	1269	0	66.3	25	0
18370	107	2160	1072	1	1269	0	71.7	25	0
18371	107	3213	1072	1	1269	0	73.8	25	0
18372	107	3214	1072	1	1269	0	69.5	25	0
18373	107	2188	1072	1	1269	0	86.5	25	0
18374	107	3216	1072	1	1269	0	111.1	25	0
18375	107	2440	1072	1	1269	0	75.8	25	0
18376	107	3220	1072	1	1269	0	86.3	25	0
18377	107	3221	1072	1	1269	0	73.8	25	0
18378	107	3222	1072	1	1269	0	77.6	25	0
18379	107	3223	1072	1	1269	0	99.9	25	0
18380	107	2186	1072	1	1269	0	84	25	0
18381	107	3224	1072	1	1269	0	69.2	25	0
18382	107	3227	1072	1	1269	0	71.7	25	0
18383	107	3228	1072	1	1269	0	69.9	25	0
18384	107	3229	1072	1	1269	0	67.2	25	0
18385	107	3231	1072	1	1269	0	73.9	25	0
18386	107	3232	1072	1	1269	0	75.5	25	0
18387	107	3195	1072	1	1270	0	68.4	50	0
18388	107	3196	1072	1	1270	0	67.9	25	0
18389	107	3197	1072	1	1270	0	67	25	0
18390	107	2128	1072	1	1270	0	65.4	50	0
18391	107	3209	1072	1	1270	0	65.7	50	0
18392	107	3192	1073	1	1268	91.6	61.1	19	6
18393	107	3194	1073	1	1268	69.3	56.7	15	10
18394	107	3195	1073	1	1268	83.5	64.2	18	7
18395	107	3235	1073	1	1268	0	106.1	25	0
18396	107	3198	1073	1	1268	74.6	60.9	13	12
18397	107	3234	1073	1	1268	111.5	66.6	20	5
18398	107	3236	1073	1	1268	139.7	97.9	22	3
18399	107	3211	1073	1	1268	69.5	56.8	18	7
18400	107	2160	1073	1	1268	75.8	61.8	18	7
18401	107	3213	1073	1	1268	75.1	61.8	19	6
18402	107	3237	1073	1	1268	143	106	15	10
18403	107	2015	1073	1	1268	0	111.1	25	0
18404	107	3214	1073	1	1268	68.5	56.9	13	12
18405	107	2188	1073	1	1268	102.9	68.8	18	7
18406	107	3216	1073	1	1268	101.5	69.8	18	7
18407	107	2440	1073	1	1268	70.6	62	17	8
18408	107	2441	1073	1	1268	68.4	57	17	8
18409	107	3220	1073	1	1268	78.7	64	13	12
18410	107	3222	1073	1	1268	73.6	58.5	13	12
18411	107	3223	1073	1	1268	92.4	68.4	13	12
18412	107	2186	1073	1	1268	74.5	62.3	18	7
18413	107	3224	1073	1	1268	68.4	57.1	14	11
18414	107	3227	1073	1	1268	71.9	56.7	16	9
18415	107	3228	1073	1	1268	70.5	58	14	11
18416	107	3229	1073	1	1268	76.6	57	16	9
18417	107	3231	1073	1	1268	69.6	59.1	14	11
18418	107	3233	1073	1	1268	178	144.6	23	2
18419	107	3196	1073	1	1269	0	79.1	25	0
18420	107	3197	1073	1	1269	0	82.3	25	0
18421	107	3212	1073	1	1269	0	70.7	25	0
18422	107	3220	1073	1	1269	0	69.2	25	0
18423	107	3222	1073	1	1269	0	68.5	25	0
18424	107	3223	1073	1	1269	0	74	25	0
18425	107	3195	1073	1	1270	0	58.8	50	0
18426	107	3196	1073	1	1270	0	62.1	25	0
18427	107	3197	1073	1	1270	0	65.4	25	0
18428	107	2128	1073	1	1270	0	57	50	0
18429	107	3209	1073	1	1270	0	62	50	0
18430	108	3238	1074	1	1271	189	180.6	31	4
18431	108	3239	1074	1	1271	186.8	170.7	96	4
18432	108	3240	1074	1	1271	186.8	172.4	96	4
18433	108	3241	1074	1	1271	187.9	179.3	96	4
18434	108	3242	1074	1	1271	187.9	173.8	96	4
18435	108	2334	1074	1	1272	0	157.6	200	0
18436	108	3238	1075	1	1271	173.3	136.4	14	1
18437	108	3239	1075	1	1271	183.5	155.2	49	1
18438	108	3240	1075	1	1271	186.8	153.9	49	1
18439	108	3241	1075	1	1271	189	166	49	1
18440	108	3242	1075	1	1271	187.9	164.5	49	1
18441	108	2334	1075	1	1272	0	137.1	100	0
18442	110	3243	1076	1	1273	121.2	108.1	40	5
18443	110	3244	1076	1	1273	144.7	134	35	10
18444	110	2072	1076	1	1273	142.9	117.6	125	40
18445	110	2109	1076	1	1273	121.4	109	115	50
18446	110	2072	1077	1	1273	113.4	82.4	30	10
18447	110	2109	1077	1	1273	85.3	71.7	30	20
18448	111	2191	1078	1	1274	128.7	116.5	35	15
18449	111	2339	1078	1	1274	100.8	69.3	70	30
18450	111	2340	1078	1	1274	91.7	69.6	40	10
18451	111	2341	1078	1	1274	69.3	57.9	40	10
18452	111	3245	1078	1	1274	68.2	56.9	35	15
18453	111	2342	1078	1	1274	78.2	62.7	150	50
18454	111	3246	1078	1	1274	70.8	56.7	35	15
18455	111	2343	1078	1	1274	68.1	56.8	35	15
18456	111	2344	1078	1	1274	73.7	60.3	40	10
18457	111	2319	1078	1	1274	140.8	97.8	20	5
18458	111	2172	1078	1	1274	68.6	59.8	20	5
18459	111	2173	1078	1	1274	86.3	69.3	15	10
18460	111	2174	1078	1	1274	145.9	100.5	20	5
18461	111	2176	1078	1	1274	72.7	60.3	55	20
18462	111	2178	1078	1	1274	75.4	64.4	50	25
18463	111	2349	1078	1	1274	71.6	58.8	55	20
18464	111	2143	1078	1	1274	94.5	76.8	70	30
18465	111	3247	1078	1	1274	89.8	78.8	15	10
18466	111	2181	1078	1	1274	94.4	67	20	5
18467	111	2182	1078	1	1274	98.9	66.2	75	25
18468	111	2353	1078	1	1274	68.5	56.8	55	20
18469	111	2358	1078	1	1274	103	89.4	20	5
18470	111	2341	1078	1	1275	0	62.7	25	0
18471	111	2342	1078	1	1275	0	64.3	150	0
18472	111	2319	1078	1	1275	0	77.6	25	0
18473	111	2174	1078	1	1275	0	75.6	50	0
18474	111	2176	1078	1	1275	0	62.3	75	0
18475	111	2178	1078	1	1275	0	64.9	50	0
18476	111	2349	1078	1	1275	0	65	25	0
18477	111	2143	1078	1	1275	0	68.5	100	0
18478	111	3247	1078	1	1275	0	70.6	25	0
18479	111	2181	1078	1	1275	0	66.4	25	0
18480	111	2182	1078	1	1275	0	67.6	75	0
18481	111	2353	1078	1	1275	0	64.1	25	0
18482	111	2143	1078	1	1276	0	69.5	50	0
18483	111	2182	1078	1	1276	0	66.2	50	0
18484	111	2342	1079	1	1274	70	56.7	20	5
18485	111	2143	1079	1	1274	75.4	66.1	20	5
18486	111	2182	1079	1	1274	73.9	59	20	5
18487	112	2340	1080	1	1277	68.2	58.6	30	20
18488	112	2134	1080	1	1277	121.8	81	55	20
18489	112	2342	1080	1	1277	68.5	60.1	50	25
18490	112	2176	1080	1	1277	68.4	56.7	50	25
18491	112	2143	1080	1	1277	70.1	58.8	75	25
18492	112	2181	1080	1	1277	68.4	57.9	50	25
18493	112	2182	1080	1	1277	76.9	59.2	75	25
18494	112	2353	1080	1	1277	68.2	56.8	25	25
18495	112	2134	1080	1	1278	0	71.3	75	0
18496	112	2342	1080	1	1278	0	61.9	75	0
18497	112	2143	1080	1	1278	0	59.3	100	0
18498	112	2181	1080	1	1278	0	63	50	0
18499	112	2182	1080	1	1278	0	63	75	0
18500	112	2353	1080	1	1278	0	56.8	50	0
18501	113	2166	1081	1	1279	82.1	60.8	45	5
18502	113	2134	1081	1	1279	121	67.2	45	5
18503	113	3248	1081	1	1279	70.3	58.7	60	15
18504	113	3249	1081	1	1279	68.3	56.7	60	15
18505	113	2174	1081	1	1279	98.6	60.9	45	5
18506	113	2349	1081	1	1279	73.4	56.8	45	5
18507	113	2143	1081	1	1279	77.5	62.8	80	20
18508	113	2181	1081	1	1279	68.1	57.9	55	20
18509	113	2182	1081	1	1279	71.5	59.7	60	15
18510	113	2166	1081	1	1280	0	66.3	50	0
18511	113	2134	1081	1	1280	0	70.4	25	0
18512	113	3248	1081	1	1280	0	62.1	75	0
18513	113	2174	1081	1	1280	0	64.2	50	0
18514	113	2349	1081	1	1280	0	61	50	0
18515	113	2143	1081	1	1280	0	65.6	50	0
18516	113	2182	1081	1	1280	0	65.1	50	0
18517	113	3248	1082	1	1279	0	56.8	20	5
18518	113	3249	1082	1	1279	0	58.9	20	5
18519	113	2143	1082	1	1279	70.5	56.7	20	5
18520	113	2182	1082	1	1279	70.3	58.1	20	5
18521	114	3250	1083	1	1281	172.7	113.3	73	2
18522	114	3028	1083	1	1281	163.4	90.4	45	5
18523	114	2157	1083	1	1281	178.4	130.6	173	2
18524	114	3251	1083	1	1281	162.7	104.1	45	5
18525	114	3029	1083	1	1281	161.8	124	20	5
18526	114	2730	1083	1	1281	171.3	112.5	68	7
18527	114	2158	1083	1	1281	177.5	126.4	148	2
18528	114	3111	1083	1	1281	160.7	93.7	70	5
18529	114	3030	1083	1	1281	160.7	111.7	47	3
18530	114	2542	1083	1	1281	172.9	107.4	45	5
18531	114	2134	1083	1	1281	179.7	137.7	123	2
18532	114	2174	1083	1	1281	176.2	134.9	23	2
18533	114	2321	1083	1	1281	180.5	132.3	195	5
18534	114	2750	1083	1	1281	172	107.5	98	2
18535	114	2331	1083	1	1281	163.1	116.9	45	5
18536	114	2215	1083	1	1281	165.6	102	97	3
18537	114	2179	1083	1	1281	0	87.5	25	0
18538	114	3133	1083	1	1281	168	119.1	47	3
18539	114	2157	1083	1	1282	0	101	175	0
18540	114	2158	1083	1	1282	0	94.9	150	0
18541	114	3030	1083	1	1282	0	85.1	25	0
18542	114	2134	1083	1	1282	0	113.4	125	0
18543	114	2174	1083	1	1282	0	98.1	50	0
18544	114	2321	1083	1	1282	0	94.9	175	0
18545	114	2750	1083	1	1282	0	90.7	50	0
18546	114	2215	1083	1	1282	0	79.1	25	0
18547	114	3133	1083	1	1282	0	94.1	25	0
18548	114	3250	1083	1	1283	0	91.6	75	0
18549	114	2157	1083	1	1283	0	105.8	100	0
18550	114	2158	1083	1	1283	0	98.8	100	0
18551	114	2134	1083	1	1283	0	110.5	100	0
18552	114	2174	1083	1	1283	0	90.9	50	0
18553	114	2321	1083	1	1283	0	100.3	100	0
18554	114	2158	1083	1	1284	0	73.5	125	0
18555	114	2134	1083	1	1284	0	75.2	75	0
18556	114	3250	1084	1	1281	108.1	73.8	23	2
18557	114	2157	1084	1	1281	167.1	128.6	48	2
18558	114	2730	1084	1	1281	154.5	105.4	22	3
18559	114	2158	1084	1	1281	166.9	127.3	48	2
18560	114	3030	1084	1	1281	162.7	123.1	23	2
18561	114	2134	1084	1	1281	168.2	141.9	23	2
18562	114	2174	1084	1	1281	164.7	130.2	23	2
18563	114	2321	1084	1	1281	174.2	130.4	46	4
18564	114	2750	1084	1	1281	161.3	116.9	23	2
18565	114	2215	1084	1	1281	153.4	114.7	23	2
18566	114	2179	1084	1	1281	0	65.4	25	0
18567	114	3133	1084	1	1281	166.7	126.2	23	2
18568	114	2157	1084	1	1282	0	102.3	50	0
18569	114	2158	1084	1	1282	0	91.6	50	0
18570	114	3030	1084	1	1282	0	92.8	25	0
18571	114	2134	1084	1	1282	0	114.5	25	0
18572	114	2174	1084	1	1282	0	104.3	50	0
18573	114	2321	1084	1	1282	0	93.5	50	0
18574	114	2215	1084	1	1282	0	80.9	25	0
18575	114	3133	1084	1	1282	0	97	25	0
18576	114	2158	1084	1	1284	0	73.7	25	0
18577	114	2134	1084	1	1284	0	73.9	25	0
18578	115	3250	1085	1	1285	145.8	69.3	24	1
18579	115	2157	1085	1	1285	120.2	64.3	49	1
18580	115	2158	1085	1	1285	155.6	56.7	49	1
18581	115	2134	1085	1	1285	143	69.4	24	1
18582	115	2174	1085	1	1285	123.4	56.9	24	1
18583	115	2321	1085	1	1285	138.6	56.7	49	1
18584	115	2750	1085	1	1285	123.6	61	24	1
18585	115	2157	1085	1	1286	0	72.6	25	0
18586	115	2158	1085	1	1286	0	65.1	50	0
18587	115	2321	1085	1	1286	0	64.2	50	0
18588	115	2750	1085	1	1286	0	65.5	25	0
18589	115	2157	1085	1	1287	0	71.6	25	0
18590	115	2134	1085	1	1287	0	67.2	25	0
18591	116	2037	1086	1	1288	175.4	159.1	65	35
18592	116	3252	1086	1	1288	161.1	0	0	2
18593	116	3253	1086	1	1288	170.9	0	0	3
18594	116	3254	1086	1	1288	162.6	0	0	3
18595	116	3255	1086	1	1288	160.9	0	0	3
18596	116	3256	1086	1	1288	166.7	0	0	3
18597	116	3257	1086	1	1288	175.3	0	0	7
18598	116	3258	1086	1	1288	155	0	0	3
18599	116	3259	1086	1	1288	161.6	0	0	3
18600	116	3260	1086	1	1288	151	0	0	3
18601	116	2073	1086	1	1288	137.3	130.2	11	9
18602	116	2074	1086	1	1288	167.8	153	90	27
18603	116	3261	1086	1	1288	151.9	0	0	1
18604	116	3262	1086	1	1288	132.1	0	0	1
18605	116	3263	1086	1	1288	153.9	0	0	2
18606	116	3264	1086	1	1288	157.5	0	0	2
18607	116	3265	1086	1	1288	133.8	0	0	2
18608	116	3266	1086	1	1288	165.9	0	0	2
18609	116	3267	1086	1	1288	150.7	0	0	2
18610	116	3268	1086	1	1288	160.3	0	0	1
18611	116	2459	1086	1	1288	166.8	0	0	1
18612	116	3269	1086	1	1288	162.3	0	0	2
18613	116	3270	1086	1	1288	163.6	0	0	2
18614	116	3271	1086	1	1288	143.3	0	0	1
18615	116	3272	1086	1	1288	157.3	0	0	1
18616	116	3273	1086	1	1288	144.6	0	0	2
18617	116	3274	1086	1	1288	147	0	0	2
18618	116	3275	1086	1	1288	160.3	0	0	2
18619	116	3276	1086	1	1288	157.1	0	0	2
18620	116	3277	1086	1	1288	149.9	0	0	2
18621	116	3278	1086	1	1288	162.3	0	0	2
18622	116	3279	1086	1	1288	149.9	0	0	2
18623	116	3280	1086	1	1288	160.2	0	0	2
18624	116	3281	1086	1	1288	162.4	0	0	2
18625	116	3282	1086	1	1288	149.6	0	0	2
18626	116	3283	1086	1	1288	162.4	0	0	1
18627	116	3284	1086	1	1288	150.2	0	0	2
18628	116	3285	1086	1	1288	166.7	0	0	10
18629	116	3286	1086	1	1288	146.7	0	0	2
18630	116	3287	1086	1	1288	143.5	0	0	2
18631	116	3288	1086	1	1288	149.1	0	0	2
18632	116	3289	1086	1	1288	166.7	0	0	2
18633	116	3290	1086	1	1288	159.3	0	0	2
18634	116	2296	1086	1	1288	128.2	116.1	14	6
18635	116	3291	1086	1	1288	123.5	0	0	1
18636	116	3292	1086	1	1288	163.5	0	0	1
18637	116	3293	1086	1	1288	107.3	0	0	1
18638	116	3294	1086	1	1288	114.3	0	0	1
18639	116	3295	1086	1	1288	102.9	0	0	1
18640	116	3296	1086	1	1288	121.7	0	0	1
18641	116	2121	1086	1	1288	138.1	128.1	10	10
18642	116	2037	1087	1	1288	156.4	137.1	45	40
18643	116	3252	1087	1	1288	165.7	0	0	1
18644	116	3257	1087	1	1288	174	0	0	3
18645	116	3260	1087	1	1288	144.5	0	0	1
18646	116	2073	1087	1	1288	94.5	90.2	4	6
18647	116	2074	1087	1	1288	135.7	125.7	65	53
18648	116	3261	1087	1	1288	125.9	0	0	1
18649	116	3262	1087	1	1288	153.8	0	0	1
18650	116	3268	1087	1	1288	126	0	0	1
18651	116	2459	1087	1	1288	116.5	0	0	1
18652	116	3271	1087	1	1288	123.4	0	0	1
18653	116	3272	1087	1	1288	113.8	0	0	1
18654	116	3283	1087	1	1288	129	0	0	1
18655	116	3285	1087	1	1288	151	0	0	5
18656	116	2296	1087	1	1288	86.2	80.1	6	6
18657	116	3297	1087	1	1288	73.7	0	0	1
18658	116	3298	1087	1	1288	78.1	0	0	1
18659	117	2164	1088	1	1289	116.9	77.6	15	10
18660	117	2037	1088	1	1289	180.5	161.3	270	75
18661	117	3299	1088	1	1289	170.8	0	0	2
18662	117	3300	1088	1	1289	172.9	0	0	4
18663	117	2041	1088	1	1289	168.6	0	0	2
18664	117	2042	1088	1	1289	176	0	0	2
18665	117	3301	1088	1	1289	174	0	0	4
18666	117	2783	1088	1	1289	167.8	0	0	4
18667	117	3253	1088	1	1289	173.1	0	0	4
18668	117	3254	1088	1	1289	171	0	0	4
18669	117	2045	1088	1	1289	183.8	0	0	2
18670	117	2784	1088	1	1289	170.8	0	0	4
18671	117	2472	1088	1	1289	171	0	0	2
18672	117	2046	1088	1	1289	183.6	0	0	2
18673	117	3302	1088	1	1289	165.4	0	0	4
18674	117	2454	1088	1	1289	185.7	0	0	2
18675	117	3303	1088	1	1289	175.1	0	0	3
18676	117	3304	1088	1	1289	181.4	0	0	4
18677	117	3305	1088	1	1289	172.9	0	0	2
18678	117	3306	1088	1	1289	178.4	0	0	4
18679	117	2786	1088	1	1289	170.7	0	0	2
18680	117	2917	1088	1	1289	163.5	0	0	2
18681	117	2787	1088	1	1289	176	0	0	2
18682	117	2050	1088	1	1289	165.8	0	0	3
18683	117	2918	1088	1	1289	180.4	0	0	3
18684	117	2051	1088	1	1289	174.2	0	0	2
18685	117	3307	1088	1	1289	166.8	0	0	3
18686	117	3308	1088	1	1289	160.4	0	0	4
18687	117	3309	1088	1	1289	170	0	0	4
18688	117	2540	1088	1	1289	158.4	0	0	3
18689	117	3310	1088	1	1289	173	0	0	4
18690	117	3311	1088	1	1289	156.2	0	0	4
18691	117	2868	1088	1	1289	159.5	0	0	3
18692	117	2053	1088	1	1289	178.2	0	0	2
18693	117	3312	1088	1	1289	162	0	0	3
18694	117	2055	1088	1	1289	179.4	0	0	2
18695	117	3313	1088	1	1289	171	0	0	4
18696	117	3256	1088	1	1289	174.3	0	0	4
18697	117	2926	1088	1	1289	176	0	0	2
18698	117	2927	1088	1	1289	182.4	0	0	3
18699	117	2928	1088	1	1289	179.5	0	0	2
18700	117	2058	1088	1	1289	176.2	0	0	2
18701	117	2060	1088	1	1289	172.1	0	0	2
18702	117	2061	1088	1	1289	174.2	0	0	2
18703	117	2063	1088	1	1289	161.5	0	0	3
18704	117	3314	1088	1	1289	169.8	0	0	3
18705	117	3315	1088	1	1289	155.9	0	0	4
18706	117	3316	1088	1	1289	178.4	0	0	4
18707	117	3317	1088	1	1289	166.7	0	0	2
18708	117	3318	1088	1	1289	170.7	0	0	4
18709	117	3319	1088	1	1289	164.6	0	0	2
18710	117	3257	1088	1	1289	178.5	0	0	12
18711	117	3259	1088	1	1289	175.4	0	0	4
18712	117	2067	1088	1	1289	185.8	0	0	3
18713	117	3320	1088	1	1289	155	0	0	4
18714	117	2069	1088	1	1289	178.4	0	0	4
18715	117	3321	1088	1	1289	165.5	0	0	4
18716	117	3322	1088	1	1289	156.2	0	0	4
18717	117	3323	1088	1	1289	173.1	0	0	4
18718	117	3324	1088	1	1289	164.4	0	0	2
18719	117	2071	1088	1	1289	173	0	0	2
18720	117	2473	1088	1	1289	158.2	0	0	2
18721	117	3325	1088	1	1289	167.9	0	0	2
18722	117	3326	1088	1	1289	174.1	0	0	4
18723	117	2129	1088	1	1289	0	95.5	25	0
18724	117	2072	1088	1	1289	149.5	128	20	5
18725	117	2135	1088	1	1289	0	68.1	25	0
18726	117	2384	1088	1	1289	0	65.7	25	0
18727	117	2935	1088	1	1289	141	112.4	15	5
18728	117	2073	1088	1	1289	134.5	131.9	10	30
18729	117	2074	1088	1	1289	162.7	154	30	45
18730	117	2110	1088	1	1289	164.6	151.8	20	10
18731	117	2111	1088	1	1289	130.1	115.3	40	14
18732	117	3327	1088	1	1289	116.4	0	0	1
18733	117	3328	1088	1	1289	115.3	0	0	1
18734	117	3329	1088	1	1289	123.8	0	0	1
18735	117	3330	1088	1	1289	138.4	0	0	1
18736	117	3331	1088	1	1289	122.8	0	0	1
18737	117	3332	1088	1	1289	115.3	0	0	1
18738	117	3333	1088	1	1289	124.7	0	0	1
18739	117	3334	1088	1	1289	115.5	0	0	1
18740	117	3335	1088	1	1289	115.5	0	0	1
18741	117	3336	1088	1	1289	141.1	0	0	1
18742	117	3337	1088	1	1289	85.3	0	0	1
18743	117	3338	1088	1	1289	122.8	0	0	1
18744	117	3339	1088	1	1289	113.6	0	0	1
18745	117	3340	1088	1	1289	103.9	0	0	1
18746	117	3341	1088	1	1289	106	0	0	1
18747	117	3342	1088	1	1289	122.9	0	0	1
18748	117	3343	1088	1	1289	121.7	0	0	1
18749	117	3344	1088	1	1289	113.4	0	0	1
18750	117	3345	1088	1	1289	135.9	0	0	1
18751	117	3346	1088	1	1289	113.7	0	0	1
18752	117	3347	1088	1	1289	110.2	0	0	1
18753	117	2296	1088	1	1289	135.6	121.9	25	15
18754	117	3348	1088	1	1289	114.5	0	0	1
18755	117	3349	1088	1	1289	128.2	0	0	1
18756	117	3350	1088	1	1289	109.4	0	0	1
18757	117	3351	1088	1	1289	111.4	0	0	1
18758	117	3352	1088	1	1289	107	0	0	1
18759	117	3353	1088	1	1289	104	0	0	1
18760	117	3354	1088	1	1289	118.6	0	0	1
18761	117	3355	1088	1	1289	104.6	0	0	1
18762	117	3356	1088	1	1289	109.4	0	0	1
18763	117	3357	1088	1	1289	116.5	0	0	1
18764	117	3358	1088	1	1289	114.5	0	0	1
18765	117	3359	1088	1	1289	107	0	0	1
18766	117	3360	1088	1	1289	131.3	0	0	1
18767	117	3361	1088	1	1289	113.3	0	0	1
18768	117	3362	1088	1	1289	103.1	0	0	1
18769	117	2121	1088	1	1289	143.6	130.9	15	10
18770	117	2037	1089	1	1289	170.8	151	30	24
18771	117	2540	1089	1	1289	157.1	0	0	1
18772	117	2868	1089	1	1289	186.8	0	0	1
18773	117	2927	1089	1	1289	181.4	0	0	1
18774	117	3257	1089	1	1289	175.1	0	0	3
18775	117	2072	1089	1	1289	89.5	76.7	10	5
18776	117	2935	1089	1	1289	0	103.2	15	0
18777	117	2073	1089	1	1289	99.6	77.8	10	5
18778	117	2074	1089	1	1289	142.9	130	15	15
18779	117	2110	1089	1	1289	154	140.4	10	5
18780	117	2111	1089	1	1289	83.2	74.7	15	15
18781	117	2296	1089	1	1289	106.1	84.3	10	5
18782	118	2037	1090	1	1290	162.1	139.1	150	24
18783	118	3363	1090	1	1290	156.9	0	0	2
18784	118	2865	1090	1	1290	148.7	0	0	2
18785	118	3364	1090	1	1290	161.4	0	0	2
18786	118	3365	1090	1	1290	164.4	0	0	2
18787	118	3366	1090	1	1290	147.6	0	0	4
18788	118	3367	1090	1	1290	116.2	0	0	2
18789	118	2868	1090	1	1290	143.5	0	0	1
18790	118	3368	1090	1	1290	130	0	0	1
18791	118	3369	1090	1	1290	172.9	0	0	2
18792	118	3370	1090	1	1290	162.3	0	0	2
18793	118	3371	1090	1	1290	91.3	0	0	2
18794	118	3372	1090	1	1290	135	0	0	2
18795	118	3373	1090	1	1290	184.7	0	0	1
18796	118	3374	1090	1	1290	176.1	0	0	2
18797	118	3375	1090	1	1290	147.7	0	0	2
18798	118	3376	1090	1	1290	180.5	0	0	1
18799	118	3377	1090	1	1290	176	0	0	2
18800	118	3378	1090	1	1290	162.3	0	0	2
18801	118	3379	1090	1	1290	173.8	0	0	2
18802	118	2072	1090	1	1290	134.2	109.2	30	7
18803	118	2073	1090	1	1290	136.3	127.9	20	5
18804	118	2074	1090	1	1290	153.9	137.1	70	12
18805	118	3380	1090	1	1290	145.5	0	0	1
18806	118	3381	1090	1	1290	145.5	0	0	1
18807	118	3382	1090	1	1290	145.5	0	0	1
18808	118	3383	1090	1	1290	148.5	0	0	1
18809	118	3384	1090	1	1290	162.3	0	0	1
18810	118	3385	1090	1	1290	146.6	0	0	1
18811	118	3277	1090	1	1290	120.7	0	0	1
18812	118	3386	1090	1	1290	154.9	0	0	1
18813	118	3387	1090	1	1290	160.4	0	0	1
18814	118	3388	1090	1	1290	147.7	0	0	1
18815	118	3389	1090	1	1290	161.5	0	0	1
18816	118	3390	1090	1	1290	161.3	0	0	1
18817	118	3391	1090	1	1290	158.8	0	0	1
18818	118	3392	1090	1	1290	141.9	0	0	1
18819	118	3289	1090	1	1290	99.7	0	0	1
18820	118	3393	1090	1	1290	133.2	0	0	1
18821	118	3394	1090	1	1290	133.9	0	0	1
18822	118	3395	1090	1	1290	155.2	0	0	1
18823	118	2110	1090	1	1290	147.5	136.2	55	25
18824	118	2111	1090	1	1290	117.1	101.5	60	12
18825	118	2962	1090	1	1290	95.4	0	0	1
18826	118	3396	1090	1	1290	116.3	0	0	1
18827	118	2964	1090	1	1290	102.9	0	0	1
18828	118	2967	1090	1	1290	84.2	0	0	1
18829	118	3335	1090	1	1290	132	0	0	1
18830	118	3336	1090	1	1290	104.2	0	0	1
18831	118	3338	1090	1	1290	108.1	0	0	1
18832	118	3397	1090	1	1290	120.3	0	0	1
18833	118	3398	1090	1	1290	95.4	0	0	1
18834	118	3399	1090	1	1290	136.5	0	0	1
18835	118	2977	1090	1	1290	95.8	0	0	1
18836	118	2121	1090	1	1290	126.9	114.9	20	10
18837	118	2037	1091	1	1290	142.8	101.5	50	16
18838	118	2868	1091	1	1290	102.1	0	0	1
18839	118	3368	1091	1	1290	83.7	0	0	1
18840	118	3373	1091	1	1290	170	0	0	1
18841	118	3376	1091	1	1290	169.7	0	0	1
18842	118	2072	1091	1	1290	136.1	70.9	10	3
18843	118	2074	1091	1	1290	108.3	94.8	30	8
18844	118	3400	1091	1	1290	91.3	0	0	1
18845	118	3401	1091	1	1290	118	0	0	1
18846	118	2110	1091	1	1290	116.1	98.7	20	10
18847	118	2111	1091	1	1290	72.8	64.2	25	7
18848	119	2037	1092	1	1291	157.1	143.5	160	45
18849	119	3402	1092	1	1291	149.7	0	0	5
18850	119	3403	1092	1	1291	142.1	0	0	5
18851	119	3404	1092	1	1291	123.4	0	0	1
18852	119	3405	1092	1	1291	141.3	0	0	5
18853	119	2783	1092	1	1291	152.9	0	0	2
18854	119	2784	1092	1	1291	141.4	0	0	2
18855	119	3406	1092	1	1291	140.3	0	0	5
18856	119	2785	1092	1	1291	147.5	0	0	2
18857	119	3305	1092	1	1291	158.4	0	0	5
18858	119	2786	1092	1	1291	152.1	0	0	2
18859	119	2917	1092	1	1291	149.5	0	0	2
18860	119	2787	1092	1	1291	149.5	0	0	2
18861	119	2918	1092	1	1291	154.8	0	0	2
18862	119	2788	1092	1	1291	156.3	0	0	2
18863	119	3407	1092	1	1291	160.3	0	0	2
18864	119	3408	1092	1	1291	148.9	0	0	5
18865	119	2920	1092	1	1291	151.8	0	0	2
18866	119	3409	1092	1	1291	144.7	0	0	5
18867	119	2926	1092	1	1291	149.7	0	0	2
18868	119	2928	1092	1	1291	146.6	0	0	3
18869	119	3410	1092	1	1291	143.7	0	0	5
18870	119	3411	1092	1	1291	153	0	0	5
18871	119	3412	1092	1	1291	148.1	0	0	5
18872	119	3413	1092	1	1291	146.9	0	0	2
18873	119	3414	1092	1	1291	159.2	0	0	5
18874	119	3415	1092	1	1291	150.5	0	0	5
18875	119	3319	1092	1	1291	156.8	0	0	5
18876	119	3416	1092	1	1291	142.4	0	0	5
18877	119	3417	1092	1	1291	148.6	0	0	5
18878	119	2934	1092	1	1291	148.5	0	0	2
18879	119	2074	1092	1	1291	153	141.3	50	9
18880	119	2936	1092	1	1291	141.5	0	0	2
18881	119	3418	1092	1	1291	139.1	0	0	2
18882	119	3419	1092	1	1291	151.1	0	0	1
18883	119	3420	1092	1	1291	147.7	0	0	2
18884	119	2949	1092	1	1291	142.6	0	0	2
18885	119	2954	1092	1	1291	138.4	0	0	2
18886	119	3421	1092	1	1291	149.9	0	0	2
18887	119	3422	1092	1	1291	142.8	0	0	2
18888	119	3423	1092	1	1291	141.1	0	0	2
18889	119	3424	1092	1	1291	142.6	0	0	2
18890	119	3425	1092	1	1291	147.7	0	0	2
18891	119	2110	1092	1	1291	151.9	141.3	20	6
18892	119	2111	1092	1	1291	115.3	105.2	20	6
18893	119	2121	1092	1	1291	133.9	114.7	25	5
18894	119	2037	1093	1	1291	111.7	98	50	30
18895	119	2074	1093	1	1291	105.4	96.7	10	10
18896	119	2110	1093	1	1291	113.3	96.9	10	4
18897	119	2111	1093	1	1291	69.8	64	10	4
18898	120	2158	1094	1	1292	143.9	80.4	121	4
18899	120	3426	1094	1	1292	168.9	110.4	71	4
18900	120	2338	1094	1	1292	143.3	85	45	5
18901	120	2129	1094	1	1292	77	62.8	40	10
18902	120	2134	1094	1	1292	146.8	80.1	117	8
18903	120	3427	1094	1	1292	0	57.7	21	4
18904	120	3428	1094	1	1292	69.4	56.7	67	8
18905	120	2319	1094	1	1292	143.9	73.8	121	4
18906	120	2345	1094	1	1292	68	56.7	35	15
18907	120	2172	1094	1	1292	74.5	56.7	40	10
18908	120	2173	1094	1	1292	82.1	60.6	40	10
18909	120	2176	1094	1	1292	69.4	58.7	60	15
18910	120	2180	1094	1	1292	68.2	57.6	78	22
18911	120	2181	1094	1	1292	70.5	58.9	60	15
18912	120	3429	1094	1	1292	73.5	56.9	22	3
18913	120	3430	1094	1	1292	72.6	56.7	22	3
18914	120	3431	1094	1	1292	71.4	56.7	22	3
18915	120	2354	1094	1	1292	79.7	58.9	22	3
18916	120	3432	1094	1	1292	68.3	57.1	22	3
18917	120	3433	1094	1	1292	75.8	57.8	45	5
18918	120	2444	1094	1	1292	78.9	56.8	44	6
18919	120	2355	1094	1	1292	76	56.7	22	3
18920	120	2445	1094	1	1292	84.2	56.9	47	3
18921	120	2356	1094	1	1292	84.2	56.8	22	3
18922	120	3434	1094	1	1292	70.3	58.8	20	5
18923	120	3435	1094	1	1292	75.9	60	20	5
18924	120	3436	1094	1	1292	69.5	58.9	20	5
18925	120	3437	1094	1	1292	69.5	56.9	62	13
18926	120	3438	1094	1	1292	80.1	57.7	40	10
18927	120	2158	1094	1	1293	0	71.1	75	0
18928	120	2134	1094	1	1293	0	70.3	75	0
18929	120	3427	1094	1	1293	0	58.8	50	0
18930	120	3428	1094	1	1293	0	60.9	75	0
18931	120	2319	1094	1	1293	0	67	75	0
18932	120	2345	1094	1	1293	0	60	75	0
18933	120	2176	1094	1	1293	0	61.1	75	0
18934	120	2180	1094	1	1293	0	60.8	75	0
18935	120	2181	1094	1	1293	0	59.9	175	0
18936	120	3429	1094	1	1293	0	59.9	50	0
18937	120	3430	1094	1	1293	0	57.8	50	0
18938	120	2354	1094	1	1293	0	61.1	50	0
18939	120	2444	1094	1	1293	0	60.9	75	0
18940	120	2355	1094	1	1293	0	58	75	0
18941	120	2445	1094	1	1293	0	60.7	75	0
18942	120	2356	1094	1	1293	0	56.9	75	0
18943	120	3434	1094	1	1293	0	63.8	25	0
18944	120	3435	1094	1	1293	0	66	25	0
18945	120	3436	1094	1	1293	0	61.2	25	0
18946	120	3437	1094	1	1293	0	61.7	50	0
18947	120	2158	1095	1	1292	147.2	92.6	24	1
18948	120	3426	1095	1	1292	174.2	113.1	24	1
18949	120	2134	1095	1	1292	145.2	96.1	23	2
18950	120	3428	1095	1	1292	0	65.5	22	3
18951	120	2319	1095	1	1292	132.3	87.4	24	1
18952	120	2345	1095	1	1292	0	60.4	20	5
18953	120	2176	1095	1	1292	69.8	58	20	5
18954	120	2180	1095	1	1292	69.6	61.8	22	3
18955	120	2181	1095	1	1292	74.4	62.2	20	5
18956	120	3429	1095	1	1292	81.4	59.4	23	2
18957	120	3430	1095	1	1292	0	58.2	23	2
18958	120	2354	1095	1	1292	0	59	23	2
18959	120	2444	1095	1	1292	68.2	56.8	22	3
18960	120	2355	1095	1	1292	72.9	58.9	23	2
18961	120	2445	1095	1	1292	70.8	57.8	23	2
18962	120	2356	1095	1	1292	0	62.7	23	2
18963	120	3437	1095	1	1292	68.3	56.8	23	2
18964	120	2158	1095	1	1293	0	75.8	25	0
18965	120	2134	1095	1	1293	0	75.9	25	0
18966	120	3428	1095	1	1293	0	59.3	25	0
18967	120	2319	1095	1	1293	0	75.8	25	0
18968	120	2345	1095	1	1293	0	56.8	25	0
18969	120	2176	1095	1	1293	0	58.9	25	0
18970	120	2180	1095	1	1293	0	56.9	25	0
18971	120	2181	1095	1	1293	0	59.9	25	0
18972	120	2354	1095	1	1293	0	57.7	25	0
18973	120	2444	1095	1	1293	0	57.8	25	0
18974	120	2355	1095	1	1293	0	59.1	25	0
18975	120	2445	1095	1	1293	0	60	25	0
18976	120	2356	1095	1	1293	0	56.7	25	0
18977	120	3437	1095	1	1293	0	63.1	25	0
18978	121	2018	1096	1	1294	143	123.4	20	10
18979	121	2019	1096	1	1294	85.3	63.6	30	20
18980	121	2020	1096	1	1294	95.5	68	35	15
18981	121	2021	1096	1	1294	168.1	152.1	35	15
18982	121	2024	1096	1	1294	115.4	93.6	20	10
18983	121	2027	1096	1	1294	127.9	101.8	30	20
18984	121	2029	1096	1	1294	151.4	115.7	20	5
18985	121	2030	1096	1	1294	163.6	148.9	15	10
18986	121	2031	1096	1	1294	133.9	116.3	35	15
18987	121	2032	1096	1	1294	125.1	104.3	15	10
18988	121	2033	1096	1	1294	139	117.6	35	15
18989	121	2034	1096	1	1294	160.7	132.3	35	15
18990	121	2035	1096	1	1294	74.6	64.2	35	15
18991	121	2013	1096	1	1294	170.8	158.2	35	15
18992	121	2018	1096	1	1295	0	73.4	25	0
18993	121	2021	1096	1	1295	0	59.4	50	0
18994	121	2024	1096	1	1295	0	88.9	25	0
18995	121	2029	1096	1	1295	0	78.7	25	0
18996	121	2030	1096	1	1295	0	73.5	25	0
18997	121	2032	1096	1	1295	0	80.9	25	0
18998	121	2033	1096	1	1295	0	91.9	25	0
18999	121	2034	1096	1	1295	0	61.4	25	0
19000	121	2035	1096	1	1295	0	57.2	50	0
19001	121	2018	1097	1	1294	98	82.2	15	5
19002	121	2024	1097	1	1294	71.3	63.2	15	5
19003	121	2036	1097	1	1294	137.7	120.5	35	15
19004	121	2013	1097	1	1294	166.3	145.3	20	5
19005	121	2018	1097	1	1295	0	72.8	25	0
19006	121	2024	1097	1	1295	0	68.9	25	0
19007	122	3439	1098	1	1296	112	75.5	20	5
19008	122	2778	1098	1	1296	129.2	114.1	20	5
19009	122	2124	1098	1	1296	140.5	105.2	55	20
19010	122	2451	1098	1	1296	141.1	62.5	20	5
19011	122	2156	1098	1	1296	97	78.2	15	10
19012	122	2162	1098	1	1296	88.5	63.1	40	10
19013	122	2536	1098	1	1296	104	75.5	30	20
19014	122	2157	1098	1	1296	159.2	120.4	15	5
19015	122	2127	1098	1	1296	133.2	125.8	33	17
19016	122	2191	1098	1	1296	121.7	106	35	15
19017	122	2158	1098	1	1296	162.5	117.8	15	5
19018	122	2453	1098	1	1296	136.3	59.2	20	5
19019	122	2195	1098	1	1296	115.2	95	20	5
19020	122	2129	1098	1	1296	84.2	70.4	25	15
19021	122	2166	1098	1	1296	96.4	71.2	15	10
19022	122	2167	1098	1	1296	69.3	61.2	25	15
19023	122	2002	1098	1	1296	124.7	92.4	25	15
19024	122	2003	1098	1	1296	176.1	163.1	30	20
19025	122	2004	1098	1	1296	156.9	141	15	10
19026	122	2005	1098	1	1296	132.2	85.9	20	20
19027	122	2130	1098	1	1296	151	123.8	55	20
19028	122	2131	1098	1	1296	112	71.3	35	20
19029	122	2435	1098	1	1296	107	79.5	15	10
19030	122	2132	1098	1	1296	100.8	75.5	35	25
19031	122	2008	1098	1	1296	164.3	152.9	15	10
19032	122	2315	1098	1	1296	103.2	84	15	8
19033	122	3440	1098	1	1296	0	0	0	1
19034	122	3441	1098	1	1296	0	0	0	1
19035	122	2133	1098	1	1296	123.9	81.9	15	5
19036	122	2134	1098	1	1296	170	136.4	15	5
19037	122	2739	1098	1	1296	166.7	131	15	5
19038	122	2135	1098	1	1296	94.5	71.6	33	17
19039	122	2342	1098	1	1296	72.7	64.8	15	10
19040	122	2136	1098	1	1296	119.5	88.2	23	12
19041	122	2462	1098	1	1296	86.4	70.7	20	5
19042	122	2319	1098	1	1296	150.1	105.4	15	5
19043	122	2741	1098	1	1296	115.1	81.8	30	10
19044	122	2139	1098	1	1296	136.1	107.3	45	30
19045	122	2174	1098	1	1296	141.4	109.1	15	5
19046	122	2202	1098	1	1296	100.3	66.2	40	10
19047	122	2141	1098	1	1296	70.8	63.3	25	15
19048	122	2407	1098	1	1296	141.7	93.4	15	5
19049	122	2142	1098	1	1296	68.6	57.8	15	10
19050	122	2143	1098	1	1296	76.5	66.3	33	17
19051	122	2204	1098	1	1296	0	0	0	1
19052	122	2205	1098	1	1296	95.4	67.8	20	4
19053	122	2206	1098	1	1296	71.6	65	15	10
19054	122	2144	1098	1	1296	124.3	89.2	40	10
19055	122	2213	1098	1	1296	68.5	62.1	35	15
19056	122	2160	1098	1	1296	82	59.8	35	15
19057	122	2161	1098	1	1296	74.8	58	35	15
19058	122	2146	1098	1	1296	149.1	69.7	20	5
19059	122	2214	1098	1	1296	151	123.8	15	5
19060	122	2554	1098	1	1296	71.4	56.8	30	20
19061	122	2624	1098	1	1296	78.7	57.4	17	3
19062	122	2149	1098	1	1296	111.5	57.3	17	3
19063	122	2327	1098	1	1296	161.5	81.1	17	3
19064	122	2328	1098	1	1296	101.7	68.9	17	3
19065	122	2151	1098	1	1296	100.8	64.8	17	3
19066	122	2152	1098	1	1296	141.1	101.2	17	3
19067	122	2601	1098	1	1296	164.8	57.5	17	3
19068	122	2329	1098	1	1296	165.9	59.6	17	3
19069	122	2643	1098	1	1296	165.9	64.1	17	3
19070	122	2153	1098	1	1296	149.2	58.3	17	3
19071	122	2551	1098	1	1296	165.9	135.6	35	15
19072	122	2351	1098	1	1296	68	56.7	35	15
19073	122	2180	1098	1	1296	69.2	58.5	20	5
19074	122	2154	1098	1	1296	160.3	135.2	33	17
19075	122	2011	1098	1	1296	168.8	157.1	15	5
19076	122	2012	1098	1	1296	98.9	58.8	15	5
19077	122	2182	1098	1	1296	74.8	58	20	5
19078	122	2183	1098	1	1296	102.1	69.6	15	10
19079	122	2184	1098	1	1296	102.6	61.1	40	10
19080	122	2155	1098	1	1296	148.1	121.7	15	10
19081	122	2185	1098	1	1296	78.9	60.1	20	5
19082	122	2357	1098	1	1296	76.4	59.8	35	15
19083	122	2186	1098	1	1296	100.6	66.1	20	5
19084	122	2334	1098	1	1296	179.3	160.3	15	5
19085	122	3439	1098	1	1297	0	69.4	25	0
19086	122	2162	1098	1	1297	0	66.3	25	0
19087	122	2157	1098	1	1297	0	83	25	0
19088	122	2127	1098	1	1297	0	116.4	25	0
19089	122	2158	1098	1	1297	0	96.5	25	0
19090	122	2195	1098	1	1297	0	96.3	25	0
19091	122	2129	1098	1	1297	0	69.3	25	0
19092	122	2166	1098	1	1297	0	67.1	25	0
19093	122	2130	1098	1	1297	0	111.5	25	0
19094	122	2435	1098	1	1297	0	71.4	25	0
19095	122	2132	1098	1	1297	0	70.7	25	0
19096	122	2335	1098	1	1297	0	58.8	25	0
19097	122	2133	1098	1	1297	0	69.2	25	0
19098	122	2134	1098	1	1297	0	122.9	25	0
19099	122	2342	1098	1	1297	0	64.2	25	0
19100	122	2319	1098	1	1297	0	73.8	25	0
19101	122	2202	1098	1	1297	0	66.5	25	0
19102	122	2407	1098	1	1297	0	69.9	25	0
19103	122	2143	1098	1	1297	0	68.4	25	0
19104	122	2206	1098	1	1297	0	64	25	0
19105	122	2144	1098	1	1297	0	85.8	25	0
19106	122	2213	1098	1	1297	0	64.9	25	0
19107	122	2160	1098	1	1297	0	68.6	25	0
19108	122	2214	1098	1	1297	0	82.8	25	0
19109	122	2554	1098	1	1297	0	62.9	25	0
19110	122	2551	1098	1	1297	0	57.2	25	0
19111	122	2351	1098	1	1297	0	63.1	25	0
19112	122	2154	1098	1	1297	0	106.3	25	0
19113	122	2182	1098	1	1297	0	64.4	25	0
19114	122	2183	1098	1	1297	0	67.2	25	0
19115	122	2185	1098	1	1297	0	64.3	25	0
19116	122	2357	1098	1	1297	0	64.1	25	0
19117	122	2186	1098	1	1297	0	66.3	25	0
19118	122	2136	1098	1	1298	0	62.6	125	0
19119	122	2156	1099	1	1296	74.8	60.3	15	10
19120	122	2127	1099	1	1296	89	77.5	17	8
19121	122	2014	1099	1	1296	127.6	99.7	25	15
19122	122	2131	1099	1	1296	69.4	56.9	15	5
19123	122	2134	1099	1	1296	145.9	124.2	15	5
19124	122	2135	1099	1	1296	68.5	57.7	17	8
19125	122	2342	1099	1	1296	0	57.8	15	10
19126	122	2136	1099	1	1296	85.3	65.1	17	8
19127	122	2139	1099	1	1296	91.3	63.2	15	10
19128	122	2143	1099	1	1296	68	57.8	17	8
19129	122	2154	1099	1	1296	87.2	57.9	17	8
19130	122	2136	1099	1	1298	0	57.7	25	0
19131	123	3442	1100	1	1299	101.9	59.7	20	5
19132	123	2158	1100	1	1299	156.5	111.5	30	5
19133	123	2128	1100	1	1299	121.7	91.1	25	25
19134	123	2129	1100	1	1299	76.9	69.4	25	25
19135	123	2166	1100	1	1299	108.3	83.3	25	25
19136	123	2003	1100	1	1299	162.1	146.4	40	40
19137	123	2359	1100	1	1299	80.1	69.3	20	30
19138	123	2857	1100	1	1299	80.2	69.5	20	40
19139	123	2360	1100	1	1299	69.6	57.9	15	25
19140	123	2196	1100	1	1299	68.4	64.2	10	25
19141	123	2159	1100	1	1299	68.2	61.1	25	35
19142	123	2134	1100	1	1299	155.4	125.3	25	25
19143	123	3443	1100	1	1299	103.9	84.1	35	40
19144	123	2172	1100	1	1299	69.4	61.8	25	15
19145	123	2173	1100	1	1299	84	68.7	15	15
19146	123	2362	1100	1	1299	68.6	60.7	15	25
19147	123	2176	1100	1	1299	68.3	61.2	20	15
19148	123	2141	1100	1	1299	69.4	64.4	15	15
19149	123	2177	1100	1	1299	68	61.1	20	20
19150	123	2142	1100	1	1299	73.8	64.2	20	20
19151	123	2208	1100	1	1299	68.5	59.1	20	15
19152	123	2855	1100	1	1299	92.6	71.8	20	15
19153	123	2210	1100	1	1299	68	60.1	20	20
19154	123	2363	1100	1	1299	69.1	63.1	20	20
19155	123	2212	1100	1	1299	68.1	62	25	35
19156	123	2213	1100	1	1299	70.2	65.2	20	20
19157	123	2331	1100	1	1299	151.4	86.1	35	5
19158	123	2179	1100	1	1299	118.2	83.1	25	25
19159	123	2364	1100	1	1299	73.7	64.6	20	20
19160	123	2216	1100	1	1299	70.2	62.9	25	35
19161	123	2217	1100	1	1299	68.4	65.2	10	25
19162	123	2365	1100	1	1299	71.5	65	20	20
19163	123	3444	1100	1	1299	68.2	62.8	20	20
19164	123	2181	1100	1	1299	69.1	64.2	10	15
19165	123	2155	1100	1	1299	160.9	150	25	25
19166	123	2366	1100	1	1299	98.6	83.1	25	25
19167	123	3445	1100	1	1299	76.2	56.8	30	20
19168	123	3446	1100	1	1299	176.4	147.7	25	5
19169	123	3447	1100	1	1299	174.9	148.9	25	5
19170	123	2158	1100	1	1300	0	79.1	50	0
19171	123	2856	1100	1	1300	0	67.3	50	0
19172	123	2166	1100	1	1300	0	73.3	40	0
19173	123	2359	1100	1	1300	0	66.4	50	0
19174	123	2857	1100	1	1300	0	67.6	40	0
19175	123	2360	1100	1	1300	0	56.7	50	0
19176	123	2196	1100	1	1300	0	64.6	50	0
19177	123	2361	1100	1	1300	0	64.1	50	0
19178	123	2134	1100	1	1300	0	83.7	50	0
19179	123	3448	1100	1	1300	0	67.1	50	0
19180	123	2142	1100	1	1300	0	64.9	50	0
19181	123	2212	1100	1	1300	0	67.4	40	0
19182	123	2213	1100	1	1300	0	66.3	30	0
19183	123	2216	1100	1	1300	0	66.1	50	0
19184	123	2217	1100	1	1300	0	65.4	40	0
19185	123	3449	1100	1	1300	0	65.2	40	0
19186	123	2155	1100	1	1300	0	113.2	50	0
19187	123	2366	1100	1	1300	0	76.5	50	0
19188	123	2158	1101	1	1299	143	118.2	10	5
19189	123	2129	1101	1	1299	82.1	58.9	20	5
19190	123	2166	1101	1	1299	78.8	60.2	20	5
19191	123	2857	1101	1	1299	68.2	57	10	10
19192	123	2196	1101	1	1299	70.8	57	10	5
19193	123	2159	1101	1	1299	73.6	56.9	10	5
19194	123	2134	1101	1	1299	143	120.9	20	5
19195	123	2212	1101	1	1299	71.8	57	10	5
19196	123	2216	1101	1	1299	68.4	57	10	5
19197	123	2217	1101	1	1299	68.5	57.3	10	5
19198	123	2181	1101	1	1299	78.4	56.8	15	10
19199	123	2155	1101	1	1299	127.1	112.7	20	5
19200	123	2366	1101	1	1299	74.6	64.4	20	5
19201	123	2158	1101	1	1300	0	88.6	10	0
19202	123	2166	1101	1	1300	0	67.5	10	0
19203	123	2857	1101	1	1300	0	66.3	10	0
19204	123	2134	1101	1	1300	0	97.1	10	0
19205	123	2212	1101	1	1300	0	65.3	10	0
19206	123	2216	1101	1	1300	0	65.8	10	0
19207	123	2217	1101	1	1300	0	65.3	10	0
19208	123	3449	1101	1	1300	0	65.3	10	0
19209	123	2155	1101	1	1300	0	89.8	10	0
19210	123	2366	1101	1	1300	0	73	10	0
\.


--
-- Data for Name: lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lang (id, name, univer_id, location) FROM stdin;
894	O‘zbek	1	uz
895	Rus	1	ru
896	O‘zbek	2	uz
897	Rus	2	ru
898	O‘zbek	3	uz
899	Rus	3	ru
900	O‘zbek	4	uz
901	Rus	4	ru
902	O‘zbek	5	uz
903	O‘zbek	6	uz
904	Rus	6	ru
905	O‘zbek	7	uz
906	O‘zbek	8	uz
907	Rus	8	ru
908	O‘zbek	9	uz
909	Rus	9	ru
910	O‘zbek	10	uz
911	Rus	10	ru
912	O‘zbek	11	uz
913	Rus	11	ru
914	O‘zbek	12	uz
915	Rus	12	ru
916	O‘zbek	13	uz
917	Rus	13	ru
918	O‘zbek	14	uz
919	Rus	14	ru
920	O‘zbek	15	uz
921	Rus	15	ru
922	O‘zbek	16	uz
923	Rus	16	ru
924	O‘zbek	17	uz
925	Rus	17	ru
926	O‘zbek	18	uz
927	Rus	18	ru
928	O‘zbek	19	uz
929	Rus	19	ru
930	O‘zbek	20	uz
931	Rus	20	ru
932	O‘zbek	21	uz
933	O‘zbek	22	uz
934	Rus	22	ru
935	O‘zbek	23	uz
936	O‘zbek	24	uz
937	Rus	24	ru
938	O‘zbek	25	uz
939	Rus	25	ru
940	O‘zbek	26	uz
941	Rus	26	ru
942	O‘zbek	27	uz
943	Rus	27	ru
944	O‘zbek	28	uz
945	O‘zbek	29	uz
946	Rus	29	ru
947	O‘zbek	30	uz
948	Rus	30	ru
949	O‘zbek	31	uz
950	Rus	31	ru
951	O‘zbek	32	uz
952	Rus	32	ru
953	O‘zbek	33	uz
954	Rus	33	ru
955	O‘zbek	34	uz
956	Rus	34	ru
957	O‘zbek	35	uz
958	Rus	35	ru
959	O‘zbek	36	uz
960	Rus	36	ru
961	O‘zbek	37	uz
962	Rus	37	ru
963	O‘zbek	38	uz
964	O‘zbek	39	uz
965	O‘zbek	40	uz
966	Rus	40	ru
967	O‘zbek	41	uz
968	O‘zbek	42	uz
969	O‘zbek	43	uz
970	Rus	43	ru
971	O‘zbek	44	uz
972	Rus	44	ru
973	O‘zbek	45	uz
974	O‘zbek	46	uz
975	Rus	46	ru
976	O‘zbek	47	uz
977	Rus	47	ru
978	O‘zbek	48	uz
979	O‘zbek	49	uz
980	Rus	49	ru
981	O‘zbek	50	uz
982	O‘zbek	51	uz
983	Rus	51	ru
984	O‘zbek	52	uz
985	Rus	52	ru
986	O‘zbek	53	uz
987	Rus	53	ru
988	O‘zbek	54	uz
989	Rus	54	ru
990	O‘zbek	55	uz
991	Rus	55	ru
992	O‘zbek	56	uz
993	O‘zbek	57	uz
994	Rus	57	ru
995	O‘zbek	58	uz
996	Rus	58	ru
997	O‘zbek	59	uz
998	Rus	59	ru
999	O‘zbek	60	uz
1000	Rus	60	ru
1001	O‘zbek	61	uz
1002	O‘zbek	63	uz
1003	Rus	63	ru
1004	O‘zbek	64	uz
1005	O‘zbek	65	uz
1006	Rus	65	ru
1007	O‘zbek	66	uz
1008	Rus	66	ru
1009	O‘zbek	67	uz
1010	O‘zbek	68	uz
1011	Rus	68	ru
1012	O‘zbek	69	uz
1013	Rus	69	ru
1014	O‘zbek	70	uz
1015	Rus	70	ru
1016	O‘zbek	71	uz
1017	O‘zbek	72	uz
1018	O‘zbek	73	uz
1019	Rus	73	ru
1020	O‘zbek	74	uz
1021	Rus	74	ru
1022	O‘zbek	75	uz
1023	Rus	75	ru
1024	O‘zbek	77	uz
1025	Rus	77	ru
1081	O‘zbek	113	uz
1082	Rus	113	ru
1083	O‘zbek	114	uz
1084	Rus	114	ru
1085	O‘zbek	115	uz
1086	O‘zbek	116	uz
1087	Rus	116	ru
1088	O‘zbek	117	uz
1089	Rus	117	ru
1090	O‘zbek	118	uz
1091	Rus	118	ru
1092	O‘zbek	119	uz
1093	Rus	119	ru
1094	O‘zbek	120	uz
1095	Rus	120	ru
1096	O‘zbek	121	uz
1097	Rus	121	ru
1098	O‘zbek	122	uz
1099	Rus	122	ru
1100	O‘zbek	123	uz
1101	Rus	123	ru
1103	Rus	92	ru
1102	O‘zbek	92	uz
1026	O‘zbek	80	uz
1027	Rus	80	ru
1028	O‘zbek	81	uz
1029	Rus	81	ru
1030	O‘zbek	82	uz
1031	O‘zbek	83	uz
1032	Rus	83	ru
1033	O‘zbek	84	uz
1034	O‘zbek	85	uz
1035	Rus	85	ru
1036	O‘zbek	86	uz
1037	Rus	86	ru
1038	O‘zbek	87	uz
1039	O‘zbek	88	uz
1040	Rus	88	ru
1041	O‘zbek	89	uz
1042	Rus	89	ru
1043	O‘zbek	90	uz
1044	Rus	90	ru
1045	O‘zbek	91	uz
1046	Rus	91	ru
1047	O‘zbek	93	uz
1048	O‘zbek	94	uz
1049	Rus	94	ru
1050	O‘zbek	95	uz
1051	Rus	95	ru
1052	O‘zbek	96	uz
1053	Rus	96	ru
1054	O‘zbek	97	uz
1055	O‘zbek	98	uz
1056	Rus	98	ru
1057	O‘zbek	99	uz
1058	Rus	99	ru
1059	O‘zbek	100	uz
1060	O‘zbek	101	uz
1061	Rus	101	ru
1062	O‘zbek	102	uz
1063	Rus	102	ru
1064	O‘zbek	103	uz
1065	Rus	103	ru
1066	O‘zbek	104	uz
1067	Rus	104	ru
1068	O‘zbek	105	uz
1069	Rus	105	ru
1070	O‘zbek	106	uz
1071	Rus	106	ru
1072	O‘zbek	107	uz
1073	Rus	107	ru
1074	O‘zbek	108	uz
1075	Rus	108	ru
1076	O‘zbek	110	uz
1077	Rus	110	ru
1078	O‘zbek	111	uz
1079	Rus	111	ru
1080	O‘zbek	112	uz
\.


--
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.request (id, user_id, univer_name, abiturient_id, objects, created_at, updated_at, type) FROM stdin;
2702b7f8-7509-419a-a33a-656cf250a9fc	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	\N	2024-07-23 09:57:18	2024-07-23 09:57:33.162	\N
9b9571e7-7680-457d-9c32-3f40d566037a	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	\N	2024-07-23 10:08:56.864	2024-07-23 10:09:02.474	\N
0d5d0584-47b4-496f-88bb-7b0165b7ffee	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	\N	2024-07-23 10:15:38.598	2024-07-23 10:15:52.53	\N
b0f04ab7-73f6-4bee-9b03-7c17e6c8c03b	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	\N	2024-07-23 10:18:58.253	2024-07-23 10:19:04.914	\N
d3607645-c524-4cfa-b65b-49537e1a65d6	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	\N	2024-07-23 10:21:00.135	2024-07-23 10:21:04.444	\N
83198fa8-4dd4-4eb2-9c94-e94df65796bd	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	\N	2024-07-23 10:22:27.931	2024-07-23 10:22:37.467	\N
be70c048-e0e9-499d-a328-241e09dadb79	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:40:15.962	2024-07-23 10:40:22.486	\N
9d67c9bc-bdbe-4a3d-a498-2f5cfe0299b1	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:43:19.034	2024-07-23 10:43:24.219	\N
4e286b83-6b10-4a4f-a44a-133a918c2a53	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:58:28.556	2024-07-23 10:58:34.782	\N
deccf796-39ab-43cf-a20f-53bc9ca8fda3	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:50:47.849	2024-07-23 10:50:54.701	\N
a2dc44fb-2847-4ca8-85d3-cb6d52712820	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:52:25.071	2024-07-23 10:52:30.264	\N
5b5044e6-ccf4-425b-97fd-23817cddfaee	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:12:18.8	2024-07-23 11:14:12.236	\N
e8df3fbd-914c-4b16-a120-0e06b2112e0d	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:53:38.032	2024-07-23 10:53:40.464	\N
b4f24821-706f-47dd-b46a-d3ddf2fa0f61	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:59:56.773	2024-07-23 10:59:59.503	\N
9d074647-f688-445f-9785-cca61f56ec3a	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:54:43.724	2024-07-23 10:54:46.46	\N
a8cb6e39-7649-41f7-a46f-5c37ee67499d	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 10:55:59.955	2024-07-23 10:56:02.111	\N
b6e4f626-7f45-4ce5-9d59-54d338e3b079	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:03:58.374	2024-07-23 11:04:10.309	\N
f9e5e215-df0c-43db-afd5-0e5531d8eedd	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:03:29.818	2024-07-23 11:03:42.447	\N
a37b065c-ff76-4ed1-b541-6556958b78cb	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:06:12.731	2024-07-23 11:06:23.462	\N
a1ff92ed-ff72-47f2-8781-6d1f580d528a	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:18:15.817	2024-07-23 11:18:30.957	\N
8958c3e7-d60f-45bc-a970-07a6bb7a9901	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:27:25.656	2024-07-23 11:27:31.79	\N
58081ce0-717b-4108-a5e8-6a1946e278c9	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:31:14.584	2024-07-23 11:31:20.417	\N
4c12f51b-e34a-43c5-a578-89a370b447cb	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:17:46.336	2024-07-23 12:17:55.688	\N
c28b1110-b076-4d6f-a642-02f352900932	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:26:34.488	2024-07-23 12:26:44.049	contract
1aa58a46-bd79-42f9-af35-fe5be0954289	ddda7bb1-8236-43ce-a18a-42212cb66f71	Mirzo Ulug‘bek nomidagi O‘zbekiston milliy universiteti Jizzax filiali	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:31:52.145	2024-07-23 11:32:16.916	\N
421f2226-0f3c-45ac-b605-901642748946	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:32:39.008	2024-07-23 11:32:40.889	\N
7e969d12-45f5-4039-8a6b-76f3e66e36ae	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:18:10.192	2024-07-23 12:20:02.874	\N
eae9e7c8-7f24-43d1-97f8-97a5713993a6	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:33:48.91	2024-07-23 11:33:50.511	\N
0637d9dc-41f5-4f0b-b871-09ebafae7cfa	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 11:35:02.072	2024-07-23 11:35:04.064	\N
07f18761-7385-4105-b09b-1c74000e177a	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	\N	\N	2024-07-23 12:12:28.686	2024-07-23 12:12:28.686	\N
ef0b1762-af88-44e9-9f67-9f27df02cedc	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:20:18.409	2024-07-23 12:20:23.164	\N
96f82c2a-73fa-4cc0-97ad-fe695963310f	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:13:14.635	2024-07-23 12:13:29.699	\N
7a5cd3be-caed-47c1-9839-136e2b0ccbb6	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:27:32.744	2024-07-23 12:27:36.955	grant
5b8e5e5d-1874-44dc-819b-c590d08ecbac	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:23:33.152	2024-07-23 12:23:38.83	\N
5463369e-3092-4ad7-8c43-d8ae5c6c3138	ddda7bb1-8236-43ce-a18a-42212cb66f71	Andijon davlat chet tillari instituti	\N	\N	2024-07-23 12:26:21.815	2024-07-23 12:26:21.815	\N
439a9796-65e5-46e7-9a06-99bdd1a53127	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:35:47.372	2024-07-23 12:35:56.122	contract
a2de5a6a-9b2d-4391-9c77-f3ec354726c9	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:28:13.136	2024-07-23 12:28:20.241	contract
98c250d3-20d1-44cd-a1b8-1706ba4bfe94	ddda7bb1-8236-43ce-a18a-42212cb66f71	Toshkent axborot texnologiyalari universiteti	4869591	{"subjects": {"language": "1", "firstSubject": "Matematika", "secondSubject": "Fizika"}, "applicants": [{"id": "4869591", "name": "ZARIFOVA S. R.", "score": "170", "detailsLink": "/Bakalavr2024/Details?hashId=7e2e3221c445c57abd4ff501a2ac395c"}]}	2024-07-23 12:36:29.546	2024-07-23 12:36:32.863	grant
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (id, name, univer_id, location) FROM stdin;
1279	Kunduzgi	113	kunduzgi
1280	Sirtqi	113	sirtqi
1281	Kunduzgi	114	kunduzgi
1282	Sirtqi	114	sirtqi
1283	Kechki	114	kechki
1284	Masofaviy	114	masofaviy_2
1285	Kunduzgi	115	kunduzgi
1286	Sirtqi	115	sirtqi
1287	Kechki	115	kechki
1288	Kunduzgi	116	kunduzgi
1289	Kunduzgi	117	kunduzgi
1290	Kunduzgi	118	kunduzgi
1291	Kunduzgi	119	kunduzgi
1292	Kunduzgi	120	kunduzgi
1293	Sirtqi	120	sirtqi
1294	Kunduzgi	121	kunduzgi
1295	Sirtqi	121	sirtqi
1296	Kunduzgi	122	kunduzgi
1297	Sirtqi	122	sirtqi
1298	Masofaviy	122	masofaviy_2
1299	Kunduzgi	123	kunduzgi
1300	Sirtqi	123	sirtqi
1044	Kunduzgi	1	kunduzgi
1045	Kunduzgi	2	kunduzgi
1046	Sirtqi	2	sirtqi
1047	Kechki	2	kechki
1048	Kunduzgi	3	kunduzgi
1049	Kunduzgi	4	kunduzgi
1050	Sirtqi	4	sirtqi
1051	Masofaviy	4	masofaviy_2
1052	Kunduzgi	5	kunduzgi
1053	Sirtqi	5	sirtqi
1054	Kechki	5	kechki
1055	Kunduzgi	6	kunduzgi
1056	Sirtqi	6	sirtqi
1057	Kunduzgi	7	kunduzgi
1058	Sirtqi	7	sirtqi
1059	Kunduzgi	8	kunduzgi
1060	Sirtqi	8	sirtqi
1061	Kechki	8	kechki
1062	Kunduzgi	9	kunduzgi
1063	Kunduzgi	10	kunduzgi
1064	Sirtqi	10	sirtqi
1065	Kechki	10	kechki
1066	Masofaviy	10	masofaviy_2
1067	Kunduzgi	11	kunduzgi
1068	Sirtqi	11	sirtqi
1069	Kechki	11	kechki
1070	Kunduzgi	12	kunduzgi
1071	Sirtqi	12	sirtqi
1072	Kunduzgi	13	kunduzgi
1073	Sirtqi	13	sirtqi
1074	Kechki	13	kechki
1075	Kunduzgi	14	kunduzgi
1076	Sirtqi	14	sirtqi
1077	Kunduzgi	15	kunduzgi
1078	Kunduzgi	16	kunduzgi
1079	Sirtqi	16	sirtqi
1080	Kunduzgi	17	kunduzgi
1081	Sirtqi	17	sirtqi
1082	Kunduzgi	18	kunduzgi
1083	Sirtqi	18	sirtqi
1084	Kunduzgi	19	kunduzgi
1301	Kunduzgi	92	kunduzgi
1085	Sirtqi	19	sirtqi
1086	Kunduzgi	20	kunduzgi
1087	Sirtqi	20	sirtqi
1088	Kunduzgi	21	kunduzgi
1089	Sirtqi	21	sirtqi
1090	Kunduzgi	22	kunduzgi
1091	Kunduzgi	23	kunduzgi
1092	Kunduzgi	24	kunduzgi
1093	Sirtqi	24	sirtqi
1094	Kunduzgi	25	kunduzgi
1095	Sirtqi	25	sirtqi
1096	Kunduzgi	26	kunduzgi
1097	Kunduzgi	27	kunduzgi
1098	Sirtqi	27	sirtqi
1099	Kunduzgi	28	kunduzgi
1100	Sirtqi	28	sirtqi
1101	Kunduzgi	29	kunduzgi
1102	Kechki	29	kechki
1103	Kunduzgi	30	kunduzgi
1104	Sirtqi	30	sirtqi
1105	Kechki	30	kechki
1106	Kunduzgi	31	kunduzgi
1107	Sirtqi	31	sirtqi
1108	Kechki	31	kechki
1109	Kunduzgi	32	kunduzgi
1110	Sirtqi	32	sirtqi
1111	Kunduzgi	33	kunduzgi
1112	Sirtqi	33	sirtqi
1113	Kechki	33	kechki
1114	Kunduzgi	34	kunduzgi
1115	Sirtqi	34	sirtqi
1116	Kunduzgi	35	kunduzgi
1117	Sirtqi	35	sirtqi
1118	Kunduzgi	36	kunduzgi
1119	Sirtqi	36	sirtqi
1120	Kechki	36	kechki
1121	Kunduzgi	37	kunduzgi
1122	Sirtqi	37	sirtqi
1123	Kechki	37	kechki
1124	Kunduzgi	38	kunduzgi
1125	Sirtqi	38	sirtqi
1126	Kunduzgi	39	kunduzgi
1127	Kunduzgi	40	kunduzgi
1128	Kunduzgi	41	kunduzgi
1129	Sirtqi	41	sirtqi
1130	Kunduzgi	42	kunduzgi
1131	Sirtqi	42	sirtqi
1132	Kunduzgi	43	kunduzgi
1133	Sirtqi	43	sirtqi
1134	Kechki	43	kechki
1135	Kunduzgi	44	kunduzgi
1136	Sirtqi	44	sirtqi
1137	Kunduzgi	45	kunduzgi
1138	Sirtqi	45	sirtqi
1139	Kunduzgi	46	kunduzgi
1140	Kunduzgi	47	kunduzgi
1141	Kunduzgi	48	kunduzgi
1142	Sirtqi	48	sirtqi
1143	Kunduzgi	49	kunduzgi
1144	Sirtqi	49	sirtqi
1145	Kunduzgi	50	kunduzgi
1146	Sirtqi	50	sirtqi
1147	Kunduzgi	51	kunduzgi
1148	Sirtqi	51	sirtqi
1149	Kunduzgi	52	kunduzgi
1150	Sirtqi	52	sirtqi
1151	Kechki	52	kechki
1152	Kunduzgi	53	kunduzgi
1153	Sirtqi	53	sirtqi
1154	Kechki	53	kechki
1155	Masofaviy	53	masofaviy_2
1156	Kunduzgi	54	kunduzgi
1157	Sirtqi	54	sirtqi
1158	Kunduzgi	55	kunduzgi
1159	Sirtqi	55	sirtqi
1160	Kunduzgi	56	kunduzgi
1161	Sirtqi	56	sirtqi
1162	Kechki	56	kechki
1163	Kunduzgi	57	kunduzgi
1164	Sirtqi	57	sirtqi
1165	Kechki	57	kechki
1166	Kunduzgi	58	kunduzgi
1167	Sirtqi	58	sirtqi
1168	Kunduzgi	59	kunduzgi
1169	Sirtqi	59	sirtqi
1170	Kunduzgi	60	kunduzgi
1171	Sirtqi	60	sirtqi
1172	Kunduzgi	61	kunduzgi
1173	Sirtqi	61	sirtqi
1174	Kunduzgi	63	kunduzgi
1175	Sirtqi	63	sirtqi
1176	Kunduzgi	64	kunduzgi
1177	Sirtqi	64	sirtqi
1178	Kunduzgi	65	kunduzgi
1179	Kunduzgi	66	kunduzgi
1180	Sirtqi	66	sirtqi
1181	Kechki	66	kechki
1182	Masofaviy	66	masofaviy_2
1183	Kunduzgi	67	kunduzgi
1184	Kunduzgi	68	kunduzgi
1185	Sirtqi	68	sirtqi
1186	Kunduzgi	69	kunduzgi
1187	Sirtqi	69	sirtqi
1188	Kunduzgi	70	kunduzgi
1189	Sirtqi	70	sirtqi
1190	Kechki	70	kechki
1191	Kunduzgi	71	kunduzgi
1192	Kunduzgi	72	kunduzgi
1193	Kunduzgi	73	kunduzgi
1194	Kunduzgi	74	kunduzgi
1195	Sirtqi	74	sirtqi
1196	Kechki	74	kechki
1197	Kunduzgi	75	kunduzgi
1198	Sirtqi	75	sirtqi
1199	Kunduzgi	77	kunduzgi
1200	Sirtqi	77	sirtqi
1201	Kunduzgi	80	kunduzgi
1202	Sirtqi	80	sirtqi
1203	Kechki	80	kechki
1204	Kunduzgi	81	kunduzgi
1205	Sirtqi	81	sirtqi
1206	Kunduzgi	82	kunduzgi
1207	Sirtqi	82	sirtqi
1208	Kunduzgi	83	kunduzgi
1209	Sirtqi	83	sirtqi
1210	Kechki	83	kechki
1211	Kunduzgi	84	kunduzgi
1212	Sirtqi	84	sirtqi
1213	Kechki	84	kechki
1214	Kunduzgi	85	kunduzgi
1215	Sirtqi	85	sirtqi
1216	Kechki	85	kechki
1217	Kunduzgi	86	kunduzgi
1218	Sirtqi	86	sirtqi
1219	Kechki	86	kechki
1220	Kunduzgi	87	kunduzgi
1221	Sirtqi	87	sirtqi
1222	Kunduzgi	88	kunduzgi
1223	Sirtqi	88	sirtqi
1224	Kechki	88	kechki
1225	Masofaviy	88	masofaviy_2
1226	Kunduzgi	89	kunduzgi
1227	Sirtqi	89	sirtqi
1228	Masofaviy	89	masofaviy_2
1229	Kunduzgi	90	kunduzgi
1230	Sirtqi	90	sirtqi
1231	Masofaviy	90	masofaviy_2
1232	Kunduzgi	91	kunduzgi
1233	Sirtqi	91	sirtqi
1234	Masofaviy	91	masofaviy_2
1235	Kunduzgi	93	kunduzgi
1236	Sirtqi	93	sirtqi
1237	Kunduzgi	94	kunduzgi
1238	Sirtqi	94	sirtqi
1239	Masofaviy	94	masofaviy_2
1240	Kunduzgi	95	kunduzgi
1241	Sirtqi	95	sirtqi
1242	Masofaviy	95	masofaviy_2
1243	Kunduzgi	96	kunduzgi
1244	Sirtqi	96	sirtqi
1245	Kunduzgi	97	kunduzgi
1246	Sirtqi	97	sirtqi
1247	Kunduzgi	98	kunduzgi
1248	Sirtqi	98	sirtqi
1249	Masofaviy	98	masofaviy_2
1250	Kunduzgi	99	kunduzgi
1251	Sirtqi	99	sirtqi
1252	Kunduzgi	100	kunduzgi
1253	Kunduzgi	101	kunduzgi
1254	Kechki	101	kechki
1255	Kunduzgi	102	kunduzgi
1256	Sirtqi	102	sirtqi
1257	Kechki	102	kechki
1258	Kunduzgi	103	kunduzgi
1259	Sirtqi	103	sirtqi
1260	Kechki	103	kechki
1261	Kunduzgi	104	kunduzgi
1262	Kunduzgi	105	kunduzgi
1263	Sirtqi	105	sirtqi
1264	Kechki	105	kechki
1265	Kunduzgi	106	kunduzgi
1266	Sirtqi	106	sirtqi
1267	Kechki	106	kechki
1268	Kunduzgi	107	kunduzgi
1269	Sirtqi	107	sirtqi
1270	Masofaviy	107	masofaviy_2
1271	Kunduzgi	108	kunduzgi
1272	Sirtqi	108	sirtqi
1273	Kunduzgi	110	kunduzgi
1274	Kunduzgi	111	kunduzgi
1275	Sirtqi	111	sirtqi
1276	Kechki	111	kechki
1277	Kunduzgi	112	kunduzgi
1278	Sirtqi	112	sirtqi
1302	Sirtqi	92	sirtqi
\.


--
-- Data for Name: universities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universities (id, name, location, "createdAt", "updatedAt") FROM stdin;
1	Andijon davlat chet tillari instituti	https://abt.uz/university/andijon-davlat-chet-tillari-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
2	Andijon davlat pedagogika instituti	https://abt.uz/university/andijon-davlat-universitetining-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
3	Andijon davlat tibbiyot instituti	https://abt.uz/university/andijon-tibbiyot-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
4	Andijon davlat universiteti	https://abt.uz/university/andijon-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
5	Andijon iqtisodiyot va qurilish instituti	https://abt.uz/university/andijon-iqtisodiyot-va-qurilish-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
6	Andijon mashinasozlik instituti	https://abt.uz/university/andijon-mashinasozlik-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
7	Andijon qishloq xo‘jaligi va agrotexnologiyalar instituti	https://abt.uz/university/andijon-qishloq-xojaligi-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
8	Buxoro davlat pedagogika instituti	https://abt.uz/university/buxoro-davlat-universitetining-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
9	Buxoro davlat tibbiyot instituti	https://abt.uz/university/buxoro-davlat-tibbiyot-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
10	Buxoro davlat universiteti	https://abt.uz/university/buxoro-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
11	Buxoro muhandislik-texnologiya instituti	https://abt.uz/university/buxoro-muhandislik-texnika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
12	Buxoro tabiiy resurslarni boshqarish instituti	https://abt.uz/university/toshkent-irrigatsiya-va-meliorasiya-instituti-buxoro-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
13	Chirchiq davlat pedagogika universiteti	https://abt.uz/university/toshkent-viloyati-chirchiq-davlat-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
14	Farg‘ona davlat universiteti	https://abt.uz/university/fargona-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
15	Farg‘ona jamoat salomatligi tibbiyot instituti	https://abt.uz/university/toshkent-tibbiyot-akademiyasi-fargona-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
16	Farg‘ona politexnika instituti	https://abt.uz/university/fargona-politexnika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
17	Geologiya fanlari universiteti	https://abt.uz/university/geologiya-fanlari-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
18	Guliston davlat pedagogika instituti	https://abt.uz/university/guliston-davlat-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
19	Guliston davlat universiteti	https://abt.uz/university/guliston-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
20	Ipak yo‘li xalqaro turizm universiteti	https://abt.uz/university/ipak-yoli-xalqaro-turizm-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
21	Islom Karimov nomidagi Toshkent davlat texnika universiteti Qoʻqon filiali	https://abt.uz/university/toshkent-davlat-texnika-universiteti-qo-qon-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
22	Jahon iqtisodiyoti va diplomatiya universiteti	https://abt.uz/university/jahon-iqtisodiyoti-va-diplomatiya-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
23	Jamoat xavfsizligi universiteti	https://abt.uz/university/jamoat-xavfsizligi-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
24	Jizzax davlat pedagogika universiteti	https://abt.uz/university/jizzax-davlat-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
25	Jizzax politexnika instituti	https://abt.uz/university/jizzax-politexnika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
26	Milliy estrada san’ati instituti	https://abt.uz/university/botir-zokirov-nomidagi-milliy-estrada-oliy-maktabi	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
27	Milliy rassomlik va dizayn instituti	https://abt.uz/university/milliy-rassomlik-va-dizayn-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
28	Mirzo Ulug‘bek nomidagi O‘zbekiston milliy universiteti Jizzax filiali	https://abt.uz/university/ozbekiston-milliy-universiteti-jizzax-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
29	Namangan davlat chet tillari instituti	https://abt.uz/university/namangan-davlat-chet-tillari-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
30	Namangan davlat pedagogika instituti	https://abt.uz/university/namangan-davlat-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
31	Namangan davlat universiteti	https://abt.uz/university/namangan-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
32	Namangan muhandislik-qurilish instituti	https://abt.uz/university/namangan-muhandislik-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
33	Namangan muhandislik-texnologiya instituti	https://abt.uz/university/namangan-muhandislik-texnologiya-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
34	Namangan to‘qimachilik sanoati instituti	https://abt.uz/university/namangan-toqimachilik-sanoati-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
35	Navoiy davlat konchilik va texnologiyalar universiteti	https://abt.uz/university/navoiy-davlat-konchilik-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
36	Navoiy davlat pedagogika instituti	https://abt.uz/university/navoiy-davlat-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
37	Nukus davlat pedagogika instituti	https://abt.uz/university/nukus-davlat-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
38	Nukus konchilik instituti	https://abt.uz/university/navoiy-davlat-konchilik-instituti-nukus-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
39	Oliy sport mahorati instituti	https://abt.uz/university/oliy-sport-mahorati-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
40	Oziq-ovqat texnologiyasi va muhandisligi xalqaro instituti	https://abt.uz/university/oziq-ovqat-texnologiyasi-va-muhandisligi-xalqaro-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
41	Oʻzbekiston davlat xoreografiya akademiyasi Urganch filiali	https://abt.uz/university/o-zbekiston-davlat-xoreografiya-akademiyasi-urganch-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
42	O‘zbek milliy musiqa sanʼati instituti	https://abt.uz/university/yunus-rajabiy-nomidagi-ozbek-milliy-musiqa-san-ati-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
43	O‘zbekiston davlat jahon tillari universiteti	https://abt.uz/university/ozbekiston-davlat-jahon-tillari-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
44	O‘zbekiston davlat jismoniy tarbiya va sport universiteti	https://abt.uz/university/ozbekiston-davlat-jismoniy-tarbiya-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
45	O‘zbekiston davlat jismoniy tarbiya va sport universiteti Nukus filiali	https://abt.uz/university/o-zbekiston-davlat-jismoniy-tarbiya-va-sport-universiteti-nukus-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
46	O‘zbekiston davlat konservatoriyasi	https://abt.uz/university/ozbekiston-davlat-konservatoriyasi	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
47	O‘zbekiston davlat konservatoriyasi Nukus filiali	https://abt.uz/university/ozbekiston-davlat-konservatoriyasi-nukus-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
48	O‘zbekiston davlat sanʼat va madaniyat institutining Farg‘ona mintaqaviy filiali	https://abt.uz/university/ozbekiston-davlat-sanat-va-madaniyat-institutining-fargona-mintaqaviy-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
49	O‘zbekiston davlat san’at va madaniyat instituti	https://abt.uz/university/ozbekiston-davlat-san-at-va-madaniyat-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
50	O‘zbekiston davlat san’at va madaniyat instituti Nukus filiali	https://abt.uz/university/ozbekiston-davlat-san-at-va-madaniyat-instituti-nukus-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
51	O‘zbekiston davlat xoreografiya akademiyasi	https://abt.uz/university/milliy-raqs-va-xoreografiya-oliy-maktabi	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
52	O‘zbekiston jurnalistika va ommaviy kommunikatsiyalar universiteti	https://abt.uz/university/ozbekiston-jurnalistika-va-ommaviy-kommunikatsiyalar-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
53	O‘zbekiston milliy universiteti	https://abt.uz/university/ozbekiston-milliy-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
54	O‘zbekiston Respublikasi Davlat soliq qo‘mitasi huzuridagi Fiskal institut	https://abt.uz/university/ozbekiston-respublikasi-davlat-soliq-qomitasi-huzuridagi-fiskal-institut	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
55	O‘zbekiston Respublikasi Huquqni muhofaza qilish akademiyasi	https://abt.uz/university/ozbekiston-respublikasi-huquqni-muhofaza-qilish-akademiyasi	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
56	O‘zbekiston xalqaro islom akademiyasi	https://abt.uz/university/toshkent-islom-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
57	O‘zbekiston-Finlyandiya pedagogika instituti	https://abt.uz/university/samarqand-davlat-universitetining-ozbekiston-finlyandiya-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
58	O‘zbekiston  davlat jismoniy tarbiya va sport universiteti Farg‘ona filiali	https://abt.uz/university/ozbekiston-davlat-jismoniy-tarbiya-va-sport-universiteti-fargona-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
59	Qarshi davlat universiteti	https://abt.uz/university/qarshi-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
60	Qarshi davlat universitetining Pedagogika instituti	https://abt.uz/university/qarshi-davlat-universitetining-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
61	Qarshi irrigatsiya va agrotexnologiyalar instituti	https://abt.uz/university/toshkent-irrigatsiya-va-qishloq-xo-jaligini-mexanizatsiyalash-muhandislari-instituti-qarshi-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
63	Qarshi muhandislik-iqtisodiyot instituti	https://abt.uz/university/qarshi-muhandislik-iqtisodiyot-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
64	Qoraqalpog‘iston qishloq xo‘jaligi va agrotexnologiyalar instituti	https://abt.uz/university/toshkent-davlat-agrar-universitetining-nukus-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
65	Qoraqalpog‘iston tibbiyot instituti	https://abt.uz/university/toshkent-pediatriya-tibbiyot-institutining-nukus-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
66	Qoraqalpoq davlat universiteti	https://abt.uz/university/qoraqalpoq-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
67	Qoraqalpoq davlat universiteti Chimboy fakulteti	https://abt.uz/university/qoraqalpoq-davlat-universiteti-chimboy-fakulteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
68	Qo‘qon davlat pedagogika instituti	https://abt.uz/university/qoqon-davlat-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
69	Samarqand davlat arxitektura-qurilish instituti	https://abt.uz/university/samarqand-davlat-arxitektura-qurilish-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
70	Samarqand davlat chet tillar instituti	https://abt.uz/university/samarqand-davlat-chet-tillar-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
71	Samarqand davlat chet tillar instituti Narpay “Xorijiy tillar” fakulteti	https://abt.uz/university/samarqand-davlat-chet-tillar-instituti-narpay-xorijiy-tillar-fakul-teti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
72	Samarqand davlat chet tillari instituti Payariq “Xorijiy tillar” fakulteti	https://abt.uz/university/samarqand-davlat-chet-tillar-instituti-payariq-xorijiy-tillar-fakul-teti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
73	Samarqand davlat tibbiyot universiteti	https://abt.uz/university/samarqand-tibbiyot-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
74	Samarqand davlat universiteti	https://abt.uz/university/samarqand-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
75	Samarqand davlat universiteti Kattaqo‘rg‘on filiali	https://abt.uz/university/samarqand-davlat-universiteti-kattaqorgon-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
77	Samarqand davlat universitetining Denov tadbirkorlik va pedagogika instituti	https://abt.uz/university/termiz-davlat-universitetining-denov-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
80	Samarqand iqtisodiyot va servis instituti	https://abt.uz/university/samarqand-iqtisodiyot-va-servis-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
81	Samarqand veterinariya meditsinasi, chorvachilik va biotexnologiyalar universiteti	https://abt.uz/university/samarqand-qishloq-xojalik-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
82	Samarqand veterinariya meditsinasi, chorvachilik va biotexnologiyalar universiteti Nukus filiali	https://abt.uz/university/samarqand-veterinariya-meditsinasi-instituti-nukus-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
83	Samarqand veterinariya meditsinasi, chorvachilik va biotexnologiyalar universiteti Toshkent filiali	https://abt.uz/university/samarqand-veterinariya-meditsinasi-instituti-toshkent-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
84	Termiz agrotexnologiyalar va innovatsion rivojlanish instituti	https://abt.uz/university/toshkent-davlat-agrar-universitetining-termiz-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
85	Termiz davlat pedagogika instituti	https://abt.uz/university/nizomiy-nomidagi-toshkent-davlat-pedagogika-universitetining-termiz-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
86	Termiz davlat universiteti	https://abt.uz/university/termiz-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
87	Termiz muhandislik-texnologiya instituti	https://abt.uz/university/toshkent-davlat-texnika-universitetining-termiz-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
88	Toshkent arxitektura-qurilish instituti	https://abt.uz/university/toshkent-arxitektura-qurilish-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
89	Toshkent axborot texnologiyalari universiteti	https://abt.uz/university/toshkent-axborot-texnologiyalari-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
90	Toshkent axborot texnologiyalari universiteti Farg‘ona filiali	https://abt.uz/university/toshkent-axborot-texnologiyalari-universiteti-fargona-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
91	Toshkent axborot texnologiyalari universiteti Nukus filiali	https://abt.uz/university/toshkent-axborot-texnologiyalari-universiteti-nukus-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
92	Toshkent axborot texnologiyalari universiteti Nurafshon filiali	https://abt.uz/university/toshkent-axborot-texnologiyalari-universiteti-nurafshon-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
93	Toshkent axborot texnologiyalari universiteti Qarshi filiali	https://abt.uz/university/toshkent-axborot-texnologiyalari-universiteti-qarshi-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
94	Toshkent axborot texnologiyalari universiteti Samarqand filiali	https://abt.uz/university/toshkent-axborot-texnologiyalari-universiteti-samarqand-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
95	Toshkent axborot texnologiyalari universiteti Urganch filiali	https://abt.uz/university/toshkent-axborot-texnologiyalari-universiteti-urganch-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
96	Toshkent davlat agrar universiteti	https://abt.uz/university/toshkent-davlat-agrar-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
97	Toshkent davlat agrar universitetining Samarqand filiali	https://abt.uz/university/toshkent-davlat-agrar-universitetining-samarqand-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
98	Toshkent davlat iqtisodiyot universiteti	https://abt.uz/university/toshkent-davlat-iqtisodiyot-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
99	Toshkent davlat iqtisodiyot universiteti Samarqand filiali	https://abt.uz/university/toshkent-davlat-iqtisodiyot-universiteti-samarqand-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
100	Toshkent davlat iqtisodiyot universiteti To‘rtko‘l fakulteti	https://abt.uz/university/toshkent-davlat-iqtisodiyot-universiteti-tortkol-fakulteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
101	Toshkent davlat o‘zbek tili va adabiyoti universiteti	https://abt.uz/university/toshkent-davlat-ozbek-tili-va-adabiyoti-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
102	Toshkent davlat pedagogika universiteti	https://abt.uz/university/toshkent-davlat-pedagogika-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
103	Toshkent davlat sharqshunoslik universiteti	https://abt.uz/university/toshkent-davlat-sharqshunoslik-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
104	Toshkent davlat stomatologiya instituti	https://abt.uz/university/toshkent-davlat-stomotologiya-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
105	Toshkent davlat texnika universiteti	https://abt.uz/university/toshkent-davlat-texnika-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
106	Toshkent davlat texnika universitetining Olmaliq filiali	https://abt.uz/university/navoiy-davlat-konchilik-institutining-olmaliq-shahridagi-fakulteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
107	Toshkent davlat transport universiteti	https://abt.uz/university/toshkent-avtomobil-yollari-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
108	Toshkent davlat yuridik universiteti	https://abt.uz/university/toshkent-davlat-yuridik-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
110	Toshkent farmatsevtika instituti	https://abt.uz/university/toshkent-farmasevtika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
111	Toshkent kimyo-texnologiya instituti	https://abt.uz/university/toshkent-kimyo-texnologiya-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
112	Toshkent kimyo-texnologiya instituti Shahrisabz filiali	https://abt.uz/university/toshkent-kimyo-texnologiya-instituti-shahrisabz-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
113	Toshkent kimyo-texnologiya instituti Yangiyer filiali	https://abt.uz/university/toshkent-kimyo-texnologiya-instituti-yangiyer-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
114	Toshkent moliya instituti	https://abt.uz/university/toshkent-moliya-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
115	Toshkent moliya instituti Andijon fakulteti	https://abt.uz/university/toshkent-moliya-instituti-andijon-fakulteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
116	Toshkent pediatriya tibbiyot instituti	https://abt.uz/university/toshkent-pediatriya-tibbiyot-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
117	Toshkent tibbiyot akademiyasi	https://abt.uz/university/toshkent-tibbiyot-akademiyasi	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
118	Toshkent tibbiyot akademiyasi Urganch filiali	https://abt.uz/university/toshkent-tibbiyot-akademiyasi-urganch-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
119	Toshkent tibbiyot akademiyasining Termiz filiali	https://abt.uz/university/toshkent-tibbiyot-akademiyasining-termiz-filiali	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
120	Toshkent to‘qimachilik va yengil sanoat instituti	https://abt.uz/university/toshkent-toqimachilik-va-yengil-sanoat-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
121	Urganch davlat pedagogika instituti	https://abt.uz/university/urganch-davlat-pedagogika-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
122	Urganch davlat universiteti	https://abt.uz/university/urganch-davlat-universiteti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
123	“Toshkent irrigatsiya va qishloq xo‘jaligini mexanizatsiyalash muhandislari instituti” milliy tadqiqot universiteti	https://abt.uz/university/toshkent-irrigatsiya-va-melioratsiya-instituti	2024-07-22 08:37:31.907	2024-07-22 08:37:31.907
\.


--
-- Data for Name: years; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.years (id, name) FROM stdin;
1	2023
\.


--
-- Name: Direction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Direction_id_seq"', 3449, true);


--
-- Name: Science_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Science_id_seq"', 47, true);


--
-- Name: general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.general_id_seq', 19210, true);


--
-- Name: lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lang_id_seq', 1103, true);


--
-- Name: type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_id_seq', 1302, true);


--
-- Name: universities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universities_id_seq', 123, true);


--
-- Name: years_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.years_id_seq', 1, true);


--
-- Name: Direction Direction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Direction"
    ADD CONSTRAINT "Direction_pkey" PRIMARY KEY (id);


--
-- Name: Science Science_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Science"
    ADD CONSTRAINT "Science_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: general general_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT general_pkey PRIMARY KEY (id);


--
-- Name: lang lang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lang
    ADD CONSTRAINT lang_pkey PRIMARY KEY (id);


--
-- Name: request request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id);


--
-- Name: universities universities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universities
    ADD CONSTRAINT universities_pkey PRIMARY KEY (id);


--
-- Name: years years_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.years
    ADD CONSTRAINT years_pkey PRIMARY KEY (id);


--
-- Name: Direction_code_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Direction_code_key" ON public."Direction" USING btree (code);


--
-- Name: Science_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Science_name_key" ON public."Science" USING btree (name);


--
-- Name: User_telegram_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_telegram_id_key" ON public."User" USING btree (telegram_id);


--
-- Name: Direction Direction_first_science_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Direction"
    ADD CONSTRAINT "Direction_first_science_fkey" FOREIGN KEY (first_science) REFERENCES public."Science"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Direction Direction_second_science_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Direction"
    ADD CONSTRAINT "Direction_second_science_fkey" FOREIGN KEY (second_science) REFERENCES public."Science"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: general general_direction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT general_direction_id_fkey FOREIGN KEY (direction_id) REFERENCES public."Direction"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: general general_lang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT general_lang_id_fkey FOREIGN KEY (lang_id) REFERENCES public.lang(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: general general_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT general_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.type(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: general general_univer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT general_univer_id_fkey FOREIGN KEY (univer_id) REFERENCES public.universities(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: general general_year_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general
    ADD CONSTRAINT general_year_id_fkey FOREIGN KEY (year_id) REFERENCES public.years(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: lang lang_univer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lang
    ADD CONSTRAINT lang_univer_id_fkey FOREIGN KEY (univer_id) REFERENCES public.universities(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: request request_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.request
    ADD CONSTRAINT request_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: type type_univer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_univer_id_fkey FOREIGN KEY (univer_id) REFERENCES public.universities(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

