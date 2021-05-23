create table customers
(
    id        serial      not null
        constraint customers_pkey
            primary key,
    firstname varchar(30) not null
);

alter table customers
    owner to postgres;

INSERT INTO public.customers (id, firstname) VALUES (1, 'Tom');
INSERT INTO public.customers (id, firstname) VALUES (2, 'Bob');
INSERT INTO public.customers (id, firstname) VALUES (3, 'Sam');