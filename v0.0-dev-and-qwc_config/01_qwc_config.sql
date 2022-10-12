
CREATE  SCHEMA IF NOT EXISTS qwc_config AUTHORIZATION qwc_admin;

ALTER SCHEMA qwc_config OWNER TO postgres;

SET default_with_oids = false;

CREATE TABLE qwc_config.alembic_version (
    version_num character varying(32) NOT NULL
);

ALTER TABLE qwc_config.alembic_version OWNER TO postgres;

CREATE TABLE qwc_config.groups (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);

ALTER TABLE qwc_config.groups OWNER TO postgres;

CREATE SEQUENCE qwc_config.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE qwc_config.groups_id_seq OWNER TO postgres;
ALTER SEQUENCE qwc_config.groups_id_seq OWNED BY qwc_config.groups.id;

CREATE TABLE qwc_config.groups_roles (
    group_id integer NOT NULL,
    role_id integer NOT NULL
);

ALTER TABLE qwc_config.groups_roles OWNER TO postgres;

CREATE TABLE qwc_config.groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);

ALTER TABLE qwc_config.groups_users OWNER TO postgres;

CREATE TABLE qwc_config.last_update (
    updated_at timestamp without time zone NOT NULL
);

ALTER TABLE qwc_config.last_update OWNER TO postgres;

CREATE TABLE qwc_config.permalinks (
    data text,
    key character(10) NOT NULL,
    date date
);

ALTER TABLE qwc_config.permalinks OWNER TO postgres;

CREATE TABLE qwc_config.permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    resource_id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    write boolean DEFAULT false NOT NULL
);

ALTER TABLE qwc_config.permissions OWNER TO postgres;

CREATE SEQUENCE qwc_config.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE qwc_config.permissions_id_seq OWNER TO postgres;

ALTER SEQUENCE qwc_config.permissions_id_seq OWNED BY qwc_config.permissions.id;

CREATE TABLE qwc_config.registrable_groups (
    id integer NOT NULL,
    group_id integer NOT NULL,
    title character varying NOT NULL,
    description character varying
);

ALTER TABLE qwc_config.registrable_groups OWNER TO postgres;

CREATE SEQUENCE qwc_config.registrable_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE qwc_config.registrable_groups_id_seq OWNER TO postgres;

ALTER SEQUENCE qwc_config.registrable_groups_id_seq OWNED BY qwc_config.registrable_groups.id;

CREATE TABLE qwc_config.registration_requests (
    id integer NOT NULL,
    user_id integer NOT NULL,
    registrable_group_id integer NOT NULL,
    unsubscribe boolean DEFAULT false NOT NULL,
    pending boolean DEFAULT true NOT NULL,
    accepted boolean,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE qwc_config.registration_requests OWNER TO postgres;

CREATE SEQUENCE qwc_config.registration_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE qwc_config.registration_requests_id_seq OWNER TO postgres;

ALTER SEQUENCE qwc_config.registration_requests_id_seq OWNED BY qwc_config.registration_requests.id;

CREATE TABLE qwc_config.resource_types (
    name character varying NOT NULL,
    description character varying,
    list_order integer DEFAULT 0 NOT NULL
);


ALTER TABLE qwc_config.resource_types OWNER TO postgres;

CREATE TABLE qwc_config.resources (
    id integer NOT NULL,
    parent_id integer,
    type character varying NOT NULL,
    name character varying NOT NULL
);

ALTER TABLE qwc_config.resources OWNER TO postgres;

CREATE SEQUENCE qwc_config.resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE qwc_config.resources_id_seq OWNER TO postgres;

ALTER SEQUENCE qwc_config.resources_id_seq OWNED BY qwc_config.resources.id;

CREATE TABLE qwc_config.roles (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying
);

ALTER TABLE qwc_config.roles OWNER TO postgres;

CREATE SEQUENCE qwc_config.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE qwc_config.roles_id_seq OWNER TO postgres;

ALTER SEQUENCE qwc_config.roles_id_seq OWNED BY qwc_config.roles.id;

CREATE TABLE qwc_config.user_bookmarks (
    username character varying NOT NULL,
    data text,
    key character varying(10) NOT NULL,
    date date,
    description text
);

ALTER TABLE qwc_config.user_bookmarks OWNER TO postgres;

CREATE TABLE qwc_config.user_infos (
    user_id integer NOT NULL
);

ALTER TABLE qwc_config.user_infos OWNER TO postgres;

CREATE TABLE qwc_config.users (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    email character varying(120),
    password_hash character varying(128),
    last_sign_in_at timestamp without time zone,
    failed_sign_in_count integer DEFAULT 0,
    reset_password_token character varying(128),
    totp_secret character varying(16)
);

ALTER TABLE qwc_config.users OWNER TO postgres;

CREATE SEQUENCE qwc_config.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE qwc_config.users_id_seq OWNER TO postgres;

ALTER SEQUENCE qwc_config.users_id_seq OWNED BY qwc_config.users.id;

CREATE TABLE qwc_config.users_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL
);

