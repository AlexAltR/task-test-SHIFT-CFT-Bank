PGDMP         (                y            Bank    9.6.21    9.6.21      s           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            t           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            u           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            v           1262    19040    Bank    DATABASE     ?   CREATE DATABASE "Bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "Bank";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            w           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            x           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    19316    ACCOUNTS    TABLE     K  CREATE TABLE public."ACCOUNTS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "SALDO" numeric(10,2) NOT NULL,
    "CLIENT_REF" numeric(10,0) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date,
    "PRODUCT_REF" numeric(10,0) NOT NULL,
    "ACC_NUM" character varying(25) NOT NULL
);
    DROP TABLE public."ACCOUNTS";
       public         postgres    false    3            ?            1259    19278    CLIENTS    TABLE     *  CREATE TABLE public."CLIENTS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(1000) NOT NULL,
    "PLACE_OF_BIRTH" character varying(1000) NOT NULL,
    "DATE_OF_BIRTH" date NOT NULL,
    "ADDRESS" character varying(1000) NOT NULL,
    "PASSPORT" character varying(100) NOT NULL
);
    DROP TABLE public."CLIENTS";
       public         postgres    false    3            ?            1259    19301    PRODUCTS    TABLE     ?   CREATE TABLE public."PRODUCTS" (
    "ID" numeric(10,0) NOT NULL,
    "PRODUCT_TYPE_ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "CLIENT_REF" numeric(10,0) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date
);
    DROP TABLE public."PRODUCTS";
       public         postgres    false    3            ?            1259    19291    PRODUCT_TYPE    TABLE     ?   CREATE TABLE public."PRODUCT_TYPE" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "BEGIN_DATE" date NOT NULL,
    "END_DATE" date,
    "TARIF_REF" numeric(10,0) NOT NULL
);
 "   DROP TABLE public."PRODUCT_TYPE";
       public         postgres    false    3            ?            1259    19331    RECORDS    TABLE     ?   CREATE TABLE public."RECORDS" (
    "ID" numeric(10,0) NOT NULL,
    "DT" numeric(1,0) NOT NULL,
    "SUM" numeric(10,2) NOT NULL,
    "ACC_REF" numeric(10,0) NOT NULL,
    "OPER_DATE" date NOT NULL
);
    DROP TABLE public."RECORDS";
       public         postgres    false    3            ?            1259    19286    TARIFS    TABLE     ?   CREATE TABLE public."TARIFS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "COST" numeric(10,2) NOT NULL
);
    DROP TABLE public."TARIFS";
       public         postgres    false    3            o          0    19316    ACCOUNTS 
   TABLE DATA               ~   COPY public."ACCOUNTS" ("ID", "NAME", "SALDO", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE", "PRODUCT_REF", "ACC_NUM") FROM stdin;
    public       postgres    false    189   ?%       k          0    19278    CLIENTS 
   TABLE DATA               k   COPY public."CLIENTS" ("ID", "NAME", "PLACE_OF_BIRTH", "DATE_OF_BIRTH", "ADDRESS", "PASSPORT") FROM stdin;
    public       postgres    false    185   "'       n          0    19301    PRODUCTS 
   TABLE DATA               n   COPY public."PRODUCTS" ("ID", "PRODUCT_TYPE_ID", "NAME", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE") FROM stdin;
    public       postgres    false    188   )       m          0    19291    PRODUCT_TYPE 
   TABLE DATA               ]   COPY public."PRODUCT_TYPE" ("ID", "NAME", "BEGIN_DATE", "END_DATE", "TARIF_REF") FROM stdin;
    public       postgres    false    187   ?)       p          0    19331    RECORDS 
   TABLE DATA               N   COPY public."RECORDS" ("ID", "DT", "SUM", "ACC_REF", "OPER_DATE") FROM stdin;
    public       postgres    false    190   W*       l          0    19286    TARIFS 
   TABLE DATA               8   COPY public."TARIFS" ("ID", "NAME", "COST") FROM stdin;
    public       postgres    false    186   >+       ?           2606    19320    ACCOUNTS ACCOUNTS_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_pkey";
       public         postgres    false    189    189            ?           2606    19285    CLIENTS CLIENTS_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."CLIENTS"
    ADD CONSTRAINT "CLIENTS_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."CLIENTS" DROP CONSTRAINT "CLIENTS_pkey";
       public         postgres    false    185    185            ?           2606    19305    PRODUCTS PRODUCTS_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_pkey";
       public         postgres    false    188    188            ?           2606    19295    PRODUCT_TYPE PRODUCT_TYPE_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_pkey" PRIMARY KEY ("ID");
 L   ALTER TABLE ONLY public."PRODUCT_TYPE" DROP CONSTRAINT "PRODUCT_TYPE_pkey";
       public         postgres    false    187    187            ?           2606    19335    RECORDS RECORDS_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."RECORDS"
    ADD CONSTRAINT "RECORDS_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."RECORDS" DROP CONSTRAINT "RECORDS_pkey";
       public         postgres    false    190    190            ?           2606    19290    TARIFS TARIFS_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."TARIFS"
    ADD CONSTRAINT "TARIFS_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."TARIFS" DROP CONSTRAINT "TARIFS_pkey";
       public         postgres    false    186    186            ?           2606    19321 !   ACCOUNTS ACCOUNTS_CLIENT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_CLIENT_REF_fkey" FOREIGN KEY ("CLIENT_REF") REFERENCES public."CLIENTS"("ID");
 O   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_CLIENT_REF_fkey";
       public       postgres    false    185    2021    189            ?           2606    19326 "   ACCOUNTS ACCOUNTS_PRODUCT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_PRODUCT_REF_fkey" FOREIGN KEY ("PRODUCT_REF") REFERENCES public."PRODUCTS"("ID");
 P   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_PRODUCT_REF_fkey";
       public       postgres    false    188    2027    189            ?           2606    19311 !   PRODUCTS PRODUCTS_CLIENT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_CLIENT_REF_fkey" FOREIGN KEY ("CLIENT_REF") REFERENCES public."CLIENTS"("ID");
 O   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_CLIENT_REF_fkey";
       public       postgres    false    2021    188    185            ?           2606    19306 &   PRODUCTS PRODUCTS_PRODUCT_TYPE_ID_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey" FOREIGN KEY ("PRODUCT_TYPE_ID") REFERENCES public."PRODUCT_TYPE"("ID");
 T   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey";
       public       postgres    false    188    187    2025            ?           2606    19296 (   PRODUCT_TYPE PRODUCT_TYPE_TARIF_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey" FOREIGN KEY ("TARIF_REF") REFERENCES public."TARIFS"("ID");
 V   ALTER TABLE ONLY public."PRODUCT_TYPE" DROP CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey";
       public       postgres    false    187    186    2023            ?           2606    19336    RECORDS RECORDS_ACC_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."RECORDS"
    ADD CONSTRAINT "RECORDS_ACC_REF_fkey" FOREIGN KEY ("ACC_REF") REFERENCES public."ACCOUNTS"("ID");
 J   ALTER TABLE ONLY public."RECORDS" DROP CONSTRAINT "RECORDS_ACC_REF_fkey";
       public       postgres    false    189    190    2029            o   2  x???AN?0E??)r[3?????=L) ???
