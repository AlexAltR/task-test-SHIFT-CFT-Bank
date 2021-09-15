CREATE OR REPLACE PROCEDURE close_products() LANGUAGE plpgsql AS $$

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

end;$$