ALTER TABLE qwc_config.users_roles OWNER TO postgres;

ALTER TABLE ONLY qwc_config.groups ALTER COLUMN id SET DEFAULT nextval('qwc_config.groups_id_seq'::regclass);
ALTER TABLE ONLY qwc_config.permissions ALTER COLUMN id SET DEFAULT nextval('qwc_config.permissions_id_seq'::regclass);
ALTER TABLE ONLY qwc_config.registrable_groups ALTER COLUMN id SET DEFAULT nextval('qwc_config.registrable_groups_id_seq'::regclass);
ALTER TABLE ONLY qwc_config.registration_requests ALTER COLUMN id SET DEFAULT nextval('qwc_config.registration_requests_id_seq'::regclass);
ALTER TABLE ONLY qwc_config.resources ALTER COLUMN id SET DEFAULT nextval('qwc_config.resources_id_seq'::regclass);
ALTER TABLE ONLY qwc_config.roles ALTER COLUMN id SET DEFAULT nextval('qwc_config.roles_id_seq'::regclass);
ALTER TABLE ONLY qwc_config.users ALTER COLUMN id SET DEFAULT nextval('qwc_config.users_id_seq'::regclass);

INSERT INTO qwc_config.alembic_version (version_num) VALUES ('df07e98a85d4');
INSERT INTO qwc_config.last_update (updated_at) VALUES ('2022-01-11 20:38:32.455276');
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('map', 'Map', 1);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('layer', 'Layer', 2);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('attribute', 'Attribute', 3);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('data', 'Data', 4);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('print_template', 'Print template', 5);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('viewer', 'Viewer', 6);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('data_create', 'Data (create)', 7);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('data_read', 'Data (read)', 8);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('data_update', 'Data (update)', 9);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('data_delete', 'Data (delete)', 10);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('viewer_task', 'Viewer task', 11);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('theme_info_link', 'Theme info link', 12);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('plugin', 'Plugin', 13);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('plugin_data', 'Plugin data', 14);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('solr_facet', 'Solr search facet', 15);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('feature_info_service', 'FeatureInfo service', 16);
INSERT INTO qwc_config.resource_types (name, description, list_order) VALUES ('feature_info_layer', 'FeatureInfo layer', 17);

INSERT INTO qwc_config.roles (id, name, description) VALUES (1, 'public', 'Public role');
INSERT INTO qwc_config.roles (id, name, description) VALUES (2, 'admin', 'Administrator role');
INSERT INTO qwc_config.roles (id, name, description) VALUES (3, 'role_web_basic', 'Public web role');

INSERT INTO qwc_config.users (id, name, description, email, password_hash, last_sign_in_at, failed_sign_in_count, reset_password_token, totp_secret) VALUES (1, 'admin', 'Default admin user', NULL, 'pbkdf2:sha256:50000$HnkznZ75$43a7c397b974757380b126f6e2cea51b533027b1d0eda3de2d248645c8f9d6cb', '2022-01-11 20:30:14.30572', 0, NULL, NULL);

