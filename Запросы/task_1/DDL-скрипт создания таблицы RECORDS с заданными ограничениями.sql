/*DDL-скрипт создания таблицы RECORDS с заданными ограничениями*/
CREATE TABLE public."RECORDS"
(
    "ID" numeric(10) NOT NULL,
    "DT" numeric(1) NOT NULL,
    "SUM" numeric(10, 2) NOT NULL,
    "ACC_REF" numeric(10) NOT NULL,
    "OPER_DATE" date NOT NULL,
    PRIMARY KEY ("ID"),
    FOREIGN KEY ("ACC_REF")
        REFERENCES public."ACCOUNTS" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."RECORDS"
    OWNER to postgres;