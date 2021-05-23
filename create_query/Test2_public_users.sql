create table users
(
    id   serial not null
        constraint users_pkey
            primary key,
    name varchar(30),
    age  integer
);

alter table users
    owner to postgres;

INSERT INTO public.users (id, name, age) VALUES (1, 'Tom', 33);