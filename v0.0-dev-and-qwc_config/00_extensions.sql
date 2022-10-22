
CREATE EXTENSION IF NOT EXISTS tablefunc;
CREATE EXTENSION IF NOT EXISTS unaccent;
CREATE EXTENSION IF NOT EXISTS pgrouting;
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_raster;
CREATE EXTENSION IF NOT EXISTS dblink;
CREATE EXTENSION IF NOT EXISTS plpgsql;


/*---- ADD ROLES NOW ----*/


DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'role_web_basic') THEN

    RAISE NOTICE 'Role "role_web_basic" already exists. Skipping.';
  ELSE
    CREATE ROLE "role_web_basic" WITH  NOLOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'role_web_om') THEN

    RAISE NOTICE 'Role "role_web_om" already exists. Skipping.';
  ELSE
    CREATE ROLE "role_web_om" WITH  NOLOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'role_web_edit') THEN

    RAISE NOTICE 'Role "role_web_edit" already exists. Skipping.';
  ELSE
    CREATE ROLE "role_web_edit" WITH  NOLOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'role_web_epa') THEN

    RAISE NOTICE 'Role "role_web_epa" already exists. Skipping.';
  ELSE
    CREATE ROLE "role_web_epa" WITH  NOLOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'role_web_master') THEN

    RAISE NOTICE 'Role "role_web_master" already exists. Skipping.';
  ELSE
    CREATE ROLE "role_web_master" WITH  NOLOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'role_web_admin') THEN

    RAISE NOTICE 'Role "role_web_admin" already exists. Skipping.';
  ELSE
    CREATE ROLE "role_web_admin" WITH  NOLOGIN  INHERIT  CREATEROLE;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'role_web_crm') THEN

    RAISE NOTICE 'Role "role_web_crm" already exists. Skipping.';
  ELSE
    CREATE ROLE "role_web_crm" WITH  NOLOGIN  NOSUPERUSER  INHERIT  NOCREATEDB  NOCREATEROLE  NOREPLICATION;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'qwc_admin') THEN

    RAISE NOTICE 'Role "qwc_admin" already exists. Skipping.';
  ELSE
    CREATE ROLE "qwc_admin" WITH LOGIN PASSWORD 'qwc_admin';
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'gn_anon') THEN

    RAISE NOTICE 'Role "gn_anon" already exists. Skipping.';
  ELSE
    CREATE ROLE "gn_anon" NOINHERIT;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'gn_authenticator') THEN

    RAISE NOTICE 'Role "gn_authenticator" already exists. Skipping.';
  ELSE
    CREATE ROLE "gn_authenticator" NOINHERIT LOGIN PASSWORD '1';
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'qwc_admin') THEN

    RAISE NOTICE 'Role "qwc_admin" already exists. Skipping.';
  ELSE
    CREATE ROLE "qwc_admin" WITH LOGIN PASSWORD 'qwc_admin';
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'gn_user1') THEN

    RAISE NOTICE 'Role "gn_user1" already exists. Skipping.';
  ELSE
    CREATE ROLE "gn_user1" NOLOGIN;
  END IF;
END
$do$;
/*-------*/
DO
$do$
BEGIN
  IF EXISTS (
    SELECT FROM pg_catalog.pg_roles
    WHERE  rolname = 'gn_user2') THEN

    RAISE NOTICE 'Role "gn_user2" already exists. Skipping.';
  ELSE
    CREATE ROLE "gn_user2" NOLOGIN;
  END IF;
END
$do$;
/*-------*/

/*-------*/
