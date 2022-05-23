PGDMP     )                    z            py_crm    14.2    14.2 �    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16492    py_crm    DATABASE     j   CREATE DATABASE py_crm WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE py_crm;
                postgres    false            �            1259    16613 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16612    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    235                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    234            �            1259    16622    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16621    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    237                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    236            �            1259    16606    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16605    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    233                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    232            �            1259    16629 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16638    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16637    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    241                       0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    240            �            1259    16628    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    239                       0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    238            �            1259    16645    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16644 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    243                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    242            �            1259    16501    category    TABLE     �   CREATE TABLE public.category (
    categoryid integer NOT NULL,
    categoryname character varying(15) NOT NULL,
    description text,
    picture bytea
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16500    category_categoryid_seq    SEQUENCE     �   CREATE SEQUENCE public.category_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.category_categoryid_seq;
       public          postgres    false    210                       0    0    category_categoryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.category_categoryid_seq OWNED BY public.category.categoryid;
          public          postgres    false    209            �            1259    16532    customer    TABLE     �  CREATE TABLE public.customer (
    custid integer NOT NULL,
    companyname character varying(40) NOT NULL,
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    email character varying(40)
);
    DROP TABLE public.customer;
       public         heap    postgres    false            �            1259    16531    customer_custid_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_custid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.customer_custid_seq;
       public          postgres    false    216                       0    0    customer_custid_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.customer_custid_seq OWNED BY public.customer.custid;
          public          postgres    false    215            �            1259    17483    customer_old    TABLE     �  CREATE TABLE public.customer_old (
    custid integer,
    companyname character varying(40),
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);
     DROP TABLE public.customer_old;
       public         heap    postgres    false            �            1259    16519    customercustomerdemographic    TABLE     �   CREATE TABLE public.customercustomerdemographic (
    customerid integer NOT NULL,
    customertypeid character varying(10) NOT NULL
);
 /   DROP TABLE public.customercustomerdemographic;
       public         heap    postgres    false            �            1259    16930    customercustomerlist    TABLE     �   CREATE TABLE public.customercustomerlist (
    customerid integer NOT NULL,
    customerlistid character varying(10) NOT NULL
);
 (   DROP TABLE public.customercustomerlist;
       public         heap    postgres    false            �            1259    16524    customerdemographic    TABLE     v   CREATE TABLE public.customerdemographic (
    customertypeid character varying(10) NOT NULL,
    customerdesc text
);
 '   DROP TABLE public.customerdemographic;
       public         heap    postgres    false            �            1259    17428    customeremployee    TABLE     {   CREATE TABLE public.customeremployee (
    empid integer NOT NULL,
    custid integer NOT NULL,
    id integer NOT NULL
);
 $   DROP TABLE public.customeremployee;
       public         heap    postgres    false            �            1259    16898    customeremployee_old    TABLE     f   CREATE TABLE public.customeremployee_old (
    empid integer NOT NULL,
    custid integer NOT NULL
);
 (   DROP TABLE public.customeremployee_old;
       public         heap    postgres    false            �            1259    17431    customeremployee_temp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customeremployee_temp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.customeremployee_temp_id_seq;
       public          postgres    false    250                       0    0    customeremployee_temp_id_seq    SEQUENCE OWNED BY     X   ALTER SEQUENCE public.customeremployee_temp_id_seq OWNED BY public.customeremployee.id;
          public          postgres    false    251            �            1259    16923    customerlist    TABLE     s   CREATE TABLE public.customerlist (
    customerlistid character varying(10) NOT NULL,
    customerlistdesc text
);
     DROP TABLE public.customerlist;
       public         heap    postgres    false            �            1259    16704    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16703    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    245                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    244            �            1259    16597    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16596    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    231                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    230            �            1259    16588    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16587    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    229                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    228            �            1259    16733    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    16539    employee    TABLE     �  CREATE TABLE public.employee (
    empid integer NOT NULL,
    lastname character varying(20) NOT NULL,
    firstname character varying(10) NOT NULL,
    title character varying(30),
    titleofcourtesy character varying(25),
    birthdate timestamp without time zone,
    hiredate timestamp without time zone,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    mgrid integer,
    photopath character varying(255)
);
    DROP TABLE public.employee;
       public         heap    postgres    false            �            1259    16538    employee_empid_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_empid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.employee_empid_seq;
       public          postgres    false    218                       0    0    employee_empid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.employee_empid_seq OWNED BY public.employee.empid;
          public          postgres    false    217            �            1259    16547    employeeterritory    TABLE     {   CREATE TABLE public.employeeterritory (
    employeeid integer NOT NULL,
    territoryid character varying(20) NOT NULL
);
 %   DROP TABLE public.employeeterritory;
       public         heap    postgres    false            �            1259    17447    orderdetail    TABLE     �   CREATE TABLE public.orderdetail (
    orderid integer,
    productid integer,
    unitprice numeric(10,2),
    qty smallint,
    discount numeric(10,2),
    id integer NOT NULL
);
    DROP TABLE public.orderdetail;
       public         heap    postgres    false            �            1259    17450    orderdetail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orderdetail_id_seq;
       public          postgres    false    253                       0    0    orderdetail_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orderdetail_id_seq OWNED BY public.orderdetail.id;
          public          postgres    false    254            �            1259    17442    orderdetail_old    TABLE     �   CREATE TABLE public.orderdetail_old (
    orderid integer,
    productid integer,
    unitprice numeric(10,2),
    qty smallint,
    discount numeric(10,2)
);
 #   DROP TABLE public.orderdetail_old;
       public         heap    postgres    false            �            1259    16553    product    TABLE     a  CREATE TABLE public.product (
    productid integer NOT NULL,
    productname character varying(40) NOT NULL,
    supplierid integer,
    categoryid integer,
    quantityperunit character varying(20),
    unitprice numeric(10,2),
    unitsinstock smallint,
    unitsonorder smallint,
    reorderlevel smallint,
    discontinued character(1) NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16552    product_productid_seq    SEQUENCE     �   CREATE SEQUENCE public.product_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.product_productid_seq;
       public          postgres    false    221                       0    0    product_productid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.product_productid_seq OWNED BY public.product.productid;
          public          postgres    false    220            �            1259    16509    region    TABLE     t   CREATE TABLE public.region (
    regionid integer NOT NULL,
    regiondescription character varying(50) NOT NULL
);
    DROP TABLE public.region;
       public         heap    postgres    false            �            1259    16576 
   salesorder    TABLE       CREATE TABLE public.salesorder (
    orderid integer NOT NULL,
    custid character varying(15),
    empid integer,
    orderdate timestamp without time zone,
    requireddate timestamp without time zone,
    shippeddate timestamp without time zone,
    shipperid integer,
    freight numeric(10,2),
    shipname character varying(40),
    shipaddress character varying(60),
    shipcity character varying(15),
    shipregion character varying(15),
    shippostalcode character varying(10),
    shipcountry character varying(15)
);
    DROP TABLE public.salesorder;
       public         heap    postgres    false            �            1259    16575    salesorder_orderid_seq    SEQUENCE     �   CREATE SEQUENCE public.salesorder_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.salesorder_orderid_seq;
       public          postgres    false    227                       0    0    salesorder_orderid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.salesorder_orderid_seq OWNED BY public.salesorder.orderid;
          public          postgres    false    226            �            1259    16560    shipper    TABLE     �   CREATE TABLE public.shipper (
    shipperid integer NOT NULL,
    companyname character varying(40) NOT NULL,
    phone character varying(44)
);
    DROP TABLE public.shipper;
       public         heap    postgres    false            �            1259    16559    shipper_shipperid_seq    SEQUENCE     �   CREATE SEQUENCE public.shipper_shipperid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.shipper_shipperid_seq;
       public          postgres    false    223                       0    0    shipper_shipperid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.shipper_shipperid_seq OWNED BY public.shipper.shipperid;
          public          postgres    false    222            �            1259    16567    supplier    TABLE     �  CREATE TABLE public.supplier (
    supplierid integer NOT NULL,
    companyname character varying(40) NOT NULL,
    contactname character varying(30),
    contacttitle character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24),
    homepage text
);
    DROP TABLE public.supplier;
       public         heap    postgres    false            �            1259    16566    supplier_supplierid_seq    SEQUENCE     �   CREATE SEQUENCE public.supplier_supplierid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.supplier_supplierid_seq;
       public          postgres    false    225                       0    0    supplier_supplierid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.supplier_supplierid_seq OWNED BY public.supplier.supplierid;
          public          postgres    false    224            �            1259    16514 	   territory    TABLE     �   CREATE TABLE public.territory (
    territoryid character varying(20) NOT NULL,
    territorydescription character varying(50) NOT NULL,
    regionid integer NOT NULL
);
    DROP TABLE public.territory;
       public         heap    postgres    false            �           2604    16616    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    16625    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    16609    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    16632    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    16641    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241            �           2604    16648    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    16504    category categoryid    DEFAULT     z   ALTER TABLE ONLY public.category ALTER COLUMN categoryid SET DEFAULT nextval('public.category_categoryid_seq'::regclass);
 B   ALTER TABLE public.category ALTER COLUMN categoryid DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    16535    customer custid    DEFAULT     r   ALTER TABLE ONLY public.customer ALTER COLUMN custid SET DEFAULT nextval('public.customer_custid_seq'::regclass);
 >   ALTER TABLE public.customer ALTER COLUMN custid DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    17432    customeremployee id    DEFAULT        ALTER TABLE ONLY public.customeremployee ALTER COLUMN id SET DEFAULT nextval('public.customeremployee_temp_id_seq'::regclass);
 B   ALTER TABLE public.customeremployee ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    250            �           2604    16707    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    16600    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    16591    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    16542    employee empid    DEFAULT     p   ALTER TABLE ONLY public.employee ALTER COLUMN empid SET DEFAULT nextval('public.employee_empid_seq'::regclass);
 =   ALTER TABLE public.employee ALTER COLUMN empid DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    17451    orderdetail id    DEFAULT     p   ALTER TABLE ONLY public.orderdetail ALTER COLUMN id SET DEFAULT nextval('public.orderdetail_id_seq'::regclass);
 =   ALTER TABLE public.orderdetail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253            �           2604    16556    product productid    DEFAULT     v   ALTER TABLE ONLY public.product ALTER COLUMN productid SET DEFAULT nextval('public.product_productid_seq'::regclass);
 @   ALTER TABLE public.product ALTER COLUMN productid DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16579    salesorder orderid    DEFAULT     x   ALTER TABLE ONLY public.salesorder ALTER COLUMN orderid SET DEFAULT nextval('public.salesorder_orderid_seq'::regclass);
 A   ALTER TABLE public.salesorder ALTER COLUMN orderid DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    16563    shipper shipperid    DEFAULT     v   ALTER TABLE ONLY public.shipper ALTER COLUMN shipperid SET DEFAULT nextval('public.shipper_shipperid_seq'::regclass);
 @   ALTER TABLE public.shipper ALTER COLUMN shipperid DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    16570    supplier supplierid    DEFAULT     z   ALTER TABLE ONLY public.supplier ALTER COLUMN supplierid SET DEFAULT nextval('public.supplier_supplierid_seq'::regclass);
 B   ALTER TABLE public.supplier ALTER COLUMN supplierid DROP DEFAULT;
       public          postgres    false    224    225    225            �          0    16613 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    235   ��       �          0    16622    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    237   ��       �          0    16606    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    233   �       �          0    16629 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    239   6�       �          0    16638    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    241   ��       �          0    16645    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    243          �          0    16501    category 
   TABLE DATA           R   COPY public.category (categoryid, categoryname, description, picture) FROM stdin;
    public          postgres    false    210           �          0    16532    customer 
   TABLE DATA           �   COPY public.customer (custid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, email) FROM stdin;
    public          postgres    false    216   $                0    17483    customer_old 
   TABLE DATA           �   COPY public.customer_old (custid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) FROM stdin;
    public          postgres    false    255   ?      �          0    16519    customercustomerdemographic 
   TABLE DATA           Q   COPY public.customercustomerdemographic (customerid, customertypeid) FROM stdin;
    public          postgres    false    213   �)                0    16930    customercustomerlist 
   TABLE DATA           J   COPY public.customercustomerlist (customerid, customerlistid) FROM stdin;
    public          postgres    false    249   �)      �          0    16524    customerdemographic 
   TABLE DATA           K   COPY public.customerdemographic (customertypeid, customerdesc) FROM stdin;
    public          postgres    false    214   *                0    17428    customeremployee 
   TABLE DATA           =   COPY public.customeremployee (empid, custid, id) FROM stdin;
    public          postgres    false    250   �*      �          0    16898    customeremployee_old 
   TABLE DATA           =   COPY public.customeremployee_old (empid, custid) FROM stdin;
    public          postgres    false    247   1,                 0    16923    customerlist 
   TABLE DATA           H   COPY public.customerlist (customerlistid, customerlistdesc) FROM stdin;
    public          postgres    false    248   �,      �          0    16704    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    245   	-      �          0    16597    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    231   &-      �          0    16588    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    229   P.      �          0    16733    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    246   �/      �          0    16539    employee 
   TABLE DATA           �   COPY public.employee (empid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, phone, extension, photo, notes, mgrid, photopath) FROM stdin;
    public          postgres    false    218   1      �          0    16547    employeeterritory 
   TABLE DATA           D   COPY public.employeeterritory (employeeid, territoryid) FROM stdin;
    public          postgres    false    219   �3                0    17447    orderdetail 
   TABLE DATA           W   COPY public.orderdetail (orderid, productid, unitprice, qty, discount, id) FROM stdin;
    public          postgres    false    253   �4                0    17442    orderdetail_old 
   TABLE DATA           W   COPY public.orderdetail_old (orderid, productid, unitprice, qty, discount) FROM stdin;
    public          postgres    false    252   �q      �          0    16553    product 
   TABLE DATA           �   COPY public.product (productid, productname, supplierid, categoryid, quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued) FROM stdin;
    public          postgres    false    221   :�      �          0    16509    region 
   TABLE DATA           =   COPY public.region (regionid, regiondescription) FROM stdin;
    public          postgres    false    211   #�      �          0    16576 
   salesorder 
   TABLE DATA           �   COPY public.salesorder (orderid, custid, empid, orderdate, requireddate, shippeddate, shipperid, freight, shipname, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) FROM stdin;
    public          postgres    false    227   _�      �          0    16560    shipper 
   TABLE DATA           @   COPY public.shipper (shipperid, companyname, phone) FROM stdin;
    public          postgres    false    223   ��      �          0    16567    supplier 
   TABLE DATA           �   COPY public.supplier (supplierid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) FROM stdin;
    public          postgres    false    225   ��      �          0    16514 	   territory 
   TABLE DATA           P   COPY public.territory (territoryid, territorydescription, regionid) FROM stdin;
    public          postgres    false    212   S�                  0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    234            !           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    236            "           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 136, true);
          public          postgres    false    232            #           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    240            $           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    238            %           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    242            &           0    0    category_categoryid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.category_categoryid_seq', 8, true);
          public          postgres    false    209            '           0    0    customer_custid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.customer_custid_seq', 115, true);
          public          postgres    false    215            (           0    0    customeremployee_temp_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.customeremployee_temp_id_seq', 333, true);
          public          postgres    false    251            )           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    244            *           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 34, true);
          public          postgres    false    230            +           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);
          public          postgres    false    228            ,           0    0    employee_empid_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.employee_empid_seq', 17, true);
          public          postgres    false    217            -           0    0    orderdetail_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orderdetail_id_seq', 2162, true);
          public          postgres    false    254            .           0    0    product_productid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.product_productid_seq', 1, false);
          public          postgres    false    220            /           0    0    salesorder_orderid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.salesorder_orderid_seq', 11082, true);
          public          postgres    false    226            0           0    0    shipper_shipperid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.shipper_shipperid_seq', 1, false);
          public          postgres    false    222            1           0    0    supplier_supplierid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.supplier_supplierid_seq', 1, false);
          public          postgres    false    224                       2606    16731    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    235                       2606    16661 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    237    237                       2606    16627 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    237                       2606    16618    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    235                       2606    16652 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    233    233                       2606    16611 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    233            %           2606    16643 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    241            (           2606    16676 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    241    241                       2606    16634    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    239            +           2606    16650 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    243            .           2606    16690 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    243    243            "           2606    16726     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    239            �           2606    16508    category category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categoryid);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    210            �           2606    16537    customer customer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (custid);
 @   ALTER TABLE ONLY public.customer DROP CONSTRAINT customer_pkey;
       public            postgres    false    216            �           2606    16946 <   customercustomerdemographic customercustomerdemographic_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.customercustomerdemographic
    ADD CONSTRAINT customercustomerdemographic_pkey PRIMARY KEY (customerid, customertypeid);
 f   ALTER TABLE ONLY public.customercustomerdemographic DROP CONSTRAINT customercustomerdemographic_pkey;
       public            postgres    false    213    213            <           2606    16934 .   customercustomerlist customercustomerlist_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.customercustomerlist
    ADD CONSTRAINT customercustomerlist_pkey PRIMARY KEY (customerid, customerlistid);
 X   ALTER TABLE ONLY public.customercustomerlist DROP CONSTRAINT customercustomerlist_pkey;
       public            postgres    false    249    249            �           2606    16530 ,   customerdemographic customerdemographic_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.customerdemographic
    ADD CONSTRAINT customerdemographic_pkey PRIMARY KEY (customertypeid);
 V   ALTER TABLE ONLY public.customerdemographic DROP CONSTRAINT customerdemographic_pkey;
       public            postgres    false    214            >           2606    17434 +   customeremployee customeremployee_temp_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.customeremployee
    ADD CONSTRAINT customeremployee_temp_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY public.customeremployee DROP CONSTRAINT customeremployee_temp_pkey;
       public            postgres    false    250            :           2606    16929    customerlist customerlist_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.customerlist
    ADD CONSTRAINT customerlist_pkey PRIMARY KEY (customerlistid);
 H   ALTER TABLE ONLY public.customerlist DROP CONSTRAINT customerlist_pkey;
       public            postgres    false    248            1           2606    16712 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    245                       2606    16604 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    231    231                       2606    16602 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    231            	           2606    16595 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    229            5           2606    16739 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    246            �           2606    16546    employee employee_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (empid);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    218            8           2606    16922 *   customeremployee_old employeecustomer_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.customeremployee_old
    ADD CONSTRAINT employeecustomer_pkey PRIMARY KEY (empid, custid);
 T   ALTER TABLE ONLY public.customeremployee_old DROP CONSTRAINT employeecustomer_pkey;
       public            postgres    false    247    247            �           2606    16551 (   employeeterritory employeeterritory_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.employeeterritory
    ADD CONSTRAINT employeeterritory_pkey PRIMARY KEY (employeeid, territoryid);
 R   ALTER TABLE ONLY public.employeeterritory DROP CONSTRAINT employeeterritory_pkey;
       public            postgres    false    219    219            @           2606    17453    orderdetail orderdetail_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.orderdetail
    ADD CONSTRAINT orderdetail_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.orderdetail DROP CONSTRAINT orderdetail_pkey;
       public            postgres    false    253                       2606    16558    product product_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productid);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    16513    region region_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.region
    ADD CONSTRAINT region_pkey PRIMARY KEY (regionid);
 <   ALTER TABLE ONLY public.region DROP CONSTRAINT region_pkey;
       public            postgres    false    211                       2606    16581    salesorder salesorder_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.salesorder
    ADD CONSTRAINT salesorder_pkey PRIMARY KEY (orderid);
 D   ALTER TABLE ONLY public.salesorder DROP CONSTRAINT salesorder_pkey;
       public            postgres    false    227                       2606    16565    shipper shipper_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.shipper
    ADD CONSTRAINT shipper_pkey PRIMARY KEY (shipperid);
 >   ALTER TABLE ONLY public.shipper DROP CONSTRAINT shipper_pkey;
       public            postgres    false    223                       2606    16574    supplier supplier_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supplierid);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    225            �           2606    16518    territory territory_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.territory
    ADD CONSTRAINT territory_pkey PRIMARY KEY (territoryid);
 B   ALTER TABLE ONLY public.territory DROP CONSTRAINT territory_pkey;
       public            postgres    false    212                       1259    16732    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    235                       1259    16672 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    237                       1259    16673 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    237                       1259    16658 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    233            #           1259    16688 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    241            &           1259    16687 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    241            )           1259    16702 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    243            ,           1259    16701 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    243                        1259    16727     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    239            /           1259    16723 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    245            2           1259    16724 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    245            3           1259    16741 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    246            6           1259    16740 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    246            C           2606    16667 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    233    237    3346            B           2606    16662 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    237    235    3351            A           2606    16653 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3341    233    231            E           2606    16682 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    235    3351    241            D           2606    16677 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    239    241    3359            G           2606    16696 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    233    3346    243            F           2606    16691 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    239    243    3359            K           2606    16906    customeremployee_old custid    FK CONSTRAINT     �   ALTER TABLE ONLY public.customeremployee_old
    ADD CONSTRAINT custid FOREIGN KEY (custid) REFERENCES public.customer(custid) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.customeremployee_old DROP CONSTRAINT custid;
       public          postgres    false    216    3323    247            L           2606    16935    customercustomerlist customerid    FK CONSTRAINT     �   ALTER TABLE ONLY public.customercustomerlist
    ADD CONSTRAINT customerid FOREIGN KEY (customerid) REFERENCES public.customer(custid) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.customercustomerlist DROP CONSTRAINT customerid;
       public          postgres    false    216    3323    249            M           2606    16940 #   customercustomerlist customerlistid    FK CONSTRAINT     �   ALTER TABLE ONLY public.customercustomerlist
    ADD CONSTRAINT customerlistid FOREIGN KEY (customerlistid) REFERENCES public.customerlist(customerlistid) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.customercustomerlist DROP CONSTRAINT customerlistid;
       public          postgres    false    248    249    3386            H           2606    16713 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    245    3341    231            I           2606    16718 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    3359    239    245            J           2606    16901    customeremployee_old empid    FK CONSTRAINT     �   ALTER TABLE ONLY public.customeremployee_old
    ADD CONSTRAINT empid FOREIGN KEY (empid) REFERENCES public.employee(empid) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.customeremployee_old DROP CONSTRAINT empid;
       public          postgres    false    3325    218    247            �      x������ � �      �      x������ � �      �     x�}�[��8��ag-l ��lc�Q��FI����}��U�MK}	�+Se|ê����:_�_���5>��O�������\�� ����6e�"X�:�ǕA[�ƀ�M����j����~L�2��Bk��<�9�;`;�G�3l-i<7����y�1h~��Bs������<��8DG+0.��:8�,�h���g�|���o��� �p���m�h{�O���u{k_��k,Z���%��ш��!��%x�y]E��6v�U��2ڷz2��U���G�����9{��!�* ���?�{ɝ1�������K=�XgX��D���06��g�p����y��A�
