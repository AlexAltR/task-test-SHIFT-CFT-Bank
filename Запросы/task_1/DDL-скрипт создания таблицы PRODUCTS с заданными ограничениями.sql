/*DDL-скрипт создания таблицы PRODUCTS с заданными ограничениями*/
CREATE TABLE public."PRODUCTS"
(
    "ID" numeric(10) NOT NULL,
    "PRODUCT_TYPE_ID" numeric(10) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "CLIENT_REF" numeric(10) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date,
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("PRODUCT_TYPE_ID")
        REFERENCES public."PRODUCT_TYPE" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY ("CLIENT_REF")
		REFERENCES public."CLIENTS" ("ID") MATCH SIMPLE
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
		NOT VALID
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."PRODUCTS"
    OWNER to postgres;