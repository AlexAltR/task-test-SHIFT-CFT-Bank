/*DDL-скрипт создания таблицы ACCOUNTS с заданными ограничениями*/
CREATE TABLE public."ACCOUNTS"
(
    "ID" numeric(10) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "SALDO" numeric(10, 2) NOT NULL,
    "CLIENT_REF" numeric(10) NOT NULL,
    "OPEN_DATE" date NOT NULL,
    "CLOSE_DATE" date,
    "PRODUCT_REF" numeric(10) NOT NULL,
    "ACC_NUM" character varying(25) NOT NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("CLIENT_REF")
        REFERENCES public."CLIENTS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY ("PRODUCT_REF")
        REFERENCES public."PRODUCTS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."ACCOUNTS"
    OWNER to postgres;