--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.21
-- Dumped by pg_dump version 11.13

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

SET default_with_oids = false;

--
-- Name: ACCOUNTS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ACCOUNTS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "SALDO" numeric(10,2) NOT NULL,
    "CLIENT_REF" numeric(10,0) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date,
    "PRODUCT_REF" numeric(10,0) NOT NULL,
    "ACC_NUM" character varying(25) NOT NULL
);


ALTER TABLE public."ACCOUNTS" OWNER TO postgres;

--
-- Name: CLIENTS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CLIENTS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(1000) NOT NULL,
    "PLACE_OF_BIRTH" character varying(1000) NOT NULL,
    "DATE_OF_BIRTH" date NOT NULL,
    "ADDRESS" character varying(1000) NOT NULL,
    "PASSPORT" character varying(100) NOT NULL
);


ALTER TABLE public."CLIENTS" OWNER TO postgres;

--
-- Name: PRODUCTS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PRODUCTS" (
    "ID" numeric(10,0) NOT NULL,
    "PRODUCT_TYPE_ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "CLIENT_REF" numeric(10,0) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date
);


ALTER TABLE public."PRODUCTS" OWNER TO postgres;

--
-- Name: PRODUCT_TYPE; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PRODUCT_TYPE" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "BEGIN_DATE" date NOT NULL,
    "END_DATE" date,
    "TARIF_REF" numeric(10,0) NOT NULL
);


ALTER TABLE public."PRODUCT_TYPE" OWNER TO postgres;

--
-- Name: RECORDS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RECORDS" (
    "ID" numeric(10,0) NOT NULL,
    "DT" numeric(1,0) NOT NULL,
    "SUM" numeric(10,2) NOT NULL,
    "ACC_REF" numeric(10,0) NOT NULL,
    "OPER_DATE" date NOT NULL
);


ALTER TABLE public."RECORDS" OWNER TO postgres;

--
-- Name: TARIFS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TARIFS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "COST" numeric(10,2) NOT NULL
);


ALTER TABLE public."TARIFS" OWNER TO postgres;

--
-- Data for Name: ACCOUNTS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ACCOUNTS" ("ID", "NAME", "SALDO", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE", "PRODUCT_REF", "ACC_NUM") FROM stdin;
1	╨Ъ╤А╨╡╨┤╨╕╤В╨╜╤Л╨╣ ╤Б╤З╨╡╤В ╨┤╨╗╤П ╨б╨╕╨┤╨╛╤А╨╛╨▓╨░ ╨Ш.╨Я.	-2000.00	1	2015-06-01	\N	1	45502810401020000022
2	╨Ф╨╡╨┐╨╛╨╖╨╕╤В╨╜╤Л╨╣ ╤Б╤З╨╡╤В ╨┤╨╗╤П ╨Ш╨▓╨░╨╜╨╛╨▓╨░ ╨Я.╨б.	6000.00	2	2017-08-01	\N	2	42301810400000000001
3	╨Ъ╨░╤А╤В╨╛╤З╨╜╤Л╨╣ ╤Б╤З╨╡╤В ╨┤╨╗╤П ╨Я╨╡╤В╤А╨╛╨▓╨░ ╨б.╨Ш.	8000.00	3	2017-08-01	\N	3	40817810700000000001
4	╨Ъ╤А╨╡╨┤╨╕╤В╨╜╤Л╨╣ ╤Б╤З╨╡╤В ╨┤╨╗╤П ╨Я╨░╨▓╨╗╨╡╨╜╨║╨╛ ╨Э.╨б.	-5000.00	4	2016-06-01	\N	1	46542810401021200022
5	╨Ф╨╡╨┐╨╛╨╖╨╕╤В╨╜╤Л╨╣ ╤Б╤З╨╡╤В ╨┤╨╗╤П ╨Ы╤Г╨║╨░╤И ╨Ш.╨Р.	6000.00	5	2019-05-01	\N	2	44211810400000081301
6	╨Ъ╨░╤А╤В╨╛╤З╨╜╤Л╨╣ ╤Б╤З╨╡╤В ╨┤╨╗╤П ╨Ъ╨░╨╖╨░╨╜╤Ж╨╡╨▓ ╨Ш.╨Ю.	8000.00	6	2018-09-01	\N	3	46547810700065420001
7	╨Ъ╤А╨╡╨┤╨╕╤В╨╜╤Л╨╣ ╤Б╤З╨╡╤В ╨┤╨╗╤П ╨Ы╤Г╨║╨░╤И ╨Ш.╨Р.	-5000.00	5	2016-06-05	\N	1	46542810401021200022
\.


