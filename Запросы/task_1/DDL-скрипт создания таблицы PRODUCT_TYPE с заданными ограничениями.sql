/*DDL-скрипт создания таблицы PRODUCT_TYPE с заданными ограничениями*/
CREATE TABLE public."PRODUCT_TYPE"
(
    "ID" numeric(10) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "BEGIN_DATE" date NOT NULL,
    "END_DATE" date,
    "TARIF_REF" numeric(10) NOT NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("TARIF_REF")
        REFERENCES public."TARIFS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."PRODUCT_TYPE"
    OWNER to postgres;