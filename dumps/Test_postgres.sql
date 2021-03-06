PGDMP                         y            Test    13.3    13.3 "    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    16394    Test    DATABASE     Q   CREATE DATABASE "Test" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE "Test";
                postgres    false            ?            1259    16454 	   customers    TABLE     i   CREATE TABLE public.customers (
    id integer NOT NULL,
    firstname character varying(30) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            ?            1259    16452    customers_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    205            ?           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    204            ?            1259    16462    orders    TABLE     ?   CREATE TABLE public.orders (
    id integer NOT NULL,
    productid integer NOT NULL,
    customerid integer NOT NULL,
    createdat date NOT NULL,
    productcount integer DEFAULT 1,
    price numeric NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            ?            1259    16460    orders_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    207            ?           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    206            ?            1259    16442    products    TABLE     ?   CREATE TABLE public.products (
    id integer NOT NULL,
    productname character varying(30) NOT NULL,
    company character varying(20) NOT NULL,
    productcount integer DEFAULT 0,
    price numeric NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            ?            1259    16440    products_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    203            ?           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    202            ?            1259    16398    users    TABLE     h   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(30),
    age integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    16396    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    201            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    200            B           2604    16457    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            C           2604    16465 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            @           2604    16445    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            ?           2604    16401    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            ?          0    16454 	   customers 
   TABLE DATA           2   COPY public.customers (id, firstname) FROM stdin;
    public          postgres    false    205   ?#       ?          0    16462    orders 
   TABLE DATA           [   COPY public.orders (id, productid, customerid, createdat, productcount, price) FROM stdin;
    public          postgres    false    207   ?#       ?          0    16442    products 
   TABLE DATA           Q   COPY public.products (id, productname, company, productcount, price) FROM stdin;
    public          postgres    false    203   $       ?          0    16398    users 
   TABLE DATA           .   COPY public.users (id, name, age) FROM stdin;
    public          postgres    false    201   ?$       ?           0    0    customers_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.customers_id_seq', 3, true);
          public          postgres    false    204            ?           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 5, true);
          public          postgres    false    206            ?           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 7, true);
          public          postgres    false    202            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    200            J           2606    16459    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    205            L           2606    16471    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    207            H           2606    16451    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    203            F           2606    16403    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    201            N           2606    16477    orders orders_customerid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customerid_fkey;
       public          postgres    false    205    207    3146            M           2606    16472    orders orders_productid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_productid_fkey;
       public          postgres    false    207    203    3144            ?      x?3????2?t?O?2?N??????? ?X?      ?   8   x?3?4?4?4204?50?529M??L?,$	c ??$a
?0B??????? ?~Z      ?   ?   x?=̱?0????Z???	.5i??R"!ѷ?6?z??q??FK???[h?e+?(!_????$???C}??<?e??QzS????e?
24Nap?*???n???"a????e???4?2??c?3?0?      ?      x?3????46?????? r?     