SELECT "CLIENTS"."NAME" AS "Имя клиента", "CLIENTS"."PLACE_OF_BIRTH" AS "Место рождения", "CLIENTS"."DATE_OF_BIRTH" AS "Дата клиента", 
"CLIENTS"."ADDRESS" AS "Адрес клиента", "CLIENTS"."PASSPORT", "ACCOUNTS"."SALDO" AS "Остаток по счету", "PRODUCTS"."NAME" AS "Продукт клиента",
"PRODUCTS"."CLOSE_DATE" AS "Дата закрытия продукта"
FROM "public"."CLIENTS", "public"."ACCOUNTS", "public"."PRODUCTS"
WHERE "ACCOUNTS"."CLIENT_REF" = "CLIENTS"."ID"
AND "PRODUCTS"."CLIENT_REF" = "CLIENTS"."ID"
AND "ACCOUNTS"."PRODUCT_REF" = 1
AND "PRODUCTS"."CLOSE_DATE" IS NULL
AND "ACCOUNTS"."SALDO" >= 0;