--
-- Data for Name: CLIENTS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CLIENTS" ("ID", "NAME", "PLACE_OF_BIRTH", "DATE_OF_BIRTH", "ADDRESS", "PASSPORT") FROM stdin;
1	╨б╨╕╨┤╨╛╤А╨╛╨▓ ╨Ш╨▓╨░╨╜ ╨Я╨╡╤В╤А╨╛╨▓╨╕╤З	╨а╨╛╤Б╤Б╨╕╤П, ╨Ь╨╛╤Б╨║╨╛╨▓╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤В╤М, ╨│. ╨Я╤Г╤И╨║╨╕╨╜	2001-01-01	╨а╨╛╤Б╤Б╨╕╤П, ╨Ь╨╛╤Б╨║╨╛╨▓╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤В╤М, ╨│. ╨Я╤Г╤И╨║╨╕╨╜, ╤Г╨╗. ╨У╤А╨╕╨▒╨╛╨╡╨┤╨╛╨▓╨░, ╨┤. 5	2222 555555, ╨▓╤Л╨┤╨░╨╜ ╨Ю╨Т╨Ф ╨│. ╨Я╤Г╤И╨║╨╕╨╜, 10.01.2015
2	╨Ш╨▓╨░╨╜╨╛╨▓ ╨Я╨╡╤В╤А ╨б╨╕╨┤╨╛╤А╨╛╨▓╨╕╤З	╨а╨╛╤Б╤Б╨╕╤П, ╨Ь╨╛╤Б╨║╨╛╨▓╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤В╤М, ╨│. ╨Ъ╨╗╨╕╨╜	2001-01-01	╨а╨╛╤Б╤Б╨╕╤П, ╨Ь╨╛╤Б╨║╨╛╨▓╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤В╤М, ╨│. ╨Ъ╨╗╨╕╨╜, ╤Г╨╗. ╨Ь╤П╤Б╨╜╨╕╨║╨╛╨▓╨░, ╨┤. 3	4444 666666, ╨▓╤Л╨┤╨░╨╜ ╨Ю╨Т╨Ф ╨│. ╨Ъ╨╗╨╕╨╜, 10.01.2015
3	╨Я╨╡╤В╤А╨╛╨▓ ╨б╨╕╨╛╨┤╤А ╨Ш╨▓╨░╨╜╨╛╨▓╨╕╤З	╨а╨╛╤Б╤Б╨╕╤П, ╨Ь╨╛╤Б╨║╨╛╨▓╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤В╤М, ╨│. ╨С╨░╨╗╨░╤И╨╕╤Е╨░	2001-01-01	╨а╨╛╤Б╤Б╨╕╤П, ╨Ь╨╛╤Б╨║╨╛╨▓╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤В╤М, ╨│. ╨С╨░╨╗╨░╤И╨╕╤Е╨░, ╤Г╨╗. ╨Я╤Г╤И╨║╨╕╨╜╨░, ╨┤. 7	4444 666666, ╨▓╤Л╨┤╨░╨╜ ╨Ю╨Т╨Ф ╨│. ╨Ъ╨╗╨╕╨╜, 10.01.2015
4	╨Я╨░╨▓╨╗╨╡╨╜╨║╨╛ ╨Э╨╕╨║╨╕╤В╨░ ╨б╨╡╤А╨│╨╡╨╡╨▓╨╕╤З	╨а╨╛╤Б╤Б╨╕╤П, ╨Ш╨▓╨░╨╜╨╛╨▓╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤В╤М, ╨│. ╨Ш╨▓╨░╨╜╨╛╨▓╨╛	2001-01-01	╨а╨╛╤Б╤Б╨╕╤П, ╨Ш╨▓╨░╨╜╨╛╨▓╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤В╤М, ╨│. ╨Ш╨▓╨░╨╜╨╛╨▓╨╛, ╤Г╨╗. ╨Ъ╨╕╤А╨╛╨▓╨░, ╨┤. 10	4444 615466, ╨▓╤Л╨┤╨░╨╜ ╨Ю╨Т╨Ф ╨│. ╨Ш╨▓╨░╨╜╨╛╨▓╨╛, 10.05.2015
5	╨Ы╤Г╨║╨░╤И ╨Ш╨▓╨░╨╜ ╨Р╨╗╨╡╨║╤Б╨░╨╜╨┤╤А╨╛╨▓╨╕╤З	╨а╨╛╤Б╤Б╨╕╤П, ╨Ч╨░╨▒╨░╨╣╨║╨░╨╗╤М╤Б╨║╨╕╨╣ ╨║╤А╨░╨╣, ╨│. ╨з╨╕╤В╨░	2001-01-01	╨а╨╛╤Б╤Б╨╕╤П, ╨Ч╨░╨▒╨░╨╣╨║╨░╨╗╤М╤Б╨║╨╕╨╣ ╨║╤А╨░╨╣, ╨│. ╨з╨╕╤В╨░, ╤Г╨╗. ╨Ы╨╛╨╝╨╛╨╜╨╛╤Б╨╛╨▓╨░, ╨┤. 1	4541 669676, ╨▓╤Л╨┤╨░╨╜ ╨Ю╨Т╨Ф ╨│. ╨з╨╕╤В╨░, 16.09.2010
6	╨Ъ╨░╨╖╨░╨╜╤Ж╨╡╨▓ ╨Ш╨│╨╛╤А╤М ╨Ю╨╗╨╡╨│╨╛╨▓╨╕╤З	╨а╨╛╤Б╤Б╨╕╤П, ╨Э╨╛╨▓╨╛╤Б╨╕╨▒╨╕╤А╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤Б╤В╤М, ╨│. ╨С╨╡╤А╨┤╤Б╨║	2001-01-01	╨а╨╛╤Б╤Б╨╕╤П, ╨Э╨╛╨▓╨╛╤Б╨╕╨▒╨╕╤А╤Б╨║╨░╤П ╨╛╨▒╨╗╨░╤Б╤В╤М, ╨│. ╨С╨╡╤А╨┤╤Б╨║, ╤Г╨╗. ╨Я╤Г╤И╨║╨╕╨╜╨░, ╨┤. 7	4654 661166, ╨▓╤Л╨┤╨░╨╜ ╨Ю╨Т╨Ф ╨│. ╨С╨╡╤А╨┤╤Б╨║, 19.06.2017
\.


