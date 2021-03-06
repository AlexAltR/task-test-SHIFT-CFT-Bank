PGDMP         9        	        y            Bank    9.6.21    9.6.21      s           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                       false    1            ?            1259    19189    ACCOUNTS    TABLE     T  CREATE TABLE public."ACCOUNTS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "SALDO" numeric(10,2) NOT NULL,
    "CLIENT_REF" numeric(10,0) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date NOT NULL,
    "PRODUCT_REF" numeric(10,0) NOT NULL,
    "ACC_NUM" character varying(25) NOT NULL
);
    DROP TABLE public."ACCOUNTS";
       public         postgres    false    3            ?            1259    19151    CLIENTS    TABLE     *  CREATE TABLE public."CLIENTS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(1000) NOT NULL,
    "PLACE_OF_BIRTH" character varying(1000) NOT NULL,
    "DATE_OF_BIRTH" date NOT NULL,
    "ADDRESS" character varying(1000) NOT NULL,
    "PASSPORT" character varying(100) NOT NULL
);
    DROP TABLE public."CLIENTS";
       public         postgres    false    3            ?            1259    19174    PRODUCTS    TABLE       CREATE TABLE public."PRODUCTS" (
    "ID" numeric(10,0) NOT NULL,
    "PRODUCT_TYPE_ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "CLIENT_REF" numeric(10,0) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date NOT NULL
);
    DROP TABLE public."PRODUCTS";
       public         postgres    false    3            ?            1259    19164    PRODUCT_TYPE    TABLE     ?   CREATE TABLE public."PRODUCT_TYPE" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "BEGIN_DATE" date NOT NULL,
    "END_DATE" date NOT NULL,
    "TARIF_REF" numeric(10,0) NOT NULL
);
 "   DROP TABLE public."PRODUCT_TYPE";
       public         postgres    false    3            ?            1259    19204    RECORDS    TABLE     ?   CREATE TABLE public."RECORDS" (
    "ID" numeric(10,0) NOT NULL,
    "DT" numeric(1,0) NOT NULL,
    "SUM" numeric(10,2) NOT NULL,
    "ACC_REF" numeric(10,0) NOT NULL,
    "OPER_DATE" date NOT NULL
);
    DROP TABLE public."RECORDS";
       public         postgres    false    3            ?            1259    19159    TARIFS    TABLE     ?   CREATE TABLE public."TARIFS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "COST" numeric(10,2) NOT NULL
);
    DROP TABLE public."TARIFS";
       public         postgres    false    3            o          0    19189    ACCOUNTS 
   TABLE DATA               ~   COPY public."ACCOUNTS" ("ID", "NAME", "SALDO", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE", "PRODUCT_REF", "ACC_NUM") FROM stdin;
    public       postgres    false    189   ?%       k          0    19151    CLIENTS 
   TABLE DATA               k   COPY public."CLIENTS" ("ID", "NAME", "PLACE_OF_BIRTH", "DATE_OF_BIRTH", "ADDRESS", "PASSPORT") FROM stdin;
    public       postgres    false    185   &       n          0    19174    PRODUCTS 
   TABLE DATA               n   COPY public."PRODUCTS" ("ID", "PRODUCT_TYPE_ID", "NAME", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE") FROM stdin;
    public       postgres    false    188   5&       m          0    19164    PRODUCT_TYPE 
   TABLE DATA               ]   COPY public."PRODUCT_TYPE" ("ID", "NAME", "BEGIN_DATE", "END_DATE", "TARIF_REF") FROM stdin;
    public       postgres    false    187   R&       p          0    19204    RECORDS 
   TABLE DATA               N   COPY public."RECORDS" ("ID", "DT", "SUM", "ACC_REF", "OPER_DATE") FROM stdin;
    public       postgres    false    190   o&       l          0    19159    TARIFS 
   TABLE DATA               8   COPY public."TARIFS" ("ID", "NAME", "COST") FROM stdin;
    public       postgres    false    186   ?&       ?           2606    19193    ACCOUNTS ACCOUNTS_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_pkey";
       public         postgres    false    189    189            ?           2606    19158    CLIENTS CLIENTS_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."CLIENTS"
    ADD CONSTRAINT "CLIENTS_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."CLIENTS" DROP CONSTRAINT "CLIENTS_pkey";
       public         postgres    false    185    185            ?           2606    19178    PRODUCTS PRODUCTS_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_pkey";
       public         postgres    false    188    188            ?           2606    19168    PRODUCT_TYPE PRODUCT_TYPE_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_pkey" PRIMARY KEY ("ID");
 L   ALTER TABLE ONLY public."PRODUCT_TYPE" DROP CONSTRAINT "PRODUCT_TYPE_pkey";
       public         postgres    false    187    187            ?           2606    19208    RECORDS RECORDS_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."RECORDS"
    ADD CONSTRAINT "RECORDS_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."RECORDS" DROP CONSTRAINT "RECORDS_pkey";
       public         postgres    false    190    190            ?           2606    19163    TARIFS TARIFS_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."TARIFS"
    ADD CONSTRAINT "TARIFS_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."TARIFS" DROP CONSTRAINT "TARIFS_pkey";
       public         postgres    false    186    186            ?           2606    19194 !   ACCOUNTS ACCOUNTS_CLIENT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_CLIENT_REF_fkey" FOREIGN KEY ("CLIENT_REF") REFERENCES public."CLIENTS"("ID");
 O   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_CLIENT_REF_fkey";
       public       postgres    false    185    2021    189            ?           2606    19199 "   ACCOUNTS ACCOUNTS_PRODUCT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_PRODUCT_REF_fkey" FOREIGN KEY ("PRODUCT_REF") REFERENCES public."PRODUCTS"("ID");
 P   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_PRODUCT_REF_fkey";
       public       postgres    false    188    2027    189            ?           2606    19184 !   PRODUCTS PRODUCTS_CLIENT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_CLIENT_REF_fkey" FOREIGN KEY ("CLIENT_REF") REFERENCES public."CLIENTS"("ID");
 O   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_CLIENT_REF_fkey";
       public       postgres    false    2021    188    185            ?           2606    19179 &   PRODUCTS PRODUCTS_PRODUCT_TYPE_ID_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey" FOREIGN KEY ("PRODUCT_TYPE_ID") REFERENCES public."PRODUCT_TYPE"("ID");
 T   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey";
       public       postgres    false    188    187    2025            ?           2606    19169 (   PRODUCT_TYPE PRODUCT_TYPE_TARIF_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey" FOREIGN KEY ("TARIF_REF") REFERENCES public."TARIFS"("ID");
 V   ALTER TABLE ONLY public."PRODUCT_TYPE" DROP CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey";
       public       postgres    false    187    186    2023            ?           2606    19209    RECORDS RECORDS_ACC_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."RECORDS"
    ADD CONSTRAINT "RECORDS_ACC_REF_fkey" FOREIGN KEY ("ACC_REF") REFERENCES public."ACCOUNTS"("ID");
 J   ALTER TABLE ONLY public."RECORDS" DROP CONSTRAINT "RECORDS_ACC_REF_fkey";
       public       postgres    false    189    190    2029            o      x?????? ? ?      k      x?????? ? ?      n      x?????? ? ?      m      x?????? ? ?      p      x?????? ? ?      l      x?????? ? ?     