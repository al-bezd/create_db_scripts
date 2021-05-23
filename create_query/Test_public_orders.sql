create table orders
(
    id           serial  not null
        constraint orders_pkey
            primary key,
    productid    integer not null
        constraint orders_productid_fkey
            references products
            on delete cascade,
    customerid   integer not null
        constraint orders_customerid_fkey
            references customers
            on delete cascade,
    createdat    date    not null,
    productcount integer default 1,
    price        numeric not null
);

alter table orders
    owner to postgres;

INSERT INTO public.orders (id, productid, customerid, createdat, productcount, price) VALUES (3, 4, 1, '2017-07-11', 2, 56000);
INSERT INTO public.orders (id, productid, customerid, createdat, productcount, price) VALUES (4, 2, 1, '2017-07-13', 1, 51000);
INSERT INTO public.orders (id, productid, customerid, createdat, productcount, price) VALUES (5, 2, 2, '2017-07-11', 1, 51000);