--
-- Data for Name: PRODUCTS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PRODUCTS" ("ID", "PRODUCT_TYPE_ID", "NAME", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE") FROM stdin;
1	1	╨Ъ╤А╨╡╨┤╨╕╤В╨╜╤Л╨╣ ╨┤╨╛╨│╨╛╨▓╨╛╤А ╤Б ╨б╨╕╨┤╨╛╤А╨╛╨▓╤Л╨╝ ╨Ш.╨Я.	1	2015-06-01	\N
2	2	╨Ф╨╡╨┐╨╛╨╖╨╕╤В╨╜╤Л╨╣ ╨┤╨╛╨│╨╛╨▓╨╛╤А ╤Б ╨Ш╨▓╨░╨╜╨╛╨▓╤Л╨╝ ╨Я.╨б.	2	2017-08-01	\N
3	3	╨Ъ╨░╤А╤В╨╛╤З╨╜╤Л╨╣ ╨┤╨╛╨│╨╛╨▓╨╛╤А ╤Б ╨Я╨╡╤В╤А╨╛╨▓╤Л╨╝ ╨б.╨Ш.	3	2017-08-01	\N
4	1	╨Ъ╤А╨╡╨┤╨╕╤В╨╜╤Л╨╣ ╨┤╨╛╨│╨╛╨▓╨╛╤А ╤Б ╨Я╨░╨▓╨╗╨╡╨╜╨║╨╛ ╨Э.╨б.	4	2015-06-01	\N
5	2	╨Ф╨╡╨┐╨╛╨╖╨╕╤В╨╜╤Л╨╣ ╨┤╨╛╨│╨╛╨▓╨╛╤А ╤Б ╨Ы╤Г╨║╨░╤И ╨Ш.╨Р.	5	2021-09-01	\N
6	3	╨Ъ╨░╤А╤В╨╛╤З╨╜╤Л╨╣ ╨┤╨╛╨│╨╛╨▓╨╛╤А ╤Б ╨Ъ╨░╨╖╨░╨╜╤Ж╨╡╨▓ ╨Ш.╨Ю.	6	2019-12-01	\N
7	1	╨Ъ╤А╨╡╨┤╨╕╤В╨╜╤Л╨╣ ╨┤╨╛╨│╨╛╨▓╨╛╤А ╤Б ╨Ы╤Г╨║╨░╤И ╨Ш.╨Р.	5	2015-06-01	\N
\.


--
-- Data for Name: PRODUCT_TYPE; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PRODUCT_TYPE" ("ID", "NAME", "BEGIN_DATE", "END_DATE", "TARIF_REF") FROM stdin;
1	╨Ъ╨а╨Х╨Ф╨Ш╨в	2018-01-01	\N	1
2	╨Ф╨Х╨Я╨Ю╨Ч╨Ш╨в	2018-01-01	\N	2
3	╨Ъ╨Р╨а╨в╨Р	2018-01-01	\N	3
\.


