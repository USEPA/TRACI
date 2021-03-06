PGDMP     1                
    w            traci    10.5    10.5 �              0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    431033    traci    DATABASE     �   CREATE DATABASE traci WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE traci;
             postgres    false                        2615    431034    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    4                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                       0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    431035    accounts_country    TABLE     �   CREATE TABLE public.accounts_country (
    id integer NOT NULL,
    country character varying(255),
    abbreviation character varying(4) NOT NULL,
    flag character varying(255)
);
 $   DROP TABLE public.accounts_country;
       public         postgres    false    4            �            1259    431041    accounts_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.accounts_country_id_seq;
       public       postgres    false    196    4                       0    0    accounts_country_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.accounts_country_id_seq OWNED BY public.accounts_country.id;
            public       postgres    false    197            �            1259    431043    accounts_role    TABLE     `   CREATE TABLE public.accounts_role (
    id integer NOT NULL,
    role character varying(255)
);
 !   DROP TABLE public.accounts_role;
       public         postgres    false    4            �            1259    431046    accounts_role_id_seq    SEQUENCE     }   CREATE SEQUENCE public.accounts_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.accounts_role_id_seq;
       public       postgres    false    4    198                       0    0    accounts_role_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.accounts_role_id_seq OWNED BY public.accounts_role.id;
            public       postgres    false    199            �            1259    431048    accounts_sector    TABLE     d   CREATE TABLE public.accounts_sector (
    id integer NOT NULL,
    sector character varying(255)
);
 #   DROP TABLE public.accounts_sector;
       public         postgres    false    4            �            1259    431051    accounts_sector_id_seq    SEQUENCE        CREATE SEQUENCE public.accounts_sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.accounts_sector_id_seq;
       public       postgres    false    4    200                       0    0    accounts_sector_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.accounts_sector_id_seq OWNED BY public.accounts_sector.id;
            public       postgres    false    201            �            1259    431053    accounts_state    TABLE     �   CREATE TABLE public.accounts_state (
    id integer NOT NULL,
    state character varying(255) NOT NULL,
    abbreviation character varying(4) NOT NULL,
    country_id integer
);
 "   DROP TABLE public.accounts_state;
       public         postgres    false    4            �            1259    431056    accounts_state_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.accounts_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.accounts_state_id_seq;
       public       postgres    false    202    4                       0    0    accounts_state_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.accounts_state_id_seq OWNED BY public.accounts_state.id;
            public       postgres    false    203            �            1259    431058    accounts_userprofile    TABLE     	  CREATE TABLE public.accounts_userprofile (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL,
    affiliation character varying(255),
    job_title character varying(255),
    address_line1 character varying(255),
    address_line2 character varying(255),
    city character varying(255),
    zipcode character varying(255),
    country_id integer,
    role_id integer,
    sector_id integer,
    state_id integer,
    user_id integer NOT NULL
);
 (   DROP TABLE public.accounts_userprofile;
       public         postgres    false    4            �            1259    431064    accounts_userprofile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.accounts_userprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.accounts_userprofile_id_seq;
       public       postgres    false    4    204                       0    0    accounts_userprofile_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.accounts_userprofile_id_seq OWNED BY public.accounts_userprofile.id;
            public       postgres    false    205            �            1259    431066 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false    4            �            1259    431069    auth_group_id_seq    SEQUENCE     z   CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    4    206                       0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    207            �            1259    431071    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false    4            �            1259    431074    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    208    4                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    209            �            1259    431076    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false    4            �            1259    431079    auth_permission_id_seq    SEQUENCE        CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    210    4                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    211            �            1259    431081 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false    4            �            1259    431087    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false    4            �            1259    431090    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    213    4                        0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    214            �            1259    431092    auth_user_id_seq    SEQUENCE     y   CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    212    4            !           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    215            �            1259    431094    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false    4            �            1259    431097 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    4    216            "           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    217            �            1259    431099    chemicals_chemical    TABLE       CREATE TABLE public.chemicals_chemical (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    cas character varying(32) NOT NULL,
    formatted_cas character varying(32) NOT NULL,
    global_warming_air double precision,
    acidification_air double precision,
    hh_particulate_air double precision,
    eutrophication_air double precision,
    eutrophication_water double precision,
    ozone_depletion_air double precision,
    smog_air double precision,
    ecotox_id integer NOT NULL,
    hhcf_id integer NOT NULL
);
 &   DROP TABLE public.chemicals_chemical;
       public         postgres    false    4            �            1259    431102    chemicals_chemical_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chemicals_chemical_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.chemicals_chemical_id_seq;
       public       postgres    false    218    4            #           0    0    chemicals_chemical_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.chemicals_chemical_id_seq OWNED BY public.chemicals_chemical.id;
            public       postgres    false    219            �            1259    431104    chemicals_ecotox    TABLE     O  CREATE TABLE public.chemicals_ecotox (
    id integer NOT NULL,
    ecotox_airu double precision,
    ecotox_airc double precision,
    ecotox_waterc double precision,
    ecotox_seawaterc double precision,
    ecotox_nat_soilc double precision,
    ecotox_agr_soilc double precision,
    ecotox_flag character varying(12) NOT NULL
);
 $   DROP TABLE public.chemicals_ecotox;
       public         postgres    false    4            �            1259    431107    chemicals_ecotox_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chemicals_ecotox_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.chemicals_ecotox_id_seq;
       public       postgres    false    220    4            $           0    0    chemicals_ecotox_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.chemicals_ecotox_id_seq OWNED BY public.chemicals_ecotox.id;
            public       postgres    false    221            �            1259    431109    chemicals_fossilfuel    TABLE     �   CREATE TABLE public.chemicals_fossilfuel (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    cf double precision NOT NULL
);
 (   DROP TABLE public.chemicals_fossilfuel;
       public         postgres    false    4            �            1259    431112    chemicals_fossilfuel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chemicals_fossilfuel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.chemicals_fossilfuel_id_seq;
       public       postgres    false    222    4            %           0    0    chemicals_fossilfuel_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.chemicals_fossilfuel_id_seq OWNED BY public.chemicals_fossilfuel.id;
            public       postgres    false    223            �            1259    431114    chemicals_hhcf    TABLE     �  CREATE TABLE public.chemicals_hhcf (
    id integer NOT NULL,
    hhcf_urban_air_cancer double precision,
    hhcf_urban_air_noncanc double precision,
    hhcf_rural_air_cancer double precision,
    hhcf_rural_air_noncanc double precision,
    hhcf_freshwater_cancer double precision,
    hhcf_freshwater_noncanc double precision,
    hhcf_seawater_cancer double precision,
    hhcf_seawater_noncanc double precision,
    hhcf_natsoil_cancer double precision,
    hhcf_natsoil_noncanc double precision,
    hhcf_agrsoil_cancer double precision,
    hhcf_agrsoil_noncanc double precision,
    hhcf_carcinogenic_flag character varying(12) NOT NULL,
    hhcf_noncarcinogenic_flag character varying(12) NOT NULL
);
 "   DROP TABLE public.chemicals_hhcf;
       public         postgres    false    4            �            1259    431117    chemicals_hhcf_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.chemicals_hhcf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.chemicals_hhcf_id_seq;
       public       postgres    false    4    224            &           0    0    chemicals_hhcf_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.chemicals_hhcf_id_seq OWNED BY public.chemicals_hhcf.id;
            public       postgres    false    225            �            1259    431119    chemicals_unit    TABLE       CREATE TABLE public.chemicals_unit (
    id integer NOT NULL,
    name character varying(63) NOT NULL,
    description character varying(255),
    chemical boolean NOT NULL,
    land_use boolean NOT NULL,
    water_use boolean NOT NULL,
    fossil_fuel boolean NOT NULL
);
 "   DROP TABLE public.chemicals_unit;
       public         postgres    false    4            �            1259    431122    chemicals_unit_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.chemicals_unit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.chemicals_unit_id_seq;
       public       postgres    false    226    4            '           0    0    chemicals_unit_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.chemicals_unit_id_seq OWNED BY public.chemicals_unit.id;
            public       postgres    false    227            �            1259    431124    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         postgres    false    4            �            1259    431131    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    228    4            (           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    229            �            1259    431133    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false    4            �            1259    431136    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    4    230            )           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    231            �            1259    431138    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false    4            �            1259    431144    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    4    232            *           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    233            �            1259    431146    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false    4                       1259    498927    products_landuse    TABLE     k   CREATE TABLE public.products_landuse (
    id integer NOT NULL,
    name character varying(63) NOT NULL
);
 $   DROP TABLE public.products_landuse;
       public         postgres    false    4                       1259    498925    products_landuse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_landuse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_landuse_id_seq;
       public       postgres    false    4    271            +           0    0    products_landuse_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_landuse_id_seq OWNED BY public.products_landuse.id;
            public       postgres    false    270            �            1259    431152    products_lifecyclestage    TABLE     �   CREATE TABLE public.products_lifecyclestage (
    id integer NOT NULL,
    name_id integer NOT NULL,
    product_id integer NOT NULL
);
 +   DROP TABLE public.products_lifecyclestage;
       public         postgres    false    4            �            1259    431155    products_lifecyclestage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_lifecyclestage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.products_lifecyclestage_id_seq;
       public       postgres    false    4    235            ,           0    0    products_lifecyclestage_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.products_lifecyclestage_id_seq OWNED BY public.products_lifecyclestage.id;
            public       postgres    false    236            �            1259    431157    products_lifecyclestagename    TABLE     v   CREATE TABLE public.products_lifecyclestagename (
    id integer NOT NULL,
    name character varying(63) NOT NULL
);
 /   DROP TABLE public.products_lifecyclestagename;
       public         postgres    false    4            �            1259    431160 "   products_lifecyclestagename_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_lifecyclestagename_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.products_lifecyclestagename_id_seq;
       public       postgres    false    237    4            -           0    0 "   products_lifecyclestagename_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.products_lifecyclestagename_id_seq OWNED BY public.products_lifecyclestagename.id;
            public       postgres    false    238            �            1259    431162    products_location    TABLE     �   CREATE TABLE public.products_location (
    geogid integer NOT NULL,
    name character varying(63),
    abbreviation character varying(63),
    ewid integer,
    region_id integer,
    geo_level_id integer,
    parent_id integer
);
 %   DROP TABLE public.products_location;
       public         postgres    false    4            �            1259    431165    products_media    TABLE     i   CREATE TABLE public.products_media (
    id integer NOT NULL,
    name character varying(31) NOT NULL
);
 "   DROP TABLE public.products_media;
       public         postgres    false    4            �            1259    431168    products_media_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.products_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.products_media_id_seq;
       public       postgres    false    4    240            .           0    0    products_media_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.products_media_id_seq OWNED BY public.products_media.id;
            public       postgres    false    241            �            1259    431170    products_process    TABLE     �   CREATE TABLE public.products_process (
    id integer NOT NULL,
    lifecyclestage_id integer NOT NULL,
    location_id integer NOT NULL,
    name_id integer NOT NULL
);
 $   DROP TABLE public.products_process;
       public         postgres    false    4            �            1259    431173    products_process_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_process_id_seq;
       public       postgres    false    242    4            /           0    0    products_process_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_process_id_seq OWNED BY public.products_process.id;
            public       postgres    false    243            �            1259    431175    products_processname    TABLE     o   CREATE TABLE public.products_processname (
    id integer NOT NULL,
    name character varying(63) NOT NULL
);
 (   DROP TABLE public.products_processname;
       public         postgres    false    4            �            1259    431178    products_processname_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_processname_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.products_processname_id_seq;
       public       postgres    false    244    4            0           0    0    products_processname_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.products_processname_id_seq OWNED BY public.products_processname.id;
            public       postgres    false    245            �            1259    431180    products_product    TABLE     �   CREATE TABLE public.products_product (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    project_id integer NOT NULL
);
 $   DROP TABLE public.products_product;
       public         postgres    false    4            �            1259    431183    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public       postgres    false    4    246            1           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;
            public       postgres    false    247            �            1259    431185    products_release    TABLE     �   CREATE TABLE public.products_release (
    id integer NOT NULL,
    release_quantity double precision,
    release_media_id integer,
    chemical_id integer NOT NULL,
    process_id integer NOT NULL,
    release_unit_id integer NOT NULL
);
 $   DROP TABLE public.products_release;
       public         postgres    false    4            �            1259    431188    products_release_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_release_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_release_id_seq;
       public       postgres    false    248    4            2           0    0    products_release_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_release_id_seq OWNED BY public.products_release.id;
            public       postgres    false    249            �            1259    431190    products_resource    TABLE     I  CREATE TABLE public.products_resource (
    id integer NOT NULL,
    resource_quantity double precision,
    resource_media_id integer,
    substance_type_id integer NOT NULL,
    resource_unit_id integer NOT NULL,
    process_id integer NOT NULL,
    fossil_fuel_id integer,
    land_use_id integer,
    water_use_id integer
);
 %   DROP TABLE public.products_resource;
       public         postgres    false    4            �            1259    431193    products_resource_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.products_resource_id_seq;
       public       postgres    false    4    250            3           0    0    products_resource_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.products_resource_id_seq OWNED BY public.products_resource.id;
            public       postgres    false    251            �            1259    431195    products_substancetype    TABLE     �   CREATE TABLE public.products_substancetype (
    id integer NOT NULL,
    name character varying(63) NOT NULL,
    type character varying(63) NOT NULL
);
 *   DROP TABLE public.products_substancetype;
       public         postgres    false    4            �            1259    431198    products_substancetype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_substancetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.products_substancetype_id_seq;
       public       postgres    false    4    252            4           0    0    products_substancetype_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.products_substancetype_id_seq OWNED BY public.products_substancetype.id;
            public       postgres    false    253            �            1259    431200    products_substancetypeunit    TABLE     �   CREATE TABLE public.products_substancetypeunit (
    id integer NOT NULL,
    substance_id integer NOT NULL,
    unit_id integer NOT NULL
);
 .   DROP TABLE public.products_substancetypeunit;
       public         postgres    false    4            �            1259    431203 !   products_substancetypeunit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_substancetypeunit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.products_substancetypeunit_id_seq;
       public       postgres    false    254    4            5           0    0 !   products_substancetypeunit_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.products_substancetypeunit_id_seq OWNED BY public.products_substancetypeunit.id;
            public       postgres    false    255                       1259    498935    products_wateruse    TABLE     l   CREATE TABLE public.products_wateruse (
    id integer NOT NULL,
    name character varying(63) NOT NULL
);
 %   DROP TABLE public.products_wateruse;
       public         postgres    false    4                       1259    498933    products_wateruse_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_wateruse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.products_wateruse_id_seq;
       public       postgres    false    4    273            6           0    0    products_wateruse_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.products_wateruse_id_seq OWNED BY public.products_wateruse.id;
            public       postgres    false    272                        1259    431205    projects_project    TABLE     �  CREATE TABLE public.projects_project (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    version character varying(31),
    organization character varying(127),
    org_unit character varying(63),
    contact character varying(127),
    phone_num character varying(31),
    scope character varying(127),
    description character varying(255),
    functional_unit character varying(31)
);
 $   DROP TABLE public.projects_project;
       public         postgres    false    4                       1259    431211    projects_project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.projects_project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.projects_project_id_seq;
       public       postgres    false    256    4            7           0    0    projects_project_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.projects_project_id_seq OWNED BY public.projects_project.id;
            public       postgres    false    257                       1259    431213    support_informationrequest    TABLE     �  CREATE TABLE public.support_informationrequest (
    id integer NOT NULL,
    created_date timestamp with time zone NOT NULL,
    sent_to_email character varying(255),
    requestor_first_name character varying(255) NOT NULL,
    requestor_last_name character varying(255) NOT NULL,
    requestor_email_address character varying(255) NOT NULL,
    request_subject character varying(255) NOT NULL,
    request_details text NOT NULL,
    response text,
    response_date date
);
 .   DROP TABLE public.support_informationrequest;
       public         postgres    false    4                       1259    431219 !   support_informationrequest_id_seq    SEQUENCE     �   CREATE SEQUENCE public.support_informationrequest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.support_informationrequest_id_seq;
       public       postgres    false    258    4            8           0    0 !   support_informationrequest_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.support_informationrequest_id_seq OWNED BY public.support_informationrequest.id;
            public       postgres    false    259                       1259    431221    support_priority    TABLE     s  CREATE TABLE public.support_priority (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone,
    created_by character varying(255),
    last_modified_by character varying(255),
    name character varying(255),
    the_description text,
    weblink character varying(255),
    ordering numeric(10,1),
    user_id integer
);
 $   DROP TABLE public.support_priority;
       public         postgres    false    4                       1259    431227    support_priority_id_seq    SEQUENCE     �   CREATE SEQUENCE public.support_priority_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.support_priority_id_seq;
       public       postgres    false    4    260            9           0    0    support_priority_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.support_priority_id_seq OWNED BY public.support_priority.id;
            public       postgres    false    261                       1259    431229    support_support    TABLE     �  CREATE TABLE public.support_support (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone,
    created_by character varying(255),
    last_modified_by character varying(255),
    make_public character varying(5),
    share_with_user_group character varying(5),
    attachment character varying(100),
    name character varying(255),
    subject character varying(255),
    length_of_reference character varying(255),
    author character varying(255),
    is_closed character varying(5),
    the_description text,
    resolution text,
    weblink character varying(255),
    ordering numeric(10,1),
    date_resolved date,
    priority_id integer,
    support_type_id integer,
    user_id integer
);
 #   DROP TABLE public.support_support;
       public         postgres    false    4                       1259    431235    support_support_id_seq    SEQUENCE        CREATE SEQUENCE public.support_support_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.support_support_id_seq;
       public       postgres    false    4    262            :           0    0    support_support_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.support_support_id_seq OWNED BY public.support_support.id;
            public       postgres    false    263                       1259    431237    support_supporttype    TABLE     v  CREATE TABLE public.support_supporttype (
    id integer NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone,
    created_by character varying(255),
    last_modified_by character varying(255),
    name character varying(255),
    the_description text,
    weblink character varying(255),
    ordering numeric(10,1),
    user_id integer
);
 '   DROP TABLE public.support_supporttype;
       public         postgres    false    4            	           1259    431243    support_supporttype_id_seq    SEQUENCE     �   CREATE SEQUENCE public.support_supporttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.support_supporttype_id_seq;
       public       postgres    false    264    4            ;           0    0    support_supporttype_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.support_supporttype_id_seq OWNED BY public.support_supporttype.id;
            public       postgres    false    265            
           1259    431245 
   teams_team    TABLE       CREATE TABLE public.teams_team (
    id integer NOT NULL,
    created_date timestamp with time zone,
    last_modified_date timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    created_by_id integer NOT NULL,
    last_modified_by_id integer
);
    DROP TABLE public.teams_team;
       public         postgres    false    4                       1259    431248    teams_team_id_seq    SEQUENCE     z   CREATE SEQUENCE public.teams_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.teams_team_id_seq;
       public       postgres    false    4    266            <           0    0    teams_team_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams_team.id;
            public       postgres    false    267                       1259    431250    teams_teammembership    TABLE     �   CREATE TABLE public.teams_teammembership (
    id integer NOT NULL,
    added_date timestamp with time zone NOT NULL,
    is_owner boolean NOT NULL,
    can_edit boolean NOT NULL,
    member_id integer NOT NULL,
    team_id integer NOT NULL
);
 (   DROP TABLE public.teams_teammembership;
       public         postgres    false    4                       1259    431253    teams_teammembership_id_seq    SEQUENCE     �   CREATE SEQUENCE public.teams_teammembership_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.teams_teammembership_id_seq;
       public       postgres    false    4    268            =           0    0    teams_teammembership_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.teams_teammembership_id_seq OWNED BY public.teams_teammembership.id;
            public       postgres    false    269            _           2604    431255    accounts_country id    DEFAULT     z   ALTER TABLE ONLY public.accounts_country ALTER COLUMN id SET DEFAULT nextval('public.accounts_country_id_seq'::regclass);
 B   ALTER TABLE public.accounts_country ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            `           2604    431256    accounts_role id    DEFAULT     t   ALTER TABLE ONLY public.accounts_role ALTER COLUMN id SET DEFAULT nextval('public.accounts_role_id_seq'::regclass);
 ?   ALTER TABLE public.accounts_role ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            a           2604    431257    accounts_sector id    DEFAULT     x   ALTER TABLE ONLY public.accounts_sector ALTER COLUMN id SET DEFAULT nextval('public.accounts_sector_id_seq'::regclass);
 A   ALTER TABLE public.accounts_sector ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            b           2604    431258    accounts_state id    DEFAULT     v   ALTER TABLE ONLY public.accounts_state ALTER COLUMN id SET DEFAULT nextval('public.accounts_state_id_seq'::regclass);
 @   ALTER TABLE public.accounts_state ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            c           2604    431259    accounts_userprofile id    DEFAULT     �   ALTER TABLE ONLY public.accounts_userprofile ALTER COLUMN id SET DEFAULT nextval('public.accounts_userprofile_id_seq'::regclass);
 F   ALTER TABLE public.accounts_userprofile ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            d           2604    431260    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            e           2604    431261    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            f           2604    431262    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            g           2604    431263    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    212            h           2604    431264    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    214    213            i           2604    431265    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            j           2604    431266    chemicals_chemical id    DEFAULT     ~   ALTER TABLE ONLY public.chemicals_chemical ALTER COLUMN id SET DEFAULT nextval('public.chemicals_chemical_id_seq'::regclass);
 D   ALTER TABLE public.chemicals_chemical ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            k           2604    431267    chemicals_ecotox id    DEFAULT     z   ALTER TABLE ONLY public.chemicals_ecotox ALTER COLUMN id SET DEFAULT nextval('public.chemicals_ecotox_id_seq'::regclass);
 B   ALTER TABLE public.chemicals_ecotox ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    221    220            l           2604    431268    chemicals_fossilfuel id    DEFAULT     �   ALTER TABLE ONLY public.chemicals_fossilfuel ALTER COLUMN id SET DEFAULT nextval('public.chemicals_fossilfuel_id_seq'::regclass);
 F   ALTER TABLE public.chemicals_fossilfuel ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    223    222            m           2604    431269    chemicals_hhcf id    DEFAULT     v   ALTER TABLE ONLY public.chemicals_hhcf ALTER COLUMN id SET DEFAULT nextval('public.chemicals_hhcf_id_seq'::regclass);
 @   ALTER TABLE public.chemicals_hhcf ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    224            n           2604    431270    chemicals_unit id    DEFAULT     v   ALTER TABLE ONLY public.chemicals_unit ALTER COLUMN id SET DEFAULT nextval('public.chemicals_unit_id_seq'::regclass);
 @   ALTER TABLE public.chemicals_unit ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            o           2604    431271    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    229    228            q           2604    431272    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            r           2604    431273    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    232            �           2604    498930    products_landuse id    DEFAULT     z   ALTER TABLE ONLY public.products_landuse ALTER COLUMN id SET DEFAULT nextval('public.products_landuse_id_seq'::regclass);
 B   ALTER TABLE public.products_landuse ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    271    270    271            s           2604    431274    products_lifecyclestage id    DEFAULT     �   ALTER TABLE ONLY public.products_lifecyclestage ALTER COLUMN id SET DEFAULT nextval('public.products_lifecyclestage_id_seq'::regclass);
 I   ALTER TABLE public.products_lifecyclestage ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    236    235            t           2604    431275    products_lifecyclestagename id    DEFAULT     �   ALTER TABLE ONLY public.products_lifecyclestagename ALTER COLUMN id SET DEFAULT nextval('public.products_lifecyclestagename_id_seq'::regclass);
 M   ALTER TABLE public.products_lifecyclestagename ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    238    237            u           2604    431276    products_media id    DEFAULT     v   ALTER TABLE ONLY public.products_media ALTER COLUMN id SET DEFAULT nextval('public.products_media_id_seq'::regclass);
 @   ALTER TABLE public.products_media ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    241    240            v           2604    431277    products_process id    DEFAULT     z   ALTER TABLE ONLY public.products_process ALTER COLUMN id SET DEFAULT nextval('public.products_process_id_seq'::regclass);
 B   ALTER TABLE public.products_process ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    243    242            w           2604    431278    products_processname id    DEFAULT     �   ALTER TABLE ONLY public.products_processname ALTER COLUMN id SET DEFAULT nextval('public.products_processname_id_seq'::regclass);
 F   ALTER TABLE public.products_processname ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    245    244            x           2604    431279    products_product id    DEFAULT     z   ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products_product ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    247    246            y           2604    431280    products_release id    DEFAULT     z   ALTER TABLE ONLY public.products_release ALTER COLUMN id SET DEFAULT nextval('public.products_release_id_seq'::regclass);
 B   ALTER TABLE public.products_release ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    249    248            z           2604    431281    products_resource id    DEFAULT     |   ALTER TABLE ONLY public.products_resource ALTER COLUMN id SET DEFAULT nextval('public.products_resource_id_seq'::regclass);
 C   ALTER TABLE public.products_resource ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    251    250            {           2604    431282    products_substancetype id    DEFAULT     �   ALTER TABLE ONLY public.products_substancetype ALTER COLUMN id SET DEFAULT nextval('public.products_substancetype_id_seq'::regclass);
 H   ALTER TABLE public.products_substancetype ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    253    252            |           2604    431283    products_substancetypeunit id    DEFAULT     �   ALTER TABLE ONLY public.products_substancetypeunit ALTER COLUMN id SET DEFAULT nextval('public.products_substancetypeunit_id_seq'::regclass);
 L   ALTER TABLE public.products_substancetypeunit ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    255    254            �           2604    498938    products_wateruse id    DEFAULT     |   ALTER TABLE ONLY public.products_wateruse ALTER COLUMN id SET DEFAULT nextval('public.products_wateruse_id_seq'::regclass);
 C   ALTER TABLE public.products_wateruse ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    273    272    273            }           2604    431284    projects_project id    DEFAULT     z   ALTER TABLE ONLY public.projects_project ALTER COLUMN id SET DEFAULT nextval('public.projects_project_id_seq'::regclass);
 B   ALTER TABLE public.projects_project ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    257    256            ~           2604    431285    support_informationrequest id    DEFAULT     �   ALTER TABLE ONLY public.support_informationrequest ALTER COLUMN id SET DEFAULT nextval('public.support_informationrequest_id_seq'::regclass);
 L   ALTER TABLE public.support_informationrequest ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    259    258                       2604    431286    support_priority id    DEFAULT     z   ALTER TABLE ONLY public.support_priority ALTER COLUMN id SET DEFAULT nextval('public.support_priority_id_seq'::regclass);
 B   ALTER TABLE public.support_priority ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    261    260            �           2604    431287    support_support id    DEFAULT     x   ALTER TABLE ONLY public.support_support ALTER COLUMN id SET DEFAULT nextval('public.support_support_id_seq'::regclass);
 A   ALTER TABLE public.support_support ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    263    262            �           2604    431288    support_supporttype id    DEFAULT     �   ALTER TABLE ONLY public.support_supporttype ALTER COLUMN id SET DEFAULT nextval('public.support_supporttype_id_seq'::regclass);
 E   ALTER TABLE public.support_supporttype ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    265    264            �           2604    431289    teams_team id    DEFAULT     n   ALTER TABLE ONLY public.teams_team ALTER COLUMN id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);
 <   ALTER TABLE public.teams_team ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    267    266            �           2604    431290    teams_teammembership id    DEFAULT     �   ALTER TABLE ONLY public.teams_teammembership ALTER COLUMN id SET DEFAULT nextval('public.teams_teammembership_id_seq'::regclass);
 F   ALTER TABLE public.teams_teammembership ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    269    268            �          0    431035    accounts_country 
   TABLE DATA               K   COPY public.accounts_country (id, country, abbreviation, flag) FROM stdin;
    public       postgres    false    196   �      �          0    431043    accounts_role 
   TABLE DATA               1   COPY public.accounts_role (id, role) FROM stdin;
    public       postgres    false    198   �      �          0    431048    accounts_sector 
   TABLE DATA               5   COPY public.accounts_sector (id, sector) FROM stdin;
    public       postgres    false    200   K      �          0    431053    accounts_state 
   TABLE DATA               M   COPY public.accounts_state (id, state, abbreviation, country_id) FROM stdin;
    public       postgres    false    202   �      �          0    431058    accounts_userprofile 
   TABLE DATA               �   COPY public.accounts_userprofile (id, created, last_modified, affiliation, job_title, address_line1, address_line2, city, zipcode, country_id, role_id, sector_id, state_id, user_id) FROM stdin;
    public       postgres    false    204   .      �          0    431066 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    206   p      �          0    431071    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    208   �      �          0    431076    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    210   �      �          0    431081 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    212         �          0    431087    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    213   �      �          0    431094    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    216   �      �          0    431099    chemicals_chemical 
   TABLE DATA               �   COPY public.chemicals_chemical (id, name, cas, formatted_cas, global_warming_air, acidification_air, hh_particulate_air, eutrophication_air, eutrophication_water, ozone_depletion_air, smog_air, ecotox_id, hhcf_id) FROM stdin;
    public       postgres    false    218         �          0    431104    chemicals_ecotox 
   TABLE DATA               �   COPY public.chemicals_ecotox (id, ecotox_airu, ecotox_airc, ecotox_waterc, ecotox_seawaterc, ecotox_nat_soilc, ecotox_agr_soilc, ecotox_flag) FROM stdin;
    public       postgres    false    220   ca      �          0    431109    chemicals_fossilfuel 
   TABLE DATA               <   COPY public.chemicals_fossilfuel (id, name, cf) FROM stdin;
    public       postgres    false    222   �      �          0    431114    chemicals_hhcf 
   TABLE DATA               q  COPY public.chemicals_hhcf (id, hhcf_urban_air_cancer, hhcf_urban_air_noncanc, hhcf_rural_air_cancer, hhcf_rural_air_noncanc, hhcf_freshwater_cancer, hhcf_freshwater_noncanc, hhcf_seawater_cancer, hhcf_seawater_noncanc, hhcf_natsoil_cancer, hhcf_natsoil_noncanc, hhcf_agrsoil_cancer, hhcf_agrsoil_noncanc, hhcf_carcinogenic_flag, hhcf_noncarcinogenic_flag) FROM stdin;
    public       postgres    false    224   �      �          0    431119    chemicals_unit 
   TABLE DATA               k   COPY public.chemicals_unit (id, name, description, chemical, land_use, water_use, fossil_fuel) FROM stdin;
    public       postgres    false    226   Ѱ      �          0    431124    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    228   6�      �          0    431133    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    230   ز      �          0    431138    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    232   7�      �          0    431146    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    234   ��                0    498927    products_landuse 
   TABLE DATA               4   COPY public.products_landuse (id, name) FROM stdin;
    public       postgres    false    271   (�      �          0    431152    products_lifecyclestage 
   TABLE DATA               J   COPY public.products_lifecyclestage (id, name_id, product_id) FROM stdin;
    public       postgres    false    235   E�      �          0    431157    products_lifecyclestagename 
   TABLE DATA               ?   COPY public.products_lifecyclestagename (id, name) FROM stdin;
    public       postgres    false    237   h�      �          0    431162    products_location 
   TABLE DATA               q   COPY public.products_location (geogid, name, abbreviation, ewid, region_id, geo_level_id, parent_id) FROM stdin;
    public       postgres    false    239   �      �          0    431165    products_media 
   TABLE DATA               2   COPY public.products_media (id, name) FROM stdin;
    public       postgres    false    240   r      �          0    431170    products_process 
   TABLE DATA               W   COPY public.products_process (id, lifecyclestage_id, location_id, name_id) FROM stdin;
    public       postgres    false    242   �      �          0    431175    products_processname 
   TABLE DATA               8   COPY public.products_processname (id, name) FROM stdin;
    public       postgres    false    244   �      �          0    431180    products_product 
   TABLE DATA               @   COPY public.products_product (id, name, project_id) FROM stdin;
    public       postgres    false    246         �          0    431185    products_release 
   TABLE DATA               |   COPY public.products_release (id, release_quantity, release_media_id, chemical_id, process_id, release_unit_id) FROM stdin;
    public       postgres    false    248   Q      �          0    431190    products_resource 
   TABLE DATA               �   COPY public.products_resource (id, resource_quantity, resource_media_id, substance_type_id, resource_unit_id, process_id, fossil_fuel_id, land_use_id, water_use_id) FROM stdin;
    public       postgres    false    250   �      �          0    431195    products_substancetype 
   TABLE DATA               @   COPY public.products_substancetype (id, name, type) FROM stdin;
    public       postgres    false    252   �      �          0    431200    products_substancetypeunit 
   TABLE DATA               O   COPY public.products_substancetypeunit (id, substance_id, unit_id) FROM stdin;
    public       postgres    false    254   �                0    498935    products_wateruse 
   TABLE DATA               5   COPY public.products_wateruse (id, name) FROM stdin;
    public       postgres    false    273         �          0    431205    projects_project 
   TABLE DATA               �   COPY public.projects_project (id, name, version, organization, org_unit, contact, phone_num, scope, description, functional_unit) FROM stdin;
    public       postgres    false    256   7                 0    431213    support_informationrequest 
   TABLE DATA               �   COPY public.support_informationrequest (id, created_date, sent_to_email, requestor_first_name, requestor_last_name, requestor_email_address, request_subject, request_details, response, response_date) FROM stdin;
    public       postgres    false    258   �                0    431221    support_priority 
   TABLE DATA               �   COPY public.support_priority (id, created, modified, created_by, last_modified_by, name, the_description, weblink, ordering, user_id) FROM stdin;
    public       postgres    false    260   �                0    431229    support_support 
   TABLE DATA               +  COPY public.support_support (id, created, modified, created_by, last_modified_by, make_public, share_with_user_group, attachment, name, subject, length_of_reference, author, is_closed, the_description, resolution, weblink, ordering, date_resolved, priority_id, support_type_id, user_id) FROM stdin;
    public       postgres    false    262   �                0    431237    support_supporttype 
   TABLE DATA               �   COPY public.support_supporttype (id, created, modified, created_by, last_modified_by, name, the_description, weblink, ordering, user_id) FROM stdin;
    public       postgres    false    264   �                0    431245 
   teams_team 
   TABLE DATA               t   COPY public.teams_team (id, created_date, last_modified_date, name, created_by_id, last_modified_by_id) FROM stdin;
    public       postgres    false    266          
          0    431250    teams_teammembership 
   TABLE DATA               f   COPY public.teams_teammembership (id, added_date, is_owner, can_edit, member_id, team_id) FROM stdin;
    public       postgres    false    268   Z       >           0    0    accounts_country_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.accounts_country_id_seq', 246, true);
            public       postgres    false    197            ?           0    0    accounts_role_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.accounts_role_id_seq', 5, true);
            public       postgres    false    199            @           0    0    accounts_sector_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.accounts_sector_id_seq', 5, true);
            public       postgres    false    201            A           0    0    accounts_state_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.accounts_state_id_seq', 56, true);
            public       postgres    false    203            B           0    0    accounts_userprofile_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.accounts_userprofile_id_seq', 1, true);
            public       postgres    false    205            C           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    207            D           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    209            E           0    0    auth_permission_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_permission_id_seq', 144, true);
            public       postgres    false    211            F           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       postgres    false    214            G           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
            public       postgres    false    215            H           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    217            I           0    0    chemicals_chemical_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.chemicals_chemical_id_seq', 1, false);
            public       postgres    false    219            J           0    0    chemicals_ecotox_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.chemicals_ecotox_id_seq', 1, false);
            public       postgres    false    221            K           0    0    chemicals_fossilfuel_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.chemicals_fossilfuel_id_seq', 1, false);
            public       postgres    false    223            L           0    0    chemicals_hhcf_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.chemicals_hhcf_id_seq', 1, false);
            public       postgres    false    225            M           0    0    chemicals_unit_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.chemicals_unit_id_seq', 38, true);
            public       postgres    false    227            N           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);
            public       postgres    false    229            O           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 36, true);
            public       postgres    false    231            P           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);
            public       postgres    false    233            Q           0    0    products_landuse_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_landuse_id_seq', 1, false);
            public       postgres    false    270            R           0    0    products_lifecyclestage_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.products_lifecyclestage_id_seq', 1, true);
            public       postgres    false    236            S           0    0 "   products_lifecyclestagename_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.products_lifecyclestagename_id_seq', 6, true);
            public       postgres    false    238            T           0    0    products_media_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.products_media_id_seq', 3, true);
            public       postgres    false    241            U           0    0    products_process_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_process_id_seq', 1, true);
            public       postgres    false    243            V           0    0    products_processname_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.products_processname_id_seq', 1, true);
            public       postgres    false    245            W           0    0    products_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_product_id_seq', 1, true);
            public       postgres    false    247            X           0    0    products_release_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_release_id_seq', 3, true);
            public       postgres    false    249            Y           0    0    products_resource_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.products_resource_id_seq', 1, true);
            public       postgres    false    251            Z           0    0    products_substancetype_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.products_substancetype_id_seq', 4, true);
            public       postgres    false    253            [           0    0 !   products_substancetypeunit_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.products_substancetypeunit_id_seq', 1, false);
            public       postgres    false    255            \           0    0    products_wateruse_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.products_wateruse_id_seq', 1, false);
            public       postgres    false    272            ]           0    0    projects_project_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.projects_project_id_seq', 1, true);
            public       postgres    false    257            ^           0    0 !   support_informationrequest_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.support_informationrequest_id_seq', 1, false);
            public       postgres    false    259            _           0    0    support_priority_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.support_priority_id_seq', 1, false);
            public       postgres    false    261            `           0    0    support_support_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.support_support_id_seq', 1, false);
            public       postgres    false    263            a           0    0    support_supporttype_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.support_supporttype_id_seq', 1, false);
            public       postgres    false    265            b           0    0    teams_team_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.teams_team_id_seq', 1, true);
            public       postgres    false    267            c           0    0    teams_teammembership_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.teams_teammembership_id_seq', 1, true);
            public       postgres    false    269            �           2606    431292 &   accounts_country accounts_country_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.accounts_country
    ADD CONSTRAINT accounts_country_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.accounts_country DROP CONSTRAINT accounts_country_pkey;
       public         postgres    false    196            �           2606    431294     accounts_role accounts_role_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.accounts_role
    ADD CONSTRAINT accounts_role_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.accounts_role DROP CONSTRAINT accounts_role_pkey;
       public         postgres    false    198            �           2606    431296 $   accounts_sector accounts_sector_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.accounts_sector
    ADD CONSTRAINT accounts_sector_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.accounts_sector DROP CONSTRAINT accounts_sector_pkey;
       public         postgres    false    200            �           2606    431298 "   accounts_state accounts_state_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.accounts_state
    ADD CONSTRAINT accounts_state_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.accounts_state DROP CONSTRAINT accounts_state_pkey;
       public         postgres    false    202            �           2606    431300 .   accounts_userprofile accounts_userprofile_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.accounts_userprofile DROP CONSTRAINT accounts_userprofile_pkey;
       public         postgres    false    204            �           2606    431302 5   accounts_userprofile accounts_userprofile_user_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_key UNIQUE (user_id);
 _   ALTER TABLE ONLY public.accounts_userprofile DROP CONSTRAINT accounts_userprofile_user_id_key;
       public         postgres    false    204            �           2606    431304    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    206            �           2606    431306 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    208    208            �           2606    431308 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    208            �           2606    431310    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    206            �           2606    431312 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    210    210            �           2606    431314 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    210            �           2606    431316 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    213            �           2606    431318 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    213    213            �           2606    431320    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    212            �           2606    431322 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    216            �           2606    431324 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    216    216            �           2606    431326     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    212            �           2606    431328 3   chemicals_chemical chemicals_chemical_ecotox_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.chemicals_chemical
    ADD CONSTRAINT chemicals_chemical_ecotox_id_key UNIQUE (ecotox_id);
 ]   ALTER TABLE ONLY public.chemicals_chemical DROP CONSTRAINT chemicals_chemical_ecotox_id_key;
       public         postgres    false    218            �           2606    431330 1   chemicals_chemical chemicals_chemical_hhcf_id_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.chemicals_chemical
    ADD CONSTRAINT chemicals_chemical_hhcf_id_key UNIQUE (hhcf_id);
 [   ALTER TABLE ONLY public.chemicals_chemical DROP CONSTRAINT chemicals_chemical_hhcf_id_key;
       public         postgres    false    218            �           2606    431332 *   chemicals_chemical chemicals_chemical_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.chemicals_chemical
    ADD CONSTRAINT chemicals_chemical_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.chemicals_chemical DROP CONSTRAINT chemicals_chemical_pkey;
       public         postgres    false    218            �           2606    431334 &   chemicals_ecotox chemicals_ecotox_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.chemicals_ecotox
    ADD CONSTRAINT chemicals_ecotox_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.chemicals_ecotox DROP CONSTRAINT chemicals_ecotox_pkey;
       public         postgres    false    220            �           2606    431336 .   chemicals_fossilfuel chemicals_fossilfuel_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.chemicals_fossilfuel
    ADD CONSTRAINT chemicals_fossilfuel_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.chemicals_fossilfuel DROP CONSTRAINT chemicals_fossilfuel_pkey;
       public         postgres    false    222            �           2606    431338 "   chemicals_hhcf chemicals_hhcf_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.chemicals_hhcf
    ADD CONSTRAINT chemicals_hhcf_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.chemicals_hhcf DROP CONSTRAINT chemicals_hhcf_pkey;
       public         postgres    false    224            �           2606    431340 "   chemicals_unit chemicals_unit_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.chemicals_unit
    ADD CONSTRAINT chemicals_unit_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.chemicals_unit DROP CONSTRAINT chemicals_unit_pkey;
       public         postgres    false    226            �           2606    431342 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    228            �           2606    431344 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    230    230            �           2606    431346 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    230            �           2606    431348 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    232            �           2606    431350 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    234                       2606    498932 &   products_landuse products_landuse_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.products_landuse
    ADD CONSTRAINT products_landuse_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.products_landuse DROP CONSTRAINT products_landuse_pkey;
       public         postgres    false    271            �           2606    431352 4   products_lifecyclestage products_lifecyclestage_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.products_lifecyclestage
    ADD CONSTRAINT products_lifecyclestage_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.products_lifecyclestage DROP CONSTRAINT products_lifecyclestage_pkey;
       public         postgres    false    235            �           2606    431354 <   products_lifecyclestagename products_lifecyclestagename_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public.products_lifecyclestagename
    ADD CONSTRAINT products_lifecyclestagename_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.products_lifecyclestagename DROP CONSTRAINT products_lifecyclestagename_pkey;
       public         postgres    false    237            �           2606    431356 (   products_location products_location_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.products_location
    ADD CONSTRAINT products_location_pkey PRIMARY KEY (geogid);
 R   ALTER TABLE ONLY public.products_location DROP CONSTRAINT products_location_pkey;
       public         postgres    false    239            �           2606    431358 "   products_media products_media_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.products_media
    ADD CONSTRAINT products_media_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.products_media DROP CONSTRAINT products_media_pkey;
       public         postgres    false    240            �           2606    431360 &   products_process products_process_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.products_process
    ADD CONSTRAINT products_process_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.products_process DROP CONSTRAINT products_process_pkey;
       public         postgres    false    242            �           2606    431362 .   products_processname products_processname_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.products_processname
    ADD CONSTRAINT products_processname_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.products_processname DROP CONSTRAINT products_processname_pkey;
       public         postgres    false    244            �           2606    431364 &   products_product products_product_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_pkey;
       public         postgres    false    246            �           2606    431366 &   products_release products_release_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.products_release
    ADD CONSTRAINT products_release_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.products_release DROP CONSTRAINT products_release_pkey;
       public         postgres    false    248            �           2606    431368 (   products_resource products_resource_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.products_resource
    ADD CONSTRAINT products_resource_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.products_resource DROP CONSTRAINT products_resource_pkey;
       public         postgres    false    250            �           2606    431370 2   products_substancetype products_substancetype_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.products_substancetype
    ADD CONSTRAINT products_substancetype_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.products_substancetype DROP CONSTRAINT products_substancetype_pkey;
       public         postgres    false    252            �           2606    431372 :   products_substancetypeunit products_substancetypeunit_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.products_substancetypeunit
    ADD CONSTRAINT products_substancetypeunit_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.products_substancetypeunit DROP CONSTRAINT products_substancetypeunit_pkey;
       public         postgres    false    254                       2606    498940 (   products_wateruse products_wateruse_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.products_wateruse
    ADD CONSTRAINT products_wateruse_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.products_wateruse DROP CONSTRAINT products_wateruse_pkey;
       public         postgres    false    273            �           2606    431374 &   projects_project projects_project_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.projects_project
    ADD CONSTRAINT projects_project_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.projects_project DROP CONSTRAINT projects_project_pkey;
       public         postgres    false    256                       2606    431376 :   support_informationrequest support_informationrequest_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.support_informationrequest
    ADD CONSTRAINT support_informationrequest_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.support_informationrequest DROP CONSTRAINT support_informationrequest_pkey;
       public         postgres    false    258                       2606    431378 &   support_priority support_priority_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.support_priority
    ADD CONSTRAINT support_priority_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.support_priority DROP CONSTRAINT support_priority_pkey;
       public         postgres    false    260                       2606    431380 $   support_support support_support_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.support_support DROP CONSTRAINT support_support_pkey;
       public         postgres    false    262                       2606    431382 ,   support_supporttype support_supporttype_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.support_supporttype
    ADD CONSTRAINT support_supporttype_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.support_supporttype DROP CONSTRAINT support_supporttype_pkey;
       public         postgres    false    264                       2606    431384    teams_team teams_team_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.teams_team
    ADD CONSTRAINT teams_team_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.teams_team DROP CONSTRAINT teams_team_pkey;
       public         postgres    false    266                       2606    431386 .   teams_teammembership teams_teammembership_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.teams_teammembership
    ADD CONSTRAINT teams_teammembership_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.teams_teammembership DROP CONSTRAINT teams_teammembership_pkey;
       public         postgres    false    268            �           1259    431387 "   accounts_state_country_id_39e7b64f    INDEX     c   CREATE INDEX accounts_state_country_id_39e7b64f ON public.accounts_state USING btree (country_id);
 6   DROP INDEX public.accounts_state_country_id_39e7b64f;
       public         postgres    false    202            �           1259    431388 (   accounts_userprofile_country_id_ace726da    INDEX     o   CREATE INDEX accounts_userprofile_country_id_ace726da ON public.accounts_userprofile USING btree (country_id);
 <   DROP INDEX public.accounts_userprofile_country_id_ace726da;
       public         postgres    false    204            �           1259    431389 %   accounts_userprofile_role_id_43fb6111    INDEX     i   CREATE INDEX accounts_userprofile_role_id_43fb6111 ON public.accounts_userprofile USING btree (role_id);
 9   DROP INDEX public.accounts_userprofile_role_id_43fb6111;
       public         postgres    false    204            �           1259    431390 '   accounts_userprofile_sector_id_a623e498    INDEX     m   CREATE INDEX accounts_userprofile_sector_id_a623e498 ON public.accounts_userprofile USING btree (sector_id);
 ;   DROP INDEX public.accounts_userprofile_sector_id_a623e498;
       public         postgres    false    204            �           1259    431391 &   accounts_userprofile_state_id_305ae9e2    INDEX     k   CREATE INDEX accounts_userprofile_state_id_305ae9e2 ON public.accounts_userprofile USING btree (state_id);
 :   DROP INDEX public.accounts_userprofile_state_id_305ae9e2;
       public         postgres    false    204            �           1259    431392    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    206            �           1259    431393 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    208            �           1259    431394 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    208            �           1259    431395 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    210            �           1259    431396 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    213            �           1259    431397 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    213            �           1259    431398 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    216            �           1259    431399 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    216            �           1259    431400     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    212            �           1259    431401 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    228            �           1259    431402 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    228            �           1259    431403 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    234            �           1259    431404 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    234            �           1259    431405 (   products_lifecyclestage_name_id_2ef4124c    INDEX     o   CREATE INDEX products_lifecyclestage_name_id_2ef4124c ON public.products_lifecyclestage USING btree (name_id);
 <   DROP INDEX public.products_lifecyclestage_name_id_2ef4124c;
       public         postgres    false    235            �           1259    431406 +   products_lifecyclestage_product_id_382426d6    INDEX     u   CREATE INDEX products_lifecyclestage_product_id_382426d6 ON public.products_lifecyclestage USING btree (product_id);
 ?   DROP INDEX public.products_lifecyclestage_product_id_382426d6;
       public         postgres    false    235            �           1259    431407 $   products_location_parent_id_029c1fa5    INDEX     g   CREATE INDEX products_location_parent_id_029c1fa5 ON public.products_location USING btree (parent_id);
 8   DROP INDEX public.products_location_parent_id_029c1fa5;
       public         postgres    false    239            �           1259    431408 +   products_process_lifecyclestage_id_dd49058c    INDEX     u   CREATE INDEX products_process_lifecyclestage_id_dd49058c ON public.products_process USING btree (lifecyclestage_id);
 ?   DROP INDEX public.products_process_lifecyclestage_id_dd49058c;
       public         postgres    false    242            �           1259    431409 %   products_process_location_id_0e0c78b9    INDEX     i   CREATE INDEX products_process_location_id_0e0c78b9 ON public.products_process USING btree (location_id);
 9   DROP INDEX public.products_process_location_id_0e0c78b9;
       public         postgres    false    242            �           1259    431410 !   products_process_name_id_aed64467    INDEX     a   CREATE INDEX products_process_name_id_aed64467 ON public.products_process USING btree (name_id);
 5   DROP INDEX public.products_process_name_id_aed64467;
       public         postgres    false    242            �           1259    431411 $   products_product_project_id_071d610f    INDEX     g   CREATE INDEX products_product_project_id_071d610f ON public.products_product USING btree (project_id);
 8   DROP INDEX public.products_product_project_id_071d610f;
       public         postgres    false    246            �           1259    431412 "   products_release_media_id_cbbe54fd    INDEX     k   CREATE INDEX products_release_media_id_cbbe54fd ON public.products_release USING btree (release_media_id);
 6   DROP INDEX public.products_release_media_id_cbbe54fd;
       public         postgres    false    248            �           1259    431413 !   products_release_name_id_fdedb83a    INDEX     e   CREATE INDEX products_release_name_id_fdedb83a ON public.products_release USING btree (chemical_id);
 5   DROP INDEX public.products_release_name_id_fdedb83a;
       public         postgres    false    248            �           1259    431414 $   products_release_process_id_b6057bd2    INDEX     g   CREATE INDEX products_release_process_id_b6057bd2 ON public.products_release USING btree (process_id);
 8   DROP INDEX public.products_release_process_id_b6057bd2;
       public         postgres    false    248            �           1259    431415 !   products_release_unit_id_9b704b61    INDEX     i   CREATE INDEX products_release_unit_id_9b704b61 ON public.products_release USING btree (release_unit_id);
 5   DROP INDEX public.products_release_unit_id_9b704b61;
       public         postgres    false    248            �           1259    498941 )   products_resource_fossil_fuel_id_92a748e4    INDEX     q   CREATE INDEX products_resource_fossil_fuel_id_92a748e4 ON public.products_resource USING btree (fossil_fuel_id);
 =   DROP INDEX public.products_resource_fossil_fuel_id_92a748e4;
       public         postgres    false    250            �           1259    498947 &   products_resource_land_use_id_654f1405    INDEX     k   CREATE INDEX products_resource_land_use_id_654f1405 ON public.products_resource USING btree (land_use_id);
 :   DROP INDEX public.products_resource_land_use_id_654f1405;
       public         postgres    false    250            �           1259    431416 #   products_resource_media_id_32c6a16d    INDEX     n   CREATE INDEX products_resource_media_id_32c6a16d ON public.products_resource USING btree (resource_media_id);
 7   DROP INDEX public.products_resource_media_id_32c6a16d;
       public         postgres    false    250            �           1259    431417 "   products_resource_name_id_2f094a90    INDEX     m   CREATE INDEX products_resource_name_id_2f094a90 ON public.products_resource USING btree (substance_type_id);
 6   DROP INDEX public.products_resource_name_id_2f094a90;
       public         postgres    false    250            �           1259    431418 %   products_resource_process_id_3c31f31b    INDEX     i   CREATE INDEX products_resource_process_id_3c31f31b ON public.products_resource USING btree (process_id);
 9   DROP INDEX public.products_resource_process_id_3c31f31b;
       public         postgres    false    250            �           1259    431419 "   products_resource_unit_id_cb10100f    INDEX     l   CREATE INDEX products_resource_unit_id_cb10100f ON public.products_resource USING btree (resource_unit_id);
 6   DROP INDEX public.products_resource_unit_id_cb10100f;
       public         postgres    false    250            �           1259    498953 '   products_resource_water_use_id_52635346    INDEX     m   CREATE INDEX products_resource_water_use_id_52635346 ON public.products_resource USING btree (water_use_id);
 ;   DROP INDEX public.products_resource_water_use_id_52635346;
       public         postgres    false    250            �           1259    431420 0   products_substancetypeunit_substance_id_94c6969a    INDEX        CREATE INDEX products_substancetypeunit_substance_id_94c6969a ON public.products_substancetypeunit USING btree (substance_id);
 D   DROP INDEX public.products_substancetypeunit_substance_id_94c6969a;
       public         postgres    false    254            �           1259    431421 +   products_substancetypeunit_unit_id_68379417    INDEX     u   CREATE INDEX products_substancetypeunit_unit_id_68379417 ON public.products_substancetypeunit USING btree (unit_id);
 ?   DROP INDEX public.products_substancetypeunit_unit_id_68379417;
       public         postgres    false    254                       1259    431422 !   support_priority_user_id_324b092c    INDEX     a   CREATE INDEX support_priority_user_id_324b092c ON public.support_priority USING btree (user_id);
 5   DROP INDEX public.support_priority_user_id_324b092c;
       public         postgres    false    260                       1259    431423 $   support_support_priority_id_d8bed132    INDEX     g   CREATE INDEX support_support_priority_id_d8bed132 ON public.support_support USING btree (priority_id);
 8   DROP INDEX public.support_support_priority_id_d8bed132;
       public         postgres    false    262                       1259    431424 (   support_support_support_type_id_7bc5a55b    INDEX     o   CREATE INDEX support_support_support_type_id_7bc5a55b ON public.support_support USING btree (support_type_id);
 <   DROP INDEX public.support_support_support_type_id_7bc5a55b;
       public         postgres    false    262            	           1259    431425     support_support_user_id_92b766a7    INDEX     _   CREATE INDEX support_support_user_id_92b766a7 ON public.support_support USING btree (user_id);
 4   DROP INDEX public.support_support_user_id_92b766a7;
       public         postgres    false    262                       1259    431426 $   support_supporttype_user_id_9ab29626    INDEX     g   CREATE INDEX support_supporttype_user_id_9ab29626 ON public.support_supporttype USING btree (user_id);
 8   DROP INDEX public.support_supporttype_user_id_9ab29626;
       public         postgres    false    264                       1259    431427 !   teams_team_created_by_id_4d452be8    INDEX     a   CREATE INDEX teams_team_created_by_id_4d452be8 ON public.teams_team USING btree (created_by_id);
 5   DROP INDEX public.teams_team_created_by_id_4d452be8;
       public         postgres    false    266                       1259    431428 '   teams_team_last_modified_by_id_d25361ee    INDEX     m   CREATE INDEX teams_team_last_modified_by_id_d25361ee ON public.teams_team USING btree (last_modified_by_id);
 ;   DROP INDEX public.teams_team_last_modified_by_id_d25361ee;
       public         postgres    false    266                       1259    431429    teams_team_name_c519f9ad    INDEX     O   CREATE INDEX teams_team_name_c519f9ad ON public.teams_team USING btree (name);
 ,   DROP INDEX public.teams_team_name_c519f9ad;
       public         postgres    false    266                       1259    431430    teams_team_name_c519f9ad_like    INDEX     h   CREATE INDEX teams_team_name_c519f9ad_like ON public.teams_team USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.teams_team_name_c519f9ad_like;
       public         postgres    false    266                       1259    431431 '   teams_teammembership_member_id_5d9958f7    INDEX     m   CREATE INDEX teams_teammembership_member_id_5d9958f7 ON public.teams_teammembership USING btree (member_id);
 ;   DROP INDEX public.teams_teammembership_member_id_5d9958f7;
       public         postgres    false    268                       1259    431432 %   teams_teammembership_team_id_2ee7a456    INDEX     i   CREATE INDEX teams_teammembership_team_id_2ee7a456 ON public.teams_teammembership USING btree (team_id);
 9   DROP INDEX public.teams_teammembership_team_id_2ee7a456;
       public         postgres    false    268                       2606    431433 H   accounts_state accounts_state_country_id_39e7b64f_fk_accounts_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_state
    ADD CONSTRAINT accounts_state_country_id_39e7b64f_fk_accounts_country_id FOREIGN KEY (country_id) REFERENCES public.accounts_country(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.accounts_state DROP CONSTRAINT accounts_state_country_id_39e7b64f_fk_accounts_country_id;
       public       postgres    false    2951    196    202                       2606    431438 T   accounts_userprofile accounts_userprofile_country_id_ace726da_fk_accounts_country_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_country_id_ace726da_fk_accounts_country_id FOREIGN KEY (country_id) REFERENCES public.accounts_country(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.accounts_userprofile DROP CONSTRAINT accounts_userprofile_country_id_ace726da_fk_accounts_country_id;
       public       postgres    false    2951    204    196                       2606    431443 N   accounts_userprofile accounts_userprofile_role_id_43fb6111_fk_accounts_role_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_role_id_43fb6111_fk_accounts_role_id FOREIGN KEY (role_id) REFERENCES public.accounts_role(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.accounts_userprofile DROP CONSTRAINT accounts_userprofile_role_id_43fb6111_fk_accounts_role_id;
       public       postgres    false    2953    204    198                       2606    431448 R   accounts_userprofile accounts_userprofile_sector_id_a623e498_fk_accounts_sector_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_sector_id_a623e498_fk_accounts_sector_id FOREIGN KEY (sector_id) REFERENCES public.accounts_sector(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.accounts_userprofile DROP CONSTRAINT accounts_userprofile_sector_id_a623e498_fk_accounts_sector_id;
       public       postgres    false    204    2955    200                       2606    431453 P   accounts_userprofile accounts_userprofile_state_id_305ae9e2_fk_accounts_state_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_state_id_305ae9e2_fk_accounts_state_id FOREIGN KEY (state_id) REFERENCES public.accounts_state(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.accounts_userprofile DROP CONSTRAINT accounts_userprofile_state_id_305ae9e2_fk_accounts_state_id;
       public       postgres    false    204    202    2958                        2606    431458 J   accounts_userprofile accounts_userprofile_user_id_92240672_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.accounts_userprofile
    ADD CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.accounts_userprofile DROP CONSTRAINT accounts_userprofile_user_id_92240672_fk_auth_user_id;
       public       postgres    false    2984    212    204            !           2606    431463 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    208    210    2982            "           2606    431468 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    2971    206    208            #           2606    431473 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    3021    230    210            $           2606    431478 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    2971    206    213            %           2606    431483 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    212    213    2984            &           2606    431488 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    2982    210    216            '           2606    431493 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    212    216    2984            (           2606    431498 O   chemicals_chemical chemicals_chemical_ecotox_id_19b0441f_fk_chemicals_ecotox_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chemicals_chemical
    ADD CONSTRAINT chemicals_chemical_ecotox_id_19b0441f_fk_chemicals_ecotox_id FOREIGN KEY (ecotox_id) REFERENCES public.chemicals_ecotox(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.chemicals_chemical DROP CONSTRAINT chemicals_chemical_ecotox_id_19b0441f_fk_chemicals_ecotox_id;
       public       postgres    false    220    218    3007            )           2606    431503 K   chemicals_chemical chemicals_chemical_hhcf_id_2e18dd96_fk_chemicals_hhcf_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chemicals_chemical
    ADD CONSTRAINT chemicals_chemical_hhcf_id_2e18dd96_fk_chemicals_hhcf_id FOREIGN KEY (hhcf_id) REFERENCES public.chemicals_hhcf(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.chemicals_chemical DROP CONSTRAINT chemicals_chemical_hhcf_id_2e18dd96_fk_chemicals_hhcf_id;
       public       postgres    false    3011    218    224            *           2606    431508 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    228    3021    230            +           2606    431513 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    228    2984    212            ,           2606    431518 J   products_lifecyclestage products_lifecyclest_name_id_2ef4124c_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_lifecyclestage
    ADD CONSTRAINT products_lifecyclest_name_id_2ef4124c_fk_products_ FOREIGN KEY (name_id) REFERENCES public.products_lifecyclestagename(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.products_lifecyclestage DROP CONSTRAINT products_lifecyclest_name_id_2ef4124c_fk_products_;
       public       postgres    false    3033    237    235            -           2606    431523 M   products_lifecyclestage products_lifecyclest_product_id_382426d6_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_lifecyclestage
    ADD CONSTRAINT products_lifecyclest_product_id_382426d6_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.products_lifecyclestage DROP CONSTRAINT products_lifecyclest_product_id_382426d6_fk_products_;
       public       postgres    false    235    3047    246            .           2606    431528 C   products_location products_location_parent_id_029c1fa5_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_location
    ADD CONSTRAINT products_location_parent_id_029c1fa5_fk_products_ FOREIGN KEY (parent_id) REFERENCES public.products_location(geogid) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.products_location DROP CONSTRAINT products_location_parent_id_029c1fa5_fk_products_;
       public       postgres    false    239    3036    239            /           2606    431533 I   products_process products_process_lifecyclestage_id_dd49058c_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_process
    ADD CONSTRAINT products_process_lifecyclestage_id_dd49058c_fk_products_ FOREIGN KEY (lifecyclestage_id) REFERENCES public.products_lifecyclestage(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.products_process DROP CONSTRAINT products_process_lifecyclestage_id_dd49058c_fk_products_;
       public       postgres    false    242    3030    235            0           2606    431538 C   products_process products_process_location_id_0e0c78b9_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_process
    ADD CONSTRAINT products_process_location_id_0e0c78b9_fk_products_ FOREIGN KEY (location_id) REFERENCES public.products_location(geogid) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.products_process DROP CONSTRAINT products_process_location_id_0e0c78b9_fk_products_;
       public       postgres    false    239    242    3036            1           2606    431543 M   products_process products_process_name_id_aed64467_fk_products_processname_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_process
    ADD CONSTRAINT products_process_name_id_aed64467_fk_products_processname_id FOREIGN KEY (name_id) REFERENCES public.products_processname(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.products_process DROP CONSTRAINT products_process_name_id_aed64467_fk_products_processname_id;
       public       postgres    false    242    3045    244            2           2606    431548 L   products_product products_product_project_id_071d610f_fk_projects_project_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_project_id_071d610f_fk_projects_project_id FOREIGN KEY (project_id) REFERENCES public.projects_project(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.products_product DROP CONSTRAINT products_product_project_id_071d610f_fk_projects_project_id;
       public       postgres    false    3071    256    246            3           2606    431553 O   products_release products_release_chemical_id_08fc00af_fk_chemicals_chemical_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_release
    ADD CONSTRAINT products_release_chemical_id_08fc00af_fk_chemicals_chemical_id FOREIGN KEY (chemical_id) REFERENCES public.chemicals_chemical(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.products_release DROP CONSTRAINT products_release_chemical_id_08fc00af_fk_chemicals_chemical_id;
       public       postgres    false    248    3005    218            4           2606    431558 L   products_release products_release_process_id_b6057bd2_fk_products_process_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_release
    ADD CONSTRAINT products_release_process_id_b6057bd2_fk_products_process_id FOREIGN KEY (process_id) REFERENCES public.products_process(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.products_release DROP CONSTRAINT products_release_process_id_b6057bd2_fk_products_process_id;
       public       postgres    false    248    242    3043            5           2606    431563 P   products_release products_release_release_media_id_c644e734_fk_products_media_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_release
    ADD CONSTRAINT products_release_release_media_id_c644e734_fk_products_media_id FOREIGN KEY (release_media_id) REFERENCES public.products_media(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.products_release DROP CONSTRAINT products_release_release_media_id_c644e734_fk_products_media_id;
       public       postgres    false    248    3038    240            6           2606    431568 O   products_release products_release_release_unit_id_75ffe272_fk_chemicals_unit_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_release
    ADD CONSTRAINT products_release_release_unit_id_75ffe272_fk_chemicals_unit_id FOREIGN KEY (release_unit_id) REFERENCES public.chemicals_unit(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.products_release DROP CONSTRAINT products_release_release_unit_id_75ffe272_fk_chemicals_unit_id;
       public       postgres    false    248    3013    226            ;           2606    498942 H   products_resource products_resource_fossil_fuel_id_92a748e4_fk_chemicals    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_resource
    ADD CONSTRAINT products_resource_fossil_fuel_id_92a748e4_fk_chemicals FOREIGN KEY (fossil_fuel_id) REFERENCES public.chemicals_fossilfuel(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.products_resource DROP CONSTRAINT products_resource_fossil_fuel_id_92a748e4_fk_chemicals;
       public       postgres    false    250    222    3009            <           2606    498948 O   products_resource products_resource_land_use_id_654f1405_fk_products_landuse_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_resource
    ADD CONSTRAINT products_resource_land_use_id_654f1405_fk_products_landuse_id FOREIGN KEY (land_use_id) REFERENCES public.products_landuse(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.products_resource DROP CONSTRAINT products_resource_land_use_id_654f1405_fk_products_landuse_id;
       public       postgres    false    271    3096    250            7           2606    431573 N   products_resource products_resource_process_id_3c31f31b_fk_products_process_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_resource
    ADD CONSTRAINT products_resource_process_id_3c31f31b_fk_products_process_id FOREIGN KEY (process_id) REFERENCES public.products_process(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.products_resource DROP CONSTRAINT products_resource_process_id_3c31f31b_fk_products_process_id;
       public       postgres    false    242    3043    250            8           2606    431578 K   products_resource products_resource_resource_media_id_efb235fe_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_resource
    ADD CONSTRAINT products_resource_resource_media_id_efb235fe_fk_products_ FOREIGN KEY (resource_media_id) REFERENCES public.products_media(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.products_resource DROP CONSTRAINT products_resource_resource_media_id_efb235fe_fk_products_;
       public       postgres    false    250    3038    240            9           2606    431583 J   products_resource products_resource_resource_unit_id_f55645f1_fk_chemicals    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_resource
    ADD CONSTRAINT products_resource_resource_unit_id_f55645f1_fk_chemicals FOREIGN KEY (resource_unit_id) REFERENCES public.chemicals_unit(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.products_resource DROP CONSTRAINT products_resource_resource_unit_id_f55645f1_fk_chemicals;
       public       postgres    false    226    250    3013            :           2606    431588 K   products_resource products_resource_substance_type_id_e5890870_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_resource
    ADD CONSTRAINT products_resource_substance_type_id_e5890870_fk_products_ FOREIGN KEY (substance_type_id) REFERENCES public.products_substancetype(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.products_resource DROP CONSTRAINT products_resource_substance_type_id_e5890870_fk_products_;
       public       postgres    false    250    252    3065            =           2606    498954 Q   products_resource products_resource_water_use_id_52635346_fk_products_wateruse_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_resource
    ADD CONSTRAINT products_resource_water_use_id_52635346_fk_products_wateruse_id FOREIGN KEY (water_use_id) REFERENCES public.products_wateruse(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.products_resource DROP CONSTRAINT products_resource_water_use_id_52635346_fk_products_wateruse_id;
       public       postgres    false    250    3098    273            >           2606    431593 R   products_substancetypeunit products_substancety_substance_id_94c6969a_fk_products_    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_substancetypeunit
    ADD CONSTRAINT products_substancety_substance_id_94c6969a_fk_products_ FOREIGN KEY (substance_id) REFERENCES public.products_substancetype(id) DEFERRABLE INITIALLY DEFERRED;
 |   ALTER TABLE ONLY public.products_substancetypeunit DROP CONSTRAINT products_substancety_substance_id_94c6969a_fk_products_;
       public       postgres    false    254    252    3065            ?           2606    431598 M   products_substancetypeunit products_substancety_unit_id_68379417_fk_chemicals    FK CONSTRAINT     �   ALTER TABLE ONLY public.products_substancetypeunit
    ADD CONSTRAINT products_substancety_unit_id_68379417_fk_chemicals FOREIGN KEY (unit_id) REFERENCES public.chemicals_unit(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.products_substancetypeunit DROP CONSTRAINT products_substancety_unit_id_68379417_fk_chemicals;
       public       postgres    false    254    226    3013            @           2606    431603 B   support_priority support_priority_user_id_324b092c_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.support_priority
    ADD CONSTRAINT support_priority_user_id_324b092c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.support_priority DROP CONSTRAINT support_priority_user_id_324b092c_fk_auth_user_id;
       public       postgres    false    260    212    2984            A           2606    431608 K   support_support support_support_priority_id_d8bed132_fk_support_priority_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_priority_id_d8bed132_fk_support_priority_id FOREIGN KEY (priority_id) REFERENCES public.support_priority(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.support_support DROP CONSTRAINT support_support_priority_id_d8bed132_fk_support_priority_id;
       public       postgres    false    262    260    3075            B           2606    431613 E   support_support support_support_support_type_id_7bc5a55b_fk_support_s    FK CONSTRAINT     �   ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_support_type_id_7bc5a55b_fk_support_s FOREIGN KEY (support_type_id) REFERENCES public.support_supporttype(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.support_support DROP CONSTRAINT support_support_support_type_id_7bc5a55b_fk_support_s;
       public       postgres    false    262    264    3083            C           2606    431618 @   support_support support_support_user_id_92b766a7_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.support_support
    ADD CONSTRAINT support_support_user_id_92b766a7_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.support_support DROP CONSTRAINT support_support_user_id_92b766a7_fk_auth_user_id;
       public       postgres    false    262    212    2984            D           2606    431623 H   support_supporttype support_supporttype_user_id_9ab29626_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.support_supporttype
    ADD CONSTRAINT support_supporttype_user_id_9ab29626_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.support_supporttype DROP CONSTRAINT support_supporttype_user_id_9ab29626_fk_auth_user_id;
       public       postgres    false    212    264    2984            E           2606    431628 <   teams_team teams_team_created_by_id_4d452be8_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.teams_team
    ADD CONSTRAINT teams_team_created_by_id_4d452be8_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.teams_team DROP CONSTRAINT teams_team_created_by_id_4d452be8_fk_auth_user_id;
       public       postgres    false    212    2984    266            F           2606    431633 B   teams_team teams_team_last_modified_by_id_d25361ee_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.teams_team
    ADD CONSTRAINT teams_team_last_modified_by_id_d25361ee_fk_auth_user_id FOREIGN KEY (last_modified_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.teams_team DROP CONSTRAINT teams_team_last_modified_by_id_d25361ee_fk_auth_user_id;
       public       postgres    false    266    212    2984            G           2606    431638 L   teams_teammembership teams_teammembership_member_id_5d9958f7_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.teams_teammembership
    ADD CONSTRAINT teams_teammembership_member_id_5d9958f7_fk_auth_user_id FOREIGN KEY (member_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.teams_teammembership DROP CONSTRAINT teams_teammembership_member_id_5d9958f7_fk_auth_user_id;
       public       postgres    false    268    212    2984            H           2606    431643 K   teams_teammembership teams_teammembership_team_id_2ee7a456_fk_teams_team_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.teams_teammembership
    ADD CONSTRAINT teams_teammembership_team_id_2ee7a456_fk_teams_team_id FOREIGN KEY (team_id) REFERENCES public.teams_team(id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.teams_teammembership DROP CONSTRAINT teams_teammembership_team_id_2ee7a456_fk_teams_team_id;
       public       postgres    false    3090    268    266            �     x�mZMs۸<O~�n�[�����ђe��G��켤��`
I( )E���A��d�]�*�I3==ӄ���5٪�����L�]�󚪤�G�~��ɇ&ݤ*�4
�����؏�,£�� �m � ���;`s���p=Vyc�2��ă�ץ�|c��V 65�@bS\�,���z�_�L�aj� �R���j��_��^c��<�$�j`=��rQ�z"�I@_ӍK4nȁy0��tù@d�(�*��/��1\G���t*��x�*`:�k�(>k)��i!��B��{4T[����"OQ��u�#�29�b �$U]li(��l6���Vm,�4�(@�i�S�* �
�) ���*��X t@�<5ņ���f��o�Q\�;��2ρ��^����p[�R��G!�M�Ԧ��u�@�&bj0��ܽvg�؃���Fܠ��-���A�(��� ��K.q��!�e��&���o��B��)M�m<��:�k�\k�?[w��+v�B�]�kӸ�I,T����xI�HC�&��w(j-
��B&*�CTw��4�aku=��Ji(d 
2���He��^h*(�n�=D;ks���!�� �/F"Gq�Q�
��n�h��4яC��� �2��"�SA�]�z�I#�4�q���I�(51�D$��v�F[�����2T`���&�҄�Ǭ����!e�.�;4�Ņc#�E��Eڈ��m��s�Q�y���vG#qG�@lj�9	zŁ^m$�f�A@�"E���2`�3h$Fu������V7nufc���#����/�HD0� '��~�e*`� C,zq�������8TYٰ%V�9X��NA�8����8�U*�O���LF�QġQt���ދ�H0-L� �goᗐΘ;��nu�)��[��M�y��n�Ld��Э��M���5����>4�"����n���o+6����
m��XPKju�4NN��Ƃ:��ۡq�Y%=�OY��-B�v�4�^)�AIN*�kE1S$a���h�t@�E�t�Y�O㢴~F�F�C#�h\n��{��3:���ݩt��X��3�>P��_t'r�rԻ�]��w߉������tg�݉<��<�Z���"p'����kӝSy��N�5��@�`��;�D�Zt�׽��6=�@H��gh�]��[�~�-�Z��J��OA�'Bٓ�����4�Mc�W4��%!ҙ�t���p���
ĆM�l�(����o��D��hi"B�����4qZ#��$��ߩ!o����]��;�D�`t�ߣ	JN����UK�P߃2�YJ�,��r��W�G<	 �rX�MD�&�x�+ע�ZI�Z�&��F��&b|J��4@x�S!�I��A���"����b;t����b=����U��u��l]����r���>�����$�)~н(�m(�A��CՉ�EԷ!�=ĺ������WWT�}� br\{�u� b6j���c����K�����U��������Uk�:�^���ި}#�cB�6l����9�SzE`RF��T)�]�n���O��M��=���]�2 d�e<�y۳���G�<��~�x?0���m�3�L�YF4i��j����T���<XΩ�O�ŋv��ij��0i�T���0�CS������i��>��ex*6��l�{y�oh����tZQt4E�c�s:=��t�����͔����3��LH���_���{���#�i�#��̄�M#�4)l��4e�r����LTX��p���
m�F5n���}[�I�	�JO|Gw`�+u^��w&2�rf�ig��V����`|ʌ���U?4�T��	�I����\���\6c����7~�	���u�^��Ub��߸1R������Q�*b�ù�|ƙ�ٝ����2fܮG����E3#�-0s�1,Ș0���=BO2��ٹ��4��8��s劭J��v1�@�\�h�-1"�4ͅ\f,�-��
�O�չ`UƬje`�"�'���}�e��X���g;�?L��S��`Bmb:��Ɲ�h��4V%~>�wBI_YIam�6���!:N��v�f��/|@3����_�梹e��`r�A����IB,3K�[�*0Z��梤3.ix�9�j�$�%cu���۳�-�D
��X��k�(��](� ��.�g������]p�$���`B�L�o]�Ji!�;g��g]h?Uv.�s�:,�/������(�s�1��]�cc�� 
�	�9����M�zX�p�p�i���TR�YB�rV<�مI����q�9���~=B]� �y[��ɹj`dֽ���ɀ䯌lyd0,s�Q,W?E@d#�l��➣:�B(m�Jg���>�X&<�R�±�R��u^v�pW��g��@^�~�J���9����Z��s���.��vNpvϜ��]�}�>�<�/E6���0�ː�-���Y�aj�%�I�s��j�[����*h)�w��k�4e��C����j�[�U�����=�	|�I���R��U�v	TZ�1��R��K�_��"��/��Ӹ���'�w�{��}�Y�+��
.��*
�gV�������G�tD �<��܁�])���إ܎S��h(�q��m�^�p���)87��75eY�6l����HԎ�n�U��~���,>0�:/�E)g\���4(|����Z�J�s%���^Lk��w��(8�/ba^\r8h�"���e��RAWrK+���� ����YX����߯5���'�ژzE�V�zS�y��)X�)(8��+��C���eH�>�[]w��Eq	r䣮3�1�V�Ks	Fye`���"�zR���+�RL;�7��EP�&̲�ԇ}+�i
���ڶ?����O(� �y���J�`�'G����->�o"�g>0�W8�0�Ψ�Wbs4��}I���� 5{�7 } 3�4f*ߡxD��K���ʻؕ�ފ�� 2�!� 	"W8� !�F�#���cM��S�7ʂ���WG��ex%ƅ�a�WG�#���3EX��є�0��H(O�eRs�;��wk�ͨ��LX�2G��d���_\��0k!��o��7�]{-6^^6�*?��b=��Oٿ����Ey�E��[��,/����d��훾����2e؀�6���U��j�X��N��b-XS2k���Q%|��1�����U�,<�=�[��P�2grR��>�Z��d�S{�?�)zZ�)1,�ǅ4R��]�m-�������a3�#����=�Yĵ��u@�;\��YhC�� �̜��:Ό�a����L����B576����n����ѳP��U��7 Zdn]�sU�'��=R�"�Gv��U���,ʫ���~>G�+�Y0�b��v���ReE/b�9T�R֧Q#S��E�p	n�^���h��^DD������F/���"<���t����>�����\�����D/�5�5��QijI者��|�͑�����x���g�I��B!4+��W���b�'�>���p��M������f�HEGM߄����Ӈ��      �   _   x�3��M�KLO�M�+�2�IM���LN�Q(�OK-.���r4\��3�RS����3�j3�K4��9���L8�KJS@��r��d�q��qqq 'F      �   I   x�3���K)-.)��2�tLNLI��L�2�t�/K-��M�+�2�����-(�O�,��s��2��/�H-����� ��      �   z  x�M��n�0��O�'X�?~.Q�BJPخ��.�H��N�e�~'������<��3���ī�O�``aoB;���$$��M)�{}K��$F"*�f�Vɢg$�2V\�mO�D��E���Ar��KY�Oa%�?{2�R�ƪ��̛GE����.����ʪ��+�}���W�Y��~�5�T
�A��"J�t�q����6�!��H�E	j3͙L��O
��Sl��́�����ݱya4Ǔi���<���PZ"���b{��� c9A@�9Q���M����TQ���ȸ� "DCt��Xhs����2�LzjZK��Ȍn:qO?�!��V��@>��4�����	|zkQ��R�O�����Gi��#d�0�Ua�g��{CΓ
#��6��k�	�����`)n]�9�(�`[*��p��[E���n�5�ak��hly)�9vRkw�>D��;j4ƾ4饮�`σ�|L�]ЁE�p0:��(�QvF8)qd#���_ڐ�/�c<7��3;��$mM�4�)N�6��w��p4g}m��� �8K�x_�g�&�\a�S�ˍ�>�wSS�y�1��Z҃�;���C�V$�!V���z�p�DZ�ъvK<�6r�)1v��������=����W�)����F��#([      �   2   x�3�420��54�50Q04�2��2��317531
���Ç�b���� ų�      �      x������ � �      �      x������ � �      �   _  x�}�ے�&���)�)���y�T��<��mye)�y� ���3����H����w����:~��}��]p��wj禯2�u��h(����G��ق�%`�����`k�@-+{��6<��xwU�&����)���*�$�5*��*?�qy�:̿}�kq4��	Z!(�J��U�p�
�g�\��?}h��q@��� >��<��a��O����vm7?�k��Z{|8i!��ֺ
�i�ڋ̂�rX�3®�`l���0��1�킡<�T��U1Ҫu\�����`��^9Ďv��C�� \'D$����)�Y���4�� LF#� P�����0X����qrgܜ������5 �vg���� $��s7G�ܜ��_��f�� c��ґ�Fe. ƃq��1��!�Yls��MU�]���P������ƞ�c�a���pI���_�*|&��?w�^ߘ4�
��Sę�ߊ��S�)#lEA9*b�og��w�WoLm���w����9���͓�`s����	s�Ƭ!X�y�n^���Mھ5��_�4�$��TF�^�����й U(7|k�� �BƸ���A���,�ŭ�}:�]��M0&U�V�3�T�T�S�T�R�iKU��G--o��!�i��:9����Ӌ`Ƶj��m��G��{��(IܛK��8�5�Ngd\�DǵRNz����of�[�����u:�?6�ġ[�����8zk�}x7I�}�)D���������Im4���&�4��$]+�<)j�L���gb��M��6�Xr�U�C�Ѻ�BY��~,�쪊�6��4'A�K�JO'v�Z�(r!0g�ꟸ"5�Z���/T$���*�Dp�QE�F��q�sT"h��q� (�(��PQ��d9DH�_�t���.K��
*t�=�lR�`Q��M�8�Txث�/�,װ⁯���*(S��4hҟ�Q "&�	AQ���' ��a��|�TP����&�i��,'�n���' �0,�����wi���P;������}	j2\��&�Jr�[�`����2N�|�IG��%��\UC�H�4x�3،7�x��ڌW�y��{Tg�0N����=:�N��;����ٞ<���C����A<}S���c�fW�๙�A(.���r]&PIK0Am�n%u���G�Y�ĭN�8nh�+#N/���ʑGα��J������Q&"Ɓ��.D���Bp�6
�-��#Nϯ����Ho�hJYE�Rh��Rk�d����@�s11�kwϟ\�im�fb��4F�nL?i��݈�_74�nL��~us�����;�2�2 
T��aQ�b���E2���������      �   �   x�%��
�@E�3O��]�}�0c*.�P	2+	B�������r6�p�H��Ls~~\c.%����2��û�6]X����������jR�\]����k?Ye� �{�5��Cd�G maڂ�(Ŕ#Iz���gS 'nnYE��J~ROj�u�^��a���`����z�)��4      �      x������ � �      �      x������ � �      �      x���M�$;�-�v���L ����0��gD����G���z7�a�5ݻ0���s)��hY���� U�W�n&��(�t�o_߿�>~~?�⃋׵�������;��o��Nn񓈻oOo?��|~|:�?�����vu����SO���5��T�?�%t9�O'}N1��Q!��\*e�/a���Na��=?���O%��_K�l^��R�>��I�][�:��x�K:�=��x����ɕRj����Gv������ߪ9�m��N:�%�n���o�?_�ҥ�kh��XE�J)x{|�|�K�Rn�ѕ�䇬���\s�g���D.U�����]��G>����k1js�߫���oO�H����?�D��Rm%���T����������������U_�z-^�Y=���j�#�����jb�����h��]�u{&y��C���x�ߴ��/��ch�)��T��1��������>����nq~|��mZ	ů%E%�������~S��.�����M����/.��<���������v�%������8���?$�1�����O���B"��N��������ӟ�?^~b��b��\�q+=�4��K��'4���_�~|��r��q8���0:X���������=P*��������B4�����M��C�0a�k銷����<��O'���~-�mAo���p��TR�&)w�6�������kL���$����ل��(�r��y������g�b�B�ݵY�>�i������'��Z\��-|�����������c����g}"'�� \����2�_z[����)7��nS��
�_���ٝ�!��^G�τ�.hoB"!��K�y-�����-�*�@������V	�[���g��^:�5��K���X\s�i%��@�>����;�	�ܦ��':�@�K���$>>r�Lu/1�F�KH�����\���n�PS�����#ϵ�+[��7���J͢l�)�ʂ���|�;�h�}e4f]B�r1��ň�У��<�k[��iR|�Q�o��D�z�˿���(�7o���-�lh�?�-d:�����p�*����5k����s���U��[�%���h��Bja���r�fh��("8�\��?��O�a@z~5-��1-1�S{�E1��]�?��!@c^b���#�tK؊<+��pو��,�ʇ�����wL�56u�_y?u\8-_#*�"�����~My�d&ԈmIW�BE�@m�����KRAw�ǩ:~P������݁,E�OnI~����h�O٣�)w�L�E�~�*�y�I~A��c��l�Q�`�)ꦰ�8��7���4
g�c�M����'*[
�p�6�?-)�/Ą�?�k� ��0�vJ��`���2:׿�C�V�m�sK��}����Wt�b�ߒt �n�?����X��Q��s�k�"ikt�>a[�*L�0)�Q�w?���d7���7,Yzx^����������r�}h����/U�u/�_�*@`u��y.i_7�o�q���ޢ9�
5r\r���]�Rh-��-���8����P8��8��w{U�<���`�WFw�߭EK;!� _/�y���i���"�����зM��xԭKn�"�G�����>R��?���Tv�
���ƈ��/'����-E�qH���j*������CǲX�s�_�6C`�w	+N�ܣ�׸�`��KI���+au^u�~-EW>š���Q�Jw)eL���'���cǮ:�NYJ���[���C����J�K����׭:��2���۾� R�R�[2W�}+V�-�m��Xk�wF�뾏�vuK��d_��J�K�� �%O�s|�Y���P���a��{����r�x�ތ����g�.N�(�
zT��8Ʉ���G�����	�t�ٗw#"V}�ִ	�����rD�_Z�qv�V�ķ 9u�� �楖�{Gtf��*�,���������+Bh]�����.���;�ն`��Xࢽr��E)�%N�KSM�����|���qKS����*a���g��vR�0}�ZX-����b�����];p�M��$ -.G_��Ċu�r��(�Ÿhm�oi�
�� ��
pt��pڷ���nג���!���1!�
6�<
��$������ƌ��C���q�D]Z_���}l���� �FOoO�;%L��Wk�
��X�7֕v��CZ�����|����D�<���܄���J9���Q"���z�w�ϔ�~���m�p���#��4���+����A� ͷ�ؽ]��Ϯ�� ȉc���*} {a~>��I�'~|_mKg�0�ԵĞ���L���M���<>}����#��*!��S�����u� ���}}z{��wz�q{!ڨ�j~�߸ �]+--ݴ/_8�];�0o*`���������;�hB<v*�-�Vgh)F����#���ds�rS�	��;}�������V��*��i�:����|~�3ɗ�����h�J=wn឴p����s���J�V�P&O����ۯ�'i��k�I��d�^h����d`�nA'�+����Ϗ�7h!Z�#f�D#u�����<}���,����n���|	��>T#s�"�"*	��󷧏�7?�i:fȝ[`#-X��Y;�Ol%��%��*�� r�n�]VQ����t���i�\Ns����sɧ�-�;}�	��>w���^��1���-*��>�}8w�1;���?�����gl�UL��C+�ϵ���o����Pn!�H>��zc�Ӗ�#�p���E���"6ߥs[��P��o�<u m�-�� h��Q>��~�����Ɨނ-~��b9"CC ���QL��`x�P1�*7�@?��x;������v�O����F�:�����o7� �[A�A_:��͡s��$`;���s��X�����k����?_��^���T����I���??޿?iW�=K��<�@_�����}�l3�p��I �F�����9&�J+�p[����T��B�s�xx���C�[�Xƀm2��q'yw���o��V_y6i�u�N=^��E!��鏧7P��i_���H�
�<������0�@��b�||�M�y�XD{��/���]f�$��]�VR AR�KB�8։Z���D����jS_��C]�r�na��A9�����w���n2���p+B�m�H_������ �����ot��*��6�<���@2����O^:�ǔ[(�T�=����~�LW�>���=؜�n��ՂpS;	-��������(��Ж:�P1b,��������j�=0�vn��z@��˨(X^̃fN��-.���"����+<�,�L���ܹ�5�v����݉OW8��(�B[�S�!�+�8�s�p�ٚӲ_w��'�
$����?zG���5.���)$��4�#���no��g'S��W�rFnT����=�=��k��H�~~<�P��rS5-�2��1�]��]��P��[�#�O_���V=�8�Q)��M�[<�)�I���u����zt�Hx��d�%\K���5h���r40w*� ���-4� ����76h�K����y�Oֽϯ��K�l!��/$ԯ����&��r����"��b��Qץ�i�R>���P�6�,�򍴸r�����Jb%x{�!+'��ڹy�"�;ݠ_ﯿd�S2��-�� �\�>s>��J��G�,� \��~�5�S(֊�s��G�����¬k1z�I �q��&��(a9*!�P?�ʽ�k��5�n�&ϝ[!<��G����?��땳�p[���|������rݠ�b*	��y����uM\yު�Bi�>����찛y�`��������J@#(7�$��_1\��_��}z�*���ʣ:�Is0��z��Fn}�#�u#U���[�'/;"ll���ܮ\� ��BYj�6Յ�����I�<�Vn���p�8&�s<%D�-:�:�ٵa�T��sa�K-��ò�����[L!S��~���0���&d��Zen����5�x~    }������|�I�>�	S��;���|��TmB��N�t����DԀK��P�J8�V�#A��
WV��z�:�8On���4B(��@:��hc�=����i*��H*�zm�±�y�}�" �հrM$@�X�ݩ��[�|F�K�rI��'�@�m�U��>��s���f*�{e��Xq)��+	�[o�w����V���h���B�v@}&��:�CX��n~~��z���z�5A@Ȳ��;&T���V�$T'��(�舢�	����ﾼ��y�[P$��`�;`4K��ꉄ��t�xz�nx�� es���-&����D;�Ξ���Y�E�c���TOO��d0&*��J�	Xz�O_���i��������XI�����p}=饧Q���o��I7�X!�"�Ʌ�Ꞅ�d���-�i�rl/Zn4 ����:2�];��H8�����m�B�nA����:fz�����n��I�7b<���B�3��	��i����zw��O��|�P���� 鳞;�r*	r�������n3-� ���p�k����ul�\�)ߍ$����V�G?�y:�z'���Gέ�w?x�f�S�����j�O�i(rLT���ߞ�x�}��j�1�Ȃ�n?��X���͛��Ψ�"���KC�@��F�c�Ə�aq�X9E~i��ǅ:�|ڏ��k��I��S7�d�%�s[���zO�ݤvr��u�%��Jnޏ�@/_
��8	�_�(�o�,왝�_o��c���LCM�.߹! ��Lᙟ�	��h�[�#��ڛls��܂<	 �4/�Xc=�BW�����3�Ġ�����=����%�AG�wڋ�`��
��ū��S��&%r0n!��LP?7��KC�^�7�G�r+%�NB���L- `i���
	���A�A��q���Y�Ji�#���)T*4Z3�XDdІ���pы����i�؈����08t��H��~?�mj���F�O}�\S糨|��V>�p���e#��Γ%hN�QXS�C��+Ͳ�-��GGy.wt�S���P�Iy(YL�������h9u��Uy̥܂	����|���*��L��}�����h��V/���Ƿ�o��^�{[�N��B����$k#��K��H�ǈ���cz=�UԴ�K�G�_�Δ΍�$�pݾ�7��k��*�(GZ�X���\�&o�]��i�-r����s|r�O}���g���:�R	R�&��T�wy�]�KlE/0���jc�e3t�GV(�����[Pz�2*���	��>���w�����N���c�/�?W/�@�WY��3�vH,�J8���O�n?��ƥx.����|PhVV_����1V+7�,�;A��~��j�k綾#-����Ho�X;�5=	5�p��`|��m�@B�؍�ݨ�����7�;��+�Sn�E�B���9��V���<��P_ �	R8���^/X�Aװ|�м�]��g�] ZD���[�t<]��o$�Ӽ� �U�,�\��,��e>'������x_J��10�a�J��-�Vbb�Slnn�n�����EX7���*�o�أ������c�7�!��gA=N�t�:��g�@��ܻu&Ηʭ`���Y��AH<�MLسg/o	?�QĜ-4�
|�����h.ꂀɧ�˧���_́L���+٥u)P���4V���W4_DF�����B�J7�0T���}���xY��k!:�(\i��B��������2?9T#Ͷ(���M�*��n��j��ҵs�i�@����
-����I��&"�?�I@��6T<9�m��V�Z�m]ؽyK�B�j\��<�$���F�������^�~Uqɑ��v��i[�}>4�Q c����dn����`􋑨YS�smw��\9��	�:Vۛj��������i|K^Q�rѸ<���:7��[p��O^\͡i4:�E��%�;߿F����ޞ(Y���Ӹr��4*� �Nv��Ň���-��P;,Y��)>�%Ez���	��i=���d�Kf�˗�.�~[4Ѱݠ]��/��#��u�PCkc_��l�Q�q"AJ�N.����:7�����s,oP9���2ܿ��7���{au?�I�t�krPn�B������q[�c�(w}�Ѧ"m�����CHF[��:����Ҫ��Qw�����\w�,�T>�S+�y>,'� -�`*�>)�<���%����X�?=������A�k���a�ZW@�@o}	tJ�N<��^/������ؠ��X��=�z��|���j����������_q����z�eD�zٮ�	fN�r%�N܈-�$Ћ!�
G�����N	������jh��/{) I�y=ts�@ �ImĒBW��g��coΎ�D����SM���u@4�4.9�6� ��y���ʶ�k@߼m]����G�Z-��>�^n����Z�vnk�7�q.���ވQ�U�\'q�.�?����Q�[h$�� ޱ��W�օ�}E�@#HʉXd�K�r��_;��򋙴���2���R�܌PL^�eN6P!/ni��l���~��z��tn߷��c����x����w����n�ugI�?�.�{E�� �u�[����en����f�ǰ����ʛg�-����=>���/�^��5���[T 9�<޾}�nR"m�- � H��Eׂ����'�s	%��	x��wD,b_n?��V82un��(T`u'�(�I�A����~u��=T�^��&���p��� %�����~�t���:�!�p+$�>q%A����TB���i�_��m&�[�s�B@�W��E:����H@�i�c��{4^��vQ���]�s�Hao��OQ�n�A(��C1G�a|��-"�������� 0҅��g����az�DZ���^���ig���5�����dĔ�kW�*���r�*$���O�h�����^ #^���9��i����tÖC٫��U��ͼrn��W��$�~~�x�N�Y���܀������}}Q�A]�[�#-�/�7��q
�[�'-�����z:���ً�l"܊��~�O�N��ۚ�o͊�Y�f�*71.�p+!� !ˆ��+������j>�`+e$����;�K��F���i�c������]��0B��r����Y�Y�@���=�A4W�w�1= �(��ʵly�O�������6@�w��ޡVƀ>�t�bE�{�����4�.kլF5� ˺}�t�-�]��]������YF�\����k;Jp���2��C�>�`Y�:�S��;ܶJ|&��It���ƭ�3
7ڐ��� y
=�X�I�����}Z(a*��Ov#W�t���*��8���"�a˽S>V��ٹѨ��������Ke�9q�c糄vɼw�-�� -���������p����2����z��b;ѩ-��M'si����K��ʳ����e�ZbOR:7�(���޲}�E�V�������v���ڕW�3�<L��E�p��|�#}�����{���R�W�kM�ML� lZ���v��u��1;ߋʡ�:"�C1r�V >�^�("���� UM���S��*����P�����6�h��j���=0�¨:��7�����WEbr�w�i@	�;�f��xT�yf�-�O��������5p�]}Y�"!AN�Kh��/���v���r��r]+q>ܐ���9D�Q:4��.B�Ë�7������l;^�������U]y���<CƂvZ�r(!���>�h8S��r���Q�2@�U�	k{!��Mb(9 &|;��y�aB3$�p�-i�Uz/���{�6	2��
-��'�Y�#�D�w]/��,��,Z�D�N�鬣�>�Dar�g�7��
�B���i�g� �z-r�#|����A�/`���>��{�En�ay�8;��2�$tst�t���Cv�����g��>�!��"�ܙ.�w���h�� wn��Ŭ�¢�g��Z�\9b�ԏ��q8�b��n��    l}e���[�5i�����T�gm�4����9r�5���O�?w7��6�[�[���p��%Fd�I�R��	-�)O���ȏ?>���b٢�Jp$H�s���s���ʞ����O�v�"�'p	t=���AAy��پ�A���g«�ʭ�H��tz���Ӈ�E ��n����Ɨ|�?�޾cwW�4(��L����!�kdsW�Qz�[)��� ��Y����뷉9wnq�\;�P�vf�i�$_(�/�;������e�<u���;.���;H<�w�~{x�J��S�t�;�?7�F4��$�E��D�A��7N��=�&߹��[böN�0�Ƒ;[�zS�t�;�bia��o??$�*&l���l����D�ë�3V#�-$���u�c�i��z�.��{7DD׹$�� C������n?��]D}��-������~���?mu�s[��P��^5뢪�[@#-t������|��.�D	7'ļ������h˝[(
��L�	�-�>3��p��$�y�uR�����1�X�[x -�����*��"��wn!��vÌq&^�.܂	���]���lR�VB&-�>���|u��;S�w�[I�I����avy叧v��B*	��_u|}�������܊m����?0I��0�V禺Z�J�c�	�bf͝[�#-��I�[.��}7Ɣ[0��B�<��>9�Q���1�ڹ��d:A��un1�L���O�}z|���0죕�Pw�X�����p���b-��s�r��h��|�'(�w�l9�^_#�0P-�G�<w�VR���|%������2�'FVna�Ih#\O��9�7�-¢@nP|��| ��T6�s�s��^��j�x����$��������r�`�H(M��?�t|8���Osh"�	�L�tnE�B�%(�0R��rӍ�&3�έ�DZ��鯃Mϛ���[q�>��%�n�=
������K���
L���'WFH��>K!-|J5��H��a�T:��JZ��B�jY�Ͱ�Q'R���H3S�~�����̖2*�Xq����H�G�B���E���R9��A��:��zA� :�b��� ����}8�*��[y�$u������fF�VnQ�ŷ�xR�n�_��3074�1dtښ�RJ��H ��X�f��Sn�g��d��e��m�BZx�==мׯ���[p%-q�i 7%���1�[P#-1]OX���a@�`E���l�m�n���{s�܂i�=3]�`�{ђ��Qn��(t��C�+��8嗃�؉�A�ŝ5j\'��{�I@r`#v|Ot��%:�`Fu���z ���_zN��H�[H&R6����$ G�r�,#
��6�l%؀�ڹV�m�[��N�a<\��HK��F����	߉`������k)�����g�-�Q͡5y�b__��^�-Γ:k��}�o��{�0���[�qݷ���w�)��vnEDD$�a6,WZ���H���Xwg��+�ɬ Ц\Nog9�Y̯��ؐ�a��r�.$�멇�����c�[T%-4���8(�uC%U{nʞ-�6�5��E��A|�FJ�w����w���"GQ�V�#A��½q	�R��D����a�P�c�-�^��܂i�w���̎s@�ܢ���ƛ
ZG�J�Y��H ���;����[L&å;�<���0(��f�	���Љnm��\�QI@P����X�E5�»I�1n��z��kK��-�H�B/����7�2�;�V�#A���:*�h�}�[�'�*��ۙz�'��iZn���4nY�hkw�I@�G��+u�e��}�;�*��o���]j̾���2ia�W:�ڌ�ެ+��7F�������.*�~�<�U�V9�
�?�L%P)<��.���r#-����Vau���1 �pmB�:s�~`ە��[�#-�4��[�7"0�
(�HO2�W�S�@�x��"	�x������A �3�z$-�8z��c�ܮ�B����˵��^��Q�x���i!�un�!��,��_���[@!PG7�����b	�W�ە���[9�9m�~n�[S�0����=ߑK'�{TҨ�@���������xF@q�[�w��)-�s��P���=�[��^x��#���_�7����-�A�`�=�ǰ��'*��H0��{�n�S�xe�-T"B�O{c�(�k`���n��P��F���0�blRn�!���iZ����ܹ1�vH.�a�O�j
�s`Xm�ۢ��_0�����(QNc���q;2���=@ ����D���<i����АW�1un���=��������g�E��Q�V�A���1���r�� ���5�?M�iEs�r�g4mh�+s�.u��4���$S��Q֩�[q�q4_�#7�'�0ʷ���rg r�����_v��`�Zt�[0�dA��u8a����<?�r�B�@���}��Vw$T_�M���L�E1�ԉ�f��̊�܂i�C�aV"@4�avn�G�»j�H+�?޺Q�H@h$�޼���m}	~��E�Կ���#�r�a�u��ߙ�4��r0K#v��-�������X8��ˈ豥�
h�%�5g�Ͽ�#�*7	����z[��o�o�[8C�CE�u?��*f����_c t&c�I���:��o��[�Ua$�痿=��jPU�r$���ޓٽ��k6_Av�ʭ�D��<��߭N� ��p���21�̀�����pf�|hV����oZ�)��J��]_���A��nImdlo�V@#-��<������yh�1Qbz.��4[dD��HS�*�a�����D�g�-��S�"�й�1�o�e�é�I~�ֳd�����g4��	�Է�-rXUn0+ �/�N�I�oH@@�Gȝ[�C�g�-͛~Ӽ���\Ukj|�OO�O�����\db3�V�C����?�t�B�)u�ol�t�y�%	���=��:j�>����]�}&J��aˋ�<@�G�+7B��¬x���]M�%�έ$·2`����>���FP*�[A��0�z��! �k��	�xz}����\��Ve�~�L�R���me�I����@y�h!�^":7��|�3�_��&�B޳���({,����_N�߹}�BZ��\nV��q�r=����Y11c%�b�o��H���h+FQ��eu��3z��峄���%@�r�s� :��a0@z>�ڹun1���A���u/��"��O���/�)�Ҙk *�i+�S��[�MO�\�\r�JD��vPFP�ФOz#�9i3�,�_x]r��0�?ԋ��ޙ�e8�	ߋi̝%�tV1����yw}d�}&�C�5��J,,�hm�ń
�;F�9�gY��HIT-U-Kҁ%��\-�ۋp=�ܢ���&6�͔���]�c,1�-�Z�7�o��!�}�p,Bپ�W�T�\I�C:v�¸��5F�ٟ=�:7����A 9)�n�n�#K��q��J��5����E�i�vtt,������D����d}�,�1'�Vܹ˭$�C
Z�����M,^��q	X�$�wO�p|S�rM�[ �@��>ֲ�v:����-��-���4�L?���[$�C��>!��,�un�UH�C��\���	@��xϽ���J��2�;4���ζm���-0� �;����շ�-2��L�������k��S��C��fb'Fq[w�G\��I/z��qm�Zb�XH ���'�D@j�����TG��g��ƍ�p�a�~(����{��{���/�3�]<x
�[����
�N��[��Gj�YEcT������\:�XF����p���޻��+M��-Pr����I�ףؠ6��`�uAM�:yią1
��<��[	�	��5��)�"`<.n��X`�n`X���EV xf�m	w�g���I����8�d��Û�l	�۟�7fr�f*�F�Sn��Δ���Pw����v>���|[�]�,�گ����ӌ
�|�ޘ#�]�"^��[H¹��W�^ Q ��6�    S�|bש��  O��n��"��gT����;�|�����;���"��l3`�0j<���H���m#�Q�����"�E�}�L�lw���F>廟���T��$�zv
�Bb���43ԅ	�t�A!�ȋg�g�Bs��BKv��$C>!���x�F�7�	AȖ�b�F	�
7��h�z���^�X��/K��$��΍V��O��Г���ɚ�z�|��K�:�W�J@������v��0�y>�C�,(P ����x7͞
-7i�v�WZ�5%�4J���r�$��_�^��-��^�V<i(�V�?V�T �_�[��1x�܂$�Âao,4�����j�2��a ����A^����[h�Unk;�BS�\&��oxڻ_O//���.��Xfz�����mv�]�F%K;�c;y�~�f�����钹���s�sߺ
Z����!��w4W��ݞ�i��'���j]�d� �*\q���P._�Kl���81q��-PrM,Y\�%6ep&���P.߶�s��@����6WJ�}����J�����w�{�t��i���t}�ZN[=@������]��H�^l��)�nc�
GZ��QS���ۙ����4%�)��@���=X��4,tn��(/:�>�K��	R��I�>�0�.�����,6���s+&��rs���9�B۬p�$ ˈo���I����م���?a �k7u��^\ΰ���2C	��gX]�w������[�M� Z���C�����������G����~�-�*�j+�PG���^�=,P!un���p�9�>�Ne�?�H��ӫ��i���-:��,������M	�`K��^y�p/�.�f����M��}|M�ұD�c�җ~
�$����s
�Vӳ@�\��GX(y��s��C����y�Wg!��������ߵ�:_;����yk�$]�|股�����%t59s����x�f�=����j%Ai5&���lS�>�����_K(p
h��L7Ĕ�����x�|	"�ikHg�y5ۯ۬Cue�u��v�(�j^�H-<v��U[Wn[��s��������S��燚�2��t;|m�U
�> �1���.�����[!�!���)Eez�	�k�0e.�F��:?�3_�Kw�m�clv�槳@��gO�5�g�^�un�L��c���s4�sno�����Qe��%��H��u�DO���f* �3�������ʭ�H���f�}�7F�Rn������F=��[	��е���~6�6qii� ��gD�����idn�lq��#�����H���HЯ��n��DW�x����M���� ����-��m�g<�Xy�a�s��$ �{m�͋�qo��"	Ȩ��ǉ�������`4���幰W>L�ؼ�;���A���P�rbPn�i��~�K�����Y�)�[CA�
�~Z]�?�͏'��"	�a���w[ܔ��5�q���2��>�uX�'	�Ŧf*h%5���^��Y���j?�! ���Iy��K1
�r�RUh�A�H*��[K�EJ�# �<�o�ܡ�X�>�>ְa�h�x�'�b���i��ҧ㹭�1�r��%�q���Y�%��k1�οe���g��۴��BZ����g4-,���{�VG��E1�T�N���`��O�mB����sx�>�Pkaa��0q#���RzVa��H`԰^XA��Г��iˆw�E�On�"R�2YT�����.�4���	@:�_�aD�ѾzadpΔ�p[�(�m	���J�.@�������ы.�P�U�˔��
y,�	�if`�M	�(�����9��L;��5��^쟛�A�����s��s$�|��q'+�6
�a~0�:ȭw�Y�\GaA���P�́݋1���eq�y��8�\ɣ�A��\܇w$�0��nj'\{|:�x�{� �����t;��1O[�G��:�.��za�|�
h[S�NCǽ�8�[���m����Q��>��8wڹ���!����:�~�����޽�u��0�v�H�-�#�|���sK/�oKҷ�ȡ���	�a$��
%g�L�q:݈Y\���M��PXC!1 `�D�~���x��eM��U?�jb�B�״��coc�K-r�4�(͘U~�ˮ5�~7��+�H�QXI���9��B�+� ja^h�s�8����6��u�3e8:�jaE9�R4 �S,��6�s�<	���+���W���(,(� ��/�o�6
[=�^p����'�,��(3����v��(8��19��t�;�g����<��_Q����$��D��C��2��,#�d�V��A���Or�EE<��,�Q�(v�.��mq��tF���0����.C���C��;��<e� ��r��e����fp� �~�Q�p2×�,"����I/p˓t��5&������+"�&��.(߻}גǠo/��H�9���t�}}{a���0;�|mh�5�QXd&-4B��mc����$��Ic��^�~��b���XZN�C3@CC;acv����e7�**���0�!7�<Sv��Q�'k���4��z�ïp�t~('���A{�[}�-�+q���q�5k����2��D�P�~������ ��{a��BW ��-%?�n/� f��j6�9���͏�esO��UԊ+��bF�Z�N�<�0��'��X32�Ӈ��J�n��*Et�ͱ��IFy��S��c�I���y��zM
�R�����0�<׷����G�E@KY�:<m	�����&��Qq������c�(��?����S�Hg���aB1�hZcw�q�z�����)*�QX���pa0�q�@ǃ�{:��b��rJm:��O�p��lΙ��!A���b?�$��L{���2���7��.���^���y�O��O{i�d�a�2h.��C x�Ӌ�S�JrN�N�� ������(�M��;�^�ߗLe������,C�:͇"KH),X��-�9�����IB��O�q��MJh�^�דD?g,��ka���8����8����HIµ�9����ǡ�ǪǏŔQ���i?C`z����HZx��w��%���Fa���e���ކ�Q`�����M�RX1�1Ŏ�2.��F�(,�٠U�g�o��^T�b��¢��JŴ���ǧ�Yc�my<� �L
UVG(<g O�@|�0�"��v��׋����R�Ǒʕ�.0�����o{?	HH2�K���̛!�	=*�s�m�$�n)�#U��i aJ��+q�Z8"/��b�/5�r������n�j9��6m"-�Lw��#�!���bƹ~7h���^��"4O&�H��^��\`=��^��U��RX��AP�w�_��T�H�W��ޖ0���ul�	ڱT���o�m��n��M����*�PN�3.V���$5�89U1�6�MWe���9�s���yj���/\��#�"w���rw���#%'��t���\JP�:|�z�Z�e�b�0d�97��0{��枪ۈ�q�$����ؿs/&H�G),��i�y��~��e��b���;?]�`v&��*�6���a߳>|�)'c] ZJ����q%�N��.L���p�yZHw�S��i"JIUĺ�'IS�i��ǎ�Դ�Y���b�.	��.{=�� 4���G�Hr�@�LLc-mo�ԻY,AI����Iر03�Xj���Ƀ�^����緧g�	�b�_2[�Ɣ�� �,k��V$���9�5Q��|*I0��f�IH,���¾sS@U[q��bO��l���8���j6����=�>��^X9T����;ܗm/���?�T��̢�f?�ʶ���̾ 9# �I�D�9//�нI�9S�dy�uP����b��.L@�P��l_�7���_�0�?���R�%��U�L����M�v�Q��QZ��}�����)���o瞹`��xmw��fu`i�V��QRX0��~k�5}����epʆ�    $�b�]�o��/%0����o� �I��7f͘F��)��D� ��,
{�J����f?^��R���\�9�������2�����ƌP7f+��mX�7ﴰ&h���-��ts�$ǝ�&{'���T<�����#�<r䙏nI��܄�F:gY�H1�"o�̙���Qۅ���?����,Ӥ{�,��,$�I��$�
t��} ik�������x���d�h�[��2�?/��z����y�Q
Z��n"���d�y�fdp�M�Z0�Rha$ݭ����,��b/�/M�D�#-�9������8B
ӟ�b/�9צ����z(&���o����!�_��s#	D<���̀{�I��Q�iu����x��J�$HJ�M�)�?1:\p.r��ˎK!�EL�}(�)A�f�o\��ꓠLZ�$p�or���K
�>���A���葚:Y̗�o����f�����@uD����kNz���+�#D��&PG'���%���8��X[��ӏ1�`�Σ�%d|�2��N1�R��.5{.RB����P���(�u���@3��71��}����i~��PL&\�.�73\��4��5Y�0a
	�.��z�V�f�sqTD=���5z�f��Fa_���io�/�ZGa1��0|���Z!���B��P��������ZX���Y��سA�PbS-6Z��K��뮄�޷�3�N���(�y&ىP���$��'rr�Z�!H��/�Z�q�|����E1g	�
}LT��)��r�M�4��d��%�Q���2�7f�(f�u���"A΃���#jɌ�Pz�"�WYY,�R��JD���$��ە���5;1/��r��J�v�`�`)^v�RX(ږ�k����t\Y���1�8��������W�yK���Ό=ޛ֨�7'!�pq����'�0�Y���!žb*�E��Q;Y~���Y������|�;2	"����~����QN���}t�q}:���2�T�ws�}X%{�r�K<r�����C�$P<�r���ä9Pߴ�W����#�9�r�$������:�(�2T����ެ�Yǟ|��@��@�qr�(YlJRX0S�@������u[LN)b�)6̻g�q��t"��v��~�V!�j��� h�y�*�F� "�Q��#]����� ���q����Ǭb����>3�@Oy�c
���bm�b���=�m�UZ�w>�h���^Ga:`�fPe���rox�����7�b�X2gI�E�rz���m��I��$O�¦�)�{��_�c�g�@K�ɜ���z�n�FlGF�oV��}/�-Un��<��uK�����GȁU^a�(*{�>s-�q����;,t$*e-�[�7�m��;����Z��r�s0�����o��z�}�F�#>�$�
4x��n�{�nrb�b�tP�2�g��<��1k���k�
JC�fPEzF���W�х�����>��#�0zU$u�崻3��z�R�cL�߅�d������-��76� �7\2Ȑ��dxM9F��LKa_�� %F�������Ha�Uh�)�ֳԓ�?w�#O)��B��"�_�lP]t���DW��;��E`#�����A��Z[y�i5�� v)��p4�1UP��2�>���L�(�)ls����}��� :
�c�h�d�6���n"��I斅��םe�F��Ja1�q=�#��}L0b�`U
�'�z�#LA�XWܢ���FZ�w4����R�ĀR���)�0���t����k��:�s�H���j�۽��?���'��z�HB��SH��ر�f1vT�����V,��Ӡg-nW0���)A� R�AR�W�e��cb�c�5
�a����l�3t��,�),���~n��5Nע�`9k9a5hc���m�-r8]m�$�	 �DG����V9��¢��-������zg��(���U6����2mS�$?!A���=����MЂI��0͐�(9C���m�[U�¥��VH���b�P"�IV��]�$6h)�� 0�v	�X[�J���HZ���oN�1��?xn�I��� -�S�NVj������ʑ�[+fl���B�:ԃ�� ��tPߦ�}���%���M?S��!*�4{'^D�!������� \��	]�G�o��)�5�� H1_�S�͢ ��6v �p��dr���t^h�.�
֍��$āF�
��
M��R�V`X�s�|��׆dΡQX${@���ڜ��}�`1%�(,�y>�w�u|`hT�Jr ��g��ge�&�E3����-T���b����Z��꯵�7/�R�4���E>�i�uP�2yE4����q�G%���b�$��1��D��P*��5ݠ���%�HKa���ȩ��Z��&("�QXI̾c�i�3�wN����KIz��O��t߲X��؏}b:�JJ�";����m��n��q��YJ�X�Ӓ�Š$���i�ܔQH���m;ײ8JHa��ΐ*�''.���e�G5��\|?�X�r-2���u�,�l�hp+�m�?�����4���-�QV+r#�iUƸP˰�>�Ѻ94����8���f�oEM��8f-�����{5��Ha��QD������XD
�b.�[A��&�s�(,�yN�gL�q�44>o�V�آ��Z���酆#��ښ�Cha�L �
�4_���'�RX8��@���A5ܴ�S��Q��/P�9��)0��*��~��+���w�F�ޝ��d/�P1��t�[��9��M/'B�b�'�f�lr!�E2+�,� ����5q��b��L0?m��td8����$�J�#)��2t�wZL�N';�/��~��b�(`,��Y��b��,�����-�+H�[B'� Fa���Jǜ��{[<��d�^q�N�< 1�y�
�2˰����'�y�!$�9��.�30����b���5���lq먅1�54�g�s鳙��^E��UG�ug��UKq2Z�b	�}H��:
�c�J�F����&�1RGaq�+`�'�p(�<C�U�3ZX���p����}�=�F�ot�6��J,|Dq�6�� �Q�%��J�7`Dh����_�o'�-�;�ѡ\y?����d��b;�, �CJ�A��@���r���t�p�ꠥI>��ţCp���}}�%&4�a��֧~z��Q��xʀƾnY�QT�e� �P3�s/���K[;O��B���0#V��Iȫ�;:��c���C�8^��--w�_�?���A�$P�d(Z�M����!D�^j/� ���9l���b����eѷ�o��{�:�fؙ	�R�y�"	��6����Q�C������0��k�bF�K��}T
 APXǐ��Q���w�����P�2g~T�/�0ʟ4c�2D+���]��n�bF��My@A�ƒO�n��97
����+���}}�Faa)�c���o_5�&�C���2��4'��T�~��!��fV�E��=2d�y�I$hi���v~�o��)����B#�
A���y��]G��I�Ѕ���9����t��2�!N�`��H��;C��]wYҎb?������apD(b���`w�E�d�c�D��2�a��S'S�O�~h��,�{9��IZc�O����G�Z�U%0�>��5)Z�!�Ϩی�w�Zط������4n�!���b��kWy�$-�1�z���:�ω����7��r1���u�p��C-J��A3yY�<_RC��GaA�z��e��r�rW��^�rs��xi��~���ЖFa��}�������Ad��^�G�pUw���3ju��ܢ��sJIa{a�Z��7|��Y��|Zc���y!��?-��H(ą�\���mzm�H�3-,�1렀�I�S���M3�΍�
�P}_�^B}�G�����p[�Z8ө���DBB�,+\8��D3v�"�����nz��(��%@2��Sˮ^x@qQ������m�Q��QZ�_o��],e�g��M�h���|��/T�(p    �Fx��X=L#��0#'oUL~�K�2
��"%������w��������UP�):_G�oV�Bܝ*�B���Ӱ�u�ˇN*��Nܺm&) Z�'��JJ����91�ia����l+
�xק
ua��w�5�ωJF!^�x&M(:�ZK���$i�0��($��7�E����5�aP��rH�!���#�8բ����i/l������uj���:��u�����'�>�d��b�m���x�ш<�Y���WL�Z�L��P]�>`�00яb��^w]FHtꫫ�e&��:�[���F\;M��P��Q��㤜����%��W������d�7�<��<�s7m�)N�����$���t�Ӊ`�(ş�@.����h:��d�A�5��k����`Z�a5�t�;�l��16��ȈO'ѕiI�y`��mӷ�i���_e�$��Y|Zۊ �3C��e*�H�ʾ��^��kQ��NN#�z�.֝?ߴS�g�iU��i����������ؿO*^��S��0<T�p�%˺p���Y{�w���6s�d�j��"����.���ѕ�;��Ha�V��Py�PF�o�8���'�@��X�hX�-��&@�TRh�
�;�,�{`4@9�j��y�<��O"��"��L�
�{2�k&A�Q�:���;q����N���r+vV���W7��g�mX�mn�!1�������n��Þ1�b�N��}�DK�h#�����+��L���T������[h�hz�j�����q��.�mĨ�b��k��H��jq�J�*s�����t�������O�>�^�}���K㥩K�qZ��G^�~�TC�ka��w�$�FF9��B9O]���0�[��,(e�����e4�|=	�š�$�u<Ҏ�?~?6��?ﶅ�O:���2���$�(����s3%���sFl=�u�����8�4�A��?M��c�xn�S�tNJ��� [h���s0 7�cdK:�C�;��Q��1iSˮ���(�����$������D�N~�LSW�r#��׺߹��E�N�cG����6�^�ka�	3iM���t���:�?<?�s����/�K	�����f��W�{������֕��d��G���Zئͱ�*z8
�Է�u����`ϔzdD�n�V��wd�MP��(y*;���O�^t�=F ��`ĵ��||��3����4P^�b� j�gw�����:�6����T�d���~z��M��x#���*�y�e�_H�W(Z_�
�a].�K�	*m���_?�bb���˻�]Gq�i��ME�zC��ϟ����Q@�F�K��ͷ�H�N���r�Y��$��M�y��G�t��;�ۅS���T���o7B�� �1{�Ӹ��j�k?��O �
��!���9D�6dd�mO)m��7<rx��"�d��lJ�xi����^8����m�(�Q)�e@�`���Docl�b!M6ݯ� F	^�Q�����<o�jq���TB��o�ﴌ�Eb�^Pz���x�#>�`���/�1�T$#�����k�ZJq��%9*�DS�<8kT��hGEm�b[�Rj,��i$�@U�9^8)jg|�х�_�Y��8}y�xFuD_]c�O�㻏��fzo����ْmOS�����Gq ��=*[��g��s����$�VLUF1����J�l �8H�X�Ą���C*ˡ���S�j8�l���d#����_����>u5��ƚ��lܤ8<��uS�����������8�� 5�gO��z�����A�Q��z^sT�����)�A����<f�E���9��>ψc:�QD��9�������=ߧH�6- �l@P=L�h�ø�a��,�:�k�᫘*fY),�)#����}�س&e�%����o�E���R��S!���l���:>߭r��8�8*�\�y�)�&�D[�lO���$bĿ��5��z�N	�)޼$��}��E�N��,�n�5��%@�תI��}L�d��C�^D��z��%@2�(��\sp��I�X|����ߏ�� �-�R) qd�:b��-�́h�@�!��IPd}��g11��Y�!G��haĹ�2�s����A)F�z�A%02
��yq����I�-PqE������q���Z��S�\<�q���h$�� A"%�)�옄��̝��E�k�YX� ����5�1x�<a 0�w/8uJ"��p�"�_� Z�iؓL�C��F!�4Z����Ҳ�)Kq�qqz�ڹ+�~�����wE�J�V��j�7��Q�;a:��.������	b�޹�ٞ���;�8��q��p�f8Vw�zhq@�;Q񴍣\U�	��[��=^ďd�A+y'���(C�$jq%g4�?oi�����H@���k�1�ar�HՔ6kV������0VG�m ��)�� ��e�k[H�-sY� C�	r L��#A#���~G�xQH��z���t�Z���y�2a��ċ"�v���ՌYj�6�;�k�#�z*�{��R���y�}	j������O{�=���C�������*׍����H�v^�"���xJ������o�Wi!���b&�Z�g��u�~-	Ǧ�/&�o���wJ�Z�:ԫp���č���3�K�$-,,(#̝n��E���Ujӄ�������㔯���8�����9�8�O�8�(,��ƥ��/��(�(�Ɯ���.�%epJ�� *	����	���E����a����/�������9l>���>�G��o���v��Y�0
��oci=�T�� �
����t��:CDp���AR��d��u;P_��u��D
��ʈ�(c��^f��Y-p1�Q;�_#1����E�8��( �ǭ�Q[��R$� l�ta�a믷�>#pM3�2
#�gr�_�\��
eu���0�jߨ���)�!��[��I�Jl��8���(�DLB�iqQ�-��9֫�h4�.�� C����؎K�CF�� Y���&l�9�����g/[-, )#��&$��u�K#kq��ɍȘi�U����c��]ZB�h1K����4T�%�ډu���ס>���8<��p��)�L�2 ���� �+u���_wI���k:Z�G97.�N�-�;�d��=�����Qz��d}�!V�^��!	�������ۙ��Y?�1x���(���BӨ������k��Ϳ�{����ل-4��A�{��]��ő_+%+���u�j�fJ�<�/����.�C(xj�0u����8�iqx/��0�.`��-�~d�E��<��{�� M��T��h��X���W�ʐ�X���KK=��k�=�C��l!�b!T-ϓ���Os�	s4�P�TL���p�F��A4A��#^��*@��^��zz�SwX!��:���W�,�y���.�W����y��x��/�=�}Z�v�+��?D����)�]�9���^�ۅ�-���N��m���`w0{$��Z�N�^�ګ �Fq��}�Z^¸�9��(X��R�K���.�<�Q�=ߣ�ǑK(<�qe^��髈w����?�L$�r��CW��R�|Ҧ�b����ĎLU/EF�5`�I��g:ͭ{��>T��M�Ξ�� �2���Isz5�6L~�����/>���7�V�:֫�?�{)3��b��ݩ��_�����S�S��8E����}��"A���R�^KEG2�x}GX-�ߵ���D��0bť�b��}0×�U���QL>�'6r�����#�8�j1�<��/�*��膞�P	Y)L��T=��*���6]����>�s��$�%W7��Ki������Mh�	����X�o�T��=�a���L"��{��t�K�sd�N��$�.Z�B���v�'X�[L )6)�����z�?�r�.1z�6|r��Q�Z�5-b��������Wx_���>�ȴ0Js���qk�&f`�k�H2LF�IhaƐTt�)����ǱIΟvZg?]A�@.6�0�����1�=t��H�Wq%�b/5���x2���k��u�5���Z�[=��e��4U��� 8    )������rcr���v�8�jq@VaDn�(~�Z�OU4�r�>����S��-�z{��Fa�D"�{����l5Q��X:3Ǭ�s�(/@�E�s������*�Q�b�����a��=�Z��z�Oo`��e�@b���³�"�)+2h/�#v�H��T��g
4iq ��1�OŨ����ϗ�ɏeq���Ss6q\��������᳜hq)��B���^�5�1��Q0b�Ĵ��9�4;{��?��� I��TFw����FΚ"l��s��r�1����늊[�O�~@�\�H�>K�`-b�dK]u�d�^��XSz��z�@��\�M�9�Sy�x��Bcu�Xʨ���i
.)�|�A?pYr�hq&F+�m��d�)�����8���F�E���:�dY7kq�����6����P�j�����㭣h����Ŧ��؈nõFc���l֊����ը��j�:p}���0�@-���2��c�K�F+�r�b?Pa�qK�%C�N0<Obꄞ0�u����k �ӝ�'#	��W�n/�o�ow��7�Z�hG/���r���&,B1X��r (i����v>�>��!c��K������u�k�L��/$�iq��=�j�9��Ind-8�AQ�|���ޒV�i�ٯ����{X�QDWa�N�;����-˪(�xSѫ������������K��C�$���z��ˣ(��V� ��C�!������������#V����}DݬSq�_W1*[�_�v��Zdʖ��B�{�ѳ�aK�Zq���WQ��_��0����������rG�,���
�8���{��p�!l� 7@jK����q�="��*Z�i>�ڽ�����AW�h�1���y|���UAf�}��(.��c>=~~������(=�o�Z�[���r4�Ȥ$�;O�+8�ch�<��Ӏ1���B�ޫ��Z<F�1�p
�ϑ��fGÎZ^O�����b3[����Є�e���p���`7/��"ID���D\�(���Q
N��`�״��9�;��x(8	Nd�<�5���k�B�m@��m0����sk�\�"��vfg����{��1(8Π�S9Y~��O3�Q��
HtZ��o�4�a�<�)q5�	�6�FYi�"X_'�����w`��D��� '�=4��E�ӖN/����p�e57�Ob�)����	�]h�(O�m$��bTQp�@F<������'?��Pǈ4`$s��mKW���-�bd����H47Q�g�o�W3�f]���|d���[��ۤ���N��@k=M�o����ą���sņ֖e}�����۶�6vM�H��H?qV`�u]���B
��in�<}}z�y�o��a�dFH0F����@����RE��9����b�Iaf��$�{ێ���Ysv�_������@V<=������;��1s1��H�$=Y� wߎ"s�Pp2�l4��Z�ڼ�{�;�
N#�@��>��X�t���`�T��W����	�=�Z�)��ו$��k�j��E�6��҅ ����f}�0�;
V�*+8�Ns�%#���kXB�t2(�(,��t,q�؆�ʍ+��)<�fHS��ޱ�G+8g�h��R=��Ql�*8'�h�2<�5�"�+"8'�h}5���)&<�{S#V&
�����8ҽ�N�
��15��Eǚ�Bܵpm�vWG�x}b����=J��N��@������6٨)�N��M�R���ƒ����2G���]N/H��ogC�/�#��G��Gil�$�Q8� hfm۶���LȀ��[�q�񴅝��bgؖ��40o�ƛĞе(8�h���a�<y2�Ư�g��W���BA��~;%ۉ�����ΰ�2���)��d����`����X�ot����aM�iWh����B�pT�1�L���xZ�f������D���Ȓ?_t�Ih��
GvW6Ût�%�2� ��*�Qf!��П�k�(��[>#�-ι���}����Z��Z$�L�zɧ��h	U�8�Ds�y��e��푀\{�424�ٞ��xB}�3��׺��ꖰ-0�^����D�n�}ETpWÅ6�$N���ױ�};?mE�+��r�6����-��v}Edb��:�
�l�����F��Is�(�  �e�1A��/=����������׷�7�6Hz F��xk�u'ܾ�}���s+!��V���h�U�y���性
�6��Hz3:�%agGa*�M��X��B�9 �����FaMHFĬ�T��T�֚�U\� wc*�sO~U���<77�р�חpt�K�Q�����d	��������ޠۻ���yz��F��D���[�e~<����c�r눜�������Ef���'�C��𠲂�q��U�][2`L���86�g
N�{/h�2�}wK;!ic����],J�<
h#|Aq�do6��;2�+��Z�RN6�8.Md���4'�K@�\&�斍YX�	�\i@nVf+i��t�
�Ν74եogV����Ya߈j�s �_w�D(�;��Y�Y��o���B�����,/R�[���ܰ_Ҁ���ʊ{����8�\y$�L�fbD�zn	�u���z��:�[�(J`�����Ԕl�]����vވ���O@r,܏ �.�uWut����ЀXy����n�À��qh���l��lq��s�I��E���o+$��Y)���,X�p�={X��B��%�(�e.m�"S��Z�o�r�p�*˚�ikk��O��k�'����h�I���Ocҭ�H��D�qd��nA���-�aI�A2�
"�>�B�9o䰘�-i�q<�W��ɋp�īI�n��4�ۨ�o�=7MPyғQ.��}�#��/�p��g�,#��~��ӣ�1�Rp�J���d���a��Rb�G�m4�vf`ٕ�G�ǜ�Z^m��	���<��8��N�<?�c���W8^KR���:�)-v��{l�#/4 k긇�w�a��2{�#�F/����v����QQG�,J�~}��F>�y�I�q8v���S<�(:���
N+���МM����{��P8�Yh�YO�<���7�����h�	���!��,��X���]��#<���jo���`gۜؓ�w������xv��8�(��@`���;�/o�{3��s���$H�g<�u��3��f�x/��c�N��a���cy=���DwܙG3̉����"n����B��;[)���:[v�s)*�/K4�2���Z!_�UP�Q2(E&ï���F�)8
7��
s=}���a�Q�	W��s0`���j����h�8mt^���3m�a¤���M�%c��^���]
G��:����15�K��C����	ʺƢ;�R0b+8R�I����o#���r�q'CG�R�����[.L����A[*�d���?�t:�Pp�L�����N���J��J=��ya]b`���Q�w��q�[/�즲-i���҉E�)��|2o��?m��Oe���F��"��W�*8^���k��p�����U	�Ԫ�E��;*���ҷ��X5����\k����h��ۧ-�L���1p�H2\܌��Nb�ҧ.�����5�΂*�'ӀS��A
��%�N��ji]4� ��ҕ82hDr����8�P���뷟^4�V�S�?���M����)��f��A���0K�O�������×ǷO��.� k0���T���#|2�-�lS��H��|^�c���1���x���Dxib���zh�pCl���=[�l����A�kqNgA!d�0���ӚM�o�
���He����������=���}�����e��V�܀Z�{nʭv����&��F�5�o��� w�tԡy6�H�����^+��)8R���=Y,�{�O�F��#�Q�M��L� �|YHX8r�p1Β��,�Q�-C�bN5MN��ʏ������CS��ņQ�	��Fhؾ�d2p����jL    �⶘rХ�0p*�*�R� 5>��r��i@+'����,����c�)����@�<��9p��4�|;=���������p�X��H]+R�yZ�\���`���N��ܰ8ѫ܉��`fhp�J�2Jpw��8�e)~�Oz=>|�����Ezݼ&�Ŧ� ���18t-K���3������E����dQ�̐��.�n� V�~ET��뭽4`�0��#��4
��"�� G��.��O#U���ۻ�r+��'�S�4���@����/z�'�Ǔ��f���ǔA^G�뵂�N/�j��?7b�n�x��6�p��\#N�>���v�So��c2c���_��-�HZ�ܰ�E��7D��j+8�B^8-ә����� �������J϶\Ͼ*�� �A�Zׂ��_i/��c$02������^�]�WQ�z�����t�Y[� ǡ�IzF��'b�p�G��8�?�������O�L�|hIK���>8k׽pD����mbA���ɧ�W/^M�����	�-��\�tYS8�)�a�\���+#K'h O�g��ѩc)y����8�H���IFLEy�e�i���ԠY�5�A�Q�#�t���hT�NpO#�k���AO�T�'y�+%��BG ZT����Un<�M�u�[8�o�>�E�����n4��iS֚��D�/�C'Z�;':ɖ�Q��)�sޥ����d�j���*G{���c�V~��.��	�e���~=���H��њ~�y�5���C�M7'�2��Q�H�tz�~K���L����-�OQ�Ds�x�o��=��GP�Hqe0�\�8̺���#@�2d�R�qH��TKJ2dd) ���K���Bh�p;��zd��+ҕ�GI/�O�LO�b��(#6`w+T��ܠk��>��2�J��T��,v'#�AG���������:��H	�d�Ζ�o��~so�v[,��8�7�(|�ax�,W��wf�ՐC᷊;��d"��O�7q��y�����֊�&F�e�8k���=��ʈħ�G=�G���4`��5�_��r�ru�>/s�[^�e�8�bஇ.4��@S���)���g����B+�\i��?C<l(;1�F�d:��d.E��>�����#W����Հ���`_���=�U�w��b�V����``�w=[��۹X`��Y��.���UpWh �n:߭��{\������}ih���,� Üf��ۻ+�%��O'i���b��瀬-��	JD8R�ɺ[���ع��v/�}+��>�G�	��X�(=�t�(�a0}�����T�4&�k��s԰�ѼG��k�}C�?��:FA7�;�r�_��k�*1��Z���u��t�f�T�H�����C?�2Ed���Qi�D�(�����L��	҃��L1�;��C&��JI�~M�e����vhp�$�R�\�������O�&�@&s Gf�#�`jPJ�47�'�4>�Z�(��:$.6#Ѯ�|���7�J��a|��T�X̃��K�U�EE�!�y�F��A&�(�g0�� �v(����ɖ��
.Wޙ�����^TU��U|������#B�>I5��e�Ƣ2K����+	�i�"����4D)8v��G�03�l�) ?��#&���/����1^!� ��4�������fY58�BsúՇ���<~������4�a�y8���O(�8�F��[[�y��T���P���Iu�|��?���W>��28r�p���vL��#:�Ne��Jp�_g	y�N"�@"�a�_?�>���Y��j�L��5�� E���\i��s�[��f��������C7��2�q��������{���NM�jаۘ�!�`ߩ�k�FO�'#���$^D�U��N��|�V�Vg7^����e�իa�w�ȫ�[0`߷ū��ӈL_�^F�P�0˄�o�ZW�6f�p2��Q86Nxu�:��qy�?���h@�}�&��{xAw�I��\�۽,}K�DF�<;���n9Dr���0 	�gh�V��|	�v�{5��r�%���°����ݚ?Uf8�n���{�nf1�u�Pf8���m���;�DB�d��xs�feH���.��L�р�Ow������|��>���	G^�����4��܏�)Q�e���0�P�_���O_ߵ�����Ѐ���v�~	��*k�2��hQ��{z�����W��2�Q#��v��6�d�����h����3K��<���1``���[���ۛ��5#���iTh��e��T�2*∫�S��,(4����?�jd65p�FV?�uy%����p%8�N#:pԬl��7M�?��6�h�F68�.j �
�:j��x~����i"���E���Y��?E44�y���@{
әN���U��]��"�A'h eb.��'�N���+��X�C]��~�����E]FWg�h�C�\��6��AdW0p�L'���}>��\��3f4�E�}��P��jޢ,�������8-�ʅ`He஋�zh�K�Ų�����}��9��
/�yѼ<ܗ�4�'���v*8j��A�����1��C��y�Q+���r��L��e��X,*8��憹j�LG�G�����Z(ҿ�}������Wpf�`�v��jӡ	j|Ad�+�X�*�
Ӎ�x�`��l��7s
��N���I^�׷�u��1x��i�,#��ߌ��j;=���wX^m��(4Ш#�<��1�F�lm�r�R��R�i�2�T�U��iญܾY+=��>��d���0BmW�qM��E�
����H�j@��ӷ��-Kg�m��RqJw��*2F8݅��R�]{���7�����ߣp�<)�2����;�d��L���\�sǡs�J4`!����í)����e>*��Mpr�rH6�����,�;F��K�"��\���Q�,��՘�k�P�A\.�I�������b3�W8� ���e�~�2X�k�Ȫel�QD:c���&��5p���ܰBP:�F��n��HMj@]Fn��_8�Bj8�t��0�Q���BqJ�_��$���"x�Gؿ���_�q���Hٖ�o<��o�9� G�4 �ӿ~Ɋ�+�B �B���� ��Ph�PO��x�m[��m)W�]j�9|JY}J蘟x�G�р���&���3&�J��1p�N#d��oy�4��Q���H�j@]��h���8��p��p��@ZY�o}����e<f��0��s��-��P�� w)�X�<�}��G�� �����lC�t�M���ۛ��J��J9=|yގ�e�N�x�<T����?q^J��H$c�h��f�ޏǧ��� ��8v���Ċ�����F����'a�S.�r�Y�p�_O��B�g��H/j@_�wr\	1a�c���A~���J�X&8J�%�$�װh����ga^G���D�gvn%cn��6`���js�k&�]���yϚ�7_�ěyv	^�\ƺ%_]�c��,ru�Rxih���3J�~`-�2�]�ՠ=��{��&���#��66¬z-3�a�E�i�v�C2�䰧�.���K>�>׻��s���:�G��/�bU�4X����5���������=��}:ɄuL��Bmi�޷���� �47��V�u��`K�m�D"D�i���7ي3�0�N2�@2�u�{b�5Κ�3_���s�~�\�!��pH�`�D
D����/2���b@�h�*���|��/3k�8v���)�*{9�3^1�6���_Z���?���_�!�9��482�0��5��Ӄ�t8�B�6���6��Q0Ӛ,�����3�g(�3�[<M�a�o���{�2�a�rP,�	�u3�ﻙ(O.�U�eI�<�(�|nRQj�܅�ע�6���;�y�	���Fm�����e�Z��\��\���8�iK�(CU਍ԾC^G�X:�4
��i�+��txo�?eލFlHmp�u5�-�H(Ж3MFץ�    �~+�;Ν,��[��C�Y6�:�u�H#�Dr����-_M�OÀ����D{v�`_��1��t8u�e@�������rL�p;�B�m��3�	܇ri<����5�'˝��kL\ּj٧W���5Z�ʇp�d}8h��Y�1�0��Z��4eW���+s��N�}��gm$i�q��i��r��������@j98p��׎]�b�X�m)G^h@����cM0�(�Hb���S4PS�.5P���1�P��Q��wP�$�JIo�L� GO4�g��Ǒ4���T��3�ػ�8��+ �Wp�u:�i�5M��}��"�z�Ͳ�����t��� ��n��]G�Y|ܵT�	��C�]o;7#b�D�����������kp��E��4� ����:`-�[n+�aP��^�2ti��-}�n�#�؜P��β���öЅ�7�����8��4�'��|y��/��2���p?>�@*m��>���F�Ҳz0pJ�JywBj-��|;ozE��6��e������o���*�pR�R�4U�^㈄�C��^i@Ƕ��{���:�Yf4h/
N�M�}���9�_Ѱ� G��GC��X���]�2��Vso�R	d�,���:�E*0���ãT�Q�A�t�n慍$_I�����'w�������DPFaҧ���1��.�2�~��ȯo�gH��7pʉ�Y��ǿ����K�p�LVA��O���2�0p�B
s��gԒ�a}#0�ZG�\P����U�����������рڧ�n7��W�`߂dm����ž@F$�eJ��-�Y���.j58^UT��d;����x����ز���9��0	f��I����	4����eݎE�`0��}�v7��:0P��nm�VJ�D�2��%�_��,����/���Tb�]�$ie�\z�Li	)�i X��8�Rr��]p�v��q�
��j�(�N8F���Ę
�����z�2��F7�����w�^�;��%�����4_y���=oaa�Ga��,!�;���RI�!��P+a�^-����u{��d*p2�6����5��
�ߗ(�6�d�۴<�)��}�^dJ:����CѦ�~wrZ�T_�.(ܧY�{{x��h�8Ͼs��sU-��
�� �\����q�wU�*ɇ�m/	֮�LGh�ݯ��2�{��҅�PO��@��,^��U�Z�C_���k4�����v��Jnp�*.�Rx����S�d������G���WV�N�������6�Ǝ���ؓ��*�i�Z�ԗ2p:�:X�m��8�\9}2p��
��fE�����h@ΧǷ��ݾ?}��f)8R���
r���3;/�Ph�0�\�Jh8v����l�~K���sȀ��S�������������䐯ܥu�,2�Ѝ�����P���^Ԁ�����p����qj�h��tǱ�X]e�r�C�q��di��7Hl���av|�4©�l]�pP���q�{��܄Sl����Tpچ08�
d�t�V�{����*4����{*_��>���W��.�zX0	Sp�Fz?���ԢE�0����Қ9,Yɡ�م�o����[D���"�p��bx��%\��
�I��=�B�/s��In:o�T��	�b�i.6^t�̶6��#�Z^
!WcC��?oQ ��_`w8��H���x���2�.��@&4�Q�'�`��sN�Xk��`��P��0�����|�8r��z����˯4 ��
��Z�^��u��d��8�F���I��!���ߋ��4���F�v�.kq���$����hp,8^RS����	�z���.�3R�I2QE2�m�w�����Ni�:�{�V����]I��<c�e[ֶұ��ؑl��_ccT���L�n۪�
�v�(8f���>~>�ۂ_��iPp�BN=���v�#�P:
"8&o5aC^���:bc�р�-��E:`����oR_�S���: D��I[��H�dpx��X��m~7U��
Q�jݑ��`�WC��+����@�o���ؑ�v��^,�P�qt��@1�D�Ի���}/�Z	ǟi���۵^R[��K�]SO�/�@,[�����D�������?Hx���w���w;�E��}KZ�o켣)w5Ы1�V��vW�d���m�e�Bm���!=���,�j��x����.���`K����J��W$B���m��/�0mp��GЀ<�a����5��Zg�(�CKX�e�R�f ����1Ka�w��v�ء�x����Ԃ3��d�XY��8 ȥ݊f��Y&�`��C��R��CV/y�4�t�#0�d��x:si8v��n���ڈx��`_����8�W��T�,��b�Da,���u��N�)S�1���N	�6 K�4��B�Y5Z([ ��r���Lv�2�������� �@	��"���nD(�4\e��ʬz�<; ;���_z� b�ח�>����ҽB�f�z�Az�ˤ@�O��'���ea��Sa�S�uzZ���>��%�O���|��N��|q�bEKt�/��aA```�^TP+|bU�Q�t��Y�ݧ�A"eRQ��+H�׃��������"*\a�V�Bq���$U��j��փ:���w���Z���[�<��*|`�������uy�?��
XaNG�0f��v�{[�;Ƴ�w��;V�0ۃ㐈h������Hb���D���w��d�����s�%h��+����?E�{��3���j���8G,4 ��|�
��`�l=���ն�{+SsS��x��7��i4E��'��5p
|jh��r���?�5��۝��p�G57��9�����2'	�x�]ދ�lS0���/U9N��=i
��rF��h�Cp�U��P�e7�ؕ-Ϙ_��F������h�{E�#GH4 �+5���S�H#h�2��>%���Xru���.��Bf]SQOuw1ȁ]8�J�O�����Z8�"82j��4�0Gn(�m��_�e�Ҙ�`�j��L��� �E������+�%����t��r��k8c����"����0y;ڕ�2 ��>��q�a�bkP�q#��9�V|��	$�5��������eP8�WY @�|񐀁Xaq���Ql!K���`?:�x��z,ױ:Q>��}�_�ϟ�'�D��6pb�bH��{6�Q#ȿ4p�Fb߭�����pQ$��It��#w��vׄ.Kpdg5`/8`6
�O�����?�P�����-4�#&�R i�o��� G4��Sټ��	Ti�N!�@!�v�_O?�ˇ.��q8y�R��H�Pp60p
�
c��u�J���\h@���l�K�&3Ǯ4`�'M����σ�V��8�Fd��o�!�����v���^��0��-j�]���\�8:�J[� '��@,�m���tT=Ѐ�H����akj��F�.-���,�p=5T�2��%���f�M`�8�����3�X�'=�[��Zx�m�(4�kچ-��H(:�vȔĆկ,�D���e��S,;x1p�F:�lm��o�&�\ꀝ½����4���1��58���5������b��}�\P�������v��5�� �h���Io��_���`&�{������V5�r��9�[�3���5%��2��-+�8n�����|^�q��sN��?�kۓ��?�1�;SV0?h�|�A�c����b�+ۺ+�ǣ>�(���h���y���v��r�N�ӈB�L��g� #���Q����r*�GY�8�qp�z�m+�QP�%p�@r\������v�+O� �i�$��:�?�Jcj�?р?���i���6/�P��P���ߛ���:�+�+�u�Vh�VG�:�!��2�1+�m�A�<����N��@�[1��1Cے��.�T��Aܡ�����vA`~�S���0�o��V�
�<� ��U]A])��%!�酋�y	��
_��?�|�W    ��^�-w����=�˨�߼?P
�8�H�4E����n�j65¬�p���yG��}P�#޷^���h�97�85���huwU�J�4ՙ݆2x8v�����i2W�؍�>�ؾ��86o�4c���3�9��^�38(����̏M�M�mG�>���@���yǓ^�t���)(��1���5�� Ǎ4���a"SAY���z�2o��`���u܎���b*�0�]M��B9��鈩�:
�[h��s{�Y���"������*�Ҷ�"3�N��@����6"֭1p|ޘ>�sm�L���BE@��S�4���\���:�6��V��)�:���5��5v���J1�*8�Bzg����:���q�"j��[A��<��#����"�h�6�͊����V�[Dd` �m�z8�Q4�y9�7��4��}2�5�˂�`&���,j`��CZu���S="��qܥTЭ&�z(��ŝp�e��h4�@D���CD�� Pp��h������Ǜ���oHt�N$������
��r��J��B)Ƭ҉�KG�;G
4 �=�����pP-��ЮZk�0B��|N-�5��&C��7l�noJl|ݣw�aj?o���A����(ٶ�Y������ ��)��+Ӳ�"�����Z�W����p�9,L�r�t���Ǯ�H�1fpP�y��B憹I^�����9��9<�7�r��H��&�@�ۤu��o0�]T��i�]�D��T��@�N�%�O�2�x����9_Z�M]oN?ޜ�}���0�LY���\i�NG����qf�J�rX�� "�y��DP�vx{Ljm�ϙ->Ke���BSg�����j�v��O��p$CS:��c���&2e�'��M8�a0�����;-P�Vh Y����DtP[�`�����:�Q��@��c�i_�:`���Wh�p�Mq=��9T�2p�N#t����m�U=mp�&5�.�iG��-��.{�!��L���)p�@r\u�Ǘ���~k��:j��>��d�z[��%
�7P^��U:��H4P�۹��r �ʪ����4���o��?�cɻn+��#��[h��S��L�5���e������e]IT�ܓ�@�'���i��g3q{E�	k��!�Oǖ!A�(i��)�FXy=�=HF�P%�`߇ ������rR}}����i��j�}���r�e�Kɜ�C5V_�%�2�2�L�`+l���Q���΋u����a(x��A|c�/���
�%��#����8���W��?��d�-Å6��CணЀ'�N'�#���~�B[�1+��+�%cg`�������|h�����o��ٴ	w��S�;�O�+��)�{����=K��AK.2�B�5���^���w9)c=�Nb�DpԅT�^�h)�2�¾�e���{��;�g�3��j��$�Ӏ����c���5x�P"�uJ�K)�0�K%��2m�Q����+�*b���tnw)$0'�Li�0 ����D��G��@�����S�4�o����@�Q"��e	� �;���tK?�F(��0'q��`�P֔�P�����:r(�˸+l�p�58�Z�y� ��r{Ǡ�h�	_��8`��t�:���u�5x��~YIT4�5%�*w���j��Mfd̞�����,��؇����J��Jܫ�2@d�]Wp�ip�Irt�+8j�5����Ѭy�ce���R�>?˧c�,S��
Hu_���~�	5�J��a�����a~)�8�F�~2O�|�
�N����9E��58�Q��"#��5��O��>�u���(�X�-�el�
�,8�@��N�&��!p���9���"��\a;���0�Ppj�j�w*_�S�N!�@A�/o����O�tw
�Uh����wD|���]�n��Ra�daH� �N^��Y[�f?���'<��4��,)�%X)` �ąk��1���Rp��W�V�)�ʲ�@G�E��@W��u��#��IV��i�)�����Ԅ�E)Ѐ�Ç\{�W�H�k���L8��u�O8>#,�2p�Dr^�f�%Y*�?)�2��mqǟ�i�U�<�/�$�,��o��\���>(m�_l�l��B�)��*��N�o/�X`ɰp�]㈴ �.2 �Z� ��inp�Ūq��KoҀ���>ʨ<���`;`���gA�4x��c��;UQ8q����/!鑿u�)�F�)��@c�m�)o�t
�[ "$����5��K�8�g����|ZK�2!�N#�@�\���iD�Q�]����V����;.����Up�J���>>�w9��ƪLUd�6pB|$B�F�{����x1�+8n�.�Y��*��Dɻ�᡻���}��v�}j�v�T�gK�����v�4il"(̊徤p(�9�Ƽ����Q��:�Э�5�d` �����t}_c�Y'ߗZ� ��m݌p�������ͨ ̝�%` �����,�S����߶�WZ�4Jk�:/�%8�ߣ�F��Ppl<o!Z�,��)$��N]hb�̼r�%�c���+���5������%˝�G\Od�����^m-$����ww������&*="�������u�愇Ė��ʭ�����ݵ0#�I����S���,��w��������Nc��)���O.�Z'�+@�F	�5���u�����/(pb�؉l����>p�W��v�{l>�=ێ�C�eDݸX �)��5(T§�x$��}�L�Ǌ7��o��a��]l/ާÏ>S6^��c�A�E��CĨ�<�Jc�:�(ċ%x5n�����F���-�tx�z\N��E��H��K�i��W�X�k�ǰ��<�u�6O��!�����E�u�qCЯp�Hf:ݷ9�"�2͑�o���憧}Q��_��,�l8J��X.|=�w#�+�E~􏵢ĩ�r*8�B�z��ϟ2�D�#�!v�x��Ƴb��a�>��Q(}[��m�O�-�J�d�~��e�D���Bh8op�%5�1���{jb�GZh@
��:�R�\�N!�@!��qNq��H���k�lCmy��t�8��zȷ�a��6Pe]'kw���y= ����m~�<��[U�d�T3T��J?��'�W�M�D��j�R�a S�@����9����8�64YT�~�|��v��/�����A���|0q��U݊f�"y��*�7��� jp]N��`�&H�>Oj��7�P�0�VO�(������%���2	���|�z��g����e��A�z'ǋB�g�.�.+o{�US�V���7���#E#De�0� ��q0�/*�ʳ���t�$�^r�4�FX������|�h%p�u��:��]k*1�e��醱Mq"憩�&���Ј�pϡ�@`,
9�A.�iA(ld�1��5y����K����8.#!�����N#�r��U��������*ETK��̮��w��B�����_�2�0n�e��&�H|�[w GZ�#��(����WY�����G�.$Ҁ�s�p�*}�,75р*������`R;�3�eTw9� Vl-�N��@���?0��[C'o�X�,��ᥲ.�@!SqY|�w�r��>�e:|f��~�Klg�>v�,�`�.�bh��2m��7S3�֫	TA�y��*'Y�8��憛s8|�v9�}b
����P�\�[�:�F��F:u,��~	a�c'�Q�Ȧq>���Jm�廬�4+�
���׮�ǴE�1������?�_��dT־��ҀӶ{��<�Uakgi��h�ѯ�|����I����qطʺCfN��� ��Z>���-���RM��i���8a;��q� ���@!�k�m|lHҘ��~_�|n�f�p�u8�z��#��������2�]L�}:zc�Q(���/�p������h�_L�{i��)IW�L�k��X��`ߧ]*ʀ�nz��B�ͬC��1E1�˴��]c    �E��[k�7��jA�e��/�}W[j���-HH4UjהxEh�]kÿ�}�4�ǧۏ����i��d�08
u5Z��� óV5����*�N|��86�~<�Т�o��s�:u����YR����ɺ��Hy��;Ҁ=�r��O����[�Y�l6pz�zYø���[�-^��ਙ�¶��U�y^�cB�������5�]Zg'8cB�ؕ�v�x��׍���h���v\�(&����nW���>�~o��g��sE���2e���`��K:�4�K~�%2I�i��c.4`"w�<wm�p����� ŏ8�@����e����ݖ��V֘���Wp
�
�_�6��JW�
��8r�9�^�M��)3o,a�oZ<�醢4�O�u��ARx�N4�@�&�]��p�����LA�6P6b��Ҁ�Nv�8���%��h4���[n��4����!��$	�O�1z�� Re����in5՝"��@Ւ�t_�m� )����,�a���sr/��`-iY�]�[��@�4�;Z�E���Z"�iW�sZ�Q��)$(�k�5-�L�Hc�D2Dp���.8�B��a^�yBy�Uܺ�*���*�>'��X3�R�m��bW�
j�2�]\��FߍX[fy�[1�	�͡��dٶ��Q-��՟W'*˺!/5��G4���������O�,ݷ�#�"�����Q�0�q"8�����2�#�L9��b�����e=��Uک��v�8��r��Đ�󇽕'$��	���p�m���'���dG.S0,�=U�_�����@�Y���Cn��)N����WT�0p�h �*h�y��WR�S���:�J+��ߕ���m;ɀ섘��+�H.#(E���0�ip��Ȓ(��#c�� �G��4������Z��Ƞ�8�H�)A�}�rNa�̌����c_'劁J��L�Y��3�?��k�:�% �6 ���Bp��Ѐ���9~YF=`�0�)T(���JXݶ��>���Z	��h��Bv����-Y� ;� 'û�6:�i=^�S�`��.M������͟2�j��xɲ&68^
j~�?l�-xK^�gm�1�����	4�Q�Xqi��t�2�8�H���8��8�D�C)�x^E ;�Fz�_��ݤ�~�콏kYOQJ���+4�A�e;a������t���ǌ��~ސ�KH�hp�a�vaZ�u`�����8)${0���D�TQ���X����u�������Mz��&d57<3J�X��H�lc'��@�[>��2+~tE�@'h Ok�t[sh�~j���|F������v��&pe������y, �ap���w�N��N9ɺ��$�pB�N�)4��mj�u+7zB���]i�F��7F���"Gi47\�<����4Laja
�~8�N#
e�;+S��?ޤ��2 �GjQ�.��]�Ml�?+8�B^ض���z]gl9.��)8�@�h�-L>^y+Ҁ�N�$���쬸^��8^�/����oh	Hg�8N�������~�};[U��s�q�c�ю^qd��&u�#U��iİ~�"��N�GT�5p*�*k%Y.TP^���!��($4@�]Wz_7��_'�pa��zٗϞ���������hX���O���������x,
��Ѐ�I���-�&��'��>˺p:!ɝx��@PZ"�ם��ݕ�K���4�H�i�=�~��H�<BNp��I�/A^������j�2׾�6�1tהi�Ǝ�56vM�Ѐ-���clg.�%�����U�	?+��f�C�j47���t��������y|⊎�i�/���+��F�\.���V<��|{�*���//��n�,�Yy�9lI�w�i�
P�v��4���\}�|�_���W�:~�?Y��9�
/ j+�_���?qP Ryrv�j�X�C'".��]P��JY�򩡝�ݔJw���(4Ш�h�u&̶�+~U�6�m��*$�|�r*�\��U5H�c@�(B"\�.+�vK�bDn�}��]�kѪf71<^WW��Xh�-k��W��>��(*$�1#[�iH0�����@f�����	�����Rv�-TH$�i�$k��u2/�		J�ʨ����x]���+#w��Y��_��E�B��g(�M9]W��ge-�2�㍠<ލ���yB;h�_��ղ����Ռ7���Bq�V������ ��]Ď��Q�,���k"�28�����xJߤ�x�Sd�ێp�:�Ns��k������H?�l�*�.p�@%�#:^��Vt��$���X\2(��eCG4����i�LH#+J:^�O����X!�NaE��;р�T�_~Vb�&��YP�q.�N2d�? ���w�@��?첎b:uj访������v�t�R���:�J�v�W�}>�'D�(�N��@�o���H'�n�S�՗w�����e���F�˚bl}�=�P�9�����Ldd���@������8�-�X���B���4ev�����N�>��qB�Яg�����ߗ�����T�[�3_�E��X�`C���}b�ۻui����'�U?e��A�����z;����K`�u-FF�'�v�M�׊I�"[4�2�O ī���������L��:��x'
4Ǳ�'<"�@��ݭ~��T��+�?�\�lB_
_PE'�h ���۷�γcK�б;���c�+м�EZ\�(�@d�;2rrt��cz�Տ
n�[It�#��������ft��oB�F�EH$�%��St��[������}X(I[t���H��H�Nt�_<&�6t�B>"�,�`�f.��z�;�}m3Am>x��@�m���*a������k4���>�>|y��#�Rt�N#|���B�J' ���Հ���x���d�4��?D�ґ�T�>Mn�9�1�6tR�R����d��z�����^S�1#��{*kѓ�i�ȵ���H4��������1�_�IgH[�0]y�v=�a���#g�t��(������v������"���]O���O���f�7���:�F��0��#m؈H�T:��$��7��ChY��1hBI���;�� 7��3�����C���@- ��ǯ���s9o��ڶ�̼�{���<C'h �q&� ���O�]t��J�X��X:�ۮǆ>N�>���@GN4 3l�'��>X����2h҆ߟ>�^�>d:(W����g���d�@�j��C,�SHW�������JE���|��s�Эh��G���j���8ΆF4e��`��p����v�q��iD2_�}�)�UEu��LA��J�Rj[�m$�����?�?ݾ����ߟ�����d4�_�%�;�Gq|M8��{�6�Leu�Y����;L�X^l���FI�7yQb����{o�{�X?����iE�����é��������'6N.+:b����y~�oC�!�3t�BR݆.|<p�d�h�4�=<KC����v^Z�k��U� �T�������$�J����;�=G��Oc[���*j�Zƹ�؁H�%�:�B^XCT��S�{Ɔ�h@�����cU��2��:�H�tz>�v� I�����q�y����ZPA���Z��ڶ�����bFzO,Vt�U��qzD)8|j訕Ԧ�{�>�|ໝJ��`A���~���πP	�}���f���eEwa�FD��S����y�D�o<l��$o(B+V�w�sA��@^�'��G�uTE�4�+��.S��-�.5��_lX�X���Oc��Y'y���#C��p'.p'��ͅ3���!�����,<�<�KM��Gfā��h��vfjp�����64�'hw"�}�}�%��`������KR	)PgE޺V��vW�v\�v\ꔳ^�P�^
ݽ�4i�|�f�og�*)]�����[R;�+�4����ܵ�p�/�[='�aD�q�!���    �^�ܸ>�x	M��݊�'7���wwY�l<�-�T.2��l��H(�]@Cw%���w��u%�Df8� �@湺�<;�` ,g�d�.��\��x�2��ò��+NDI�$nWk�B�.���W�*g�[#X�T����$*$ښ�f�X(1���]��pH�Ln�t���*8p�YcJ�����������?���yt7�޴�Ok������ۿ%&F��j������_5������(GNRKD!��U�����K�D4��w�.	�n<|�|��-����'IA97:I��ҫv�#����H�<�H�%#�}&R���/�4����؈1t�B6�ntf9���$-_�Qy�h�ғ񀪬h�?|���>pw��FYG*5(u���2�>/HS��s��b:�M���yl�)��҂�iŃ,���(I;Ǔ�KF�S5-|�g�|_B��q��` kE���"Ә�p�
%��탆 9Mu8�I��V���v�D>��m�:!�72�7�ސ�b-���	f͞|���6i6s��5"�PGW�@����������o�+��?���8�7���������0Pj� �Ow<(ŋ�q9Qr�Կ�����s
^Zg
aC׶y3���d��=��θ��U�ᑾ�}9=�4I��a�3t������������xq�ݲD��3�X�)D(�i����7�nS?l'��~2Щ%���Ǐ�G�.pw��z����i@-�x�}R���b�w��qk*�k��-4Э'[�������I�+�(�M��"\f�����t�o�tt��(�<�Rd�NE��4�[��*೭Qk���X��^��|c�
p��i?��Y\�xY�Y
�W����g��Y��&�
Ȋ{IDM^[�Tɵ�ǾUtu`x�C>Q��;���A�ȶ��inX��ë�!��v�Vl�W�����a���F!�G�d�aWw�̀�W�Љ�1�5�CP�S�s�c_��R��ҁ�]h��'�ढ़�zGck=:b���lGEksN�6<��*2Y�\aE'�h ׭?_��1W��,솳ε'��A����+[���� �z��B��-s����]���%ܴG(�vi��BM�ż?�=~����������ɺ�e�+:~�?�tҿ+2+�館-���D�yM:��7'�X��˜	�!����[���#����eE��2�e=ò�k�����
,g�>*(2n���+��4-Vd���N��Gؐ]����j4��'��ߞ^��Rs^ѱ:��>���T��P<R�P1�އ��j��D��c��~I%3�ωB0���s���^�t�c;Ć���ᷥxa�(Ew���Q����� Y�v"��ȑd�%���4/:%W�(����g��
,أ�%��[��6y|������Vtr�r,���f?�������'�6͊q����2g�%T��*T( ^�P��P��=/"k����Y�7��Γ|C���֏[���@�Vt��ӈJ���f��2$6&�#7�w9�\O��!}���Wt�������c`VOE�
4`ّ���Ԅ��i��3����|�]�m_ёH2������~���+ӀU����N���0m��c0-H�t�<s *:^���Y�ݜ����)�J�������loB��?H��t�a�J����z:k�a�NţLQs�'���m���+�J+:��*����;���q��St�@s�D������+?�4�:��"x }����o?>>�U������ *�>m�/�G��.+:j���������x�<�����.�G�4i
�k]�)T(4�^~}��f8���h��W��_== ��s?�N�ӈ(O���4B��Yz�I��:Ut��;[6�Ø�K�L%��4h�]�a��r���t����^��^���˯��M��h�S��E�u�X���̴����h@̧�����)ӀTF����ba�:E'Ph P����9:�����ЊN��@�i��m��p1���D��4����T�f�P ��ӊN�ӈZ��jq�c٩��V<�557Lزzf/!"C���JG���Kh����Kq:A��cY��d�n٢a�Ӊ��+Ҁ�\蠆]��y4P�I$��s��5�02B%&Rt�L:��s��13��*:f����+/'��)LA�蘕L���5����d͇Ct�F�:ߞ7^��E��cF�뗭��[���V��Q����rZ#{�C]����|�������������5˭N��]�-���	_����/4��`^��+�Y:��+�Z�=�K�J�R��<�n���h�E��)��}�䜣 ޹ �\�Oj���4��4���{��s���\�C.�8�3_�|)<����/�������N�,+�o�idw�0�	p���U�[��O�]��[�1��(S��+I�AP:)Q?�TS��«�Fn�y�ǔc�G�<ۙ:�e��Y9���g&{T<�C��I�DҨ!v��ioMg�����^Bc�eLe<�k6Vk?�ɳؕN�z��z<=�x=�8]aH��#D��b��>���h7EGK4��NЦs48�SrYѱ3�唯�]YXH�ik��X���C�+:�BYT!d�(o��7�c�n��#W�f�Ơ�����-t�&S):�F���ۿ��o���mh�������s��N��� #�+w�`�J��g�0z~���z�g���d���^d�1<�/jn������~��zc�#�*�ٗgv��F���?v��t.��^��ۇ�b$����}_�������+w9�a�):R�)�0U���9+�舉�|L���5���j�+:�L��ۜ��E�%H�/��\h@F��;	p�."�:�P):�J�6�4�eکKۄ�F�?Nщ6�2Y���xK��M+Μt�S�����:�Ȅ�.�aN�}���!=4R�п�x���Rț�q9����g�"�^FF�k�sq�)O ���P�kɻ����Z���z���?�j��2 䲺���wY��,��������BG|���C%���o����������s�54<���k��&|gޕ�oJ��hx�)���AS
E8�Pued?۩����W��b��6��{�:/��*t�(���'�����@����vrܬV<��X�B'���0Ae�绗O���q'���i��3{_������ǹ�5���)�Q؋�<2���+��:�B�_�����ˊ�h����6�磓pV-�#:�H�t�< �G��yV��Vtr�rق��?�?��~�v��I�<�J��J9a��VC�ݱύ�c�	�f�O�x��aV]+~`>/x\t�A�Q+���M�����'�D_�i4h��1i�uE��iD�Xs�"=m������.+n���Tg 2�a��V�iK8.�ę��؀gԶ��b�h�p�E8�����,��t�����Ά�L��L���%�ڗ�Ɔ�Ƙ):�H��*���������!Ԥ���SO4P�@�����'oP�<�h�x��r����5:�):b������Mw��n@n���S�4Pi�r��;F�X��n�X�,N�gZ�+:Z�Zք�gY#��a�;>�;�G��:V�h�7q<��s�3��	���8�[CG4�Y���=�/�����E�8#~G|�.<9�e�7t�D.��v���2�[$�	�:�L�ba��܆�aQR���F��џOu
B�u=E�����������-7^���4P6_��d�o�F��zE��inpt�J&�mA�.�f,+u��,��+/SpE�b�~��\h ��������Pò�,p�$�*Ex�p��Q����(23u�+�4`�5'���Â
��:�D5� �;���Dy�:�Ls�j?a*3����o�Ҕ�k
P���LՆl���p`�6d���B��Ҁ��R��n����f�0tB�Bȁ�	<F<�:�	��_�N�����;���J!�BP�w�Q����li��kf�Q�7�T{?�.�(n&^    x��Q4t�h���I[:�m����P�N:�@:����p���R��a訉Ԍ��cg�-C��4��+��1�r��C�����.4Ю�_�*j�H�{7��Ti@jW�)�[�).��L��UN���`ߥ�v�Q���A0��v�U��5K21��rc�0�$��+mS�Ų�[+ں�\~��SXh���Ƈ���˝���V��V<��m�g�&���:�H%���w����OEeT�@te��wC'�h ���!􊏣Ċ��#6he:X�t��y������~n�]u�&��N��@���]�q�i�kQ2�[i��	
�-n�������fPs��Љ5����!��Ǔ�Q��y�B��>'�@���JL�ʟ�x�w5������>�u��M'|\�A�k슡�\h�������M���4�k��t^·LT��ʑo��ӌ4�D��d�4tf��U�+IF���B���ΡS�����2��7Ɩ���t#����+b�T
T�.?����=�4a\q���&���"�y��b�Xn]nY�7�)�u5��9�Ͽ~=<?<�pH>��:�M@�8�֏:����6��ψ&Ã�0�YN(�5���a�C���|/����4��{f�tt�b���.�TC�i��NS���^&�O(���H����ۅ��e��\//3t��uFq��{/�u�����?k�?�[��a辣��;���i�~��#�2��4*4P��}�w�=2ቡ�5𰗫�|�%|:�+��raݪo�Q�f��8�Gڢ�e�:�P.2�u�5�v�������膎h@��b^n�e�E���q�#�)�����q���ο?��u<��4�qŽ�4Zl
�0�%�!��t�g�b�`x�o�eb����g������>S��Wt<]�W�*5���F��������l�*�P���ʂ�@*CP�р�:ϯ`��A	'�
�����>�A���J�>�P3��Q6���rR�麆���R���7�tC�#��m�tc����2���N*�@*2��y/֍��׵�f�ԸK�F,�����«,�n����Y��n��@Kp�!JN���D��G�<w�꯷�ʷ�=���Z��]�rz�N�N���;67wC鍝��S�Z{�#p7����_e��ܧAM��<j�g�����id����%�O�Fz��:o&^�ꃿs���-K_*�:�&�U�4t�F�醓��Q��r#7�q�(�V<~CT�oX�$3�l'�C�� &��3������Ƶ;�"�
�t�8�;�qm������ˢ^��d�8�!�-I���p_/ILk�D��B�beE'��*��UN��U7��2�T+�s����6��f�Iw�
oy���3ԑ�E�-�߲V����bU~��^��^C'�[Tl���|}$�
MZ��39�����ٛ-�q,[�ω��S	��Fg��O� (�.@����Y[�{�Z1e��Ւ]?WX+sgF��'���yƅ������J�r(�Pq^C�[�n�P��i���?��2u;�iZ{�* ���ʴ��Dg��ꮒ��_H=�H�V�
����v���#h�%��y,�Pe<}d7̮��Z�8-8������ݝ������V�:
�β�=f103Ck�S �cBK�# �Ç���C���S:
��%FK�n��,�;>�֪ۈ�c�ϵF(�$���'
౑�g���Sb���[�2P������0�6㵟�D'��*�B!̈�8���\b�Ѷ�Gp�`��x����^��l�gWL��T��۲��eāKk��]��������}<߅����CЪ9�m�P�n��4 �K[�sF,h�U��,]GR�U��S���e����<}*���ۣU����q:y�]XA�e("�[E)@���T�I)�L��-��)�=�NH[�� �-ȫeG��]��U[��S}��&be�Z�eW@W�낢�#e/��N?��������_���c	�z0��=z{�j�W5(�s���zï�aM����U|<���7��u}<��D��
�c\|��d�ͺ��Q��Y~���V���_@�c܌72#V����S�!���&��딕���������d�Y쪢0��Â��7vk,��y��ɸ��)�}V,R�H�AD����\��A<+$��Y�D���V��D��� �:`����L�"�V�f
��7�}��'��h?ل��H����I'����Gpio7��T@�'�n��2������(�T�S�(�D�&��M�������P�Jvн=>����2غUOS^g9�$�2^�VQ��fM����ˈ'���ܑ�<ܧ�'���	#w�(�������0�:L�8�l���@����ֽ�s��!�V�Q�g���&Q�_*H��y��!Q�!�|6g�-�nte@�1���[EC��o*-�Q=�=k��~f|����ɖ_qk#�D������@��?޾����z����i�}���U���r�+E��I�����ק{�̂�=ZEf(@f���×��F��j�X����������50�V]��-t��x����oe*1f�
�(��5GOuw���8Z����z�Z}9�R\0���[�Ƒ�{���_O�!�l��
o��*�Hδ�?��qHD�G� �����?>С_�:񬵵[��1�:��#;��)5�޵�N׉V���d����������
}��k���
���.ٟ�]���v�+�WR�~�G�R�6���� Ki�{k��'{��]��l==�`����fٍ�?��Ok�����J�ͱT�N�C��h�wZ�lj �NH=vup�q �R�rZ���}�X�3w0���3�V��#�ߩ#�m9MF%��*Z`ѧ��ԯ�_�QB8x>�V��a�+��",�h�����I�ڠ���˶D3��
y���{d+ꭺ;���(swG *~�� k ��y(��	��*C��[,�_��&��d��
n) G��v� ��Yz���];@�2'���Ӽ�\��Jvo�ݿ
$9ܦ�YHRx�Ћ�'�=G�#����d�x��|y�t;�x�	��
)�OK9�H��
py��� �AB%�j�U����&�o�TG�ꋭ��n@�[��N�[Ř)�X���p��������
�'��	�r``���l[:ʞA��=�*@`���^I����<9�w�V�
��^��4��v��d3\{��H�1��d6�*�ْj���E�j��֪[�#z�lz�X���9 $ߘ�{
���tj�<�n��h�kRoE� E�i7����`�RH	n��U|�|�2<�"cK���h:Q =��]�}{���L�P1'boe� eY�ϟ�'�p'3Lo�PԮKO�9���u��~�)�i��GV[XͰ �JT3���V1�{��ʘ,�kuLq�,	z�`�0���G3�1'\o�Q �P���ǇQl���'�y�â�*�� >,��}���\�Ƞ�[�@�j���5qc%&�;<�{��(7��.���T`������s��AX.�V�a� W��'�+^�龲�A���*&����q���>��2?��*�B!0�w���_de0���H� �٭*��_eI�����GKc�v��� ��!ر⤦�����j����dH�1�h�v�@*�G��ѕFdޙ���~;�z&�
D��U��S�+��0�bB��no��|��hz��׭
��}
�K���ߗ2����˚
,{�n��o�
PPV���XV=���e8�V����Wʹy~�1�+姇�I�_3��U���e����+��?vs����Ǥ�ZҠw)�|s�Ѫ��e�S�+'L�/hi�I=�m��[��Cu�:x�z����z�
\�,0S_���l�w˺ߤ�z����������zg�c}�ubo�� �~�8�#������&'�R�3v5�ZXH���"^�TrK�Uw�) ��+\jG�^oҊ4$�ݏ�.�Ș��� 
��^�ac�C��/���^"�iVn���-hy�q�b�S�g��Q�G2��|���=^�    �YoY����1w@���#���*�Bq�N��1m�����0��($�6)�2l�X��<��T��b �E��	̜f��R����wo�E���B>�C<�@�W|���9GF$(��1#gs���#g����>}Cd�ׇ��;�K頽U��S �0tY���PR�볷
ȋ��ˢ���^_q4�I�{�����뭢��J��'�<�><_b��A����ϗ���g�V�$
�d�v	~�Q�{�F��f��i������ȭt���v�ZE�n��ף����e#��]o�3Ȁtf���|{�v����|�B���۠�;���
��.��,A���*K�	vqL-_|o���`�����������܀�U@O`X~�&�����G��U��U�@l\b�:��<,~���H#�0�:p�m�B%
��������-ye?_�����S�C�o���N�z�h3hk.qo���U�Bq�x�؛�	O�����"U
��sh�Y2ݦZ���H��:���RQq��
m)�v3X�#����h�Q �[�;�@�Sj�c�g��K�Ul�l#������=<�f�2�U4O@�D=��p]N���x,�~��$R�dd��{���3������i�.ys�`�i0�<��G� ,���� �Ʋ��؆B�xJ��V��B!�`�W�)c���_X��¾�G�\�K��3���uX��VA��m�`Y��V����9x�m��v���9VL�i���Q����9���k�,�3q��UT�Ta��17U�>Tf�z�㿁w�f���b�]1����6��}jQ�o��A��ު�`��4�Z}}y�v��VfF��V����(����%o�k������P���<y���F0ҋ�:Zu���� r�����sc؇z/:F�%ɲ��[�;@����y��x[���?���e��{{��R��f����C�ƥ�َ���D�_����n-p����U4��]���W��M�k�Vń�����{��#����h�Q �
Ţ�u@J��G�P�����0�,�Bo0P ����w�3=,����UL�L�{/��馢���<��{�XjX�,=�W�AN_&�Vd�&��u�w��@d��UP�I�D���>S���]L�����#��qe}*8��G����*�� ����ӂ�B�O�Vaj0����,��T*`��[�v@{nǟ�n|��_�VQx
P��u�;����I�?��qܔ,����>�+�ؒ���3m�X�{��!F�E@[)�]���~}Y���)� {���V�&
�f�-�cF�2��
�)�.���N2���JVyȳ{�x5�*?�t�w2Z� ��h�Q:��ԓ��/���PF�}ܬ�������W"+�$���L`0�H��I��; ^�:ZE`(@`�}y�S����*�� �u� �S���D��VA�~����Cp	��ẁ�S�H��S��p˨@_9�8#[H���V�R� A\��D���+���&�(�@o�w��mb��;My��Sdk�[�f�*������ں��$8��VQ1~����.�`�dd+�%�hI��k\�ؿo��˶�e	{{�U��,�:}�,�:���㹶���9��j��[��j(pU�m�οh��1�ї�*K��_>�l�Mk�U F��k[��&��ro{�-�#2����S�*�����<�^P���
( ���.�2�]^���Ǉ˫ۗo0�a2��4��{��"���TuA��DC��z���t̗�(@��hL�#�Va��Ѫ�g
��r�t����*@��[gtIs��c]��v?�����]��(,���Ȕ��2U����J1n��=�
L�&Dwh��>����q}촐[D��Ud�F�D���Q��d�ȣݢ�Fn2I�9
����~��,:�Ҿ�["s�Ѽ�a%��L���V�ϊ;�U���蘵Dΰ�@���UϽU�HqQK�*�F�I=2�v7���h��%�]������ߎ۽M<!vy�T쭺C>tV������i��ׅ���_�

0�V�
!�ٴ��ZP@L�3�#�W���ȹ�+���ט��Xx��ZEa(@a�����.";���Z
@ݒދ�$r��v�Azl,�}�2���]D���_uD��4�w���<�rw�V��^OJf�Une�
(����ϣ�E�A�(+�Vo�?( '�l�V�+�,s��i�t�m�VG�㋣U��(��7�M/2��tr���*t� �,,"˹���2~�0Z��;A�t�`:�[}<e��pm�����"m|75�(暊x�؂|�I�v�=�I�w2<�7���ܣ�0m�_-�'3�|8ժ���O1-�޿F>�����U�a(p���uy\�d��CYCΛ��*�~v���1�ys��K`��1byS�Lꭺ[Gn��#[��9�zY��r��[`�1�Z�ya���6�Yd]�"�Lo���q�Rs���Ŀ��?����~P|��'|P���o�ԇ�d���V�>>)��?N�܎�3�Q�V1��.��q���.�	ܻk9���w�NW5��i:R��)�wc��|X��9��֪�
�,ӳb�9��U�j��%�(Q�k]G��.�*;:.ak��l\a��2vΣs"qf<�I��h�?#�T�?/��#Qy&9E����"� s�(�]S`Kr�m[�i$I���&�ˆ�#eDi�1�.QV����v�o�7[�0y
��C��o[c�JF����I����|!���3VÈ[K�J(�V=�HxZdt�C�HP�yo���K̻o1P�T�ex��v77�}��{�K�u���Ծ�l��WS%D-�V�e�δ.=~�^,	�?�=��*.Xy���|:�%>��*�� Ed)ƔL�G�eo�R �\���iK�O�b�:
 �8?ݕXny�� Țd���S�(,��y{d#�Ἒ4��-����x*��QNT�9Ȳk��V"Pi�̈U��$�:�����.mI�D�Q i.Jy<���ʷ�{Z$�_���BD�+c*�(��9��,W;�-Y�	�Ѓ��<�S��2� ����0E��v{Y�����KfD
�i�F�m�,(����[�a3°��l��TF�Z$��(��Ixb�[m����y�k�yru��ݬCd@o�� �߇r��M� |�|8l��eJ.|�{��\���9�0!;�<�-��:��h��#f�Sf�j=Ǖw-ĖC�0�����H��<���]��熹Uz�`��h��쥿��  �����`�P�!c�_�)�X��p����K(�`�Ѫ[c�1t���x��{H�l��aG{d)U���� `z��˗G�pL��݊0���.!]E��U0KҲ� -5��v�UPG�%N���$_3� z�>d;d7��覥
0��*�)[�a?8u�u�V���LB-\19��m�@�ت��Uʴ����*���*�H�t�����	IU�Z����<r3S� ��q��^o��ȋ~�L��XF�=�_�*��9��-��ɮ��f��X��G#�K'd�wG8W���ÏfR�SfZ��[�f�F.���	=�k�h!��bi�6��ɻ׺�!�j�U��9d8�!�����2=*���*G���>�z�"e���~t�-NM?�	��J]b�U��k	�eF���?}3㶷D� �^)	���gL튙w�����0R�.�P��G��GH���v�[Í�+���6�%�����N����[��3�e�6� �9XbM��*8�
�7���K�c���n��f��.�e����NUO�a��v�oX6x���
Kf�%Sց��XU0���2�9c\H *7ݔ7_��	dޣ�=>%�9̜	fιE�C$r�`l-;O�3x
0��P+������!����=_� ߡ�9
���nbؓ�=9��I�ܨu�d�h���3v��yK�Tҏ�Z����2G��V=�Lq�t���1	&ka���%�� ڃy���x�׌��I����    Hh� �Y��k��:|n��^.1��^��%�(�Om�����"�{����ދ�������j���9;ѹm�Qr֗�7�{�Ř�}T+	���/��Z/�����;�־g�k�~_3�s`M9�F���S����I�t�M���>��VoՓ������y� a�
�U�y��wf��+D�}y������������z��x���>,������L9[��޽�c.�ۥ�dJj�@�3��*�B!�n���|bߞ��x4�=�\��jU��#��R	�@���h�� �]F���IT����
m)�v��o�X�=�_a\��~DǶb#�
�g��3������f`�n����N�N
+���������k�q�V�P=/r��Z3`���b,���G
�������?M(��[I��E�����O����[[�AW�!����痿)7�e����*�B!d~}�l?J�����|�3��o��y\&P���
f( cIr��ͬ,9l���[c�`�3Yq�J�������dQ&8�uwo�Q ?�E�l�<d��։��~�UD�D��A���㈼߽U�@P�AL����Q�N=ָ�CQT�T�g;=�>���hd�[��hh���� ��3�TA� AY����������jL<=S�UQ�B!xF��>�G#_�T�,��@-�Y�@#c��1�B�o��p\	e�ʖ9ܬn������0�n�dV����t~�/d�������>�C9��@t�����vȂFgZ��30ޡ��Pv�7�W㴽}����Ū�1��L�(H�Ȥ+�=�C � GJ<�P������Ȳ��^^��O}��p���'}�O}fzyD��ճ�~�>ܾ|�rOFd�SQ������Q:ܬ~Y��P������PH��.����ΜmF%ȩ�)��������+���ETYW��X��պڛ>lC��1i���0Qך�����"�C��2���/c���Z
 ]]ob�p�% G��(
G
߶��#z��w�T�������ӥ�'����Ҥ0�-_�I8��/�x�%��d��]b����4��LE�R&�G�f��X��Uo�ȿq*�)Q�)�S��IcY���(d� �0h��O��k�(-�e~tߴng�f��C�b�)e�]92�*�h��l��\��Z��(���(�� �n�2d��SQXK��`�=��!B����X��:B�1�wEa=�a9�y�{��'MB>��ܼO����+dvED
�Z���x+ ���(d� 2/3d�s���C�ˇ���l�e�9E�)@Y�/kwc���7*,�-k~�<V�v*GP�����*E�K�o �E���n�d0�������M7[M��k�SQXV�@7��͞o�?�rd��a���P�����(�e<�SQ�@ *i��|z���l�a��o���n�*�":mWg� g���dZ�Yc%����������S�1��T.S '��gY�`ez�3�oC�Cu�(�B!<���L^�c�z�q�p𻆩�J,�������<��>�*��MEq
pn\ٚP%���#�Ŋ|'ݙ�	V�+�ʭ�z�3H���8u3�X_���/��+�	��OEa=�a��y�~;��Z�*�`�p!��e����CƩ��{o�/}эL�8o���+�y�t�J<��,�4�\`��Y�AW<�D����˛e��}��I�M6�W�E�)@�"T�M ���C�b�MH�e\�����lq�e�ֶ��dˑ��]�?�`|�~T|`�˲<Ǩ2A�pR=�='J�\���M\А������S������rxR�_`(˫[�����-��#���W�|�^OB�M���w���ʇ�6T*�+�I��F�+
�Z9�6�������5�� c�=jj/"������D�{H�li�"k�|�(b5�-]�)%v3���3I�Hb�2=(��Kqxn� �$s'��E��L�����/m��gd�����,}��n֙�hV3:�QTw̌�؞�\�}�i��>:����:�
\��?���e1�)h([��A=������:����g�Ic�uc������Be
�8B�?/m�hJ�ق��"����<���d��e�Z�v��x�N�ۻŭ.OEݺ� ��ƭ��tת�Y@�����d���g=�(���t������~�Ԧ�\(B�E�7�I����Q��y3�M�0M�ff`�c4���waJ���ܖ��0�|B$/g�}�Pc���q�2��q4����Z/� ��[�/|')0��P���
�� �9L���TaLv*��P��._}y~���r��;LEA-��f��^�rmF��>��}�4Eq9
p!ԋ'�Lߒ���FSE�)@�׫Ӈ�UG����¯��b(�0P�0�8��l���iuWM� M+ߥ�_b_GT�1���V����Y��u%����SQ�L \+�B��'��9�6tEA�@��)��N�" 2ja��� ��ܗ�b����5`���k������2���`8PN.���T�� �k)��I�yCQPG��+�����v�#P��EQ�d���bYc��|��o�B
��غ刞6H���2��"R-7|���z,��a3�JSvL7IVY���1�֗���m��VS���ҕ=3��ߓ��n z�+���Z�q�'�.�T���v����^(�ϯ�=��ٮl��J�xt�/�|d�&c���4��+�Y0�,O�C$�����۩lI̍����Ii)���,w�^&[��T��8
�Z��BQ"b(
�) ����>�%����YL���!���<��A6��ly���6�!R�.����>�x�-��+�G���S�V���H�鳡W(�$ F�Ρ(J�Do�i�6�U�!_c�������|w��1���:u�B!	��X�
7�v.�X�Փ��Z,�T���
��=i,��P�P U��	�$�ڧ+
�Ҙ�ɨ��qf�ҙ��f���\AY�ѡ(nGzly^�p�P���8lME1y
0Ɉ�}�]5#�c��d]Q�@h�2}qjCy���F
`��3�:$XǨ�L ����7yn�n#��( +�������h�186��Օ�MBy�y��Q(�^�/QzY������]�[��W���@^$���g�*p]�|��x�^V4n��P�(CFmրY�T���Z�0�a��G�JE_G~��.���`z���ߛT��B0���o3�������B��4��¢��-fd�~'=<�J0S��^�*�6w�{Yu]?�e���d���X�����7��[����ߡ�w)�W��9��߹���A�P3��>h�5S�a�|YMQ$�$e9?V�]�y���6E�
���.�j����,����ʑ(U��@w��z��yv��K�8�SQ�(	S}-FWhy��������+
k�!�SQ���n�}���.�n�Q(c�-���4�`&N]����j����ᦢ�,��P ��z,�,�d8����@GD��`��It�Aˡ(h� ts�~q�X��LE�$
�䥆u��U(W�u*
�) -#�� Ի�SQ�B!H�����d��p}����?0r״�߷��_�0D�`^Aګ�+w���Hy�[�A9���*p/f���tN�#@���6����H�뱙9�jA�B�WZE�r�W�6�%r[
\���{Ld�G�@$51Gbg��I�R�q�}��j8í��,]Q�,j��c�ډ�_�:�8�����"�w[Ke�0�fB��O��#�ʞ�!���Q'K�95���	+�����~W� �"��f�OY�#ߓ�6�<E�)@U�eC�zJ��؝��V�KCQ��BXa)�Nۄֵ:�f�Gv�>�!�#����0��p��z���!�7.�iO���Nܕ�}�*p�f���I'�d7�B
 mK;�t4���[,u��#������%{l�6�\�(=�0��X���	3Bʱ�/����Cn�Yv{�RK���Ie�ย    ��@�a��(��%�?ݰ�P?]^�06E�s����J�ؿ_v�X�ueO)�ư)�����V\$�F�ŗ��N��}�p]~;�(����t����\Vl��V��:/��̸��-���3��-{��Y	�gN���{,���Y�[f;0n-�B�,m�T�m���׈�������Vv�?�������w�c0#��P�� �U.��Dۧ��T��M
���(bKb�ĭo-�3� �����ƾ�jzz����
'�8E�(@�]t���xh�节y
��6j��� ��7�(��?�ϯ;i�H%]�T4R ��`s��d����(h� 4o�H��܎���I��6?Ŗ)�VFm�m����)	)�(
�P�M~A���#�xX�t�����L:�/pA��,�0C��O�'� /�I��c ���yJ�E�����PL�W��/�^ϲ�<��y�e2�|���,�D�Ee).Xe���/f�`]͍�B��`�0]��ھ�ɠ��F[`�Eـ�uRfa]����� �o�"�sf׹E��=�
���}��m�+���@� �w<�/d�X�{��2� ­�g�	��3�aWX�'��XXkF�3�
>�z�%�Y�}LWC� 7�Q�}
 #�t��B
A�uyy��'S��	V�C9�l���M
�?�V6���
kǩ(zCz�ɣ}
-� ]�[SW�� �k� ��j�?3\W�r��ńm��#��Xd1L���$,ㆲ�C=Wӈ,DC�9�k�D<�#2SE��@q�
QH��쓥��4�]Q�H �o����i�gH�C�|�N��SQ�|$�ȼ�ө��:��+�!S���s��N�W��N���&�ns	Ļ�"UYq�;u�B!�uݼ�����îuu�T�f�����(�₱iu�>�8&���i*�;������*U!v[�l�h|�ؠvEQZ���t5o�z���Ѝ��`7�e�x3��Q��/��~H�,�g�_q���L�a�֮�;��ˏ]�ɿz���[����Z�1�EPq���Z����ROR���	��D�����m��d���GG��ǡ�:u�H�Kn�x*>|�8��Uf���E�N���q�@6Y�/֬91�gW2S Y��'{���.�3H����
°�9���d�w`�|/8�ʑ�WBÃ�0�����bW�� �E��M>֖��wn�F�xk�5űoW�� �[�{d���*�]Q@Gq���w�����A>���W�S �^F�}%+(.�j��zTx��$�\�+9,����(p�Ho���cMB�J;� �eW�� -�>w<W{���,��nJ]Q���yA�4r��?��fT��SQ�Lq����tHך��˫���s���� 5"�vWU���.w�������Йn���c$�ʑ'T���S�U�g��Ã%�+��P���QX�y���\���@�e�D�I ����"p����g��E&�:0��+ꪞW�,]d�;�>)�Ի���HY1�ƞ�8,RH ,(
)�gL�]�f $0�B&
 s�/8?��<f�?Ñ��Йh'������4^vE� e�*[d�}�����z\�G�ʑ V��3��ݵ�e��KqW�P\��Am��JB�����P72�U7��z�`��ҕ�& ��� p!e���Q��9��
�NE݋� ��s����4`��B
�"k�Ts��=�͖�(`� k�?Il+�_#��t8YScl���y����d��H ���ج&V�m-W�u��De�NamD\K�uEA�b�9[��/�ymV#q�S92�*�`����5�J�|�z~{�T���i��Ep'z�OEq[
p��7\�kc��6�-\�dX?SX�<�<�-���ΐ�``vf��ha8�M�h2K�*t���1O`�>�����#Yy��
 ���##�_e
�gW2R ����o��i`��J ����r&�q����Hb�< ��L�g鎎O�+���2�u:�l�~\qA�#8���F�����h�c���s�7H1=k���|��b2`�������n�m��R�����i)����U8�c��CuW�� |�1̴���<��~s��C�0�E�z
��z����az�g5EA���zk~v̬/�d�a,������"� g���=��_��L@f��p>��?/��`]Q�L\��7�e�DB&쨺�#�1gXp&�K�B8{�֧����>���]9�N�P����<�w�m8���_pXQ 4LE�
�k��Hg�hV�Z
 ��c��_d�	qd�u���u�h��0SQl�lai����x>�Tg]Q���q���O	Y�T:R ����UE�t�+
�( ϋ�z�ր�ME1d
0���g9�m�@��aU��(�Bq�#�MM3EbY��){B!@b��zy�|z�����˗Om����(|�MQT�T����6Z���7
��]^/0DWv��+l+3��-�܊�5N��q/�.o�0��ٳ�mSԯ��.�ac�V@��]QHO$+N�a�yi+��l��uE���j�Z� kP�t(
)�N��ɬ��6NE��o��s��)ME1d
0��6?�9�ڸMQ�Bq�
x��$�����M���͊
�� f���+��?T���ߔ�� U���B�_c���������S��ܯ�T�?��`��b��>�}�SQpOxXj��O<rV��(�@�(S�c���b� �� ���l��xYP��c߮�_/̀4N-� {���V�i*��2�ec�H�1.Mew�V�j�w@�m������I_�r�[�v�w��?%"��LE��(53��z��Z�ݙ�B�k��Ei)@�jr��sM;b�����T�� �_~���?Ye��5@S�S ����=�w>ة(l� 6.�j�����SQ�HdBi�Z:�pn
*'Ʃ(�D����΃�LZ��Z^��'ο� �P�:�灹���/��DSm���E��6���~�"�O�xW.b����4�OE�jQ�(RCR�Ik��wIY��)��R��-�\^al�n"o�`�n�����x������k���� ��l����>�Eǫ�m�~p�Zr�)�,P�A�2��G@'7���*A�$#������M8sy������#~�6��+
�(.�~���l7�[�E�̢y*�8S��|����Gm���"�@&�9kf7E�
a�������op.x&�x��k�� �������x���8��SQĆ�v�}��'�è��3(���,k�Ed)@��9�ତ- X�iDFS��6EQ9
P����>�PT^:��#&��e�ʢ�MQxO�tYz��ڼ��9���jkE��(�@�8��XYo�䡲
�ME�D
Ф�zJ�~D���oS6Q �^���#G4�k���(`� �l��l��P�j�AWv7���u%���>�PW��-X��W�0"�S9�Y�fy�?z^�����2{���bS�� �]�>����K�8'�늂Z
@�2v�=��Y�,K�7E����FTW�������u#���/h��O7E�{
����ǂ2�!U]QT�Tq��lf�CsY`�(l� 6��:U!��75yU4Q �g��T� G�(�C�<ś)�[��'���P1�2�SG��`1 �͒�W�p(��M9�c ��u�{4�7E��h��dM�]��@��6�V�
6��B:�V�9�\3����S
��"� 
��6}�7�d��W�*�2P�2.���_e�fX=�Px�����&Z�>�����R�z�+�a.fS�ч9�$
��|�W���icm�n�9����'S��,^6Ɇ+�������B�i�I��6�7|�@��"�����)�+�*pSr�n��3��*��P\0����r� �1��́/'���$GXe�T�,����� ;;#���j*��Q������nߜQ�A�MQ$�$��2m��aE�Ifڷ�(�@��qs?94ɨOP����x#x�������\'�F��=MQ�Dp?�h����қ�)
�) -8Lh� `���B    �$��?�AOa�x3�#4W(�VG}s����>�����(>C>�|�c���J��)��R��-��I�y��f����T�� �/c�ްYd�c�O�u�T��I�fz�o$����+�#P���h���w_�?^^��c�U:�}��2���D7FR8U�f�4B� �TvO�&#���f p[� >��J�������I�ؼ�ù+�{_�p����5�T]� ]�H/��*�Q�a*
Z(Z֖�id���k4<~h����ΤQ�D���rWo��N�Z���{��,,�cNf*��+�d΅��a�����(�]�j[���bJ���9
�<O!�JK��f$���z
`Q�&O�Q�C�.�cҮ(h� 4֣��릚�Y�og��
��ҙ�V�1���)p��)	���v���f�ڗ]�*��NE�&
��|k�E-�C�LT��f
@}��
Qv~���Aڱ�ɱ��SQ���hdӅ�����G�1�r��! 3=i~���pjތ�[��^[���qp��7෋t��9?_^!�<og�3ú�+��R��!�N��ݤC:6����u��������(�� (���/�[��p��X=	멒 J=�BF
 ��#�:l�%�蜩(�D�z���8�튂f
@���T>��Ӯ(X��A�yP��,�h���
@M�ٯj��n����P[#�ߡ�2I!��P�R )k�oO����yޡ���Q�+��Q��//�}��<�H1�uE=�a����Ο^���pSQ��O���������Є��R?��'@8�OEa�y�+�=ں4��@�5����	�C��'ISI���������'���S9�m &Dz+<4�x��(�� �.�2F��#J���
!x�E�-�%.0�W�u�� �ݡ(�� �ˮ���|�w�@=?䔍.f�2\.j�&]{�+*�Y]c�'�Ts� s\¨D�,��ِ_R�-�+�(R�!A���N�l������U�������Ls��1u�D�˱�
��2"�8�N]Q�L #M{�}��lxɦ(d���o8���<��kWˮԕ#���fy}��LK�~�H� ʨ��IW�� lj='bVfZ�qO���S��ႊI������u�����k�_�,��(�� �lja�`	���D��О�[�d�TD>;�
@մ4���v~;msi�Q
,��8E)@�Z

��g���j��u�٤��瘊�N���؍��k�u�+
�)�+5�m�4Տ�_���")B�08�5�������C9��*�{��]V��e87%���((m=A�;����˴���(K�}7^��]� �A�P�� ��C
V�Ώ��ǒ��j��"� 5�"��0��ϥ�g��7E(@y+k�?����aEW0R O�gY+|��ƾ6��(�|��n�o� d}nd�MSQ�LlYZ���Ϲ+
\(.Pf�Ϸ9S*6`�ٕ#I�$ff�by�C�/YG�t�ʎ�K0;k�a�N��v��S������CQ7g) w�{]���;O�o��a��q{�G���V����C�{w��&�����SʹT?_�Jj��˫r� �Iɨ�觢n�Q�v<�9w���vм{��q�rbY����> $�P)�����[���Ԋ��XPI�j�LeKo�e���〆�K�|$X��G������n)R ���ݷ{�������\�y����3E�(@����Б�d=eG�7"[eYP��0ء��G^�C>EV(�,�5����@�H?2�#2V�A�c
����iK���07��RMG�Yx}՟��#;Sn��n�R �25�c�Y��V>�SQHG�������dH��m(
�{F7�=�u����|1i�ʖ���n�	�`p30�����}B�DlC���&R �zi�:sb��Qxm(
�(�����\���>��f�½�8�n�u-�L��XZ��4�}N1����2����+B�\�_ R���P��T`ff���H_���ℓ�(C���{l�p����E!-�&>gdY�H+
���(�� ���3�O�؝z@�����P=��¨1m~�%ּct���	��[�ŗ#��EA#��k�8����+����)�PK� K^���,c��!�BT���f
@e#��l�깓,�d�!����9��(�B!y�!�u��� c���� �,��o^#�T�P j���if���Ҽ������C�9��e���$v��T�� �_��_O��>��)SQxO<�)����8�EA�8C?�BK���F
@"c�V*_/_:�熢��ȼ0�������Sޟj�&?>�͑2�8�\b*�J�W*2��#�ZE:�:�T�P�������K7��mrS9�K��N�8a��Ώ�����((�t�ۧ���:���X,X����,��H�MEA�~�mp\5�)�[5EA=���P����7���Ne��M|������eJ-����ݜ�4s�!0]�sD<�P��F
������ہv����n*�����-+�[�)�a�?�&��f
`�{u�jQ�6��G����"��9��=�_(.�B�P޿v��%8>�X����`*
i(�D
�yP7�Q�]2��	mSD��eJ���KX
\v���i�����V��CQpG8��tI�" #1LCQXO�,�k��d���.LEa�%�4�� �󊕉n(
)�M5����++���H��a��<ⓦ�88�"�D:&��(l� ��c#�ߙ8[��e/6�S(�Ǭu+<W7'�� �0<Ď�zʑ�T>��?aK]ߎ�VJ�ݡ(�� �֠�zml��(j���Жh�NE��3&��P\�n*��Q��Y�T�� Z���T�S �R�B�-�X8�b] ��,P���++So����X����U��e�L�:N 祦�C�����+Nwc����YtҢ�T� ikχ/�Ίt�4�,���p�Lf2+'+�
]9m �����uO�k�z�!<yu�����0&��T��um�/�T���ಈ~ߜ��s�F��p�8�tq�[m�2O|6g+�y*��S��!?�����/=����?�b�����{=,$���r��C͎t�XY����IⴲɅa@��T�D
����;w4�A6L*]�ҙ����&�!/���V�|���i	Q�p����LdA�mo�pw�����RdA�O����B4k��u(GWH�����Q:�!�����4��y��xF�a@�G�ux(
k)��~~�3G�V	����$K̈�+[{�����NR��Y׊���]���8�>!�H�5u�$a�k�:���]�+��"LE1
0!@�v�Q�󸺎��/�SQt�t��+��FP5D�1n*�/Q�/#Ao��X{ĭP�~�[(��(�Lq��}�c�ox�ʀa2����|s��7�8ױ�	�pYzN��Ů%�M8�B:���;�Z�5Pe�s>��}��¢gY�t��ކ�m\n@�(�Ρ(2K2N/����#6���.��T�Q �+Ź�z��~f�n�q�X�E�y
��p��ɢ��wE���Z"O[0����"d�R��X#X����Rʫ�8�T0Q ���wd����(`� i�dĨ;�+o�)
�.�n֥F���[o�z�͸���l��r�U��l�g�|�\���S�1����HZ
�Jea�3V}w5%m*�U5u;�H��
W���|>�������_����*}�p��z�8��%s��\��.EWW�p1�TgV8��(š(�� ^F_�o���J0�y��T6P ��6Iʫ�YwӤp�p,�t(�4R�4-[�1C��pF�'��̞8ś(���U皌N�>f���f
 �����I <]����B��y(=��a�+�A�r�* ޔ��}#�����C�B���(6C6������\�6Ha����	�Jf}��h�ЍwLƕ�~    �CQ��( ���~�W�����ɞC}������[������B�t�_ct��~���_sc�\��G0�I��,�|f;�^�� ��P�����>`��(=����9늨t��/��~m� ��)|JSQ�L|i���m�(�V��ɡ���10E���p��k���Ln鶲Sʁ[:e��5�O��� Ȫ��>οS�-ʾ0c�8�={FyZ��ټ�T����sjE�L��{�T��FB#!�i^l.�U>��(�� TFnF?�`�1��r-W���O��K�C�L�SQ�����MB�P�0С(�@*���om�:(GPa�(�⧢(#(��F3c?������"��"
�EQ����Hy�>n�o��Ä	�����X^�To� oAѾ��O^�Ō
r<��+lۨ�A����b/�C9�Qa��P�z(Gp�`�~��Yr�F$$.ل�(fCf�T'��%�^
_����P7ϰ��P�Oa�}�T�Q ފ�㴼][��d�T�17��9,��`d����|�ќY��d	5�@��h�����q3��|i#w�X��E]%R�*H���|�ZJZ������TO� O�vG���P�I���{B��Xٿ�<�S�(s@�B
Ad�����!��]C9�K ��X&��Q!r(
j( �
��،���[E!-��M��{��I@��(�� �uu_�d3�,OEa=��PbYI�wL���T4P �2P2�z� ]
N66CQ���ym6~FI^�e���(t� :�a��EF�1�+
�) .���d����d)���`���!�X���׼ZS0�1`L�Vc�� ���T��vH۽����=��h����,�q�5uK�+ I�g�>����6��z(
�( ���7z���mAZR���"� 
r�z�-��/�g*
(�D'��_Huyk�ӭ��,߄���b�`OKK�v-�d�uK+ϔ��@.�2E�(@/M:����(�����w���K����˻���$�i.�g�w��o������/uKS���;���t[N�����k�ykWC�銺l���Vc�?\V.j�溛�����X��R���
\���e�I^�ϮZ���P�E.j��#>��u{U��]QW�᰸����F�T��	SQ�p���ut�-��O��cY<c(��S�.l���d��q��P<P ��o|�.j��>E)@�/��d9t��.�6c�2e��EQ&
P�ݐsyUG�@�Q~(�%S�����C]j�6�#0u(
[(+��μ8o?�S4YHg��Eʑ�V:�|:���?i�`wz�Mqy%MS�� ���1\�QI'�)�u*
i)�lg9|�MY )ey�CQH�]��Z�6":�U��ւ�LCQPOh`����C>��b��B2B��F\TV��d�v�Fg�!.L���(�H�����p�i5���n(
̘st?�9,?=	""��:��"+([5�G;�h8�R�;ʖ���1��I!������?d��N8t �Z�,wmĒ�.��r�-�
\�l�u�Ț5;$F��
�-l8L�$�AH�P�R �+�qV�q2�E���K8
\�^H��{��u,��P�S (��y�ȣ�S�^y�
�Pk4��n��Y��CQ���>uFm@��Ȇ<��@&鶴��]Ng��������ȓ��Ʉs� ��(d� �,ou�v� �G$t��(d��_�����|�~�oAvpC9} 2*���.��|���A�ֲ��P�� ����U@���(K�Y���O�d�Jl	P ɳ�<���d���>�Gr�CQ��) ˻�o�Q7[o���'܂�E]$P�"qy|���M�2�Ȟa*
)�L��Z�ywt�`ҍ��]ّ�H�7�%
�������ȉr���OzԻ\$JoDA���;��.���:d��!�u���P�P\�Ek�r�!~��#/1bl��� �`���卓�iı�d`ǷSQ�uح���އ���HW���F�������9
�<��׳�?����W~�P�S v�]16���P2P �Y"��T����ǋ�"� H���<����p(?K��qf]�ҩ����g
�K��gY���#%NE� Q4��K=��c�+N_���� ��dX�a��1E�p5���l��Z
@]��� ���W,T>�EQ9
P�ͺU��/x��E��Ex�������ë_
6#+b����"0��#�Ͳz.f*
) ��y�gg��RX�T6Q G����'�,�eA:�ݿ7�L�^$s���!k��� obMSQ�ÌJ�5�&��h3*t����
@M �_NF=d��B
 Y~�0cc�?#=/�CQ<��__�i2���5f:'���k:��$%6z,����ذ�zٌy8R[e��o��g�A<E(@�o��� K7Mp���F
@����|�d��`m�T2Q ���'�<�Ʋ"����<�-���Ϳ�[���?�M���#jD�E�T�p�������JuPɡ���9s�ĩ��*�+EL��	��88������� w�/E-���|}5<�6Y��+�S�-9�e/SQ���2m�t����քZ��[��{
��B�����y�Pg(
( ����P{_[
0�hx��(�H�����k猌�1�(l� 6/��^C��B�'׶�ZEL��\��|Yr62�ʦf(�?S���C��:gY��\맢��B�e]�z�l`�6H	0�#�T,��>��=�+EŲLZ	C��>X���@��e8������������|���t�>��J�U{(���}B����}@��jBo�M2�y;	e2����� �/��x۴�Y:�Q�b�`s�C'����Q�f*;�1�@I̼~�Ld.�~}�$����
����PԝE
`y0�Θ�,�Y�f(
�W�o�?��]������SQP�tT�۹,��\�j�be(�	�˚m<�^����������0�#��d���΀� ��1x������EAkzD@m=�sm�RF���(�� ����%ds�v�%�����(�� ���`���4yHle��������LT�-!�!�y*
(��-D�Ă"2�LE#����P6%���*hCQ�D ����̷���bYE�2`��`ɻ��U�E&�EA�@e��刅3�";O�]S9M l0�|}��UF�e�)_4���(C�)���0�2�sl4Eb)@¾%/hO�l ��MMQ8��I���9�SSXO�t����H �c�E�l����0c1۔��i��[�ݏѢ�z$E�7���4��I ��SS7�L��&�uIM�m������q���_���;oAm�ytM�d
������R��'����[�Ʈ)d���	^�%���+=�#�V�i�Z�g1��SSh&rEW��d�����eM��J}�c&��Y8g�M]�Rಮ���N�:@>Կ���;
�Q|f��〠���@WH��I��vd7�ʽ���TV��a��lL8B"rOM�]� �A$�2�ۚ�n#djA7rغ��H#H��M����M�h
�(.X]l��ߴ�M�3��0��=�����5�#E�v+�)zq��H���S;�] ���'Y��;70�MM!����PĬ���R �u��GTv�����Q �#0��9�j&1�t�h��S�"�ꦜ� ;����)h��`+�un_YA���6��׌�L�	�lf0�_��M!�2��~��r�.��o��aAEY3�Wdh�(S���b$�I C�q�<5/��"�����-�~�n�#�W��7QU5ye8�`756 �$�����j���3S���� ����7pMY�D=MQ8
P��L��*��*oj��S�&�Lc��>G�c(��HHxv��ڭ�KV���h
) N�Z���a�G��6ͩ)t� :/�Y�D~�%�˺�6��5�Q�5�,S��42D�T
��ڎL���?��PYX���q�*$�"r    �v�U�X���ǢK��ɨj	���)���`�W�#W�\���p���B[
�]���L>���25w��ёF��P��)�� 8ԕV�J������2P ��v�u��e���2lj
)�L��g�?Y�;YO����h
�( �k�ܿ��5e�8�i����vT7+��
���3苦����6ڑ��uB�#�B�\�����F;���A5���1h!p���/��W�i�����l�|oN��n���c]<��e��*�� (2�?��X3�2&��䲴�ځ�¬��~�Gq�Jw_�8=}A)<��(��ю���( 4,�:OԶ&�IaE~�h�'�s������́�=;��S�m�?E1,"6��2�&�!
3���Lj��[�"B���Ƿ�_�w�]���j��� �VNܞE2�c�����/�囜"����_`,���2g�A�dF4o8���եup���Y����/F<#�Ofp�_�7� �F�� � �ig�e�pSX+ej� ��g��2�&���	��a��ϳ�Z��qD��M�l�'u7�HP�
��E ����n�/��㞇qϧ48��ƛh[p���
p����T^�w|��z>K�(t�T�w�p���I�Gɷ�N������� 6��0z� }6���{�����(�/��v`�ίq�z���UZ
���r�t��O��őc!<��@�r�\�O����� Yd�j�,���@�8�~��eY9'����MD
p���o�GY�3ˎ�]���`\�9�3>F�8R@���_�~�f-��c!�pam۸�̀����D�FG�#�*Ƃ���#�*S S.������i�ô(#ZO.���\�ܝ6Q�2rP�I��$����iz\��ت���u�8L�9�p�;�/���{ǕQ��([Yڲ�mL�G�_y~����S�o��q��;]Og��/��mn����_FI������^��sw�Ȍ޲���1�2
���`�N/Ϙ����_��&�����|���v��W↊�Y���"�R�i�+ �ͳC��MoA-&X��a��+����� ����?��?2��n�,.d� ��|��k���0���� �$�;��#lf��CSȎ�!uy<(BK{E����V��T�Η�t���V((�V��^.�����^tX ��� @Z�o~n����0Y���X%�H �3��Ȳ?��Ϟ�|d6v9H @���m��^��h�&��m��O�C������?�$�J[k!�VK�M4�#����a=J��c.	�jR1�K}ux�Y@P�V,���X�������]9����=w�/�Ty�~�S��<HC����!��N~���㛸�����4f�2 Yڑ���lŤ���ѱ.z�Ao�:ZȆ�}k�S,�죁�	gZ�bF��(`�XaA��-K�8<��d��G�������5��͈�i��4X�sv�wǂ�vU���>�}�a0�����:�4F�2���lR}���j`5����)�_p�mp��pz
p���O��kmu� ���^��e«v'�	�_�{��?��T�P��`,0�½�r��٦I���nn�T��a���0�$�8�ͥ9L�,,�	��F�3�SR�P��n�T� Sj`�Tήc*��	�Ă���ȑ����?N�ɞ����򠰹�C��牴��	/�U:���wQ��݂�Ny��갮�?��Ert<�������0���Ͽ8�d6{�J)@��t��*RN��9�`|�G/�ì��̳�g�Α)�R�1��ֻ��)����c���=��/�`q�`7�K�����z��.̙����WF;�yU�V:_����V.>XqO��q�7�|t��츧_͍�����l�/��]��֫��|`��y�Q�小$A�U�E9q�ɲ�ަ��#J ʃ�����G�T\�U8����7�w(��}��q��зYRQ���NMe�pX�`���2c�x�}Y阜�(��o�L�ߚ��Da%�#c���#\�f�!@��4�8�ɂvc�`��.�cY�g�1���|j�Co��,IM��_�P�h�~'[� [Z��!9>��V��a{!��<Pf��"�:w(��GGxe��{��U!DqD��H�&����v� �q�fig[�;+�ĺ���͊܆�v	����=o�*���r�꟞(.n֔첬^0N�ï.�Q��6=����r~����٫����`�A��������ytܘP ��l��X����-������o�L7(���J>=t܈Z3o������J;�ݸy�
+Wa�(��;S��o{����s<���F��:�gQ3���t�`A����%��"_FW���K�L�|-� �_�~~���
pm��(���_��}n�rUyAa�:R������W���5���Z����g�N�o�޻z�_��ؚ�[�	y�5�<�g�R�cVx<{Gq�x;�x��k�~��|���AU����Ǯ�����{���
xb���x�.?ܗ}>�%�1����+<6�THI��>p:Q��-��y	�d���p;IMR��5�.uz��<� S��>�M�����ul�t܇���	����:6k:�]�n���t�.�:6k:�������S�xY6]n.�d�b�Xj/���Ѯ�>��X �Z����e	Y$�S-�fG��V�p�#o��J�X��˲l��E��ɒ��t��.e���Y%���[� �MCo�6���������T����م0�@Ty/u��ۨ3�S�y"r�C��8�i5g����
��ㄏ�5���o�F� $^$P��ߏ��yU�<f��qD�������������H��Oÿf�&�mw}H�����q��@�voy�z�"�a���؇�Fw(�GuA
|�������+g��RQ ��W�6Eߕ���"����.8�ڗ���� ��ӷ�?��s��<�;� Ps|Z��#�<,k@�����]w�d���&6b�+�ݻ�a�M��aC��j'�%��=�e�D��f*-�M�����1 ������@:������(ݾ�<�҉�������� �9S�+�ѳ���1�<F^������,�/�� dVd;癶ƿ��wx����xv]8�m�S�1��s��ɝ�X2P}��t�h�+�|PI�A���RO5�ʆ��8Д�$������3]�-�F T�B�/ܡH��)R߿l�;�c�y��͝Yy�;k\5?�L������xm��>��z�4��Ut/ ڞ�W��q����c�y�t���>#�����Tv'�ŋ��>#-��U? \�̵R���-5"�#�cwga�>#bX�K��{��U]�� ������;;����eK�0�<F��lw�b3��@SԻ���3�zH ��Y����^���-Y3���Wk>�b��DaP���a��	�+����zk�$�by4a����ZV�\�� �*^���;, _?��7z��|S��,P{_ �ض�mC�L���<>[�-�}�;Z�WZ�� �jW�[��F�-�|��s�+z���#��R�=�X�Xn�+��Ui��ŋP�3�J�|���U+N�A�N���e��6��`��fX6��<l�� a�f7��&��A���>.-'	�Q4�y�g9ó޹�S��b�y�7�ȃq�ss>���x�<f�wE�;:#��w�@�4�:#R���`# �����#t���A4�:�-�M�[V���U�ܿQ0 ����]�:a�y�.��j?�#<��p�<��u��K��Y�ү�1����~(��j��~^��}+���>H@z,p�<.��ݙk�<� ��XZ	��c�yoı�r��?��S^�.Xf��َnc���
������L�F��e��{'����$7��y<4O�Qv�l?�d�=�kw�%؅f�C��i�tg��o?���P$�UѨ٧涭2y�_O���D���v�Of�����f�p�^m<��� aFa��b��j�&70�<���a��Y좫��RA7�t�=S���    u/���8�8v?��:{���C��Xv<�W-#$��oxm$�yk�+����x[-f�g@�D��Y�oI3��Ҥ����@��Y�]v|�; TE�;�E�}\�c�;��c���as�\�v������(Q5)L;��l�������y�1�<�f�-�|m#��
�p��)ds�C�����vȼ�n�cV�L�JL�x���[գ!sn��V�m$�(v
)v���i	���ac�fk9?Z�L0�iR�ܶ��]���G���qJ<~����������lqt�$�<���yB,>/�/�WP&�jq՜toHZ�_�IAm˙+��4?���� Ö��3��?�H���� ��
�w4�*U��e�=Br�+�( <��w��?X^�g����	w��i�:���,� �/n	�����[�k%���n��ox�b�r�r��6L��R$O/��8SV\F�����b�d<�а �Q$ �+�Z��v��n� .�?���M��r��) Nۚ!���z� DGEo��6r�j� �$��Z�C����hCd2����t3ot�!� <�x6$� �ޠ�(�b�dr��|��Ŧbl�Nu�+���'���1N�MNb����l. �{[o2W;,^,[}~I�G�@�8~f�b��L�w�G�C@Ev�bڮ����:������m�x�_��	2v�i�
���]��  ��
ն���i=��~���2��ٿ���ag��t`���Y��-����/i���bŲ���p��9��������n�=7���ͮ9d^d7���rY?ވ�.�nCH�e�w�4
����)$zб�t��w�t{�d�2���T$�h�;������Up ���6�U���=�[��bĲ���&�j���������m��沶��6��̊l���{G���%j� �9�m(��q���A�8f�eǸݗ	�F� �plK�p((/��у �x��)!���2D8 ���7���k?=���s9�<�b��3߾�il~7\��T�J B;�~~��_u�՟-����,�>��L��~���K���jF��!���^@�-������̦�Z���~~u�"����	��k�_�lWb���Pb���f������c��N���߉BS	�k�4I�c���o�2Nb�ٺ��\='��ϕ�,`�'�8jr������r���ڃ)��p���6`��o;0[K��T��������4ʴ�g[�i؀]�Z�N��\���꧍_.�.T[�j�Ӧ�V��h(���i�_����y��bP���)`7��,�J4��[
xKoi���C��NU��(���es�7�T۝�1�fR�Lr�7�F3����@,xH��D<D{�#X?�Z@<�Gnk�7�f��.*���خę���DX��`�$��0��l�p0m-�|g�#
xD~�!�/�>M�>���Sp���o��ϵ�섄 �7��׫���+�}fQdy{�"[��`�'ƕe�ƕ���*讐%��VE��SWM��
}����`[���e� �7U��Z���U��da�U��p��T
�J��o��N�J��q��3k��6���*�}���I2�eE� 0��*|
i�# �'tS��w%mI������~�J_�����ԯ[���MU�G@h)K� ��ȸ*��-�#D�.4��W~�5�^-����#E������*5 �����@4ٰ�� ���m2�?lE" ����	��1o_��6" �2'��[�����!���aS���ͧ%C! ���?'���$� ;�7������	r,��%��v&�֫���ν��0�.	���z1bF��,8ަ;I2�w	�.i{CY��ܛF��pV�{u�P��"�`�N�k7�Y�Wq ����a���Jcp�p��4�G ��3�?u��r� ;�oط��0.} lR�ʮ2g�Mq�.�Fw�&�C��AbX�L���l�����U��y�:��%+�宛�^:�L�{�2��,Q;������@�(��[`���%��e$� ��,PM�[��ǥڋ�@�/PM>�Y�I��I'  ��T��?Jp �[�kKtާ��Q-�dH�e�i�-�9�.�˂3�H ��U���Y��z� Tq�*�5`�_�V�ćһ%��9*�Y�|s��LѺY��TUl5/���"�hA�f���jpe1X�었�͂����	�G_u��Ɉ�����텃KWn�n��� t3}f���V�4E���s��s3}d�C��Tmэ9L:��<��u��-#�K4*����9�ä7q �v��˳��1^�Y����勩�����D����nW6����0,(z���Jr��Y�"* т��O+D�)&q Y��^�Ëp�M��qV"����_KW[WgA>���K&�!���w~gl}�͆{qO"���ۧr�a�ͮ3����m�%�(������}�O�I">�������;)�__�p�q��>^�F���_ޏ��z����j��ǯOϏwOwy 7����7%堫J��F��*�?_�K��D��m��G��`�2Z�y������p��cV���ڇ�f��IG�TiL����Q�$d�u;#� <��#���mn�E���|��Om�o̽��+���:3�oح����|ʹ�����x���g�L6�!��ts?yN_nl�����-�	|�@����܅��u�����>�|z��4Q��������W�ߗ9Co�eJ[ ��|������ݧO�S�DY��Ʉ3�M0 M�i�^���}/��s%�Մ�c�UN�����=�막zƈ�Q1�
���>�ч~t �	z��s���d__8,���7 (���S]_3m<�9��eI�`dE��<>i�~|=����y���ht/*�v�y~�X��*�:�<���Ci�����������{�E�;���㗧���܂U�1�����n��m:%�8�ߩJ���۽0�:�l��Wm�%��^&����fU�I��8]���7-���C@׉n�^,��骩8D�ŉ����}$��Z[7��q��E�{5��] ��M~`��|���W<���kN�+�QLRbG�{|9�'y�]�׻$� `��lڝ��FV�j��ؼ �pb[�ϕ;��bѣW��q�5~|�����eeP���}�t���+N%D��m��<�NKt�̄4\Ă�w ���LY��Έ��s4���8��x��ؓ�vt:$ tVt7l����Hݧ*'��ue�ԝ�J��y�ݰ�&�_Ęx/��7S膶3u��Ą�C,$�-6��՟*[\(;$�l����i@,�Yb;�l]mU��q�b�D���v�ͫҡ
@bD��󕹩Q�BHz����y����i�Dc�EL�m�㖮�t�畘t��9:���
��O�������̝'	 ]�}@g�
8�tQt�� �r�Z�҂8xL�����DJ,��R+�� �C�F$ t]3du^;�1����0����z.>wء�����kJ�f��1�9.��9��/�\f��!��_�C����¬}��~X ��d�|��A�?^/����1�5Ҽ�}|������Ǘ1�����??�w����Kݿ�f�f4�f4ѩ�s��ek����;O��̌������? ���_6�c�&UGXā�󍬑?l��XϓK����_l���f��3Hs��]�����i��K;������<!���?��g0w�S�I;����� 	��N�-�p
���
������C~Q�j�����^������r8���w~��}|;�>�t�5��'�����G�������_��pu�)��)�ຶ�B������[���U��<[|�'�6�`��p%���"���S������寻�cV���������ݏ<��{{>��q�����M�J�F�@��]����Ҹ����kޙty������;s8_^���>�c=ʡ�p.�e�5>�y���@�m<-� 
 ���?����N��� �p;	�>���1r�t�и��|V�]p�h�p " �  ?)���V�/��m\����d��2m���:����\�A E(�&E ��h�� LY�o?�����a�m~�h
��
�&��/3Jf U7�:��禃|4ei
� fı��Z3: �~J�X�t[����yLƎ�VS���(U? TnJ�R��;��"�ďH�R��8eTD  E�R,�òj�>�F\A Wq�f��#�j�U���x�ɤ)�b��S~��J�/��~���H�x}B Tcm��b�R�V�X_ ���W�#��t�� ����J�H�OY8	 �{�|���Z!��XTcq�q�arՑ� '�j$���������0���{��5U�2�]�#]���7�zh����҄h�g̝b�dW7�zF�v$�,�m~ɜ�w2�N&�MV
��9m�H�q&�5ͯ������c,ƄŘl��������]���o_b �m��8��MOtI��HѺ�O/_�X�y>���Ç�ǆ�&      �      x�Ľ;�5;��gW�m�~1ǔ3�ly�6d�(B��Zr'A��y\��:��[UL2I�����������o��^��E^^��E�^��E>^��E��?ķx�r|�s|�t|�u|�v|�w|�x|�yz�yz�yz�yz�yz�yz�yz�yz�yz�yz�y~�y~�y~��o3�o3�o3�o3�o3�o3�o3/o3/o3/o3/�'�m��m��m��m��m��m��m��m�5��Oh��S�������_k���9�`����I���z��(���Im�T������?�������?��������m1뫾|[�����m1��bַ�lo�����m��6��6��zU�ͼ�ͼ�ͼ�ͼ�ͼ�ͼ�ͼ�ͼ�ͼ�ͼ�ޒo3�o3�o3o3o3o3o3�ʜ}��=A�+#�4�s��G'Ig)F��P��H�Vj顄��3�Q����myǫ��myg���VF�)���U������<zme��,��2kXsJ�XS	���V�W��|�}���	��'��	G�!�����b����dE��cH��)�	sif�su���_�1��8���8c����c��j��7?1��ۭ��sA��,��^���\C
y�œ������?����|�$��V}7V�}�b-���#l3������ʧ��tBla�Ԥ��G�Qiu���l_��:{:�%�+�G�q��/��>|�jץ~����_u sj%�~���������vx��ë���;��h�0�R�̑r�ɺ�*��)ZJ����C҆�wX}����kg�2�_}���|���a퟿�?����#|欱t������/A~K���u���ѽcx���~�(Y�Yz��d��P���8����(1�Z��k]XƬ����*Ŭ�̹���A��U�W�Y_AK2�RC!j�rϱ��3�~C{쓤>t6�a�v�X�޻�x_C�]��yM5���ja[Ͳ�Ʋ���4�����0��)��0$nU��k���'�O>3�V=��{�5~�\A�h����M7���WWU}�T|3��4�*�A�#����|�pqܯ_��ͮZb�e�?R��W]{�7�F�_�:u�e����zH�w}�&-�A�_Ο��2�,�C���a����t���שI�ǐZ��A�K��p���Mڧ�0�N'P�e[Y���o��l��=�����B/�ڛ>Ὲ�uҏLM�{}���c�뱶e*��&M-��[Ӯ�QRI����H�g��2u�|2���R�%��N]���9ϡ�� k��>�gh��G���}����p�5}J�����D��$��k�i7ֹ�П�7��Ͻ̦�����j�(R0y��D���V���gQ{N��wf���i�㫴x���(5\P����O���;V���?skj��/J�:e:5)?�ҹ����+���ވn"ه�HO&�
�U")(�o.:h}�,ͱVi��}+MF��s�3c�e���+w���M�O����W�O
�鴏ޗ�qӹ'S�K��K�K�_(�Cm�5��c>]�|���9�k�M�����e�K��h�][�NR%a��ʡb ܑ -��u�ˆx�Wx���4{�H!Y.z�ƍ�E���3���p���a�������O������+�Yo��";��z����t5�����wL�ʽ�sJ�κS���:�V�|����Fi4)�W3A�(�0k��A������u�6C�{�t�ǞȜ��MߴH~���p�^v��n�f�fw�s�]H�S�*��O���˲�tkw�*U�)ՙ�<'Ji7�&����������}@�s;�Z����3-UCw_�f~��LT�; ��1��Y7;6U�BJǳ���5 �Ņ�uK��{餰�ae]3KߪI�;/}m��#;Y����_D��G��t>[Ok�|�&�f���Z���~�P�y^��[n�B_���hͽ�]�?�����*�w�a�W�8�b<�'��][�>����"MoZ��y�����d��D�@���WX��#��4�o�tv��Wt,k��,ծ����?R�����:�ro�������ߐ�����|���m��=r��>�FԖ�a�&p+.9�Ky�a����˲��Bz܁0���k�zv��<�h��e���e�-c��=�������viY5�����ڣ��L�Fެ�jjkW��K�a��]=�ԠR w�~mU)�n_� ��B=�} y�����R|��d���I��`m�9���uM�2�L��L�)��gH:J�7IU��n��	�R2}��m�!�s`�g+�+�O��-�_7H]�ڃ��y���ayF�O�Vɷ�����Km7M��6�L��׺���2�Z���G5y"V�V�L'S��Ti�?ݾ�����(���n�^�b.����$�[&���6kĽ��Y�N�RhCg����-��K�>�4Q���.�����'�.��ot�pA].U$��д�c��+k�ɮ�Am������E���7_���,;�kM�G�]�Q����|���<7�o��9�� �%�%�2��q�M_��-}$336ݛ���`^ׁE������B_�N`ASю4��	�T�y%��xK�>s-�;�Ig��"���D>�Ё���ʥ����=n#fi�{����tF�y/�޹�&5t[�CC͌�����z��=t�D�R5�ݞ��]J��[(���]�A��.����5ZZ5k9��MPr�J�؋Z��K`�<�3N��u|}�&�l!�ѱ�Z��z�Y%�z�_dB��SZ>q����םh>�H�@n��}rW��At���c�,�.�@�ĲuQJgp�J���c�i[�3�_VzYJ������g�`���<���|m��>�m�W3�@K����ۧ�[����X� Ob�!_��Mx����f�:=��r|t���Z�c��-�ۊ�24+}������_}�z����붔�RwA7$��MR�[�D�����)�avE��iv<�����&��7W��,�Ac�R��i�t{����$��7��؂�)Z݀vE}�P�!���]����an�ߟ�������:D�BLO��
��d��:�]֟�/���hB���Y
_��nι�B�"��~�'Gi"�@}`���n���-�Jt?%ܿT�Y�(D����5��yqG����H� �.���f�N���_%�H5�ul'f���֡��S�_�I:��n�!�g_<l.����MB9���Ǘ��������>=F�F0e��L~�
<��c%�<���2`Z�]_Z��X����m��5؎��`���"i���5��;��tnB7a*�|Q�p�����ܔicl�D6��P�ck�~�@���Qꤥe�ƑukT��e;�������:s�����[d�j����_ѱ�R��x?:�m�5�G*?$�������)�,e�M��pu�t4�g�c&( KR�1�V�7�[�|����#�܎�{�~,�ѻ~׍�_���zv�6��)'N�Ŋ��I�PS��T��Ki�H�?�>�θ�Ʉ�]��Mt.v�@���n��A�\��i���1�-�6�=�$G��B1���+��w	�qh�P�����LG�6���p߅'���WN�?�|����+�C>���q��l˩��!�E����B(DFH�3N�_�*gT�B�u�h�(^����!���(�_����Li���xϓ_�C
c�!��w�x���ҳY�h��hg��i٪�|Ge�*�U���S8;8 �մ~�Wi���E��^t��f�7�^kkX�C���`�|Z%�ۗ����E�:W�Ftˎ�+E� :����"׍��Mۧ���T>�BrR�mZ�D�	��l�F��QM�s�v�;���>�7X*}8����,����Ij)��(�^�+x`�I�_��.�9C2'���ʮhNS�Ҁ>�ޛ]�N���_]YPB�r�f��z۳�ľ�3�6_�[��m���3U�{����mIr��+��e���R&�'�8���!y*Cb��,z}'�ݑ�
8�� h�t?ζr��I���vܟ�r�6���^��R)iԵԺ��^���p9��ݪ�U����/O�{�ec����%'�R��kWms]�a�u��y]H9��v��{�P�B�V�eE[D炼��q�	d�׸������2��ov�F��d�iQ�    ��K9`o-� �"|�C ��Љ���o�/K�{}i��4(��ɥ�^�It��+X>���5R�aϼEq�(�G�+qc?��r�9��*�Lr�+:]���yvo��/�k=A%�rB=�o��N'cH�%9��[�E��݃[FHߖ���_�ݥ�{�m��$:�đ��rB��]0�u�Z,�\G@�����:]��pK�����V�W�փ�a"0 ��B2�{����TdR.������������̓g��s�Y_� !�z�����nnZ���D���H�Tƥ̒�E��7K����|�;|�\���4�V��a2��<ϱ"?,=)�~,=��R���� :ǵ���rt\-.�Tk�m��H��n�Ѩ��7���|H�3Ӗ�l��?}�N�v$b��8��ґKE�N��w�|��,�܀���wǓ�_�\�̈́����X)�wӼ�>H9؊cʭe��]�NwH����\q�_�?yrs-i�vH�����M����XnV$W��-C��ڒG�E>WC���)-oe������ V�H����CZ8�;Raɯl�E���[t����wHzG�������c/���zl�A~�MI�-���3$]���uc��E�	��%m�%�NvXս��бE�  ��Ur��+��|2Sٷ%�+>eI�zO;+�w|]��#Ǝ���$��ʦv~E>������y�/�	���/���8����Ҹ���制&�z�غ�c���U%�*b]sF?U�c]�Ƒ���zw�Qq��D>(:M�L@D�6[����6�����*�[w������`�b����Ѓ4������b�/<����&M�}9c��T�@k������K"���IVs KX7z�2k�'n�h�`��u/�*���54�V�h����K�Z89�4>C��v�;�$�s�>�:�i�~�M��iX�ӵ���x����}���K��9�F�r-+e'37g}�z�hOy^R6 ���K[?�|����WK>�I��9��O���\�ζS�y��ڻ��e�`�����/Gj���s��(߆LA#4�9N����W�@jR��Dλ�hY�����x3y)�������)šr�)��.눏&c�7���GwcL��W�S& T[�� ��tF"#_XV�Xm�tɓ�m�� �^U";���u�͞@&)тuNQ�=d6�~N�̱�	 �0z���Wv~��^a��м0/Ra����P(��R�F��7>qF1G3/�<ʎ�K��C<�.a�]7�eo�;����a��gkI���������b���f̄���-�ԥ:�
�p��z�X=�c�۪���aur>Ci[�Q�#YT�B�n���"�y��e5�@�����Юɾ�
�DCc��a��Xr�/�^y��K����G�zo��+[�>�ܥ�7��B0����?u-�,�3�|�H�h�3���ч��!y�x��t�Q�X,��ךX"�]�C��Cټ��ϲs}�f�'�\VdO����B�0�B��B[�}f���)브Q�g�����X-���<�YdA�eg+��a:������ȫ��3����D�Vד?ʖ)�L1�Œ�$X�$�o$�����w��Hͪo�?�Q^�f�f���[����(9��hV�`��^�j1�{���������A�T����]%�b��EAQ܀�|����'��N�����rI���\�r��1��!�7���V�#$���ԇn��/�-��γ��=�o�����v{P�4�#<.��4�eM_�N�aG|�ɕ�y���k���tV�iF)�r!6������U)m[f��VZp��5�V־L���|��_�6!Mמ��؋h.�.�p���WrU����Ž�?��_U;|���ߒ�����VdG8��qb��IF�U�hk=��������ET��l>	G��nT��۞�"3���@!�e�~����E�͌A��R��E6ߺQq9?k��i!�p����=�[j:��AtL��Kj5�0Y��45w�V�7B�t���]WiY�E���Ȏ��-�_���5�ί�����g}�uycg��5��}�/�kb�ú���V\���w+\da���E|
/a�r@JmI�	��>�H�����X�� :���>�s����2,���� .z�н�u�y���n[�� X
�z>+W���m�U1�`5�4�P�_8���"� g/k�R�>�x�}g�y�V�B�R3kK�nGWY͒<@�v��t�s@��$����!�k��ţR"�ǫ߱�e�j�y���g���e�����M��y����%���c{��W���l$����W|XzŇ�W�M��v)H����A4̊1�]�L�����j���v�'���Ҵ�e�,Z6Y�(^�`����{B�]���������m�ǧ_���m�˗��t�`A�n����}A�z��+��8�t�LO�sp�/Κc�C�]w���R�F���]H�o#5#E��=�֊�\%�Fuo�zGR"�i�ᘮ���O��G�R6t]i��$:�;���{��6�`�����+����z�TTo&hL�nq	>�a��;����[�q�#��p��M�O�Ʉ�[���<m_�_����	��!�9(z-���x�;z�jr������.�*+���m�Y�_"�jzF��ΟAy��g'�V�@���0
��~��S��V�=�{-��=�a2�����L��3$m+S����;twRgZ���#��s�Y��n��j�봠���@3�L����-���V��%L�B�"�׋�8��ג��棛����A�V;K/9nG���슬�Z����SL�޽�2����u�G�	;Ok:�﯋����a��(3��X~�Ek�e ���mcQX���Znc%��5I����669b�6Dt������o �#��"��ږwe��L��ly�����]ܡ�I��h糏g/����h��Y�!6��<.Ѣ�,Ix���^�IZ �R2"����B\�-��@[��_�L�]�L'T���*����xP�s/��Z`3���w='��ӝ0���x���m0u�2�w� f����{�NK�նUx"����Lr  ���U�J��Cke?}<���	��g�U�H�|3�QZgR�n]��<0�,y�a�ه{g���:�WUg���_�`���=Q->f
��� ����,��į����<T��2�G.��N�����iq�r/V-���_����L��[�����+z�N:���}�w�>��8��4�D9�}�Ԟ�(�|i�&?*�\BJ�B�̫��϶/W�]��e*"H�~>�kB:���&ȱ>'0K.�$���~HZ,g9�
��̇D���������ҥ2��6р�����a��D��N������~!R3]��<���2�@z�;���0+�"�W��.�]�N4�� K:^F�׌�:��A�od_w�НwAB�T_����>�)��79��]�W1��%i2��ٯ�Xyj?�f)	�{��?�o$�Z�f�4��>ڶ�\�1s�њlD)ɞ�fsݓ₰��`�6��I��{:b�������
�<�|��GRju�FD�Fu �.S} �W|W{���ƲGf�-lR~���y
rp�X"�(���p�����aeO���q������ڡ_����4�ʘ��GLl�Z_G�^zX��-@�a�H(}�ǳO��� v0mp*P:>�YC���ozY�A��퇸|[m}�ی�����Ư�Z���:�Җ�ej蘞eWZ�����avb� 2�l(�=���`�0HZ�]���n0jBy@ֳy��~�$�{�
]FҾ+p� �qchc����*dЧ�r�ʊF���{ ��렶D�G�3����_ѱ�@^�aՎ�5���(��'��5Z���a�OНCZ�w���u%D>��[��<`�M��}���d�~q62*`(�;K����WQ��b�����#���s�ڟf��U�Ku*�;}e:��4�9Dk-?w��ä��x�Uy= \�4�	�ݳF!mx������r�3^4������ �u1��O����`(���OG�|    B�A����1}�P}4��p����z�'��	r����G�q��GZ�kåHG7�'�(c��2>k"�����?�5]����XY�AY�3�1�j9v�=k3wt�d|7����lp�!�9�/���u6&Aye�׺ۭ�Ĩu��@&�8x��2�	r�&"#޴��+�r�A�lw��H>�L<�igN�_�����Nf�Ư��|���W���xPZ�x��:tݏ_9�/l�xo�
������_���7Ø��Z�h����̖cHuej��y#�ӄ!��l��s����m�V�L��X,W�0^���ƻ�j���-(Qt���o=�.PSg�m����`��w%�-3,��:�`�6�IT�44��p���h�,Y�l�vN�G9	�O���L�<ޭ����`#.�W�#<��������2 �ne5C�y��|?0���z�U6�Q�=5H���¥�=Z�X�U�V���P�m!��{3bCSg�
���!�j�����c�B��űh�j��;N*��5��P$����eE�q���}���1��ӆ��Ђ6�����b�[�1p+B�Bb,��7���\�����u��q5�JJ۝5%��(Z�h�l0Gy�d� 򉛢��+t�i& <:�����-!�sڸ��"��cZaV_��Wt��s`�-�۷�͖�3�}[�M�=^�be�ԫ���H�e��e�>�|��J�Ӎ-
ZQ����A����h�Y/����5j��Z�AtN��LtOTX����/Z�A�Gn����G��#ɢ�GP�Gv�l�z�j���y�|�A�9�������k�f�{͸�����sS������&M'EI9���deʺ��s`Wb��8��	(��L���"�>�}�H@�0��"�bQ~����d'Cc�!41o�Y�g5D�{]�����z�nN?��\�gW�5��{HĘC'X��z�G�N��"
���>�}Ϊ]�Άc��[A���G�Gu�����Hј����3�OY֒�`w�Ss�Ϙ�Ů�l��m~D�*��R%���-��M��n�+�W��>չ�_�Ox�A�_�s�J!����5ȳP�xNL��[R��'��?b��?�'��c�L�V��w�C�̳���l�+'�܎�{��4nqw#�Ȇ������-^χ�\݈\���e=�sF��h�c��^�� �a_}�C���8�	��J�z�>���n� Y����x�s��/�c63�z3���83Ύxj(i�+�L�K	iC�f����?�Η0s���([e�&l@J�b��?��Ң/�t1̱��s���[�x>�6��1R�15��2B�Ȍ����T?���9A5���5\����	�CD�;nفV5�?9�ⴈ$�(��
��z��(�(��D�-��a�-�b�\�3Q�ur���3����:C&Km��_��ַʾՕ��⚔C�#Zoʏc	G������t��7v¿�|d�:>���D�ߠ.űi����}{QfT���$��َk� ��_�!t���Z��E�#�~��Yl�2AJ��k1��hx�W�ǳ_��NV,�jg}dc�_9R_B�Ñ�*�m�� �>����f^����� HǪ��ي����JѭnB�lʭ�> �� D)����c�D���_��x1��M<��?����)q0|}+ �K���oV�3�}�C�'�-]F)ɑ\��c0���C��n���]Wd�m�c�H��i��+b� Zo0�|�����?m'���2JvJl����8iuȀ	��,���_l�L�	�>K�Y�m��[_�kK݈�b�k����l1��>�dd����Uh�B���4�(��\�/�6�m��{�Z2A����z�[�a t��K0���,��)Z��Sծo�S{�X���\[yt�5�LG��P���` aso��O.p�V|� �Uh�\QCˊ�(Q'%b�!�ԊP]�.W�>Dv��%b�$����s�_��R=�����Z�Yi�6AV�{�R��n�Q���:�tj�Et����?��(s�Pj��R��IwVM�~�͹s\�n�T�l��~E�	ج�;��n��u�M%[XƸ�̰��׮�{���2���^$�+Z#�`d�� 7�~�{���iYt)pU��M�Ù���&�4�8�}D�VL][�?�;�1����ɨ5W2�|�Y|<�6�w�L�_��zin�ȽBט�ΦMAVƸ��$V:��נ���|b{����9rY�?����H�����6���"X+@𜫬y�(@�V�F9���_�N�n%�e��m� ^L�9h��-�pHع�k O�ax��A�#R^��n@n&C,�Z��1�8|����]�X��Bc*��Yà����u��gF�}�>�z�Zr=뢋�h����f9
�kӏg�8�c���m�/,�r��J���Z4��3��T.{D�Є�\��wD>�7�B�����|��C*�)�t{޵�VAޯ�'���r�u�% CC�B�1l��ϧ�ᐟU�Dh��4ѥʪ�Y��sDJ����>�����"��z��ʶ��1�Mӡ��{�+ʮ��슙	T�>���4ػ;5p�	�V�ތ�nM�\Y0�Ì��/D������)�����XŰ<m�Gż�30��.�_f7�(X�=8v�W���>*��[�Y��G��I�u�C��(!M4|�����	��s�}�~E/�$�3\�L3�{oYZ�Q���>��7��v��B���A�#�����ӛn�J2:���5��@���nF�g�o8B���n�[{�'Â���Y;�f�f/�����p�b~;d=[O�~>�YE;�k/�� �����4�o؁����0?���w5S�[b-��_��{LQ��~c�\������e^u�Z�֨����FWg�uk��$:V�zdA�N����$���a�j�͉���2��>�h\Y���S�$�в�my��}a�X��~ p��Up��Z��A�8�v�灪_�9�
�$V!C&M�?#�$"�R��!|#M��.Ƞ����[D>���QH-ޚ��j�r܇E�)���o��� �ԟ>��9��WtN�_�r���BS�s��fD ���
����0�bI���|�s%[im�� �iV&V0>�.�e)���e�~0-W���$�5�s�0�����1EM/
������]0�}.E>0�Js���$Z�d���=��@�*(]��������AC�)	R�����At�q��0�o[�l()|��&�a���XpGr:A@�W��m�����/l�o})�����bq��m�٣S@Q�Jb"FFL���<�"6�R����p�4�g��Ì��A�S�(+k�p���t���|X:�j��_��x��C|#���u�>�����F+S�8(`ǫ%l�ÿ��V+���׆7灥*r�;L+��� y4ƾ��N��\A��_D���0u�Pcz��)�B�Ϳ�,s�og��yD;���X��V�
pO���W�Cn�޶��M�f���i�����)f�����f����h}��94���Ȅ�9�@"mk�d�Me�:7�?EV���œs�����|#��:H�U8%��du�њb�nm��q	)�[�r�ۓh���З�M��z��̪�F�X+���ux$�PĬ6��HŴÛDǴ�g��Z{��bb2 �A\�4�;�a*��H��U�(����g�}o��dL�I�uw���ٵ�\��KY�-E�/�� �]����B"?[c��ܛ�)>��<,c�#����_ �6�$�ki�_��V�f~��|��b��nXNڏ@��|�Q#��4{M$I���":?��c�Bڤ�Z
Ժs��ֺ����Ф�����a�?��|�xqO� i����L������ ٩�A��qMu��0����$���(=Z�M�/D�gBE����B:�lq�t��9�;L�~�W�0,���1[��A�Hћ�C�*q$q�ھ�!L4Jw�-y� ���(�?ec����҈QŽ��U4a�h�ک��ȓlM��
������>�����h?��#X    �+��ďZ��)�".B�=-N8���&��2m#�q�v�-3]�ˊ,QHmd̎������y�c)��k�댳�Ҹ�I�yv5]>��Hǳj`tߖk�v����6m�R��ePd냲r<S�RD��
�Ǔ��P�`��b+���&m೅��K�b%�]�
�HQU�g�k��w}����S�ڠq�D�J���{C}ݎ<FN�� �����l�lX'����(ӯYo��
w�CA�����7Zz���Y:]vp�)�+�yGwp�Ea���,Zb�V�E��x>GaC��x8�׈V��]T]��!�B	�{�V�:et�\:<=�|5qK`~��\bMx����^�a�B���P6�|?#[�ïh����%��
ՖRi��q8b��5���B�N�+$.MD����[�A��e�Z�(B*���BZU��H�Y�M��hv���M.�C�:��x����u�Jl"M����(B{�;��8)^#��$+�ٞ} �m��tx�M-p��p�5��V��[����f��,�ҫi?V'>y��?c@lTC{U�'�e2��|8Iw���ĸ�n�:P��O��l>uB��Ǻ��i�b�D�f��Dюtm0V+[��Mvn�>M�9�8/w�]ʀ�V8"*<�d��i����m��d���_D�
�J����M�v��0馱��4��B�T��T�jEL�\D>q8�D'�Սb���K��Y�FwC1�))n��m�nr�~����Q�H��EE�Z����lĥ�{�0|��c*��V �d��c^�m�X�(�o[<V3�upqز�Y�ZW#�
�#_ȃa�I�b��"�8����n�����&݄� >TBl�T�x��>9�R��}[9Əȇ��7�?'�>�Jt�wy$��D�`(�ųg~��uo����>����:�+�o�����fご��R�(�l���\�!Ɛ�0�_�O���w�� �Լa5P/���	q�D����f��� ��WO�1*��&T	H�A�>�g`鵅m�e; F?(�O7�W�=�|t�W!`2s�������;6��������8�sERD��&d}��Z���ޣ���%A�����7���?���"��n�����F��|��.mJM�٣�o��a��έYL�W09�o6>�vRYp��$Zo�Y6J*J�:\�������/�JЉ �6��!Z���_��i����E��Jڮ�N�.��b����<ij����A����7��J�z$PX��":���J���U5�U
A�U
���b�R�m�CX�Y������z1zz6ML(�	C�o~�յn%Ip���LL:a�Ap�_�9���j�CX��g)�������>�/�m�z�S{#�:_~;V��x��p�(N�ͱ[0ktx�<�Ђa�n���c/g'΢zo�'���Gc�_.�|*zv�����{��Rcm��4S's��T۟}<�ְ@�`��}³J�8Xp�������|����2
Q�{��ƽ`� ����n�Z[�e$��)T/Rɏ=�.c�_�[��G�^a|��V�;��_��;yߊ��ᑥ���*��'�Atl�a����{xơM�=�N#�L�g��P9F�:�5����	���ӽn ��E����N�)��Ä���j1��o\��WtN�ZQ��z�����K�Ҕ }�+��1y	ւ�Qn�J�[���$�9���A=��_иɸ�J�*M��\G�����o��l�I�EX[�D>|���[-�[�������r7o���/$��T�)L2�x��cE]	�Ñ1���JpoS?Q�2C�5ďO%o$�����W�ÿ���$�)���/�>-sEJ��T��}�׊ڇ���O1<����z��U�b��8D�-\�k|��.ګd�֧����|l�I�1pVX�V��A"�@��LDQ����6t���ɲ�$��\�2�Dkr�*��[���P�v+�;?��I��\a@�|4Ք�L\
x�=��)� �fe���>s�i���u���k�o��ح��0� Ru���ʃȧN6hWM�qŸ���I:�Ar�8{Ģ[���+����z��Lܒx1�l�G��6��H�^j�"��8L.��h}Y�{ض�����O"�3���Z�[�����Е��Z_,�$W�!̥I�SA�=�߹]�j��!sl�6P	��*4���cl��Q#���%s�MiF~<��Z��N҈ɩnhY�����B|����5j�ӭ��2#�A��փ�|#���	�ԣ�ԕ]�"а��ib�B%e�45Gy}4M۟�����N�8h��L;���q��ks^A?�g荆�ô���"�����Sm4ޒ�` h�5�����-_b��O�w��P17�D�i����Sލ7SQX@m(@�jܫ$���رE�����Xc{��P��Tmv�� �2W,�������!b���O�����T�+�A䣿a�+�gi�hu nGc`%
Ho��4>Σ����֊�>3���z;���z)�a!�e�|s�4֫`��g�-�s�G2�r/�f�6���_�O��Vu}�3��f\o�!��-���H-�����+ßω�w$pD'���2�a�$�;)k?�C?�T��p�@ٞ���u|C��_@VZO�����ڪ��p��xau�dI�x�6�>i��������pT���N�n�����_ĵ[	W3�V��4|ߟ�ጳT����C�Ųgj����@�]�޼�	�i���RE�K���u��$�nY���� �q�p2�%�~g�B|�˪��C*��ʿ��&����Y�SkJ}�������L�Il� j����q�-�Es7�j���qub�fjW���@���V� �����6Ny��K��a���l�/4�;�vn"�)@k��F�q��/���Q�֘��Dg�����0���tˣ�%%7�.<(��L\��u�P>�#�#O��[+���V�Z�t��.m@��qO?b)4�zѸZ��	�@h�������|��HS����[����;f��`\����م�nC�b-F7�ѫѱ������}K��#�闪�x�x�]t�<���*�:��v�}m��Z�ڮ+�,��?u2R�2��"�`Ӻ&b��������wE�S+s�C�$C���
�d��!������@+�V�����!��{�?�|Y �RH��uL��}k!����۷�#F�1Z;���uZ��\�gy�-���$]i]��_s���Tk�j)��٦\ ��eq)�G��L'�4S~�b/$� �}�^�`i[v⑾�_�����	�D>��+ԷǍ,hXE�a�RB�4'�j>uu6;��V3n$�"�F�7U�k#�(Ʈ8"4�tՌ{�ŋa�����;��[t�A�O��P�]k� �m��������^���E�-[b"�����?Ek<0���9�dLz�oX�̲���T_'0D�3X^���۳�髳�l��-�Do��ONE�����:7���4���Ϋb�I���Z�4I�_N�Z�8����~��PU���Җ�{N�|/����%�"�RX�dxE��;��P�N�k7(8lP��%)f��T�g�F*��jd� �N0�bw��|���N%�M��IKq��4�<�|$��q� F�AA���$�@����q�t4��!�	Ҏg�ˠ�!� ��Z�F!�[�$��dW�MI����٬i*�M��=:]-^�-��fc��y���ݎ�n��ō��B%�v�VIA�t|Q¯ȗ�J�F�k��=vW��+NRD<}�����Y��\*<Z}��>U��� ��:R�}ZLP뮵�N
�F��R`���X|�QK�p���7����<"ԙ��v� �Э8y^8�i��ԃ�_�d忴� �.�"�5����{B��p�߽@"��XF����a֔W��X��V�H)�ݪ��L�z�� k�:w8{�H�WB�<�|օ휊��ǜ�������]��)'���ԯ�񋲵u
~E>�su-olJ�4*e�Ꜽ�#���ò]���4P�ۜiÜ    X)s	��~����۾��"h�5|��R�Z�NˇRGXa=k���0����?���T+̅hx��&Fv,<�#%l����h�i��v`.�6^��$:��u��ݠ|�@"���ѤA>䌋�Hָ��%�=n(��O7l@��m�I������R�Yw'�W����8����g*�ȇW�2R1���[��.�����Ӂ����bQu@�N�����j�0�D�jynYZ4R��m����Tc� �Kzk�=�|���pz.�`�{8��l��E�/+�{%�2��ʼi�|������-���"4�N�Q����. O��O�!;_�j�)H�y����D�1/{�D����-�l�I#o��O;��d�!(��g�@�Z>r��_5RH�P��)��O�8��t���c�P-�T�3}����g�͖���)d*ŸG�#,i�(��� ��D�!�K�F��f��G�z�F�n#Y�">V����Fm	�=|{\v�dռ�x�?m5�t�4x�4�P"+T���)����-;�T�$3
�+:��i�2�S�w��0���N��[w�����\M�/īOT7���At��O]��5�w��f����u��%i}5���l4��E�Z�.<��(���Rv���B�Ks`���֩H�����	��
����#:�oV�`%.;ﴔ��5���L����;�e����lE�U�(�v<��ڡ2��]�$�f�W`�[�}�D�k, �YmRN�ni��?��X _:(��9����t��F�~�[�'���Ӄ�O�����'V~R��Uij��O�����}�PC�7s�_�����BD�ġm���L:�[Um'=�)��N���Nw�+"��TZ(t�0t���s�h�9�}}��rU��:�U��_��)��^��;6>������ν�<ő�R��xI���a�,`t�hտp�<iR���s�v�P���}{�h}�Qʤ1������4�±H�6�����|p��x,��^C�AW�DhCVAN�޿m���)�QbH����*�5�­·$]>�����ҙ��p�����gt<��d������e��H$���q	VO�K؃=� �Y��	�%ֲ=�����2g��v�f�iBB�Q���J=%B䃵	u 1�z�N�"u���V�����K�g+�J	
 JN\	B���D��Zi6%j|{>��=�O��R6Y�p	o���h�ދQ���q�_!y�CH��A��'-a0@�ރ�r�M�]���[+����^BiC�CN�bkIDǔG���NG�0�ֲ��~\�԰��M&�I�>�@u��6���9�kn.
���3Bb"D�l�FJLb�zٔ�v��b�/����S�ߠX�R�����a�5U捧2���vb�a��p!��~����Y ���S�3K!����l��A�*����glZ�oW˃ȧ߭ɤC�}��A&��	���Vmt����E�~��
B���x>g���1�����ؠm�'������J��??��nB�YuTʊ�?�|�spO3�
1ɮ�C�Ӷ�W�V�7J٪,��JD���>��u�:���j��˔2����9�K_~&\�*���Ev��E�؅���Λ�� ��a�葥}oT�Cg ��=y�c8�>�Qt��.(P���ߑRu�b1�0� Q�y�`�IK�D7����J�+� :��#���v���"�Wh�@�~:A�N)v��N
q�Lw~Ek�Mcݖ�6s����sAa��8��`xY��\p�+ymd�� IC�7����Դ�w&Sk�Y*%�N�Y��~�������,d��[��|΀�hOl��=�	V���������)�������h��և���k�x>g�F�f��<n�j�-��]]�+��~랲�ҏ[�6��]���m۞D��n\��a��D������͗��+��m��
�źc�'X��VR�A���v��j4��t3��i2E6�2�
Yʺ06'S_N�6�Jb+5Mi�_D����b��=�c�Ȓ�@��H+�R��:�sq�G��gc0��1���MI@4ރQN0���
�Rh6��ƍ��ZHA�����IY�}~��@М\��V	a�d�O�DW�k���{��j+����#:W�PF"J���� n��ٲ��*31Ƚ_���hg��U�����up����  BZش������(@@���j�HHm��_�96yL�Rpqm̎AS��N���d��	:gn�56�H �-C =�|/��I���D*�);���&`i�Nz
��Ҿ�I�W��5G�����<^���
�h���l�A/`ƛ��̨��/S#VW�)?��Տo�����kc���6^ ��������n����9�v1ߝܘ-E�#:_Ϛ��i����F�\��ըe]lWu7�ȟ�s�\��_���uH�9%7�����Y��>�J[��?+%�g�AZl�j��$�Wh �����Xt���b4l����tc%��X� �ؼvtу�\�/]�v�h��Y�w�B�<��89��������$OA럼?��������6�l�h]	��y�ʶ�p���Q��@����u��W�k���0�[�[�\f1t��]����	��nM~E�$!�5NBHU���$A�i��m��?�[�:������9��/Dk���r��{���#�M2N'�� K�e�+z��љe��
�TK�?�|�W�b<�R z�Zwc��ũ�e��,���ݖ'��
�B�)�`���'�����T+��Ω}%��������^�e�m�F�*X���g�l��*ё椧��_pn3`���P^�b�Yc��ܥ�D��2.(�fm��ɵ5x�%�z]�m`�q\�|l@��U
��_)���S6z�L�6V������yu#��߆8Z۸�~�'%ce����|�s�z:I%y���l��j4ՠ�H�pЉ����KG��X���$:���[�����(�S�ʧ���,Cq���юf���]4�������7�h�_�1��W�=px�C���]
xp�����ݦ���{[[.��/�s|c"쑘b�������F�&��P3[�ƵQ���t,�f�O��ms���$ŷ��4�Ne7�ݭ@f*)�;���@�#<��z��@J$��W��s��j��G�p��o���Swc*�tܬ{=Ƀ�������np�r(5n	@�^s��r�Y��ѽL�I�Ko�����+��K�V"�U]�����F�~�!\ ���z��������:_�_7#�h�!ާa���J��Ռ4|��^��+��n���C4�AeX��H����ґ���EhՁ�o��~D>�-+U�}}RKP���kNy��N�DZ(Ӱ����Z��Z/� Z#� )D�0 �J�'BFy�Æ���[�1�g�/�V:K�$zٴ܏�G�o_[����#i7Z#�m���؀�_���\[l҄z��m�+���ZZ�촰WD9a9��;�V���!�'7U�Y�z�f���j&;i빴P��i���)!��g����kRW����nD��MJ��S�C� ��غ���m.��{/�=��)���:� �%pڅ�$�K���z���4���ׅ��c;�I)�<��|��r�U��I���?�A��cݓ�2�ٓ�%|�s�g���?�uT�y�,|ٞ���������\屬~�t�k��*8D�௱�W�|cs�!ms�����$*hՔ{��� /�ւ�����hm����$>�֊/dqF7�5��.q�os�J�N�����ZƳb�c��[i:M����n6P�{&�kg�␣������ߦ�I��F1�Z_�)pD�jpRh+E��l��pГAw�!ғ^��0;��TO�J�j�_�+�J.E���";�:[����UQ߉oo=�� Y����#g<�|�q5����y��bH/b�=��i���*��6�Kħ[}�g6E>�a�'�}ez����LA�˦��gԽ�O3a?/�n�Hs �=[�r�4k,eKn`��%�xi��THف�����J[�L�{��5    �/;��U��Q$�.͓�|/�>/�����+R�hD�UZ�����Ww�v H�B���ǐT7�G[��i�z���w^�k�dK-���L��|Z�}���7����L���Ё����x>��p!aNn H)噌�¥�Bil,�nKfC��C��u�L�xk���
V0f}�XQv6��C9*1V�b����{���1�P/Cx��`��q_X4��O@��9�
C�l�zS�ٛN~aUhb_��y=�Α��8:�R^�/��tX�5�,4�;�Z:в���� ��U�s���|��@��O���~����X�8z �,$O^�^A�����{�s���C�2NFf����9��2�7�!@�ӷ�4[ d)�_њb��"FM��!n�|�.K}�ϔ�a�j.� 	~�ǳ����y��~5u;J�S H7\ϰR9�a��| y?ݰÚ>��c߀?"�WB�8���>��[).+�3q&���'\m�/�rQ�����ѱ�z�7��N�(ݳ�~VdGo]3��[y�Җ�C��ҳ��O��YCŁ��MaH&:A�7)G�#^=1��cl��j]\蝰jnD>�[9qR�"�6Ŷ%�Rd��#T/��3�d����K2{a)\I}��?�E��tm;�D�mȦ!��iZ��L�|��	Up�{(柢�&�n�H�6���o�h�!������:�_^�B_A��>�F���"�\�H5g�k��{[�\����9�m� ��<z�����!�h�X��<n��A����3N{k�	�+��GQJ�����G�|6��O\M��Ǒ/�

�D��[`�`;�g���E�C�?e{�u�҃Z\�{�B���飖������Hw�/(��,�x>�o���o��8�e3��"Ņ��u,m����E��0�-��+:ߠ�����W�)�8
W��g�}5�Ej:��B��=�%e]a�ȫ�a}��OZ�h?k&w�B��ͷ�5�Jt�-�q�,��,T�������p3P�4h��~�8Ai{��J���*���OFmy�lE�l=,D>�2�9)^u�����<R�$M�%�t���
6��m-O�c]g2��D�XeI��v���K�-��)J���1�jG�\��}�\��|�g�:)풩T
��j��5Y���͏�E�3\�]m�x��2���c�qQ�_�Vs�O ����\K-³�4L��?��Y��U��&FG�lCW)�
\o��y�-ohrȤ��s*O"�y3z�M�p��=�����qr�[��>,A�|j��8�78د�G~CZ�o7�>��g"���LTc�IcKǰ՚q�o[x=�m�۷��#|;�hu�o%l�!���+u�s���1��,�i|�e���Q����n�׏пA���.fq]�(�V� �KSR�(����P��|/6E��NN�j���v,�� �,��,0�L�㞵&��R�/">'Eo�>fe��0��W"�S���
��8�/�ؠ5���+�7���*a����D�[F%�n'�䇤��G�k�������ֺx��*��<MH�:nZ�e��->�#�w�5��͑����'t[�Ժ&�L��
�Ӳ[|�U�#9���sO��~7=��i%p�Am�7>@	-o���F�P� N�Ч�kQ/tSl+�� :�6v��߮Z�å�?5aZ�Mٚ޷C�<c�JW䲵�����S�T����j��a�B�AB���/�D�����_���ه%��X.������B<U��ʞ"E4��K�b}2��;�At,2it�%�6�)�u�e�����Z~=������]�8�A���$%��+�8ЀMf��M�@��>�K�]IJz@��@���ݷ���ȇ6'���8�l'��#��~����\}�{�����A����\pR �:�wKU�Z)����̙�����qk�������)�ѷ�$`,��g���F͈	��sG���w�V�&�k*�&��UT#�����~q��N��l��ł����5���͚�D��������k����L_�3@ׂQFÁ�y����jW�K_./��B��8"�;ƶ�W.�V̀�����+��.�bݐ��۟���؀*P�4��~{�����v����o���:4kE�no�+[c�<�\�V�#�M_���hha:��0�FONaH�R����x<g*�EI;}�&4�R��}�d��$�?���Qkz ���GE>��"�w}��-�U��8�ܰ��9�N�rѻ�^�:����9��*�D�����Y!�l�pF"�D�6�������pgB���㹗�9�E���<]oO:;����ք.��\�m�"�+�I!d���<�|y�3�Ӣ���#Y����Ak�/8� ݫW����Eʼ��WtN�[q��ٿd�.�� ��od�X	)a�nm|Y�x����v�+�æ9�BYG�'C��˦�ycf��������|m�ξ�u}KB���T���  ��Ihg��e#���/;+-Ut� ց��#��?z~�9t�>6zє��&*�ix�O�_��Gk���x#ݿfc��os���G�����u��qb|
�X���]����zq\楌4�y{����"��G�'{d��@@��A7��OF,�́N�_G�r�������� ���K4�Ѝםv+�ܗ��s��ԫ��KuP������Atn���_�O17�����,嫲{���|���`ʮT�<��V��2-7>Dk�
݄a��"���Z�:�u�g�I�o[�5���g��{z���+�W�&��h��ޕv��$��L�m�����d"
�l�{�>�|��w���ֶG#�:[�,Ҹ��7G/h�B�W0�ZƑ��*�'���[�R��cuS�_���{S�Sz~9&��&s������";���k�J��H��4_/��U�@�lh��N�D�e�x��+�x����ϩT�������Q�>�����y�%����R�D[t�&�+�W1D,L�x�g� �_���/+�ڜ�t���K�г�e�_�$[�Wr�t%����C� �-jƲc8��|4�]9����2�����%~E��vm��y�s���[�>0C��VTe�����SK�R��<�"<%��	�E�f�wl-8�z���`�{�us���oRe+X������Y�v��V�� :� s�{� L��-[�^�͐n��#��@�N�{ގ���Ww9���'iK��n%�a����f5�*�����?�� �N��џ�1-�����5:�~~@^�ݲ15Yz�DR:����#�͈���6���'���V7�J���N���L�6��isFG@>���-���(G��Ghcü"]�:$�_�/n����Ʃ���c^��I�0_Nٱ0_���5{@�	L�s��Z<.�l=����'��A����
���P5zz{=���h��{�?m�ԅo��is�=l���_�B��q��6�K��v�Z,��]5n�I�3
� ��z�XWk`����U��8��%Bb$Y�ܛ��.���K�V=�����,ƽH`�y�	�K��ε��$l��$q��U@0F]v׃��#3Fm5]��U.��eu�����T	��GiGʚz��%����Ǥ`���I����d.���$��MN��ah���;��7�;Z�y��At�f4����Ҹ�p����׍��T���|�s�<7�į�'N�����4��(��S$�Ъ��D	�M]���nq��u�Y�����LV�����f;v�V��<�+R���`�%�8pѐ�(y{^��n�X]N(&�O���6�uTʮ������D��v*fb�˓���Մ�IV{�x�ψ�e1y�y��u>z��N�Z�YC�=�Q��!nX�_��ӫ��a�^M�v]8�!%��-P JW^j��H����"�i�Y��o~�;ZfuB3��}p�[�N�'��C�&�=y���M�%I[��R��c�Z�9���~�S�]��uʽ�����K�w	I�O�[���$�Y[�"���QKç��(dsw�c���    ����i
�ިB�g�
T��(���t�����t�[&�E�lz��r����/�W���I4��� Ie��W�A��C/�R/�J[w�d���b�-F��$�q���s�Ʒ�.���v뮦{4mv�B�׶G�a0�)n�ѱ�(o�ؿ����H}'�3��X����u���C�Mo�4�����z�����P:���]�Z�-��ɡ�MYD��G���b�"^�� :��*̖�?R?���S�������m'�'�|d�O0Z�|>�6���A��`ӥN��N{��
��!�.��N�ǸGڊ">���+N�2�T!��h��֛���a�[�'�0�o���G_�a��<���$�풼	�B@s�A��H�/{�)�����W1�������{�_�x �m~W!e�b�hH/`�.�I*z��G����߷A;�HyËd���2�NI`X���sC6�2���4Dk��k��P�A%��55�U�����C��y�0|��{�����{�	,`=Rn.��*qC����lU�`j]�Ҡ0w�}�+:?�[�p�#������c�0����ʋ��6�4��{�B�Y����|�	kW]T)��O@lRÅ��0an�/w� �<%.�V�)��O"�����Tv~(h����2�.Yr��&n9x]��&����s�F`����5R�Έ)s��;;� �6��k<�q�uA�^a�}��ʾ8i<,R(�pfڊWdZIAtoq������$�"-��x��=���Q����O2^�Ws@p������ �U����u��OY��ź�/+��*k�����B,���e��ɲ���!N�}7jW3�3�;x�Q[��ǳ�qu��0���+p����[j�2#���^�?�sOl��L��)�������7:0-���a�?W���5V��x��O��ӕ6�D���i��ܻ� pʏ��^�:�;�p���m�����T�}^�i��ˇ���.h��h0�� {𼏥�yʐ.q<��瀖~� 8X#aȊGr��4͞1��"��<F�ׇu]�3�=��W���'�4Ώ\�)R�ƃK�Ҵg�|��0`�m'w*`�;��W�=��wHV0��}������j��_nWג��Y�'�Aʋ�wf��9�TiX�rO:�\�mB�W'ɉW.՞"��Gѿ���aҪ�Wt�^��������\�iy:a�����h�e�&��)�Ȃ�}�x^�'^�Ot�[G�d����@2-�s9	u*D�ɏ7L53|{����k��k�3b��/w�Rx���).жҎx� �:�Ăԉҵ�>�"�K�`�6ߛ�|4��[�7�F����ZΚȌ���+����Z��y�_��F�||Y���ɋʚpЕ��m��씭�Q"J����oF����1N���E�C3��P�Ftj�]�El������n�D�16B�8F�}D}v�;/��j=�����'_͠�?eB_�� Z���HL��2ː�d�u�IS�I�����D��j��� ���s��r���l@��u�d;@�x����.�D]I����,E�v濈|���H0+���5,�]���(�u����j��;�x��`/�66���ɯ�'�)7u�).�L�N4n�0?��d` 8�C�<L-t�-z������h����9s��IN����ا����j�"u��X�)�k��Mi��w�o�Kj�V�c]�����l����"H+�"��)��$��0�ζ!.���/��V�NR5�I���C�F���ѹΔ��������X0��P�5>oD�6�@k['�p�5�<�d�At�B���ν=�]4S�H�d]V�J?-H͓��ˆHv\F�����/�Y�Ì��� �hc2lm
ǀ��Y�ፋ�%g�C��q����E�6	)��i�q@ ju�lzp���`�	���>���%XG�1���BS!:��Z����1c>�yMH�̄���||a��p*��@��Uᔀd���2�#]���Ӧ�mz,�x��$�{5�=e��CQ��ϴ�a��t:�Ė�B�H��*������}QN��o�@��B���_�~�yE�Z',O{��U�������+zՁ� G��Z�T�4�<�lA�`ծ�p@Όm�#�߫��[�W�+p�YƩ����	�֐N��ܲW�'�OVc�nx204�ނ�Gt.�5gAƲj�L]bf��ڴ�a�2��DFĻ��#>{��Wv���s���=�\�d�E��-;2���5	�P���t)d���s(KAH��ڕH748��43�&�
�'�a�R�(I��4����>��S[�L�T���_�tԞAXt:�m6����C����ᕻ�c�$Ʀ}�ju����4��di[��jY��L���Z��ߟ�U~�P� �a ����{�^�Z��ٶ�T4�b&�?���]�C��n=��׽�m��y����o��<�2��0���=�:dA�U��Fe�U�Z���o"��^��	�p�;��n�����q��5�Jv]�{Qԃ�_B��w ���V�#���^��P	v�I�U��A����Qy���
�.�����HW"F�	���-��h���w�&�� mh�����Ź�`q��s"�9жƵ�����B�E�O��
��8�/�%D9�����)�+�I����+�?����m�9L�}Q���_���ĸ�̺�`���Lx���=N�ϼ��i�����I�B���{��ⵡ���Q1�8����l�Enyw�ɵZū?�j�F.���%�ꇺ��SY7Q6�K��[H�ΰc���k���oa��[��O�W-l4=��8���������ڼ��
�f�S����^���̌���r�1	f֠w�m0�"dB:�XMq�������C�*���sD�-s�XK���s�I"�r�������,�_�Oѱ���э�_������,�pŋ�;��Q���8Tp�rJ�� 7����A�f�/�v�RD�j�ð�k7񢱅�wW�갾�ĉ�i1)��y����_߽t�Q���=�7޾��e���brޗy����#3s���O�s�Ws�*1p�L�� ��4����)�=�e\m[N͖���]�ӽ���w3�^b��W�C�^ӊ�[�M'A�}]m���$yWQ��n�D�.��>��e���O���G#"� �kޱ��vߞ�n��`>�}�o�7fɎ��8̝��\n��W�:x���U�M߼���g���C�K��� ��ޅ�����2zo�� ���+��|~_�d�]����Aa^)}�xʒ�ܶ�8��+Z���iK���ғ�q�=����;�,�q�~�f�p����%t���?ZQ�( `0�\D�0h`��`M�V����V�w���=$���o�k:WZ	x��uV�Jq��3~�iߠ���F�ɉ�ΆᔪMg�+ćZ�����p��I7�<�S:��%%�A�L�����Vq�`�|�P��x�����K�XK�lt�-@%��W4_�$��k:;QV6qʥϡV��X��CEX�2�Է˓H�ؼ����G�*������P�-�J��\����P��Q�@]lp!M�$ �Jt�����MI�ed�ۖ`�i��-r"G,�y=^U�r��=��7��Q���Lg�]Y�T��b��`r�f�ˇDI��˟b��<�ld!"�^�#-�g��4�ܮxE�JmW�"�����k��k���מ̋8G{�4���r�UO�wÝȘ_,�p�;E����$�5	_�f�7
���&y�x��e�즀U�d�����k�MZH�&�$&�.+(����%X���O��Eթ;W�e��k<�����˥�4�8�*,��K1��T6�9 ����nD7<9`����Vn�v��~L�XA�Dʐ@�^Ԋdțl��S�j�H��:CXQpid���(w��=��N����J�;3��j�|D-peJ.o�T��4J�P�2Y�_�}�[�-u���6����Z��ܔ�������3X����d:��z�S�d��aԺM������t�;v��    *��@�yn���t����Ψ$9"SE�;v{��1�t�5���N����B��{��+�o��\��F�y]+�m�cQ���Y�{;е*�)�b*�R�\1����e^�m�ABw�������4���	a��U\q�
|p1a��x<���P ��Lf
��oȠ��uO#�T�ĝ��re��J��!���K%sqԧS�E� � !o�N��q��#���D�NBo���_���E�h���^�}�2��'�(Lw��?~�	޴Q����}�x>_|ݓ�!I}�X���)��.F��-���	&�W}_pʣ�l�:��p˘���T�c�>e�h]Լ�R��D��AX�ZQVY�`��$l����]�`���P9�6Ü$^�|�s���L�]�Bvp�σ�|}M��wsWR�˦Ǫ3�>ʤ��H

����`@��s30փi��A��T#a2���N����J�QGX �%Q�VC�.�i��x�x�䉷<MM&r}���T �z�dLau߃�����1c�|0�}�����Qʕhf �79�d����>ّ6Ђ�ս�d:�O��V�R�E4~���*͂�R�+�r=�<����d���Y]t�v8����O��R��O��_!��\CW]ٽBL��X�AP��s�F�QK��pRpF"!5�b��B��AwLw������m(TA��-�@qt6����Ni�HK�l���k��d������|�r�o���]c�������K� ������zC�[d�� U�7���mH��>ʒ�]i8�
)�d9����6������Kw�i$1:��j1�к�,��m����M�0v��	�����Ur��V������]�o���-$������Y|��qJʎiD�c��J[|G�<���+�O=�ӷ�Z�
�@՟����E����A#edz����n��1��h;v���m9���X�Ҫ�>�'
�.����9
t���&�&���������&�e0��>T'�n���3d���;��pf>/��Ai~�� #?��չJJ8Z䜼(l^��I*�ݯ(	�9�'���0�j.���>�N�l�/�� :�܏0�u%���'ضP�Ϻj-f�k��^E��_�}�*��� 2u�ʻ��I'xu��<���Ztt�m��߬rhnz�s�Y\��Oh�#1�{3�Q�k���p�S5����s���(t+��T���c�o�j��Hh���k<��
Y�F���(5�"������SJ�&�����f!醦�-�>�L{0��X=�>;G������m��t��1ہ8:�J&0�thL�-���Z/�XZ��ё��|���[g�f����(=5�����d=�]P��z����c1#�9����R�<�K�d�Iu5[?&k����7�a�,y42qڪ���ڒ�Yd�68�c��0Y��t%�q�L [�ԏ(��=Q�/�򾂟���J'����n��WB�i j�[��C����/2z�)��a�ށ<���zC��|Ѽ������j�T�k�&�Z�^!�:���Z�IҬ�?�v��#���}m�r�"��]�,���/q+nۙ�^�������zp����*ٟ���;:*�U�t�
g����D��%�cߗ�=[ӊ�ʴ�\��!���A b���0���T��f��9�������n��r����Bx[.,+\!��7B��?���c�~�z���͊��C[��R@!Q��s�I`	�t+��E�M6,k��I>Z�)76��/��r/:���19ٶkL����v����f=�T?� �{�#jޡC��foG4_�D���>j�k�F�i������<E�T�iF��*'�6\�a�廸L=��^��f=X Q��Grۻae����|fKrc;����O:H���cFV09�6�/�E �B
�$@�6Z_�@t���ı�Ńi�h�+��A	�@�����;">\��ߍΏ+����?�B��aLօ�f��Xl``}j۹���������M�O�l6ο&km���OO���Tj���p�}k�BW#'2��.�A����h;?�
Y�A����_���%>3)�aG4�$E�~1�TH�mM/ֳ#����.�}�� �6P����D��Y~y�Ϻm��Q�"!�O�ف����=O�3�{�N%�*`������rR���S����l2���.}£x�}8�5v�����"����OhCu�a�ӉQ�L�g����I���3��Q��gh�$)���7��*�Ro��n��)��F��I�[�c���PT�zׯ]L;�ǘ�<���"y�ǳ5�y/\�F/�sKd�uǄ-����~&��6Y~%6�Е�d�vo�q:5Y���JA>�9=����3�7�ǌ褪�?�Y�R���S��P�j�-p|:e�G����aճӘ���޳\뀄�:k}�������t�����r��p�Ag.�6��5�|rè�ڴ��ʏ^��jC�{�b_�ٕ�Hu�d��/�
n�Lִ��Q�SF�d����Yk ���t���w�a�l��s�}���t~���ӈ��*�
�ZM-���]ӹ�P*D		���>�Φ؇��&Io�f��r����FfY=:��8�� �M�cx0ـ�Zz���8�M0
�ב��'Pr;\.⫔eng���E�`��m�^VY^I�&-hյ�F���L%�ܳC=�u�o�^�Qy>��}Ε���t��/ԚN98�e�2���>�͟�k����LǬ��x�U���"q@:���u�ߜ��C2��5��l.��*�y����
�83��rw�`g��z�1i�^��į��+7����߽/$�8��2��A(@����s���iH�^U���C ]�\Q�QVj��'9��Q7c�9��T�3�e(Yv�Mg�W"V3/������.�,���.OĽ�o)�|�c��f�B�|e&���`i���&4h��#]�c��9�M����[�8=����|w�`jD)|V�z�(F���F/��z����U���]��t|����nn)MD�d]����n��5]Q�>F��]>�v|2�1���zk<�T���k�A|��r�h�h_��Ŷ���gk��>q:��.jn�����I���=���\�X4�]��$�ʌO�s����4,Ƚy�����Ϳ��y�U�����hﮢMp}��)�$'���!�B� w�.,.�A��N��������jdq� &?R�����G-G�{Y^YE�ە��e_i��y0Yg�0�f%?�N��1Sdىe�)$�V7�1*�U�|>��-%=Z�$�u���3,2NQ t��@@����Q&|8��iDhC�E97|J�n����l�]�"���bo\|RBw�e���״_nQ�6�0� Ët0@Trݤ��q�Z�@[xh����9B��?Zk��}�M��G �b�Y�t*Q��h�5��\g/b��y0Y�.
zh2 ��
0�&�I=ɰ���\�b��RF�N�GYB��||Υ6ިP5h>`vv�b��9�����w��Ti\����~�Ά�Z���:�y�w�^aeCyqP��܂F7\h�O���- Q�Lg������j�p/���Q����0`��&<�^�xi��p���m���'�}r`9("���^��5�f'�)�8�<a����JD�� �����P��W[z:-z	ĨM��'ܓ�v)IY$�_��*�����4.?@r��Ka ]�� ���ҵuqp�2�?���X#/�;^
4�X��7cp ��������������M�/��P��i����T�E!&�-��TR��]Cp �@�Ϯť�-�Y�.O�"4T5�bh�\ħ�V͹""�kZ����b����V�MY��9(1�F��r咝�Ir���S�P>` f�8��d�L%�����ڈO�BBS�
S"Aƺݝ���n��J��}u���^Z�1��ͣr�""�Q� �m�����
ɼ�t���Я�ygL�ѷ�m��kP����_`vY����vo�3�]0p�����r��F��dr��~��;    4��e�ie�« <0?�o^'Y Y�mG)ʓ��a�mD�2��T3���S5�Cr",��L�Q��*���5�1��*ɏ4V/����cXr9#�>�c��ęɄ�$�9�(�]{���+U�q�� MN�z=��m��<��T������z�B%5 �y�,�[��N��!>_N�q������+���$x;��G.3���$�����W��$-�+Q��.���D=l@/�?���/TŸ�$ˇV�%�(Κh!���.w5㪘^hD��ɑ��`��&�)͔��Dݦ�v&�ӣ��Չ�
Gؗ�PXґ����iy�Sμf��UН�&Z�7�#7�q2�����=XJ�����Y��r��O������G'O��('-P�ލ��)y5��a$&�ŝ��@�y�ISr��I9#3�$٠������P�]��`rM���S|���*���	��傺�p��L����9���5Z��А�]u��M�|�������ˌ�|� S�J"�;..���Z����°^U&���un�pB:��r�Y]��Hs��0[.DE�J��k�bX~��q�*d7{�A#���t'�H����QB.SZ�{0}Mn<�	%Xi!)q�2����v���` ?ɥ{wW�c�}�r�^����-\��G:���Ѭ��
�ٞ��!
1٧+�����?'�V�����d��	a/�샂w��d��g�[�yz�;�X#r9MC9(�9�]K�p2Qyt��
�����sI�Y�����V��}�.�� X~L������4������;���V8n �;�����XDn��T
*�.����sv�K8=�b�Ȥ(�8C	���8��!bY���/�F��z�#��]���� �"��r
���$���R��j+�&%'a�xL�m�$��!9��>bKY�;�Q�H,�a�&d�;��9�׏�A�! ����G� [	�8��
}=��;�Vs�Ƭ�"?���W�Ș|d�d�-t<M��kI�],�\~��#��z�g�
F������'lr��ieT��=cl�F:뒔�������m��KT�GY���!��"N��.��X6j�ō\���F���!�Hv�?�\����Go��7�'^�iZ`Y)��q@��F�`Kn[�1�t�Qd}Z5x-���g}?a�L�Rd�,bT[F�B}��,
��n�bV5�kTG}� ���V�S�6VK�
D#��#a�m(�K|����O�1��qҞL_"��>,,8wر�����{�sVM��:��(*Fr��O�*�fr�~w<�l�V<I�=d2��1���T!��O���#K1�0�����=���? ƖC|��&��ci�5�	�9�!�0�1�4O{����^�N�m����nZ۟�?*2�`d��ɦ�9���I���M<��E���R������xI�dؑ���Hg�@��&`���kۃYHP9��d2�d?�]cC��� �_1rѸ�H�-��|���X;�)�Keϱ�&��rC���0�ph�SW�J��i��	�m
A��f/V�b)��}Á4��}#�硤�m������"pIƗ�]��?]�7e��+�.�AO�U|��c�����p��qd��N��f>��+�("���	G$���8�E��1}�7�x�HtT	R��� Ln����u���=��L�C��[���=G0�����]nDǧ�>����}�h��e{5��R"
گ�oWyf
���'���Y��E��S�����T���V*`��1Ia��m���	�r�]�\���ӫ,����󿦯�5�4�nˎ��x���k	4:	JȨ�K���A(&d�`�j�}�w�sC���$�?��8���һ���k����4����ރ�w�!:nQ�v�������N-p2�(����m �K�֛}�_�W�H鈧��۬u�w@���C�����������T�1�-��`�j�}]��	)�W�[Bezi�K7[|�ڣy�c�Y�+
�ۉ(�F�}�|�*[�L�*�0ǃ)��*Gn*
s�$������`��ч>��Ƅ���?U�/[2�8�&��#҃k�B�	�5_��G������vL��ʈ	M2>@�`��s�L��Vr��d��qe��1�M�����|�c���(�&�A2� �Ѭ��+��@�A"�t�t<��ĉo�*j2-]��S���J��W #��)	����&�U�bE��?5�J>Sى��u��`��tK�����eٜ3���z�����F�Mؙ��d�꺸vr¶�+�� ���L����`^)��>�%��h��_���r��JL�,��9��&�埡ޚ,��Z����h̒�������=�
�b$U��-R.al�&뤄�+��Q�=��Q���:��ٵU�J|@ԁ�/RB�j����6�J�r��^R\�O�0��Ư��#�#.�J�.�bY��FL>�C�t$��S�?R��+��_���+���:ɥ)����TG���~��M�Q�j���=C~M6�"�!�$�)�z��n $���%���*���E��2�'���VU�#��PJ,KM�2K6Gqs��T��i��H�u����z�?����
J��nA�y*�a�_�W�s�WL�i�f���&�n�5@�4�z�A�_�r<Y8�|ӄ�f���TS��T��S'x<,���iAD�Z��l0�P-�U�UP/k��-�� i��M~M�� �!��Y��d���+0W����U��.�n�R�?p�cra��nW������P��.�&oWA��I�,��T�N����Ѐ��xvM āH���v4>/Ǖw�c"}�C]���,�D�BU�#������2#&�l�2��C�6}j�)���������uj��1�w�)RF���܈��5�mg�⬊��i�_����q;��sh;Џ�5X�T��p���ң:�D)�+�oC�a�2��%;hI��UI	����\��ʵs���p2L˛p@�8s�
��-�ۋJE܊գ?�\dK�Î���u��I���)���|&��좟T`��W��k�L���Q}%�6��5�x�ƾ���)�2=��*��xvM���5y`�ޓu\�H�H��ņf@�"]�E�L_��K<ŗ-�$%< �������P����:3^�/)a��ĒLg'�k�Z��w��@�S�I���̚�)�'��,�y���IY7�fʨO&�$zA��>�M��H����	�\E����W���]�"8� 2Jh6�?&׼�2S9��>V� �<vf�;�J�]�jX��!
gX,Ư��L_��}��}�<RF�n���Nh݇SW����_H�VF
�L�����UR#�4}�Z��W�7���q�����%���**Mu���|<��*���m!I��U���r��hB|8L;�W�+;*�=�=�=�\�T.l=��4����o/ ���zP�t"�,���
�2�}Ϯ)%#�0���x�64�%*^�mC/P9�]��$������tν�:�)��Pa�s v����]���<�A�VrW 3X�	p��_������(�U�I�d�)n'"�;M�RV	��<��fw ʽ�(Qi��g��B����	Wu���n95��PqL����\S��9��_���(<�a_,(�����3���q'�+D��t��(:����>��چ�R�@[ɜ��XǞ�2�D�p���ØsTR�rL������	�:�Z���F��r�J�g¬�VPf���E� ��"���W��o+{-r�J�p �R���`�=e���H7�LI�V�K~L_�+AG�{-�OUeg�|�c;%��%���){9	<Ĥu�4hO&7�,�B<���40'���O���!l�lHTI��!�)^/���?��s�ER��?������<�Ò�~�__q�z���j�asmn����u�*F9ޕ��6�^5� �@|Cn����W-]
�ߥJ@b�Hߖ Xq����[4gB!�}�'`����� �mN��@���+���?�v���ٽ��n�H    �(�wKigIR -����`)�h��%�5��j������>�m* 0�Y�Ct��jJ���l��q����kd+nj��&sMA�P_Ɲ��:��}{�A�.#ɵC�&���v?�$�"@Mp��ho\ 9�7��BDH�J��B����drM^u�r���e�Ӎ}�p���ʎ_7�N���ߦ3��t�����fhA��6��N\UI���*e��T��\RaܐG�������G�k~�CvN�Q�0;iŧa�5b�?_�^�4pv�t[,�?����~�Z�E��qc���ٗ�g�Q��]K�O�AV��!�q�B�V��\�<:����iS�"��ϰ?�)�Xj��D� B������	�A��l����f�
�np$u�&�h��QYs�N��6���*���=���jd�!i����Jތ�z(���#�t
�&7��Qh���$j�a+�������v�F�w�L.ή�:[��>�\k�.�еx����T[y����hr�h=͡d��kxY���y0�W�2�h�,�oQ;���,�|yD�|������U@�|�q<}���PT
F��.l�*�$�L>u� ����%9�RX8d2�F<���k@9���[V��.s;p��0���}\��	dR�?��])����`1Op�rZZ��:�E��Gު����#1�=��R�=u�7�'�9̯��Դ�&a"��iD\���ykDĊV��*ĲC~R�܈����Ϊ*7�\�{�A2Y�4��	&%�1��H��C��R���<�L_m���"
t��h�����+�z�L멫"�pNNDJ	Y��z�L����3��uAz�21�\r��y��,k�ʁQ솯� O���q�2;�G7���Y��T!U���������)y�O۩0��ٰI�ɪ6�b�ZU�e��,D�w�,R�U�K����Zۘǳ5���\3���{@����R��lW����HEA C%ey��kT�9e��������JU��ۥR��amW2���f���k:���z�%�'�^	kH;���3<� CJ�������D=���9������NEZ�{�����[�`��2��ٵ�
ڈ�ݕ��:�.͗r�h �E��h��[>EV9\~�j|2}���u౅�U6�;J���9@�d좈5���vF���*�w�_�<�X�_����j���)6#�4�;YډmmVu-�����~% $�����!o��$:(���;#��Tk��[M͸���Dǰ������5��^n��xKY&�S��Ӡ�5�.��Fwb��Ă�\��x2�߆�]�i>��� 1Tbu��1C/���'t��n2c����p:���$+?R�v%͖��r�dނ���+�O?��J������*gM_���tG����He��.�٨�a�vg���)+d8��z1�X�����p���#X��( u� ����R��(� )���H��xvs��l<_�|��\�\u](��r]����b�L|0�ִ��	�wLh��#�'έ���В�;B+�d�%�.�g���`�X��j1Er`�k�:9�6ˍ��|C�9CS�\���d�6}��!���i%���i�9Fm����f!�2,F���	�G�@�Ɇh��m�t�-�vE�ʍ��n1���vl.��>�n���d:�u��G��qK�������:�4�z�����J]s�6����4�bi��W�2p��T^w�AMK#���M���C���`_mAb�}H1K��}=Ǹ �j��Ŏ�6H(k>L��+4V!�v�^ a�n�g��k�B�dE�L��b,8N�2���ß_`����V��b�̯ɍŪ�����T[khH��#j��\Qwd�Pn#��d���4�5���X��\f�k;so��jK����U��H�a��lگɵ̨p���V}��C"η7��!@6��d�'���]�&����]B�����j؁$��j)� ƁO�%�c����OX���~�q�o�5=���F��Q��o�C�A���'����s*�тL&����4߃	�����~/��f���}w��|!QP�`�*/�O�&߷������\��?N
Ne���U�2�r �� �0�E(:5��%y&��v�����(g���v`F����������OH��(8f$�5G��k_���Sar(� �	��:�0T�fxs���f��R�@�F���[����UI���`�i.��+�'�w�P�ׁ影�&��O&נ�櫬֤b��Ye�/�aD'�\Ȧ�|��p���D��G��e<�\�J�Ay?���cr��d.;(��\��)�OOR�1> 7,d������U�w�e*F�l".� fڣ-w����3�G�P�)�����|���zN�}C��Ǎ�W�Rw�NX�M!<қ��P�Y�8%����]z�dr�����O��#����{,�j���6�+����s��3Lԍg����k:����+I��rS��L��$n��� 4�>l!��3�fY��!u�(�@�w�1� q��!�p��b�D��>�Y��|Ǩ�Fn��	��4T�F&����6~�uQ�>N��A��=���D&�ɫL���0��o�,�^�c�]����"����Wˊ$�Ty"�Y�ёHR%2�k��P�_��h��D+�P�&��� 9d���?M��j�a8���6�x\� �D�g��FО�`����50P��Y�O9�d�CknD<�=}��a���������;P��K�Y�������W`3��W3���@�(��Vc[M����wI<Q
Y;��FE���=���i��e�Q�3ՁF3p�O`:^�Y�ٽ���RT���ՄD3��]N"$�M�C�(�I��a�~M�������e�����@�F""�yʵ+;�)gF\��ޯ�ZU�B���'p;�����`���>��G�M<����6%�|��(x�#8����O(�]o�9-(i��X\a�x	�գ�d:g �OE�A�M��-@�p�9�O
����6i����H��������^6S��i����#V=�zݳlv�r���U�R�!�8��CLJ�g�jQ���\��rfv� �A�]Y�6V��g��+=���A|��qϮ��-$����C���Of-��h��
�kSE����/�4B�6c���|<�u9E��ȸb};{���1��jf>V�g�����t�:�{�<�\�^��f��+�#(+�����D�m��J�g
�}qØ�g�B(W�,Ull't_eZ� #� �r;��TT����|^���bS��d=XR��7�;�����.��`:�O�ռ���3���*�w7J!�6���Əo����@A�����$
X�O�O*N<�p�<����\�$��L���Qq��nGɄ,¢��Y���.�i.�-�]�J���:Ah��Gڜ�ZBE��\�N�J�����4*$\�FK�`:wͥ�\��;B��lA�����LY����"+�_��a���xv������G�!�M�](<�m����XY����6;�5���&ߴғ�u�:%��0���'g7��i8Z�Jyy�� A��6�>n4�
�=;�)�� o���;����z%@�$�k��׵nD>�F� nчh23�Tx�X�9Dd��*�:�5���\���v�(*J�΁7"h�v�K8��X�}�����ԧJ�Gw��`��ƾ��k�S?.�^@t#��sB���>|�����n��`�|��?K��y�Hv��S�N���e���ɍhѤ/jU3��B(��D7UK�ڸ��[.#0P�,(K�������H1�ϤT@v���uH5BnHw��	U,��6��?�ܛ��F}�!� 2hI�tڈpf�g�r}Z�%_Y������ǳk��\��Gy�S�)C}9(�%� ����>�(R��4�����
�P=B��1Uh��vęPm,^
��]E��*M��L���L���{��D��P�!?>_]���+7���ځ.��%b��)E~S��,(ߨ�u����6D>���d�j?��Y�
�,q#�    =�֔���=R�KRA��+~2�<=T�gh��	L�-��4����E��*4Hn?�w����(�M��5#�k�_�qU�4U͌�+�W��I^�]�` @� ��d���7Qrd�_�W� o�]q,�8�C�.�CG{�@#�]<�v��LW�g7�JD����Nu`N&���O�$UIzn�! �=�t��L��F�6dU$�^�{�!4���	:H,o?]<�p��4o��8+��e�O&ׇ��������(����H�G�#U���3�~��o�D���&���R�B���kޟ��Uq{�0�?2�[�J�D ��u'��VڏɺԂ�ey�N�~��e%c��7��_a����5�)޲��krM�+c�δGU����t8tH�TJ�!Qd<�k�!�ǳkMbPE������;$D��3kۇ��hP)���
��dVBpGՏ�\��5�����MJGHߤ�٧�Im�]hP�|4��:����!�x��t�-�����C#Vp�����:12m����Sd���4Ι�}Q��l�O?�\���;(0��*r�E	�b�m�Yp}b�	���Ύ� �#�=ԕx�Ei�ؿ&{���>�*�a��#I�ZAJ�l�Zn}ā��^0�N�����g�N�����͠�?ucw� ��[�6��{! ��H{{�O&�d�Y�ک�tC��vX�:�т7y�F r��G��f� >�|0��_q1��w�H�x���|��64	�W��ʏWܾܴG���f�?u�ԉ���4H�Y��j���с�.;�G�_.0���ٵɼQ�w9�	����Q���^n����h�(��V�ɵ�hI��&C��Pz"ߦ"�}A:�`���!(_�,���~L�<�5�һn2_��؇�h�\�=��/���Vݞ�{O6��n��0m�j�ȕ�x���kK*���%�ܑ7
�����][�m)���������hϑ����#�q�mEd�A���z��_�������/�]�&� *�
���Un!���\�U#����������׼�0�ҟI�I�$ֈl�8
NH�l:X�Gq��0}M���g����m�A0�zte �&��IK�kG5~�'�z%��qG�Թ��F7z�����N�Du��C�
5���FX�L�.�
L��}������K�>��4�L+���m�;�rDg�ʃ"7U��r����f��������GZ�w��4�l�=��[(L�1G��ևֹNJM�[����<A$���>$��B�L�{�ШY�Մ�tG��oH��=5L6����p�&�NdW�E	0u�-��5 ��})JV�\���!�&�<�!C.�f���S37�`	RB#� ]g9�q�M�RD��AM_��y�!|"��׮U��o/�����Ӑp��ﺩ�$�w����`r#��0[�p�jޜG�{�t��1̽�)�S�=�;�?{�uC0L_���ʠ�Kۨ�I�I<�x_W�j_ ,��Ψ��u�.'Iԏ"�8\ݳ{�!�B����ϲ�d�h��R�b#��/[�n���{��ٵ*�X��Ji� �Ѹ�磸�M�gB�Tg|Rx�Ȥ�|�+=�5�>d�9ng�"ڈ�X)��J�MS>V���\h�*�LL���<�6:�T��j���m�d�&�?�ծ���I���0z��,��Meլ�Gv��J�:�������)�j�����T��Y8�a���P��MNO[�Z��Jv0�_ӱ2`%�5E2>F��K�d���,��+ P� G�;��E\.����H{vĦ<{�V ��,.�g�E�d��qT�ə�����޼R��!4�%�-�B��(͛����hw.Bn�0^h�o�����۔��p�ʹk��&s��Z�d�Y{�'�����*!�m�_��"�mK-8���C�1a����$Ȏ�8}�g�r╿�2�+@�1}}&����Z�m����6Yf(�U��Lq_F/��$_c��ɓ���?v��@2�e@8	<eB�,x'Zq���-?@WJjm��5�ǈ	,<������].�F�#�re�����Ί&ɢ���e��5���&4�2n�0yճ�B�	�;r�P�q��)�HK�&�`r�(�3�$T´$�+[��[��@;V=�N.�S��K���Z�Z��Ѿ�)ǲ��}/�?-ȡ�>(O��o�Q�(��}Z�Ã�kҽ�qQ3W����":��+�,����H���3�9�����ܐ�K	vx��s���rD \E��C �b:�89!�C����5��Ь��)�7u{���K�?6?x+)$+���=�4K����4~m6$i��S3��#9d� �Z���>r:���ʃ��%MӲ���5�VI�ȧE麸"+ 1�.׿
�/��pUȲDx?�����u��\K���UΧ����*?2U�.01�:�;7��IH+�!|<���,����#<"� ��{Jp/�:etP*�\X��� '&7N��9Z��&�]��hȧS���v�t�ť����>�\/T���̭�g񖽆"������͝����*l���uGc�d�В�/�a!ǀ �kaI�eV �֬҉L<@M%3�?��Z^�B�R@�W����
��$#L~��;ձ���Z��ˣ�5�ܴJ��R\p�tY��� ��?�8������_2k��q]<�\�I�m�&ײ�ߊ�*�[��x�ێ���uAw{vH!H��s%����Bp@dL�	4rb��!?Q1_-�T�N��y�^� Yy2�A�+��deE��H UW杦AY��}�J%�@����3����������>C���v*���ܱ��d:�)����AjS�ƞ�+˼�qe�5�	=�dw?�.��.l��m����X�3���w~Maʸ���he�J�a��B��]% c����A�ͱK^ښ܆e9�ba���Zї�?W�8!5#&+[4�u-�܈�u������b5���k�u��x���s0/x��{�Uc�
l[��g��,ׯɵE�b">kp��*�C����A~�Ӿ ��t�)i-jte�YAzz2�>��<U�V���dM�_��)(�c�]�O8�b��jr��ƣ=�\� A���K"##�M�Y帨����w��!tb�kpL��'�	�-+QC)B#����)8���OH�?9&aZE�a�_�k\e���l;�	��>\̐��r�YY�z^ԕL6\��O�gׄ��S�"�>�!<��9�Y���<�LkH�F����_�kX�>n����/A�ɥ�����0xZ���ȓU��-��_����i�^�l�:�oRm9q�7�'_D��N;��Wc6���d�_U�R�ݡ9ת׫���� �QJ9�"`�/z�S�����L���|Uk�ݎc?B~Նm�Y!�-*���|2�'԰y����uAq8M<����l������EÀr� �QN����]�O�Q�g��b*A(�Y\~%�Z	�D���E����'_w4mz��D�KUh?�����e�"X�0`v*�v�<I����{M��R���=a���܃�k1��2�H#9$�T�w��d��(a���e�yS4�P	���ܨh՟�f2ǧi6
eqX�ď���BM:���4
/����L�8r�UV�q7� ��|���ݶ�\����B��W1�8�I�`oA�g�*Pe�o�R��8M�J4�Q0�������ܜw������_�k_CL�� ܒN���g�(���Q�Љ�=N@�}@~G:h��&�rV��D��Q$�,j�&UXlU����F$~i��vM��l��&ׇ�<k~V�m� 6������`����O�y���-�*>��i������ޯZg����L+�R����$��oz�m�W�ӕ�h?ă�.(�~��\?ƪ��mmߴt�f�zM�~R����VS�f��h�RD..�����\�L��e9o漺J`)��ۅ�*�.d_!�vW:+���#w�L���I���'�鸵�dA����M���!І�W���g�/��۪Lm�h���b�
� v    iڐj�3��_@me�D˒�G)`��ђ2X����?�\�(z�ecd��os�{�sa5�^,�6���a������=���&�J,v'�̯}{�dm���h��,UD$�ru	V8�!����0��/
�������#$�&CF4$q���S�)�|��o�E\������U�Y�f�7�Ay��f ��8sh�K�����@�;����֢w�@�g��o��=����=����m\�>�)[�o	�'�~Ln�5:׹q�f�v�OY�y��s��|@c�WIS�$�6;U=�ʈ|����uA��*מz����ߟE.J8�G�8R����Sh��Ҁ߽���:���f�-`�m ��$a�p�r�c���n�%V�&��z>[s#�|NS���1�h���|�|�O���qh
KV̞]�H2��myP{���'��MzA��,$ۚ]���dd(��>�\��tJy\���=��EnR87�+�@(Hv��V��C�]9Md���r����v�@@�3���Z�!3ݭeqO'�sE�'<6���h��{�<���Q�x9��x~�cB��8�^Lg
�nJ��7�	����+���q�\�P��p2;�\b�@�l�NV����g���9��3�:��y��2p>�0 .K9�݆ZNՖ�g��@e�ɞmb�d���eZ�@��FaBR��!d���g��)؂l�O2�P��7�L}�wQ��F'�DJP�fן�58�����LP��Q���6y��s�
�Q:�n*������0����ґ8�;6]�Jǚ{񞸨Z6��eߕq�dG��f���uIO������fǕ�����6ʅ+z����J�US�T%��wB�=����7
B�5�Y��mm��Еr�p�H�t�ؔ��. n�}����._x��w��|K����sE���b ��#F��4�iM�~r��:�W����NY�j '�([C�+T+p$�O!���p�g���S
48i����w6�_��i@��\it�������0r�a4�A�B	��+e�A1�N�r'��ڳ��M��Ғ�������u&��xvM��d\��Q�15�s�X[v�@}��/e�)�U| ����;��t��G��ZR���e5�!�CH�s]?�S���$�&Wu�V0jO�=H8f($Qq@���?��H��t�4��%��9��_�kMn0�&p���ܻ��;�9���*���5Y77�K$���?�\�US!�k���P �r��}T����0|/�q������~�Ճ�5بE㜈�b�~z�"v��j��J��c$�:\孬FF�`��h�ݦ�}�)�����7� K������9)�Q��;�_���Ln^3���_�[��!N1�N�" �m�$�3ȷs(���9�����ɺߗc|��P*�@
��V<7`V �x�4�;�}r�Arq(�.q�M�\�bK�z0��#�dm���ݞ�Ч6P��+���>�J���uLr��/�9��,���,�EtMf܄�C~��#�xVA���i��O�x%���
���Sp.{���R��*�1D&E7���{$G��G�X<������\�)O�ހ8q�UƜ/�"f�A�ּ$��]���G�`x�ǳ{SNK�9���
�Hrim�� ���x�^��,�_m��w���I^�L_o��*S�X�(v'_�$�f�QQ�j �Ug+_����[ h�b���ٝ��b���řPF���x�k��qj�����%�O�x���(.?�s�Dܓ��X��Ӳ�h9B4���X�
AIA1�����}�5�$+� ��1>�R��� M}N�J��\ħ��헀��*:�>q~M__��ɛŉ촡��h�/��?�-u��[�����i�&7 �[��!+WT�N@��{A2�}`�i6���%n.��~<�_*�Υ��@d���RЬ���v*��8@酂�8�g��]"_�3"�մ�&�t��Z��6���M������=�@�t\L��ճꦉ?���̀�
�H��h<s���q�j�>]�������`���
4��+9�?��*r��ݴV�J:�a�>t��`�&�����)dN�����V^��G�����$4d'۬zZ�6���@jK�J��
��	��>��������˽��}�#��ljݶ"@�i�i�W��a־(�*��=lM)`T 8�_y0�K��3�H�ɜ�J�9wu��*���T�A��L��i���;?�]��q���a	v�3��eaY��6�۴�g�Nx�$hY��?%V�L���9(�)W�=G�ˇ�Cn��}��I�����x���}�t���'���Ǚ�%��p�ͽ�[&f����M��,�
��E� 7 �v�����u��J��չŲϊ��YdUf�a?�y�Ϸ�K���p���d;c�J}_P�J�r�����Q�/3��Rrw�!�@J�E4m���x��	�
�ǳ{���ĚruE%�w!-��T�*d�RJvG�����\z�K!�F��t�r�}�C��;���e�?j������1߉��;���@�;���G��NU�i�dg|���h,����%cPJ+^�8N�w誫x�u�d
[v��{� ��~�<mRwU/Nr���v�l/�.6�*	TW����wW�QU���L��|��wΥ��K�	���8�\#�U��(�9LGo��J���z0�� �>	��t/肜W/}Z� ʝo�.��v$������H�v<����R����jo�� �9���d�N�fv�QxD?D����Z%sܩk.)�4��ߘ���vM=���&a�����{� ��&kx�)��H�����ǡ�J��l����cPVQ:G[Iǳk�z�i�a�Y]QdX�`H�0J���uVO.+.�I�񣊁mzW���z�VL�&�R�6� ����5��8]z�%f�i�b���np������;�7�wj��NM$����o��}ӝ�#��׽��A_C��Ц�i����J�P���7hY^���`�U�[�E���O������>u�9XVn���W�6!�>�];�_��+�����g�E�ն�㳼gqx�A,wXMD�Z +ɉ�7L�k��c�O��:���곸���4D�hB@���ME�ģ3(�x2���"ͦ�*�i�7�09*�}��+Ͱ%@���w� ��&7>lOH+��j��88�zo��"��-ة,����CQKhP��nZ&���j(��^�i��$�v3�� �2��9kHi;q�_�kp�f���=\ٿ SN&n酖	��kQJ&2Y��]�$�=���L�c�{T�Y��_C[7����Њ$�'q/�#���O&�\��Y��|�C�Qs��DE_;�o��$�?�y����[����@6���_��eW�˹81��M�\uȨ����_�{�%u �{D]XҨY���&i}h{UƏ����eM(Vz���5�u�������E��o�v��\<#0��4��D�HLD���&��Q2E�T&������%��I��o�U���:�������~="+"�����������amjg�� Ark
g��x�X�s��N�?Z7�֑fqtd垦j�v�}�i ��n��驘��1��'�kI6������u��/�JN��8Q���e�%�p�+���x>�T��b\���h���6�LTb�	� Hq�l>�M )���ɽ�nD����x�H!�`�)�֌�%˕:���B��v�?����e�+<�1T�\@oj�UqB w�q����~�U�-'2�����^��չ8�g3<����&��0��ٸ���s���~��9AƜ�g��+;Y}uT�G��J�h��}ז����غ�*�bU��m�]��J���Pn���x<��-iqC�yi0{$����W�������%���!��Tw��'�kT�*;뱺�V�n+��G�©0o)�Ruj)(�Fb�`��(H���s��K��]��ݤ��OZ�a@.�krM�F�2��X�a��զ�%.���)�E��3�V�c!%�
8�P�kr}x�	��iB�    N�S�G�&��-�ΐ��"�&����J����L�o��l�����Kc�d����^��pA<Mq��D2"�P�\U� ����rq��	N�I�Jd{)11٭��_����ּ�`�*�ߔ�M��K�;�P\����]��t)u@�|~��ц}��%]�xvMi"w�Ay�k�yb�XdŘ�v �"��o�Ӝ���W_�cr} %[B0���ũd��Uɔ�@W06�%��^Z)�����[ubaD8��߯d������+\<�\ҽԴ�~w'������խ���d�竰M��Bc��f�U�e
@��uV�^)�[W�S����L��ab��P��"�VD���X4�KS�Ѩ!}e�p^hQz�G��+&׻,� �t��ۿ"_R�vr�5��A�˧�ĒB��(�Y�!�rq>���^�
������ .
��lEh׽f(6��,�vC��jL��uZ�o<]�ε�!p��2U^G���֖���*���q�����O'�=�^�3�Uie�&.[~��G��.ŕRq����+��24�!���>��0�W���i��Z�/��Y>�����H!S`�O�5o���4���%��$%`q�a���Rp�C�����A>�{�6�4�ܻك�5���A+�,� 6�M�Ĵ5��:�T�Ʃ�!��5�����ְ�$T��	QG�����t�������R�Ju(&�Dc�����WRO�܂�2�}��v�C��2��ݻ'�n	;8"�:���xv��/G��K�^SyD����IVԵѿ �~���+6����//�s͖z�Y{6��5�e�5���Ϗ��~��X(̽�	l���'J@�D�&����$9qE?����Ozpd�L�����L_�XAڧ�UE�8%�0�u9�ME/�Y9d��[�D���#�krC#aJ� �QT�5�ך��O��˗@:���B 8I����5����/�7(	������E���I�w�A��T4�6V���(�#���˝��Ώ��E�Eѣ���Ak�]A�29U>�����ݥ>�����g��;���8j]܄Ҵ]u�N�F vz%���$���<��X���8zmǀL��k#��)���D{�-�b�r���'��ο���3��������&ׁ��a8�B�юD��(��x��}��<�(U�R�0��&ׅwG�.G���0!]��Ac|pn4"�������VyLǾ_��_ ��6&%���Z����Q�K��6}�H�.8�� ��gW�[�5YEڐ�A �dv���φ�}N�M��;�b�7tǳkU%g9n��t^X���# ΍*��#�x���aBc_*M�e0������pr5���YS�#�T��!d%��'!��@��0����lчāV��F�_�$`�O����Đ/gܵ��mH���`:�W���!j1v� �Q�z����"����p�Ex;��}�O�o��Z�5�y�"4�>-�wR�9�� �P���Wܲ�����U��+��x0}��{�B�e�3S��VAf\�P.6(����רb"�U����
�@϶r�����Lh*����F)�5��j4����J�D�GvSO��cr�_���^����^�^�ʽ��'|�uy��	��fC���Ī�|W�}�<���P��
�^h Oew�3��S��J��������z�.C&�`S|r�Řl	'��%L.Z�(�4�3V(Xe͒>�]sd��"��p��#���������7��6Xh_ޫBN�g�
ݳk����p�#h���y�xhL�e��*���!�i�B2NI���wU�I�}t�,<��Q���b������|�/ ����ׯ��-F���K�D����Ɖ|"��W�y�f��d�dVHM��dC1�(U���5��@��Q�U7�6���]�?������?�k֪�USY=�Ҳ7 &S�JR����ٓ�%`�dz�+�����+�K��r�e���� ;UD�!;�f�^N���5rEw�=�\_�ϫ�uQ�.id$�ZJ����>�,���L�H�K���=�[���HJS$;�$3��-�г�8�jo!��?�\�*yH�&�S�0R�i6�� �Xl��m�7ҿ&��`��ru����|�Rs뷭ԥ	Ƽ�5�au�����I�H0��&׿��̐ҧS��VN��i�bpM�B_�0=��+�
�bG������RVG�ewt�k,�9uӵ�$:�%�W@�h���
n�y�˯���}ݬ=��ttT�2"Ec+��J�����B%s�p+�N���_۹�_�_ʞ��:J��ھGiu�@���\��R�M���d�P���nx�v��C�ɓ9��`�L���Oq�C^Bv�h,�BE��]��x2/-��I-k�2�a�Q	�/S�*�)�޲�+�8�s C���<��K7�J�Q6�x����{ ��?���=�"[�xi^�����|]���D�e�!���B϶�BP6K��C�`uPYu mr��ٵ����9�rĦ��"���6�C5y�?��LF��*��S�p��'�ׇ�J5˝-��|5��䗒q��>(��I�#RJ'�&���lѼz0��~]����tm�x�?$u���`�u�W�c{e�r?1�Jb>;q�r<�����H 2/U��a�$5�� �!�eX}6���ʸ�&Ay<�y0Y��i-�F��B6�f9�w<ſ��Ы�4V2ux���DV�H�C��L�[������k
(���f˄�.W�
�OrNi��v�p�`�(TL�E9�d�7Y��{�2�ԩ�x�+w�I`��Ԯb6v�O&��+D\f��03X��
�
1���`���/}��K�4:��5ī�r�����z'�B(6�1OC=c=.6هx�I��}�O�ʢ��mxC��J�L���ȉT�,h�,��zVyt�&X��\��Ԋ�䉊��@@[���t�����D�X���X� �%��7�g,��αS�<��{2.��d<���IQ��C�����������~�:L�h-n9�=ga���ԩ�{lۓ�k�`��Vls_���l���Y9C�=.[�|՞��NS|[��j���k�y�T�]>���tj	B\9I�W*� ���N	���&ǻ)����!�[҃��ݩ��R��	D���F��X��~�#x︄Q�������^�}+Q̖8M���\ǋ�{-*�t���h~^R�\��lh����xv���P�8��]������D�ϸF!S�P��M�A��,��5�F��!�축�3�e+C˺����AA�°���K����&������{�]>j�Đ�LP(m;ɂS�#Q��a۶�O&k(xyu�ﯩ�ފ��m��kH�%�[5@h��dA��ZZtc���J�'
�	�v
5$�im���N�ɝX���j��_ӹtT>�y�m���O��u��T�Z_D��k�t'�4��]@��]_#���s~����}���:]T��':?�3�µ��+@+�91�V@s#���ͽ�����\b��q�1�`�]/-6�pݍ������$�8�����A�7�s�x��w���	��Uŷ7�(�K���-��hE1��������S���W�s��YT�lfvP
$n���]Yn~�Q����Q��-:��L���S��O�=k�Z��BQS٫K=[���Nٯ�������s������:�~�*���>S��!����M1���m�#�� ��B�!�}vS�7��qKZ�J鱅�m累Z�/fn�Pz5��@r̟)���D���\������x�q���B���8�/����[�]	���'�O #D�.��Q�`�#&ׅB݉�����/�C"�xid2~(D�&bF�]������� �$�{:�]�7����x�k��Ķ�����5��-��#�~n��=�&5�H����O��v�Y���OEb�B��E 4Ӕ8��䚄�,߁�=:���3�}k��'4��X��-Z������1��_��V���;����r�F�_������o�A�]���07�l�j]    �0���5�K%:8;i�����?��(�E��QM.�}�2L� �hA�R%]U�����}$�����_T���ww���Z����<o�E!A%�0�
->�T��?^3m�l���L����WNbp��[A�Ǒ;������O�?��	/4в�)�sϮ��H�r��nM}(���Lo�f#�0<�Pi����U�@`|�y<����E�SV��6�Y�oK�g�k���}0�[�������ɽ����c�>�5��?B������'�#]4�>�U9�j�V�&�|鞌bJۯ� �(p���~�p���h7�qo��:'Ѹ�������/�Ih��YV(��C[��[��6��ݛ��A�� ��1�>���e8���
��i{���&o�5*�~)hUg�{8K�bk�&ׇw��%|�:��*��H��u�2mF�1=e�MʭX�B�`�~0Y_�]���b?�P�xTW�3Tv�}�!�<��P��I�V�ٳkPO�>�𚒋a)0qLSB�̲x�ċ�3�����r�4���$)?�ꐀ��W�*�sj�)��*�J�y�J�q�����&:��_�k�b!nmY=zH,�\�� S7��ʂc�i��uU#�G��i�i�zd�n�S ����*ǫ��$QejR���_�k�����҄��T��Yf����9	���� h�I`��:S$�J.�����:��uZH�F�?�H�*X ���,ǧ�X"o<�4�G�>"�kL�g���2�D�r���&�$�����?�gk�X&�j����xP�7����:1ޯ�r��@�	���1�ꬕ�)��/���t���Z��ܳk=���"F�yd�D�� �����,"����Uq[���5�^0)��ہ՞#��V�{i5�o$����(��RfTa���z�cr�V�&P&�~L-�[ ��P_9�B�x����cr�-�P�X�yu+��"H�Q��a�(,1�YL=d�j��ђ�{��\74R��8�F�e&�4 ��69�>����9o��o��tP�5���`r] �ӻ,��0~@�I���#���O+�A8�����{l#�����W�7�
����I�a�<Y����S(,U��A&n����o�&{�w�����C
�i��;T�]7jNcB�>����Q.�eɩ8�^F�L���'#�؆��G���&��fs�S�Xzz�4�H�9ɕ���uք�*�i��g��{��)��z*H��/��j�T�����+�m	�v.+�-ac�����D�^p���i�tG��[OLN&c�]�3ȿ̲����2�7+@�PBߣ�z0˳o�vU�GB=�e?NĒ�nٷ��ܱ�m���b�͍���ӉGC�P�1nb�����7ߗ��G�%Һ�g ᕾ�2�O&״�p���+��Hc��^0bË�3+�Bn��ђf2���k�_�}�P�� �� � �2LE60���	���Z/(��K�NH����/^�r�,�G���꽅��M����|�7�G��á/ WwϮ���_7�_7������})� ��GD(T�::'��9�|M��u��xΏ�>?�]�/���)�;A��.Jl�e�j��B��q�4n#����'b�������w��I���*~`����8��:�������%0��
�,��72�L�7*��sk%�s�jZ��G�CB��\���aR���RV���rɉ���n�%F�(?����� 8]�6}0�����D0@��^�i�̐�b
Qnh����ΐtq~1ʹ8��������Uv����Rֺ�_^Dj�K�Qb�� ���,�Uy�(���g�I=>�(kiX�|YF�N2M�5(�b�y(������e�����������p���^�O�K����Ly?V�֠U�1q}���Zus����#�R@o˩�W�ŗ�`
pT4�����>�;@�r������T�
�ޯ���E�,�gʊaf���P��/���v��%o�z���z����§��%����!���4�=0+��~� �`^hƈ�`r�P\�HU��� �ɪ���V�u_�.�a�9=�# >(�)vO�5�FL*Q.��EĘ4�*�=��ǰ��%��J$d���ao�k:��w�^i�$S�~=+qѰ�I�#\��){q�lq��UȯG�`�1x�3��p5e��	d�4՟�f�;�@��\ׂ���-O�`r�xwy�q�0�/c�+h�~w+ ��s���<4وL�[�>�;r����0�s�Ԫ�DIV3r��᠐���_�bD���}��ξ��Z�A�<}���	F`f��b����M��<���Ӏ�� &�VE
t>�4v	�R��w�N���&�e-�#�N�?��=��E��sB�q�&?U�\�E�dcO��!䙗���ڔ�zv�A��9�Ln@��$)\K3Gb/8߬�-��N����XKX���8)X���xv��U��`��E�u���4E���5]L�x� 񈡧;�9q�O�@6ݳ�HS�@���箌�l6rM�/`��A�k���sx
��]�S���M_sA�\�Q��/_�S�! l/��@m��KIs��M���A�)"=��{����r�CAJ�ͦ9Cg�=��ηރͦ�*Ey����
1L�� �!l�yz�\O�U�D	HK��a�)��AD����d�5��dM�K��y��T#U��a�`�\�S2�;(�?�:đӳ�a�����z��z"�A�൶ ���!��(	�2�՜w �I&SK{����!&׼�u!K7\�>)�m����I�&�b�ЅIxyO�R	�����k^�H�p��v"QM� �W!�8��%�/G\�j�3���(���s�5�"�	�.5.��t�$��hq��t "�ڣ�ދ��Q7]Uz2}��SK�!sC�q_��A��S��� �QD�T1�&��i���}�6>�نZ�d3�U�ԝJP�E��&VPd)�������"cA�&���=���P9��`3�t��!��-eb����B�7��M���d=#"���Z�?D��Io}w#\����&	�Lǈ�w�x*oރ�dr&���[�������Ҩ������ĢɷB�����5��Ӄ� �$$���p�|��<�m�u�����7�ds�vғ\l�":��M��1��z�y��Tu�d���}`��s2��Yw\O���"�X	�"�6��\��`���B��lN�q�͕���Kpc���9��'z_�"�kr��h��pڶ=t��ak8v>
��:�l����"q$� O��B���4��J��!^a�r(n��.���S2���ԛ)�ǳ���ĥ�.-�$"5��}sY���'��j��&������ɵ��y�H�����
�Q�'�?S*[X�+��j�O:� �x.0'��]e������*�N��Q��Y^|b��� �ۄR�܈��J,,�����|���j�L��������F���CdA�nw��/`��z*�O���6�"��gsw��d�z�S��<5*r����ޑ��Q�y�D�-u��;���k˻�(�mp��m��t�����m�R~xm�
w7�G HV���h�5ǣp��p=�����h`D�P�D5J�<*�*>q�����s���y��=�\��̓�Q��Isĭb�m�]�Au�F����`r�M*��u���u�I��0�]�!�/��X�`��_��0���1^��2=�n����R�n|aCl(�)G��V꧞
'ڙ��M������8*O0�g7���a½�����Ŭ���V�ښ=������v���.�Ϯ��'˛���㶒ϭ���hA�p��@)Ʉ"��~\����$M�_��Ċ�Yt�i4����pMg�B��u�(��e���kr[��G�@,�/o�ƌ.��r�-�O6�!��U� `S�>�n���L��� )�y�x��;�<��JU�B[�;����}��0�e��g�I�E&����(4�lT,�uL���7lV�z��E�Y�u��
�>���v�`]�`ΞUD#J^ҜQ�\<�0�    �|:��*����h0�k����OQ��ե`��i��E!V�jպ�"F�A���I�O��hrc�b��1bt8�bn@LV�SZ�r��c��'F�J�C|u���xv���޺w�)��r@�U�Q?#[Fa��_��̩B�	{v]lݻ��
Y(����F��HO���K*?q�'��x�q`:�8�6T$p�i��QZR���Aa�s @���\�}w��9,�����~Q��
~z��Q)�c2+�/!������|�6�����eϮ���:�h��O�<��>
j_�3f�� i�,�u�rE��m�PZ+~���Y����6EmS���Ck��&��+�
�Y,���F�`���
cg�|4������iP�d)ӳE̤����yr���$��k B5�v]�<q$�>��!E��z�& fAް�}7��
@�-�w�!�� ����� U��a�Ш��*�*1xW8����!M�����A,���M�wbf�iGp�%1Q2�p��a`!�(z<���"�Ԟ�=C���U������S��G	|*bZ�#�jzX�#�7�\2�K�U�c砊
��F��=�Te����5��$YS��X.�7�W����&݃K }��h�+6�X���R��\6��NIN.Xn�@�G�`E����=�6e��CI�l��N{Ww�B��v��VD��΁Fx���,��**} ��x<�1�A�:�����M,��0��B��p#nU��hf�!�D1[J��䆠�2,1qn�iE��$_�򗔘���(�� ��p������;�`sQ�SV9E�}t�0"�n�eO^^��]����E"�h��-��p3>$ ��a����O�PH��s�<��0���;�/0�[<% ��?ɻ�B9��*Z25Pd�_M�-U���PʳX�}鷒�F�T&
��3�ӱ(!rx<�|���*�l���W��vy��������1�J�>��YϏg���B�)�Y����&T��U{���\�4ʐ��_��U���j�v�h���b���K�r۳�b6�K.Mr������^惧[�h_m�iz~��������p%5rª��p�H��np?��̠�&|7�9؟���gʑ~�+���e����t����x�U�T`1�	Ny���)0 �&����=/T�iM�b�r�_��2<o	�x)8�Kj)5���,R�׬'}N�@g�M�2ǳS띍�,��R�oxn��:�v6|4��������a��X-��ME͵b����1몧�W�7���G�	���j�q�u�<V��qR�y�-���I~����9@�F)e<�]g{#d�S!���G����y����k0�}�U����X�<�b�P�,^�b%ׇ�AUq5��dqӂ�҈luP �=?W�i8E^e�,5ն�4~"Z�N%���w]rT�ʆ�����y{&L7pٻ!��*�syBxSq߹9)��[�j�
m1CG�O��Y�#�<ŋ����~�h�!�ݡ&���*9χ�L>�������g��Lt��sGj���k1��Lʁ=1�IǳB���֔eG7���^��?<��$���^�2�e�O����&q~�tk����\?���m�C��~��6�P� ]�}�0p.���]y�W2`�e��P��M?S,�r�EhU�L3���1� ���~�ъ�y}S�0M��r}>�􆤸��)�a!�`�@����
3���C�RRvu[#�L'��nz�=.Y��_�x��hEv�8@9�P�rQ,�b�/D��(�y7�tʷk�2���>�{�V���A���أF!v@����h�5ߌ|!6K01F9"�d�r����J;i�vS��5��:�>$����p��%bxW+��؂H���.��A ���eDzr_!�
InKV|4�|��}5���>[,W��G3��q(������B`���K[� Ê��7�T�c~<���:��y��\��#�"2U�n1e�?Q�Y�b�z	��x~��H�N������h�Z2-�T���z��P�bUA�3S�O�{��Ig9�c�i\��
|�=��:a��c��tn��3�R�=��~�U~q���5�6ъ�!�
l�~��:o�诛C���3�{���"�Fɐ>��,�vt24���}��s�At�Os��x�W����691K/��Z𢥟�Sʺ����W	P��'w�7�s��?�\�[?���]�*��J%�e`�YÐ���{��hHm�Z���u��Y����{�Z��'�d�tU�1���Ƒ��� �I�8���5��/e'=����ޟ:����I�g�~�vsxT���L��GO+���]A��a�ӕ�6�FE�9�ڨ,�3X!�6MN>�n���3s�QbF����ׯ|4����I�s�Gy&��V坒�馤0'K@�d���vr:�z7��T��0	kS�Vճ�NG$ĳ������^���e}4���yB�K�h_O��:�U��~E��:S���@���ǪL�ns���!n<F�����/~q��Z%
j)�h�����u��*�	
���}5=�MY�X+�,���$Gf!WBS�-ύ�,�9�#�89}�(��q���� ��^�a���>?:��ѹ�f�Q˃�K��o*�BB��0�G=������Jv쟟_#v%����^5�O��/e�ɊLi�<iv�?��J�8e��#	�!��8*���uɶ�Ao��F��:��}4⡏&�4	ّP���H8������9�=�c T�!�G�Ɇ�N&�	�y�#TR�'��.!��v�C�[y��>M��s���hr��{�4�����*�-��5����+��~Bl�aS�zKJۃ����F���J,J�5Ѡ��,Hv�7C*�t�k:�n��G�a.����Y�����6��
ċ��HǶ�SI�Z&�b��2!.�a2Uݏ&�kU�'q�3o֔��Z;#�p�>����r�nA�	���/?�\��Q�Z{�Tҭ6@U���9c�WF�f��]?[�M<���=_A/�84D���"W���*k R���W�hzKI-���;�J44�u�w�����%����+l���5k`qIO��&��}�z*�U�9�T�l��R�b��:)7��*prn%�C��k>��mn`�fH_B#i��L|��#�E*�?�'����!T�G/�������[�2�C��ۊ���9$/#�gFRc�3)u˽��oW���![�:�:���b�f����Y�{�< Vi__ S1_�2�\CHc��+����`o#�S��!t
=q}�N�",+�6S��vs=��̣ܵX��:� ׌��x5�L��+������[�;r�sQ�� ����fکs�L7����h���6e9*B���p�U����
��Z)@V#L��|�8zY����n��T�UryeE�	]˲�� E{P�����`��"�T<q�,?�\���������S���P�Ń��/0���7!B�3����9��!⤣b�����ԃ/��x�C���yE�@���	#��܋���}�~��ǡ����ĕ��D��s�kV�u���K�!E�H����䆻ߏ{�1����\ׂ����
�4�:�g<G��՜M`]p�[�u�j�������KH̪(C4g��Ωls��O> 0Ȓ�c����ƩEN0�)���l������'�{ �����|Byn��C�!js�����[�҉�������-�L����hz~úl��M�e�)}]�Pd��J��:��?��9D��8b��6���9�\|@']ڛ1�1�� aD�cXI�<��K�p�Ko�c�Y�W������s�L�)�7%� ��h�)Lh�I�xED'j1�~�$��ٍ�RS��+����Tf�L����w�x[@JG�-߂�&?�\�@e*V�2��]������To�6��ˤ��)�F�w$��ܳ�+��>�OV������˹L�p�\MAK՜`(�([U����&��~o��V��f_,��l!�w(ɯ擱�,~��g��%M����ԃ���N�    Ϡ�0Ꙣ�_m]V]K�Q!�Y#b�f`��laiU�}4�苨�_��d87�Я6����V��0�$[�Cy_�J�۳�4)�Q�C�\5��9QfK*�VW�*n���D)�G��6�^�=��S�.�ر��N�M�A����7b����%j� �,K����>Cu@M�T�G���/��;��5�ʻX��[\�x�{��&ס�$pfO�Cr.�of�jRH3=Dh �rQ���*N�W���Q��K�ޭ$���(؉q=�!0�2`
���y��S&�:���VʰbF�?�p|m�B�+���f�����W�"�hr/��ܹ2�&�MHɝC Jũ��a�&3+
J�K|r9ۯ����3]�n
vt�~VSb2��I>M�t��z��I-b#��P^�ܾ����]r�;�AW\\J��'�d"섑��ۡ��4g�y#����3��}q�<��T�	�Qu�����ԣV^H\U�3m���}h����S����ݞ�x�F߃�Ѡ�t�i��	7Q4w(��A��
Z��:Bb\��V��Mn{SVm3��Ċk1�d�\m� we��HZ���zwU����� �v��;>(�^��g�?�eq�q��zf�.J�4VH?n	8y`TQ�g����5�����!t�h��娢zC��^=7 �H�ݣ�#8+N����w*�Eː�8�Ā)��y8YY�C�bȓat���T�C�x
����Aaj�,�t���HU�dGU�^9��W��.��&8�Et����:7�e&�J}�����ԉ�m�l�3��DZ���F����֯&���Q	��Ir��j�]Xb)�dU�T0�\��#  }��~7�~��E]ax�w��VQ� �kK��:Q1�GmK�C�V�H�=��&�7�Q�κ(�� ��S�����P��[l�T:V���$�~n�(r�����G��j@�̊b(��>7�՞�.���$?�m�nroޙY�r��U/kK�O��*Hdjnͨ�l�o��}�:��c���8�mr#����(K�8g��(*���n%��)���S�AAK7���h��|��PԹ��ON�U�5�&t�(���Ki��c8U١}���{c��:�A� ��6橁$m��[�2ɺA4x���&�P�9���=�)l1�?�?�J $uS� ��*bS�G§��X��?N��R�b��/f���ƺ�m�Ŧ^ġ�ò�z2@�W�փ.z�G�
��Z�[����ǵ�?��X�
ר=��yפe:%$��5(6��֋8���Z.F�̈́r狽�"Mn;�;�m�>,g���jS��S��t9{�%�3����(~�ג=d�ǳ�Z��f�2jfC�V���AO!���+?k��S	�h����箓+S��l����Pwj�\XtP�Jz�T�����	 ��n�M�Ջ���)�����rX�>�D��2"��!L�N$oR����:�DD!�*Nr��'�YQ�e���.إ{�ߧ�C�����mr]7��*Ի�S�p`��RN�5F���
�4Z]��]g;�W~4tΩ���1C�p�3,G#��òpa(?SV<
5���W��z��-�U��
��Q�{$��i����X����B��??�r
�z�,ȧ�E��^��2���[��NWI��!Fx<�;%������-^�
P����5h	�AV|"��zrT����r�M�ch�����pl2s�İL�����mQ	�=���x�,^)΀}7��0ڍ�dt�x��*�y�N\`9�a�y��.4N	�YJ��G�{�Js%�u��
�$�֗x��+�8������T᪜�|<�hr���ۤ�[Nϖ�c?W0�9��iٞ'�8�`�w�ך�¾�q�MnT�ݎ6�o�^
�v\�M���r�T[���0�xRЭ�{d��6�1�/�-�D~���ȏ8�!5Clѐ���	�jW�J"ǝ�%���Q>m���<�����u*�������r%���� ��sB���D�\cYiY��N8;��Uc�&A�8�C�}4�wФ!$r��j��! #aG!�\��VB@U�Z�D�e��U�x~gU<���LQ����z�����	.�x急
 K��!M�%d�L��]f��r�ƨS!��]0�x�O�(|eX�[��z-�u�U�H���GbQ�CK�}���L�T<jF�=5�Q�XT~
�h�3��-�ǳ:� ��ø���)�|�]���?h���� �"j[6��I��U,��\����3ȏ�j�h ��n ���u:P�ST(���g��Uǳ<������ N>��ܡ�p��� ,����/V њ�I��rQ���YF-�]�����nU��]��苗.�+���C��l͝�F��*�X�����h�)�D":�ܼ��(A��9�o�i�r�Ӯ����O(�Y����?��.j��T&0��Ւ&�h�%���Ǔ5���1��ѽػɍEq�h�5|��A�Ym ڰ��gY3ԓ��5�D�5������j��4I�Lҡ�7��f�"o/_pa�LJf��K-�٨�z��g��~R�b0���1ȹ���"�����Q>k�m,�*�[�ٻ�M�5�9�a�f��[�'�r�G#�����%9[T�׶û�u�3�9�;�{�*T��YJ2ٲ4Z��>+��w� ���/5=�Ch��K++2v�5�P�G��.�D�T*bKM�1����f�*��?+�ύ�`��J�bޣ�nB1M��X�IJ��&��g�H�:���(��CD��FB�3]a)\�P���m��V����oMȪQv��[�����,����T:L2��ԇ��'�45��P��5�Z���5�#���r��8z7�2y����hc�Z �hr"5�6*Z����8�n��0�e�Y����@�U�_%i�D/ܳ����29D�j�7S�rsr��eЌ>�Ü�f��irˉF���� J�����.�?J7��H	5����M�Cv|���/��U�@<:˹ c5��	�5��dI([���Ï&���l��KM��FT���xw>��ű���Հ��)hM؉�gDײf���}��a�����ª�?|�]���	oD�5��G��uoh�|�\��נG-WY�<UT �p��I4tj�6�*�NvE�>�ܸ��c�������:z��
N���;����]���!������w�MnHZ�>)�D�krH	��M��Н�ad��u-��h�����hr=w�H+waQ8ǳ��F�כ��P�#W���hKKI~4=�q��Gkڿ�Cq����lM�����(xͥ�3�U�����M?}#�Ȣ��¬/��� ���k�@b��o�F2BzɁ�q�!|4��Gӳ�U$���ar�۱�ʈDM�+�W�
�#�n���پ�P�c`q��`��7^���A�hW=��(1�̙x<��໠" V=L�M�}l�E9la����T�s�J���A��wϮ'����3k*�,ʁ�m�4~Y�=U�ee��@s(+�v��	��)Hc�ʻ@s@F����;�c�.�hy���U2a6��_Mndl�æ�d�,q<��Z�1��Z�v����3�Ҁ�0�5����7��*��U7�R]+K�(e0��:̀v����{<Wiʾt�d,)���^g+����ξj��8Є��ZY9��IBҾ�g��P��).W��͞����_t[�*��?�H�: �a=p�D�0	b� _n��j>��@�7jɒ�R��ܧخ9u	��!kÁ�FPY3o��~�jY�s`06
�AŰ�>��XPڎ%��k�B�����zJ$f=�<�� ���EH�<���x�G�c�D\����B��W�$� >�U�����05{Bk�1�4��v�ℌ,3ܩ4�$�!۪j�:����&#��I���?�hr�蔎&~�h(5	1:X��㓿C�p�A��Z�.�t��t2~5��@S��=�W/J��?kʲc�!7������*�<M�����ƍr�.�������"�Z� ;�t �	R`�r��j�Bh     Rț�n��{uᐵBn�C(Y���*��b;#Y	n,����))N#)>��!����U6�[1{)�ʒ��0@��8Xp�ߖ�C�ja����~4�1lO���l������{�Ax@�^����[�z�(�8(cT�d<�(K�\������Ū�Mn"�ɄP��՝�+�t��Z*��nh�]��dcH�S�""M�aR�r� `�e&�����"��q]ul��G�����䆠Ԙsx�)hU�\�Ů��3-N!��Sd�u�b��._M��wx	P��j? �n�zԴ��>�&��Q(��v=���:J�����K�I��UE�&�{&�_�%%�j���9g����-�g�x0ݔʺ������q�( tmD_A���7�ΉZsN ��@#�hrUD�aS�W9�XR�-z��Q5���|7���3H$"j[ן	�wRÖ�&N�Yc�q�a�>�WN�N��<�&����I*f| �Yp21p��S�EZ@.K#����L3q`8M>n�(?��0��R���4�W?8�
���Z��_�[H/�Y�^zpI��b,M6�9S���:���&1RA�0�`T+9!گf�'�"��&�aR�&2�:�`J�d+�cs����?�
q�epW�@HK_U�ϻ�uM|�����t��E�)E�HR�W�v�(?ѓ�h�5�K�����@3X�J����.���H)��Z����a������ߤ�Y�PQ���oS������H�y�6^���]5[Y��Gn�)A�a�X��!���n|S٭aNv�~��k���W�����Y[�W��z�)9k��=?��®Ld��Y��D���!$���!̐p������������޹(3� ��0�����ZU�EB2`R-���O!JKT���#�Hd�M?�ǎ���ָn?d�2�ms���������$�{P%�/�C��h�GVs$%����U%6�3�J'y�1� �Ӹչ�I������}5��z�#ȗ��+b̂�V(��S�"<���V�j�P���p��}y�R)�d
7a���$��������XV��j�ǳ밝�QY6�YZ��)�0�O�+��!�&��΀�����Y�3X?�~朙T�JF�$=����8�9%,�*��s=�E3��l�1�m��1�ÉoQ�� GG����R%��b�B���o�ʍ�˲�M?�7��&�#���V�x�Pԣ��@gA`��ǐ�{-K�Y-��-����|=��!"�JVB@���퓑�1F'Yo ��֠ż2�;�~2+��~� �8�p��['}�������pr�'*�ӣ��w7�9�����N���>�~Q I��.b�I#����-���<��E0SF"�fE�I���W��)2���-��7E�.�Y*E�L��6��T�g�q�&wq���M?o��vtJz�{\��Z+ĝ��E��Qm��C�W��(�6>��ٽ����Zqgf�ZJ۠�oѲEX�DO#�Z��i?����Gʫ��
�IS�I�_�+�uR�\�HE6.9c��͍�0�hzN{(�C�`����Y%ÉKO���}�j�kO����V=��ds�J�X�@w����
@zjj�2���o<� Vc�\�uj5�]�q���u��x�Y�%Z<����2Y�&�q�t
%M����ݱX>�\�'' �L/~z�Q��Ԋ��dK��Ύ/�Z���A�����67��P1j�aG��BhQx����N+����o����z�� ܠPrX����(�_��'���N\��),V0�c�+Ȅv��pV�@"^,���g����<���/\?uj����6�����:eB�nt��&���!���:�1EЏ�����&g��O�u2Zj�xd��˨����d��
%ĥ�?ڢ\�d��V�c�n�I	d-r�������{��da�!	)����M�U4A%gM��CI�d�d��A�m���/I�� o��z࢈�d�T���y�����{7�D^�	ҽ�ymҳ�R.f��˸:V◸T&�[���->�n��ڟLD-��,\zצ�,���6$�b�U��ߡ��
����ގAmiUv��N�#YM��L�P��t�����N���:��99[R�L8��`�@1e��fB)�L�ǫ��*�S�2��T�j��ڊ�ȏT��T�$��	�m�fA*��\���_��O:_���P��&7.<?X$R[�J()�6����j�e%�GxP*ꇶ 0i��e�W�ϧ:�A$&M���	�UWۘ*A=���*��zq�B�P(ZYC���������	Hi7��D3v��,^	1�[��|A��?�� y5F������	� !�ƷX�to(Z�LI�bQ��iTQ1����AL䎝��&��=�)���Z{Q�j�A� AGl���`�����T����r{t���=��P��g�%k�b��LD\�B*B�8o.�g�p.9��\�����(�
��݃=dwt�+י�`�H���@�"��T�-�`��?��o�ć<���i�^x�.��`�.B��p���V�y��ɍޫ��}����3D��eSܸ()��^��C�\}9 !U�	B�@"�e/>�֠���M��^�ʈb�T�o��q��N�!���'b ο�.$S���s�=~'ݜC���Qx��*
�]l/�M6�`�_��{��ު��dޫ���v[���hk1�����+�� 1"ui	�D�?X�ά�\1:��|}��6��r#���D�y�h�i��o$�a%w`�n��6d���w��z�,nQ�����zK{v�q"��j��<9�������&�(���#(0$e���g�P�H���WkV��}sP	�,>��;��o4\�>��q?�\��݁bg��V].r����KE��������1p�2�	�Ըy�jz�xy�4�FZ�MȦ#�!w(���8���E��Sl������@�-��7���0�$,#�WՅ��������`���w�߽��x�(6���+�'.W0ai;l�<j��[t2*�x<�̭�����ک���XD����f�*9��qP���lJE��d��~� 9�ԟ�w`*��p��o]��K��kS�����mr3=��R霸�,nY�2h�Re�}�Nc0QhYA�&N���f�����i��N��h��?��ϒ�T��;���q}���F���������8C�1�]j�M6�I5���u(�KNJ��;HH��Q�9z�V�(�Y3������mVU��F�b9স��<}i�R���$x�r�H��(n}7��$�!���Yv���w�d����ݞՉ�u�8���l?�~�V%���W�y�$=ևYwPoV�!.ŉ�(Va5���&���hA��(u��M�h��vK�`���ĔK��Cb��8(c'�j�!�yD����P)��~R�X[^|-Z��؊Gɜ�$�<��tAm�B�^h��&7����J�J �B�i}z�L�Mײv>	g4�C�j�+�d��P�&7d�쉬@+F�Q��T��o���E�+�X|>z�N�g+�������)��>����_��8ك�,ɟ&x����+�k���D�	����L��?-�k�J�j�Z�X5g5`|pe��&ב�A(+�-;w4�ђ�ԱM�'�'����3,������"}4=�;��6T�%�T� �Q�3J�ک���!P�F,�n��l�>�x9�|�ব%/�Q���W���%�����|��R�"m�� �bY
ԥ���'��R-�IZ�|�}���^���پ1�\��Ba���fi6`M@��Q�
a�F ��3����~4�ޫ�S\�TNދ��,��3T�� W�����I�����l���3��X��{���C��D���t'� �Ht��y�hG	NjZ���O�{�hz*��*��j�d��[,�f<��}�B6 (�!����+����M��|�T�Y���X���22U�2P�y+tV �Ѭ�������͢ Y�Q�u��KvYX    _UuV�Ĩ8.��t�����9�x�i(�j7Z?�u�_Q�<Ne�5�L�Gz�.�	%C�$�1��}4��,~b���J�d�l�*�+KF_�.��8�Stn�0-%���2�?�fe�An�&C��j�����H�M\i2���x�Z`Pj�7�y�M?���Y���T��27Ļ}�3��|�1(Qg��Ƕ
DͲF���Mn����B�ry�.B�:)X*����t8ܜ�wU�����ǳ뭡����%� �U1��[�r`�?�>���U�&��۳�N�4!v-(�����) :q]����_p��G'Ʒ��t�������M�E�)wL��]�Ũ8XK!�p�wס\0TU5�3�F�*�"��ɽ��%�r0K�)2a��'8�Y�m�]����[,Xx#��I�<��/��Y.R�r(������V@�h�4RzO��DX8�J�첕,��5�w8�+� ����uW�!K�%����|ۉ,C9�#-Y������"k���r8$�3�zxC���r�)r<%G�#�1]Kʑe�?݉�Pj��wQ	7rg�E ������_W~��������;��W�O�T�b��Q��5K����@�X�h?��~&��F����4�ϫ՗b����:��k� M(�ݳ��<��7�^D󀃏&םvQ�w��juAy��r�%�#8���8ҳ�Ta�z�٧%>���N#'+�><���pn�Tz��{h�%��.��]�����F�kd�G�q�H�=�|һ����WFt�"�1��).U����d=�!2�N2EP=a`�F_��(��'��r?�S��L����2���|7�!)3?��U���rֈ�=��-�O��=��)?���%%�	R1q��\Ǚ-���4`�
4lRv~�گ:��j6�Ɯ|4W0���V�&z2I�?���4�+��L1�B��;d��A�Fi�"��hz�C(P��.60�'wQ���t��b?��PA;?c�WA�2k�6�<M?�@q
����u6N�fz�O`?�II�n��ջ��~�M	�cZ	����0|�s*��*K���?�J;����kO���hr�:�O�OB5�sQuź�.�[|���c�2]��|v��O�n���
�rk��]-[��k�W�$t[���r,Qw忚�[�Nz*�J����)��0Jq����5�/HF�����A �g��&��>t��6]��y
��p��!��0���q������:�?�ܸP�/X(;�/����iR��;��O1�ψ��}�ԯ���EuG
�6����r��	*�LX�}Fիy����'� H`W>�j���)�=�k�.a����Ѐ5�8aX����f�BZ�{̩4ó���dCt@F��'�.�ߊ���olja�'�q#h�z����{�/�������"�J�0��t��$\����c��] J=ݚr��y���h��hrs <�ė^���d�6Җb+�-��y�9���BT�������ˑZ(G*�W�qh�S�:pr�e
*dΣ+:���(������A2V5���T�̰:�ǆ�^�b!�Hkh`�\\`3ݢ{7�DORPQ�1߰N�%q��P�U�����p��;wtԚ37�W�É���ӹ�����k��P���{��PN�j�kn��w��������[�u� �"C�D��a�1��K�j���$���vɋ�:F	����&7�=(G�[��T�8�Z ���حh��*�ՙ�e����Jw�j�֏&7$�C�lV v�ξ�C��N��t(�?9�z�∐�A��>�>�\�J��%)Ά]�`���Zm�7�M�0��R�=��7��U&4���5 ��y���8�+e'[)f#$�_�����:�}Q\MԻɍA.[j1 2 �Li%č֛�>�����OM>�
�J_M��sS��ߪڊ�ʳ��dA%�<���>��~��o�gi�TC�lR3$�����tB�n�
���l�`Q1���G�O�E�6�a�}��T�

�W��T�J�!R|	�+gd]������x�_��L�#OO@�
i��Q� eU�� ǰ�S�VT�p1����M�����с���=����M-Z��B�@�N�$��;#A�<��~<�h-;���Ui(*��x�
fM&�ʖ��?�*IE&<9Ƶw��A��kr���B�m����EǞ.bJ �5JWJDJ�Ĕ?��{1�)O.�kZn(k��})h�'��#M
�r�H������g׋�� <�b\ܲ��x�f��ilD1eeY���?�p�ߖ[Xn�8ϮW >T�5��W�@B����0*�'�Jm�z����A��t}�Ys�
�:�
����ܑB+=�;���~/꺐���|4�!̪$��FJ
ha�����C��&������������YBZ��G�� ��J��(ۭ�N�k`h����R[}��!�AXTA��a�?��˟H�|",�U��'�21� $�9�
�����sO�D���!~��alí�v4�Q$ri6=�V�_��,LJ�O^�L}�χ �=�S��~��m%��4���t��M,-���{@�ܓ3���>S�p/��6��y��I��㦰?M��&:�!,�=+�+bZB�S H�&d�_M�Iك �	��F$�f��Jѩ�*��I�J+�LD��r��ǳ��-�>����'��i���;��njr�R�|���@	=���Uk�B�'9�b``�F���do��_��]�qW���T>�D$�����K{(��������嚇�
�F���˃��ΐ���`0���Ѿ�(�2:-�<�]WIclPfmA��#輵&&���K�8R�{y�a��MS ���G�s�g=���%v
��'�K_�P-XD��D^G�.�x��6�>v�u��?c �� ���u4aV���� Ve �o�%7���v7�W��~�Qlt|=�����#cI\��i�?���XH�?�^��u��l%rS�5e2�i� öN����1����t��B�fu&Mn*+�Hטi9r�T�l�z`"�&�oLi_�/g	�\��/�'�hrk��2dǱb_�G6s^^,�O��pb�=ͯz�� �;>���M?+o���@�z�!j>��wc�ÿBj7��D�Vld��6T���lo��t#��v�\Z$ށ�D�m���RQ"��'(Gp��q�pϮW����m!��	������_$�U,�"���8�e%��XCR�jr�*`��<�i�\��gd�� F���|�%CȊj}4���UE�.z�"<&x���+�ʜ��\�A	��J�A�i��M��
,�=���O#��a*vH��"��iO��z��z�иE��gדVE���Dи��9�	BqM!ߑ�2q��|�䫅e�ů��n�,�C���2Ϝ��*��ACf��Y�T�4re�-�������-b���P�2�1B ���U^����t�����?M�cuwt!��-u�s9Zݶ��AxG/�
3���	|?;?���]�+y5��+�Z`��(�P���������0wY�k��d/]Q�"�4+�e���y>B��p"G�4��*�j᥹��&�e:S;JA�OG/�7$�`�Ƃ��EC,|�6���mr@��g�^�Xda�q8I���|q)� wpEg�gUOYb��|���o�D��2�u��ҊP��]vR1.�D�*@'�ǳ�R9���wF�IGL�=쌃S�]��=١�T�F�1>�nr��n8|م��֕kZ������l�;��	E(�k��MnPJ-8��Xyr� ,���ұ�QOIW8�O�cj���Y��n����lG�SֲR)��@��ꇩ5T&����/S����3�K|<�ˡ��6����BC�o91 �FG��ӊ� ��d��v�w�S�_��U�I�ns������)�&D�Fc%��/走��Ǭ�n��ɽ?� ;)���F�U`So�lp��-_?j
��֠��?/��[�W9�}�]�T ���E�n�*�vZ�[��N�u3y>�~�E    D�8��V#��ML*��\*����tUz	h|�ؓX �[|3�MnR+h��eGBL"ڎ>�;���]��_DW�'�2���z�{4""QZ�G(�Y,������]PU���Eg���R��
�$	_�n����vrS��ZyZ�����;ȕBQ_}/֦z�Yz���h�����2X���rA�S��(~%��A�������G� {.����s]�,��$>WWb���G�7�A�Y�똖�['
�gZ�<M���� dR$��ď����/8I�)hǪ��5Y��p�84�w�ϋS.	�&���!a@C%tUb��ä�ć!�-p��r%]U7B�i�D~7�7V�����\�,��28�B�tͰ��B!/��ױb�M�g�G���'�t+�ؐ��e�[{������+^���\Ic��M��}hr�)&��3��n*�������o���R;�s- �W�/�:��Ԁ�W��A:@ic�x#Ĵ8�( �����2�n�j�T(:3��u���H(�	.jFJ�$J"��5��-Gs�ڄ*ze��jr}�0Ɓ�Ug) g���|�iTbM��ڌy�"���A]�	弛��P9`�c�kQ�&��Xv�6/w	E{�N�dߝ�rJt�q��W�{o���iC����0�B$��ņ�����ƒ"��kPnєS�HR?�~�[�Nǒ���;ʀ�Bi R�a��H�ǿ��	H�0�G�W�{Yqe)'m�X��<0dt;W��-5i����`�ʁ�*
�gS�jrC�o��*Ц�v��GY�)I�`��T8[f�U:��
��޻�Ƣ
��(����:�� �`�a��t��*��?����O�4��\�|A
qʂ=)���ݴ"<@ג�$�#iH2F1ʵ�&�yҍ��K�����I���W4�ߒQ���U�0�*��Xl?�\�@��Ćp�I.���� �%T��l��P�������T�r�hr�����B�6 �@�j���Ýv�1
�|�8�8��xv=i�/�c$~���`4�F�ާȤ-�&�jO�Z(�ű�4��r�UM�D|�G��������3<��/�XgQ��4ɿ�\�{�^��D �� [�x�/��ԅ��3�?I����Ă�Pm��xv�e�� �O8st�S�tm����;�5�5M
��i$����Bv'�k��$g�&�^�2���ċ&��@	��(�-,�G��W�t�BQ���d�����b��l�#_D�Q�"�Ϗ�p[�B.��ukETpdGdV*UD=�,��i������2�
�4���*�@����%`m���'��N��ha�`=�y�ST�H̲�xh�Mn[`.�c	Ey���AqK���F��?��YK��UU_��da/m�;���i�9����1Su*h���d�c��,�6�;���h�^2��5����!J�B��+�N̠%���!ǌ#�ǀ�SZ��Q*�����"��{J�3u?�'m��ք�]=���u���v>/�7-�جd��d�+�j�K�З#��P/��=h��Q4Ukӂ��@��a.��ɍ`���o�Ŭ��bc!|HZ�h���f֘�+O�	�d�W�!!/)̐�e�q�M�i2�qO����-���U� �N�����>,��F��nr��+�R"��΢��0f���ɅaDԩ/���Ð�(R�O�sy��%�|5�`EL�:��$���F$6���3	,i�k:�ɏ&�ڤ9zE,Y�ƶ�S�	��v����kIV�,�y�� ����)��r�S2�F�
p�'�E`�������,_ĶeN�w���^�*F��8�||L�]Ȕr4�f6�Pj���.���?�\�D�|d�l�Q�	n$�
���4��W�t������g� �G�|��8��00I�*�Z	�+��Tp�͘�	��r�W�{��y�ૐatX�50K�	Y�Y��|�zi���BaDXa�&71Hռ�<��)|���:n�N������,�+�ޫ0�pY���"ܯ&7 B�0����e��Q�����m�_��י�-�C�<��&�9�[C\l�u�UJb#;��Un�C����g�b��A\D$v[��&�!v�u��!��&w/�L\���Փv�3˛8�W�u�r�rJ��D	�]j������f:��+��A���eM����U�JFZڪWmt������Qb1�#|8QT Q7�`}~<�Q��9�5J�Ȝ ��X��\a�_s��b}�HE����lr���Bs4�&��f�>-�E56�yQ�+�Ҳ�-�\9�!m�������[U�-�#7�@�@
�kʹ���D-�U�:TQku�������,Y��ţ�0�ȶ!8�)z�;�ȱ�>�o-2���)Ã{vS����f��b~�2ejOr���)�w��o���b]�z4�F���d�C�gG��LH́��
���ة%_�:܃���[�KG��]��}_M�o� k
dP�0�YPb)3ylҁ�Z����	�SR�6���&vٛ�J�`��}��b��k�m�M]�I�a ��;�G�;���&7�-B��Ք�x�H���)�p���Uc|)���o�\���^�hrcQ5&*�S6x��"��d�
�,�+8������[m!��z��"���T�U&�Fwc�5�ɰR��ܷ'r��y���������D	�K-���@D'�(�T��%�C�(�����Vt��:�A�48
����v��ѕ��
^�'T����?��ؕ2�ǳ�p{�����S!���uͮE�/Ut(�.>r0���Y�`�Ř���M�%8�g�зeٝ���z:�r5�q���8�>�Kyv�N�9��_����� *����s�&�ʵ��Im7��v�$��c�Y��*D��u����
�v?���f�C��F��Z=G�Ҕ�2�{����;�y���)N\|(U�8��cJaZ>����C'1a��� ~&�4�r|�g����`�w꒨�]9��s�18���E�OJ�r�LA����F��@Y;)tW��R��e��*�e�?� ��$8gp�_�xS^M���(�2WUj�����HzD���Ύ��}
��y�PG"�n��m�@���A���uX�W�r ��u�L�)�G��/��%�T�Þ�����[~{XRً��=������S�
oP}����"�b�܍|�K�ДL� �й@c�a5b}<?�P?��I��R�TuH~_mg	4&g���r|��p(�>�¨��g���_T¡!� �6�h�)@鎨Hmi5�&X]�Ž[��~f�A�L.T� W#���ж54$ �ܯ�3��Ӳ^�}�gi�̤~5�	 ��Uպ�<%���t��f���s��ˆ��}i`� jL��hr@}��l�4Ӡ��W�ũ���5u7Q�X5��`vI�rpQ���g���Dq<R7�+m5i�=�t���_䌬-?�.��VAq��̚m>�m&�TYeh���u�fj4	��V��h6_��p�]���X���@��n$d���U�5A�	6���,�%����\��M��2*2V���V[�u��=���mP�b�(��V6=}5�tz
O���Ӂt[�6M!�ٔ��	٫D��`��iW۳�H
��g�RZ�ҧ����R�J�C�S �]�窅�A��b|7���i'��39��S�"n��k0%��p������"�ª�k���3��j�SX"P�q+(m�&��a�Y�MGE K+ą �ĩ�~��d�0�߀٫3�&�hY���*��C'��Θ��ꔯ���+��hr��w��{'{�&螓��(�v�A`�����冶':$�ZhO�~��X���ɽHU�t��y��G	���J����Ԫ|�!uG�^�g�	�V!�d�M�Cm����
/�׬�k�����<��;hE��zB��������r#���r9�+ڌ��<�E�t�)���hr��w��^G2�0f��YkX�K���kڑ$��]���Ъ����$�o�t=S��4�tĎC\�NV)�a��Z�    G)]Y�0��7���xvR+2pF(eZ�`фϙ_J(*���>�)��S����nr�mwY�#1jP~v���ĽHb*�>��:]�r�%��G�7��Ӵ�;�@+��&9G
��������3�j	�V.�T����9�J(&Z9���Tj�7����"��c�L��#���MQ�i�����84�FV�wSɀ�V4J a��c߀��@��}��p�����d���T��3�1V��' ɡ%�2�H�g�HjSgP�q�R��$o�'�����= �2GB����bi�JMmkivmR`���L�s/ ۔�&gs)�g77E�Q�Mg�3�A9�\���N�= +�U��V�"�'*$�۹g�)��G��を�q-mJe]7�[%�G�0��g��)�ʒ����J���|�"�	e���|�%��J�^U��q���\��p *�dbG4D�������Ȉ�O�St�>P,�j���\Pp�{v���TJܣ�`�!�Ñ��(�>�@���\^��cBWF"0���O�w��l�.X{����TD��gZ����}�mz�T�g�dm�s��fe����Ʀ�ah�2Y%�F���a�'t���G|ƕ�����[�pM��"K*�y.O��R��<?���?B}�b߶��[���
+؋b�W�H5��/�@N��~܏�L�e�uv�/����UJؕ�;��y�FS3g&���*l����'�KR��Kɽ��DP ��2���a(Eg��UZئ[2)�����T���i��A-_M�C d�qR��t�J�3��s��Xd~����˩����&����5#amn����(n��v��FYȮ�+�s�ߴ�����xv������*�5�9%�%Q��&�+ch�{�(�hlA� ��m����k������mr�M��=\ �7DS*�7��[+3����U�����q%�+����?�hrC*gj��f�bTMJ�9Кr�%4��y�KMK�ػG�~4=w~V�!��s���8"H�^��ƴ rE�QH9�V4��s�-�϶g�E\5�d-��4��YS9,@�����M���:�=^�K!�*��\�V���d�(�X�$�:�A�ڬr̕���a"����t�W`����pϮ��v�#j��S��.M�d�(,e�4=�	K~�^��N8$p�<����W��gCz[6K'��7嗆i#M6�F�����Ha�Z�0�H�� uټ��LvW��J�ʴ�1"�A�i�j����.ג!,�?�~\�uM�o����t������/S�ԤB����ug!�c��?�,������ �
�r4H��+Hx۹ 'AS��L�U�F�>���5s��G��\��[�2�h��q�i|p��  	Q���twA�o�X�6�X~�~7������ ��O�S�m��dZTCv���2Ŕ��b,� ���U��R��K���W�&�`P�or�S���D���*��Y9%�R���F����:�M�zb3�N �L�x�&*�st _p�RD~��hڜ�g�����t泓Z�-�0oN3�8�$�")d�Q�8�b]��������\�-WU��U�1ŨSx T��y���X��Y��P���&�9�R�q��@�ݨaw,V1S('�8�ɇ���Fe�P��#���F��EԶ7�У��M9ǃM�<�#VpѺ$�S�\}�/���jg����8O���2�$M��9�Q�V�
9s��F[���+�����\WqA��BA�M'��!s7�@stx�Qd{*b<7��P��ǳ땁�g����>?�䱍L;��7T�(S���з�n���VQ��y��I\�v���̾ĝ�	�����=�.:����x�����Oq>:�$TV��
���,�©bO��� �����a�4IR�t�x��!9��1E��]Gʻ�uN����UGA+�P��!�J� 4B�n����c9o����d�����Ę���)�-�*�*-�;dn����d�,�=E��b)�Y��&7YP:]�R�&H3ǃM�5ʾ�_��Vc��
3��.�"�w�����l�WB�M�����k�pȐ�N�r֔�J[c���[^�B��x~��,�;X�$[][]�'�A� ޣj�C�ˏ_����-Ϲz7�Y E
�y6�"bSF��� �֡�E!����{5l��5�۽tօS+�xA>x����( Z��X�V-�,��L�>�����i���/s�\�*�E����v�J5�������m^��yY��_L�/K^0O-�= q*����C�Ա;֖y7��r	�P.E#��g��º	�K_e}YxK�2��m#�0��?�\���&�����ਸ�-� 6jڭZNfB�lt�a�d�/&ס���xt�Ô���^м�	h�I���?o�(���{t��]汏5H�Q�+g]��Y�r������i��w9C���~?�Q����$��BU�X6t_|���+1���\������ʞ�yv#�g+����FfM���K�'L9��/)tIZ?p��A�ǲV��i���PygY�W��|�p,�N-}�3�~�8DW�,�Mo�A�� GLTT�����g�-�E)a��W�Dw�[Rz0[]e�7���@!t�Lױ��>���ܯ��դ�5��iKy�|�">O�|r����N��d��;��~f�*�	��j ��,���(7U���s����~�ej�%�^M?�Gx��+i5�_��ɎyYv�a����F��^{M��r�쾅�>����XN#�x��cC(�@�}�˨t)�x�ȃQ���?�]_SM��^(r�r�)�q��	�M%F�t������V�&�i��H�ԗES$�\1lW�^ê�W�J���3��x>�=��|�j���-n��G�+��I�v'�	Q(�U{|e�)ko�`���c��hrS��d�f5xw�(b�B��/�K���%�Y���A#n�����fhDA�\쉾 �M�Hc@*0p��k��F��N�O$'/�;MX����hr�/�Rv"�ul1'+�!�pTb&�:]��=����;ie����������m��Ґ,;�>+�w1i��%�JQ-gd���1Dg�J���`H��=�|���ۂ��M 'u���%��ǈ�ɕP��?�����&�ԭy<ۼ!�E�v��@�E�^��"C5��<�5���&H:NW])����:�h�'���j*��8��0ބN�g��u{��wbm;��d��۩|5=�?E�U�.h�O\�̝1:�t�tt���n>a)���R��ir/�ų��ȇM��W������Z�Dkrr���I��!LrqΏ&���Ɛ��h�?�$� 1?\`$v9�팔�/���x� ��P=����}���&�.z*4~���)w�
,��8YE�R�P�2�ա"[����u��a�Q%Ԙ��6�4����eQ��{=�1�y�(�lJ_M�W�}�2T#&��퀪z����J�җLC��X�;2O�V�#6x7�hq�Qq'�T�kh���YU98����sWr�}AIz��3/k�nr8+�[���=g(��R>� 5kH��$��<e!Yq���m�w��p�ʔ'�R��kA�Uz��"�0���p/���^#�hr���j�������k�wÒk�7CD��j��TTM8������䆤�Gp��1 V<$���R�P����'&5ސ'8�3B��|4�η�0Gub�)�(g(���ICPo?�a.)�Pѯ�5��BQ÷e��Mn<*7�`���X�J��P
�B��W��^"8B�w�����6Z��8Y��@"�*Y�p�dd#$I������8j�^y<?�FȞ��l���%j�H���ԕj�yFH����.�i�,ր��=��</n�Ю/U�T^>�i�*(���w(R�{1ɬ�z~��~�{M|{D&(���)��k��$8nr�/���u�B+%�AI�}:|4��Z%1�]�4�r�$Ufk/��q���L������js}�[J�*�bnVQ�I|�YݐW�^�:�����՚�9��g�mcO�����dk]f���WR�2wToF;s�T��jK���C�V���z7��     ��C��0ĳ���D�%_�9~.��\n)�g�k:)pj���Zg7�b�΀����e�S8��b��zi�'Nl���&7�-x�Ȋ���;�K�4�EXW캈q�G�օ�������GT��|4�1Q�OZ.��/@ 6)�l�qvW�Ǝ��ЩmE��ԺF{t��`�%����!_�����	��.Ƥ�������M�R�.cQ�,��pH*��lˉ��.#�:\/H�h>A}d4�[�6K5(�<��f�`���p��M�VO1	�v��A�Ol0��A���GM�s5��h@�g�ܼ�e�b]���sq����kv���O ��]���g<*;R�X!_��ʵ?_�X��x�k�?�9�&7���V�~�^��(���!~GL5����u8��rY.�]놲��l�/`i���C�*����ի,у����pzW�����E�� ,��%�M�_ԑ�yA9ء��:�ǿ�q:�������d����{�O����F�Aܒ�H�{!�䲞@��$	,�#D�a�>�lv��x��o����CUR�;�s�7�?�+�s�K �yOx�ls�_K{ʒ��+_mOx�*~Z��!8a_$���z��E����W����(+�����~���/=WE#@lUM;DW��'�����#�ML���%����gI��=J�ԱD�.�U[�,��҉g��_&e���> �Xl��fD���K�r+���$�־��9�3ES,+[�ܻ�~7��o���@�,�Bm\��P�u�E�>�.�L����X����:�/h��2ʖ�����Ԩ�����>[P�o_�͠�J�5bZ����i�[���k����0�8�n\�^hP�C]֕��E�O���޻"{�Hۓ��G���Jl��(5�_b�3,c�;��֢s��ֈ���P�����b�.��o�$M婄!��Ĺk��2��K�,��f������>`��w�/�R�	ߘ�Z!r�I+�U��D5�{oU庵 �w�{gNA�X0���TAy��\��t�5=���%ϟKN�$N��7�a��h'2�Z�� H�\���A�+��!	Տf�՚#B�v9<����Y��
}EhE'��צ��J��6���#�.�Vu,M����ك=����]��!��P�⸪#4	G$�9 
N]Jȝ���a����&-<�rd�n|*�Jdy�t����͖F%謤:Y�����]����v�I�u�ꦐ���yMSA��@����|����Q�]����X%�p[g0$d��8�3Ab�#](w��腬����>�\�{3i�w�s��Z�F�# ۂ@Y^YO��yP�a͆��=�ѝ������j��4�n��a��F��
宅I ������W��y�Q�v��Ӫ�,f��PN�	9`p��-����w��IU�$��y�o���R��0��w�T�,�����߉�/r�wy<1z�����Lߓ��}�����=lMȹ\*�c��ac�9E*Ǡ���Պ�ZO�zU�G�{����s^��FH�SR�&�r?ɪ`���I��J�Ў�d�������2֡�0��w���>������υ	-R?~O9t������p�ܕ�I��8͎����e���&7���@��Gi�f��T��d)Mh�0�fvv����E�!�(��Xa�Aվ��i�;r����ؔ?�#p-�:�'��aLM�P��O@#��F8؉�뿛7bG���1�s�1��ע�����N�}n��M>rp���&�hb�P<(���$D��_u�]	I�c��ZiX��w�󨤲yB+��?�	/�0P�f8U!�2��t�0�<�G�H�����ƅ��hr�?3�ya��?��Hs�i�Mäy���d��x$����i�4
��Ƌ�˫$GZ�n������
Y��Ă�&P�医Z��x՘x��C�X�|<��ʫ���I�ό��GA40"TBw���z0�N*����>�DR�[�N�i������V���V�`�Ok�h���ֿ��es�Ӓ��|����(��{��PF
�Q3XՈ��e8#�Yg����e��x���>���ȱIr�e0�_+b��Mݡ�|�slZ��c�Ȧ)!��5�9��4�g��Q����{��N��:�o�}¸�
%�l��J~T�<�]H��`ҏ�����ƞ~��蚊�#�� ����" de~$|S:i>�;�3�X+��z����@>n����;�!!nAQ����Bj��� �#[���	;�lKM��3�OZ5�Z' '��EC ❏��H���ԺS�m*��:_%=�mn��bZZ��*�Uv���)ԾH;��҉�N(YmF�n��K8U��WK
f APR9�2h�p�t�Y��H˦���=�Mn���$�4�
���3D�A�MTչP�`�Y%&�B���G���r�A�{��v�J� V���q�������FF��?۞'a���+��^B�+�8�" ~�7�Zτ"(7�އk~4���3O����*�-� ���ns�Y���E08���캫
\��*c�n)`WMu��g���(��凔���K�!9��B�%J�`a�<�K�Ͱ�3$&��[�����F�����=��u�ޜ��AM��Mޝ�#!�Kl����}1�zu�(��|�7�W���m���ݏ*)j-{q��S<�O�\�H�]C>xZ6�ɺ"�~Y�?Il^����]>�����5������B�?$�2��w�/"j��p��1w%
1��5�q��G����CnH�V	J�l�2W�'��Op�ɘQ�pbe�ARjYa.��n����� �W�uq��|�0���@�K=�8��Vn';�n�����4V����P?,�M�b��C��ư�A�y��9���rquR�z����pbe���\�Lժ��U=!&�'	�=���{.��$��o��R+�a�C[)2u�;6VY^*�|fjܳ��ٞQi.8J��Q^Y40p
�eR���nq��'��<Fˤ�hz~�=�Go�(q(�,7��W�+ƽ��~N����Y��X&5T���&Hn̨�t��v/-?\��������m�,R�f�O�r�z^���gb�V�>���Z"}�%�d1��<��A�b:Y���g�PlP�\�3�i`I������z��lj�0�Q5���+��B���Qw��S�)<p쟸r���p�M��{�ۛ8��Y��I�d@�U%��)�,�I�?H�!����O�TtP�+Oi�A�#��%��z�A��|�i��삁>�~�~ؠ�J�^g��S�����TQIr4�(���l�!-������M?}+f���q
b�5��Ay/�<�������c����%����S�	F�DO3B��N�.l^9����
r֣�kUp�X���Ӫ�AX��bK2$ű�R�~h����M�'H._���{����x�?��:�����18>-j�(_6�vЪs:McY�2,	;�5�0����r[p�=	��|��
�����D�2�տ��x���.{��Ѩ���$j_`D]���nANT�&3٩���0�;�����?���k�8��1�SX��v���j�bu����|$����V/���r�(�'�c��SS�ڞ���9.�p��N�<喲V� x<����iT]!rT�^�!��� ^��ӄ�/�%�IP�A&^q�u��h���V�r}�����U�����֣L��㌓�Q��L����"�,_M?}��(�Un��p�g('���/��ŵ�~T���M�n� YD�e3$3桷ҺWPW����,K�9�ov��/+c�͓P��~:ݛ�G�6���������6�(��A}@��#-�N�I�.ױ2XMnqB��*�w�?�Oa��Ii4B��%��E��)&���}4�������&�����g��q-A��zb��Y���P�DxJՈݳM��J (��^"�WT�x.7Qf k�ۤ0�f_�    �����&����:�'yUgWH����:Mz�&��	�u:����@,**O,Z����0̫�4c�f�B��V�P9B|r�.\����-MR\��5�����������%H��2����غ�"�n�A;��2Y�i�T/&7d�P� �mu��PMO��B?�8yr���**�
5rC�g��ϯ����Ǻ�8 F��1"��(<5f�v1a;�O�$l�	k�Y�|1���ڞ��Ar����G%��*��b�/l��W��)���k�Z?/.Dh�V�t���+�k�*M\]}N�k�A^����]���z�z��q�&dhM�D��^n/��J�1�dƀ�`�u8힁�[���K>�'���u��K}ѩ���������Iq3	�i�m�W�|��)obpxQ�$+R5���>O�6N9>Ոe����]��'ºQ�$���x5��
�n��5�����g$��D,�d��&ZX�����G]]�]�
ESV���:$�x�ދ�1� �m��Z��T�l-C ǳQßՑ~W�hF*���_?�C}P�D:��v�$�Hq�U��>O�-'�5T������M���g�˷�\�r�q^�j�ZҞ���b�b����t\�:���[*�T#-��a�)�J����j�]�S���7K����j�Ћ���1��c@V_S��F�Hq�Em�R�v	�A���/ֲ�_�z1�,�d�IU~z&2�3i�*��ZQ4�����:}5T���z8���l�� A��( fJ�9�-���zMl������_���O�����(��pٍm�o����]e�ࡴ�~�����|��;\}1�����BPbX:V�ӳ�ߣ	�a�e��3t��FV}�v�@���J�cs]�r����lfp���}����f�L?Xr�_�^�pia��s�Yz#�:!U=Wj��0h<���<<i&��s�br#�9�;srz!x�-``�F�E���2�l�ȱ�Ty{3ݿ�rh@��n>�P9�I�j�|x&V���^��'���b��q��^���J��g��ZГ!�G��6�?�-��c�3 ���ä�����arC+�8�z9�t誕G_��4A3��s��v�H;&˯y�ɍ�� �=Y���%\�hw�l��<�l���������_~Mn�Jy�仵](�l����m��ۿ��j��՗	�a�ȩ��F `��ޤS���B��d2��N��wMА�i�7�br�uud�� �WZ�C��dߏ��RBt�r� �,;�����@�?]��j�,��?��k�#:u�I�I�=�V� �M���fC����w�#�����b�]�I�t��z��D.�@�i�Hq�{kĿ>v3�l��L`����3�|A*�|�׾&K�(�s��T���� ����BԞ4)������f̳0�P�``���?����זA�̱ȯ���Z��rr&c���*;�b����"S.�Ոޕ�D�d���;%߳�#B=N����KcB������dPzy+d}}�4E�|�?_-��q��aas8��w�����/����V���jB����p��T�c�܀��\B$�P��u]@�!��eI��I�J��M6�!���ڍ������9����J�&W��{�����q+��T�5C�_��
=ϝT���t�q�!�c��*��^��>i�&�����d���}�
M8��t��<�D�o�[�n�$re��G�*^���0a��{j��ɥ��k�5y6�h�'�̀{�0�L	����ˇ#.������܀�vCEk�T&E�]�5���*.c��\�X|_i���kzL:�C�Ё�&t���r�T唗(ow����f���@?,��br�0�j<4����7R	�����-��z9t�$^�_Or�
�/&7f|�C�o��CUz��z�M����w^Թ|�kS�+�8!Lk�ݛ�*)�fA{�!�Zv@��h6�K9ɕ\� �s����5�a�c>f��1Xe�`��ɂ����۔e��ӓolA��&4���&��khm�crO$$��(9�(��۝v�?��4����Sj4��|3�Q'Py�:�4��~x�݊}/po ���{�x�yq�y��8^Ln\~�NݴN�����G�02&\��KN�
Q&TG54O��mW�5����8��Fto"�]H�!F3i?TX��A��^i
��D	����7�=爳����D��ڵP�����t��[<��9%�ȷ�V;#�%"I����$V�Ƽ.�#��(���Ͽ�eǽ��+��w���I�C95��!Zn% ���H]��v��Q�%rlF��ϡ�:wa�ь{�QdAywc°�y�l�ڭ�����8��O%�$TqG�J���	�3�����q�/(�$�l�����kw�����}#$lWM�d�#5+�8)���<���t%#(��_�h'jDN*��l_�Ё��<T�unz7M����g=��,՛�k7\�y�������^��W�bj�g����vcrg��˓]�+)=�i�o&w��Q�n���'�Ƅ ԕ�%8`O �{�~�*���k"$1�B�o��#|1�?��"c�8��N�枠�UzKԍ��� %���-���a�E{�ٌ�uK�D�;[E�I�<hi�]�f9�q|Af��ѭЩ���F-�k7Z��V���3昘q~����w���'�ׅ�Xx܄�lI�Ż�,��$���fs�����!�J��-�t*�i��|Ry�KF:A^�o2�?�}_�;t��@׆�[�|��buH���C�_��!�Ј��}(��@� ��v����:4XëˣM	;�u��d�Zd���V:f���]��Y멪j*Pt�R�p%�>�m/�J��.��F\^b:�f�.��f�m��>��4�\N@�C�X��.�\��ZU*��v���{�:��i���bz���&�EyGg*�
�-Y�p#�G$���![��ؑc+���w�͋ɽ��{��o&P���q_v{fZ�&������M�\M�x	���?L�^�)�R*rZ����?�.�2�jM4�]/8A���W�%Q>�ԭ�\�L�W�y�IJ~e��X��P(�Qr�;�ĉzf�.`pܸyƺ��L��1���@���S1C��-Ǒ/��>�F~��U��y����WVD�@ci���#�� �=�dS%eY/+(�ٹs��t�K�B�_��E��S��tf�d�k~������0���i������<-�������ܼ�_P�c�@K+��Ѻ,�Y�������<���%�L��8O�f�Ng��� �V� �;��W�a��*|�~Ӭ�T�d�U�ќ;C�x�h�nl���&*�G�:��5�i��kB5jM
��OG�~`[�f��)��ܸJ�C�7,a�ڔ�2��|�Y�������J�j�V��o&7䩣P�gZ�>�ч�B�S?Y"�R�F҇��M�a�.�/���v��M�?r��yS�)M>����$����Ե��3�%�i�=��v���t_��
�k����;�Rh�h/��񓔛�l���MАڦ�[�/�����W���~�'9!�aGE���ڕ�:��KW?�PPat�y/���S�8:���@�(W]U�+�� ������M�%+����e��_�[2�dC�%hm�/r+���L7Y��n�7�k��
%P�t8����ac5��]�������q��3e"�\��������v�/32?�!��J��'M����k�T�[Gr�����3<��f�'(���[�ME=@[X���d/���R1
	�+^�cG���~fz��*(=���Ÿ����������n3:�?���������L/�'R���#���r��^�.>����L���v�x�xL���|@��紦k
Q�kCIA5*�0���B�&���j��TUVE���.�y䘫$��X��n�qj�m-z +!-x�M"�b��T�}J	�����,��%x-
��p�(�Zc�^L�t��x�_L���.�-���S��"a������G���    ?ݰY��c� �XѺF~M���R��.�0�s��/ұ`q ��R҇D?��a��J�IbD�/&���,�|=d�G�����G�ui�cs�]�=&�Aƶ�����榑�o&�@
�W$_ve��e.��&�f7g���(G��9A4_��Ʈ�pT�P����,�&7z�t�C�3���D�ʹM(F�L���~5m���I~�17���IXSZ��6P{�"�Ǚ��qŝL��D��ܰ$�!��o�Z�@��"�?�LL��C 7n�����T�5�Wn�I�#rӾ8��p#�KR�W2řO����;�x�Q<d���G�67���P�C�������(� ���,�l����Φ�ԣ�m�J	��ԅ��������dI0� reD�&�<�]��H���
�*�v��ʰڠu$Y+�Z�
kT�SJ���W,�q��H�S�ƺ]�gB��C����)���Uw�0�]��_"��M8l;G/�y���vmc��+��X����z`]�n#�aC-�#pL:%!>3�NԀ*�m�l�A3�����\-�
%��������ק��+ W9;U�DL�"��}9�^	^U��q�8��Бa$�#�$3��
�[|0��������"Yt�+�{q�)�j_�x�$C��CV�A��o�"rv�ӿ���q��&ʴ�Pם�G��T����W�� ���mI˸��M���V����zȔ"F��q���C�qM����]�J����,8�rv��'�A��D�}�,�ף�L��<y���HK�4C�����h�6�)9O�M@���嬳dZ\�A��[�pӡJ �_L6�#�[�Xq�[*���3��:��S��Ht��w�z�_BTb��ʖ2Ko��lIL��d�Q�J�8�=�d��Z"'�y<���3���HZ�{Wz1=��s�� ����
;���σ�$_�@�͎b"��O�ʷ��@�o��=ı�v͎�,�2]q 6���Xr�UR�+��M�������v�]�QY[���V�O�*z�i����mYrHK<�/8���H������ɬO/���ђYNm���O����<0���Ϋ��.�Mf(7P��f�K�!�O�d�w��l5�a��9`J�U�[u���=xsX�>ETu6+� d�:��{���Y
�#s��Aw���5��frw���<%�T�*���������5rSjN��J��/����R �����x1qH:I�g��ٰl*��zP���!+e�$GΛ/`�j�I�4o�n^�"��Z�n*�8<}p��9��o�wY<l�6���D^�����'E8A�ԫ�-9�z����~�G�L\����x"�r]�k7!Dv"Y��x(v�5�숀	��|$�z�*b���]s �{s�5�=!<�4�H��k��*3��>@�����A�F��M������K7=�ƊUs���[ݿ�m���f*��r'���qJ�W��߮�oYַ�^��Ʀ�(�Y����e��.:q��يS+�`�ԧt�e?����� �!�ߍ4�L��`P� ���w����H~��ʘ�l���js3JV)9�H����!�d�� #B[�~�'+��ާR�U�)_Ln8������pL��L��/�]���Ñ��9v���O��\�ӯ�O��� ,� ��4,����ѳk�B�5qkw$3(!�iz1�q'	ZJ%}�}��E��
3!�Whr�����G3j����ԵPH�g�v+���Q9$z?� ���y�(���=����P�Wۖ����C��4��Nu�
�|K*����$�]���-@�����'U6d��M���\[�����J���q��O�b�U�o�������	��ٌ���Y-\J��A�*sf>�#�n�3,R0Y)B��iLơ��X�+}a7�P�o�G@>}����U�l�7�Ƌɽ�
k
$�e���!�?y��d��[bi�cEA���r^L��U�	����Ah�Pӝ�[�R7:�Zi���?�QRu7���=l䤔����M�Y�*����T(̛�r���p�ü�����l�x1�[������ZnWV���}��%����.�l�lo��W+*������gH#������^��D�؁�&��&�����d�'��Yඁ^��1���I��m䩠��gO�U�g׆��L����������@�H�} 
���%����W���@�t������M}s$r"��J�����֕e/��U��^�U��N��_?��B59����q�但�L�Jmwe�����cLJU|I�H�v�V >�l�⨏��ɛҢ�u��C�~���O-�+$�]�#.]�������I�(��ˎ��ť(�t�� u{{��J^}�@�W�c�x�	Q\�$9Q��\ܯ�/U�ݦ��,x1�>z��V�Fʥ&7�ɽ�ӑhM����"���|
}�����`ّ�T���N�0/&<*�� Kkk�0-���#�Q���zM��ՄC�ao�̺kD�5�����cn7n�D"k�P�&)^I��B�۟�B
�ޝeϋɍz�?����#'�{"!�������d�|��d����e�/P�bT���B�@yq�����!r	a�S^�mC+�B��Jr/&��Q*��}���'��q���-!E��k哑!k���������(�������1i#�L�'jB3��H �/s���4�n�T��/9���irsE7Y����T"/%vٻw�{Y7�Z'�R�s�q��ŏ��5(��?�y�(���b�=����^�&�P���>��M@�)� �mTlH�&{�"�v�P �����o��r��Y���"۠��k��y�Z�m���B
V�N��`��	���]S�~7���+�O�L���KI�ؾ�h���`�k 3���:z�Psv�G��E�ɟ+�^;��)�)�@�_?����eT�(v}��VHP̲�>����Jϐ�@�-�_�����,�P�ߕ0��<��]�:	)CV��Hǟ�JC`0����z�)��*cc�I$X���؋���8v���nmC��v1ؿdaB�X��ڍv�DS�y���#�[]�9�,�b��A��ަ��J�S�_�	�|����B�5����u���5z�&�Uzb����v��nH�/Ax�0�����X�n��%,yh���)���(1}�J,�\�Z%̪[�{�����W��A�rMm���}�,ـ�V�:�>��ck�R���d����kz���5�@��4�u ؓ�dqI��膌��CW��=�j�bz�UN��Ǧ&m�#��]����f�=���)o��J�e���brk��Fe��A-�ڇS�u���L���#c����0ê����&�&w�ܭ!���g_�ti����a�'��Eβ�Wg7�$�����1���_���5�֤Q����c?��~s�$��Ѐi��0����������18u�������Aƞ]"�	�<������ �V�k���^J�:B>s�U��i�W~��rG��?$ዓ�ӌy��[߮ݠn�3!`崂�)G�	_A�B��0@��^貙W�~�Ma���ƥ�r&��E�͋+�kJ�V��l�Mu �ɊoA�ؚl^�[�]���nh��<>��oiG���%�-�B��av�=��G� idX�3�tķ���@���-�(N�C&���&���L�U��	��5�_U/O��8�7K=�QGd�i,ؠ7����Z��Y�}�>�Tu"��d����#����GD�����:����k�[��C���V(�BP}�
���	��e*%Fb]�l���҄�o����fV �e��i2�P�Dj����B���hi�-�dl�C����F�l`���|�G�m�+�-�^���ç>5!�tߋ���x�B�`@�D�R~�S
�<ٕۊ>:l�{UȎ2m��x"~L�q�`^`r��L�6Ƅb%hCK�~P&�Ԋl8.�ْL�t� ~M��I�]�����$mo@�2D�I���3g�0����N�2�*���5�������    ���G��g�=HS���Nz�i�NJ:n׏�&�aoA�컄�I>��m�u2��j���۴�O	��b�kϖ���*�@ؚ����q����1�+h��H����I�����=���-j?:�_�$[з�������ER�9&�7����OʴL���M��V��u���R�/gg�u j��������o���׹�I�3������|��c(�/����?W~m�1���p�L�\���;���!Tu�j�a�f�d�h@�f�W��L��������H��t�CABF�s��O�;1�o������ ����^��*MQdw��2�jP����$�h;\����ܸt�Rm���Y9����ɓ�q��&�чG��zm�$ 5C�����:|��h�z:�ݠQ�N�Z����<��Ӑ��4�(
!�����]�@?'5)฀&>�r�KG�ޟD���"ѹ�O����K��0ـ����z�3�#�1�z�W�T1��j�����|���:Ȉ���^L����4<�\�����z�M�-���&p(�𖫩ʚ ����L�E0�CBP)��ܙ#�iu�Vq���.��B0�ν�5\%���^�V�L�{�p��#8�j�9yBK|iWހ9�@�%_�ov",����.��C���q[ZP�p5o������`B:�q�eO������ò�5%l]�oo���F��\��C�&%$�Jr�@;�ɾ' E/�O��	l�_���6qy�6�p��HNQ�G�Q��έ�d�1�C��׹k��E$��]���V��AP�Ȭ$qd��9��D7�%���V��7���⢃��x}�$y����H��fBr����ɡ�/��H��a� �m��� Q*Ūm#��PZr�R��<�w��$MS������J鋸��򽻠�SH`+*<���N�8�`4$ݫ��S�+�3�kz����o15j���N�@h	�X��m^T���rl���js��Z�x������k�g�h�����Vcʧ̎�S��]d̅,g�U��PFQ�a� )*�������3�7���^XF��]?F������x�[
:st�ϼ�ک�ؤwho�(q���v�f9�CʎPf�&����"A9�9�y�����`���ʀx҈N�h�����>����#�����\Ȑd��L�GB����DN�<����~1��HJ�,���U<�U}u�j	꼀��yVC^7���b�R��r*?ݯ�H�Q͑Yt�R�G���m�}W9&dO�uyȶ�-���������p��a��j����
�s���`��t��p�M�4�L��	��� $���/���Ј&�ay�dF��Gs*�N1���a!$X���8������J	��v�&�}g�M��F�A�����kz�N4Ӳ� ވ��L;��`.��טg�9��/.�;^�����6d
3Ҁ\�Vf�����Vo1V"�I�1����OHk8���6�2�!�̓��>7���u�q &���n�U�߈����b���8����U�.�Kw
�Ϲ��I1�"������Ƣ��o����"�|C�s��ݪr�ǄEt���@9S�����Y{R'�
,ƛ�q4���(��O_��X'�8�A�7�څ��Ί}����@馏����+	���4C��4hW倠��[O���#;���;�|ʴřߍ�]S��U�'�u \{�A�.�|�	�Rݐ�gڧ$A2U��sMn���j�"�\k��>�6��5�����&� N��qP4������E[S�)����P2���p���&/=m�Wy1/@tfQaR�F�ځ�f;Mj	G�\'6 J�cü�tO�2�q�3������V���6b�&@�O]]�\��h�vM���>>���&>�3�>��ǋ�5}G���,�2�$�dE����]��T����KCP��%v1��T d�oަj�l �IZ��l	s�Z ۹��n׏aiw�CH�AhO�]q|�J�F�[�R���k�#y��h~1=��UX0���΄`�Q�����_�5�[� [Gb�v}	�\-����&E�N�3t0ם�2���I =9Iڛ�^���Ox#no&7��a3�Ɉ����(��5#p�P�v-�P��`d��)�H��s+aU�t���>J��A6ܾ��d����@�At�=���=]����o��Uc{��!��ns*�+��8��@�=�*��P�+C|����% �L�L��	�A:��~>0�0��@��yK���~�'a �_���+�N�$D�C"cknH��7	�,�"��׮?)٦��\��v,�TR��}�}&T(��)�^��7�h�[�ҽe�S�>+��
נ�fsOmd޲3Y;,"���lb��$����QG��6�R�X`{^Ln���4*�h�D[��d7����BH�
[E�@���u=��ܸ�F)A�P)��ܲu5@V�M�uҼ�ܧTR��Q��SY�Y�$Ty3�qi���3y���(H�F�_FKn�j�']>���*A88�@�br�ϯ��Hp�Ȏ��¼�3J�B�uV�,�~�����j�R�y1=t�ƨ��NE�U�L4�!� � ���}Y��gP\#%
���i=_�&{�f��s�z��mOi]�C{s�:�k}���A��p@�SГz�����>_��|�
k�{dF�}e�\��WΝ������u�!��!t����M���
|n97љ���p�X��z�����ޑ�w+W��:1�{��we�Cs�>vH�E�:���nVԎ6>����7"?E�r�v�KT'��;�C[���1�7���.4�;9z�S�ꚋ�Oל�kr�	�z꙲�O?�FP_$`���b����)����F�Ҵ^^Ln@E@f�H{�f� $%�ɫ#6�Q�=:%d~�����ȫX{ʋ龮��! ����+�/�q�w%��]t�EJ�(wWN�fD����j��l�'OrE>���c[�e�(�b�%�f;�a�)cg�({�����(,��]��$�8�'�x�F�{ -��&l��rj�_�cY�ޥFu�v�kMY���ȭ�M=Wė�rb�`N��ɭJ����Bazг�\��c�Įi;Y�P�,��ȱ-F�f	y�嘛��ȹ(�p|3�����y�vS`� E'��E!��*ՈV�l��(��&m�,���.�\����=�;�7>	�^��������j��k�%d� �}�7�_��޴HK/�{�A�C0�N��#��Z�]T+YLāе��ȋ�1�����n7��8ᙴ䒼���m����Wp)C̣�m�v�9�|�����%M�)�OYa/�E��$�W?[�w��4v'Ћ�V�D^�0q�6_��@) ��~w�1V�v�H���=Pr���}a���CDD+?�b��G]�]�@z��+���!�D�s���ʩ��ע�vm7��I<��>�ɀm�Q�0�8+�@8O�gJF��P�b���P�O~��IB���-����E���f���؀9t�]g���q�4B�ݓ�N
[&��;��[Si��j1eN-��H�4��"�j��E&ds���PU9�a��U�ir��X>�i�U���G2E���8��� �{k���ƥ�#���ڬ���sF$}J��G:��21ia��k7�] *���p|с�s���D{��FR/;�e#�%�
�o67Oyq
�M����J��P�P]3MH��/Jlk�/��hz1�� 
���O���b�N���\�p��$�@��J��U������6O���ʪ'�x�&l<h�EsȚο�}n����#߮���B�l��mj�ކi}@��})��~Ы�kS�޾}���9C潒N�&N7ـ���SvTN|�(ǧ���oTWr��a�B�^�ź�E��q�
�����,	)�}9�z2ȟV�*}�����O��X�^L�A�}W���XƓ�z���L$����B�	��p�HS#�O]�?Ln54e���t�Q�� �<�?����Շ8��Ѳ����N{�J���5=��z�L��    _�-Gf*�d6$,������)�j�'�
�=Jd׏�PN͐J��ݷD1ld;�6���a�o�)�(Z�s�J?��ȱ�2���w��"����>st���C4!W��"'^B!m�{�B�S ��~���Fct[
5�G�)�}i&�*�K�p;h�p�6�rZNYe4{��ĈQd�R�bz�1�j�BZ�7��`�*;au�{���t#�e��z�-���L���}�PQ�� mF'�����k��K�B����i���֌	t� �1t�ɾ�PJ�J��i��FI�`8Ee�E�@����<r\Y<���H/�}��I��Ӷ��{�`�;=��\�K�S[���b���u���no-3ٍ\=@�0��(���@�\��V��#�y� �)�G��kz܂R�"8����������%8/����������+Ff��{��&�

���]|��U�T߰�����?�:�e��������J儂�������������㰭��$V����6X�}�SE�b�t]!�跣u@��c�����I�Eѿ�ǠyH�]fh�`V�J9uR�mk]|�v�G('U�|-���� ��)No��W�b���:��'%���5ʖu�=��
�JV��&��/��lyo
J�'�P�;�!�;����	��q�w�2V���q���x���;a���^�I�>ͼWim6 (�L3J�F$���_���B�Uz$�l2$�!X^���bx�+%r������R���d\_Lnx�J�*��{	 9;����~�o�dJbn�8H�F���v}��P�b��r]��,��?�%��IP.[��s�y[Q��/�K���p�{O0�h'�i��=�45���~����]4�w��㤠n��֞ĩ����B�Q[�y�4z�f���ڽƳ3�S�[�h��VHW�7�pyݝ�����v� �rX�bz<*4p��&9'���{O.ɗHN�u0��4�W�)�G;+�?v�r��< _ڤ<m���DSd���i�ᗻ�O��}g@^L6v�]�v�m׵�k�|`h���>�7y}m�Ny�.��l�T�m����� t�s�yd.͗�jɔ|���ry;k�}���a!��+����Ss�Կ��" �����V�M)jf��CR�~�zj拘���쾏_��>�����(,��0����m7�ZC<Y��`_��OS�L�Ԯ_9��r���6�N�bjވ���Ƕ��ym��~�����w�o��.E���{_��>��І�Cp@A?���Q�&8A�l�w��u�GbdKMw(`v��_L��EN�ph1VCoP�WWΐ��j�&m̓�\��
��)B���g�ɋ�OO5 $L-�G�j���h$/(��nbaoh����}"j����fz�||"�	��B�0����*te8.D�cJ��Z��oj#�0����qw�g&6�cQr���@N�Y!fD~�Hy�NY�B�ѐ�&��&����n�gKϭ|�.�&}/�_��e��OwLMhӫ5ѽ�ܨJ�"Q\V�U��EYq/����E[4�[�жD-�#�.������BM�n@;�l��Y�b�~6i�k��Q"{����g}L���7�MD����]FZUh�r���y��t�u*h�t|��2�+�����h����ҁT�fb& ��Zp2]�p?*ɳ����a~1�Q�S�6mm�ӄ�\/����-�;��*��֌�p"8�[<la��k��}i��uX���&T����mq��&���T�F��,ʣ�t��=��w$N}\_���a>"�On�fÊ �������Q�!��̯�.�(�4d�)��#�<)#Yᅼ�Y�b�X�-u��Ӭ2h�7yq;
2p{gj��vr�{kO��wQ�����&�b��mX���o�e`@(`�V<y��d���������V�[/�����1j�ju8'��xS��&�=)��ˎ��Ir�y��^͝�{1=n�/,- s�|B���Ҟ�Gy���"�N�Mm� ۤ�_���h][���gi4�$xWvgI�
��z*?��/��ede65B��8>neU���sk�aQ�no�n���ZCYR����d'���7�������I����h�4$}��ګ,[�~��.�8�D"�Vm����AV�[9�J�-���8�<���!�?�����Q�K�=����J1�4N���
��(��A�����V�$�>�t%��0�Pѯ���1���L�#	39�E��[P����(���ԕz%��2����4����㎁i7�$�������R�	��P*2�=��c#_��*ฒ��l�[���ǌ�U��B(W���L���(h[��}���C\�(�*8�&��}n�������dn�V_�*�p�U��%-"9��Ċ���ڝҋ��OG�x��p�ᡠ<��5��-G���K���xU��S{h���ص=��T� 9H�N�ҽ�s7�s��= )����0Է|���R�?L��%х�b�����X����Q��:43�՜��8/�q[�J*x���1~��G��c��<º����G� A�M\p}���\4��� E�u��!��f�>�dW��&����/��LLޓ����w`�9��e/�+Âd��
Z!:�
�Y4QOW�1=ƦD7�h��t����	����
m�r��au]��5��%m׶���-���Z~Y%�dޖ�p�u�f�����sX���xb�_Ozr�P+��d%�D1D���-;�)���嘎����ǐ�U�+�Q�*���?K�B#�S���|p�C�8�Z��6s�_L�P��H,9�ΟC���C���3剿�.�� �ژ��n|;XP�~-|q�J��>T�h6��?�������=8�9�@�krkL�D%�0�ܔ���-�$��ʊ>4���'�D�p��!/����7������}����ܥ���"���$��ew*t��Zm��tk���m�������G�Ȱ / �M!����49�E\Ѭ��]?�I�֋HQ6��+r��ݿ��� �tEwY�I+�Z[�}�̴��c�|R��G�Zt�$��r�X�~��f'+O���x�8]�9Z���16x���˯� �q�l�++\�0IEPv���U,D�H����xU{{h�^�1�q�B����ըZV�n&p
�2�І�G�y��!~M��P���V����GU����������9�h&��w[�z3=-�*����#�Y�A�\9L.�HZ(); �Q��;�o�
Iޯ�v퓑�"�7V�?U���fLߋD�|���X�d�)�ס��ֺo���x�	���c����i�>�0�;ŐS]�vH�B����lڛ�=|�ɚ�D-\Q�]x4�6n��Ft�
ٕڭ0 �A0���ٞh�<4�ɯ�6uewk��a��n-Zq�KX�6�/�3�<�r��_�6ǻ�q7E�`��s�{�\��B6H��)�%����ert���д����#R�D�Ʉ^�Gv{�z�K )eU8�y[e�eF��]��L1�C��!��"%�������#�� �j��>����L���к�.�^+Mq�P���M>����?;C�Pe��^M�O>����+:���Ik��#:lJF��/�$�����A0��6w''�x�d�SE�� +�N�:c���+<[�:~N�m_?�Z��U�x�3'��O��B'K���-^� �ee\�]��X�7����,ە�t�-���8K,�+C�U�����ڔ�zDǛ�q�_��L��Z=;��]
��~���8���g9�qf���cpDX�A��UD�J��C�����=�]۰�'� �H*���i{�_T8�=T�Uu
]n'�J�3մ��,���
b_�!|�����wP�4��:Enq+}���`��^m�iY>\��( �N�G~l�̋�1:;�r����;ʐ��O uF'�|�F3�͠r¤M��I��^%)��c8�$��H�Y��)w�3��3�k8�|CNXe5N�)ٵm'��    �J�A�k������a?T/�2iM�9jR�|e�]&��br�p�.劯~[���9]��hyC'�N:��� �P�S�����?jZ��5ʳ��q7�X��Q�7ud�t��
0�"�B��}|	���8�����?�f��;��
�C��o�Ce��Ho������LYjh_pS��o�v��at�����1����`�tA/&[�m�a2�iyE�.x=�x���t}��z�O��I�����|����E	>es����q��l���>�\\�ǟ��{��F�K��o�n8��d�F��x4wپU���?��4ӮD�S�0���MAv\����oT�)2�	�	�*
�G���r�����X$"��|R{3�_����d�Pj�ǎ�P]��]�5��L�wP�>�Z�hŸ��_�c����/Υ����N5+S$(ڮ��z�t���v'Y�����1�Tx<z�S��=۴)�L���{A�38���bO��1v��ㄷ-NjCw}=TZ��|i�U�E*���hێ�o�u����ﰤx� d�ڂ���6[1�7u��/;_��!Ɋ����1�|�,3���_#X��6lp���P��[��h�H��b6zϳg��19�̰!�J��Tst�1�n��A�:*���(#�.^���J֐}���͖/�#�ޭ��#��My�ɀA�[�A�8f�q�$]��2L�d���/��]� X�F����������2 7�i�WB��w�s��n����(�������BS�ۢy[�OQ�T��˥he�{rL���vu��[@�Qo׏��z���Q��)�"L2�BH�
�tU�<o�΂ҭKH<��b��S=�ʂ�z�i9�<o�����&�γ[�yVT(�m���[�A��<��,Ǧ%IG�*9�2�������f�KϚ����/��}� ܀��Ghd��QvEBgxNqO�_^��%�I�k~�Z����}��[XE��"vZ�[����E��L��6���5d��艁ە�0*���~�o8�-�='�Q�T�]��2��,�)�Y.�rؐ�:�f;�X��b�*�P���t2�CS"Ph@h'�|sր%��!Kl���_��-�d6��'�]?��l�.���J�i�t�s�S�^k:	U�GzX���d>l�@�q��D��@�`��`�U&�m��=��MC�[�qL���&,o&w�P	i��z�-�SS�4֙2}�y?'^E�j�+��c�+-g��)��J��D�G�W�>��o.��Y�^�Pv����=,l�Lrݱ�K�?��˖���� :�P��.7�	۴f���q�_S�n��ko�T�9Y�KA+T\x����?Ӯj�+���q���0����i�s/�!�����1�'��m�=���H�&���v���>��[��G�}J�HҲ��y7��!9�e����k~��I�}�bz�'w�@�k��L��&�����M+t�o�R;�[;t����6������޽^gQaq�6(؞K=PD������]ۢF�bǑN�^Z�Pfh��O�́��kO[�N���ʛ���k7�$�U���ȴ�69˱���b���1� 8s�v�_��21�r২��h�ɞ�W�I��6o�y�vOn�+yC��tY�]?^!M9w���Q!R&����d�%~w��W�uK��6.^����{���p �!�S]��,�C��ߋ2��^�g�+�	�^�)�i��v
퇖wtW��j�dJ �n�^]���Ԙ.L�1�aR,/��Ê�_mE"wx�Dl�ZT�Ҫ�B}�ߑ_b�p��b�r&/��Ď�RY�w��	�#)���Ƀ@I��t��Nϴ�
e��o���ﷂ�hQ<蘎���Nh"B˶`�� �hvp9LP��SV��ɖ 2����a
����Pq2 O	��~!���8F�t�b��fz<�28�#��[�8TK��\!٣M�X����H����2���{p��e+� 	O2h��97a{9hx���,�i�79�P<��ڍU�T�	%&�2%�m(s���ť&b��7�h,��Th#x�oo/&7� �+?C�ݎ����N�
��"f�����=���"��fz�W(! a��^[߁7MkH�6Y"���6%�Ya �S\��cFۉ-c��A����crJl)+LyfK��5	����>�]Dz���0�4d���'x+� _����5V���Νd����}@���1^ն�f�O�<�:�f6��Uh�-׿A�AǍ�ƕbF�zco��4j�v�b�Y�c�R�[7��|{�R�õ�,�� Y�o���1$�8���^L�;
�Ⱥ�A��+B���!���#��8|k��s݉
Y���`������)�َ��BIf|'��@ҍ��>����H\v�)�׏Yi'S�� �V���"/��K6�	�D@�+�bR�P'�X/��Qڏ�1:zw���rFrS������2��J��!4ӌ4Z�}oJ/��hr�e��+[pX�=�f�f4�	��xsUh�@��=�8! �����;�&��p��|�&U�o��.oq*�Z?\�G�fJ��i�We�>K�]��8n���1�=�b.�v�f�YCs��J�!Q\��_?M�A�6���P��ي�{hp�nth�F0�W�|��/���L��a���ɾFP�9�C޳*C�㴚ղpv����r�+���L�Q���1q~V_�h�����Ē��f��舒���}�E�}`�;_L��m&�X�An�Uz��U	P����o�b���F��S=1PR�����5ڸ�)�OXz��KG~w�y�5��}@�מN:�}����%�Ꝋ���(R��0�BfW<����p}Jrj�o���Ā���G���Q	��Ȫ��?hs�}��h7�7T��Ji���~E�"S�þ�)Y{Pc.�f�iՆ�v+�(|�	�j.�#�O�?���,W����j`,6/8��/��q�AXA�CF[���/�k�݋��|����� L?y�+«��,��[�3���5��e�<�������N���rfG�½�&�,�����P�ڮ*�)������c�A�t���->���PW�9�z�ty����k*�յ��lA��p\B���-�_�8�j�o�n�!�C���4���8"�VK��b�>�w�<)�&���~SA����u��Sh���)?���[s��&�\ ��)���b��ЗNT�f�{��b��HX>)5^�����]�� &�RL�����xyk�:�	�����ol��J��d�2�m�;,��pc x1=�h��^Gy "��9;-�]�|���L4.YV���͎�_��*HF��0�0�[�D�P��R�B�f
��ғ
�4���Zo��C�G���n��蛽l�7(�j�z
��N����t�����br�v��﴿�@�ASy�f
T���UСɺ��9��y1��$�ԎT�Ui��H.Ei�J�k矪��l���5|�]����N�?�a��3�	�5C�gH8?n��7iݩ�-�`���T4c�?�_��&@� H)��3h:X�����*���ڍN}�/w;�C,�+�5���=�2G�t��ƴ�TKeì1H*�c<Tعq����*=ڼ]?�b	1^j�����N'�!���T���L�^��^h�:����1��jQ�և�� �${2۩��z��v�{�04Vb����pz?`�CrƖ�Q"x[�ʣ���b����Ɤh�;���v��*��m�B�#Y%e{�r��IkuU�#���:&8)N�o���M�O��8��L_�<����9hy}%�)�p��r��Yn�x1�	��SqS5�q�,gj��C��;^'�ج#�q�v0�8.AT�)��t�ɨDB��M�h?��g9n���g��-�����1�x���W6� Z�S6���H<��:�5��< ��a;��w�1��=/��m������J��z+Ll8&4t���&��y3��ߨ��F���{���=�Pf �F��� ���	w�H���z���4<E0��綘~M�p�ȫ���d���+ �  �8tp���)mR�L���
�
t/���bz�}��´D��ܡ��6-��Rp�TT';a��j�>�l�M�7�o���9'��֍�-�1~�Ƕ\wU��O1���a����r
>��ؘ�L���j@�I���;'j�Nŧ=<���A� ��X�%_����h0u# j,,HY�k�>���j.m?"����|iU����;�~�8��~�����XM���У��x\C:+��-��l�����YIԡ^�c��nG�Zܙ���!�9V夜/��|��T���cX���v�X�A�6O�?��E�g��:M5���Yϙ�s�4��>r=�*�t�:93��s*�A���rZ�z�
���!�I��ެ^L�����&��`��IŅ��PQ�(�(�3�W߄j���,nv��,��֒� ہ8�q���B$҇�G�W9�Ԁ���8o׶5֓(��?t��D[��E���<�.�!#Z��!�ݷ��x3��!mg�Q#u�w��2��)S��"����������m�_?f�Q@�!smL�u��W�M�+9���P�M0E��2�~)~M����h���@�R�&��X�U�`)b���L����
��f:0�p%ꮏN�T�'���w�ʗ�c
60h��#ǉ��i�La���7,�T���'�6G2�t85m�Wwu�AХ�S����>�a��B�(*��o�O�+�	pX��;ih�]�b��)b�'�r��/�<B���k���nel������,��'�x΢���M�n��U��5K���+��v&G̚�o�5=F����}n�hL[!EG9��h��!Ӷ췞eE{�݉�bz�(��}�:d��i6��e�!�z������]g�	��y1=�gL)q֍� U^�a��RB�B#E���w�U�V2����cH�[�g�<�������vМ��������)>s��jK�˼]?F���XsV6��Ga���䈵�M �J�l�ࣦ�Ӡ���6
�������3�[�p��N<��t������4���] 5�՘����5���#��O�s1�]���j�lWc�O����c��F�`�3���ƌgcƳ1�وQ5�w/�Q<1^@v��G�l���K�X�?�g#�Z���Gb��G�lP�	��I���hq�e��y-Ε�~�(���F,0$~Y��x6R<)���F�g#ǳk�HD�(��8s�b��˥�X.e��G�l�x6J<%��X=�G�l�x6J<q�i+�lĪ$��ų�3�X���]�-�:lq�a���o���?�g�ų���h�l���y�?�g#vs[����m���b7��nn��l��>y��ˆ�HI5�a2ɻ |a��I�[\XvQj��-b˝:�5�ط��;�J��Bq���Ke��@�.�~��`T��I;�����F�ߨ��T
��n�ϐ�\�뢐	�H
k�N��C��C�dM/&w;t���GW�Is�w�Ɉ�^��"���,/d6���"q��k�+�&����P��D$����,�Z����W���O�W}�9��>�=a{3�{���F�"��zI�D����A%p2<%}�@�snH�C!\%�Z����W�y��M���7-nZܴ8�iqp�����M���7-nZܴ8�iqp�����M���7-nZ���Y�cg���r���;�=v�{�,��Y�cg���r���;�=v�{�,��Y�cg���r���;�=v�{�,��Y�cg���r���;�=v�{�,��Y�cg���r���;�=v�{�,��Y�cg���r���;�=v�{�,��Y�cg���r���;�=N��8q�cG�ǉ�'n{��������m�}��6=�mz���ط�o�cߦǾM�}��6=�mz���ط�o�cߦǾM�}��6=�mz���ط���m��m��=N��8q�����#N܎8q;����#N܎8q;����#N܎8q;b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tľ�}���#�EG싎��/:b_tƾ�}���3�Eg�����/:c_�W�<%¦�-���ć��(q|�8��u��AN���i��g���د��_;c�v�~�����3�kg���د��_;c�v�~�����3�kg���د��_;c�v�~�����3�k�nT��v�V��@��:��L[�������hSF�T�'��l�C�&�i�� Vi�� ��Hb*�~�L���^T���"~R?LY����_a�Ϣ�|��+�ZiP(�*m�J��..�g�@?'*ӏ0`U3��_���xu���!�Beq����d�޲F{H�U8?g!��.Y����P�k�;�c��3�f;�8v�q�0��aƱÌc��3�f;�8v�q�0��a�d5
��@@h���ss�k����iDW�S��g-���>u�h��/&[qt2��d��Ɍ��G'3�Nf��8:������C��]��9C��~t��_#T�`D�� ��_���1Όc��8��X6o��Y��DeF�L�i�Z���2��i�b����w�n��I����n�����ú�۔Se59-��ȴ�6���Ɇ���a3�f��8�q6� l�A،��a3�f��8�q6� l�A،��a3�f��8�q6� l�A،��a3�f��8�q&��=���Q��[�o�����a?[���������dZ��'�bڟ�M������ 
�/���!z���n@����;B�����_/&7h�&W@�8�\q �� r��:��q¾P'JMr",���ʤc�������f�,����x9H��ɣ|��(Y!��9
:�2Ȇ�{�_��sM��i��/&��8D]q���u�!�C���+QW��8D]q���u�!�C���+QW��8D]q���u�!�C���+.������ho��ފK/+�V\zYq����iA��s�پM��B�!{�Q����E��4ܦ����/���dk��8[�\��@9�N��Q?$ۄA��}ꔧ��:o���9,�=B^L�-��������      �   �   x�m�M��0F��)| �Z��v�V���՘N�b#7���XЖ�Ƒ�<�ϛZ�L��0v��4h޿���e5��~��- Ϥ��5)6�|U�'_���lQ4��1�b�c��m�ʻ�x[�Z�@/UO�p@��d��z,8��*y�\�tsٗ�Q�0�����q�D��g���ja��T��G����<L��#�����;��z&      �      x�Խ���8�%fW���w��)����7]��nE(��!����_-s�莨�pso^�D"�%�_�������g����ԧ�iO}:P��ԧ��L}�P�6�q�}�{��{��{��{��{��{��{��{��{��{��{��~����K����\W��_��������v(>���"�j��?��_����?������Xn�Xn�Xn�Xn�Xn�Xn�8n�8n�82�sA�qo�qo�qo��o��s�~�*ˬ��!���0���ˉϕ�|N;����o��_�'%�����d�K�']��ůCǥp#�s#�s#�s#Փ�7R=7R����OH�˺_�����66�{(��x��~V��h�$�Ǯފ����{.
z.
znlnlS�[��Y�r�2��{������-t��+?��?|��G�=zQ���������xe������#]?��C1����@��\>�Ϙ��Y�o���=y��n��A�
���ra�$k��W�I�qn�r'�����Q��s��s��s��sѴ���"�;,�W|�������Yc_�_�w=$�}a������ɭ,7~"7~"7~"7~7~�$�&�&�&�&�B���Ľ�Ľ�̽�̽�̽�̽�|�U�S��ђk�\�[,r�S�9��,����W�FS�FS&^�h��h*W}ze}��}Du۵>�%��d�>T~Қ�e+b���I]B
7�7�7����f�[Umg�o��ʂ6�����o�N�>.�j��u|���J?eݦ��\���f����]K�
7]�=]�OXs� � <�~��[�e1��I��cg������������(�-dM�-J_���5��e_����'���C`q�����Kc�Fe׶F���m ���𻩽X�Z��bFcA��#ųO1.?	Y�I�Ʒ@�,���Cx��Go2�Yڡ}�1�\$ p���EB�I�)η��c1�����gǨ�~�T���zǗ;�Aݹ۟��6N+�~>'��%��ZQ~�`k��ڞ�@�������z5�����>����h��B������AA����C�6Y���\��ϊ��:K[����}�% l�����8ˁr�H���`��2i�����#i%�o7���>a���県�����˝՟^{g�J--�(>�fA�jK[N���b�,�i|[A�K�$^���u�����L {��/��M�߄�s=U�W՞x5�{��z!硑_k�L�|��n֏�^ƞ��sH���I}8fk/1��Kz����=$ƹ��&�GE�)�t	�*~�%Z�0,^l�:��Ȇ-��27VT��J?[��W��I��7ұmb�?b`ᮎT𮓺����̓��>�����wM+�����BWD	�y}d�m�mcY����TX����Q�����g�.�뿑��1�l���Y���
r�t<����lA��~��C�$�
a��N���G%"n�q:�e�,N$\<����wA~�/�?zFQ�X��� �-6�T<������y�+�BM�2`���T+���٭x�f���\ �܇ʏ[�1'^��C��_<_�Ww�u#9:�x|^u��(���"Ή��a�Q:�\�X�N�L��-����!��Y�}�+�ֳ��u	�1#�}�rh���geS�L���>����Hj�qA-�=�=�G���s��im�|���kZU�o��+*C�̯\j��Ε
�vN�^p0`����4�%��S���m�{��=~�rS�b�y�H��%0���K�`��p5�cѽG���)D�H.�y�0��+=�%�Q>s�ڒ��
p���-I�5�C���m�u�[���Ŝ��w��w�k��}boŻ�x]Z��H��Cȝc��U"�12���O֌�ﵺ9���6t5��ﳫ�]�����ZO�?�P'���D��xTxd�aϵ����l��f�t�d��7������T���e�CA{����?4��9��Ly�����3�=�>�ѷ�ݎt�/��='��Z>�ײ܄���ۨu�H�s#����Nr�4�=��`dW���w��l��[Q�%�8��h���]`�Lc�9)�K�+$Kɐ4%C�IT2���S�\]��M)*�@��v�F��p$IQ�dE��qd>}Π��Xz��3A�`�}G\D������dI��&UÍ��wr���<�.>E{�~�^zejY�o� ��P5���>�����C��*��p��$��V7G8�����:sv�*b8!X��V��}�����P���7�OԂ�r�-�
�a��m���{h}�d�@2�L������QL���+���?
Y���S�@�P2j�k�Yg���x��d�a!��wl�R˪�m=�����/�����£���%�a���kn=<$�	��O�7�؄�o�Z�6=��E�mɺ�]�n���xl���і�s~!�̦'_��v+���~C����74X�^�Z��55��(�����l�K�5)\�����S^S�+��ǽ�i���=���OQ�"�;f�m���q����T�}JK5�<cȜ��@��9��9�ɔ��y��iH���F�<�w�lt����������f+)�.��l�&�c!�� m�Qa �3��&���eux=�U�4L���Х�	bL_�X�{S3i�\�"�5k�Wy\��w^�#j�O�X�C��׳����yL�(kH�l�	m8��bd��{m�!��fm#�C�I��$���s�2��ӗA�]�}9��|N�1.�����b��Z8A�#�42ĳ�d���Q�[/}^��Ku��I�s��j�)dT#��������h��2�G�!Q���:�#ہġ��
vF�Z�"+$׌w��E��J{�;ՍuL���D.�{Ϩ'��;yw~���SiJP<�s�_ۯ�}+;�Hځ�I�������C�yY�ye�������A|��L�s#���|���9����AW� �1�$��k�c}=J��>j��[���J�n��{ٹ�1r�ݵ�����ڞ�7jT�9PO�k"L��}pň}F����Y��Z�t�;!�&W2;v.�-~�J���l�Q�����U���d^��_��&��h$*����\�zD٦�$�D���v����Jd���v��Q�$�/"'��{|Ո1���V�_{`r?]QS3�IN*�S�s�]�ޯN���=�ﺟ=j�du��9��~R�%a%��ko~y�F�}Xo�!��(ϢU~XRzV��5�;��0��ؙW�삤��yJ�4\kG���S���2��rQM�Z�*u5��4W{�X�f�̼9��?��Z+�=6��^?������\[�fs;�������s�܈��1B�� �����l�.���2u����M�"iY	�]G���$%1)�V�:�ӘnF��{�x9�4ܯ{��Lm
��@3%k�+�����7� R'm�*V��g2�y��N��=׊75⼝�4%�g�4X��b�!���K�K,���H��]C|��c�4�1����O�����4,�$��b?ܓS21�~��=)�ް���`�I�}K��_��3�丧-� [��k�f[�ڮ2�j�$����`<�qO�X��1�(uD��6�#��,W)�����f{~��n�\$�jȜdxe�ar��D �^w��Ò���%s�p�48((6�3X����w�;���r'|�\y� b%V��	mԟ������JT-��@��Y�-Ϻ;a���������>jP!�4+���aJr�Z�P�'��Rd�%.�]�p]�"��4���d`[�В�h�H��a�e�|#�L�A����jZ�ǬC�}K�W��`E���[F$C�U���Yވ��� ��y��;!} �����U3�Tاz��A�����������(�An ��es�n�g�qO����6�·�$1[?�&S��3$�AG?kI3#�����㊜���N+����L�(�B��k �,2
�`���lI_E�aV�6�E[��M��ay�=dqoE*��G�:H����W]��#�o9o��kN��x����&t�L�In�%��6t��q    �Q�>��N�r�L�'�(8*�OO+K2�mh�,ș!)\���-���&����ث�������gv�^^�鮈���G?����Qs�uc'��<r��|�I��K�o�S�]f/�Y��1ė�f�1^bW�E���|�l������+�g"�����H�/q`nul;�T�)��\]��Y�8#\�u����9���zD�x{��Q:X��Y��S�>O*��a��E��T}��EFD�RmIWMK�jZ�flc9����^�Y�����M���ѹ\Ǜ =<-I5�������՘QD$fWҽVc����vB�P��QO4�6qN=�ǝ�۹'��0���w��0`>��:����OXf7��Y�+�i�:���L���sO��`��夒L�>��)��
Y� ����i�3Da3	jO�C���ի�t��i�u�����ः�q�� ��S��t�>B�Ĳ�Fv�!SE�.i�/�Q���I���ݮ�soF1x
Y(�����v��ت�{�dmI���]�Bѻ��������u~�`�B���C�� ]}-IP�ٿj����(��Ϲԕ~��ʷnyt����$m۳�w����n�c�Aqb�J1#욄8f��Yl�5����V�<)��X�A���<L���t0�@W����0�����U ̲�=�{O��4��y|��H�fK:5[Ҫ��qE�Ԟ�����H�΁�3����KWo�`�킆����*5��~���?��I�%��4��$�ۖ���uL�r("�t[4��c�����զnL�w'��}���"�Ⱦe�e��Y��vڥ
a�X�>�2�PJ�T�|.o�AZGےW/=��r�;�Ar �L��<.EoҢ�>�[�����sP�=��[�����J�0r�E6g#-�i��H�#-����p�3#5Z��YH��0�aL�H�a���~�8niu9�I�_G��t���J���_�|1�/�Zw�y匄d�+��݌�/+�ѣ�Ƣ۳L+��F�av�|���0��4�o�C�W�9-��ERFLG�IOtdGUg-H!Z����59dP�6�,�3����}+ͭ	N����b6S�It�������D%�ֆ��h^�Q����W,/LZ���>7� q7�u��ۜ�kS�����j67����r`��ˮ��&PI'�`}4F�� �i�\�?�^@����u�r���v��F��-��_i��Gl1�pS&;��֟E�E\���͞�.�;� {�|"38��'5V����(��s�v8��ђe+�,΢니�P)�Y�rd`G��:�E��>�l#`�0�
�L6�f�l7`���jݓ�eb�樵��T�G\���,�M����D2Aٚ_R���b�IV�3f�O�U$/БF��wcvԳk��u�JeO�.�K�6i��\��M�v��������$����y����b?���TO�=b���[\�&n����aM�8�Cl�~��}>;rv������pU�?p7��y(h��� ����:�^�Eo��=��J�{�.gNRN�������?�t���H�#�{�6	u�Y�k�3l42���b �:�i]��:]�x9��M4�����z�[+L^�t9�H'�{����Uh�����_Ӄü=������Y5��P����ƒ�u�����#�DI�s���}��IDl}�����;�#|�����_�%DI0s���#�;���⽝���[�����d���W��C�a�$�D�A��v�'�f��Aͮ�o���<�L��J�J����q�!���h��|ޭ?i���^&Z�؆%@�,
x�E���V7��f/�Z�������p�lU�M:���u8�f�A�d6i���I[F�p���	��D�1��@HJ�#)}������܎���HZ�#}���HJ���;�:�ms�ZK�(���>K4����g���m�	��[<Y�/=cT�"�����~����BS(Y��L�ņ��^ ��$3���ge4�<��\T��UI�D��q�q�w$F�u��mCJ����p��r�k؈�;�˖O�F:�4ґ�G�vI�q��+}�f��0��E�(!�C�.����f��q���͑W����Y�6@G:�ؤfVm����ZG$$�9��Zt�j1̪��YB��] ��T��_ug��S��t�H���xT݃®����ͪ�=��NR�
�?���?)O2G�e�����|^�
�e���f���&20�C�?�}�<Koj�YC;��&�WY�����;"��A�Sa��)�0�8t���=���4�d��z���Iv�����/�ٚt��f2`���S�*ő;H�w�5�'*��8g9�I�:p��7��`E�w9ƒ"u[������[�^cۢ'����[��PF�4����V��N߲t&':�rJ��2�8�W(�x���7���N:�\r����h�:�5��]v����ƓO2x<����'�4�v{%2�a#�y��/����2��Z��㽐[����Ŗ'-��h��%��@�,� $��
��ᾳ`���o�H(���2ҿ�K��1}�~����E�#;<�ae�W����e�¨7�I�E�! ����x���I*�'�(���x���ݰ!���F(�(֟�,�O�V
@`���V�囍�fNM��C��ѵ�?����pu���磻Km@��h����=�l�\�h�s/Th�j�����������������P�=R��$i>���--�����kE݇;\\���#) �sI
�̱j��^�R��R�\79
��{�_��eOzry����(�,�-Z}���F�<[W�7u>���]�0����V*,��K?���y�(��\�I����;Y�'��Ű\`�!6���q�q��\�IR�'I5����$AœOT<���CQ����[�{��a�s�V����c`�l��Ű��G\8���~aY�ۑ�5p�$����=�q
�DѪm!�C*��Fy�xL5'Tv��u����I\W�%��' �r5&�:��P�'�?�$��NG
	�`$��.Q�%��N����>?�%���Ǟt��Q���~6Q: �Y�Ψ���]`��a��%cP,7�|^�j�W�R;���ܱh����f�0�lRO�Py���IƊOw�6@L �^�=��.���u�5�Q�rUt>7��P�P��R� .m�D�J�4.wA?N>H��':>�`c�!�hUܮP3��{�/j�1��,�
�Y[���y�#�I�!Oru<i��I���e��|x���I·'9��|x���I�O21<iV�IF�'���$*x�������F��Oo�'\�ՄKF�2�����E���kr�ꮣ���2�xȦ��$A�>�!ԟ̟�����뺐�_u�r������$����ǉ/�x�w�v�����V��m�<��Z��|�1�-�7ĵ���	ԭ�J�@�d�11�}���o
���V�eeEJ-�b�MHJ	��A�1�d�5l�?1���d���ǵ� �%����y!�kO��D[I�A�'�3��:2,��(؏K��i������Yw1Z�?hR�$4�A{��5n'M��cL2��Bׇ*K�H�z����`yn�㞈K����i���$}#��@�7��gA���g��cYX��	@��k�1������'ʀ��ÀL�i5�{�ZY�s����%؁�i�+�r)ge��}��Jp��K�U�\FA���=J���?l@������:����|5�"�,�@6��;���D�+���Ǥ��Fƭ�r���q[?0JPlQ[�x[���^wYT�	*?��4�XZkj��՜�tM	$=&��)�����#��hZ�񛗜~���ګ�c�4���`�.i��FDqꪯ�1=���8�3����Z�
$'<D�;�K3� �b=�JM��L�ʞKa�v��=��x�^����ǿ�`���ӯ2mFWE�$(��3���	$!%�]�I	d״��)���jף �,�#��[�����3rne����P����q�{�,A4�p%x��D����5�Ҍ�g�Сa��S�v^9sH�H Y#5    $?�S4;�����V}�V�J;_ma#jv�i^�h��I��I$�����}��XҌ��b����?_" B�tBw?f���E^i�Y�xbD�%QD�¦���p��v�sɝ �5������-و�ȅ�d���_��k�������[\�,1Q�C�2��H��@wi3H��@2M��	�~��or\�r3F��.�eP����@Ǟ"��~�NV&�ְ�B��(Ьq#�ab��ze=1F&�O���I;�rVM��K�
�b�ڕ~A��H&K MYI0	$�$�n��|�����(Ӽ������[�"�{aH��8�F�>��c"y���w�T� �k�R4$-`B�36j\b'��=D/��T��1�1W�|���F���HH"I �$�$��l[h���-����x�5�'�'s��`?��ʍAmvd�Z��hA:���g�}]ҽAU��WFΕ���x�:z�Z�u��E�$�V��l<,���əCRtI�	$E'��P�,h|gW��03��������uD�ҷr*��Cؠ�|no,�u�:�Wg�WMf�������dMpRg��eO%A�ŋU���v!y͡���S\��o����2lB�p��;�D����2��-z@ӶK�u����;��5!p��*6A����
$�>�V���f���.�x�v!��qz�v&@�qԾPx-wkOxx+�ny	�|���������H��"��$?,��"���[�4���˸ґ/��T�5�m�iq)�\:�#�V1����7s"i�Ic�x;��&C�y/��3ћ�[��|#�Ż�Oz�5�fE�s܎����k�2��|#�;�4X�$�&���Hrj"ɩ��%J$-Q"�?��5I��/�w�5�X�Lм���u]�s����1cn	>|)�xC�="I��$�#��$�dAD�ID$;"�T��aGt��meS+��&�y�ډG�b��O	���̗��w��'���w��4������6z��Έ���hq�m�|?����c��I7�HR"I5�.�}������"��!���%ɮSf������������r%��I�C$)��8D��I�H�PDO�+��$I >�@|$=��k�_��堪KGJ`���XM�zP��ՒHb�1�[@r������\y�8��M,=���4o�0���Ы���?0ߢ\�k��bFq��YF��+0��x$1�H�W�PT�k�����-B����n�;"=���+�y}_���Ȍ����%������v�$�I�=��{$��������}���}�~6��D_�O3��P/���É���ר�־�'����~��K#�j�J��y���%��H��1���C�9;Pf�����������8>�8}LM6eA9��-9��iہ
j��߻kn��������]	�,^e�������:�1��W"	���#�}7O��T�I;3�Î[�l?w3�HB��#	�G��$I(>����t�$P�-f�F҅� O���%�0�c~���N���cw��b���{����g�r����$�	�G���wF$�3"	MG�;#���DQcIw�\e\�=�<2�����w���"���[�g�[l��=�r�>l�ދ��0�F Y�[��wm*���Ü���\�����9��C�K�V�?zo��GO�(�w�����B����<&A�Xy+���:�j�'��t�LC�5݁�{�i��{�{��aQ�ث>H�y�D��'O$
�H'�t{�`jM(5{w�n��^Vx-��/���]���>��/iR|�u�M���I"��D"�D���'í��Ĭ�Y'�N$f�L�x��R�DI|����&}sꗽS�d0��#�W�D"�D���';�Z4� �=d�:���}���	>� ���d���}�����!iYAw����u��d��� 4��J҃�9^<!/�b�1�~5*` ��������O�Y��H6@"� �濆������H罒�Z1���=���s����d!$����mҫu�KڿӨ)���d�%�9���j�f8���uȾ�F���0 ���>�_T;�M�ve�� ���$�.�Hg��u�����nQQ�&�����}FY{i��1-98IH$U �T�DR���3���%��ES��a6:��{�(je�c���n�b�mT�G�Y�lʠ��ZM[��u��E$��HZD
慺�zV��~o��ܶ�� l��Y[��b��E")�lp�B�dX�dp/e�7�UJ���n�K"��lq���,���nO͜i���L�WCHM��J>J1��8i�V�1��v���k���W���9$�"�܋D�$���HfB"�	�d&$�E�dȏ�ॹݔ}JH��;���$���1�H@"Y �T�'�O�j>�m	d'�Nd�����p�zj��ОqmXDY����d����	k'�N$��HX;��v"a�}C��b�����Z$'oz!m�o�l|�HUu"UՉo	�&�M�|َ�f\�b�H)@��W� ��L��	���Ɖ�M�&��=iOc��Z s{W����<�Ne����	���h�$w���[�Z�8睐s����͕L�����fX�$��I`1��b&E����2	��ǎ�qƴs�E��T����m�����f�yw@~�c���dr�yHVw}��
�%Z��PÃ"���ht��N���>�3	\f��$p�����m�2�^���)i������[��L§���f��$��I�3���LJ~�-��,e7���@d��1�֜o�A"�x����'�����;<@[[7,�����uo��m3AC�kI��x��s��ms�����.Z���C�K����2���V�ғ�o>�������H���W�p�`#�F����ƙAУR�m{vH�u󃕷zu���0�4�
"�o��c��@��t�]�5�;���ײ�(�I��$>�I�z&q�?�7�d=V{H�N�1�xW�[�����0�z�z�Z��?�ԆD��o� 㯾y<,F&��]�F�*�v�u�+�c��`�l
�]מYU�R��|�='�sù����b�OOj �\` 9����}�;�Y��u�#m"1�Lb���3)��Q�v��X��iq3��Fe|�><����k���Hg�.Q|9�敖b���p��$f�I�>?��G?��#�rrwL�ᏩQ�®8Kʜ����M.��ͷ�I����D��,���iWoZ�Z�*U��lޝ�\B^��z��S]4��1�}������@J���a;�g��_�=:
�u�O��$� �|������w�1�uKI J]]zIWL�&��LZ?d�}�I�A&�9��rҠ � y&A�L���3	�g$�$H�I�<� y&완�3	]�8��,K�Dk�������nE��#>��x&a���e!)��2��k.��0߭�P�s{���c�U��~��º9��V�F��X$ �ޤU�{U�HW�"1u@T7��j�mB���9��I��3	�g��$̟s�𐮳'Y�%�b��"��Ν G$)����3�K:F�&�Ll���\5 �>G��!W�4�I�@&I9��w+cJⷼ��7';��3ϻ�F��������1O�riLY��%����	/�H���}�{+��|8� ��E��-����=�����a����F�)2I�Ȥ�>�D�L��3I/�%+(���d!ͭH�����47J~Gu^~&���.��PH�B!���.��PX�s�5��wܱ��[(�Q����UűC^'���z@ѭ�FV�F�ܖ�1j���^��|-��Q�mz����^����m�
�K�bk���w�9�����M뀸V�p>���-����Z^�f��w<p��vo:!�¨�@U%@_m>�ޠ�J����i��:7�y7��"�w`��9�T	�����s�Y��kދҒc�t����S ����isW�^!)+����,RH�H!�"�$��,RH�H!�"�ԃҥ����B��{�.$�]Hܻ���B"ƅti/$p[Heq!�ŅD9�r�aDnL�/���^�-�J;b ��3j�����C<($�Z|/d�y|h)�#j_����M���U�    �B���=)T.��y!���įuM��sdA0pV���!쑽�T�l� n��o���p�F?�&
4�'4W��c�YvG:;y���gq�::l�t(����w�,蒡��$0YH`��B�B���		$,$HXH��� a!A�B���		�ظ��o��n)�nMA{�z\��o��fR��w��Q�¥�+��ow���:GI೐�g!��B��>	|R�[Hp���dy;]/f֚���$<M�z:��i?Gi�YH,��N;4~�>��^�}I���R�p��E��N�A����F�X������u�Xy|��l�4m*1�)+\����ƃ�B͆�>�P��v�,$�YHQs!�B"��5Q,$�XHD���b!eȅD�
���C���V!��Bb[�Ķ
�m�*�t���S���'������I佀���ҏ�*��[��8��/�ܙ�3m�G5��bF�#ݙb;+�3y��9tgU!�2�ʍ�z7��E�l�"5��"q(s�*as���"�s�RWӆnc��fI���A�D�U�w�d@��l�>���B2�7�t��#���C��F�	�P&ёz;�I|���e!�'�C��H�	�&Q�z��I�����i)�'�o��J�	�&ђz��I�����i1�'�o�T���7Mz���7M���M��C=�}�d3�z���ry=�}�d�����i�d^O`�4Y4�'�o�,���7M��	�&K���M�
�z���Rsܥs��z)q�]��o�e}�d��a����{�	֟/G�.*[Hl�:�ݲV�%[>N$�܋���zB:���}"�'	�h�mLȝ���@�K.��h?���^/�� m�� ێ���p{c:i�ie�e���Cf�Yޯ'��*نbkV?�{?�����J~�ڀ����k{���C�re����VK�Im>��`i�&*i3ZO�I]-��d�����������N�,�ps�9Xk}��k����M1~�۔����M4 ���ӲF��=&�L�v�#+���A� ���!ѹ'ա ��3����/hp.s��^����X�����Y��|ʜ���|2]�.��������	����D8�	���|���LF�}W�O\Q;)�x���q���"7�67uKq��Ε9킚Y�?�zw�٥��ٞ@[�I$����d1�4�{�F�T��2�l7V��5�:��5%��)�"f���w��O�����O]��%���>ct~��v��^�h.뢛�.ČҖ���dk����+O��T�1�Ւ�[=���w\�n(�������5BKx��x�ޠ�aO @��U솾�3(9]��Q
�e���	ld#��zoHh���,\*Z���f�@����3��b��L-�(7d���{s+*o3�Φ�"Vs�B�p����?�<����aSs5UXV���|Fa��޷�z^�������i�m��{\�ο'aTvW 7"�k�/{F��D�V�⧆�O���3��E	��/3s�<=�~��Zz�7,�jX�հ��a��z�-9��l؍lFv���#l�8|�(���Ǹ�0|��68h������B	Y�0�Y�1�fZQ��Kc�;��:P��$��>�#K���Tx��j��<;3X8ט������~��
��܇\��AA�9l���#��w3l55gʼ��K�2�3w�Y:3�-����E;dv�3p�@�Gu���֩V������][��x��a5���sL.�!c��ЇC��N����[�׆^���8m��n�<|ۗ�Q~������V่R�z�1�J�L0,3���cGЂ��;A�z����� $�6,5hd@-a=�$ˏ0,?°���#ˏ0,?¸��Q����b�������	TW߂z��g9��d�}m[�����k�E\P��N����i=�΅��3��sT|+���0�{�E�仿Y��t��M��N��v���G���!�h1�����N�ߥ��>=e���+g$c�3Ʒr͖c/͠�����D\ܜþ{�����,��������e�߼h��3��I�����X��y��<xp��YF6,OȰ<!Ʀ$OK���xX��aI�'���9̊Ъ��L�iaS0z>�,/�>�$����)�'�",�6���Ps�1�@�bl鴙�9�S5q_����e�9D��I�~�&̌L�ٲ:����	(��������=���z�"d�f�%�F?6�k0Y��#Q�Ƃ7u,�6ZC�	�Xִwx�r��fXΛa9o����fHyu=��M,�̐
�z��,,ò���2ɶY���f00������vʊy[�����3q�=Ζ^����w�R�X�z�����5���+[а�>�e�0�|O���rU�-��l�+fHix=��_,�ʰ�*C���!���s�d�4�FPz�ݣdC���FP�����s!���6f�����/����.������l���1�"�R���'�c�ԉ�ر��V)�'�#�%u��aXR�aI����7� ���� z��־mz1�a��m�;޹}�����u�pM��R��QR���
uͶ�Is=�ٖ%@X� ao����
#��zkO�MSp��im��`kG��m��b����TPe�:�'�{���ٯ%g�e	�%lXV0oYR��]��4��scEo��֮�\�?�B��1��c������\��1�fK���_�*4ė��]Ӈ���<S����t��r�_��G���F��YӼ��l��޳�c���&+��n�n�;|�,K)�����n�r�O	Tl�\ %�B>\z�_4�'AX�kͽ�G�U[Tf�����<��M��5rR��|��~�
������v�]oU!�Z�W��RJ,k�`Y#koF�"���V��<{�Q���4����2),ˤ�,�²��0X��`Y�u�-]ZQ)u�Y�N!_��K��֠RJ!��М/��{?'�p�_P�qx���"R������{h��[V��(��,��5z�{z=T�V�8�RQ�Z7����gؕ�_�ҡV����V�y��]�@��>�H4�>��8��͗(pA#�6��!5y�L=���|���ur"�t��S��hc���W�e�B,ˬ��W�e���
�,����_�Q~ ��K�bm���#��x�R^K�5�ؿ%iʲn%֗Ʈ<7%�a�~s����dTw�w+#駠Z�Zc+�|��C��U�S��a�;�5��Y����*j�P�j�������ƃ^Cxp
~oT`*���kX���ӝI0��|=��׌��{��R��5��[m��=�)g�n,˯��v36���$�#��t��k�+��[,O��z��~��������gZ�4�9���c�M]���4�e������1�u�5��ZUbqw����s]�?�.����Π.�t[(�Kٰ,eò���xF�ݯ{	��3�m�Sh���
�0�F��y�b���#+�n��5x�5d8�����]@����X��bYz��Y�Z��$*�|Ոt��$�������*-��7�[6'��.���i�e>�ɨ��6h��:�R�1��</�W)�S����'� �2�
�צ���ا��������y� �ݮԶV��ܓp�C=�ߍЏ���a���ڠ�>9�d��5<i2na����|�á�Ĺ�<��|,��,�ǲ<��|,k"d���abˢ��5�-Z��7� ��G��N�ޗn�Cc��9�����u~�0d�
� ��C���-��;I���t��p�
���4bt��� V+]i��mT�"�:�:�>h����;��܆;�=I+����:����{�+e�-T����@0��(��P���<��P��F��eYV�-�U�����|٨���F�V����ݲl0[|����I[Q�n��^�V��V�F�в=p�ͺ��;y��x>�ڋ�qM`&��@Ǐx�������W%���,�S�,o���7''������&=X��e�w�5 r,ͱ|4����GslC��8�����4@�s_m�w     s��wA���D.x}�H ���`bpdn�|����J���#�ʁX��1ϯ��t��8���Xv��۹��B-*63GUN�t��s��+�������X��c-��k��~��D�7H7�w��Q�A3�Z���k��X�c�O����Xb�c�A�%9<�{�Ų����N�w�FU��5���:XR�cIA�%9��XR�cIA�%9��ı�&�56ql��R����J�}��_���p�8R�s]�8Ť���{�-�����3��V��m��8d�8w�Q/\g�q��>�X�cI,�%�8���X�{H,2r�צ�	��w����E��["c�g��"������8+�吷��ŵ��h	��,q��NTmU>L@?��~��H�����g���\k�$Nx���On^�1K@�#��F0� �ۇ]�>��Lہ@�_�n,�'��Z'Ȉ5��Zq[kb��&K�%����[�T�q�1:���7���yGB3ɍ������*Kj���M�.)�	��F�9��}I���K�Q1N�Z��o!$m��MZ:�\�n�ԋ���h�n��D��:��J�N�����23��Of�Mv�g�&.��[�.�K���-|�&X��ig�[�)�%���!Ls6Tr,�ű�$.�f��rU�a�
MC��ٽ�T���3�?��.��'�9i{����o�{y, ��X��y�{�$�,����䒂;)�>�%�h��^�*�w���������	��[����俫��w~�#�F-CamdK)q���,�ñ�&�%:8���ҭe���v��6�|��ݞ��')~����	,�±$
ǒ(K�p���c-L\fGk%�X+��㎵q,h��@�X����?�5E*�U'I*(�-��%�*��	P܂����\v�&xٯ�L��n�u�%x��d�9�[|��- ��(�XPޱ-��/��N�_Q�������b�A��P'c�څ��J��A���_O� RA�������c�|t'��#��S�\+)<=45�5�2�k��Њ�|%G��^Uqr#�ڳ�����Y\߳��gq}����V�	h�q�H��?�=���ˮ�]vl_�������
4�H�SM\����
�u4��k����^��v�~/ͽ"1L6��>v�x��Gy��oG��x(��^��=�31�E�����z!�^�>�H�<-��z�Ͷv�En�ޓs	Kyi^e��K�}�D� �j���j�6�V��,���.d��؃����=륇���o[��Oq)�����a�d�:P�r���^�}�nC�ԘwR�p�(ЦC�bM��^�.��uƷа���z���.�5@��h+�u���QY'A���܊/�n�'��٧�+.WÍ�%����^��ViǛ�,��]=Z��o�}�g)!�����e��P�*�['gA��*���1�u�@��c���� f[ߵ�W*�l����ԨI�C5)ݟ�m��~����1g�\�K����+	$E=?@��ѳVs�J{%�ßͳt���վ��}�+Zp1�m��B�(�-o[/�u_��[v��^~��8{kL�]ƚ���.I�=����3���َl[[�?|�>���;[(�v���.@��yǶD-���#������; 4+�e���ѹ.����|�ڍ�8cҞ���}�#[�15�RQ�,�ʳ�*�Ҫ<K��,�ʳ�*�Ҫ<ۻɳ��<K/�,�ȳ�"�m[�d1Ŭ1�-�2���Fۇ��RF��,qɳ�;�%y�}ǳ�Rx<ہǇKu��՘I
��&��}[��^����|������o�C��*�)rM+���x�� �؁e�ԁ%m>�Ftp{q�1�	h}o5��6�KJ�"�e��6���'�rQ��L�:ȅ�A������}]fmh|`�-k��;mY~�g�%��3�,�ól϶��Ǉg�����,K��-h<��,w�'���~�*S���띏�����x�Nd����W=��G��W����_�?S�lriF;tF�� ���
���#�>z%t�Vq#kk=�Pv���>�VcygSK��z���򟟻��[v(�?�5<K��,QóD�5<K��,QóD�5<K��,Qó��u�l��
<K(�l���|�,��Y͹gQ��j��M����fJ�/l[�֓.	�vߡ#:���_&�	+Z�R���b);V�X�:����"��.;�h�y��A��eܟSNqx��z!ԫa��`�a��v7	,nX�x0�e1�����x,�X�-�Z��j���,8X-v`a���4�MV4X�t`EӁ��g��@����� �w������j���Ԟ�g@cq������#G,�X!�8B`q�����)���o{뤾�����`��E�~�,���_���@�X�!�(C`Q����E�o�[QWv�OZryX�fQ�Ƞ��(A	���i٧��p��w�W�RM�#om���0��s?!�P0v�I�j��Z������	���X�u�Q��#yX�-M?t]�F6��dP��Wh|>���=�&�������*(j�N����vӁ�-�,J��{K��ʉ ^b��С��9(��5�<b��O`��J+�z�J���q��24#��R�����Xx&��L`���3��g��	,<Xx&��L`ᙐ̩����M@��L�8u�< ����:b�����>��&�,j4D��)Ȍ@����&� »��X~o���u��=P|K[�ui�I������`��`*�/+ܤT�ne1��B#�ZK9��#.#{c���^"^`���?�͆t7e�� ���U�����P�xu�4�'DX�'��O`��">�E|�����A�1���ɘ���P��nj:����(��S`q���NuT��]�`��k��Nc�u;� U���i�W(����p�ytԼUǀ7g�����x����,���='���}�Z{���K8��=(hA{n�y��X�.��]`���w���"��E���=����=�pb5J`D�� ���|ڶ�ld�����ߓ]�����&4��Ykx� Pk�g��x��ø�;�SP��["�[�zE�Q���ʛȽi��J(��6���=0S�XIћF:�\yvI�?��S:Ke�EF�EN�Ȃ��+#VF���5��#c&��i�o�D�c��͚ɱ�D���ͬ�m-�{j�����I�Yj=.5���#��F��uE��Kd�5�_�"6�U4ʻE�^��rD���,Y8�pd��"��E��_��c���r(=�h���&����}���A �,Y:�� ��e]R��A�݁Y������o�����,�Y�;��ȢґE�#�JG��,*�p9 f�Ez��qo9�X*^��2��~hΥ��>������B��5�V�^@�4=p+׸:����j�N�ond������[E\<���y�W�և�rO����MG�Y�8�+��,Y8>�p|d�������p������2�k��%ʶ/�O���@
ׁ�j�"�(G֟:�8odq��⼑U���K�)�䪘�H����Yz��!�����"��FW�,�Y\5��jdq��⪑�U#��FW�,�Y�[d-s#�O�,Y���"t�E�"��EV-Y�,��Yd���bg���"��EV-Y�*��UdQ�Ȫ�"�%EV-YL'�j�Ȣ-�E["��Dm�y��)�V]��ŉm��%�y��ւ��vgJ,X�'�
�Ģ-�Q%�H��*�PAb���B��
$*H��)�����[WOl]=����V�[�NlU;�U��V�[�N��)�ƫA���͍��m�ҭ�@����~������1;�Yl�`w���Xx�ҴfV���m��c�E1j�E37�5�d`���]�A�����$Kl%=����V�[IOl%=9��{'���R�a����V!������%��A���'�f�X%Yb��U�%�t�|k��v?��Q�g��^��x r�Ь��:X��^b�lɻWQ2$M��@������hd�N�M��{a�'�d��-�ҽL�R��5buM�K����d<    :�;��I%�h�����R�語P����5��yh�^����N��N�`T��جyK�]}�Q����'�~|=H,z���B�]o�=ؠ ��K�v��z�+J�XD
q4����Ǻ�E��6�[:��p{�|�?Z�؟��"�Ւ%�H���>�U�Mم��]`΍=M����4�* rbA�Ă�=Rl3�@���XZ�!�	��G�X�]j�t�V�1�)^k\�v0�?�	L�/�Kk#���_�o`�X('�t7U^~wF��� z:�D�N@��h��^˖Y@)��Rb��J��(��Ow�E�v��bb�@k5�[w����=�&�c�Ֆ��v���z�1�왫�x�{�yќ�+`��/��x��;߈犤M}���Ϸ��{�K,F�X�.�]ʶQ�p���fU ��o/2��w�Et����)�ቖ�ߝ����\lbU�7Wt�m��HO�b�ɔ{?�sCc�-��qQq�x\��k� n$|���ue}�A6��C�^.��+6���m;F���m]��<��^h���h�=��ꀕ�z?{�ؽ��Wz�b���l��&�M,f�X�6��mb1��b���l���,~�Y�4��if���⧙�O3��f?�,~��Ѧˇ,ښ��H����r��RC����p�&��lf��̂���q����.�.bAɲS�VV���"��+�WޜYP8��pfA�̂�3
g�,(�YP8��pfA�̂eVd�Y�2�ev��-���a 6�j �s����'h%x֫�W~kɶ3�f$�,H�Y�Qf���B���.3]f��,t�Y�MfA�̪_2�e�ˬ�%�@Zf�/��͢O����	���c׹?M�ޕ�eFO�vW�$��+���E�rh�C��g,�q:|���$qD��u��W�`F�,R�Y�,�:��b[���d}�,��Y�)���"A�E�2�eV��Y�Kf1���_2�Vd��,Z��9�]��`'��� ZK����_Z�ot�.f~֏���ݐ����,K��<��{�;P� f��,:�Y�Ofa���}2+��,��Y(!�PB��kU8�ry�KbY���B�900��)k?+:��50H�Al`��VUvx̋G����(��0l�Ad�����$Y�I����zMI�.v��ܼ�����16�������HW�N�]YIkof!<5�Vm ��d'9��ʹ|���'�2�����=��'+� f�V�*�=�D���N1������,n&�Ş�2d@\}��&���&*���Ӈ��Z%qkă4���G����j�Y&�8Lfq���0��a2��d��,SX��8Laq�ru�;]��:�kUWw�u��ۤ�ո!�v�¢�4�qWtr�����U��PiG��ja1��b@��4I_��n��J���|.ա/��~�f��30�i�&�u��{���N�/��͊\϶�����e��[���.��9��z*,�TX詰���B@���
*,TX��Pa!��B@ź�mk0��:�qh��i��3��~r��.��y�Y���@Sa���M��
4VWX���0Oq���m{�d���Vͼ�ғ�WkrR��"H�5cƨw�*@�!XO�J�孊]���Z:D�*��F�x��H�M�Y��`��cc�`;����m�������za�-�����~�����iV�iW�xux�ӕ��
���+,VW�����'4:T�3ځ�h_J 7y�Y������E�o3�7�n�h��4�$mn��|ܦ���I�^�>�n��"��d�zX�ӻ�m�u��W�6G@�{W �r��jV�QQJ? ��� -�`	�����WLlp�J�����ֺ�%��X,��Hd���¡��C�-,ZX8��ph��n�ĩ:X�v[u������l�U4�l���Ȗ�{yS�\'�P�1������C���B���~��-,�[X跰�oa�j��B�
-,Z��Y�N;2t��"��LC�E��9�C�����T�zQ���f-,�ZX���;6�w/��䣯���4�ZiHo4י;��ja���*,�XX7��b|���
�*�2��ʠ�"R�E�j�~sP����U���|P��G{t�(ᝃ�E�
��	+,VH$��/�j����"i ����H�N"*k���v�E"p��6a5����FG��.m�r�<%�4k5 pgM:�8G��8$v�j�֠�H�����	��veA�'�t�?>��CW�=t�Y3d����`/R~f���>��Ymu����2������.׶���I4¬�潘,�8���y��)pil�"�G{�Уm\�:�������)�N���\jE�c��f=���$�YO`��i��ծ��!Ӭ'�C��4�Nq�!��Yy�L�ٲ�*�|���Qn_�;p�N��d�r��sT�����ь�,ؾ�)��)ݎ{������Km-�l��
r0�&S��t��ڟK�;< �=8d�^��d����[�x>ٺS�m�|Pgq��O_(0d��Lb��v>��r=��~��;�t.fA�FZd��X�疁k������	�Lz���<�A��~�׉/��En1���1�IȻ���Y�h����qR4YO`�8	����t�����-w��}�CA�һݒО#[����7�b�_Mq��N7�} 3}m�ؤ�KaAR�YO`G�o.]�MXH{!�h\Ǐ���G��i�X�X/��%�ഞ���'��)Ь'����*e��^�4�3H6ǵi�]��L�cYF�2��h=��a,.�2Qv�[f�j�.~�&�~��t�;3��'���c�E���*0���?
9�؟�yZ��z��-� ��V��`��C��^�����O���d���ƽ�C�C�֧u�?F"0�!�B�	[�r���J��9bw	˫�e�)A��~c[� �m�j��z),�*�>`���]���c<��	S���N���"a�z���0u=�M�H����.'�b����iJ�'<vamG���\�u0-��������1�t+`b�!��E�*!W��?�9��~���/9A��{�l[�p�g\�et�w��ˢI� �c��x=��$@]O`�-	P��qK��v��܂�0��v��wɺ���d�ӧ]���0��H������˶>OT��:���h00OI��ˢ�%	���QJ���v�� w=�����6�(_�}*���H�5_\�wKG"��{�7h�wW�2_�l�7O�p���,�iX[	sָ#���Ƿ.�5��8�}1ϸ߆���,.�i���'�yΤe2נi��A�{� ��ځz/X���ʚG�PX7,�nH5m=����N�f���?��7v`�P����ao!\'7�ⵞ@.>uO��eQca��~�!���t(j��F�6����6,"mXDڰ��1�K�����h߱ ����4B��5j�c����aqq��������'��T����F�p�	d*dXĴ���w�f�rַ?�,�+:�c$E)Y%���!���v<�g��v�VP��>[�_�Cs�^���X������=C��#>����X�j@��T\�7�+^T�����pw(q|#��`�(��Q� ���Zq27�:d;��־ULJ��1j��a!^�B�Ƶ��I���h�H6je�����bL-h���`k^<
�`�Bˆ����'�Ӕ�d��5�o=��,<jXx԰�a�Q���;����4accu��$].�y`X��]ƼU[tN�;B�/����J�dѫ��T��|�0��B��f�ﾴ���܍#���+���hg�e�H+��6&M�5���p���%Fߵ�_�Dq�ð��\�������L��:!��ǁ�ݕD�
����y��҆�������R�$�[��Y�t9�6	`[ԫ[�ձg̈́EMM�����E�sٴ���u9���K�2���X�Ұ��a�K���.\�4,pi���Η�7�?�=�o\�1���ՂV=d�R�⥆�K��RzkMn��;�Կ�z�    �^�m܅��mu�������׿��f=3�9e���X�^]�/X�԰��aAS�}�Z�&̍�1��u�=#�\��w�N_P�{9�I���JBmO���9�\&2ج����]`��9H�l��O�>n$8�l�ޓZ�L�}ga�eC���	wr�N�w��w��4^HѰ�H4@sS^�U9�j3���P�(J�6TH3�6,�mX(ې��z;�Y�ٰ��aAgÂΆ����, lY��%=��	䛶,2iYdҲȤ%{=��7mY�в�Tˢu�A���.��Զ�ވNoĈ�v�1�2K�R7��f �? ���LӲ��I�)����Iŝ��~�C�˦�ݩ�7t�S�gY�Ӳ��e%���-5Zj�,�hY�ѲP�e�F�B���-I�y�	%>�3�k��]�cn<���?���A�z��&�k�t���^+k5����.��s���gu8
�E1-�bZV�iY|Ѻ{� ��Ըf9����O��
�Q��L��y�Х%�Q���ɢn�E�썺m�X)O�*��Zv��Y��}G�}�T�ϲo��6�B����M�Kl���Lͯ9C��!���A�ߋ"�,�gY�ϲh�e�>ˢ}��ɛ�n���Q���H:��_���ˁ���N�Rͅ����.����V�[N��Bw#�^� ʆ|��,�Y'N{p�3�O��X&����l��5��ݩ�}��k�:���Q@����/��'j��=`��X|p��!�����f-d���nCs�	PZ`~R��e�R��	����e�_/�i
7���D���+�TA��h��y;Y}�66�=܏�i`_�1�#�#�|}mS^*6|��{�D�����WW�뒓tv�v�`}�l�׉m�̦-�s�{?���S�oP{��:�1�Š-�A[��,mc�"�,��dq��g����(i��q[y��zGi�f-ِ����-�+s=�َ��ژ�pIIX��9x��9V�Ϲ���1=��+���-\��Ѐ�򅼻GM~�	�oN��x��O�ˢ�E�-��[V�kY�ڲ0�eaj��Ԗ��-+��,�kYL�������_�kg�E�E7�����HK �G�+��,kY�e1R�b�6�� �"�r��W��N�Y�2:��A#�aE�E5-�jZմ,�iYT��+(�jZմ,�iYTӱ��cQMǢ�n�+�Дt��"Z}Fc%]k�;���B��Q�����Àk�={�Ҷ�����N,+@ޓ^5G�P�ӍE���$��і}e%�u,���}w�,�^�ס��C���!d]��Q;t�����);Rv,��XHٱP�
@�# ���X6�D}����K"*��'7pX\~�lyu,��L+)���
{1y�eAih�O�1�y��)��;�u,��XT��a� �B�"�;λ�g�$F���,�(\�P�X�ر��c�c��ǎ��:�u,��X�ױ �cE��Eb��:�u,�X$ֱ���G,ڵ�>��Ω9������ʉ{:���GK
�*��:u,�XԱ�c�Ώz�bιJ���������#�O�{����PY���۝R��+q�j�2zn��i�]_�a���&?G��f�e: 9
� ��A�|(�u���%����R�*K]�C����p��,=,Ij���>m0���I�I�lςC�x�A�h3�QL�w`�cM}��t,��Xs]r�L�5��Ά����ux>�����+!���M1��ۮ�M������]M�9n_�<$�����K^��#���u���Y
x:��X(ϱP�c�<��I������28/fA\?'�e��ޥ:�Dmʳ��c�;o�\DrDS� �j���0 �E�_�Ř�R����^�YZs�1/��]�ywOu!!��sւ�9	t����� M����J#����5��`��϶�녳�X�b��������Q�N�oɗ9�R�1
u省i(gA�5v��5�F~J2�9I-ɐ����8�t,&�XLұ��c1I�b���$�3u,6�Xlбؠ�I�!���(]�4)xTAG�*AZԾR�o��N�al���۬���;n���nvE��r�l�Y+`W���ъ���P�� 潕�%>�'��,�Y:�t,f�Xұ�c!H�B��� ���ܥ���c��C6�Eͅ�	���X؈�X�<vzV��Y	�gQ?߽�vRtO�?t��@�������B\�0�"~�E��;*�-��M#������BvMY�!@�����CC4��j�y?��h�4���n��s�1�;c���f��ټ6���g�����ka��u�ԏ��	,"FWh/~��������)cz�m�u�,62���EM=��zV��͟���>�,�ޣ�����D%�Ѷ�{s0��5��W=���,��Y�ӳ�����<���6�'��-�b_GK[B/�4Nd��ɢ��E[=��zm�,��Y�ճh�w����B.G
@z��j1�ߥ&"X*�x=�zO�^��"�T��~ܡϺ���_գr�nɳ0�g���=�z��޾��C�E��z ��c^�mt�����և��{״ofu������=�^@�Tupi�bm�Z�zX�� ֳX���Z=��Գ�F���!=Cz��alqf�;��ĭZrc�5��9}�vj�Y�Q Y����x�������Z��E߻[��웣��#�����,:�Ytҳ?�D��5A��րT�t�?��9l�ى��X�g��>���[q���(��4>�B��X��Px<�ϗ��>�����%�����KV�_c���,T�Y�гP�g�B��=+�,$�YHγ��O�դ���n�&��aU��a�c�
�������Fi�<�$ ��y�w@&��>�$4�x�W�rς�>w���~�B����@�p�Y�zoN�-�k�\��p"�^3v�]L/Aȥ��>�1�m ��VV���ҳ�K�B��;z8�,p�Y�г��gŎ�E=�4zi���_�o�/�J�2z����IC�2xAC�_�iVUX�1\�et*��T/�aH�+�\7���KY<r���m`!�p�f�tw� v�W��hN{��ب���|h*�(;m@�GӾ-qb]��c��j�^t�G�eVf���3��X�R�$%uw�V�D�#���X�e`嗁����,��ݝA#^��o�
.��)�̻������.{���#���.j{����+��K�<�	Z��ܹ�,�*`���a��SvjK�8hMO��C�E�F�Q�
`�3��/�_��j3�8b`q��∁��#G,�X�f`A���z��J9ס�D�������2���;NB��sN%�,tX�.��]`���m��@�:k�y����*ӌ�����R�4X�h��N�E�����oR� ��BG��O` ;K�{������,�X�/�_�Ww�,�X�/�_`1��b|���,�XA^�f�X��]���
�3�6�G��G�|�6$g��k��+�1�e�Z��}y/��M�{�{���f1@k˓�X(-�^9����O�ُ�*L�8�?�uV�ߒ�X�]`���_��B�=�r�Iz�'��}7���a�
�,)UK�"�������|#5�Fۥ������&0��\���jفM��:ȹD5�,�X�/� _`��j��VsX�+����}�����Wo%���B{�QY0����,��)�K�
����I�a�zx�Oj�}�*�`0�KD���,�X�+��W(��k����x��շ�	�n��d$8�:�(�Y,�X�-���Fh��{ۈH<����K;��79Y�1��Y�/�xkM����lv����=��"08�?���'�`,�X)cdq���~���"+0�,6Yl.^q���z+�6h������m�ҏ(�`S`�|��"���:��~s�����AF�%A���g�*P%��cBD֕4���q�Q,���X��N�Lq�����8<}�Zf�D6��\d��r�f�Jc�5J��6��%�6P4]���H��Fs�@�<i>:q��X-��G��@�0D��2��fՄ�#��4|���"�    �E��m����D��p�a��\�t�Px˝@)!^�#��E�,�� `ȚN�T#e�[Ia�I�'k���lu�*Ndq���z���"��E���4�앾x:U=��a�8����"t~���,�Y1����E�"��E���9Эsl�4��D�<q�ܮs��훲��ad���t?O -�B�Md�XL��'��~�]�,K�ޡ��⃑U�E��,2Yd.���`��u4�=Hl-�8ч���GL9@3�,Y40��^d��Ȃ{1�f|2�ā9̈́���������/��'a�[OP�>F4�,hY�0��adur���"�E΋��-��[�1�t��3�'N3:�DY�S`C�W2�;k����ܤ��[�{�JJ�cץ9%�ީu,�`�=��yh瀍���.�x_d��
�b�� aʺ��?�Ia>�ȳnĽ�9W����g]�Y�-�h[dѶȢm�E�"��Em�,�Y�-�h[d.#{EV�Y@*��T�M����G�v]Xl4]�G��7!�h�|n.XAX,�~����?RPX@��e���W3˵���?���"��EV�KP�J��\���޵WJ�v.e4�7.|�zv� TdA�ȂP���e���C�x<�-�_��{�����!��V�m����O��C �خ�~`Hvo���9!��%V�X�+�f��*����S[H���O�o?�%h��R�����Y�����_���%�J,
�X*��������$�I,N�X�&�8MzpmX�2�4K.�+ѣ,={+_"��\	�)��$V�X&فkk��	���0P��[�oД�O,��l�MdBNR	8iu4�,���G�;6�ｫq�-�
BdݓI�����q,.�\/�zM�R�wp�KV'�I��-�g%{M, �X *�²�������9��Q ��V�Lc����H)�y�[r/���jy�ׇN֤ޣ��+�=�zXF��_`�������`Ţ^�E��z%V˖X,*�XTb{&4J,h��0������!��66�} �w����|��e'!wB�:�Xh*��T�͟y����?��}���0�p{�<���Ï<�>�[��#]�r��>]5�AcY��K�s��Ƃ`���%5K,j�X�,��&��&>�ש�6Ȁ�S�]6�h�]��z��4;��\��X��@O^�]�\��_z�/���
�H,t�X�.��]���L�lT�5��'S!��*9��پ���D�0q���������ɒ]Օn�;�Z�Wbo�}��6�kG�[�֩��L'!"B!�z�-�A�զD0�&����LBP6�P6�P6�P6�rnj9�v,qk@y�d�C-��n��.������)sM7���=v\.��E>�wMg��|�ϗe֊"4�$]F�
�WYu��l�,����Kj����:e45�f����n}�)�{��f�(�>��tBC!��
Ӳ
�FQ��i�R#�	��Q��R?�PNv<��@�h[&������	���-��B��+��ҳF�z�M���ꑅ}��i��4V�ݾ5�����}\���'E�r[���]����Bj�`��0RW7��|q�G Ճ{x���u�i=�R��i�c��%ԓ�P�P�P�P������ƱSJl��>�hg]ԇ���/i�Ҩ) s_�Auq��������9ێ�~�^������l��a��?Y���۷�R��^u�Ş�|���K��6����̹�%TG7�ĵ�_L������o��Ғ�ﲌ�^ơf�vK����t����!������t��
U/7�L#��H�Z�P�� �K�>/�k(�vO|�,]�[؋�9��7��昸�<z?�JS
8��օ�<�;��PO�%=�i�|77<N��c��[�E_϶�s�Ѩ˿֛�%�z�3�?YL���8��0ƍ�_�>�b�c����;,�����O�t��V0���F�i��Nx6�G��E��-��~��{ĶD��E]�sa�g��^��9�̮��ld�3P��-���c�[�W�:._8�G=w�Ot��0Hb�癣�K���.=S���ӥ\�5B]r��X�����^����w|-'T"C�3/�%�tG<������1�-��#��h�$١�r*z�Ei�j:w&$u�⢴�p��B�65�S~�����klE����{�)��	+���H/�����[��Uq���wٸv�����B���Ll�3�����T�f�G�|��_����X��$F��ʲ���s� -��۳,ad˗�0���,`����&���Cb�j��^�u珮���܇F-kL��$FuI���%��pX ���L���Y׼hgA�e���z�2*LbT��ίm&5|�>C�z��5���!��C,��� �9��+I��Q�\3�����ґz���B��~��CW���mKz]44��a�*6�J�!e�}K^���<#t=����e��t��?���qF�싗e���+ϥ����hV�E}Ea��8lW�qM,��d�4���/��;�#�g�nyz��Vi���ʍ��u(`T�ƨB�}Z��M<���v^0�kB��>�0j;��
�Q�oFe`��0��bT�Ũ:�Ѣ}R	͵g�簺zH�/��Pw�u���y�)F5R�j��H1���xw-��G���C��II��{���V^�h��ϟ�+��,���[.*uKQ ��T��g&��3��K���Tƨ� �J-F�Z��{3Z�Ϩ���8b����D+����d�L��ϳ��OUM񣚢}�JW�<C]}���7��E���]H�����j-F��"`T�Ĩ��QA�^�z0��aT�è��Q��^��'�Z0j�ͨ,��5|Y�&͗�ՐY��a<f�"�Y�{���Ժ�� ��,�Y0��`z�K�H�����Ҋ�D�}t��%�Y�u���<��Pa�l�+)�E{u�y�!j�
S>l�-�ܫv�C4-�<����fMg�5$`Ԑ�QCfg:W�k!X�uP��;��1s]�w).H���"b��
��EH{����
�w<%U�CQ�g�Y����h�	�c��,���O;7�r�!�0��V	�G�;e��(�=�0\,��e�]@w���JA�p�Q1�3�^@[�&���Nи�2�+1�$g�~�&Lw�'���gk�7�
�5Ĥ��V%у�b���Y��Q�1���FQ�
.]�j��4baz�eŇ}�r\�; ����ZT0ʉ3��(Qͨ��&�r��lK�⏄�x/e���y`�m�籶&�J�����>QGh
j*QP��<m�Wo�O�A��9��������r@�O��-����u��)�;��(w�C$�\��|	&
���-;�����H���i!���ј�FL+�/{A�߂ҿ��((a[\l��eTE�6�d�O>XPl���Z�5 �mq�^c"�i���"��!T�̋e�y�S���Z�w�Ú!�����ivWf��s�)����ܖ
��Q����F��t�#ak?���3{��'����%IJ��$}{m�$��^�y��E�zO�͓`9�ZK`�@*:ł2�eLʘ�1-(cZB��D�6����v&�����"��d�E���e�˖��x��k]���Y�&��-o�Zr��W�����LLP���^�I1;'VU�kOsb~��@[��;��CS��ʩ+�6<v����(���"���j�(�v)
UUBi��R�����J�,;)
���[����ʜx뺉�w[4�G�m���������ou�Yl7�Za�pq�r,����:�@�Ξu�u��D{��.�^mn'�a5�Y�!�=|͊�[&CrN������a����n�c����x��)�Ø2����� �g���P����k�6޲���'6:�Xt�,�Y�o(_���K��7��N��ʒ��*r?
�oy��ĕ�GST�PP���Zg�w���8�̻�zW�������Eg*:�z���҂��*��w��Ԏ��z����Og���X�T�Pҩ��k�/#æM�x�:J|���J��*%J���(^K�0i��[������5���`_�	=���X�`n�k��g��K���O:��.dR�I����/�棠���;�z�)��    ^Zi���ð��\����5f֚ǱCY��n��j�g�L�X�Qj��\%����:���X
�c)ԝ*cI���J�:g��:��0������(�O��l���7�%�_.ͧ��ΐ=?
]���*����B�?V�#��ͼE����ZxEfc�Q����l��շ0��S_�N�jj�^iJ��LS�]P_��<��,��G��b�}ػu0Y�n��������
��RP]N��KeP�:$�;����l8�1p�jf�p~�Q�O��>��g������E�}��U/�KU���I�v�����H"��ܚ�:otpi����yB�Q�a���(nt����fN�w��<�&s�9�Ù��TW�~��e��G�W=������M*4*�Me
�y*�)��]�\L�[I�.��l�#T��>+ꫥ�Q���U�����&�8������]�׮}:wT�SPINA%9��T�SPIN%9mݣ`9i�@�L�@�L���A�Nس֭p�%&9�zp���,7MUZ�O�p����(�/´v\��z�P��.������IM(g����c�:)�����������������0U/@g�kg�@��{��� ��iƦ~Y���h�0<�L�@o�z:�@iH��/�t���z:�||�\t�[Y;��#�5�Eک�'�pV!����d��+؅�@�����ӒSO��k�n�XQ�O�"yO^���x�^�N^?�-��:�a�����8�c�,#p�i���7��K�w��`h�,C#��'/=��W��������q��c�f��[�3!��K��:g���m���7����4��a����1�B�Y�m?Q�ӷc��l�~e��v��2
S�0��F��E+��DP*T/H�J^����X.?͎e�`r-Fe�/�J�כA#��P/@�Uй!\�sC� �VAqG� �9��ܺ��)�&��i��eJs`��>�^��Y��f�Q�N��{=�v�e��FR���WG�ՁAW��P/hjhR ��`ٺ&����\_IFA|��-�mȴ�8h����+�;8�\e0��:������:)�9^���S��^�YdiF��D��B� �	��q t�h����� � Z?�N��/[RA����z��#Ɣ��F��RK-A]E� �a�E� �a��^�ΰGu+e���3N����׽��1Po��x���g|�yk~�Kף�Q/@�w�uǔƓI
��xb�nl5�̻n�tк�(:��B֤XcyJ��4��jI<�w?O���2;h�Q/@h�Q/@(+��SljR/�A+�}�ip1��0zԚ����8��L���$�[�z�˴�>���'��'WM�5�"$�o��k�Qt��-%���M �c �j�f��t��Uj6^���Π뷣�dy������`��i�U����e���s0���������־��;���n�Ss���ǩ�M���t\�Ҩ��z��\�DV�v�����9�����ܺc�P���SM��J�[�d������z�8A��^0�E�c�{'�R�b�(���cNK�^lȫ��\��u���<���z��]���Z��Wْ��:�c��k��J�M#��?��C{��S�w�����(��:��w(��.pE9�zw��J����jen#�4Q��(��&dލ��ҳve6���{���J��c���3W�z��kb�����csH�C��������;wK�mHT�)��Vh���I��@#g]����=�+	��J�;��w~�j�k@�A�]�,�<�+=k������QQ�{D�����_f������ҦX<����f�%�N��ȏ��ηz�mfD��l�Q���ɏ��C��i>簟hIQ/@�I�{N(��"�K��[��9������>N8.|h�^s��
�G��(Z�z�r�w��fB���:k�%u�@�:˔���u¤kGyt���.����u��AQ!�_ESI-�uǖ����rhN�I�8_�T6�{3v1VZ��{�J��ep([�{k�����	������A3҅��<�f�SΩ1s�&�EtE�x����5�&%�<�<����]P�'���%��{Q��w�*v����ݣ+��?�<T:w��G����w.�Cq7���ۨp���_�Jb�N�!�ҝ�M��%�ʩ%���k�޺�G�-/\�X��Po����2k�FD��a��a�j놠T	vC�h�'��U	8T%�P��K��U���kq^�f>K���G��
��%�.	�u��!�Xvq��
�0��g҃�*FpiQ���b6#��1:M,����L��mf��an�v9���S<��$]�t\��/}%��Ζ�Z��G��V��k�q��ᛳ\��H���<g���'Ͳ�
��g�?��8i���U�&i� OT��r/�Ӛk����h8vD^H�g�+��ѻ\y�cOP!D凅g���vs��Ptٳy��UV��S�J������P��J�GQ/xr�w��j�0T(J�ҽ�"�z�^�ϱ˻��kZ�^��;�uF�o��d�"�d�(���dӝ��m��8�F�lYA�.���$�ɍѰt�av�����g��:G�՞�e���3ٞ%�`�)I?��ڡ�͝����δ��XY�~�8(�w�J�Q48����>���2} :������[�<c�O�4�m����8v�0�V����,3��C�����5����:@�=�GU��)�d��4�wz{���<^��B�*r������˸�㌨I������^&/�|��ߗ�y���/���A.�0�L��w�nm�����G%L5*��ʟk��̹��W�%�{B��o�eA�^U�P=��]3��צּ�u�e��x���Y����䵮V�Q��S�\>���W���"��SNMvƈ�K_��nKk
=�}��w�!>�>�c��l�,�Fʡ)W��͵X�ͥwv�����uۥ�q�G�X�.O�����e���$�$5�r�"o�R��?uK|�_��\�"/�z��NqS�_�d<�3�m�~�Uu}%}M��%���4�#(Z�EX*�.��@2<*��ˣB,���f�ۜ��[�Z�YM4~-8�C �>r0O�̣�(��cΗ #�е��^�]0hp��#�y�mţj+������vO�򱷲�E��{�Rށǥ��5���}dj�uwY'�v�nC���vlZsZ//�n����(mI���~?�C�-}�GudՑy7�)ZiOR���SviO��NgJ��tp�4�ʸ��I��Q��N%�W���f�����G�q�w_�>��ɰ�_����ʾ}�=�H�=j��Q}��qpz�eJ:����ҵ������e��t'�n\L�������Ε�n���0��{ث�^��(E[F؍(��c	و��c��-��>O���[�Bړe9�fnH;�O�"��E#���σM����	}v|�&|�̬�վ�CY)����JQ��GUn>�����˥��lf�P�]�iw���ܿ�����,��윽��<�z�L1�8Eb5�z��\x��2ϣ.4>�u�(��^��f��7�h��n;���j9����Guoս����ۧ1LƔ���L��,KP���DV����xT���>���:��˜-�ȶ1��I�O���48�$E��t�_ �hz�M���|hG`L}�g�%�'���P��M������#D����.�=�ҿ9wow�.�G�;�0o8�,��dɢ��X��>�|gxg��Ip+ROH���.֓�L�+��<S�_qc.fU�h� ��O�Nd6��qF��F>jʁ>9R&���qo��i$����G�$��u6c����2x�k��hX�4����I���
=��K�0�ѝw_�<ð2�>^Z�q�+W��F��
Y�������X����ǑG=�<��̣j0���<���Q��GuZ5��ʣ&<5����ۑ� �`�S��L�GH�,���t�n[m�
�D���uj�ӗrP
�;��A�_�3=݃���!����H�N�}+VYV/��+q+�]�l���M%�ŉ4�I�j��{O]\�}S�1ho~��2�|M��ȷ���z�S��jq�T    |�r��_�\��g0�X�|�������w�<R��N�`yT��y�,-��#�������͔F��[T;�p+c�&I����ai��rj���+��Wگ�h�c��-��/���^�n���b�RF{h�]G� ;���o+wE�P��f�9HKTk�.v����
J��=���y�0�k��a�5�6���uT}(n��"�n�.I�\�D�0G�{�޻V2��1�AT���!��Jy����')�����v�z��:e�mυHQ��3��g(�9��|��Ĩ���K���+7���RVi��y�"��n���ä1�k̖�W�|���e���5n-������X�E�����֋s:�}�rۭ�8�=ZV'AJ'������R8�)M⸜���?����Jer6�oN�%�t�u���}�Hq/L���Y	�t���ȪR�X_���q#�?k��2r����]­'���
�* ��W@E^�6� ��9&�_�;��\��l6?�L�� �J�j�P#��6�
�:*�ꨀ�l�e+����z_?:Z�s�H@���˳�)W�P鐥=�R(�^�a��e/����Q�(�	4M�k�Ү������
�W�〢���U:S��;�%K�I�E�u�b'����*v��	����&���x�D��YG�g���tM��f9��3��9���5��<KQ��d�X,u߲��,{��Е��lB�/��忣��xiי�vq�dg����0����Ze�u͢S&L�`�����g(@�<�G̣[E�,�@Ȯ@<�4������,v3�"��6�jRװ�tN�&�L�k��y0��	=�,0M���􌷮N*8B����>sN�`��2�G+��}T�"߅m���W+���aR�V>�܂��w~�0!v�6(���[B>����Uƃ>$+�[.����Zx�P5F�'����ļ]�m�M,B�p+w6ld�ǇmlZX?[����5e�;���rT	%T��ɰrR����𥳐^s^/gW	�=������$�P'ˁ����R���Y�ue�f_��Pk��J�B���E�����ϱޥ�?a�z�WOQ�2K�[ϡ@K"B�ot�ײ��S�����^	!͐c���"i�5�9�
�N(�:���B��:�%}���5�C�zrgo�ֶ�L(tm�яGQ��5Ƭ��Ki�1����H/�x�T	%��5�˂��X���10Ѯ�����֊
F�k�gvbU"�E���:�%�D[�����ΏF�vl���ܺ���!��I�eY�v�V�h˷�I�H*�m�j�P���wߞ��N�1@�ިE��v�6=��j�^:O�0(��Lm�PyL@�1���ҁX+D1Y���!T����1G�d���bj�Z>��i��U���;m7��_A�BA7��%�N;U��Y@�oB��ϼ� #kZ�]�J���aD� ?��M��H��\UD�&{0M��s?�
-?��xW�M��Q��w6gsj��c�F�?XD�������:�YF�o����f���/�#:�]��[��#�#��� �f1e���
��� �U��)��8�Q�g{������ �����
"�+��� ���8�wy��d1.If���1.�'r����!�$�D��VD��2��Ɉ���G���X�i�Y��2��KQ�?��D��:n���%���B�e�>~�(c��}?'k?Gu�h�����1����d���=襄��}�������$%�~1�3%�#J�G�	#�$vDI숺RDԕ"�pD�
E�"�}�)�U~U�N-i�5�,��&-M��y�	�F���(Mц>1q�R�� �õ�R8DU�ѭ�66OZh�
-|��eL�<F�Ĉr�1��-��(AQ�,�YD	���G���h!}D飈�G��>����6"JmD�ڈ(�Qj#��FD���R�K�(�Q�!��CD釈��΍(aтڈ��#
�G��(pQ�>��}D(#
�'DO(��P=� zB��
_'�N(|��r����	��
#'FNhaXB܄�	p
�&�M(���°�ª	�U
�&VM(��PX5��jB��
h&�L(���b��B�	�
%&JLh�OB��z	�
�%�K(��P@/��^B��z	�
�%�K��jB���Bm	��*�O(�P�+��WB!��B^	��'#K(F�P�,e鷕�?�zw� ��B��ʇ������-M��z��:����t�f��>>����]�J����{�=�m��rMK��?���e�|�����&�u�Vg�Ͱ�_���p������kT�i���q��Ǘz�T��C&���_���-:�E��]&[e���vY ��쥯����⸉���I0jNT5�_a��$*��[��B�ۚ��֮��{�U�ie�qo�SM��ZqM����9���Պ�l�?�n`I{�h�E����	��
O'�N(<�Px:��tB����	��
O'�N(<�Px:��tB����	��
O'�N(<�Px:��tB������3
Og��(<�Qx:��tF������3
Og��(<�Qx:��tF������3
Og��(<�Qx:��tF������3
Og��(<�Qx:��tF������3
Og��(<�Qx:��tF������3
Og��(<�Qx:��tF������3
Og��(<�Qx:��tF������3
Og��(<�Qx:��tF������3*�̨�3�0oF%��pfTQ�/�Όbd��2��e#�(F�Q�,�YF1��bd��2��e#�(F�Q�,�YF1��bd��2��e#�(F�Q�,�YF1��bd��2����������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������������1��1��1��1��1��1��1��1����K|r$� oex�1�0�����e�[��K�� {�^#м�Zs�U��-�ze�k1��aCo�.׻ބ��-�H��k������;�ߌb~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�b~�`~�')52�]�YԻi�R�#�ҭh|���f����r�vg(��1�`�=�zQ�f�{��_9	s6j-2��V�u��|luA�ӛ,����U2������~(L�[??-�/dQTԪ��7���N�N�N�Ny��4�c�K�����5��V�q�3}�Z� ����"��"��"��"��"��"��"��"��"��"��"��"��"��"��"��Zoެ6 na��՘E�c{7�z�5,O;�V��֩�ʳ��n4��_�k��n�z۔ԌyW;���^����ԝ�����������������9?s�RgF�����~ݏ�;��:a����UY���֝��w^��/?E���֔��LƘ)�ս�Z�5��I��r�{��)�u�,�v�h���lC�qF�qF�qί�˭?|����	�
�}ں-�2V���V\���銝�k�P���
��/�vR�j��*�&�zv+��V¼�a��)�<���VEy}{���ۻ���=��巕/-�hͦ��B�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F�F����!Zޑ�/ݩ��o�ڃ�>3��+`���?�w��cf�S�W(����,����n��((�QPv���FAٍrM�'r������g稞X�u<��(�"�{_�+��~o��d3��١s�
J �   9�r((�PPʡ��CA)��R�
J9�r((�PPʡ��CA)��R�
J9�r((�PPʡ��CA)��ʌ*3.(T^P���PyA��ʌ
b�.�FV~�ʲ�0���):nYH���˽�����ㄹ��P��캷��xA�����kB����$���7ڸ�P�-<�f킆���t�ˏ/���:ы��������?�T'p      �   U  x�]��n�@���Spl���"�G��RAQhM/HIw����!�cCB2����,��F�y�4�[��w�9|�g��$�@�����e楄�B��[����Y��p�6⌄K�m�u��Y�MN�I@f7p,�W݅ �Q��rb�B����0Q
�m& �d�Ķ�My�K��ʕ��bf@��*Ϋ�Z�����VN�,�\�V�iS���=I�e+�,G���0������VP�/�����8Z)�"�d�*bsD�����i~��B�"�j�Ȝ���g-1]~ƺ?U��5�|ғ��m��F�,��H�r� ��C�>���P�b��y�?���=�<��gM�� �ɭ�      �   �   x�-�A�0����MW�a���S�GBj�P#Se#��
q���d��1A�3U(U�u�s��d
ncx9yx�s�#H(a;C�kD�����L?��L�ĉ�0����D���L>n����;�.��i�h�dG?�j]+�9 ����/�0M      �   O  x�u�Ir� E��0���]����&�a�ķ��L�����e �郋��cI3(ajń)��E�7rMT'�nA͘`/,��ie�0�D�5;?���j,˗u�u�P"�p�⌶P�kP1Aʍ,]L�ǹR	�}�̽���#�\�ү�h�]c�5e�V�7�w�a#,,�����~y�x��-����N����mn�L5Y%[��df�W�E�Z���;[�N����g��
}��7l >?T��G;�:6���!�̳L�"\(�u�	?+����N�Qre-������uaZ��&��	�k���)�n��7���9�/�:i��o ��~W      �   e  x����n�0�3O�(�'$�,+E����\�����6�J��A����>6L�B=�m� @W��P�2�����
�*��6����H�8��+��
��<o�z8=Ǥ�Z�0��I%��8�@	�C���@Ri�	 7��8$4� 2R�� ��[U�gE�4T*���!�l�lp��P5�a.��n�cHȉa�`���|(���.���oM���Xpa�/ck5���W�%��:����0�!t�]U�}�)\�?\�;?uȒkY�K.���K�|Q�bH���.�/SAM;|㐆�-�1ԞQ�~����X��fB��R m���nsx��E۾�h���6H������懦�]�t�
}����ޘ�7�9t�>���J�6���яP��5�̊BXP��۟ax�y�và[�(��k>>w;y�3�UUS�A�����}yL�#5ł������<�2���΅������J��a��Tf$����~lۦ�D"�`iN/���G�f`�u�QpȌ4�� ��l���s"��
Ȓ!��U�$���y2�Q�Ř�yY�}pJ�U��>��^�K��_Q�����"�:����+�\.� �A�      �   l  x���n�@���)|���IM�R�Ԩ��qY@���}�B}�^&3�����}]� �S{����~G��-;x����Yﭠ}���/:����UU
��`��Vߛ���*Wf��YG~~?�M��^�]D����̳�Wi�"�m��S�"^�dRg���?��v8�^'�:��?_:P���JV�p����x��_ߛ�S8H��y��W|��t��c_"�W��*5��2�r���R�	��]�� ����0Y w��ܱm�#�`�NO%s�v}Ƨ��{��O-��v;��Ӊu���Į�=��y�4�qS�'�t���V��v#;l�=CtA؂�S�Q�sn��-5�            x������ � �      �      x�3�4�4����� �\      �   �   x�E��
�0��٧�(���-P
���v]�b��d������i�o>�����g�T���*EL����ZHV�h��k�p�d��>���]#)M�_�����R,K_��.�'�q]2������uLJ3�b1�o1����/�:O      �      x���˖�H��=F?G���Z�+���)��I-�R�ABAt�@$@(�|�߶�;�7	P���͈oG(��_�̋���ms�w�O��Tѿ?Ew�<*�����w]�/9��_�x��ыCu_����Q���<J�Op|x�ÿEy�9�F/�柮������c��������<��:4_��m�����Oݡ�]��>km[oO�v<E?}ֿ+5��~��s���ϯB��~n�S�lO���J~�x�����w�E��lvU���nG��]� ?��I�F���������]�?��,z{84m��[�/d����v�Tr�޾#PDo�g9j~�;��~3��Ot��~��Ӹ}<G��E�&���A���_�Br�Q5m�A�,��p>T�.��g��!�Pm��P�NC����4������x��$"��Н��w�_�䂆�zj�?>�?X(��^�{��u�Gמ����ꤌ����^��^яl�|��C~�']�wr�y��:>�F��wo�w�Ɗ���>G�~%�(����l����kSeu�c��/��L�t�i����;�*���1�-��z�	{�s�6�"z�o����������A�<�ʾ�-���2z��]��H�&�P��p>|��-�@�ev}��ԭ>�}���Y}�w�z�vЫ��[��$�ԍ���Do/K-�o���,�>׸T���>���}�k��������}��ѿ�:��џu�k$��nY���W��O�Rg��K%�@�p�������]��N��G���hG_�a۵C#?I�~�D_��Q~k��/������j8ɥ�?�?�������=˿��In�^���E�u�J~;n}���/�+��B���4�nF�%��~��cݟCל�8���Hq��jg$o��o�3�q������ 8�ȧbM��ћn��9�R~`����P� ���n��z�����s��祳��������$��wu���n I����m�,����Un1�z/�ѯ��Q��ԳS��d��>��S�;�2z1���l ��дz>����oCs�vߝ	PL_"��FT�G�[�	P}�mu躡
�@����g�1��\8ծ���@P�=���մ�����ggTF�N��U�{'����(7+�^��ps}�dwx�{'��\y��i�ø������	pj�ۓ9G�$Y�Ӿ:��e� ��c���d��\��3�.ء�{�3LN���M��y5m 6"������;��5�Xx�"Fǯގ�Ɇ4�wX��#�`�<�?z6Mx<Ctߍ�dC�G/��A�MkBV��á�>N6����A~�ə�������4��M���拏3ـJ��eu�=˓�ِ���7|Üi���Q��	y*�X�G��U�궧�y�!ͥ[�J_ʙ��������5K��uu�~c=ِ�ѫ�tx�΄l��;���''�ґ��^�V�'�8�_����%8X�&<.W�|�G��8R9;򭔧ԳwB���7{��^�(�W�c'�MkB��~�k9�΄���e��؝������]�Q"J��ʳ�4�q�v�s���=�䇪��@V/z�����$��7r�BB���|��؜��nڐdѧ���:���QJ����l�`�s�+z�z-��{��~��O����맮�ur�^����|e����<:��=�J��9����qB?Tm�Q-��Q�)��4�	��#�OH���<���a�y�/B��M��z�Vһ��x���z���$��a�����P�P��/Cm���3yp&d���1~�gS膚"�>���JO�i�=���1��	Y�:�u5:�F�U���ׁZ���'�>V���T��9s$��8������4�P)�H��w}�P^���C������Ra�����S坐�rϐA�6��"�K~�S�L6��?�d�����	�PSJGF~�6�q�ֻ}��v&`ŝ���dC��Q[lt�V��	�\�O�v_;��N'�h睐˓���Z��x!7�
��5!���C]{'�%w:Ks7τl���n�C;ـ��fF?T��nք,�f<�	Y}���4x'���P/��c����QN##��	�Z��]+kBV^����yZb��JЙ�ɝ�À��!���9I?o���&
�ui�_�gKc�@��1cp��>m��ɶ!Y�.Ò�[�q�1!�Da �Mp\�#_�n׏_�z'�2v�ϩ�mHyP������*䙾��'ۆ$���ӆD��u�o�΄L�j��x��蝐�t��5!�!���f�P���M<��溛ɆT�L�<��z�!��:T\����;<�&<.���^��$�P�3��	��������b��57���^�(1��C˚�m�i�|r.#~��I�Pύ�������{�6��N.��5��s��L���Q^@�U}�ɷ�ِ��cQӆ}�jw�ϓ����_k�`,��0ք,�^{�2kB���W;j�^�H��ڶ!ɢ��Tr=�6$2����L\O�0�6$���n��L��!-�'���z&�S�����I?d��ыPGod�(oǚ�%r����c�5pC��{���p·�{�"���xxl��;!�>l-?ۆ���l}9X���Ϧ	�o��������kBG�T�~�i��L{�mHR���|D�W�\�&�ܻ�m_q��n��]�����CUr�a�����˗�V���_���Q�F自R���o��W�r�LF`ux�Bz�8�sS?t�*�H{C��/T$��r[hN]膚�=mh�����\\��<� ��&d����V�7��^�����Q�L���J��1!�����܍�	���?ur1v΄,��-���	��?"72d��5r�Ɠ��>�;�cX[�cUۚ��r*X@�&dE�'VW�]:�u�Ww�L�\�}e���F>�j+�5C�_޶i��q�Y�a��<ِ&ѫ��g�h�P���|1e�lH3H�0Q��x���gBV�ozB�˚���G�zgBVbJU�]���h �r�z/P�w��*gB#@'����9�ք,�~9�mkېd���t���;!ϣ�ǧ�od�:9!/�!v�L_���	����rf���c���;C��%�t�R��i��\`�nkې$�����x/T���|��wBn�Zۆk|;�L�	Y!��a�3k����P�1�0H�Ϛ��:�e���&�M��m=I���G�o�3!�e��K_Դ�B�o����r�q^�~�N΄,��ˉ�l��r1+`��`���	�	����L��BE��9ՇɆTF�5��z�����Ɏĳ�����ϭ�#'pCV@��A��!��$ϣ/�ag��x��@��Ty'䶷0V�wB>w���ɛ&8����;M��csr&d��w����;!O���"ք,����qy�7�G��Y2<�F��������܎m�Rz2�
�C��Ln��(x)Or�Tn�I5��^�քc��K�Ά����h����&�;~��kB��7��X57��X%5k�ֆT�t��8�6$k}����lHK��u���	�Fo�㡖��{�"�hq[�&<ˈm<�0��6��"zF�wB��b]�ҭ��G�CU������)V���|E+�\Ǐ��:�5�Чʶ!)1�*�	gB�;9B�L�/�:�"�u:*#Ʊ+:9!��b��19!�s5�lZ�\GW;ۆ��~F��<��#��nu����or6��?TC7ـJ���Y��&dq��z��gڐ$�w�:x�6�҃�V'd''䙍��V��g��h-��&;̮;�"��t�lH��;��҆n�)1��ݛS��f����N�MN���(�s�1"�v�s��^�0A�?ɈJNp�:M)�b��5!�4��4����7�ȓ��G~�촺� ��e�?�e�������^n��K���39�@���C::C0^
D�i2]�S� �.E�J�k��2֜,�|9J�����x/�K"���Φ! W]-�Q�� 2Deޅ}� ,��N�w��<'��J���wH��O!����V�x���奢1]Fp��k9�8�Q�,�2��:�eZKxN�{�I?�su��3�sQ����tzB�D�R�    �|료��:9$���T5��9$ȱ����!A��Z''�k��1eeZB%���h�� ޻���{SۖӫOݩ�,aM�K5Y����idx���ۦ�	򹅆P ���cLKh�Ԝ�qp�`9 ]��L!;b���2�Vl,�X �)19$H"���W����z�U�ǋ�-�A(($z�X�s�p��t�<��C��r0)p�^p�p{�Ind!��Φ5�ETzABL���0���˚�=�C������z>���������!�K��=t�$E���nP?Y��[�u��W�}�K�i�/H��>�n��!�q�/�e�!K���4��r4!��C�4z/o����:t'Q,�l��G�56'��9K��Q�8D�菱�,�5K9*��<��C��e�C e\�~��Ah�x)��<2�²�� �>�G
?M���r`�1���b."`=��(��ـ�J?q �
d$p����z<�	�,LC �[W�(C��΢��דi��g h˴���cu/�0�´`��RKwC@�� Xa�,�^�F��\�>��$X��˸���Y�Y��x|�썳����ݍ_e����m۴�n�{��t�j?w{�Q�o�J o���K�Im��ׇ.���0��mm[BH
��jA���������|������wiZB���r�����6M�W���{|��%�ä	��>��kZBi���שg	gї}]�jt�p�a?!*���z�$�\�G�:���F�6z��^ ���ԟ��%�s�#
��	#�JzO}�$J���v���d��n���=�C��o5V����N��i�^�W@PF��*��l�]?�kWX'H�Q��d	cQ��lKH��}wr��|�y�wH ���$O#\��!A�4d,0��i6�^�� CRF��	98CP�Z��.�����?w��~p�`|+���Q$�l
@6�
�� �#��d2.�%�6]x�bho���6g	o���w�t�W�T��
��
<���G5����R�`�<����껴���C�KG���X��7��R& ��K��������ݣiĘ,ޝmK�f�2��]S��%�E/��n?Y�y��doÓC��m��@�ҏ����L�HB��iC�cD.�gg�jjwx�9K8���
�.�@��'���2� ����>j�sHP`&�=��@�`���o���,<�`Ĵ�66�l?�KO��o�i	�l1ؖ�'��9����[ 9L����Xz�5�@�#U�m�C�"�7�3� ��g����� S�Hxĭ�{�Dz�o�Hzs�\���E(]1��à�i� �5 ��G�LC ����XW��u1�T	t#����������Lf��?�k5<��������~��N�W�}w�!8;3�ɱg��D��:��d	������n�PۖP)��ٶ�6�ȵ�q��B���ia�� ��z���%�h�e�s��B�Di�J�w&-�{$�.W�B�G��U��rg	ѫo�tMKi�m�k���r'��T�;�������ҋw�p|��b��Jy<��q��q"����idS�c�\/r��,�B�Uc[B����] k&�
�{T�i�Y�W$F�ŷW�U��i�$���NH\�	�
�j�%�E���}c[BH^y�KԴ��Ř �r/���.��m��;��O�qXz���!���p}@�m	I}�{�w	x���i	�<C�z-ό!tI�#�O|k?�RҢ�f�=V�!��:�ə��!*�_xX���������#I�L�8���Q�����dxk	#��W���=����H�v����Z���җBM����9��p�K�Bh�]%���	ٝ��y�4�û$�B�'Ar��B9�����"V�Rt���*�cBXF���}�3�K�,1>�(�0~O�f6|H��2@m�q����Y!�K[��3�LPbB0{g����b�b(�
�!�(�����!���fȄ����(�dA$w"�_;f��������~�Π5]�1���r� "s�Mu��3���L��<\�NO�����i�C��լ�C����w�u�����^���N8�5Di�����FnsfNҹ$�yx�`�{$)�9���%�Z�0u�grH��S�m�W]��d���Ox�x'�R=���f}'t=?���L�$�f�f'�8�{�AgZ��9��I��/���>W���:��lf׵�`��S��g
M0�l���"Ϙ�� ��}��]��	�!,�M���`O��d�΄�sH0�6�k͛�\��`|�3!�la���#���vUo[B2~WP'�Y����b�:���<g	�g����K&�ջ$�,L�:A|98�?B"�i	%:�if=�%�󅐖a��3�:����^vo��?y���6�H����i�����Vr8��-���`��;�m	%���t���$�P��;���#IN�����b��跶�n%��C�Y�p��2jp1�Dwx�;K8A=��
�ȓC��k��f#&��|�ר�!tITD���5��y&I93O5��9.�Ss5�8�xv�c�	�0v�!�Fo���Q�:�Y��:9$��'��e�rv��z!�g���w���]�:B��#��|�#I|5Y9�dfju�i��Y�	�L �i�Um[B�|��2�f���O:9П�Pz��B���_\,����)%��}¬�5ӥ�*`6�=��֋EC���u�Aז�z��X.� 7K�5�Z�F.K��g��'���@�����4���F����g��&X�wS�n�u���'2�F{��p�1��s]r�Yo����z�@?�Cdz��As�p�ԙD=5�	PmO>�ֶ3�������U�|���I6��F+�YB��4OO��j�\I���9�c�h�O2��˟���!A�Q�x_��%���C�A��?���O�p�4� \�1�ʥ���V_'��R����T����Ws�J����=<�+]�0�0���xRZC0*�;��?^ϮM��Qr�o�C���� Q��ks���o��!H�{�@�\O [�I��a�b�7�¥�Q2��G��M���i����L~(�~���LK(��a��Q�wHp_3�l����u��Q�`��C��wö��.�HR.���u�F�!�	��ZP(AZ�Y����R�0]��J����>c�sc���Ȅh>�`��+�������&�5���\f�I���x$I�;�@�e���2D{�O��%��R1���pTP(�B�C���cOk�3��&��Q�ω�7��z@��#��Nu��I��̺�=ؖ���磖��H��^��!X��C�U6�������_tXz��c����%����-jhK(1�pT�L�tښ�@F5���=�;����`���<I0
�V{�1�.�f�^!�\�sh}�A�!�^l�<�O���k�0�)r�Z��C��̐K�~]��ꡤ���;�!*o��N��eo:��E�s�����$��.8��2�6���EE$Wi�Z��,����P�n�n[BW��CX^U��
pm���0
��Y|�;�������{$�y9���(��I1^z�;q7Y�Y�r��j�g�J;�O�|��$(�G�!^_���rCpUf���ݝ�G|����<��s���@����_i��$��X��z���.m��x,f�8Nx=[�q¨8��W-�*�C�ֈ�&���Q#qB��'��TϏ�K�d����Ÿ�QO;Y��+cXT��Irt�廋��{$��_2���Y�Ktm<��%��&Mo�I/������p|��B�㕫�1�42r6L.DKչ&A>S(r���!Z�u,CAy9U^k�ӻ�^o(@N�i�Pg	'�:�����K��r�8����8ĳ��P �n��� q�d�����XO�p�:�m	]D�.gm&�|$ӄ��ڜL��1B���/X���Z�ٱ���,�o��i	�� ���.����r��F����j�&�һ�X?���f� �����Lg	�gf>2;zbB�]��^    ����zC����v�!P,���(�=g�b�Q���ĘH?�?�?�U5����2yڛn��H���A �1Ϧ%���@�/�d ��ZmZ�S t��6��E��؈�ڧ��Q�m	%s �w��p���H��96*���~�)1�,�[���H�>Q�s������b_:�d�t8O�6Dҳ��H���kM�X>����p�uPOeT��oJz�����Q'$��c���%�3�=���%�}|l��z�%
��M�Y��ׯ�alM{3[o���d�&��덺B��KH!����阖�Fy}���j	��b3'$O?���%��]��_p8���U4�z�(��6O���+��u���8(�9�Q��Le8_�S����
���
=uó������qg[bZ��j��D�\�	��
]V%K}X�)Ͻ�bܣ��,��da��0-ts��w��:z��gL�uXQF/ܚ��b~;��'w�Ƈ��yr�Xb�(��0M�G"�3w�M�$_(w�E�s=gg����
zVj�X� �e�M���=;C4�)�A��h���D�j�to+z���L�2<B����a�P��|�B�u2T���Z��e��~�զaR��2D�
�O
�Ԉ�7-�xfKO�K�{��Qu6�̌��Ix��o�T�s�c��:��&��5LK�wq_t��f&T^��J�Z��:��y��R�K�^�.�Szb�Y�}`b�B$�W����(�Z!*�l��I��K*�
�(׈�y��2O8G�؍��QS{��0�*e?ֶeV��6g��n"D����G]�d������F��ɍ��J��=���D�o�
���5���L+P�q84�3L˫(�6���29�mu�Z{��\�8jZf�l���|es��.T�QV`Á#Ĝe����2+���ng&�������x��j9�J���U�F�$(K7yrX�-o��g�.Mˬ�������BL>2w��k��
\�7��!�5!��3�Ĕ��;!+K�3��9��c"6\��0�.�9=ɣ���k��"V�s6G-��,sݒI��/g�����n$�tlp��y<W�E�u�g�bj����:��py6u+W����&V�uuDF�r�M+4����_aVhl������C
�P����"��&�U	a0�����V�Z��2�h묙���w�_�w�aR\�ш���<Cx��z�.�6DRS�n�a�`�AˏZ�<�ӑ"�
��,��b��J7���cNμi�����VZʀ�I+:�|.}�&��P��0����"�+ġ$]r��l��r!4�GtY˼X.���F}V����f#dd|�ցG�|>t�s��M���^��7U.h�Nk���%ʲ�n��܌�Ƨ�2/t�W���ol6�\F�T]{�,�J`��")��(MPѿǷ�Y��U8�g��}p��n6p��=k�ۭ�l�l����e�jw��Vlnl�o�<�Vod`�V�ǚXsQ��B�U��m\���vj�fJ�>�&��l.ݑX������cR��zߍ�S��X#}��A�Og������"6O|���1�&K����ku4g�8���wfO(�6�V&�o������z�W?u��!�k���^��T�'�)��WZ��{�YG؇|��>4[�cU�/Y]�M􂕛��J�]��؍��W�����v��-�\H��2��<�P���5�S�e3�̔�G��eU.Hw����� �����5U�
���>WGyڝC�U��ag��ǚ�l ��ؘ�e7��0�9�e�,��*�X���Ƭ�{�5��G�Cl��=֠�.ݢ��,�|�WL�"z���Z�}�B��eVF/�ugl5k���ԭ��2y�A�S����fz�U؜v�r����]V%W�����?O�y�4'D*=�2�n�1�X��5ky[����qk��]�#�����F�=�$w77�5�X���l��`�V&����FoeXe>e�&[�t��|vSXÊ[��:zE��W�wJl��c���.�6ѫ�n�/I���	�3Lc���&O/X���� 6�G�<���G���$wС��C�R_��cM}��j�O�a�n���l�����a�5mw?`[l�f>�b���fw�����<� ����wX�T=�+�3^��һNn�c౦�p�ﰡ�C��V����u9����\�'qok��<�[Nb��w9y���S�RQ������KV'ч^Nz�����t�%����*sw��;�X�f��X("m(�o����V�3�7�n~0��B祾�<���u����E�N�'��2VZ�@B��3�,��L+2�!kt��ӛ��by��p�1���`[fvc�q#*�y�G�^��K*l��׻Z����v����2ǼU[�^ 2�>�V�����g��Y����|�}x����^S̥#�b-C��4n�:�kʛ���RF餐1�+����p����xD!}�2Ì����d�cS��z�e�b}��9��c�ƨ�é�RPಪ�����27[���n��C���$�N�g��m��e����8�<�lPt`��	g�c�>�D�h�&�-�f���n���;�Ȑ`�X?�8�Z��:?t�e^,TU0Ts���g�=�`���05؎�΄T7J�0�u��
�|�M���J�W���u[=�J���5N>�j�+��}��������T��7�]V�L���1���%�pr�'�|3�Q�$F�����0�g�8��H��>�en�<���s�&��#M}�K2�u�96��w�a�W_O�N�[n��e,��F�2��D�5:���1�G�֎G]7uk��p=�We�j~���2Ȟh*���Z�T7��v�3L��m'=/���W�p?�k�����gg��.�a4ڂn:��+E�X��p��Yۖ�<Q���+2���w�]ukr�S��5�C�U�L�C.6&V����F���ܾ1D3�nw�-3��{�9�T�>�Փ/�5L�ٞ���S${����)r��T���2�n�d��e"�]�8&��b}6�7�ۮ��[[b�T�Gʹ�V�c!O4�v��B�2i2��}����cM�X���"z;TX��Ê��s��iZfe��m{˵�����C����/�C}�l'�3�f��Y�)V���ZF1�|s�y�f�i��������M1���3�dTx�����:5�i����v�m�f���v#�b�t���r:�*��0ZUĆ��	"Fu�1Q�)K$�I�6{>��Ձ��9�i��uEJ��Ê2�XPb�yu��\�P1pI%������v�ecd�Enk�&����S�A,�T�aEv�;$QD)���S�w�
��յ�a�����Qci�0-��f&P?�3�^�Y�f�T��3�l��e�֣BoJ[fI�rПWԻf+��KV�r�����k�k�t<�a:[������n�Ê�Ҭ�J�$���������fMH�ճ�mUM�yl��s�i�#IgR��S|G��i;�T�0H�,sD����q�0-5���k6��P�t����+b��QM����.��	v���s_'���2ێ�]ǈ#��;e[�Tzt�\�_��=� S�����e��zi�#���Ê͍��
	��j�����j�q�y2�&Eʻ��s����}����p0�b6�0T����+��
]VI�yX}ҧ��X�Y(p��m���<9���r�ՍÌa��B�aZf�Wn�K�3L�JMb�~��]iJ��+��.��5L�rl�+�a"�W��z�C
[,e��sD�j�]��ج>`�t�)v���/+߭�g�����F&;�{贻����c��Z��M+֋�g���ݕ.Y�|��G�N�O)�;݌g?֓e�f�%��;L+�뽸�g6����3��r���F5N�ǚ�Llr��̏�<��R����I���<�/,C�dy�By��Pd��,�l��ص�$�:g�����r��e���8�Y�u}��v��6,�I�x�=N�y����L�Tƍ�����놣\���f��
}tr:O��;���w��zg�03��,��8i�P���t�5D1�x    <5�������9���u=Y��®��j͊}w_M���Me�*�ɭ0�|�g���#Ҕ�_:C��4O��F���}_�f�-?Z�9�<����$�k�����g�?�#&�����m��3L���F>7D�v�˪Rk W{g�"Inڄ[NF��^�"k~�J�mh�t��=�$�W�ު��UYdV�a��#e@�h[k
TGz���y<�`7��E�a�y�VzG�e��o���n1b������x_y�W�{���y�(2$ ��p�,s���ٳ�=֠r�S#��5L1�P�c�����F����S��vm��&�\���\�}=Y��Bޯ��b���u$���S�Q��EԳ��gzį�T�q���+\WwalG=�����C�������e�B>i���z�2���H�j�G���0-nd���V� )K.�I���	�l�L}�Bhvw�<%���BN��̓�}����0Mg�c�E��A>�i���w_�T���M�����J���م.�ʅ�K�n§Hd���P���0��悕 ����P=�"�́'��k!U�P8�P��I7��Ê��H��OO��+/���I����s���c�/�Xr�/K�PQĴ�2��[u�y���e�*�to�SS��l?�V�5T���R���}&J�_�v����l!Z�fj�f+���h�XU�B�\C�3Y)�J�����߫��J�3�:�
͞�v;�QdV�W�2,�ܣ���p���W��'6h8_�f��ˠ7��������������kg#7H���s�&�����n�����,#C�hN+02>�|<�ۈ�� �"�X���1FoqM9˼X��d(���0-u�6�0�,���33�J���b�-l�G�TC*���Êl���a������2_��r�^�1[�$�`��H<�.^�zv_�P�f��"F���0�ir�|�Q��%�C��j��Wrk�t���u�o�i��*�Zr�
�*����Y�ئc���Q�6_?;�4��b��\��L�T���U��l/U�2�� �d&�z��jĹ�ꮯm1!ѱ�����X3�QG�Y�k}��C��'�<s�`�M�?WW?S,f'y�z�ʳa�������'�]�Ј�2�lO�a�\�O��"�-�7tf�P�E��hf�e��Q��(��j@�|�c�f�P�R�e��v6t��)���׆id�I���aj6�3��N� �<S��	m&˼@�����e���dC��=� �M��/X��8��PM�8�ܞ-2�&"\�='�ذ�z����X�)���0����Ϻ��s���t��0Y���)Z���c�u����n�=֔p?�&��3h5���u����^!=�8���s��ż�H��g���������G�#�Y�͎%=ϣ��d�e����Z��Pו�y�5�����;�t#��̮>]�]2��?�}��U��<\�b-�%ȅl��U�骝A�˪�p��a���q5�}�V�/��9!��eU��0ı����M���ՙ)gz���RѰ���Y�]�ubcrX�:E:���)�=m#���2�^��jṢ�e��	��.���5�,��0]�n���Fk�����B��*��'�|sc�6�~]����8�u�5���e5ȃ�^���K\�����+֦�i&Z3U�e�G����nW�;̯X[ �u���2G����|�;ﰢ���B
ԕ�N���R�xe�w�y�<;V���d��t�yj�!�\��y��6�Ǚ�Y�Pb��"z7J���a��f-}�)�50w����u�F�.�^kJ9�<�ޟ��4Lt��'�0Ig�6�Q�9�ZT ��+籦�~k���O�����uR�2+M���<Y���xz�4��O��
�'s�%�:�F����Dr<Sk̲8�|y�.����2�Gu�f��?���^''��B�C9,í����+�����G��Ad9f�a�^��o���:�^Ư_�+�s]�q�}�I!��OU�t�-�xiNT�l����ݣL>�ļ˪L�4�e�.��5%��Z����6i�aS��_�C7Y曙^�D�5j�2k��KsJ���D%�|�2���4�5L��=?+��������K��J7r���i��8������x>"VYք$���𧻓#>a�&��T���v=��^�j]�����e��?������H9�Vlf7�R&c���l��E�r��"I��:��Z�4��{S�I�ݛ8��c�����-��F��Xߨ�n����?�-��b�u�D��D�5L�����a�-���`[f�e5K��̈�S��b��Z;W�-��kV����Z�G�++�翔o0�;�6d���r�*�[�c�Ht�	���aE��V�0k�fW�"�wހi}9�fE4�YWh��z�IW��*�����0�Ⱦ>;����<�C
�;����g��'1�`�_g�.m��y�J���3L���p�߳��5r�ߣJF�c�����ә�Hrc�<6��]�,A~�hԧH�L�V�I�jf����X��رrc1�X���i���Δ��V̬��zďm�4Y��U_q�t�xz��Ƥ�.��G�1hr����$�ۖf���j��e��KXmˬ�QO�(�W1���n���b��}���k�42B�4jk�^�9Mn֑1�tf'O��&$Or�&�9�O;�	\Vf��]��+�?��eT�lM��:<t�-����QQ���0EQ�`��.ϧ�.kr⮐&`�ۮ~�]w+��Fy��0ɣ��v�eVȰ�[�葭���}M*�0)o�������C`rHQ����y@�#pY�QV{�V�k�B�� �?��r��|���2Ϣ�rT'�&�9��u�m*ﰢ���&�sKr�B�mrXQF�+��j�d���7S�[}AeL�{]�|Uo��4L��r2eAO��'㉟�{$>X�4��x*ϋQ�a��yV`��e��&����Z��?wrXQ^� =�o�X����TidD���M����nX�8T�n]V%ѫ�t-�a�FZ���Qz�j~>�s�ey֚.�L����<Du�*�Bk�N�ݡϺR�fu�9����ı����Ru���JPO.�bS�np�i2S������4�L��4�3Ls��m�=U�i�>�P�F�ʡL+�K��%*� w��7��w����>�#����κAc��ex�Fi\�i�eї���L�y�%�]���g]!7ͣ�$arX��yO�Rk6!ҫ<�l���x�C>�r�X�b�9�T��u;Y����S9�4���$E~�A�Y���#��k�~�wXQ��M
y�t�Y�R$:K%]%-QmV��^�\���^]}�	�����Ak�#��<>T�0��$_�j��^�Ns���e�^���e���;��#�e.�k��1��R���vo����ߏ�Ur#�ZMȷ+�ٌ�oUI���_�3L��>��Bt�crX�z��F�ӹ�<�ܨ�7�����<�g�y���5�*�E67_G�\w�lˬ��e�S���j;����|I3�Jݴ]ƵOnw�n#��������S��cؿ��$g!tY�:P�Y�Nu�3L3�{l��Y�t.�fvY ^�_��l戈��9'���3LK\�{�0���4-1�|�V��Q�s[���:єsF���:�V��i�c%�t2�5�-J�д̮���q�L�]�;C;/�ҙ����Y>�PYq��e��f��ʃ�Ʉ7>�~2��~�dtk�旛�-4�X�Ak��g�Ê�<���2�Q-hU�w���b�6�$�|����Y�Z���Ƀ�^��*��~���L��ݣ�StW�MG#U{8;ô��6"�l&wř��1O���\Vų�!�ܘG��T�@t{!^���X�+��R�g���8�9�S�s��v�&�5��
B����^O�5L�}�I�l�
ϥ�27{�<�W�e��pl
�pyK������;�(f�+=]����(J��E��9���n��õwH��JF�'1-3��;i�H5L��D.ۓwX�F/��cZfY�b�צa�G/Z������`�v���n�>�	o4�)���j��X�:$�Q��
�sr>�˿E��v�9��cf���ƨ�~    ����I9�<�n��ψ9�kPW����p�y�4�o�G��E�漫M�yrQhä��dJ�;���{��&�[T�w�����栿|rX�T���t1��p�h�z�5������/I�7�
��g���,�RgT�<�l4'cg֫�C���:h[f�n���f��r�w��j@E�l]�#V�1���4��Y������,���Z�i*q�M����B�N��(���2�K��M[M�y�?h��5L5'���)�S����cM���m(��jZf���(/�E'*g�;hƒ��u��A��2�o�'E2�eX}�x�Ouc�F"���̖*F���x4��9�XG��g
YôD����0E?e�è0%k�:	M+��߉�~Ir���wX�Z7�����L���;��5S�Y���h�CO+4O��$ʾ�/��jf��VHߤ;ɠ��#���g|\�0���B,��׺y�{��L��!��}����CX���Ŗ��5L%$�������<<�0-gc�����QO)d\1Qm�mk&�\��ЩA�&�~kv�HY�4��r4,�Ū�.�8�Ϻ�Y^��g�N�[ôDu��a��X	s;�/Ϛ���*��B4Y�U�P�'�=;���i"g<krS�ٶ̊�C5twrX��8�*q{��U�9�6�:(�Q��HM�,������|L�,�����L&�ۧT�m��~�&i[�t��$br�P�)ԓÊ���[cM)�8�б��)�|����Sy�n����<���&�<�P��4L��)��U��^�U��|��r���̟�7�R/`���>3�˪X����:�H.�z�r�V�u�e���u6O&�/��;�@F�<��aR���H1�R;Q|��{�c��]#C����XWg�'W�;�i���S�<�����}mt�=9��1�cm[fe��V��5�b}c���<ɀ:�X��<�l.��4�k�m��Z����da��+R��%��=�a���-z~Ug��c��iģ<GO�e�������)d��b؟�{�|{�51�rK,��(�Y�P��+�\���O+�zHS�/�o����kǞ�3�W����r"������MKfjNz�Ls�r�9�	��V�\�X�P��+�3닞��k[/�uP���Ss���^W����kfc�I�h�iS9��t�����|�����d�䰢XX����l�O���>Zi�T֠�������-�i&�<��?L��aE"�+6㫽�
�<�\�*g���o�����
����ĝ�d��8�_�+��qx��O�ۖ�fq�gp�.�m�'�9��cb��զa�\��<Kg�w=ͤ+t*�2�Q��-ajVcJ�@���c'�^ﰢ��O�Sd��4��Y�2n@WT��&�qdv�{	x���橚,��j��B}��3?�2ϯ*�y���<��v&�a�Z>8��?Ly���rR�M�B��
��= ����o�^�,�@>뤗7��|��U�JzƝ�7N�Ee��L�꜓"ӥ�AWѽ�9�Hi�+�Y�X!��:�2C���mˬDW�y�-����������zо�+b�">��I2��I����?�l&G�S��Z�b��9��3��l��
��ΘRӖY9�U��F��*��ı�'q����N�����:���_+��d�c�I��e��1��5�t��׬5J�k3�u�krY��4���̭B�
Y̬3�"�5�"����9v�zأGhSċɣZ�R�e������0������W��V����;�0-���ۖ�f![R`���r]���c?��e�\�Uz�*gϘ�ՖYvU�ͳ�X��FǗ��|����E&�'�����Y曙j�EL�5��a}8�r��k��������<�f+Mx�G���O�'��iBـj��u�	��k��V-
�®G͕t�x9_�sT;ok�0I�iV�{��X��9�D��l9����X3W������
2�ǚ�L-"Cʹ8jR`�[�\�z��dQ�׭�����U�f�l�%���˸�LIN���
�g��/8;�u-��-{��Z߬e4�b��k��c��3���i�!Ǿ�! Ui�e_��kt��_�bD�,�t)�Y�Z�Jk��:ܓ�e^�h_q���q�^wU���F�(u��r^AQ��5�"��
��Sc�g����}����2O��a���]��+�w�.��q�.����|�#Ҭ�3N��ѯc�`��,��ڤ�1GPa�H����<ь�00%���L�N�e�y����O����e����b�ߓ5����~"�Ϻ�VƎ*6�2���QƧ��eTk��6���e��i�������ǫ2�_~l�,77��W�J�5��p��Z��~���\�6(�Z;�tsY�0��P��Ul,��>ʓ�9qO����g�#O����Ԩ�mˬ@P%μ��֗�(���|��Ⱥ��K˸�f&	4�����yk�ǈ˲����}<Mne[�"�,~��\B�uY�]��{�G/��d߇�cM��I�Tz9���0-o�Ҩb�mw���,��nv���x.�LI�b�Ooe©�kFt
'�<�Q� U�f^17S�i}�;D����N��P��!�T2R�}�=Am�F�ć�2�=�y�,�Ԧ��S�B��[�@%#��)�2�v<2��?�ϓe�^|V{և����2�\e����f����kb-9��r��fi+C5� .�aEv��$�ޣ�m��B�'�~�e>�H�uJ�]�Sy
?U��2y<�O�2p�Z����lv�a�&���^�2]\����{�K?OW��uB���?9�(4O&�����}mbi�ǚ�n�w�Rp���R׈f��,�B�Y�m���^��{���s����d��72�"�竖�V������m���a]V�od���뚂�'�U�dۙ.��BF3/\0��˨z��g{\�'��`�@�;g�.q>pY%O�F�)[�T�:\��e����`���
��SN���1�ǚҽW�[_�r�
_�t��U�8�,j^]�mH|�֮� ��`B�'��2�*ڦe�-�Qz��^o[f���Gg�b�G`�d�˓茹<�2��
�h>���΁ǚ�s$�!r�۝m�ـ�ӓm�-W
6<�{�>ږY��ǈ��h7�`�k����`g��ǝe�>���l��R�8�rvس8�<��nSSS�l[f�I^�ϓe��涵o)pY����צ{�;�|����i�,��rKt�XuZ��a�����~����u��i��r�x�m�s��Ŷ�i6S�Ր|v�(æ����;��C�����d�Y��f��d��o�XW��YPX�ф�Ok�k������MwD���c�>�w8��0�1�أ8�5L�0�H�P���ud�ɎWw\���Z��^�����Qx�T뻙U4O�+�j��̱��Y����l.��+D,V��cf����:�?ź\���Xӵ<��#vv��u�*Ϥ�"ώG����۴=pY��m5,�Z��������,�l�ʪ�W�t��AZ��f�Q�g�.V�dx�Y��W*���r�p�u�����g�Ai�c��W���e(̏�5L��zC���=�V�e�8+<�M��֎�Fq��P�$�Tk���}L�Ic{�b�5LgvP#�]Uv�,����Q�k���B�Z�^b
 �X#go����<Y泻q�
���ܣ٨�i0k�W�*1e|m�;�V��u8�<����lqGSR]�hJ���g����A߷�X��On������fΠ�EJ�h|O�^�s%cUg�K���(L�,��R�ߐ�f�B��*<���e՚�b%V��j�Qm\O�k�4Z��eG�ue&XW׉k����>D�����h��V���,��F�Qܪ��U�L��MzrX����_1�`Q�y�l�,���a��OР{^kRMf�7�p���[�+�Qs����V�c������g{��@t��a*��C-�K=Y���e��xv����ּ�*ҋ8O���?`�|y�Fy��[bD�,��E�'�.L�䗵�7���&E"����6����%���J#�L�Q�Ҝe�]�x�߬.a4�b��I��cJg�kؤ�N+6��?��r�    �@��i���!�X� �5�e���Cx:���i~��%�b6��s���:�2/2���r�G�G�qHQ"������q1wY_VA'�p?��bBR�x��a��Ê|�~)dLQ�h������]Դ�P�m�=�:L���:�g��9�,qduT���
<֠�,�]$r+��lU��E�'Ydb�9"�0[T�{@���e��ju.c�b�a�aԫaX���f�t�a�ff��Q����v�m���`�Tk���`�"��0M����'�d�_�&�G�;<z�a*�2l� Ë:�X��ލ��1LQ������O�eQY`[sN/ω�(0'l&�{�y�'�����V ��xo&��޶̊�c���i�a���|[ô���޶̂u��xr���� ��1V�{�0I�Uq")ֻ�3L3��w�2ϣߪ�+��2�oܡ��6g�#3��F�ô��I�t3����S�PGM�V��)mkk����ߏu��V~T�\Y�O�,�Vȕ5����,���2&�"�]�>�m��Q<�^����
�#�4���wX�\�cm���iP�vf7R�c�V5t��SȰ����%I���˴̲��#��)zD/X�kL�&[�w�L#�����(��f{��49�(u���Qx
<�,ƥ�*1��[u���0��K�i�$r~l,f�4��U�M�{7-�Nr�y�Dߤ�cS�i���^�fͳ�p��?k�k�f1C*��F�����~B��5L����M�,����xt�)U� �_�f�uS�G���Z���δ~�v��\�#���C�=O���u�"Z}��p[��h-�d6���T�W�t����f�M�$���!�\o�il�lm6~�4��|֕�^���lI�b-�����-QSux4݉E����wXa��>�a99�H�{��S0��˪lv��s9����Az��2��I]c�k��u;M���=֔B��i�lp��Պ���F����Y�F��wE+�Z�\�{�����0�;_��j�����ӳɼs�y}5����j�P�dl�t��������Vl��^*�u�
{y��W�6��X���o8K�cM2�c�yz9L3����6U3C�u�k�Iގ�w:���	=�>x�5��h����������l����_g��Zm��ГÊ�F�Q �9�t%�{��\��$��d�1M:E�x�o��ϭ��~�5�<��+LY�tc?&��_�����R���
���������LOrYY�Q�:����?�s�l3�-3̳W_W����*f���t-���k�R��e���f��{���n��>)p���aZf�&�jg�b�������2׽�⺺�������p���3L���	�C�Vltj�4D4�����x�4����w}���R��O�e�b�]�W�e����Uo[fy�B{�0-���n;g���3H#g��.�5L7r�j1c�,�q���i�Ê}�<L���)p���7�i�1�[��X�W�Age�e^\G���_N
�׍���0ݘZ��9�@$��:_�f��=�0M�󆈣涜oL	N+4��np�inch:9�(P��յe����=s����N�B����*nkb뻹�L��ݩk�0If���<�_�!�s�O�h=9��}��0)�Z�ag�c5��5g����k&{2�!Z�]����V0H�h�����V��k{Ev�g�'�b�Ë�������î�W+|�K�����Ê��P#�
��*�.�����n*l&���i�d���S-��a�n�}�w7c���f&kS�W�?�2ǵ�E��a��^�8v�~ә��e/��0<�^aV̶�R$�w�e�E�Ͱ����
{|_�t/�8��a��P������u��dZf�ԋS8L���^�Ȑ7-�8z%=
]�V$��#�v5-3�?hȴ5L���eY�a�/���5ō�S�ZG�2N��2/�_��;���X�y:��5-1�`1S%�0��<�^��<�X��TΦa�HMLK;�4Cm��9�T�E�5\�Z�V���'yrz�5Zw�ʶ�J��V�M��T�iZݸ���a���,S&�.X��x�&��
 �������E�"C��H}�T��
hrM�3�����F��%r׬'˼��4#���^R)|�:鷆i��iO���I�oe�D���6Y��j�v��l��̐�8�j�2ø���@g���H�*�=�2N�yĲ�����9�d�&����Ӂn�F��e&� �Ol���FL���&<+*7y��T��-�Rz+�e�:���{��q�of�V]���N����9r��^P��{�I�B��~��R��5��Aw�YK�+r�I��;˼�Q�����4�#�jx���ᛅ=����le����Ǻ�Z��������錛tZ��ʻ����z׵Z��y����ά;˼�,{�U��X��D�=��8�p~���X�
ݺ7�2�������3n��a�/��� IC�ńV�� QC
���v}����{�Y/��^⑌�k�n8�$d�;�v�7�"�uYkr�|C�:�X�,��n��ζe�-0��|1��������4p[=��2/gS�)Cpl�}�q�g�Bj��ɍ��H9܊ح?��jS#��Ih��e�`9��1-3ݸ�k*�k\Vm���w�;���;�Gu�m�V$��=vR�7�C�}Τ6{�5Y�A�ك|-��c�q�ص�$�xಪ�h7��zNU7|���`(��2��8�|sc;HU� mc�eφ��h��9�2�ZB$�B��GM�U�4�b�e���MT+�U�[��S��9~��>8C4E@2��b�O��[��ы��;bNdr�����{�Gd�kr�u"�.�U��c4�u��X��h�R#��4Y���ӓ��ө����!ŋ�����B��#VPM�9�"N{�0�/�y掯~B��`�����KNQ�)�S��z��c�ڕ���R�����m#��[��P�9�@��8�,���6\u[��lpVC�uɭUh
Ow@l��"[N"Q�O��zR�+mB6"�5��Z��KV�"�S��x�j�)U�k4��v��7�*�96�z�/^�V�u�}X�y؟�|��\��B�7�]�g�_�:���P���T?i�uX��4�
�lS7���������	M5���f#�}ndQid`����%��V�WC�S���>Y�;n~1�`ef�QW?Ƀj���Ĥ����h*�uXQ��01���oZ�prX�T>�+6�o�^���ؼV��ǚ�Se��%�u#w�U�|z��,��Ѝ[����ʣ_����k��IM��T��x�T�����̈́�o�\i)s"�+1�j;��k-�d鉧�ԥA����2_H�R�/lF�X|�1ذo�^�vaFc��������+֖2�;�G�j����n�_#bm/^��+6%��g�I�X��R~���vy9դ����x�ƙ�v�չ�0��e����f��a��~��\�c���=��{�%�g	B�ќ�g�����bm�)RW.^�6�����G/X���i��g��x��R�9��:$��d̈g��X����Z_n�K�?�4�drX�qEW��v�)e���v�Gs��+���.�_����T���C�u�:B�ؿqrX��L�z�7�o^uE���I�`�2�6��]���x�U�q�� �_�_�RF����np�_��l�7�Q�:��*�~�W'L+��Cߴ�zeVg/^�6s����ksG�M��%��3���L��:�X2z�J�}<=UZ�J>0z�ʍ��;[�RRdw��,�b���<���w����+S�^�7��˪L��.�rD��9�����h���e�B9	e%"�[�"ak)�j}:�5a�|y��������N'��+c��%�Y�D��:�%����j_Mt�sX����t��W�ͣO�W���D���k���>��x<Xô�>W�h��;�����C#ov��F5�������B�񏊸�*1�j�֕\V�?(����$�*uQ�յ\Va��u�E.�ڶ�ʹ��J6W�{�B�F��dv�j�xa�C5���0�mE5��Y��U�:�����e�i ��_� >  /@8�A�K � BB�2	&��������y�;���V�j��3Ow����*��~~����_�Z{(/�HWd���ۂ(�I��
�7�8nv�b�D9Ma9��q���VN�_��fg7�AT3�(�N��ۓ9��,,����Q�Xe��Iܚ��X��3�>���"勫2����Q$�D�
�n�/���y׈�g�Д�6�^�R�,ΎB`�fZ�S���hvHL���
?>� +d-��}}��}�50��E�g!2�
��}�sHL�$����z�
����+�L�53W[kr7f�����>����5�Bbk��/����L̮�{�������e�Z��|`֕��+&����M�[d?��m�̻��ݡlcdϖ��X�M�X=+7h�D���k���=�z��-1����w����nt`fz=�?�ҁ�y��t9�N5e�j1��:)��[�?�w�'�%̺ՀmEb�3"7�~d�Пj�]�j�}�S����Ӛ���Z=+ۜZ5X�����%A�'d�ȼ���С?V��s�B�S�C�A����$�g���9R��f7$OU*+;�z�C�q-�M��<�p�l�=�#b���.h<b�}}p��X�B꙼�(@L�5C�	��]��:f��*�O��:w���&Ěi��O�����|����Z��]\�M��=xpO|d�{�s�W9[�@���mDRnӫ3�~	91�ۓ�Ff��{F5�u���h"�l|7�ߝ��z��kis\t�O�f5���u��)�Rv�2;�1�d�lй�f�b�ב��P�sR�!�lĪX1��K*�t�/)��X�t���=!2�|�N~�1	���ܘ]�C�Y_dhDFv$��6��B�'�O�ʝ�����)=V���b:�2�,JH�g؎%����I�r�d����e�N�,��E�K�96��x�n=X~y�H�c�\"���E�I�٠h����4�l�M��>V�\+��9��`1��YwE72W	�Oi6�+d'r.��l�-M�����e����`F����Ȝ>����2V�M���t������� �X      �   &   x�3�t�,�2�O,I-�2���W�MM�L����� v�T      �      x�3�4�44�4����� '�      �   .   x�3�t.-.��U(�ON-.Vp.JM,IMQH�T-N-����� �3�      �   5   x�3�tT�K-W�w	uQH�/R(�HUH�,*.Q(��JM.�4����� 8!      �   #   x�3�44NCNCs3i���L!�=... ���      �      x������ � �      �   L   x�3�t�H��LN�QJ�IM,N��/-)(-�2��I�KQ�d��9�KR��DL8��3s�JSs�b1z\\\ ��S      �      x������ � �            x������ � �      �   X   x�3�I-.Q((��JM.�4��r�tvv�t*�L�KT��L��L��454�55��5776�L.JL�I�/ɏO/J,KE5�ǉ+F��� cm             x������ � �            x������ � �            x������ � �            x������ � �         7   x�3�420��54�54R00�2��2��33155��50% �����i�i����� )S�      
   3   x�3�420��54�54R00�2��2��335154�50�,BCNC�=... �h     