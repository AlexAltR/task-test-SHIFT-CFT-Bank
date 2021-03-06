PGDMP     &            	        y            Bank    9.6.21    9.6.21     a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            d           1262    19040    Bank    DATABASE     ?   CREATE DATABASE "Bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "Bank";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            e           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            f           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            ?            1259    19049    CLIENTS    TABLE     *  CREATE TABLE public."CLIENTS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(1000) NOT NULL,
    "PLACE_OF_BIRTH" character varying(1000) NOT NULL,
    "DATE_OF_BIRTH" date NOT NULL,
    "ADDRESS" character varying(1000) NOT NULL,
    "PASSPORT" character varying(100) NOT NULL
);
    DROP TABLE public."CLIENTS";
       public         postgres    false    3            ?            1259    19072    PRODUCTS    TABLE       CREATE TABLE public."PRODUCTS" (
    "ID" numeric(10,0) NOT NULL,
    "PRODUCT_TYPE_ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "CLIENT_REF" numeric(10,0) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date NOT NULL
);
    DROP TABLE public."PRODUCTS";
       public         postgres    false    3            ?            1259    19062    PRODUCT_TYPE    TABLE     ?   CREATE TABLE public."PRODUCT_TYPE" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "BEGIN_DATE" date NOT NULL,
    "END_DATE" date NOT NULL,
    "TARIF_REF" numeric(10,0) NOT NULL
);
 "   DROP TABLE public."PRODUCT_TYPE";
       public         postgres    false    3            ?            1259    19057    TARIFS    TABLE     ?   CREATE TABLE public."TARIFS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "COST" numeric(10,2) NOT NULL
);
    DROP TABLE public."TARIFS";
       public         postgres    false    3            [          0    19049    CLIENTS 
   TABLE DATA               k   COPY public."CLIENTS" ("ID", "NAME", "PLACE_OF_BIRTH", "DATE_OF_BIRTH", "ADDRESS", "PASSPORT") FROM stdin;
    public       postgres    false    185          ^          0    19072    PRODUCTS 
   TABLE DATA               n   COPY public."PRODUCTS" ("ID", "PRODUCT_TYPE_ID", "NAME", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE") FROM stdin;
    public       postgres    false    188   #       ]          0    19062    PRODUCT_TYPE 
   TABLE DATA               ]   COPY public."PRODUCT_TYPE" ("ID", "NAME", "BEGIN_DATE", "END_DATE", "TARIF_REF") FROM stdin;
    public       postgres    false    187   @       \          0    19057    TARIFS 
   TABLE DATA               8   COPY public."TARIFS" ("ID", "NAME", "COST") FROM stdin;
    public       postgres    false    186   ]       ?           2606    19056    CLIENTS CLIENTS_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."CLIENTS"
    ADD CONSTRAINT "CLIENTS_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."CLIENTS" DROP CONSTRAINT "CLIENTS_pkey";
       public         postgres    false    185    185            ?           2606    19076    PRODUCTS PRODUCTS_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_pkey";
       public         postgres    false    188    188            ?           2606    19066    PRODUCT_TYPE PRODUCT_TYPE_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_pkey" PRIMARY KEY ("ID");
 L   ALTER TABLE ONLY public."PRODUCT_TYPE" DROP CONSTRAINT "PRODUCT_TYPE_pkey";
       public         postgres    false    187    187            ?           2606    19061    TARIFS TARIFS_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."TARIFS"
    ADD CONSTRAINT "TARIFS_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."TARIFS" DROP CONSTRAINT "TARIFS_pkey";
       public         postgres    false    186    186            ?           2606    19077 &   PRODUCTS PRODUCTS_PRODUCT_TYPE_ID_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey" FOREIGN KEY ("PRODUCT_TYPE_ID") REFERENCES public."PRODUCT_TYPE"("ID");
 T   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey";
       public       postgres    false    2017    188    187            ?           2606    19067 (   PRODUCT_TYPE PRODUCT_TYPE_TARIF_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey" FOREIGN KEY ("TARIF_REF") REFERENCES public."TARIFS"("ID");
 V   ALTER TABLE ONLY public."PRODUCT_TYPE" DROP CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey";
       public       postgres    false    187    2015    186            [      x?????? ? ?      ^      x?????? ? ?      ]      x?????? ? ?      \      x?????? ? ?     