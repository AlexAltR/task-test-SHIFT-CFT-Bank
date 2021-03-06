PGDMP         *                y            Bank    11.13    11.13     &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            )           1262    16393    Bank    DATABASE     ?   CREATE DATABASE "Bank" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "Bank";
             postgres    false            ?            1255    16470    close_products() 	   PROCEDURE     O  CREATE PROCEDURE public.close_products()
    LANGUAGE plpgsql
    AS $$

begin
		if((SELECT COUNT(*) FROM "public"."PRODUCTS", "public"."CLIENTS" WHERE "PRODUCTS"."PRODUCT_TYPE_ID" = 1
					AND "PRODUCTS"."CLIENT_REF" = "CLIENTS"."ID" ) = 1) 
		then 
			UPDATE "public"."PRODUCTS"
			SET "CLOSE_DATE" = current_date
			FROM "public"."ACCOUNTS", "public"."CLIENTS"
			WHERE "ACCOUNTS"."CLIENT_REF" = "CLIENTS"."ID"
			AND "PRODUCTS"."CLIENT_REF" = "CLIENTS"."ID"
			AND "PRODUCTS"."CLOSE_DATE" IS NULL
			AND "ACCOUNTS"."SALDO" >= 0;
		end if;
				
		--RAISE NOTICE 'Summ : %',summ;

