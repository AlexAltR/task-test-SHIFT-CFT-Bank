/*DDL-скрипт создания таблицы TARIFS с заданными ограничениями.*/
CREATE TABLE public."TARIFS"
(
    "ID" numeric(10) NOT NULL,
    "NAME" character varying(100) NOT NULL,
    "COST" numeric(10, 2) NOT NULL,
    PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."TARIFS"
    OWNER to postgres;