T?? ??(T	W߈qH???W?5?7?
z
+??+?Ú?pG?Y?7????>???|???????6?*-?  P@??+@????uL?`!V#??GF}r??s?M?Pw?U?j-??2?U((G????k:(sFMX1???????J?j??D9??_?\X(?`RqJ??V????u?A}F?!?r#?F????;;)D????T??ӄ?aWI??????Y?'?Jd?????%<?*\?P??zI}d??Eș?c?A`1K??D?:?Թ3??ZJ??iC5      k   ?  x???mN?@?oO??f???a ??H?_?F???+??R?3???w??,
5??6??ξ?yvv???(???????;?QL??'J͠?Rf?=#?o?0?-IS?h???????F9~f???sl??Ψm???}?kIsL9|?H1CdI)???#:?e(?2???9G?-푮?f??V??~[??k??
˒?\ǵ?{??e)T??1??.?C`?Ȏ?8j1šp{?"PR?0D{???{?XvB??H?	?h??^a???%`,1
??y'%??R?̀b?????f<??j\?e?]?j4?????Ւ??2?ԘOX?	M ?y?k???Z C^?l?G?x??????-*???=?X?Zo ?W????}?-l߹tDmӍ:???r:?U??(/`?;?Sn?3?Ōx5??o??P?fa?~?t? p&Ԁgw?_NV??Һ???t?Wc?xG??y_???      n   ?   x???An?0E??)|[?? ??	8L?TbÂ**Qn???B?+???(PA?ƣ?o???»$?a??LP?ߚ?
?|*I??52??]J٥許?H-???q?q^?^????_*????X?(/??"??7n? ;?C??%!???c`??L?=f?69~춎??_??%~Pi|??B????W?ry?/????.x??,n?"n?e??E?X?????:?]o?AG6????.?      m   I   x?3??0?S/L?0??"N#C]C ????4?2?JL?0?¼ӱ(0?2?? 4aх	h??\1z\\\ ??#?      p   ?   x?u?]? ???K.??e????B?y˾#?El?3??%??s?$??X?Y?D??@3H?3?????֗'?A?R?ZCt?D?X^?dB?????z\	Y??!QE0???????N??_?e3???g?a?k???w?Z?Hh?D?Q7??Hl?M6??S?_~Z?$շ?H?h???t???P?+?{?wu??'a????,?IN?9??c??      l   t   x?m???@??3[?V@i?bL8lV?W6?៎|$rz?7?57?.]=?3+r?ߨ??Z?-???	u??o?V?T?n!{u?;?&u<5?03?x?,?w?^q???9???b0     