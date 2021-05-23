create table products
(
    id           serial      not null
        constraint products_pkey
            primary key,
    productname  varchar(30) not null,
    company      varchar(20) not null,
    productcount integer default 0,
    price        numeric     not null
);

alter table products
    owner to postgres;

INSERT INTO public.products (id, productname, company, productcount, price) VALUES (1, 'iPhone X', 'Apple', 2, 66000);
INSERT INTO public.products (id, productname, company, productcount, price) VALUES (2, 'iPhone 8', 'Apple', 2, 51000);
INSERT INTO public.products (id, productname, company, productcount, price) VALUES (3, 'iPhone 7', 'Apple', 5, 42000);
INSERT INTO public.products (id, productname, company, productcount, price) VALUES (4, 'Galaxy S9', 'Samsung', 2, 56000);
INSERT INTO public.products (id, productname, company, productcount, price) VALUES (5, 'Galaxy S8 Plus', 'Samsung', 1, 46000);
INSERT INTO public.products (id, productname, company, productcount, price) VALUES (6, 'Nokia 9', 'HDM Global', 2, 26000);
INSERT INTO public.products (id, productname, company, productcount, price) VALUES (7, 'Desire 12', 'HTC', 6, 38000);