--
-- Data for Name: RECORDS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RECORDS" ("ID", "DT", "SUM", "ACC_REF", "OPER_DATE") FROM stdin;
1	1	5000.00	1	2015-06-01
2	0	1000.00	1	2015-07-01
3	0	2000.00	1	2015-08-01
4	0	3000.00	1	2015-09-01
5	1	5000.00	1	2015-10-01
6	0	3000.00	1	2015-10-01
9	1	2000.00	2	2017-09-21
10	1	5000.00	2	2017-10-24
11	0	6000.00	2	2017-11-26
12	0	120000.00	3	2017-09-08
16	1	7000.00	4	2021-06-01
17	0	1000.00	4	2021-07-01
18	0	6000.00	4	2021-09-01
19	0	2000.00	4	2021-09-01
20	1	5000.00	4	2021-09-01
21	0	3000.00	4	2021-09-01
22	0	100000.00	5	2017-08-01
23	1	20000.00	5	2017-08-05
24	1	50000.00	5	2021-09-19
25	1	10000.00	5	2021-09-19
26	0	5000.00	5	2021-09-19
27	0	120000.00	6	2021-09-08
28	1	20000.00	6	2021-09-05
29	1	50000.00	6	2021-09-21
30	1	50000.00	6	2021-09-24
7	0	10000.00	2	2021-09-01
8	1	1000.00	2	2021-09-01
13	1	1000.00	3	2021-09-01
14	1	2000.00	3	2021-09-01
15	1	5000.00	3	2021-09-01
\.


--
-- Data for Name: TARIFS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TARIFS" ("ID", "NAME", "COST") FROM stdin;
1	╨в╨░╤А╨╕╤Д ╨╖╨░ ╨▓╤Л╨┤╨░╤З╤Г ╨║╤А╨╡╨┤╨╕╤В╨░	10.00
2	╨в╨░╤А╨╕╤Д ╨╖╨░ ╨╛╤В╨║╤А╤Л╤В╨╕╨╡ ╤Б╤З╨╡╤В╨░	10.00
3	╨в╨░╤А╨╕╤Д ╨╖╨░ ╨╛╨▒╤Б╨╗╤Г╨╢╨╕╨▓╨░╨╜╨╕╨╡ ╨║╨░╤А╤В╤Л	10.00
\.


--
-- Name: ACCOUNTS ACCOUNTS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_pkey" PRIMARY KEY ("ID");


--
-- Name: CLIENTS CLIENTS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CLIENTS"
    ADD CONSTRAINT "CLIENTS_pkey" PRIMARY KEY ("ID");


--
-- Name: PRODUCTS PRODUCTS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_pkey" PRIMARY KEY ("ID");


--
-- Name: PRODUCT_TYPE PRODUCT_TYPE_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_pkey" PRIMARY KEY ("ID");


--
-- Name: RECORDS RECORDS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RECORDS"
    ADD CONSTRAINT "RECORDS_pkey" PRIMARY KEY ("ID");


--
-- Name: TARIFS TARIFS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TARIFS"
    ADD CONSTRAINT "TARIFS_pkey" PRIMARY KEY ("ID");


--
-- Name: ACCOUNTS ACCOUNTS_CLIENT_REF_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_CLIENT_REF_fkey" FOREIGN KEY ("CLIENT_REF") REFERENCES public."CLIENTS"("ID");


--
-- Name: ACCOUNTS ACCOUNTS_PRODUCT_REF_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_PRODUCT_REF_fkey" FOREIGN KEY ("PRODUCT_REF") REFERENCES public."PRODUCTS"("ID");


--
-- Name: PRODUCTS PRODUCTS_CLIENT_REF_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_CLIENT_REF_fkey" FOREIGN KEY ("CLIENT_REF") REFERENCES public."CLIENTS"("ID");


--
-- Name: PRODUCTS PRODUCTS_PRODUCT_TYPE_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey" FOREIGN KEY ("PRODUCT_TYPE_ID") REFERENCES public."PRODUCT_TYPE"("ID");


--
-- Name: PRODUCT_TYPE PRODUCT_TYPE_TARIF_REF_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey" FOREIGN KEY ("TARIF_REF") REFERENCES public."TARIFS"("ID");


--
-- Name: RECORDS RECORDS_ACC_REF_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RECORDS"
    ADD CONSTRAINT "RECORDS_ACC_REF_fkey" FOREIGN KEY ("ACC_REF") REFERENCES public."ACCOUNTS"("ID");


--
-- PostgreSQL database dump complete
--

