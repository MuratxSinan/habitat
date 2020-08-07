-- CREATE DATABASE habitat ENCODING='UTF8' TEMPLATE=template0;
-- CREATE USER emrah;
-- GRANT ALL PRIVILEGES ON DATABASE postgres TO emrah;
-- ALTER USER emrah CREATEDB;

CREATE EXTENSION IF NOT EXISTS cube;
CREATE EXTENSION IF NOT EXISTS earthdistance;


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;



CREATE TABLE public.cap_shape (
  mushroom_cap_shape_code char PRIMARY KEY,
  mushroom_cap_shape varchar
);

INSERT INTO public.cap_shape (mushroom_cap_shape, mushroom_cap_shape_code)
  VALUES('bell', 'b'),
        ('conical','c'),
        ('convex','x'),
        ('flat','f'),
        ('knobbed','k'),
        ('sunken','s');

CREATE TABLE public.cap_color (
  mushroom_cap_color_code char PRIMARY KEY,
  mushroom_cap_color varchar
);

INSERT INTO public.cap_color (mushroom_cap_color, mushroom_cap_color_code)
  VALUES('brown', 'n'),
        ('buff','b'),
        ('cinnamon','c'),
        ('gray','g'),
        ('green','r'),
        ('pink','p'),
        ('purple','u'),
        ('red','e'),
        ('white','w'),
        ('yellow','y');

CREATE TABLE public.odor (
  mushroom_odor_code char PRIMARY KEY,
  mushroom_odor varchar
);

INSERT INTO public.odor (mushroom_odor, mushroom_odor_code)
  VALUES('almond', 'a'),
        ('anise','l'),
        ('creosote','c'),
        ('fishy','y'),
        ('foul','f'),
        ('musty','m'),
        ('none','n'),
        ('pungent','p'),
        ('spicy','s');

CREATE TABLE public.gill_size (
  mushroom_gill_size_code char PRIMARY KEY,
  mushroom_gill_size varchar
);

INSERT INTO public.gill_size (mushroom_gill_size, mushroom_gill_size_code)
  VALUES('broad', 'b'),
        ('narrow','n');

CREATE TABLE public.gill_color (
  mushroom_gill_color_code char PRIMARY KEY,
  mushroom_gill_color varchar
);

INSERT INTO public.gill_color (mushroom_gill_color, mushroom_gill_color_code)
  VALUES('black', 'k'),
        ('brown','n'),
        ('buff','b'),
        ('chocolate','h'),
        ('gray','g'),
        ('green','r'),
        ('orange','o'),
        ('pink','p'),
        ('purple','u'),
        ('red','e'),
        ('white','w'),
        ('yellow','y');

CREATE TABLE public.stalk_color_above_ring (
  mushroom_stalk_color_above_ring_code char PRIMARY KEY,
  mushroom_stalk_color_above_ring varchar
);

INSERT INTO public.stalk_color_above_ring (mushroom_stalk_color_above_ring, mushroom_stalk_color_above_ring_code)
  VALUES('brown','n'),
        ('buff','b'),
        ('cinnamon','c'),
        ('gray','g'),
        ('orange','o'),
        ('pink','p'),
        ('red','e'),
        ('white','w'),
        ('yellow','y');

CREATE TABLE public.veil_color (
  mushroom_veil_color_code char PRIMARY KEY,
  mushroom_veil_color varchar
);


INSERT INTO public.veil_color (mushroom_veil_color, mushroom_veil_color_code)
  VALUES('brown','n'),
        ('orange','o'),
        ('white','w'),
        ('yellow','y');


CREATE TABLE public.ring_type (
  mushroom_ring_type_code char PRIMARY KEY,
  mushroom_ring_type varchar
);


INSERT INTO public.ring_type (mushroom_ring_type, mushroom_ring_type_code)
  VALUES('cobwebby','c'),
        ('evanescent','e'),
        ('flaring','f'),
        ('large','l'),
        ('none','n'),
        ('pendant','p'),
        ('sheathing','s'),
        ('zone','z');


CREATE TABLE public.spore_print_color (
  mushroom_spore_print_color_code char PRIMARY KEY,
  mushroom_spore_print_color varchar
);

INSERT INTO public.spore_print_color (mushroom_spore_print_color, mushroom_spore_print_color_code)
  VALUES('black', 'k'),
        ('brown','n'),
        ('buff','b'),
        ('chocolate','h'),
        ('green','r'),
        ('orange','o'),
        ('purple','u'),
        ('white','w'),
        ('yellow','y');

CREATE TABLE public.habitat (
  mushroom_habitat_code char PRIMARY KEY,
  mushroom_habitat varchar
);

INSERT INTO public.habitat (mushroom_habitat, mushroom_habitat_code)
  VALUES('abundant', 'a'),
        ('clustered','c'),
        ('numerous','n'),
        ('scattered','s'),
        ('several','v'),
        ('solitary','y');

CREATE TABLE public.population (
  mushroom_population_code char PRIMARY KEY,
  mushroom_population varchar
);

INSERT INTO public.population (mushroom_population, mushroom_population_code)
  VALUES('grasses', 'g'),
        ('leaves','l'),
        ('meadows','m'),
        ('paths','p'),
        ('urban','u'),
        ('waste','w'),
        ('wood','d');