end;$$;
 (   DROP PROCEDURE public.close_products();
       public       postgres    false            ?            1255    16473    close_products_open() 	   PROCEDURE     ?  CREATE PROCEDURE public.close_products_open()
    LANGUAGE plpgsql
    AS $$
DECLARE
--переменные
genre_rec numeric; --переменная цикла
begin


for genre_rec in (SELECT DISTINCT "PRODUCT_TYPE"."ID" FROM "public"."PRODUCT_TYPE"
EXCEPT
SELECT DISTINCT "PRODUCT_TYPE"."ID"--, "RECORDS"."OPER_DATE", "CLIENTS"."NAME"
FROM "public"."RECORDS", "public"."CLIENTS", "public"."ACCOUNTS", "public"."PRODUCT_TYPE", "public"."PRODUCTS"
WHERE "RECORDS"."ACC_REF" = "ACCOUNTS"."ID"
AND "ACCOUNTS"."CLIENT_REF" = "CLIENTS"."ID"
AND "ACCOUNTS"."PRODUCT_REF" = "PRODUCTS"."ID"
AND "PRODUCTS"."PRODUCT_TYPE_ID" = "PRODUCT_TYPE"."ID"
AND "RECORDS"."OPER_DATE"::date BETWEEN now()::date-interval '1 month' AND now()::date)
		LOOP
			UPDATE "public"."PRODUCT_TYPE"
			SET "END_DATE" = current_date
			FROM "public"."RECORDS", "public"."CLIENTS", "public"."ACCOUNTS", "public"."PRODUCTS"
			WHERE
			"PRODUCT_TYPE"."ID" = genre_rec;
			
			--RAISE NOTICE 'id_product_type : %',genre_rec;

		END LOOP;
end;$$;
 -   DROP PROCEDURE public.close_products_open();
       public       postgres    false            ?            1255    16467    normalization_procedure() 	   PROCEDURE     H  CREATE PROCEDURE public.normalization_procedure()
    LANGUAGE plpgsql
    AS $$
DECLARE
--переменные
genre_rec RECORD;
counter integer;
summ integer;
begin
	summ := 0;
	counter := 1;
	for genre_rec in (SELECT * FROM "public"."RECORDS" order by "ID")
		LOOP
			--RAISE NOTICE 'Genre Id is : % , Sum is : %, ACC_REF : %, genre_rec : %', genre_rec."ID",genre_rec."SUM", genre_rec."ACC_REF", genre_rec;
				if(genre_rec."ACC_REF" = counter)
				then 
					if(genre_rec."DT" = 0)
					then
						summ := summ + genre_rec."SUM";
					end if;
					if(genre_rec."DT" = 1)
					then
						summ := summ - genre_rec."SUM";
					end if;
				end if;
				if(genre_rec."ACC_REF" != counter AND genre_rec."DT" = 0)
				then
					--update ACCOUNTS
					update "public"."ACCOUNTS"
					set "SALDO" = summ
					where "ACCOUNTS"."ID" = counter;
					counter := counter + 1;
					summ := 0 + genre_rec."SUM";
				end if;
				if(genre_rec."ACC_REF" != counter AND genre_rec."DT" = 1)
				then
					--update ACCOUNTS
					update "public"."ACCOUNTS"
					set "SALDO" = summ
					where "ACCOUNTS"."ID" = counter;
					counter := counter + 1;
					summ := 0 - genre_rec."SUM";
				end if;
				
			--update ACCOUNTS
			update "public"."ACCOUNTS"
			set "SALDO" = summ
			where "ACCOUNTS"."ID" = counter;
			
			--RAISE NOTICE 'Summ : %',summ;
			
		END LOOP;

end;$$;
 1   DROP PROCEDURE public.normalization_procedure();
       public       postgres    false            ?            1259    16394    ACCOUNTS    TABLE     K  CREATE TABLE public."ACCOUNTS" (
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
       public         postgres    false            ?            1259    16397    CLIENTS    TABLE     *  CREATE TABLE public."CLIENTS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(1000) NOT NULL,
    "PLACE_OF_BIRTH" character varying(1000) NOT NULL,
    "DATE_OF_BIRTH" date NOT NULL,
    "ADDRESS" character varying(1000) NOT NULL,
    "PASSPORT" character varying(100) NOT NULL
);
    DROP TABLE public."CLIENTS";
       public         postgres    false            ?            1259    16403    PRODUCTS    TABLE     ?   CREATE TABLE public."PRODUCTS" (
    "ID" numeric(10,0) NOT NULL,
    "PRODUCT_TYPE_ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "CLIENT_REF" numeric(10,0) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date
);
    DROP TABLE public."PRODUCTS";
       public         postgres    false            ?            1259    16406    PRODUCT_TYPE    TABLE     ?   CREATE TABLE public."PRODUCT_TYPE" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "BEGIN_DATE" date NOT NULL,
    "END_DATE" date,
    "TARIF_REF" numeric(10,0) NOT NULL,
    "MAX_SUM_PRODUCT" numeric(15,2) NOT NULL
);
 "   DROP TABLE public."PRODUCT_TYPE";
       public         postgres    false            ?            1259    16409    RECORDS    TABLE     ?   CREATE TABLE public."RECORDS" (
    "ID" numeric(10,0) NOT NULL,
    "DT" numeric(1,0) NOT NULL,
    "SUM" numeric(10,2) NOT NULL,
    "ACC_REF" numeric(10,0) NOT NULL,
    "OPER_DATE" date NOT NULL
);
    DROP TABLE public."RECORDS";
       public         postgres    false            ?            1259    16412    TARIFS    TABLE     ?   CREATE TABLE public."TARIFS" (
    "ID" numeric(10,0) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "COST" numeric(10,2) NOT NULL
);
    DROP TABLE public."TARIFS";
       public         postgres    false                      0    16394    ACCOUNTS 
   TABLE DATA               ~   COPY public."ACCOUNTS" ("ID", "NAME", "SALDO", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE", "PRODUCT_REF", "ACC_NUM") FROM stdin;
    public       postgres    false    196   ?0                 0    16397    CLIENTS 
   TABLE DATA               k   COPY public."CLIENTS" ("ID", "NAME", "PLACE_OF_BIRTH", "DATE_OF_BIRTH", "ADDRESS", "PASSPORT") FROM stdin;
    public       postgres    false    197   ?1                  0    16403    PRODUCTS 
   TABLE DATA               n   COPY public."PRODUCTS" ("ID", "PRODUCT_TYPE_ID", "NAME", "CLIENT_REF", "OPEN_DATE", "CLOSE_DATE") FROM stdin;
    public       postgres    false    198   ?3       !          0    16406    PRODUCT_TYPE 
   TABLE DATA               p   COPY public."PRODUCT_TYPE" ("ID", "NAME", "BEGIN_DATE", "END_DATE", "TARIF_REF", "MAX_SUM_PRODUCT") FROM stdin;
    public       postgres    false    199   ?4       "          0    16409    RECORDS 
   TABLE DATA               N   COPY public."RECORDS" ("ID", "DT", "SUM", "ACC_REF", "OPER_DATE") FROM stdin;
    public       postgres    false    200   J5       #          0    16412    TARIFS 
   TABLE DATA               8   COPY public."TARIFS" ("ID", "NAME", "COST") FROM stdin;
    public       postgres    false    201   :6       ?
           2606    16416    ACCOUNTS ACCOUNTS_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_pkey";
       public         postgres    false    196            ?
           2606    16418    CLIENTS CLIENTS_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."CLIENTS"
    ADD CONSTRAINT "CLIENTS_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."CLIENTS" DROP CONSTRAINT "CLIENTS_pkey";
       public         postgres    false    197            ?
           2606    16420    PRODUCTS PRODUCTS_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_pkey" PRIMARY KEY ("ID");
 D   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_pkey";
       public         postgres    false    198            ?
           2606    16422    PRODUCT_TYPE PRODUCT_TYPE_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_pkey" PRIMARY KEY ("ID");
 L   ALTER TABLE ONLY public."PRODUCT_TYPE" DROP CONSTRAINT "PRODUCT_TYPE_pkey";
       public         postgres    false    199            ?
           2606    16424    RECORDS RECORDS_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."RECORDS"
    ADD CONSTRAINT "RECORDS_pkey" PRIMARY KEY ("ID");
 B   ALTER TABLE ONLY public."RECORDS" DROP CONSTRAINT "RECORDS_pkey";
       public         postgres    false    200            ?
           2606    16426    TARIFS TARIFS_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."TARIFS"
    ADD CONSTRAINT "TARIFS_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."TARIFS" DROP CONSTRAINT "TARIFS_pkey";
       public         postgres    false    201            ?
           2606    16427 !   ACCOUNTS ACCOUNTS_CLIENT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_CLIENT_REF_fkey" FOREIGN KEY ("CLIENT_REF") REFERENCES public."CLIENTS"("ID");
 O   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_CLIENT_REF_fkey";
       public       postgres    false    197    196    2710            ?
           2606    16432 "   ACCOUNTS ACCOUNTS_PRODUCT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."ACCOUNTS"
    ADD CONSTRAINT "ACCOUNTS_PRODUCT_REF_fkey" FOREIGN KEY ("PRODUCT_REF") REFERENCES public."PRODUCTS"("ID");
 P   ALTER TABLE ONLY public."ACCOUNTS" DROP CONSTRAINT "ACCOUNTS_PRODUCT_REF_fkey";
       public       postgres    false    198    196    2712            ?
           2606    16437 !   PRODUCTS PRODUCTS_CLIENT_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_CLIENT_REF_fkey" FOREIGN KEY ("CLIENT_REF") REFERENCES public."CLIENTS"("ID");
 O   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_CLIENT_REF_fkey";
       public       postgres    false    197    198    2710            ?
           2606    16442 &   PRODUCTS PRODUCTS_PRODUCT_TYPE_ID_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCTS"
    ADD CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey" FOREIGN KEY ("PRODUCT_TYPE_ID") REFERENCES public."PRODUCT_TYPE"("ID");
 T   ALTER TABLE ONLY public."PRODUCTS" DROP CONSTRAINT "PRODUCTS_PRODUCT_TYPE_ID_fkey";
       public       postgres    false    199    198    2714            ?
           2606    16447 (   PRODUCT_TYPE PRODUCT_TYPE_TARIF_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."PRODUCT_TYPE"
    ADD CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey" FOREIGN KEY ("TARIF_REF") REFERENCES public."TARIFS"("ID");
 V   ALTER TABLE ONLY public."PRODUCT_TYPE" DROP CONSTRAINT "PRODUCT_TYPE_TARIF_REF_fkey";
       public       postgres    false    201    199    2718            ?
           2606    16452    RECORDS RECORDS_ACC_REF_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public."RECORDS"
    ADD CONSTRAINT "RECORDS_ACC_REF_fkey" FOREIGN KEY ("ACC_REF") REFERENCES public."ACCOUNTS"("ID");
 J   ALTER TABLE ONLY public."RECORDS" DROP CONSTRAINT "RECORDS_ACC_REF_fkey";
       public       postgres    false    196    200    2708               8  x???]J?@??'??d?w2???p]L?????CQ4d%X???-?ّg?ش?%!?.???N*%Oa!y?mX?>?ɇ??F6a??v??<?+??u?ղ2?`T???)?,q?N????+??5?#&?s?fV?# _???9?J:Y?c?ji??F??FV?S?G?U?ĉu88+	?.@???HM|B???$S??????P?j????Yn???:?al?????+??(????iʞ45CM?=g??^͐????a{??p???{?o?Q?????:????-n??(??<???'???????&˲o?6Bi         ?  x???mN?@?oO??f???a ??H?_?F???+??R?3???w??,
5??6??ξ?yvv???(???????;?QL??'J͠?Rf?=#?o?0?-IS?h???????F9~f???sl??Ψm???}?kIsL9|?H1CdI)???#:?e(?2???9G?-푮?f??V??~[??k??
˒?\ǵ?{??e)T??1??.?C`?Ȏ?8j1šp{?"PR?0D{???{?XvB??H?	?h??^a???%`,1
??y'%??R?̀b?????f<??j\?e?]?j4?????Ւ??2?ԘOX?	M ?y?k???Z C^?l?G?x??????-*???=?X?Zo ?W????}?-l߹tDmӍ:???r:?U??(/`?;?Sn?3?Ōx5??o??P?fa?~?t? p&Ԁgw?_NV??Һ???t?Wc?xG??y_???          ?   x???Mn?0???)|[?!?\?p? R???U?(??i???F}D??Jm?.,٣?o???$?{?d?Jq6|?????%323(p?Ue??w??C??>$֧?5?訢?+?ǿ?޷????C? rd?]??-????Z~?8ȼ?X8j??w`??gY????f??S??c?~????v??{?.??S??nlCl???K?ѭ??aoTN?oVD?/?*?]???!?S??? 
80<      !   `   x?}??	?@????$??MX?E??P|?aE[?? ?2,?g?Dp??̃#\???J0???z_P?\f?ą?W?z鮲????"wn????D???+?      "   ?   x?u?K?0е?E?&?????1?????|?@?aK?|0??0??yg?l?c?bd?j?? ?w??z??;"&?D"z&O?]2?'?d??i????+C??`???????)?NK?^oUBϻR"?#?MV??h$6???"?Jy??oӶ???4F?1~$?@?C:?0^?tNq\??_?S?ە?m"4???d?y'???8?t??~&}Oյ??溑{}:??AD_???      #   t   x?m???@??3[?V@i?bL8lV?W6?៎|$rz?7?57?.]=?3+r?ߨ??Z?-???	u??o?V?T?n!{u?;?&u<5?03?x?,?w?^q???9???b0     