��$����
��**��$��`^Bt��&	MH��6�I*����F��	�1�{��|3��>��9po�!��Q�lЦf=|ZL��+[
�Ȩ--��"����wЉ^�d����xM�Ie��~�4���bWl���9�*�+���T%��Ê�a�j�Ls9��m�7v]��eK
b~9	$�H��$�0= g��@�Y��Y���w]���벥���wH�Hzw����u�.q�������>���K�Z2�Aʶ�e8�L���7��'���;Ui{�FM��K��}Z�B��͵�+O�O���dk���2���&�54�m���F��6IO�Qxj�S.����rɅ^'}��j�M�!Im�������*���"�U�\2���B�Y<O!,g�������cz�S���[n��Ҳ�9)'r9��f��Υ�:��r*�Ij:��v�`����L6)�x�2	��B�����RQI�d�Ǵ���,�ZA�X^�:�u�u&'K)%J�$$!"�Z��i���P�d�.�
D)��$H L��b|���ϸ�Y�'���@�b�x$iv@ҹ�$�
����wa��rv
C�s�2�:*ۜ{T�QyJӠ�REU��[��{Z���n)^�Q}.	E@�����VUU����q>���j����{����6�fA�X,��/.`���g�����sYmw�rC��.R��.�|JAF@<���=�P���fƷ]��U���.2�V�h�F̙
�K�cu9���4d��K6�(��,
q���3)�a(2lϦ��o���#���+���l@y������A<�̚��}^���Cv�����y�ys�3=@������`��Ȉs@m?�|�G�3�0���M�a�j�"��ÂS״'뎪�cԉ�1H�;d��]2H3[e�vd闻��5߯E�dSn�6m��^����_����̶��	��g����e���      �   �   x�]��
�@@���S�p'���EGh.�nR�1b5yM��u���	P_>�;\G������?�����Mj�sH̰K�l~���NL3n������Я���:R��F)v;JN�%��d�h̄RF�tI�&4�V]�@���b���������� ��.J      �      x������ � �      �      x������ � �      �   �   x�5PKn1]{N1������VHl٘�"��*n_'C7�e���Dk\!|��6��{����! ���{@�p�=O���t�4�����(m�|�r�2�JLQ��Ӌ��]DM5��M�J�sR�
)5�A#�)�b�D*�F�洑�gWh8Z�%�}	Ǥ����wk'�N�k�E�5P��7��6y���h#����g�6�Z�@�D[��r��z7���OڂCξV��$�G����?�E~=      �      x�}Z�n3Ir>g?Es�?��&�U\n�"R�)���%E��j+յP-�����'{`���`0�O��~�~Gd-�*R��VWJdUT,��Ed�K���:H�__7G+������lGx���#k��*t���p�Vz��(���o���s�Y�f�6+���2k��7�}���_s�N���V�������O��n�F������l�v�ku��Xx׺iޱ�xy�W�#���-�#}>�����"���u��HO����C��V��F
��~3�JU��ٗr��k^�7
`E����L-1N����-���+>��26��X[z�(�Ye�P�
�b�}�kz�I������x��`h]�3Ġ�TN��ƣi���O��M�n$�v,��̄ka�Y���{�	�v�������~�׊w��bbb��%��}�~��+���-hof��P�̓}��q��ұ4p �rϦo.Xt#����"׾oI/���ov�!=��J�e�5핳����������!����6�r��b'��$R��k[���"�@�F���w��>>>��L��b�ZU���'>l���:�g&YԤ�ɤ�c���Z��~���8]L_��^:���t���?���7�g���8e1dPS�.9�Ը�ɸ��j2a�Jx���t��)<�����vm�����K�Mn��j��N�q�����}g%�,뤁����*�-kL�S?�Z��sއp6દg��I����^(!�}�n��P���� ��g\$�f�Y���U�R�hT��<��jΚ:��q�fޝܶYK�^���;�q25��ƇXo=���3Q*�K�(��\�.K9S��`���3cC� �.I�ȇ�v�-0מ�J�HJ���p���fJ#M���
��a�3{`�����З�����$
� >#�ԃ��OH'��|95��rJA&_N�`�`pg�O"�E`q�)o���4�G�q.W�[>V�p>��uŵ'�b��D��p,^�v�K#�g@=��܈ ~��mP�6B߯���Ý����C_b��8M"��+��ET��Kz�jl�_'N�z�ئU�֊:��u�O
�����r�q� D����b\k_����Ko+���M-�?��2�l�ZH�R�����,���ͧ�u4��h����Htl���G���\���i�O�������VLY�(P���V��zw�S��Ax����b�A�'	P�,Z�b�^��>]���lP�w��l���]���|c���Ա�$7bˆ���ʳ]�x����p�G�H�a\�:r��3�B�A ���ۂ���ia# ��*I�0���V��|��������H��d3��V8Z�$G�3�aP�6\�;��&D�p��:��ċ�h.ώ�JkC�;!8�?��Ė���Qnbe���BE��H��	����+ȇ��m��$y��@*�l�ǜ� ����8���k�A5+5���X,9+�
�
��A����PC�+�(T��f{Q$X�v�mqx����z�S{f��
���E���=�߹�D+���/D˘��5�n8�C�Nɦs���Edj	bY�z������������9��xtDz1Z_��?��Q��L8��4J�q�cb^�t5LW���%�A�\�)�5�bu�`u����X[A�Pʾ_b6$��,$�@����m��)mO��@{�D�F9c�ie�,�^!~7^��ly�v��28�w<�	��|��ȕ���ǅ
� r��^��#+��Vj(���\�lOh�Y���H��"8�7�x_!x?ZS�8� ~z)_~�v -%,#&��$�o�|@6:[(F���R�<��e%��J���O#�������nm�� S�}퐯�g��(��!|����o?��x�p[f}O����I��f�B	�B`4�k7�H�E��_�֨�7
�"S�;$5�W�z���������]�C[��r��KHBѿBп75{l��F
^��Cc>KG7���
v�Co��1����Pi�<7�b�I)���:Д8�4����?K)L�+.���=w��:����|��/��+�DK��\�gR�7	�?���P�ؐ���r��o��M��]/���A�K���!�	gW{�bb���I��$��o�C�$
<�?����bW��m*���V(p�#�ö6���zyLJ&!���b:� ��WLhB��B���B�%�A�K��G�KQ�2#�S�I�C�I����
LBӇ��:L|���U�s^̯��λذkg�Z}	����8��4�S�Wq�^��f$�s�Q.0	�>�fK�ݽ8Bh�@��c��?S�"_�6@~�:�l�X;r���,[���gehRT7	�?�&�!�3 a<��A��[��MO��R����㿪Z�F�� O	o�P~ھ}����h����e��g�oR�7	���wOl��W�ܮtbj�,D��x�W�#`�N�~1��m�6	�Q�k����Z��X�IVA+l��ESȷJ&e��@g��������{�l���o��ߋ��hfj�l}�0��A����<+�s�,ײ��9J&!�����d�*��p��Bc�4
7�#P��р��-�|*A�j�6U�d���q����2�E�a�8[���5ί��p6�)�@��uWh%s?���y��R��@g���dd���d<aQ6��V��6[�wG�	={}y���y�vD���ę�O��n�y��Y���-�hl�M:���˃'�r�E��O��W��u2��l��D~����~��cn/�*�Q�z�<�X�i�-G�΄��hא�Okr#t���/;�6��xtrq�^��A�	,���"ӻ�v�u׹f3�^����`d����>��y#cF�o�)Zj���t[O=���M zB���'�	��7���\|�}1;��NǤd @�yT��B��FO��ނV�NЬ��q6yx�8ւ�Q�F�#�7��L��t��0ʧ)�^鎛��=��i��S�ŚP�.��wB:�]5}���q�t�e�$.�p����'?�&�P��y� ����S�'*���U�F�uw�c�!2��j��兡%�+(�p}�vB���|�ّf~u G�Љ@��	�Y�d<x$�Ɍ��<]�P�Ra�ۻ���w�m��B'�����MO� ku���\2���s�#�5��#��ǉr݀X>��l.�;q!z@^w�]l���%�R!�Q�G���44.���z$����d(� M�=X���cC��y�|���>-�nC	l���m����Sœ]P��e�E!�J����n�gw���:�?�O��#8������bD���d���H~�G\��Z%�~7��.����}����w�#P/��n��k��kQ�5jw\�ߔ�Vf~���U%gg��w�O6)+���dƤ'Rm�Ɣ�9�`v��?x��dvw�\22�t���{�Ъ$����j�M0�H����-E��p�?���;��V��F�`f�3�f����7xyq���7��,���t��X
0����![�, ��%^˚Hi�Jxo�xw� E�<y"��VS�V=P�N MO�+B����A3�l2֑L״E�y�[��W�s���d�Vʇ����/LgQ}�<P���_�1�:W��`# ǻ��D�[�3_t}i��Ji�Jygu=��ê+~~�A��m�W���@�����ed�3�g�FI�JX��N�l��A�c�v���w��f����Ĳ��c��F�E�QK�tf��*�E����E��o��q�R�(���)��HzgvUkeJ�Q��әF���|8S�$T����ބ�l72j(���c>�F��勽���_[�*=������	�k��7ك-/�cP�N�:�(��̏�ӻ����p��&�?��x����c�YK᰹���G�f��i�{~��Fq�Fp�y3��ؽt�{w�Hy% �{�م������q�~���I-���E�A���?�g=�ȏ+>	�T6�@�����2��q����&���`���Jtק�e�T��]#����y���   ?������ �`�w�Q��.6�P�����݌xޙ�_#�>���:'�j�k���G���nĻSo�ʦ�um��E.r��R?D�6�����g&�R-M3�4r�I�t� ��;�A�B���e-�{��Ad:~×�y�UT_���ԝ�(��T�t�s���Q����/�/s&fz�-������Pmz���r����E�V��u���F~�d�;5��Pj�k�'�%��|��}�g۽���!��g|8�|&�^�_+pKb��U�睥jjG9���(�FQ�FP�ۜ-���^�u�;�F��C���=���T`��tuur��*�6�/�Q���^M'�!��_������ٙ�I�#�k3ǥ1�i�1E*z�S��������{��t���-�v '�ӧB����'?:  �R�^�*x��^]�{�S$�$�~��qH�LX~'��9SJ���ʤx7|h{{��z�7bB9%��YVrMB�z� ��|ҹf]<Z�J�LN����M`]��va�P�	�'C�������Na�"����{l	u�.�����"��g�Q�a�5�I]}3�W�(����6�R���t��v43�"�>|�}Z�kH���ơ�w ��w��ԃ��Q�꽭����WYs��'>�� oe�F.�,�����I��h`��l�Dl�w����r��\'������G锎�4���I/����)�-z�i�|X���}d��w�?{��K�?�d��\Wfh�nQZ�'=�����¹U�2��fɺb�S!kꊍ��y0�&>��7ć]�i/�j9�^�q��١o���E�}4�p3?��U�.�H�w�-�t�p>N�ۨ���f�`#mQ�&d���d�^�u�/ �<��X�A�}��)H2�
�:��!Z��Tw���C��E��:G3uZuuRu����z�'�&{�n/ �'�d����,�%���!M�Ԟ���A��IK�N��4[���p���O�O�Cۍ7�� �86H�"�Z9=P��/mB�i��I�=�<N@��7{K��*���"#��N�@ ���j�i��	oU_�'���d�����D��g�N%>�4�T��s��F&�������39@˨N��u��G�~��+�x�-9����*�	�;��d���b	�#��}��V�D�w
-��J��j��ɾ>�\蓋ڦo/	ˡ�������F:�����m!���9�uz�1;���Q�#�n�������{�O�S�]�i�&���=X�!ޒ1M��1�G�tą��3��F�)~��7�8�*            x�}ZKo3�u]W����g@��|sɇH�M�)�oJd��a�[�jȕ��@�Yņ��F�F��?$?d~Iέ~���2fFS%�]U��=��{�b�(�������d��9����#s&�|7��6y�0��ϙy�PdM�;�e�3+��XW�;�X���.�ʕj����aL��i��p��[�q�,��l��
�5�+�3W�t���� �a��_���&=��0��r��\'��^����_�/埛XX-�&X�������}��M���c^�}o�&ˏx�W�������Z�l5,tM����i��N����
�̹��p/ە2o����5��z��K[����bU��YΧ�Q֖�.���V���}�����;6�q,���IW��Cϧ\G�`�3�a-\36�0r~�/���U`��Xa�c�R5ku�<+�	�R5*�<�>�l�9�]]�-�{��|���
��G��殻r�.]=�TE�MRC�RF�����b�`M�£��vl�y������|��/^�o_
s���­��/^���w;>w��U��Z=��rp�ӸdԴ��onY�9H�Ý"G�ğZ�0>�>�ؔr�_�r�0_b�G}��:�ʔ0o<���+܉Q?�4�?v[l����2;_�8�&Y�te��@ fӋ�����O�-�g+s�rN�J�+Z��1\��A�9��t���t�G�X.��=�/��2���SMg�ʱlΚ-u�k��+ξT򥟛��5]L2�9��A�K�q߼mܳ>}�`��/{ǎ���lI��γ���NA�����0jj�Gw0��`q��p����ay����p�]$�/W��I8��9.5�|VM��k2�ai��']�����f�]���ؖX���]_��@��A�	?4�2,�ƣF���#C�FQ�"�-���@G�̚e@����<˗ʅ8V-eS����6#��W�Ʊ7�=��\l)y�ڃ`�a�T��y�Pl�S9��*N����t`�8h���5P�>5�O�)��ˁ����<8�V8�`v�A��f���?��P�~�!��ϳiݰ4���,�c��\���l���%T~�N �w�����ę�5D,�,u��Y5�)װ4\jڋ��>rg�c7|��\&}��-�~.�9	�c�$u撕�E�� 
m\1,�:�kz��6��<=�Os@>���̮�'�+��<�|�7
>�oo�S6�H�<^*�0`�&�1��3�48ꬁ��@k+��z�BFA�A�=}d�zeve��7�'\H�3��9�I����+~t�z��e����4�i�ۣq.�.x����_�Y�b� � �rF�ϝ#��ą�j�h'_��C�CQM<-�o4tzXt��7������/����D��V�H�aP ���ቅ�Z�V)���q�(h��zz��aJ�J�r��2�ٯ?���?n�g���ؤK��r��`.2�z�$d��D5��7m���(|�s��
��h���1v-B��q�p�[�p˨`��i\��(h uo��]6�+�0��'�q;���Y��Ԥ�R�\�Uk9��i��4@zun�^nv���b�X�c��ฐ�E0єXŋ
�V�^z�:���y����&h�l4xz|��4a�=_; 5I�<�އ����	�P����L�.C	���h.At�a��bYM,kdWРj�>4`o��ʭ�W�A*/���^����[p2'����Pir)�M�R��+*�s��af��h 6��w2|�p+����'p���)�3� A���p ]�ZΖ-+Qe*�N.^����j>��t}e>q��׹�H� �@� ��7�&�q�*��p,U5j5Ǟ���#�2ظ��n�Ka6��xK�ƛ���s��V�.y��\.�d+��4��,�wHkBI_��-�'��(����l6�"g�.���OQD�
��|��;
����H��_
zfY�3K�z�Ŭ�Z�F(qs���D+��п�&��ΤG����ج�N}���u��iV2�|ݏ���>����/3N��+72����p6����!"�g�k<�p��G��kpQ6��wˍ���%�Ne�h�R�Q԰n���f�d�kC��$�-B�cc���ʰ�tM;��8�tc'���o��r6-�����f��C������q)#\�y���E�p S�}w�|�{����р@�b=_(\�����5���[6P-���kP�փ܀���pC����z�@�^��{5�z��(���^���u��F����2�oN;�ыp�܏NE��rʐ+���q�YDO;�y��!,\&܅4�gW��|/\�KM�n"߃�Z ��$2�˴�Uȥ����FIû�^�1A)�K�{�Ti�SN���z�!���ڠ�`��a���|.]LW���{�F�?`v(H&��=�ۋ�Qy�o�C/�Z�=i�����y�|�-5͢���}Ϟ�a�`�F���FL���XP�a�)��鐁���O������UO#	�_��FI���cgv]O�XI(�D�_��_�\Jy��T<�F~h��(+���bP=�|�j�����9�#w�w�r��LH(a�|S�Qf7�H�b�S�,dͭ�����%����\]�{Mǽk�`�H_))���DO�WU�2�mzT��˞���*��z�"2=s���G��Hr'B�o����:C�5�*i�7����0z���\�d�W�Lq7����l~��(����?@`Sɉ�#���M��ȕ����(�V�KM��bcFIC���3j2�x�-�|K�"R�����W���?D����Fr�%0��A��SH�(�o��� 4l��֎��W&�3 ���T�0Zy{*�H��+/�EP����*��-&`XS�X�e�OS����TɂjtVg��PD(���n�5 p�8A`�Z���hǾ�giMOi\YC����bs~p<�r��i���D��!>H#�OY՟� v�TB)�aT�*�y��f)uY��=��d�7<�z�-Ӝ��~nER(��yB�e�DVA��b��)<�$v[}��G;���ķ��n�U�p	����E�b�jZiO�����������ޅjb�]��.>��%XK����T�Y�_7.�EƬ�W�������9�Y'rWף�QH�p���� �I�ZqS٭�#,Xc�1Q��|5���ٴP3�Hލ{�g�`���o��J|�Jy$6>����VI�@%�Y7D/����ON0�z��h<� r�t�&o~���O>�W���� 2��?�$��t.+�ǖ=U���pp����s��ۍQr��+�����6��'��
61^*�Z�YQ����6��'��_	b������5�~U��oǓγ
լJVʴG!�p�����������ި�toHn���o@I��[��+�8��k��^��W4\{�>�Y��<����1�^?M�8�ƕ���*U����C�9Xڛ8����l��s��@�bI�uVN8AZ�*�
�k�'��Ͼ�4�?�Z��Y��uL���f�Ő3ՙ���;�y��]|������w0RZ6Cuת�߆�Q���+H)��/?{��/s(_���Y������'��O��6x��ũ���P�aG��0���b��}U���x�l���L��s�)p��g����-� �I^)/dXvS�jM
b�3ov�ڈI���j�r���^<Nʈ��������ʼ�>-��U��7��/�ʺ*�.�!ʅ����@C�Vk0���O�G�:�H��P��������p�M�ի�i9���}��JHM�Tk"a���T�1��tK���x��+�v��;���FUo:��c֕n��N���0s˷[�}��N������c��UBUS�h�����q�����,Eտ�GU��}R�Qzَ^_)��9�����k���bo.�ki��Y����t2e�YnI"45NmJfD���D����4R�v�H���>�U������u=��#�������}�q��"��b�w���j�:�]wG/��}sSus �  ̬�^� �ɾ}���������7���(V�|/�nѝ��$=��.����<oT5�z� `�wK���{�p���E�x�����&� �c���z�=<)~J򞢦�Jg�Bըj�dw&]:r^�r]P�{)f��(�	�.�$�D�u��=y-���1U��$���m��F����S�M�#<Z���.��a��뫠������z�cX*|[T���S����y�Ti��E~V
�����9�S���ǛQH屹:{5��+�j�ٴhU�:��=br�U/�����i�H�wd����Doʤ�����u��kE��RӰj1��F�ܼ�R�*G����+W�c(�<��K��J���dl[�{ww�)��w��uK?�="�?qk��>�@�I]i鎦���b7O��&`_D��;d��o�X%{m� Nz�o�[����<]t�lZ,5̞g���P��<R-S�CL�;�o�B��a��(������Y��AiW�^��i�6����S��=�~�C�A�,��^� v�>�kx��T�@��!�NmӠ�fLi�h9���x+���δ*��im����rG�<+[5m^b1m�86�2��w��T�p��>q2z���ҬDe�!�F
ӥ5�[����S�z�FM���ۧ��H]�˵&4/�l�ۖ�Q��N"'J�	9�t���k�m5��X��!�=�[P��ui8�&�p�PӉ����ᓗdJ���J�*v5tzj��{qO���9�F�My	N��еi��gU,�Ӫi��l戤^\�/��x)u���Ōʚ��ځ��jê�q	�"�F�2��[���ʔ�5�WP��8��uKW���X�?B&���:s���R�{�>~���=U搿�8]E�Ph��(�����<��P      �      x������ � �            x������ � �      �   s   x�M�;�@�z}
N�PDKCACc�A �'���a�&�y�������� ��nH������t<�����ug׳�;/�X��/�Fu������1���]�}n��y?�         �  x�-�ѭ,)E�of؀�����]}U�|�UZ���6ۚ�W㙻G��ْ~�n�^��C�����Z�g��W�mB��\�siN�%:Q��]�7�����o�T.KpQ!��\T.*]�ҕ.*�9�9�9����!�ȩȩ�[9��r o�D�ʉ��y+'��6y+��VN䭜�G9��r"�|�7�Q��Gy#�|�3C>��Q�n��F���*�|���A���*�|��7�W� ��q��r)_�R�ȥ|�K�"��E.�\���IC~��)_Q���r!?�B~ʅ���)�S.�\����C��!�����	��F�K��4������3ѿ�hs0I\�����K�k|7�;S)���Y����Ҵ��������u��      �   �   x�ѻ0 ������爎��=�SאДԒҖ֑ѕ�'OM��Ai�Fk�Fm�Fo C8��n�#�G8��D ➃D �@"�HD��D$"�HD!
Q�B��(D!
Q�F4��hD�?!шFb�� 1���Ab�X�"��E�m��-�-"<�             x������ � �      �      x������ � �      �     x�mQA�� <�Ǭ
$m�/{A�����09��%XIA�DDf��[
3{�
\s�A	�嗈��%�a�̒�a`�&��\dy�H-�� �j:�!�䫚3={�)H�{��6��bku);\�Hձ��f���'�q	ŭo��?��>�}X��/;��}�,e��.�ɞ]�����߬K�{(k uk�v�J6oK�\M)���;E]ر��_����S���b���('�@���¼M[J�Ԃl��C�"�l�^��.hn�ʮ�=0����u7��u=|僛�� ��x��      �   �  x���An� E��)��Z1��,�F(�.6.હ}��I�:J6l��y364'?&3�t�Ll!�v��j�PB��o@^@)��S� �W"��s�z�hኖk�y����cb��k���}.4\0���������]� �F{e�+#�P���#~:�����S6�ˢ�/,�OݪY/������ɶ�d�GQ�dN&6�RR��љ��O��ڌ�*���9��ں���d��U
���c)�O��֞�TF{�p:�����f�?t��Z@��l�{���]�c�v�2��'\�S���hg�:���|��Ĩ�{������U�ڵ�@��۰�WR���S��I��n( +�~���p�a�@@T�<eE��/7��G
�������O�mKt�!�D����BQ��>����uY      �   
  x���n�0  �g���/5Ж�������d	A
�
�����	]��s�ep*���w<�tQW��Y�;zsma	�S�y�}�ٙ��`$��W���f�!�|��6�m�L�Q;�[V�	etI�UL��%M��L��(���6�O� uZzm&�@i���5�eN�]��p�X���:sZ׃��Q������KF�|֕�]:OW��9\'�!8�8�Nd7��S����~�~L���U|e���
�!�1YkH�T�)k��Z��7�*^      �   �  x���oo�0�_��^��l��;J٪��UY�6��G\�' ���!֮�#[�����\�õ���2�0?�D��Co`qa�2�� ��g1�ĂA��B��%7�Ʊ��ẰQa�dQ$
fC��1��C�̿D�3y������L��:K�g<W��+G*-�8���p�8�@���.1�M,d\��Ƒ\ǅLp&w�Cγ�< �s$����wj��hNd**�e
s�ú$nK&�N2��J��*�D6���["�����8�0,.<�DE�K���yRk���E�Q0�+*7�X��ǩ�s���|H"J���fª����m�`σ�r�ӍJ���2��"�,41*$��d�����8I��0�����-\�ILˠw��aZ���GY�+��1�G|�C��8��NE�Û�Ԫ��8Uy�R��;��6���3l��.��Z%�1�h;g��El��q�PK�"�$ɶ}���|�tA���ۈ�ȅc��� Fr�r�1�y,�a���T<g�����9�Z��po��nO���Kt�+�n�,��N�F��l�!\�8t�8��	��W�HYF�����M,��:�qRG���ͺ��q\�|)ӅB]��Jk�^�g����(:k����?�ɅTmQ����؁�\Z���9Y-��?J�u��1����Ү��z������ԯ�����?����ؽ^�/?�̐      �   �   x�%���E!е3'@xB/��:&��
G�h_�ٶ����˲�Ɗ����~%��;V �]������l.G�_c���=�Z��p��#�~F]�p�db����d���\M�Y�����,8|l�~�ȫ�<��	�3���J�D/I�r�,�G�j^/�ci^/N>�c̾T��󿿽�?��@            x�m�������	��&��8�8�����\{C-	|5A�(W�������]�_���󿢠׿�o����߫�}տ������������������>������=h��/�ߊ��wh�e�-s����d`+(����w��c������A���Q�~��g�*��yx��߫FZ��jX3p�@]�j|a�o���ƅ�'b0���}SN5���������������y�Z�#��m��b���*���b�(���Ǭ/�i��8iF���چ�?����)e��F���hwX�-���W��,#4�4��ü���Cެ���ti���v�m4� ���Ֆ�^[3��w��]Я����nl�ß5�̻�~��YF�9�u)D�~���e;�*���t���7�����r���S0�!{��>ˀ~�l�`���݈�׺��0���0,2�x{mf����Go�}pW�/x�)��Ɲ�HX�	�~�9Zj�w���/錷)W��hF��ׅ7�Țf~��[��;'��1�ܣ�=���c 8}�Kc`��D-���n�y�w`�3sN��*1���O5�J����p���jv#�f�0����k2��4§��=�3��m�U㦙�+�.�d� ��X���o'��� 0b�����6 �}��WzgZ����yn]��%]官�c�2�u���'�.�<l�r�����eD:����5w1 ��f����O�'�� ��,s�b^�����m��[�V�V���q(����a�����C�5��߾kc �e�c����O�M���l�S��K��N3��߇�Ӎ�5������L#�G���2�6^�����>D��6��ܦ#|�k����Ռ�R�\��S@�!�\�P���T@�4��-0����w��%�<N�����F��Cs���G�8��.2y̤K�޹8	��Fb|��!ʳ@�P�>P�p
;|�/�ܻI�zw�QW'j���xu��i�F�����|'�c�D�M8�7A���;�t ;�/�-e;�N��a��N�i(�xq�}�f�I�Xa�?�V��D��f����=���x=����'K5C�	XL�]
�옛�u�	x�KM+Z���P[��H����)*��Xj��l�BP�~/]T
�����bPP�D���F��U�0��7&����xE�$lW{q�?T
��G;�a�]���P̤D�PH	'0ƈ�X�S��@�[�}�3�x�e(ZDۑ���0L�%�����<�*�%v�#N��3��	Cܦ��(f72僲���2�''�	�+-C����\���[�!���[Ub+%��GU�Bh��D�PR[�1Iu��xo�n���OR�(�?��j�VZ!�*[鱆e�X��К��y�c��`�ܰĈi����b���:ܰ��xx�nF�S��X�Xh�S�X�L#�^Q�H��G�����Ⓨ�X7�/�zl�J-�HQKO������?��
��$:��"?�K'�H�����f�V��e�o��Ԣ"R����c�Þ�z]�bACvj��\� �=�򹚓��^�H,/�#�Tv��;�pXh	� �n�6�8�a���|E�\F�3ܿTK1����T5�샊`�4��!J7�9��[�#�iD�D��6�e��m'�ɖ/�.�Z�1N��*/�<m�r��-�E��i8R[ܕK�Ow����8}����ā�G� c�*QS�m�VR�)��ړe�JL!��HMq�ީmd��2�C��u�˵j <��ZZs�rH�֍�k};���<��n0�ݘ��2����+�ݦmC��e��Ƚ�.�*�e[�jWC���@����a)�"�u��8���B]�(�5������D��Z�8wy;����y�YHm��{�?iy�G���ey�c�-ݪ²'�������\=��s	���ߚ+a�pP�=�b��U��^NL-Ct�w
�,o"^t�˲L����I��e�6I5���c"��=m��wZ3����g%R!-��3+��eO�<�aЖ=y��s@[�x�֧ZfرF�Q��&�	c�f8��,���=���K����1�r�� �c0������x�ߚN�+��Z�b��SC�����P!-e���r�BY޺��R�@Y�_��+��H�����K�K+7 ��.�e)X�	�3z!���-es˻Z��6�
a냸���+���r�����Ft��Hm);\��Ҳ	�N�=�sA��	9��i��� yy�x?"�� �iA�˙�l>�4�KTX��o����Ū!6��D�!�a���hkИ7�ˏ�H�1k�ܩ�Ȕ1�爖�W'n��ǎp�ʜ�j��Ԡ2g��`�͍۠2grL�� 2��z���Ae�����z7I`���m��2Du���y��f��c��d���)�f�Ӽ� 0p1�UC��ݠ0o�	���I�+��xcvk��2����)��)>o������Է�!1�nFͻ$��Ǳ�k�Ae������XM�j��b��/�a(�lѿg��\�����\i!�z�
��\i��&�t�gCM=��@0Ǝ�����L�gT��.��t�6Q��@�5��nCO���c���?����3�Ah��f����#�������8�Fb�����;�B���P��Ö�G�l#Oգ�8zK��)�l� �:3o���{D��7f͛�v�uG.��b>�u􇦑��,�X?
m'ޔ�QBg����B�Fl�|�����^�%yq(M���*%͉7J_=6�}�n��t�B(�%��X���з-Ch�֍w��}JaK�s�)[w����P��zE*h!�Eڹ��yjL�l�P����pI��0���,��I��d9q]�aB�$=���)�p� ��y���ߠ3Ϡ���GЙ'm/7,��a	�t�gC�̼I�D�k�� 3�z9jd�d��H*���$�!u�L�k	o_ա2ω�=Y��x�;d�ɾc�T������H�ѯ$������~�\�>V]u��	��E�1�a���]���OXdW�)�S_]�f��;�� �'���B���U��0���5\ս�=zB�eF/���h;z�I�1<l��p�0�)GR�x��^���TG���pҍЯ�2�Cr.�z�4�٩�u�����;*�ǐ�+�{�p�`�k0D��-�	���OI�2j�:�&�2SH�b|	�D)� ?�bU�J�Q�*S���D�p�_��^E��nc�ɻ��L!����"SP��XJ!�����f����a�������;�w�a�w�,#���޷#.��`�����1����(b���7G5ı��h�$��ct#��,3�H�k�b��i�:��`���@�>����F�ZB��k=ڊ�L!��*���:i9C���F�[�1O��ט'e��gx������H���&?�?O�Ps��7�y�7��,�!m-N8�Ũ��U�Eka1�b�i�O_��Z%�5���k~M#\}/'�Ŋ���r�;�9?�8�&�P�/C��I��"��� �Td
�_��kF�M�|�����<��T���p#���dV�Ywk$j��Z�U��|�)Te��}Z��90E���{�Fb(5�L{g|�ӝԿg�W?��d��%&��+�,V��lCO7��c��w����� �C�gԖ�W5��T�=��(�%N
`�OG�����!~�2�x�ˉZBcm�cۡ/���Am�k@_�,s��b�#���)!�����T���H�G��$���&�Z��g��B^�$<���9���;���x}@`�4jn'ň�~f�0����6�����MS�����y�󦇓e�]�5 .����h<9�˾>�s�Rv��r��Жr0���	�g�����}�W΀���p���9�P��zfj9t�YR�K�;{;����D�vT�睥�#E��ޡ/o�.�4
s���F-Jk��"�D��Oa�da�7	�1^�Wyw(̑|��И7�8����y�Ϫ|@c�X�yӀƼ	׆��#��|_c@d��    �d*s��v׀ʼ�'rq@e�q���!3�~���'��U7 4���EH�2ﰩ�9s̯1P�3ltj�t��7d�L.��mC�#���wW���^*s�����f�R��'@�Ab�^�8��9S�z�2��S�i�i�� �R��w�y@a�����9ǏAS�H2M
Aa���?�9s@<���tЀ���v�6�/g���q�r��ZF>���R�^9�E� ��L����y��	'j���z��/Ŝ֊���y��_���}���i��gb@]������y���S�����
u�7�M��[�}�0��F1=lG�P4��z�O�˕�Լ6&䥔x�*E�5}��`�Baw��&���`���e}��=��ׄ��l�)�%�k�����\9�G(�/o�sn[LA<�R��gxBa�x��_J����΄��%M_<�y�K�P��~OpLH���f���Ɣ3m�ḡ 2e��<7'D��~j���N`���t��FZ�+p�%��8!2w�P�D0D�)Ae�$�;��!z�xf�"��G/Lh̽��"�0!1�� �چ�~$�H�1e���
y 4��K@o�И���d�1����(j�x��-�����gjBa���P��8)؆'y!0O��e'��<�}-���q䃒�NHLA����i^>�>H����	�y�w�̄�<�t�lgQ���2􉪝�'yY�&ֵ>�yЗ멝���� �� �/�����Ԅ���=$!��/�s\ZC�*|�W�)��N��_��H���TQB'��*0�H�`ͧ�U_
���oR�9.ݛ�Mz�"*�D�k#���f���Ub*�7�����!�aH4�֯r�-XB��۸2����`��=�g%9�6�����KY������h� #9D����B���Iv?l�ڋ����Q�'Tn��l땥:S��y	�*3����*��8ݩ2S���x�mD�:�N����NTd
���qR�,4������Z�Z��h�[5O7ԪEF�a�-��}��粋�f�N�g9�Ž�mH�'6�s����u���Ժ`�����	Q��U#2�h�B�P����Q%��T���a����l1���ʎ#��Z����^�;�$d;�!.^�X�1�1��@"Z��#�k,C���7A�f@$�l�]eݘL�G��uQ`ut�D|�+�e�*�P���K�����^��H�o��r�y78��#nn��K!S��Rq9āo�T[
�n�
w��"k��o����R'5�2^*.���� �'iubw*Dǐ���#�j�!��� v�QK~eG�F��4Qk�8(O�n�gB��K�n��g�զ!Z���`�I��V�j��k�_�a�j6T�3�א,q������z�X-��f�� �[��d�+:��qf��ҧ!6<������Z��ö�Σ/���j�iz��3��Ri)H�����r���7����f��tCs���*.�m�GuH_Wm)��B�Q��/�Y���d�1M����ɒ�#j��eVC��)j�d���@��;q���C[6\�1��<���KA� ٥�.e������+��R��M#�F˓�e�yP�|	�K���*��#�+�P�m�4�wA\��w�4��� i�NR��� -ۉi������R��Ϡ�])#��m���R
q��Y�,�=�u΂�셓��,�^���i(��琖]c�n4L
QK`���!����X�x�������K!.e���
4%0E�u^����ʆvH]�]������L#1�-C\��� -� ��X��]��=�^�Ҳc�;E^�P+��%��'h�~��[�lh���[_��!�¾�-F�m�ߐ�Bn�����K��e��P�#��(���߽�-GU���t�o��Q�����!.�XH-��w��
��iu�K�yV+U����ط!/�g��]З���?�N��)'��T�b�0P5$.��5��#���}��1�u�
�����4�N�����-G�����wCb�?�G��	����XI`��e(�k�Ɣ-���)j�li?ԝ�1�-	s�o�X�D5�Ά�Y�mGj���x��C�^��7D�L��]*s���A�������7T�M⧈���xE�Bh�����Kj��c�نΜ=��6B+�ղ2sF��ʆʔՆ�_�l�Ll�����*s�E��Wm�L9�7_ޛ�9�����9���V�9�2��`�#�,T�L�:{"T�<�~qi��B��{�ݐ�늮�>��)j>��ߐ��$���	:s�46Z@͆Δ��t�J�Q6N��#������J��:s��19@g�q=��l����`�:s%	�w8Bf���!��#o�>�Cg�,���iH��[
��P�k���
�Ҵ-�gۄ�\��%��\?���ּ���Z�v
_l�>�0��Zi���\�5�+����᭖0�I�rچ�|s����={/�Ԕ�E���b Ԯw(M90��}��4�
���Y^JSN������%?/�	Z�hbA�qCk��Z�+RK�4��;L18+��9��{r�:�آ���V#�<�;�{ �b�H��߁��i_�TLq�Ǻ?P-!~��[l#|���)\ny}(�S>��@h��p$j�S�Y�Du�3O�!Nr�aW^�7�r]B��Ӣ%u'�CgV~�v����7��k5#7�Bf���z%+���p[$O�MT:S�����t9Йg>ո�b=תJ��6V<t�Y�{���)�}�^g-Bg��\�
��<�;�ՙ��(��*3�,d���Ч0I���8We�j4f����y��G�=���k�QJmE=v�l�vTf
yN*�Tf�k|W%�C�#��8�-�f�6���t�b�Q�>Ї�ЅD�г���ۏ��������F�1��g\F(<U����$"�bG���3`�Á�W#w������c��D-Q�$�-��̜�\tU��g��9Fb�ĭ�"sʩ1;W�GE� ��`�j�-��G�Ȝy������&RK��p�I��Ӏ�-�4ء'y�;�!ڕow�P�'-bD�$��g3뮌U��A�%V3[�,�}�͂!����gg�[n ��Z�H4K��ܑȪ_�Ej}��r�A��"s�=5�JL>��!p�[��K�
a�Uy)�����T��� 5C�� Qh	+��㨾�5�G��r՗��Afk�s���UG>��Ӛ��d�e`����%�pD����LC��9�Dv
9�F���z�y���x
K��@�d�X��(W����=��֍��kk���";c�EN2V��e��C�FiWr蘯�f�X,��{�6g�ń�Z7Q��h�>�ިz�m��$-�Χ�
Ne�{و�!�԰�*Na���hz3��K�95}�6D�?h�r��9W/���H`�AA��FՐ���5C���f�H���5�$�A�w�@A����M���.��\َ�->�]�"ƪ�c3��&'*`�Mdo蹾�7���i�S���Q����Jo�F��W�~d�:{l
��Qp���}�*P���4���f���*���V�Y.Hў��E{OO,,��_�1
�h�У=9h��#
�Mv�q@�5�$i��Fh|&4)ΡE��	4iO����R9oV_�!7��|��ti�)�Jc���j�����5���O�8�eX�>!
[�)�٦m	�:rQ3�	���R�^+$m)�����905�����-C������'	,2�ڊ~�:�sn�RP�#; 9#A�
ˑ}J`����To���DÑ��Ά �*�=U��e(v���6!Q�i�D�:R�����z3>s��A�����TV9o?��n,�ʝl�ܣ���)9��j�ɑH�q�W���̯���efeK�@���*
��%S+��^{l��,3Gu6 cg���ћc���p!;�{����>w�m��>��2�ߖ5�� �].2�e����$K�N��h.��
��ܡ.�Zw5�pn��*��V�Kh��P%چ�-g;�LAɄ�B�(�9
 ��2WuQLm�Ү�r�f�[AZ!e'�Z�.{L    n5�l,�� ̒�o�m���zVcAήج�wCή��;X5���/�0����-�14W�2�59.�i��S�ch���wgBA�!a9��)���;BϮ��+H4$(6̃Uc���&Ε=w�
RM\��"�uSrV��4�4�����(�<���-��]^g��1vU��Aơ���@���؉��wKAơ�c+�ٽ�ew�ҌRÙͺ=�4��Y�rh]�m��4��8ymF��{�G�+��&��� ��Q������g+�;$0b�X&I{��2��ޡr'[��α[�r(ٝ<��?�F9���J6�g�`j�>ݨ(�ŗG�B�ʁ4���80��eO�;3��i�'��f9�5đR�&��i�e�~X�B�'��R �<�8|����v[��>����2@�G=Zj��p�(�����6ƙ��䐕h��ϵ)@˞�/{�����V���ER8z�9Hٳ�ၗ�R���� ��9Ȗ1�K<691jp�W%�T����X��HHt�JV�Q�v�5�c�Q*�`MYګ���I��U^^K������jD����R�5�2v]-�2$��g?� S����6��(S^��c?�y!�Q�p�tE�ߘ���E�<<(��3f�TlM�������x�$+m2�b��1��?W���Pp���EK6����)�H��$�#I��a(�3|�2�}���]�d�y��.�&�ڣ��#�T���z�b(����^WI�L-�pA�"E�s2(�)�5ӂcO
6�1�9,R�3:�X76�O{��<�bP��i��є,֊�X�n��̇^����h����&[7�����*3�&��MClB�hzF`��&+�j}�FF#a�cV��C��r�4Z%-��FN#e��ݛ1v�� �{:+�Q��;ݧ�p/-C�`���]�~N�f��1��a�U�j�O�U��h����R��+zKY3S�@%�0ns����]��P��p��Y���Q	+�%��$�ڬ�ʑdJ��ć^�Ԅ=~�� ͑�8E{��v�י�X��`���`��=UV��HXlrmC�@e��'x� �Ѫ���^��s���>St���]ɡ�Ψ�UX�C/��25JK��l�H�`j��TK�S���m�hy*a�}���H��hL��K2�Y|Cl7C?�uwc?�r�*�?U�Mc�H�$a������I��l-�m$n��|;l�_�� �v��Z�f���-�+.&��]H#��i(l��1�����I�3�L͑6K<Q��C�Rȃ$(������dj��ޠ/-�
i��
F�Z6ɻ|���"�b�Mc�J�wY����F�����c����5@;D��Ҵ�k_O�3P3��.,	�*�W�*?~l8z���`�M�h�!_{^�;nc�����H������H����OKB�������H�yN�FCv�5^��z:��&��I�G�G���D�$aQp��6��}��e��!v%��T\#R���Ҭ�W�����&R$���M<	%6R$�|,����a��-cO�	{�.�w`��1S<$;7䫤���/ G�P�LIk��*D�A��$1ط!^G
[Jņ3��Y��\-(�C��trmچ^ۉ�`��:����2f���U/P��τ�����XX�J���|"u�0��a����{h���C���lb@��w��Iʞ�8��*�}�2hؙ���&а�}�|Ƞ��N�D�}v�����&#d��LΛ�%��OX�(	zz��`���"�$���YB��}˘�!a�/�lJ¾�pȧ�f����D>%A�-�h�\0Q�PI�'V��瘜�J(ؕ�EY�P��f�&$�\g�q0#�����LhؕN/8�+B��Ze�3?�P�r����~�`Wr<��`�X /#�M�2?�Y�]IX��q�+)� �ETED �rH���z���C��-C~d�:?�H�$��@@���S\tٝ�`�A��8�����sSG�5Y�+�ΊTKk'_@!R���L��ȵ�����H5��� ے2�zA�%A�3�`�IjD�U�1�`�I�'���oI�s�V�=�@��z�$�	!��z���}!���;ܦ�����E0I�3�%�d�i56d]Fݜ�g�(seP���烺W ��g�Lm���+i��K1b@j�S?GA
�/	��d�(ȿ�N�\XQ�I����j��_G7��!c�3����'_:V�^둃i���L��,L�>��i������c'�IR q�g�&��ItE�$�Aɞ��&Z��\M��	P5�����i_ir.A��IX����3��E2����QZ�c���)�V�C2Yw�d�=�P�T�*��1X1F;�*d��7���L�Bs�����%0%y[�G�&a��b�OKy�R4m���A��, '�2�g]�f1!�,Uq��VB���O�q��0��|�~�ƞ���(�������*����6��akV+(�����y#,P1�cF�T�
zEH*S{���I�	T�
c'��:�c��OO�lڥ=�U��d-Ctm��X0I�􊎣Gܻ�_�|KwCۡ6��Rm�&�se���?���n�e�����Mc�{�
�7	|�L@�m,~p��.;]��g���לv9aN��S}�H���c_i�v}�}6��/O+��k�܊[��I��>΂LN��ל��Re��p�xC2�]��V���{�f0�I�_�6�9	�["�d��i`�X��`��ri��د��UV������IeV���b��6�O(0���/dv�[?uC��)R;	���j���M�I��ėm���>���J�L��N��(ˏV+�͜?�"Vm�cc+Q�[�A|A�OBb��Ȧ��7l���A�9�=	b�;��e��5��m�Nr=���Łɞ���G�g��;V�i&�����6���)+��$(na`]�m�m�>6�|�m~/�*����.�#��k�����KhX�r�.
��a�N2�<.N��"�'~&9� ;�TH��>��&�I���A���u��ڤ�;�H�$�;� ��2o'#X7�us �����lcg�}n�-H %,���A��t��+w>z������M�����OY��=n�T�i��ő�x�0���pX���=�6p셆��s	�����'�A��bs��26��@DB(A��yF�j�}s��2��3U<Ђ�P��-#lQq�mP�7�(`��r{���9�C��
����Q��#��X$��j��#O�AFyU*iN�X7""�p�S���r]�?�_e#ϗ��ސ�#/^ib���R���A??V����6�k��D	��'(ؼ���?�u!Y��sCA�(A�3�H�e_�7�|Q���5�v|N �*;�'�#�1JH\��5/���&���[�l���s�S���s�`A�(A����3�c|�E�(e���H��'&HY5��,4�,�e	RG�f�ņ������l����� u��g�%L�?�$�ĭ�Fd��3�Tx����<.��$�-�A)E�&I7B��v�W���$L�k�9��}�/.�"%,�L>�!�Ԟ癈@�A����Bd���o����"@.��r�Q7��Dj9hK:�Nj?NV���}9iAF�����3����9��=�e�g���QV��F��]�,� ��^��Km�{�%[3d��^k��R�xAS�Q��:�c,"�&���)��9C�
{�m��Q�2:��IjjG���=��$S¾�?�2�w:�:	Y�=�^`������e�P�t���	�ӡcw�'+�7ٝ6b8�A��E�p	��{��R�X��l�P�����*�Q�w�F�)E~Gk"���=�/rN)�B�&�����r������S��� c�����xj�!���A���c����N�b��m,]�P�"2���R�\?���?%���T���~����/��Z��-9=RCMG����F�[|�v6?���=�J��\T����>��ۄ"� 	�v:��F��Jgr�m"%�0�8����y\��a"�!*r6ߚ�E<�R�u�g�aO/��T�DF�A��$ �  Tl�@j�s�5��HMu����vC�S*�Mu��WYHNu���$Z�⺪O܆�W"!=����@��s�384��Ya�K��&�uŬ�e�M�+	��(q/2{$U�k?��x�4� �N��������+�_�1��F�j��c�@ղ�b��U�
�A����L��#l�k��Wr#g�)�5�j�T5+,]nPmR"�Ot�'@�.C?I�Qz:�FI�����G�*A�L@@0J:�Ȯݦ!nNZ�>��$�:%��7���+D
�S�G6��P�,2X$`��f,6�����eu�c��QN��7��',c����D����5�rV��+�Y���u�&���JSH����N�fy�Fs#�Z�|�c6��P��0`�t�8��ꤣZ\#��ɧ��W�q��gBZ+E�KF��J�7hy�N]�]2���� ����K��NݟӮ�k%$b�`�|�n<pc�!:�>�r��:�J'�X/�b���(�U�'�&Yݫ��VʞG���MZ\,���p%��BA*cOK��a��q��l�:��;��^�۰JN��v1�\]��(q�+�{�&i~氶��|�O{�U�&�A�+HRm�a��Jȫh�:O�{�g`��ڹ=��c�{?d�Xh.�y� kK8���LM�#Ɛߦ�U�����"�4��\=�{�u ;�\�mg�|%�M�~#��:=/�7�ڤ�;NQ3���n,.ڈr�I�?�[NC�U�ɖ��Yp<V_c"��o\/�`�|-$�d��H�T}׽H�u�7gkA�#�7>���{r���,�U��`�?$��q�����TX�D.XV;�%z$Q�����'��:�#g)H7�L�H�!�0�]Qj��>��Zc�����'�GA:��3��"
��� Y1�>�
�u���x%rb��"�}?I��H�D�B���"��AZ,Al=�Ю#�f�%�3:�ct:�Ю#v!��A��=�+(בBl�x \�+�KM݊�����h �:��-�H�u�nƜOY-#+Ѻ�Y�f��fP�K#]�!9��ol�c	����u�c�<���Xg�KM��3]�KC�Jm}�( A��O�قY'_�X�0Ɍ�m6H�9�+�$Y�B��M�w}�,Y�b��o	�:���1.(CD@��g�u 5Ɋ[�y������+T����H�%�H6 ���^�lUC��SI3�9�TYG'���)�e���ڊ'NC?�s�W ]��9����k}�"a��g�;X1���)����X=mXP�k���`��3�/9���,�$��?4+n�zfw(țuV�C�@��z�TA�,a1ӰeA��|��u_�5�Z�Yw�l�*T���r�)�>�H�uvJ
�y�u�
fE���;�c�S�ȡu�٪Lm�S脧�-H��,������z2i�����c�:�����B2���HR9X%��(v}.@E>--�Ğ,Ѻ��'B��t����ȩuv��03Dk�u���j��s%�j����3J-c\�1|������Av�q);��"��9�{�� ���g����+�S�����
ɵ�c?���ȯuұ,�!�`��+=IiA��s~]��['���Юg�nUU�zR����g~��Y�#"@0��n>"Ӗ V�"���wȵ��}�*rm�s���kK�+߅�c,v:}�U�mI��H�i�]=dP5��&T_Rԫ$\���D�*��1;��Wea�`���V'M�%)\b*�6�<!��C����a[�n)��%�`�&��R�|�TM���N�@0I��>,�xKQhs"$y�H��׽S�`����Cso)I��^��X�ZM���ǅ��~Ka��i�	��[my��&�R����bs������2926?o�PrXL�R�� �D\�>{Ӛ�Kr뤋�������T\�x�{DXSq)���l{�
�&)퓻�h6.E1LmG�D1��KQ�|:ڰH:�E��a���b,Mȥ쓾�hN.I�UQ�;c��wl�$�3c$��Pt���^��"��K2�з����鹔=rU�,i�Ո�#���(����@StI�p�z ������3�q�7Y�����m�{	�&꒤I���j��2����j�.I�>�j�y�lҿg��f�R�����K�g��j�.eu�`��܀.�����hE��|Jp�W�e�����K�>}f�I�Ep`!�I��4*�tg<�M3��|��UMӥ,V�4sQ��r������?��ǋ}6׫��B����]ZDt~_��|I�߫��V���}�
���R����j�.I��vr�M��8�p|fQ�]��bCj���?�VI�w~��j�.e����k�X,%�`��	����KQ�
6��r�([��	U�uI����목���0Tl[� �zAŶ��}�zAŶ��9�a�^�[�Ǐ�S���m�R��Y�-��a,�X9�ŀ
��=���M�ņ��X/��^�w��*���l�б9[� 2��ov��c{�8��*}�6CMC�ȋ�S������cB����˝zA��t������M��|�S/�Y٧�g��`����q�����U %ۓO��I����@��d���_��d���gʶ���`j�|R��@��8�:�^/hYI'�11ʩQFL�� eG:ݐ�F)$��Rv���ʦ��7�^в�.��`����:�~L�P�#�+��rv�g�"l�|�������zA̎���Aˎ8q�Zv�M��r��#�jҷ�I��q��Jv滧�sP��G~�zA��M�h{в�}�L�r�P���1��uv��ٞa�@j���U_�l{�P/hYI����b��+7V-в���#��qk���i�cʹ���;�j���)"��ݑij�BRV6�h�xX$.X=$��~�}�m(F�Iv��?�� e��&z�RV�A�]E�j�Լ�3tHY7���P��
?g�!��+�L��d�)���m#���OC1Ț��}��a/��׌Z�b����Z�bW�<� �Z c�����+"\p��"֍&�Ϩ(m���+�yL�8�M"(���ytb-�+��>6�W�=���$��#����u�~Bq3A���jU���+_��Z��H����y�v-ЭBx�� 9~��gA�v��� ���^���UD�x\�����LY�M��P�e��⭝KwKDd!��ⱑ/n�2��4��M��%�U�M�#OZJ:�p[p���(�@�?կ������ߟF���w��cѹ��Gݝ��M���\�>�MW�ry4P%ۈ�_�/;F� sr��y���@�@��tm���������>ˋ            x�m�k�m�
��Әߏ�T��Q�1p��䦾x\NE@@�w!���?������s�����S���6�cZ�/&��������_g����/�_By���տj:TG���K��2�A��BظH��:��0fc��G�_�_e~�^�8�_�����4Կ`�%��;7[[,S2�<0��*Қ;I��~QG�?1��u�_�qM�6У�����C����_�s�8�����i�A�N�o�;i�3�Z�˓��1������	)L�5n�1Y��Set%3�c��.�3'�E���������8��*J�q�2�눵��󠫲��aЪ:c���7�3:���f6m�X��h�r�QD�иq�ߗﶍ�xE���+Br4虹 ���6V����y���p���$F��*d�Q��_!���'��=���ʐ�����2U��ʲ�A�n�e0����a�7�ƴ.E�y�?XI���PHE�qPQ>,$༱vBzP���>t����9�J�P?^��j�g|4C�am+��n���)$�� /+4���1�v�݉}Q�%K�Zyoq�:�����15Xc*�Mfa�a'}���>�m
���))�,�1�C��"�O�����F����Z��E��t
>ChL��2X% �&����!+6�v�;��I�>ƈ�W��Ҝc5bv�L�w���D��U(��3pL{|��Ne8P֬�!uòKS���t���c#��I[S��'�X_�;�4�A�3c�C,�9�N�n���%L�Ս���xxQ+����0X�4�}����)�IE�W�٫�Ui[Y���a��{�~��8�N�c<�Mh�0�qr�/��0<�d�Z��m����)�.��C���Q4�����8q�x��y�Yo0��˘�Ih���8^j��'�hqc{�q�6�LdW�������ظ�4��
t=�"{�o��t:�Y/m�HV��,P�c*䫋]ġ�d���u9-mEj�zU���'��v}�'�c��W���UP���c3Xg��<�Q<���I":�z�!8�)F�$�Ҫ�������3�=�ծ+�J�?��L`�:�4��<5�:�<�N�(z�R@سa�2�w	c �'3��.1��4A�pV���qE�qxȤ6�iw�p��	��g9�	��A�)�F4��M��"�R)��EE�B�5�j#q��
-��V�7&CFؠ��S��b� � �:�f�0���S�p5X8�D��ɦ�o�Äg`��84��	���U�y�����i�Зˑ�c%�P�W�}�29;v�הFĤ*AbGr ��� b�4N�nm���=�O�;0B`��F�ȉ��Z���w��SkB�$ҁ�40�9��LT�X�v0�ئD������BK�l�M:��B�l�̃���8�CZ"���0�x�wv�3����	��E�t�ͺ뛡���O��F\�����R��S��V�A� Q�+qc>k�g���?	��.!��󧇱�ެD�թö��dc�����TX+7F�����P5�h�S�4��H"�:<� ���0�i?n5M�T4y�P	��'�-Q�#���t�#鐎O��Y&eEu`=�BJ��L^���V�-����X������+/��f�P쁶�lV]0o��0e��0@]I]��� 3$��E�5D�P���MS�����C�W���Sa����!}x���8
vRf�������z��M�)֞q����h�9��k� R'��4G�Z5��|��P"��5�X3g�+�?;ƌ��K��!��W��Û�^"�؆�_��"M6��R8�΁�^��}�M�qS�e	��'���MǸa����<���g_6�م�.�~Tcl�֊u	
��A�y:b6d�b`�>Wg�Ȫ��f�=?G�G��WUj�3��͐��Vc��$#��+>��N+6W������٘ī0E�,0V��>����5�{�#0t2h�N�1yf��t�/	힍U �+���x@�܇M��ƈƓ����DL"��Н7UAj�S��z|Rm��!m���uB_�Ş���w�TMu������7(T��:��[�z���,��p��7v�h���GҟQ��1�l��eT�$G>'92t"��N�_JV���jZ?*i?�;IH~/��j
�/�Bh�Ӝ��!���2�+*XOn�b���^�4����##�N�1��X]��T�xԖ`�,���І�5*lq���/u/�xPԯ`��ީ�K�)48~�{[%���"��MbӀ�as��i4�m1�#w+>9�NW�;oz>�D�SeK`���H"˻_K���E&\ﳭr՛G!D��0V�A��(��)��7̦�2k(�E�錈j���9x�`��Z���1TK�����Iuƀ��8mm}���������$�*ʹ��(�}�8\t�XYj���a�rS�
�5���*h�v#��NŎ>��_M����z$�f���6��I��-6E`���3><Rr��[�#QZ]ڟ!���.9L�t��4�P�u'����2�[I�FJ�p���$#��h���1�j�aS��I��\	�E0�mI�Ɲ���k�G���T�b��*b6f�ɎBc7'J��.Tb��c�3��L$�������i�jei��ЄCQ�$.dq�!���j���Xes~��
���R���P�	�C�ǉ��L�qq�4���n��H'��(�H?3Q������S�B_�SvT�	���8`��QA�# �L�zc����*Z��Q�`3y״���0g��+�u��j��|Ő���i���Cf�8=��s���ӹ"S��є��G�����L�`efl�{we
V�_���Gz>����s�G�'@ogI�Cc��Z�u�)��i�N�5���9��� �����g�#��΁6�������T�x�[%?��L.�6V�����?��k��d�G� B��.7��"�$>7�d�����j#�J+��I�ej�j��q��R$�{x����� rLBm4f7FE;M���w`���B�K�R���Qii��b��4���@��|(�'������2Z����׫Sܽ�����#�Do�ۭ��M͓�N�W�R�*��"%��.�`����O�wb@��DW�@��X��ȹ�uţ���0�,���b��s���*3|ټVmt	M���w�v�×6������|�RwOQ��:�*�k�B.K��|�6��)%�)Xѩ��6F��UDw���(��X#x�o�����N�S
�&{S/w�z��/��ϊ��O׌g�A�s��N�y�c^����Yՙnz��W#~0���^EՅ���:+���0��9K�w���0*#�΅��k���<I�!S<�"������yG�[6�F��qxӇ�gm���#˩#uٷ�L�M�{<�T�m\�CH�����M6�$�	7��Vc^���ݘ����l���E)�� ���*K<X<�Z���9D��"z:�M��P9�Ύ��u	Ga( +�q�
"R-8�]Q��D�#���m~JX�\$���X6�g<��>�g;9����_�j �Ǭ�s���A�c*�`����݉NTK�Eİ޽���|��y�/+=j��ʩ{]�5P��\�%T��BUe��Ҕ���\�E�٠����a;�ƺ(�qkH��ݼ"isj���(v��
d1=�F[m�2�k揖`��$tгM�=	��C�k�,�`U�H�d)��Q��?X��<�m/�4��lx)�?��(��v��*�O����~i��<�s�a�	��o��)��Ku�M�(6��--v�}�0����3���/H�U0h?��w����0|�d9:L3����*��r����9z�V,l$����+Z/!�a�t��1!����}��oQ��� �I��f��m�W�%�ݏ�=�Ar��w��B�Xܸ{o�����GE�zV4�hf\w*��Lc̵7��5d26��j��z躵CxI���C�g�w�3�]h!4�*�,�ɑA���."{��*sDf����V�0�S��vD0���+w�\ZH�$	�W�H� ��:��k�5I	�    .Qs�*�q:ޗ�0W���3]�&!�2�ю�\+�Djyc�����C�3\ׁ��B݊U�4}&M�%txO�8��Q«�i[x|P���B�M��^0X=��H}7��BS�x˒�3�=���:���ϰ��vB`v� ��#��P���/�)g��ޝx/��U��\��TW<�.��qy������C�YR��鱂̧��8���-Ճac�znC��8%g�pL^!7r�V�aY�H���[�无��-��p�ާi���yJ��$g�$�����x�)���⍞�%gu�R�p���`��x����C��^��8�P��f����1�&���R� �^Y��g�yM�	�Q�^�M V�O�^�|A�S���7�t�MP#�)I)�?[��&8�)�9L���֫��ƒ֊&�,T�
/L~�M�a�җO8�nQr�v����Sc�Jڗf�]VJ�:�􉝂u��� F���[� �ͩ&��IAL�x��k�m�q�ܡ�gbS4����r��[i�:EmLJ��)�Ͷd�[Q�FW���PyO�1��֊q�f"��(����;:ǄH�����A�x���զ9���-vgi�� �!E���(VV�m��B�G�xM:�d�{�ه6gϗ��Lb�����@
,h�h�<�r�DH��G�i���*�X�$���Oh�W���Ȧ���s���!\j��|WU���Uq�3W����q�s�uB[�r�V�n�_�`�,VuPֹ�4��AȣP�$ۙ޸�&J4M��s̿&N��8<>9���8�14�]B4P#���9-��y��.��5w�"��ِj�3����e�Z��p�?�NTl�h����g��D.Wb�sԘ���!g���	b��u�9dZ�d�C�-1,rd�f�E�`��r�t�8
�M�N(n��M��Q��s�$A�Z�3�b;Fn����Y���L|��
թ5�=X#��RX��0�CS?Nq%�ᚩz���X��950�eZ�L3���S1,��Jh�Q�q�/�;|w5p%::둹p(��S���m!dA�uޔ#v�@���"S�~�c�$��"��R���AX{�z������Y�N�b�F>��U���đ,af��D4�W�Q�L:�}=���ZbC���h�������2�:h��n/3ol��ưc4��� ���*�bw8�f[6����#,Yٙ�9�8�$���/Q�3ey�5%�H�hiЅ���X�Dt'1R'�@�~yx��ã����U
}d���@������Jsc�2�6P�#�;D��Ȝ�e�H��������'����Ω��)�sփ<	o.���C�hsqƂ'F�Z��%C��-��M���ȭQ�F������0�v�3c�hn��8��Y%ƪ�p׵,�����~1E�p��d�8+�}|d���]�M3u��^���	)�J^P|#�Z��r��� 92��k+�<��zae�$5�0��&>dnXJHvi�>S�a[�}��*�^40U�/�����W:�g�Z�jL�,���_���(���>���1}Ԝ�S�b�ֆ�"E�r'�?��&�F�J%���2|DhK���j5E 6*��m�� �H�0:�r��c�u˗JĖ}���QN�uMao��Z��bHź(���U�$�ߌhiH)��8���!��-�|�?�	�V�!�O�W9�������g[8��h�.�kO~��Scd��c(,W��+ ��aD�hJ��$�u{_X�Vb�*�Ru�N�Nka�n6'G����I�>u�:�\�(cf����q϶�U���T3�Ԗd�b���h��V���L�fT�¸��&��w�L�jWJf�?I�tl9Ul�!ǡ�[ �<0VI�j�
a�n�BOu��z �`��L3�2p�9��#�.�FS6��_����;�Zu�����$��q�U�ƅΞ��~J�J�k��1FЯa��2��ŎA��@�
�Bc���U�QJ�G>	^g@�jR���]oп�2��[ݍ�e[�D��Uy�5J�	���B�
�2��0�q"h݃�r�l�!>_!����TW�2��]W���u}�$E)�19w8�L��+��4|�U-L�,��N�
����
�"+�-��)A�M ��dx�`zD�p'���͌5ς-��S�\V��o�u�q���L=��=��+�)Uà���yc����n�2j��02���?�j5���5�W�R��gI#��]��%��A{a:$$�Q;E�$I���A��Ȟ`���ȳ�;�E_n��M��8������"<��Q�S%n�s��C�c{��k�����Lل��͚7�N��C4�X
r���ҔS旺�/D��(g�F�VĄ��7�)]�h�9��	��	��_f�#�I�LRڢ:Ū̻�{��6Ȥ�� �F�	�jN57���u�񣀠&�.E�$QС0}��j�b18���/��p��'3����+h/Y'ǭ�)o���BL)(���P�$���LJ �@�2_�x�>1�^��|oO��~�167�@��X5W��x�ɸU���j#:D�װ��#���z���W����>�O%U2��Ck j�t�P�`-x���7����fѕ� %ܩх���'�T���L?kc�T��gX�F����a�G[�=}o\Ig�Rj/1}�������
Cׂ�zr9
����qIn�o�C�f/�\��e���"��#�T�|:F�:%x7O��
H���R}b�4���^�).ՃR-3���Z5|���)�ȕ��J��oi������!���i�Q���Q��V���Usm� ��j�g:"���h	�[Z��
��^��5������P}cZ[��5F�h�$���cVl�u�V���5�nZ��]1��-Jb����%��lk[��D��ө�D�7�@��|�p�9�4<*#���)|�����%F�����p0'�7�J�B��I�@�u�k���˫>M0.]en'G�ND�e;�E�����V*/U��P�C�6�^w�CYY����Z��<���o΅ ��=)k�`�&���(9
�(3�7�7�P�[�qO��NW���ׅ��8s:�x����c�\��*^O_N�����=�v]���y�2V�f�H	�R��P-ymL�Z���e~���+�3�{��h_�	��y;��ҥ֔���5q�2���V�_�����jw��q���z]��.���|��g�F��������)�L����+���}�X�������*-�K���q����^h���Y�8=bVBu4_�yŨ���&_�$r���Ϩ+y:�ˍʬ2S���?��P}�����#BQ��QHu�(C�����R������]�|5C��Vy�
Ơ���q���cl�o����.Ih$��3Uy!�5�0l�%��y�c���!�Q3�'=�P��~Wb��W�����Å�}��K_�!��>
�ƨ�O���#�J=��|`��]_�p"	!H�庱���e��}6�q�k߷:V97���`ԍC�JbV�	�#5��R���8�?3F}V`�Z|Ӊ
�gZ�4�gj�=��'x�RE��֫ڤ�R}G���'S��ʌ5��	#��cnZ�"�Yg
%���C���(������-�PhT�b�0�M!���:T�M��Q��<�ʑ�Ʉ9���[����|}N0���>��������֖�GU|���'��r�.�m�?ev�7<N�>�-��Aq�$ś���Q�K�/\��I	��ld+|��t��I��e���Û,�2����>�����%^���-v�r$A/|Zĭ��;뤍I�`�Jѵ*�7�,�*�Y�xf,?�S��0w���?��{�J�A�2M���L�l ��w"��L�x0���K�� V��V�U$l�x-�-����V�+��*�"ѭ���RԤzɘ��
�bd���uUg	�`�[��t �y��"�`�?�y_j�Ȼ�Fw`~����m��Ɯ3����R6X��c�7�sb�7d��>Z��U�F�3��),�_F���R����i| ��[�1~Q]y�m��+X��s���n�4���-;p�b� �  w3�WX��G��u���\�pE	6�6�����{KM̑����Lu�*���f�qWf)�Ԩ �� �¤�X7i�����zA�׀�����4�sB���3u��0�m���G=u����Qw�9Ϸs���t�.��R��_��W�f��V���5�r=��A%{w͆!v�J@Ƨ��sz�w��g����z����c������e�?��åT�hxN[�x�5�G%C_�����P
��M"����M�P�0�H����x����>
ĻG<����P鞓�:���i��S_��]��<��ɋ��S��Cx��=D~������b拣��� F4��N���0}��_1:W�b<_�����'�j�>"�B?O�|�zh�����yc͐wC�q�� ��I7���Ơ�^Z�E��P�W�acx�e����_��Pٍ�A���ǻ1
�iU"o(?���qD���\cOQ���š�� ��c��u�F1"g�1l7tO���Pݬȟ����99;�M=\���%U;�����7+h ��Jf��<c\������q��;���˲���	ɯ"�Ώf�~K�KX�8@���K
]b�� tC5&��;�v��.$z/����O�'��"U5��~
�_��M��(�cр��(M������E�+�7�q�L0
�2ci�7ӭc���3]i��g��DsO�h�{��tr��l�Ο`S�\��u�e��u��^���ͫH�p��ُ.�Y���]$���}h�d'ke�H/�b7���46~p_G�`~Jz��	~�-��oa�����ɡ4��g6Ä��ㅔ�jd�����V��P$�@��c=�V����$�~��e5���u��zn�P�E��;v����`�ts�0}uQ^7�:?����%f���{m��`-umW�L��Kڇ�9�+�g!r���Z`��}4K��R0�gb�"M�`s��s	L�,���:���^�ށ�^n�2���d��5��kuiS5~�T�&�ʔ�!��7~ќ�.0k<���#�����Ǔ,����O�۳��DQo�3x��+3/��G�t�A�j�&
��h23փA����oK����$��N��-й&҉R�NŽ��C� �?_M�v�y*��.��Ϟ)F���Wm!��O�sZ�>�	&����{�P�?<�����9{�7j��R���c`���Iq�Ȍ1s�
�$jK�}����</���_�?�L���c�����2������s�nB
�cE�7{0�㡜�����'q�y��UEt�����|R<��0l*���ػ�e���
�_r�����n��&&E�`al=�8~�ڝj���}�I����c�͏k��~��|�(��a����O"{���������Y�S73�y~S����P�����>�W����뎍�q�O�������%K�7�F�fbhoPn�ž���~�B�
�Zg���J�%�E���ܡ_�{�����q�U�P
O]��%4K�����8�`�楗��H�%�uJ��4�&jVk(d��%��b��1Uw�3��@L���80=�N�Q�`�}�|c��V�o䗽
0����>�n��@����ڤ��5����'�d�E�2|~w�֞z���p�:l������L��(DM��W�Lk�а�y��7���I�w�����X�
�K�QA5p�#���N
���.�e���y6X��\����PSͺ)�~$���������\ҟ��[4�7��'mL��13�ޕ���Z�w��T��}PqF64߹쉿���?�^��[�g��{�
~2F�ں�M) c����_�θJB�"�Gjb��D.�{8����}��`���z_5lk�7���E��Ǉ$�D[~�)=4V+��U�I�K����X鷺�2}"���J��~��}�g��Fў�(�N�\�.k�f��!,���?A01N�Ժ?�O�N։�qu��L镥=��Z���W�����싢��B���	�8��q�QEJ�U�ڿ>����zZ�#��|�¥7�}�b��P����o�n����℃M\�w�=CM�	�"�{q�>�����;�����+�B㡚Tc�S��t����-������KU��,s4;�u�*?Si&�@���?L��0��߹�=�nӔo���߿���Cg�      �   �  x�u�ɮ�6@��W��H�<,mG��)�{�(��/=D��[$� 9�(��ڿ���������ˣ�|~����}�q|�7��^ū�\@8���Ri߹;�������9�	'5�Z�!�l!�c7Wsc�e�%NN�x�*�8o�C��|�Mc���x�ͅ�M�c���gp���\��� ���	Ș�jjKz였��y%��
�������2ܗv)�N�)�#������� �E��d ��-͈h��>�xb=�1#�������E@��ąz� {�ti3�l_:��Y��K}r>=n�^�|]��U���m�,V`�r����c����8z�g=��G�9ƞٍ��rيj��ѡ!QLZ>�P�P�\$�yUY�j�v`�D5M�o
t�Gڮ�gp9�y�7r�͠Լ����eK��-(f�ll?�./��<5s�>����(��pҤ��G������
?���DE���*��x��j|�HҶ��Y�g��\t��$	5�i�t�=���U�չ+�PR�j�R�_�:�Ѷfs	����c����Vj�d`��<p.�M>�0��Go��d7�Е�F�A��8���T���<Os9�(�b�O��9�(���� ���\�k!�g��h�Z�� ���,QP�.�6��Ӊ$QP��Q��%�]���͠:a��=,����W?'���(�����t�n���2��n;My�����gY���AN�M^�E\A����%)QP3�]�IFI4���/�=)��P�=��1>$}��hhJ��Ф�;r/cnY[e�0=^:>��EC�0o1�sr�0�ˣ-.���:�]4���Cm��8N�uW^Ҝ���n�� *��Y@F��EAs9w���X��wTꛚNm��M8�z�:;<��n�ۼs���%��oO#��7sq�<�j���/�D=��/��՝K��kn����F�PO4��sɎV3���z�器mt�|x��u�B�-L�}������      �   ,   x�3�tM,.I-��2�O���9��J2@L���R3F��� _�!      �      x����n\ǒ&z]�)
苹��W�g�IY)J�HY?�ܔ��T��.��3/r0�3�@_488�U7�EΓ��\UkE�*�ZE�6��6+�?_|�*m�(�����W��ʎ��?�V���+U~�W��̌���8��<�e|�G���ȇ��˻���l|�޿��6]��_oF���HUƺ�������/
�H��F��uŠ_وQ����R�1B��htz7��]��.'�T)=z������7�y�\�����l�uz���෱#������rh��ȻI4�G������v��_�|{0����?.��S�,��U�����dz=�/���J%7:\N�_e��(Z8��B9z8VM�Wk��~ ����՗t7>Z|�:[~��N[\��H�;rz<=�$�!�U��1���<�����j�m��8~'p�]}SG��˫�r1_ɢ��pv�i~�5c𢌨��tG��ނ0q������w���{R.�Ӌ�#e�cR����AJ�I�L�w?�\<=���r�5Yi��g��5)�F���o�-����$n��(�����s\e�2qbLsY>��\�N���_g������\���o�Z�lG?��ޔ��;����(3I���j���破ӏpI���lty�:Bn'��#�۵' �nG�3�j�W�w�N������l9ū�O��&c��jq3�\ܽ�������.��������_�O�F�������i֩4z=���~7��f�#�/X<�����S��h���_�~�����|�����ͬ~xO��V�Gvp*7��Hp� ;Խ]��)��hǤ8}�����r>[.�7��@����ik���o������Z����?D�|5r�.)�.I�C'z<�M��(����g����c͖�Ձ4f����Vo�8�=�WA�]p>�k��Z+������9��r�]��$��Uz��hEend�3��=��M�����n��r2:�z�׻��7z��~���A_?�F�����Z0�Fqk�'�g�����g���;�
�{�K���� 9�M�E��g<;�<|1��������2[~����κ{�m�o������������uƍZ{����.KZ���+���	|7��j�a6~v���=�:����/�aO"�݃��D뎒&ѳ���nZg(ɫ�r�ez{7���]ݭ������E��hj���p�2�h�c�8�8_���=���z��_Mo�u��?|��}��O<�!��t�$�p�|���l�@/O^�|:r��_��jq
��|�N����M���qL?LoF�g�`�C�	��3���]��=>�	�����M����Z����r6�������{�7*���l��H"�_e���AJ�(��1�. ���~}p�1�O�&�������/e9z�.���E٬z��H��G)N*C�������!@�L�l� ��)���jYyB�����@����gu�ytw=�uz�q�D_x��ND�!��W��,j�<4RI���7�����'����H^ϧ�ӻ��o�̯���E�����X
DwǷӫ�H��V��B�&�����7�R��|�8��~��}���B���Y%�0�N���f�#b�|�-N��<�����Ng�_~��܌���H9rݨ?�I%�ْ�x��q��}�������z\��)$���_I��M�{Au���t3	e)��i~�&�Q?�~��+�G�[���_~�[ގ���{�Z�Cq�^�v;	yd* )c{&��3�^�<�H�$��K����4X��3I��z|9��Ư�[�y���O?.��	#h�/�y-�.D���rS����P�&C$2@��Q��IP�2F�v[Cf1�X%�����p�1�?�.� ��)8���t���N���o �]�+��ցG`���&�l)ץ�B7@����%����'1}e��B��îK��A��-Qa<
E5i�4�:nP�&�>�4|�F�~R�H��Ih��c��m2>Z���{ț�#�'g�I��0F�O��t��$^_�P�0�$[�`�1��lu	����|z�:��٧O �_�W����U����V)L�6�IN#�-�O4�~t�Ï/F��w׷'�6>�t��V�����E��я��R�����F�I�;G�&$SQ�����Y������d��qz�]-��1ǻ�E_)��}��.��B�� ��Edt���Dt�P��̜�����Q�HML�CQ�T���ʀ��^�b�y�d��!l�H���b)�ɪ��4�:�!W�,9�2$�O�ya݄ �������a���,!9̵|���$�X�w�̏j���ɣ[��Sɟ�J���ŨQ5���xգƫ���ϫ�+�%�I����Cvj,���E1w@g��GG&У+������q�����W�g#T�������������b�qt�X~���_� *=:^�֩wJ��l+Qy(���:Gz Wf��A�GT�|�(��И��0�q����	�G�/�wX7��	� � �)<����lVKqy{w{�i��]?9�n��섌%)-6~F%��ۄoh��Tfd�ƻ)M���U����{�ht����_g�u�r�m~u�
3����T�z!���}_�
q�$���rS��sDW:�
s�I!�
���E�����O��[��>�g�4<�U��?��c�EDx�RR��@���9����D�~;� �,� �@��Ǝ�>ϧ��͇;x�'�������"?]��d��b�5Gk����篏�Wʁ�r
L�������ut,��@Q��$t��O�+���* �z/`��@���,�@R@
��Z� g_~2��gȰ@�7��Ɨw�[�#��3Z�/R08j�0�KҌǢ-B�������UQ�vn ������:��u3z�X�=
4����"8->�悤�<��h�sg�p�Њ�Q,֢�6����j�<M�a�F��X��XP[Y�`'jx\l �5�x�NZ�B�T\�� ������>=�8��oqw��r��-RV��Y.~�9���x����������B��b�������8����a{ߺ�Q�.��g'M@)$3�YY�`��a�M��y�!EYL],V'�����N�	I��No'��;�4:����`��PLkC�6�7%���iI�"%94Ǧ��l��N��qFfb�E�>��r�E�Px�E��Eid{ы�<m%+s*
���a]�����{.?e��s��H��r_p��-�(��xZ���$����ç�!ں{?�"|�\_�~�d��bFY�QPk���(1��]+���1>$��?����2>��@1�������o�̵��P�Ӂ^����)E�ǁ9���4���]T��6���������w�+!(6.�A1�"\�ޒ(1{���������ٳ����K���k�CH���<��#e*���NX��_�<��۞�ތ�#�߯'��>�߼_��8p��#�>Ms֯ �H�T�Sg\%�|�� at[(�r<)܋�~�w���
E�*%��%��8�W� �h�9R�yp|���AP�����:OG� ��`���Bs.���q�\������n9��=_\ߢr���j��F�>���F��_jWʼg7T��UU��D��Q�<�W��SS�	6)Z�t�%��F��z,���Iކ^��,�u�ݔ@���汖�(�0Y&X/O��Pb�Ǳ����`�pS���y�/�����K�f�F��JVs%�t�a6����1�����$�e_�%�1W1�cI�P�K�D�� ��qo����W�J�A��.��{����te����{�H9U�o��=�2��~b�wY�]�] �ʪd��0̶h?	��i2B}���ng���<[��]�~[?o�p������_�����D�Z�E9[°C��h}Z���H�@�Onɴ^| }� )�ȥ�@�W�+v�P�tLk`b;��	,�#H��h!�,�/�����-`A#��+i$�]<#�������t���[�rF�3ۉ���g?���
�ړ�T�����Z�T��o��S*b    �B�ҳ9 �/�"E��/,N��B�o:��k!��|ٚ��7'�g��A{pu3�0��t�\B^4�`
n��f���Y�@Migg�x� ��klz�'�q����tKL���0�*���W�o.�T�&^�T)��řD���t-��ˢs�WTW\����7Whb��\N�~'5z,��
!�5�˙Id̑�l��a7J�����ot-�=gn�L$��v�\,��O�_�Xܿ�y���C�~�����
�q�D�t�o�+�
��<�Kx���opa����PD�@���_�&�T$�=l�\�17$͍<�%��Ļj$��SƇTi���ҪU���Q� |w�J#��0#����� N>�7ӏ����g��ٰ^X�RN�Zw���xD��Q�fۓ�b��f�6�,�l���]�uc���ubEu�z"v���h9�dN�ʒ�0;�]�&x*얄 ��i�)��B�����ۃћ���l٘�)	�!�GbA��q9��r��PǠ�[�%��������0�|2CS����W������,���B'w��_>>��k��B@��o����!'�x>��ߜ�`y�g�n^��x�dt1���jZ�o�W���˚1����jqݸuB�@2�!>��$iQ��w=q�؇Y���駛�ŧuB����细��J����l��i�
h�]�A���p��t!R@��(	l�pl�j	-������Q�#���o�#��!{��uw~�&�:�N�V����t\h�����j�u����)R����|q��P�o؉��o� �i�/s�P����ɨ,�<��d������g����lG�8��֛�4껫��1$��ů+J��A�O��]��4���n[�褎��6���Uy,OϞ]��淿��f׷5:��4[_����[�����zU��Z\�c'��#W0M��IV'��
�z?�r��[{tp�ڒWU�&7�h���M,wG�����i��NY#e/���X'�Sd�&gP����ΟS�\Y���!��m� ��3a�M��8���x��HIp}ZRb�`�d�n�~v��{L��e�����5���y�`�������Lo�8���|�b�d5�a���"�E�^������Ě�'?9�4�,r[�H'����9���}8x����%�e3T��e+���.W�(a$|�団d�+�X��4��2��:�����v���Ő��b��u���Ih��J�FFe��s�NG�������0�ܛ��^^���W7I�ۀ,����ytx��ӊẍ́_Ad-)�׼Σ=N��#O�@+����|։���շO^=}K��,ϳ��4"�Z>���+-�P=��"�-"��㈬ega���g�!y�b& kj�2�H�j�&X��[ �^��2o�O�!gV[9���	�62	JÛ?U����	3`�5�Z�R��5v؏� �����J$i>���W����Ip�F�
!)�Ʒ���!	�3��(���,��+�@x�s@Rm�(h���(�X<��'�����1)m<|~�f�lF�V]���5ǽ�%��2{z�m��ܸ)͆�v�}G>��~q��LnKyv�L���!w�w���M#e?18��9:��"&.vR��%��M'���TA:��ou<FC��ᐹ�`s�ϧ�AD�X^M�iԵ��I��T���t��n�m:�����6�JF1�k��n�8&�޵
I�(wU�u�=A.&�yz��P�1�&�̕��]1��񡈔�f�����9	��4f�J���ۗ9�n������)�c�F��[^O���b���h!Hv��� ��2�D��8V����d�����T������r>�Y�5��û�5���|�nù�`'��C� pW��봵p���ު'�z���bo�j|c/q4�U5$V<�x{r|��Nh�G'*�F�nR��t�pdՃ�kq����yF2
V���\Ǉa�Xe1��Eb�|�_;�~�|��'������ߪG�r�Z!�/+�z���*_h��I$/����I�Tevm��pY�������/T�W0�c���u�,�S��VT�F)��8Т�Pj���G"L��񬢮j�3hH��0���޲�k�|��ܤrHu`�!�d���y�O�"��6$��fp���o@���P`Y1/ݔ\��1�J1���W92���l|8{�����b]��mP�=s+��T\�ݺh�׹��/���$�{�`{V��9���+7+CV����T�*��$-x�dk���w��nv>�+��7�����Ig���}�v�[D@�l�s����&�D](/�m{��v��2�(j��C5��*H������#؂h��Y��1�\��6���o#��"���!t�=O���Xw}�[7��nfM���.^#9N]�q�E$���_���8+M��)�4��|��-�CCr���cDK�ُw�AB'M�'�7x�Ǯ�)c�3�a��D�[��C�@���s��
T�Tn�ݻU�B0�|�¥4��Dy7	��A���<����j�۸n��ǅ��g�~�-�H�5+�͠�!��1)F���F
�5A=�1@-��=�]��s�[�#77����
F�������Be�.�4���|�k1�����-ݽo�`+�ƭ�U��
v�h@�g��,�����%�\D.9���hmF����_w_j�E�d��a-� o��re7\`f�v%�؆��K :�dЌjk�C���E�DP����Q��r*�o֕mp�F�`ؘye״��2kC3����e!�b<�b�<6�y��Y*�`�$ȁ�L�������gW��9x�[�^k�^ S�?e`*v�Q��x^��$���l���_��oș��sā��a����o��b@��W�k#TL,�؃aq��"g�M���>"���qxJ�Y��&�O,׎Vd�N�S�jtL����c6g1����*j ���,��A[�[9�)�v��ǲT#�� ��be��QP�={����.������Erm�Tƈ��c��Tdq�U"H|#~Ƴ1�2M���
v�փ��9���y��6G�������X<'b[��1���jji�Ȋ?+�(Ͼe�G�ϟa=��=	�jz(�I�����������F��|�:pW��|
�������n���I�]D���j.��
S��,�1p���Mrm�bwa�,2�-j�{�-��3��I.�
�SnB&>Y7�3F�(�ǒ[d-1��+G��c{��M��������G���l	7�b����B���k��dZK�D8�%���k)ͷ2f��/�i?�>�]r��t�nٵc�*�1!����#O�:H/��o���k�l����d	����ea�ZxE�W+^�tpy*�!��V��d���(*@#�=)���$sѫ��(�q���y*�n��H�����	<��U�4	�E8+#H�EG3��~��4	��X|Ô�ro++L���F�����J�G�$�Q���Ji��|���˷��<f>����5�Op>��{��6���eo�g8��`�vD��ݼ�
Ē�9�*2X�H�f�4V����O���p�G��'�Gg�B���n�D�w�����|�:!R��X7M��
ql?P�E�Mn�=[f� ��+\����t��^;V݌ŷH6OMr(��V�3=Q3��k�����Q�]��.��X�_�ecf[Y�8w�頦����g�l��hG������@x��ُo�5�;��}Mw�6�;M,�n��/��+i5�&*t='��BS����~��X�b�i�|dhS���͉ZP�������>ēT��Y��"HN���׳���'�VGr�;K^L��~�J���lm)�������$��G'C�c)��t?p��\�����}�1��f�����"��\�'����dL@�)[�!
���[�.9�.������Ueh����\k~��ƻo�e}SZS�`l	�R��ģ*X<�1�ժ|'�O\��+�'Ҷ��s�'�¹s    d���a��޵v[B!�rsPX�s�R멺w�(�! B3�?tރ�*J�p'U��5V��h8�lr���I$�����+n �תL����i�~PtU��E�!�o��41���2ʰq͋���A\e���'�VG�<�bF��ڱ��bN٥�24�X�p�g����.=E�y!p"�V��T�='�*W-[�v�8�*,l�F��/[�
i��0�覴��|0p���\[��'�!߿EG�8|�E�b��}Ŏcq+��+/�_8߳����z�_af�*S��0!�T�Ϲ��.Q�<}#	b������s����@���0�B�'�څ��}$�2�2SƁ1����1 ^�m��r4J4��a�M3��8�*����؏
�T;�~C:/�eW�ԕ�X6�uP����*�`1��*�%]��Xp*���״�@�X�a4c��*���`].���˻�����r����݊D�T��t����
�c.�jx��m������	K�\7Ow`T�U�l\|q�꧟Ȑ�u����b����!��>k��0�$l�Ή�����!$��Y>A5��_�z
9��l��߮��tIex�Ӻ�Ǳ!-w���n-�(�>0tp���� e�N<-� �W�1D��1������\[K�Eb;�F�J"�4�8OQ��P��s3�����'
���{.�r:�
���c8��������4)���2G�LY;=���O��N�̖+��;ЖY�ޮ�=��7H�][0�ܯ���y���Uy�������"O��\/��6�X��&Ugg*D�M�[�+R��1	��@|��>B!XPi7�C&���	���������ul��3����oC��;c(ERʍ��|P�<�f�9���"� �@� �;���nV�E �X��J }h�l<���<�T�\��9��hr�"�aGpf��"��8,��X;�!�ԝ���ᐚ�pEJҽ�D���$�=����*����a�ZX�rS� Ql��ш�ވr�xX����6w8���gvǕ�i,']�|{���q�T����2�B%2��aч�R]��E��yTU���P9����^�cxdg#]����q�Dbw�ذ.<m'�Ԉ�y�����¯���f�Ѓ��o�qyƤ�2�f��-U)�cHQ �/�p\6�ӛ"�lMoz��;���eCβ�j)���T�����W;��:񠷹p��*(��=�Bpn*�u�����U]0�__�F���z�����u���y5��9E�$1½�(f��ΝpC��E�/>X!xW��-��?���\��E�i$��0���D	�=Z�����6w�7�NRTAq�V/��ۋ��4Ȓ�Q�h�tp���%D>��!��],8d��s�=���!Ee��<�� 	���u�.%��V)��=���IX�����PzQ��Sc7)g�=����ݥ�"�[[z��p��x��.El:t���5*�j� �m���AM��#"D5�c��4�A-ZC(�!�x�!���)�r>]�� ��}Ec_�w9�;�W2͛�v� ���&�#O<U�I����z��������jq�}:�Xh}g�92.�4K�>4�XJ�X��]�=p����;���l��f8�:�����X�½W�Tx����ύ%NT�F(�p����+r�(}G�|8;�#Sz0Uy�t�*T7ded��2|��d��v�G#�Y��Cyj��q��$2R~� �/>�v����x�"���p�2�a�Moyx�Є�omM�ɬ3����A�j/p[_2Q�LC<��4y>�[��E��K�6(L�����������kɲ�!x,��*�M�egm8�;��Xe&1��o�4ݴ��V�a��g@XEo��V�s+�������aH�B(�$T���x]H#���A�0�2�)�7}{��i���#� '���o>,FG5T��YP�6J�uϊ�0��n���ƨ��e�·;L��=u��r��KD�̼pi��ٶޟ� ��A�l�ɽ�U�GY=�Q z1��U��ڽS��pwuo��-6�f@p.x9�����4nC��c�D�[&TU�CI'�^)�שƒ��k�_��tp#%J�{ڴB�o���3B�Ak��k��q��M%y�(�˶\{w��受uk�FBFZ�p)���cP$�Y,��ƞ}��I��0�LA(�b�'��!%���a\Ҵ�-e�QD��FOTE1�A�l씳��tlJP�ؙ�Fl쒥�Ow����-��M�m�i$�a�C�f�Q�>
��}fm;�K�w��(jM1!��p��D��x��S�Pn�u�B����Ŵj��,&�"�iRE��E�m��y.1r���G9t�����<�$O�j7�"��y9�a��-(��O��Z�I'�����E����t��pC�E�G���܁��l#�*�����챐�Wy������`����wt|��L,�f���D=-����M���H$X��!=`'��r����`-��� u��T�p��8��D�U��S6ɽ��d�9��BAE�FR��?�W`�i��͙��[�������o�Ԏ����⪞�[ nF/��NKH�^�~�({#�pe��@{:�q��Z�DA��v���hW�'uw5?G�\�Z/���.o~��:]3�<�U��n�-oȧ�(ÁG�"��]�����cv�y�&���l�s�P�KlH}������Wn�ht�ͳ%O�5ڌ*Z�Kȱ6��rw�4OgW7��/�n��4��4Ѡn^E��:���;�WÁ�����bpD3�R�ʲ=<q�)��>	?; O���߳d�U�u,)�O��<��Mn�{0�+�کLR~�()pDŨ�X%��i҉JT��$m	���8S�篟\n%YO��0Jү�
��)�N��A0����絡�)�N"��[hR���1��C����*I�e+d��
�����߯~�Ϧ_2��������4�K#OЈ���A�����8]��˃U���j
7����������.I��מ�
J�yQ��0Y֐^A�ͩdQ�h���Z�f ��8��k���n�*���J����l�joY�+���w�Q�m��˹���Xx�4H8E�6���.}�F��\��x)�<Ue���a?1{?D">�XM�~aY��Y�֮3g��ژ&���9�(P�JK����g�(���0h$���C5wG9�+�1��<ШU��C��$Xa!�B1�bS��
��k�"��j�7�YJ������1l����ɳ.��_�+�B�#�c��Z}�a���e�&�D��TN6pqbI���#N=�@_�nrƢc�%AoN`�B�cEmm��|7K$ :u{y�V�]%��g�lj
	7���)���{�Bw�<�`��~+�}�ܾ�.�"?����T:�ӳ��Aā8�z�F���۲��t�xAX�SQ>���3�����t���@�.��?:?z}�������=��
���$�Y��T%G��O�j3�3���
�Y"1@+ü��4��<CA�Vl<&�1E�L�hp�c����hG3ӡ���e�&$�'��jA_&��s&<ȡE8I�
���K ���o�W	�I���Q1"� �u��.IU6��O���/}3�ZoI�~����ՙ�@�$�J4(�Ϻ j*B�dPy���c�\�1=��4wGb5����l�"AO$A�0����>k))�z�>�2�<b#`9(������.��p�˰��/ö��A�Sq�.��$@�,4޲a���=Έo�_�.���уd�Ȟ�����([��P�Յ�8p�T�y����	rR�yC�$w�;a��Kxd$4�_��V���@�]N�9I�K�V\�\���<pf���f!�!�+�{�u��;�=��1�J{�!�bI)��bqXc��]�i.��<�Vw;�>��8�hF��<������@[���\Y�3ڧJ{��<G�α'���+�:?ln��������vbXJۻ�܇
#��1uP%DL9>Q$�?H(��    �]���I��f�����oO^�]��� ��<���aɭqi�b�;�����@S=@���D�|���q��p~ d��κ��Tu�d�_���Rf�t�MeV�*��kw� �M���a�S��O��J\�9J%��Q7�i٦��pIδ�؁�oϜڪ��b��<>��E���>�������Z�����ױ��jl�a�a��r�
�&A=6��4V��$O�L6���1�Glx �dbAGď#����/?�(BO!J��2
!.^=9fS����ъ�(6�D�z�(Ʒ���TV�{}�d=l`7ޣ��昧�~RW��f2��ar_�W�a�t�E��d@P����N�oL�>g 񜣩He�C�2I�$?q7��L�c����2M�)7ѳq��ߝ�9m�g��f�1"�n�S���A���|�G��oĐt���͖��e�p�[�,�Dp�ҵUl8�rH3b����w�JE�R�J�#o�I$�E�n�]��QT%�7�q�U��v���;y�{���|}qN�[��;)ny&G�+j�b>�x��q�MڧI˃w�M�(���U�k!E�4�y�S&��j����H��_	�I����� � X������+`\O�=F��=W�z�#�~RH�f��s�Q�`!$<'��:�d8���A�.��^|J8B�������#<fDz�"���D(�3Ty�j#���(�;ږۣ�&T��4��HEb��j]!��9T��vRr*��Km0������O'���Ѕ�Z�n&�i��i��y���pМ�PY�z�Y�<v���=9O�i@ 1hR�Yc\��T�L�<f�Q|K���d��Dy��4�nK-�w�:�E9��˵�U��ȃ{�D�+�D�+
�\�́�K��z�S�9�0�����I'����������]@�F��&Rj�,�+�b\�\ĥOޜ?~�2��`�L��:XW�,�K�(_�e�f�ǏO_��Ll(�����Q�y�Xh���H�i1���Ӵ��#

�\���~�of�q��$tA��'�BB/]���7��D�-ndW�R�b��7�V؈J�-�)��JXpʏ<5l]W�DS���`��cW�B?ήƧsp�H�!^a�d�t�KP�b���Lz(BLP�4%�ֆ�WeC��E�^�T��{�S}�u٭���6'��e�A��0R%�9L���5i)hE�ڋ��GS�ЙC�ݠ5�2��r��]�4i�cltAt�%k ��ʅ�D�q��B���V�C�,�ݻ=m�k�Q�f.]@���)�7��_|���)'F欻C��Te=����H�Y�t1���9���ѓ��޼�j5�1��8�`x�Z�=K!0R �|�Xtw�҉��؆N:be�7�9t*N�chu�9�Z�L+�(Oo*!d��$f(8�lǠ��`e�&����l*�5��Sc%IߋѢǣ����G�dd`Z���-c)Kꌐ����#�д��#MS��	F��kwAxR��t0>C�	h��;S%2�G�z�>� �f}������)̮�+���qM:���E�Ts¯c��F6��^�Q��B;Q<�:=�4ё{�U�r�=�ݚ.Y+���?�?�m�y�u]���m�`�Jѱ�r<S���V��PZ����ñ\���֭�P�
��(L!�")E�8l��^��B�a�8�8Ӛ�=�j�Y�4�b��rև�kڈ;Bj�Vh���	Д]��I��$?yڈIvw�������zu3���+FF��z�����{�A�\)��Q��q��~�s�X����b�ѧ�ڧ�l^W�d��%���561w �?�S쪤�IJYX�fTIA� =�<������N�@#О��`#�9)���u�N�-+U��Sl"lɝ��P��1FA�����$�WI����e�����ś�v;�u�`g*�1��W0�5�&
W����\܁�/(�ݗw�������c�K���䀂z,B�!�ܞ@�RO�GO�w��)�o gq��K�M���oX�P��0OdA�׊���>���d G� ��al\�H&�E��xT|e0�G�1+D�O�p����k9E4s9z�.Gq�Q���|�o�-R���>6��س�t9|e�!"e=v��6�	�g�;�6��zHR�_
�������ٶG X��PM�9:�b`?s��,a�-���oWŉ'T��K����q͕�������{��H�3T!颛�L��)�&��}yq�Z���C�v�U��*|-�_�T��l���;8Q�4Y��jZ�\�[k��tQ�Z)VH�%��*���!���G�/����\;AD7~5_.�֘�������x*�'����_�Z�{o���������YF3D0���zc����,_T��Y:�%�L���24bH��E/�܊��7���H2��L��B�����.��M!1I��xؒ��<4�~�d�'�6�.o��8��؜%[	Ű�)��H.؟�eh�v��O}(B�P����Y�F��|�D�u�p���։ b������c��]S�0�4Dx���l�@��;q��x�@]@N4aVy�ϻ� �gl>��l�?��Bo-'��90!Bd��<%�K�xy�"�E���I���F�����<��� �Lq|
i�b|:]~Z��ѿ��o���. o�tH�:$�����.��= ��L۔��Ǯ��Bí�����uQ.*�"G'�NGG��r~�i��
)H�W43w����� Jw�~���
1���G*ڱ4t�c�B���oWax�;q��<~y��d������?ժ}
Wu>E��L`Z�s���=z��I����{Y'a$��I��4�%�LE_�q	��Z�C�|�����&��2������qJT�栤�c��yL�?@�@�������ʭ��d���Hƹ�PŭA��/����#�_�i���qR�`���6^]�U�����0�1a�K/�~�:fr�5H	izl�G�����]�p�q�Z���=a3vﻇ��=�)ήb��%�ҁ��0�K�bo��v������+j!x_���k�_���*�p{W�9�И;8y��-����l�	b�'S��x�	���ěh!ȕ�#g�u'x�}��і�Y�l(����'d6�-��[�ȖG��d���~X��J8)��e6��mIo�?߁�˩"�Z�je
b�$�6n�1)A`v;�i���ߏ�S��y��z�q9��6���W��c����@ V�t��aJ�28�����JKO�U��Q��A�d0o=S��%�t�,j��/oQ`%�~J��J��%\ڰ��!����f�/q�u�Fr�!�رAx��,uԕK�w��ׯpA���óX2�>�	с�ǎb<���[/Nv�YGx}�4N+�V�8	ϯe�bx��;ڄ�o�LeY���'B��I���!y,u�	�jW�C,�V��0��Vk~��(u�@
��w����9b5���'u�5��1\6*�3���^׮�������a�m�L/y
��a�"���غM���uQ�f��>r؉o��G�L�W�Yѿ5��	J�B#�
�\��k�T�Ur�^�I���U~R#�lƉ*"�D�!���|�������G1���0��7ĝ��WO���!�z�� IZIF,{;zS�J�o*0*eO�B�
�=J���R�%�ӕA��ۓ�������(�B�~��.�hB�ӫ���k4�����'մh�N���R�bi�7�� ���Ik^����3֨s�.����
 ��ѳggE鮞�Q��\[��؂��Ѯ�W�*�.�Ó��$}Β���������J�
�T�E�22t����w�)�4�L�I�Ԭ8$l�&�/�mGl��u޾�H�MIt�T�*�m;���&�\�/�|g�a��4�h�f3�F����r�Ig����\?�:�.���נr�j��!��v�(/
;�C�7��G/�|���G��!�!#o}�;
�k��e	Q�V�
Z�c����ϠW�/o��׸�ڦh2�� ��{-[%>VT�r&B?
P4a=غ���r�q    "�(��'��$8�"Ҽ��ۂ#vΩ!b���8�)=����"��Bʑ���?���:Nvs-�	�����}&C)��jɭ�����a���������7�L���	ђ얥d�A1\����$��%<�B;�;9�\4�Z+��;�,5Fu�v�ԏ�Zi:|(�8B�<���b����"y���M��	g��&�����nFJ	u��kZɤ�>8n1��auIZP�6q�9e�峗/��/���o�:L���x|���:[���m�ռ�h��[/��-�!�o�Gg�I�cvH>-�C�����.P;+8t霊5����}pP�Ή[�(�ER,l�֊��i��a�0�!��f/09r�f/�{/�H��ZR[���5��A1�=����_Uhc����f�" *
���J�|���)�Q.uI��"F�j��~���M��胵"=Z�ᛉ���؄�����GqpE��`�o�� N�|�����ni��zF�w��/3֖7�9iS�Z�Ԍ��'ou�%iu(!+�
���F�X�����d�����Z8�-�ܭyi�}��^�"�q�x��sG�"�~=`�����!}9z��8Xb��b�9���!ab��f�p�S̃�Η��IEG��=�"�xz�XR�Y6����1q��:��4g$�<����4�NB��k����M�8
�`?yw���E���#|V�``����Tq������PE�$���z�W���Q~Vs�c��/�_>h�8�&+�/�#В/k[�lK��R~$%pe��@M�+94j�Hv�ر:��O��<�@���R��}I�K)!3i(r�9b�:�CJTJ��&����@.�9v;
�'��v�<>~��=���a�a�5�{��=1aO�3`z�[_�5r>@E����"NDo+�=d��������*��23�������ݗ�}�kK/x�%��}�C7�Dp����	cF���J�ד�(_����	Z�-�R�g�A�R�BjR�X���~:��>+�ѓȁ��'�gmC[]p�#�WQ��8���S�M�`d׹(Wm�&��IF����(���N�x2�k�J���*A����A�G�G���am+l��`�?�f�W�ޘ)��?/6�}��G/�t�7���DK�؍����$S���J����/��.�_�_M����
�9��tDN�fW��fuulc�蠕�e�P�a�8$=��4�2ޑn��cE�b�F��Ç��x�*R�����]2�N^\�;���]�@Z2�*B�m���;r �Y����a�$��NZ��5u��+�ɢpV���5�S�rtٙr��3O�V�>+��J��0�g����`���M�}j7u3��/ �y].��	<'�:�_�!!y�]�K���*��.�da`��2�!��G�P�ҕ?+@h�~��v|�i2~�0�����ȯ������b�� ~�+�i��!tW�t�;Z�iw蠇�^L�?O�ϓL:����NOI���R�fg��J�A�t�w�i�`���h��6�Sr��<���ϨMU�UѾ�n�#e=���M���P�*<�zU�44�i���>F��v>n:�p�a������ܘ~q�1��Y��!��ݔ��k��T�!�����Z|�7���ΛTEl���{n��pBoG&���"��~��*PQt5lon���5
���e�&ȯ�a��i%�7���?642�Y
���Al=ӜT/�������t��$� �H�~:=D{I�0e�swLR�R��smd>�L� �z�a7	\[����)o%��U��&a��Ih[C��ѩ���A���6�#��aC;����+�0�m�\*��^��C�X�!I��#N�� ���qA�>�a"�}fŦ����˓���M
U��T^��{�S�	}�q-�)��&'zݮ�R�t����lM�?D�(�$��/LY���N������p��?6m��r��^�(v��&���px��ǒ}qvz��Q���ҌB��$�]G_�ۭ�eoˁ�8=r���M v�*4�4���42�m������Pup��x���l��儜�pHEE�D�V�_�G���<@z����,�%;��,U�����)�)�����7g�O�nB�k��D̉�ѩZ�O(N�1�л��>'xzu�h��(-!���l��^�ne�%�-���c�02S��'ޑu�d]@F:�\�. �vq�H��؞l,�G$�$�ՙ���X��3�`Pf.;h�����!��.a&�iJ�d���>�0y�ŀCa�^��c�E�\Qi��w# �n�t���ؐLlvl��
S��JAc�l�A�M$��Y�������c�����"_V��`���D��j��42�Y�ت�D5��l��zP��@�R����	�'�^n}!6eg�x��l�������������o������j�md2�F�fVU�H	��f��ߞ��gOݗ�j2�*��9�v�"+���*��8K3W����ⴝ*Yϳ��E��p?I�i������:�/A��5mR>%�-ܴ������!I1Eob�>���UUԾ�*�փ��� ��]�5���)!o� �T�K[e��o�?��:Vd�*��4s�� e�k3�t�1�!qsہ�H/��KC�Y���v�M���f
FX���H�2Z?bJh���3hKV�E�^G��9{��}[(�XK''��F+��0e��re����]�w��D�� ��r��tJ�w��v~G�Cf����Q�n�]iH;� ��WI��
vi8�`N�S3���w/�n�>6��#�b���v
��g1n��h�33@��A����'�ec.rWi�˽�G�/�F'���������x����_O�:�߼_4�����O��|,r�l���d,�E68�?Y��l�[
�x�
�+������h�S�λe1������h�%YQ:^T��& ���;HM��Y1j5G	��������v�����{:��&$����t]h������z���ӻ�\M���]����@٘�����6�,��Q=ۢ�g�{©��� Aw�L�#J+�dۧ<�=Z#�M�"��멸�_�z�v5�c�	�'8�B
;����]�n�U�;�c�R�$ąC�-�0�ڸf�j�G�T����1�.��鰏�����5�� ��q��M�O�sp�?�K�ؔmF����?1��U��(�p�bIK�@ZyB�U�>��) za�9�=]F�"h�w�V.)a��ä�81�RM��1l0��`�ʃ��qE�v��������FC'�������Ɩ"���.���T$df|�ɻ���%��,��zꔵ^]��v��K�Ԕ=�챷@|�VaY�~ '�Y��I��I{�,��B��Eel1�Y�<H�R�8zr����3�����vkl��Q����X�Q�s�W�NA�|v>�bP
��5d�����-'��F(���D��Q�@��t�ݹ)�f��9$p��UL�4աCdR�ֺ!�0;ci�S�	u�w\��Z�m��]�D,���$�E/-��fp��x<[��czJn�"�A�V����p��9�B܄�0Xr�y3M{JD�M�@�.T1�e�����>)*f���V>�#W#$����*���\�)L�-z�I)�����I/�_b�Sp��䪪�-�n#�k�8�1u��@\r�����o���=�᱄U�ٝ!�voz����,=�PA��Ø���m#��d�!%Nr��ZgB�ɣN2Y�(�I�&� ��)�[�d��k{h��o=��5\W�§�?���N�62� �[_K���N$'�%��Bx�����nj��u������zR�%Z7�A��H��ᰳD�C�s�~x^ߚ����S	��1\��飧�R��4�F_��������/ό";�}�:t�\�^ 67�5�������s�U	��$<`JO'�Jrl��X��m�f�Ó7�%<��<TL"�W1স�`*��:�X9��X�h��OAh�ze4c? �  ���Kl��&����*oX,�f�qb�4�Gl��+T.�zI��u�+�P|���%�����H��]���<�(���OD����,Fv�*�6
+���v�Ӊ�I~�н�Bj�(|wA�F0Ŗ7�`��s�)M_�|Y��c���H)��2�g�E�����i"phEK���an�%�����ūj݌�n}=�
��0��{����v�������:MC[��!��* 6��Y=y��Մoavm ����8Ycxd��Or�r>(�����Û����^�	�M�!M(���2��Ǔ�G��R��nJ��tӴ�B�Md��W֣aiYP�t���9&wr��03����	�q��/ o2�<�u��u��3oZ)�Oy�=0)����}���"w+�/���˸2�͊-Q�C��s���$�L�d:QQC:p�&���t�ql���*�����������i�է����F3�.�ŉ�C~/[H�wL��F����jC�g.�1Ϟ�]�XS�P���ɉW9�O�4O�lE��K4��(��*�������guhs�Z��`%	X��R1Dñ �6��.�"ӊ�^)0���"t.���A������H�8ցiڗBX:OL�N����d"��=N�p�?�~)�	U9������q�����İ�D�M�Bi܃��;' ��͖X�[�l��w���loוA���L7�7�%���O��d�y�O_!lA��k7(��8a���:j�1{{v��5N��h���ɺ���$j��Y��w�x�ԓ���h�&u]
<y�t�K��`�Ç��cB�Kj���I�Ҭ�!|��l��=���.��d��$��w;d����[�Q�]4;��{t�|]Aϯx_�k�A
8Lµ�%!%^���� ��X����O��n��0[���d�'7�t�����$]���,�˻�����r���E��D�U�~Qj𓳼@qi`]�(: ����RB�K=˳/���!>�6��e$9 ���Ш�ѯ�RN���춪l�y���0��>w	���f��X��O _ Ʀ���N1��7tpw�`�wT���ٳ���V1Ƚ$QӒDA F��,N|Ť�
Q�!p����t��gk�M� n�#^�:��:L���BD%���7��ڄ����= �D~��p�|���18VT�/E���BA�D���/�|�M<Aݫ\�"#K7���kZ��B�C�t�%���3�_���q�����ƭP� v��m���X�sy7������Xڝ�C�A�<o0W�� ��ו��x:�gO�'� 6�P�щ=#fTġ"�	5yh��{����]�{y�x?��<��.�+2���!��}/ñ�A�y������K�������	��}u��~�G]?#�M.�ޫ�B��6C�?ѿ�o����5D���]�'v����K��Җ晽��m�a���?�;9�mmvUsxW����4VLOU���tv���P�O�p��ݠ���&��_��bJg      �   K   x�3���,(H-Rpu��050�T055�5046�2�K��D�qj��¥͸���Q��~@iC��W� �
      �   f  x�uW�n*�����r,�y3l0ۼ�3)�6ԥ]������+]�'2�%� �(��G�%YUM㶏��v�U{����xl�v�$ç���3�t����F���ƱYnD(՚�k2�T�TyW�d"|���Z��b߆�+Ke6�a_��w�+�Z��h�[߆g�7�y�vq�zB-)ǯ�3�^�W�R�02"҆��o��Z�7ؐ^��$T����� 5��U,��j��/z�w�*g*���6F����!���I�!SP�'�3��D$��<T�Gߟ�Y�ɪ�|��oq���+��`��r�Yl�;z%�_yÿ�//XK?~��_^�����"6fKQ�^K��V>�q(T:���No��3*�;(��h�6�Oʯ��wn��6���9�bR�:�w⽧�-����>ѡ�zu6�KZi�Ql�M6�		�f����ȵL����%��V�E�_s��?0��=���V��&��m�F�؊����k��C��7����=g0��G��_�@��T۾�Œmc>�ZI�cts�<��(bs�;R8�̏-_Ύx� �r�Lß5�nԺ�>t���9ޏ�R�|`��op�?��^pc��P�G
��\5��y�ّ�f��ۇ����g	����+��P��]�������	f}�)V,{��S�7��dYC�&��߀gC��0h�"+8j��u_�+��<��K�r)���ci��+�eīP0�M�+$���O����|��
-o)��M!��0)+ޏ���o�ϫ��@����X�̳P��d1�_��Ճ�&��}��`�eW
:)�̓){m
�����q+2�4Bm�b�tW2е�c��)/�fw��bh?���F[#���&�ڐ\�#~h�6φV6]]������jnf�+���Z�r:8e�2�vәt��d��7�V���~�K��6 3�D���V���*��D`����ki|�xH	8�2a6\��.��O����"�O_��"�wH)>i����C+��6j��o�ReCm^���y*�f����Yo1��r�~���T�	���R�*�$�4��F��>J�1������8c����j2N�ŷq�H�3�v���.�M@R9�rHH��'k���i]������e�4��-���Z�|ry#o'_��`M�3	֟_�|LE(�R<¸��cV���v���6�2̷��k�2��?���3 �-�,�R�\)�;���J�B�Z8ʟI������st��=��6Z*@�r�F16zI��_.h��w���ۓ!�
�+k�0�3p�E���R�ꧩ^|,��&�}������ _���g�i'���1��p(|�I��Z�rǮ�C��p�%�2�,�3/A����q�ʤ���ׅϦ��sN�����j�x1����(�[t���ԓ%vA�&rvms�]qș�ξ�tKA�������},M�Y��lQ0��_����\'��1C�6Hda'�������m���D��ۓ!�!eZ�Z���e�.��D'����Qed�TkM�����l-e��z8�LY; A6����tj��D����E`��Ċx/��#�'mpV�l8�w�(�[0J.��jw���Rvɛ�X���M�$����֦v���X�����IE�n�d9]:Q�����Q^��>������ �Em��u��S��M����1!y��P�7r���J�� �J�C������E&)���듶��!LM��`��9n�B���Z�}p�$�QKC��,������Ƒ?��cw���_����� �-7O`��~���~Ǡ���6���pV�d�۟ܰ{t8|������g��`�aH��,�|� �R�s�E�7�w���x�y��ȷ�����wUD�      �   C  x�U�ˎ�0E��W�
�l��&�Z4m0`P��Vad1���ӯ/e��.���%o�w7�=&^1�%����Y)��a:���B�-�p�);X�q��pt1
V����[H�$l^��b?#�T/��@�4��S�F��SA��4��p�����S�T�6#c����Osg�w���Ꟙ> ��k�a�B��P��J5��Og*]@�����;�p>yK��NsY����L#���2�Z�|�4l��>
�pN���":��1\�=eT�dR��5�b-����hO�t�#Q��E˖ix�㹄+&��ox�ӿ��V����@]���b�|��,�0����{�.�M�%\�i%�
���^�P겛F*zx����HL���[j����������tHe���hc�8e���8����{{D�Z�rM.Җ�|�ҍ�
lv*�h���e�>�4������%J`XǺ�-&;`�;'���iW�Jt����h8�z�y,U�#K��F�@r��#�뭥�)�/q�S���S_Z��L���.j���[����l�,]�dX1�����-��F�ì9��yn�ח���A��     