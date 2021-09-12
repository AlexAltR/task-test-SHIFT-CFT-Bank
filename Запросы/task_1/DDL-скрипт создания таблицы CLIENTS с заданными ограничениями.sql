/*DDL-скрипт создания таблицы CLIENTS с заданными ограничениями.*/
CREATE TABLE public."CLIENTS"
(
    "ID" numeric(10) NOT NULL,
    "NAME" character varying(1000) NOT NULL,
    "PLACE_OF_BIRTH" character varying(1000) NOT NULL,
    "DATE_OF_BIRTH" date NOT NULL,
    "ADDRESS" character varying(1000) NOT NULL,
    "PASSPORT" character varying(100) NOT NULL,
    PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."CLIENTS"
    OWNER to postgres;