INSERT INTO qwc_config.users_roles (user_id, role_id) VALUES (1, 2);


SELECT pg_catalog.setval('qwc_config.groups_id_seq', 1, false);
SELECT pg_catalog.setval('qwc_config.permissions_id_seq', 14, true);
SELECT pg_catalog.setval('qwc_config.registrable_groups_id_seq', 1, false);
SELECT pg_catalog.setval('qwc_config.registration_requests_id_seq', 1, false);
SELECT pg_catalog.setval('qwc_config.resources_id_seq', 17, true);
SELECT pg_catalog.setval('qwc_config.roles_id_seq', 2, true);
SELECT pg_catalog.setval('qwc_config.users_id_seq', 2, true);


ALTER TABLE ONLY qwc_config.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);
ALTER TABLE ONLY qwc_config.groups
    ADD CONSTRAINT groups_pk PRIMARY KEY (id);
ALTER TABLE ONLY qwc_config.last_update
    ADD CONSTRAINT last_update_pk PRIMARY KEY (updated_at);
ALTER TABLE ONLY qwc_config.users
    ADD CONSTRAINT name_unique UNIQUE (name);
ALTER TABLE ONLY qwc_config.permalinks
    ADD CONSTRAINT permalinks_pkey PRIMARY KEY (key);
ALTER TABLE ONLY qwc_config.permissions
    ADD CONSTRAINT permissions_pk PRIMARY KEY (id);
ALTER TABLE ONLY qwc_config.registrable_groups
    ADD CONSTRAINT registrable_groups_pk PRIMARY KEY (id);
ALTER TABLE ONLY qwc_config.registration_requests
    ADD CONSTRAINT registration_requests_pk PRIMARY KEY (id);
ALTER TABLE ONLY qwc_config.resource_types
    ADD CONSTRAINT resource_types_pk PRIMARY KEY (name);
ALTER TABLE ONLY qwc_config.resources
    ADD CONSTRAINT resources_pk PRIMARY KEY (id);
ALTER TABLE ONLY qwc_config.roles
    ADD CONSTRAINT roles_pk PRIMARY KEY (id);
ALTER TABLE ONLY qwc_config.user_bookmarks
    ADD CONSTRAINT user_bookmarks_pkey PRIMARY KEY (username, key);
ALTER TABLE ONLY qwc_config.user_infos
    ADD CONSTRAINT user_infos_pk PRIMARY KEY (user_id);
ALTER TABLE ONLY qwc_config.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);
ALTER TABLE ONLY qwc_config.groups_users
    ADD CONSTRAINT group_fk FOREIGN KEY (group_id) REFERENCES qwc_config.groups(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.groups_roles
    ADD CONSTRAINT group_fk FOREIGN KEY (group_id) REFERENCES qwc_config.groups(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.registrable_groups
    ADD CONSTRAINT group_fk FOREIGN KEY (group_id) REFERENCES qwc_config.groups(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.resources
    ADD CONSTRAINT parent_fk FOREIGN KEY (parent_id) REFERENCES qwc_config.resources(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.registration_requests
    ADD CONSTRAINT registrable_group_fk FOREIGN KEY (registrable_group_id) REFERENCES qwc_config.registrable_groups(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.permissions
    ADD CONSTRAINT resource_fk FOREIGN KEY (resource_id) REFERENCES qwc_config.resources(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.users_roles
    ADD CONSTRAINT role_fk FOREIGN KEY (role_id) REFERENCES qwc_config.roles(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.groups_roles
    ADD CONSTRAINT role_fk FOREIGN KEY (role_id) REFERENCES qwc_config.roles(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.permissions
    ADD CONSTRAINT role_fk FOREIGN KEY (role_id) REFERENCES qwc_config.roles(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.resources
    ADD CONSTRAINT type_fk FOREIGN KEY (type) REFERENCES qwc_config.resource_types(name) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.users_roles
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES qwc_config.users(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.groups_users
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES qwc_config.users(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.user_infos
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES qwc_config.users(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE ONLY qwc_config.registration_requests
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES qwc_config.users(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;

