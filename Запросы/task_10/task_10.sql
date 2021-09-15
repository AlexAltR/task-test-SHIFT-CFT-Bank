CREATE OR REPLACE PROCEDURE close_products_open() LANGUAGE plpgsql AS $$
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
end;$$

call close_products_open();