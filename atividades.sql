--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: comum_documentacao; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_documentacao (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL,
    midia_id integer NOT NULL,
    projeto_id integer NOT NULL,
    tipo_id integer NOT NULL
);


--
-- Name: comum_documentacao_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_documentacao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_documentacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_documentacao_id_seq OWNED BY comum_documentacao.id;


--
-- Name: comum_equipe; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_equipe (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL
);


--
-- Name: comum_equipe_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_equipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_equipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_equipe_id_seq OWNED BY comum_equipe.id;


--
-- Name: comum_equipe_integrante; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_equipe_integrante (
    id integer NOT NULL,
    equipe_id integer NOT NULL,
    responsavel_id integer NOT NULL
);


--
-- Name: comum_equipe_integrante_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_equipe_integrante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_equipe_integrante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_equipe_integrante_id_seq OWNED BY comum_equipe_integrante.id;


--
-- Name: comum_fase; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_fase (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL
);


--
-- Name: comum_fase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_fase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_fase_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_fase_id_seq OWNED BY comum_fase.id;


--
-- Name: comum_midia; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_midia (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL,
    path character varying(128) NOT NULL,
    mime_type character varying(128)
);


--
-- Name: comum_midia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_midia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_midia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_midia_id_seq OWNED BY comum_midia.id;


--
-- Name: comum_papel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_papel (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL
);


--
-- Name: comum_papel_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_papel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_papel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_papel_id_seq OWNED BY comum_papel.id;


--
-- Name: comum_pessoa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_pessoa (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL,
    email character varying(256) NOT NULL,
    papel_id integer NOT NULL
);


--
-- Name: comum_pessoa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_pessoa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_pessoa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_pessoa_id_seq OWNED BY comum_pessoa.id;


--
-- Name: comum_projeto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_projeto (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL,
    fase_id integer NOT NULL,
    responsavel_id integer NOT NULL,
    solicitante_id integer NOT NULL
);


--
-- Name: comum_projeto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_projeto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_projeto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_projeto_id_seq OWNED BY comum_projeto.id;


--
-- Name: comum_responsavel; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_responsavel (
    cargo character varying(120) NOT NULL,
    matricula character varying(256),
    pessoa_ptr_id integer NOT NULL
);


--
-- Name: comum_status; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_status (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL
);


--
-- Name: comum_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_status_id_seq OWNED BY comum_status.id;


--
-- Name: comum_tipo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comum_tipo (
    id integer NOT NULL,
    nome character varying(120) NOT NULL,
    descricao text NOT NULL,
    excluido boolean NOT NULL
);


--
-- Name: comum_tipo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comum_tipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comum_tipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comum_tipo_id_seq OWNED BY comum_tipo.id;


--
-- Name: cron_basesdedados; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cron_basesdedados (
    id integer NOT NULL,
    descricao character varying(128) NOT NULL,
    host character varying(128) NOT NULL,
    usuario character varying(128) NOT NULL,
    senha character varying(128) NOT NULL,
    base character varying(128) NOT NULL,
    driver character varying(128) NOT NULL
);


--
-- Name: cron_basesdedados_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cron_basesdedados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cron_basesdedados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cron_basesdedados_id_seq OWNED BY cron_basesdedados.id;


--
-- Name: cron_cron; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cron_cron (
    id integer NOT NULL,
    descricao character varying(120) NOT NULL,
    commando text NOT NULL,
    data_inicio timestamp with time zone NOT NULL,
    repetir boolean NOT NULL,
    repeticoes integer NOT NULL,
    frequencia character varying(128) NOT NULL,
    excluido boolean NOT NULL,
    responsavel_id integer NOT NULL,
    status_id integer NOT NULL,
    base_de_dados_id integer NOT NULL
);


--
-- Name: cron_cron_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cron_cron_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cron_cron_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cron_cron_id_seq OWNED BY cron_cron.id;


--
-- Name: cron_cronograma; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cron_cronograma (
    id integer NOT NULL,
    descricao character varying(120) NOT NULL,
    data_inicio timestamp with time zone NOT NULL,
    data_fim timestamp with time zone NOT NULL,
    excluido boolean NOT NULL,
    projeto_id integer NOT NULL,
    status_id integer NOT NULL
);


--
-- Name: cron_cronograma_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cron_cronograma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cron_cronograma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cron_cronograma_id_seq OWNED BY cron_cronograma.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_admin_log (
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


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: tarefas_tarefa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tarefas_tarefa (
    id integer NOT NULL,
    titulo character varying(120) NOT NULL,
    descricao text NOT NULL,
    resposta text,
    data_previsao timestamp with time zone NOT NULL,
    data_inicio timestamp with time zone NOT NULL,
    data_fim timestamp with time zone,
    excluido boolean NOT NULL,
    projeto_id integer NOT NULL,
    responsavel_id integer NOT NULL,
    status_id integer NOT NULL
);


--
-- Name: tarefas_tarefa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tarefas_tarefa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tarefas_tarefa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tarefas_tarefa_id_seq OWNED BY tarefas_tarefa.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_documentacao ALTER COLUMN id SET DEFAULT nextval('comum_documentacao_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_equipe ALTER COLUMN id SET DEFAULT nextval('comum_equipe_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_equipe_integrante ALTER COLUMN id SET DEFAULT nextval('comum_equipe_integrante_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_fase ALTER COLUMN id SET DEFAULT nextval('comum_fase_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_midia ALTER COLUMN id SET DEFAULT nextval('comum_midia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_papel ALTER COLUMN id SET DEFAULT nextval('comum_papel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_pessoa ALTER COLUMN id SET DEFAULT nextval('comum_pessoa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_projeto ALTER COLUMN id SET DEFAULT nextval('comum_projeto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_status ALTER COLUMN id SET DEFAULT nextval('comum_status_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_tipo ALTER COLUMN id SET DEFAULT nextval('comum_tipo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cron_basesdedados ALTER COLUMN id SET DEFAULT nextval('cron_basesdedados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cron_cron ALTER COLUMN id SET DEFAULT nextval('cron_cron_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cron_cronograma ALTER COLUMN id SET DEFAULT nextval('cron_cronograma_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarefas_tarefa ALTER COLUMN id SET DEFAULT nextval('tarefas_tarefa_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add Status	7	add_status
20	Can change Status	7	change_status
21	Can delete Status	7	delete_status
22	Can add fase	8	add_fase
23	Can change fase	8	change_fase
24	Can delete fase	8	delete_fase
25	Can add tipo	9	add_tipo
26	Can change tipo	9	change_tipo
27	Can delete tipo	9	delete_tipo
28	Can add Papel	10	add_papel
29	Can change Papel	10	change_papel
30	Can delete Papel	10	delete_papel
31	Can add pessoa	11	add_pessoa
32	Can change pessoa	11	change_pessoa
33	Can delete pessoa	11	delete_pessoa
34	Can add Responsavel	12	add_responsavel
35	Can change Responsavel	12	change_responsavel
36	Can delete Responsavel	12	delete_responsavel
37	Can add projeto	13	add_projeto
38	Can change projeto	13	change_projeto
39	Can delete projeto	13	delete_projeto
40	Can add cronograma	14	add_cronograma
41	Can change cronograma	14	change_cronograma
42	Can delete cronograma	14	delete_cronograma
43	Can add cron	15	add_cron
44	Can change cron	15	change_cron
45	Can delete cron	15	delete_cron
46	Can add tarefa	16	add_tarefa
47	Can change tarefa	16	change_tarefa
48	Can delete tarefa	16	delete_tarefa
49	Can add midia	17	add_midia
50	Can change midia	17	change_midia
51	Can delete midia	17	delete_midia
52	Can add documentacao	18	add_documentacao
53	Can change documentacao	18	change_documentacao
54	Can delete documentacao	18	delete_documentacao
55	Can add Base de dados	19	add_basesdedados
56	Can change Base de dados	19	change_basesdedados
57	Can delete Base de dados	19	delete_basesdedados
58	Can add equipe	20	add_equipe
59	Can change equipe	20	change_equipe
60	Can delete equipe	20	delete_equipe
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_permission_id_seq', 60, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$ejRkrnsm3F1X$OXUY9i6Y9PmBT69tDweyTramQBDpuH3ITN7Fx0kWo+I=	2016-03-16 17:12:41.108573-03	t	admin			tercio@ifpi.edu.br	t	t	2016-03-10 16:45:20.60735-03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: comum_documentacao; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_documentacao (id, nome, descricao, excluido, midia_id, projeto_id, tipo_id) FROM stdin;
1	Ativando SSL no Apache	http://wiki.ubuntu-br.org/Apache2+SSL	f	1	7	3
2	Ativando SSL no Apache	Apache 2 com SSL (HTTPS)\r\n\r\nIntrodução\r\n\r\nSeguindo esse tutorial você irá habilitar o uso de conexão segura (https) no seu servidor Apache2 usando o módulo SSL, criando chaves pública e privada e configurando o apache para usá-las.\r\n\r\nEsse tutorial está assumindo que você instalou o Ubuntu Hardy Haron (8.10) versão Server, escolhendo a opção 'Instalar Servidor LAMP", apesar que pode ser útil em qualquer caso.\r\n\r\nInstalando pacotes adicionais\r\n\r\nVocê já tem Servidor Linux+Apache+MySQL+PHP com pouco esforço com o Ubuntu e ele resolve a maior parte das demandas. Vamos adicionar ao pacote a possibilidade que seja possível navegar pelo seu site com uma conexão segura, o 'https'. Para tanto, instale os pacotes adicionais para criar as chaves criptografadas.\r\n\r\nInstalando os pacotes necessários\r\n\r\nsudo apt-get install openssl ssl-cert\r\n\r\nHabilite o módulo SSL\r\n\r\nsudo a2enmod ssl\r\n\r\nCrie o certificado\r\n\r\nsudo openssl req $@ -new -x509 -days 365 -nodes -out /etc/apache2/apache.pem -keyout /etc/apache2/apache.pem\r\n\r\nDefina a permissão para o arquivo criado\r\n\r\nsudo chmod 600 /etc/apache2/apache.pem \r\n\r\nModifique o arquivo /etc/apache2/sites-available/ssl\r\n\r\nIremos instruí-lo a usar a porta 443, alterado e adicionando as seguintes linhas para habilitar o SSL ==\r\n\r\nNameVirtualHost *:443 \r\n<VirtualHost *:443 >\r\n        ServerAdmin webmaster@localhost \r\n        ...\r\n        CustomLog /var/log/apache2/access.log combined\r\n        SSLEngine on \r\n        ServerSignature On \r\n        SSLCertificateFile /etc/apache2/apache.pem\r\n\r\nHabilite o site com https\r\n\r\nsudo a2ensite ssl\r\n\r\nReinicie o Apache2\r\n\r\nsudo apache2ctl restart\r\n\r\nTestando\r\n\r\nVisitando https://localhost, a comunicação entre seu navegador e o servidor é criptografada.	f	1	7	1
\.


--
-- Name: comum_documentacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_documentacao_id_seq', 2, true);


--
-- Data for Name: comum_equipe; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_equipe (id, nome, descricao, excluido) FROM stdin;
1	DSI	Equipe de Desenvolvimento de Sistemas	f
\.


--
-- Name: comum_equipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_equipe_id_seq', 1, true);


--
-- Data for Name: comum_equipe_integrante; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_equipe_integrante (id, equipe_id, responsavel_id) FROM stdin;
1	1	8
2	1	1
3	1	3
4	1	5
5	1	7
\.


--
-- Name: comum_equipe_integrante_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_equipe_integrante_id_seq', 5, true);


--
-- Data for Name: comum_fase; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_fase (id, nome, descricao, excluido) FROM stdin;
3	ENCERRADO	Processo ENCERRADO	f
2	PERMANENTE	Processo PERMANENTE	f
1	NOVO	Processo NOVO	f
\.


--
-- Name: comum_fase_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_fase_id_seq', 3, true);


--
-- Data for Name: comum_midia; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_midia (id, nome, descricao, excluido, path, mime_type) FROM stdin;
1	Teste	Teste	f	teste	
\.


--
-- Name: comum_midia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_midia_id_seq', 1, true);


--
-- Data for Name: comum_papel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_papel (id, nome, descricao, excluido) FROM stdin;
1	Coordenação	Coordenação	f
2	Diretoria	Diretoria	f
3	Analista/Desenvolvedor	Analista/Desenvolvedor	f
4	Pro-reitoria	Pro-reitoria	f
5	Departamento	Departamento	f
\.


--
-- Name: comum_papel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_papel_id_seq', 5, true);


--
-- Data for Name: comum_pessoa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_pessoa (id, nome, descricao, excluido, email, papel_id) FROM stdin;
1	Tercio	Departamento de Sistemas	f	tercio@ifpi.edu.br	1
2	IFPI	IFPI	f	gabinete.reitoria@ifpi.edu.br	1
3	Gislene Pires	Coordenadora de Desenvolvimento de Sistemas	f	gislene.pires@ifpi.edu.br	1
4	DIRCOM	Diretoria de Comunicacao	f	comunicacao@ifpi.edu.br	2
5	Assunção	Analista de T.I	f	jose.assuncao@ifpi.edu.br	3
6	PROEN	Pro-Reitoria de Ensino	f	proen@ifpi.edu.br	4
7	Wellington Viana	Analista/Desenvolvedor	f	wellington.viana@ifpi.edu.br	3
8	Thiago Rabelo	Analista/Desenvolvedor	f	thiagorabelo@ifpi.edu.br	3
9	DSI	Departamento de Desenvolvimento de Sitemas	f	dsi.reitoria@ifpi.edu.br	5
\.


--
-- Name: comum_pessoa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_pessoa_id_seq', 9, true);


--
-- Data for Name: comum_projeto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_projeto (id, nome, descricao, excluido, fase_id, responsavel_id, solicitante_id) FROM stdin;
1	ICP-EDU	Implantação de serviço de certificação ICP para chaves criptografadas e acesso https.	f	1	1	2
2	Portal Institucional	Novo Portal Institucional em Plone	f	1	3	4
3	SUAP	Sistema Unificado de Administração Pública - SUAP - implantado no  IFPI em parceria com o IFRN	f	2	1	2
4	Q-Acadêmico	Sistema de controle acadêmico	f	2	5	6
5	RSC	Cadastro e upload de arquivos RSC em servidores	f	2	7	2
6	Sites	Projeto, configuração e desenvolvimento de websites	f	2	1	4
7	Desenvolvimento	Projeto de gerenciamento de atividades de Desenvolvimetno	f	2	1	9
\.


--
-- Name: comum_projeto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_projeto_id_seq', 7, true);


--
-- Data for Name: comum_responsavel; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_responsavel (cargo, matricula, pessoa_ptr_id) FROM stdin;
Analista	1747958	1
Analista de T.I.	2068812	3
Analista de T.I.	2177210	5
Analista de T.I		7
Analista de T.I		8
\.


--
-- Data for Name: comum_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_status (id, nome, descricao, excluido) FROM stdin;
1	Andamento	Andamento	f
2	Pendente do usuário	Pendência(s) do(s) Usuário(s)	f
3	Pendente DSI	Pendencias da DSI	f
4	Pendencias - DRT	Pendencias da DRT	f
5	Pendencias DTI	Pendencias da DTI	f
6	Ativo	Ativo	f
7	Inativo	Inativo	f
\.


--
-- Name: comum_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_status_id_seq', 7, true);


--
-- Data for Name: comum_tipo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY comum_tipo (id, nome, descricao, excluido) FROM stdin;
1	Codigo	Codigo	f
2	PDF	PDF	f
3	URL	URL	f
4	HTML	Html	f
\.


--
-- Name: comum_tipo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('comum_tipo_id_seq', 4, true);


--
-- Data for Name: cron_basesdedados; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cron_basesdedados (id, descricao, host, usuario, senha, base, driver) FROM stdin;
\.


--
-- Name: cron_basesdedados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cron_basesdedados_id_seq', 1, false);


--
-- Data for Name: cron_cron; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cron_cron (id, descricao, commando, data_inicio, repetir, repeticoes, frequencia, excluido, responsavel_id, status_id, base_de_dados_id) FROM stdin;
\.


--
-- Name: cron_cron_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cron_cron_id_seq', 1, false);


--
-- Data for Name: cron_cronograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY cron_cronograma (id, descricao, data_inicio, data_fim, excluido, projeto_id, status_id) FROM stdin;
\.


--
-- Name: cron_cronograma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('cron_cronograma_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-03-11 11:41:32.622288-03	1	Fase: NOVO	1	Adicionado.	8	1
2	2016-03-11 11:42:02.427874-03	1	Papel: Coordenação	1	Adicionado.	10	1
3	2016-03-11 11:42:09.708412-03	1	Responsavel: Tercio	1	Adicionado.	12	1
4	2016-03-11 11:42:28.351115-03	2	Pessoa: IFPI	1	Adicionado.	11	1
5	2016-03-11 11:42:29.679342-03	1	ICP-EDU	1	Adicionado.	13	1
6	2016-03-11 12:09:16.664172-03	3	Responsavel: Gislene Pires	1	Adicionado.	12	1
7	2016-03-11 12:09:46.147499-03	2	Papel: Diretoria	1	Adicionado.	10	1
8	2016-03-11 12:09:47.752553-03	4	Pessoa: DIRCOM	1	Adicionado.	11	1
9	2016-03-11 12:09:49.835576-03	2	Portal Institucional	1	Adicionado.	13	1
10	2016-03-11 12:11:03.800949-03	1	Status: Andamento	1	Adicionado.	7	1
11	2016-03-11 12:11:50.858289-03	2	Status: Pendente do usuário	1	Adicionado.	7	1
12	2016-03-11 16:49:36.544244-03	2	Fase: PERMANENTE	1	Adicionado.	8	1
13	2016-03-11 16:50:23.072457-03	3	SUAP	1	Adicionado.	13	1
14	2016-03-11 17:15:16.051983-03	3	Papel: Analista/Desenvolvedor	1	Adicionado.	10	1
15	2016-03-11 17:15:31.811888-03	5	Responsavel: Assunção	1	Adicionado.	12	1
16	2016-03-11 17:16:08.947896-03	4	Papel: Pro-reitoria	1	Adicionado.	10	1
17	2016-03-11 17:16:20.840051-03	6	Pessoa: PROEN	1	Adicionado.	11	1
18	2016-03-11 17:16:23.056864-03	4	Q-Acadêmico	1	Adicionado.	13	1
19	2016-03-11 17:37:21.805599-03	2	Configurar sincronismo LDAP	1	Adicionado.	16	1
20	2016-03-11 17:39:53.336871-03	3	Status: Pendente DSI	1	Adicionado.	7	1
21	2016-03-11 17:40:04.135888-03	4	Status: Pendencias - DRT	1	Adicionado.	7	1
22	2016-03-11 17:40:14.243338-03	5	Status: Pendencias DTI	1	Adicionado.	7	1
23	2016-03-11 17:40:46.096344-03	3	Fase: ENCERRADO	1	Adicionado.	8	1
24	2016-03-11 17:40:54.065637-03	2	Fase: PERMANENTE	2	Modificado descricao.	8	1
25	2016-03-11 17:41:01.114967-03	1	Fase: NOVO	2	Modificado descricao.	8	1
26	2016-03-11 17:41:54.242393-03	7	Responsavel: Wellington Viana	1	Adicionado.	12	1
27	2016-03-11 17:42:00.124043-03	5	RSC	1	Adicionado.	13	1
28	2016-03-11 17:42:30.009218-03	6	Sites	1	Adicionado.	13	1
29	2016-03-11 17:45:15.255371-03	5	Configurar site PROFMAT	1	Adicionado.	16	1
30	2016-03-11 17:46:10.216076-03	8	Responsavel: Thiago Rabelo	1	Adicionado.	12	1
31	2016-03-11 17:46:12.676018-03	1	Equipe: DSI	1	Adicionado.	20	1
32	2016-03-11 17:47:03.936031-03	2	Configurar sincronismo LDAP	2	Modificado data_previsao.	16	1
33	2016-03-11 17:48:27.286986-03	6	Status: Ativo	1	Adicionado.	7	1
34	2016-03-11 17:48:35.720036-03	7	Status: Inativo	1	Adicionado.	7	1
35	2016-03-11 17:52:53.514475-03	1	Tipo: Codigo	1	Adicionado.	9	1
36	2016-03-11 17:53:00.201071-03	2	Tipo: PDF	1	Adicionado.	9	1
37	2016-03-11 17:53:04.723544-03	3	Tipo: URL	1	Adicionado.	9	1
38	2016-03-11 17:53:13.650559-03	4	Tipo: HTML	1	Adicionado.	9	1
39	2016-03-11 17:54:43.647538-03	5	Papel: Departamento	1	Adicionado.	10	1
40	2016-03-11 17:54:45.615226-03	9	Pessoa: DSI	1	Adicionado.	11	1
41	2016-03-11 17:54:47.921438-03	7	Desenvolvimento	1	Adicionado.	13	1
42	2016-03-16 18:02:39.727615-03	2	Configurar sincronismo LDAP	2	Modificado status.	16	1
43	2016-03-16 18:11:54.721709-03	1	Midia: Teste	1	Adicionado.	17	1
44	2016-03-16 18:12:06.684998-03	1	Documentacao: Ativando SSL no Apache	1	Adicionado.	18	1
45	2016-03-16 18:12:16.638175-03	1	Documentacao: Ativando SSL no Apache	2	Nenhum campo modificado.	18	1
46	2016-03-16 18:13:45.097682-03	2	Documentacao: Ativando SSL no Apache	1	Adicionado.	18	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 46, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	comum	status
8	comum	fase
9	comum	tipo
10	comum	papel
11	comum	pessoa
12	comum	responsavel
13	comum	projeto
14	cron	cronograma
15	cron	cron
16	tarefas	tarefa
17	comum	midia
18	comum	documentacao
19	cron	basesdedados
20	comum	equipe
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_content_type_id_seq', 20, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-03-10 16:44:11.556516-03
2	auth	0001_initial	2016-03-10 16:44:12.624251-03
3	admin	0001_initial	2016-03-10 16:44:12.873749-03
4	admin	0002_logentry_remove_auto_add	2016-03-10 16:44:12.906902-03
5	contenttypes	0002_remove_content_type_name	2016-03-10 16:44:12.964856-03
6	auth	0002_alter_permission_name_max_length	2016-03-10 16:44:12.998291-03
7	auth	0003_alter_user_email_max_length	2016-03-10 16:44:13.023226-03
8	auth	0004_alter_user_username_opts	2016-03-10 16:44:13.043074-03
9	auth	0005_alter_user_last_login_null	2016-03-10 16:44:13.064726-03
10	auth	0006_require_contenttypes_0002	2016-03-10 16:44:13.073114-03
11	auth	0007_alter_validators_add_error_messages	2016-03-10 16:44:13.091675-03
12	comum	0001_initial	2016-03-10 16:44:14.1954-03
13	comum	0002_pessoa_papel	2016-03-10 16:44:14.395541-03
14	comum	0003_responsavel_matricula	2016-03-10 16:44:14.63701-03
15	comum	0004_auto_20160310_1625	2016-03-10 16:44:14.878839-03
16	cron	0001_initial	2016-03-10 16:44:15.286788-03
17	sessions	0001_initial	2016-03-10 16:44:15.519845-03
18	tarefas	0001_initial	2016-03-10 16:44:15.878191-03
19	comum	0005_remove_projeto_status	2016-03-10 16:48:01.694451-03
20	comum	0006_auto_20160311_1632	2016-03-11 16:32:27.686697-03
21	cron	0002_auto_20160311_1632	2016-03-11 16:32:27.936764-03
22	tarefas	0002_remove_tarefa_fase	2016-03-11 16:32:28.028176-03
23	comum	0007_auto_20160311_1639	2016-03-11 16:39:41.166276-03
24	cron	0003_basesdedados_driver	2016-03-11 16:39:41.354844-03
25	comum	0008_equipe	2016-03-11 17:11:15.810677-03
26	tarefas	0003_auto_20160311_1743	2016-03-11 17:43:56.343898-03
27	tarefas	0004_auto_20160311_1745	2016-03-11 17:45:08.050068-03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('django_migrations_id_seq', 27, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
69tdi8dvmgvun4j1tqhc6rg8esq6mo5f	M2U2ZGVhMmJkNTJiYzY5OTMwMDI3NWJjMWM4MDk1OTg2NTg0NmMwMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhMTQ2ZTM4YTQ0MzIwNjQ1NjcyZTg5Nzk1ZjM3MzVkMDhkZmE2OTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-25 18:03:51.050619-03
4uw3vvrup182r8c4j8u59g75ybywb31r	M2U2ZGVhMmJkNTJiYzY5OTMwMDI3NWJjMWM4MDk1OTg2NTg0NmMwMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjRhMTQ2ZTM4YTQ0MzIwNjQ1NjcyZTg5Nzk1ZjM3MzVkMDhkZmE2OTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-03-30 17:12:41.158775-03
\.


--
-- Data for Name: tarefas_tarefa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tarefas_tarefa (id, titulo, descricao, resposta, data_previsao, data_inicio, data_fim, excluido, projeto_id, responsavel_id, status_id) FROM stdin;
5	Configurar site PROFMAT	Configurar site do Programa de Mestrado Profissional - PROFMAT (Floriano)		2016-03-15 17:43:17-03	2016-03-07 17:43:18-03	\N	f	6	1	1
2	Configurar sincronismo LDAP	Configurar o sincronismo com o AD via Suap	Em desenvolvimento	2016-03-15 17:36:38-03	2016-03-07 17:36:45-03	2016-03-14 17:37:19-03	f	3	1	4
\.


--
-- Name: tarefas_tarefa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tarefas_tarefa_id_seq', 5, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: comum_documentacao_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_documentacao
    ADD CONSTRAINT comum_documentacao_pkey PRIMARY KEY (id);


--
-- Name: comum_equipe_integrante_equipe_id_c84c1141_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_equipe_integrante
    ADD CONSTRAINT comum_equipe_integrante_equipe_id_c84c1141_uniq UNIQUE (equipe_id, responsavel_id);


--
-- Name: comum_equipe_integrante_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_equipe_integrante
    ADD CONSTRAINT comum_equipe_integrante_pkey PRIMARY KEY (id);


--
-- Name: comum_equipe_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_equipe
    ADD CONSTRAINT comum_equipe_pkey PRIMARY KEY (id);


--
-- Name: comum_fase_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_fase
    ADD CONSTRAINT comum_fase_pkey PRIMARY KEY (id);


--
-- Name: comum_midia_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_midia
    ADD CONSTRAINT comum_midia_pkey PRIMARY KEY (id);


--
-- Name: comum_papel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_papel
    ADD CONSTRAINT comum_papel_pkey PRIMARY KEY (id);


--
-- Name: comum_pessoa_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_pessoa
    ADD CONSTRAINT comum_pessoa_pkey PRIMARY KEY (id);


--
-- Name: comum_projeto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_projeto
    ADD CONSTRAINT comum_projeto_pkey PRIMARY KEY (id);


--
-- Name: comum_responsavel_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_responsavel
    ADD CONSTRAINT comum_responsavel_pkey PRIMARY KEY (pessoa_ptr_id);


--
-- Name: comum_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_status
    ADD CONSTRAINT comum_status_pkey PRIMARY KEY (id);


--
-- Name: comum_tipo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comum_tipo
    ADD CONSTRAINT comum_tipo_pkey PRIMARY KEY (id);


--
-- Name: cron_basesdedados_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cron_basesdedados
    ADD CONSTRAINT cron_basesdedados_pkey PRIMARY KEY (id);


--
-- Name: cron_cron_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cron_cron
    ADD CONSTRAINT cron_cron_pkey PRIMARY KEY (id);


--
-- Name: cron_cronograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cron_cronograma
    ADD CONSTRAINT cron_cronograma_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: tarefas_tarefa_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tarefas_tarefa
    ADD CONSTRAINT tarefas_tarefa_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: comum_documentacao_57a3d45e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_documentacao_57a3d45e ON comum_documentacao USING btree (projeto_id);


--
-- Name: comum_documentacao_6c547f46; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_documentacao_6c547f46 ON comum_documentacao USING btree (midia_id);


--
-- Name: comum_documentacao_d3c0c18a; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_documentacao_d3c0c18a ON comum_documentacao USING btree (tipo_id);


--
-- Name: comum_equipe_integrante_472e1a89; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_equipe_integrante_472e1a89 ON comum_equipe_integrante USING btree (responsavel_id);


--
-- Name: comum_equipe_integrante_f69fe7a5; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_equipe_integrante_f69fe7a5 ON comum_equipe_integrante USING btree (equipe_id);


--
-- Name: comum_pessoa_15f9a1a8; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_pessoa_15f9a1a8 ON comum_pessoa USING btree (papel_id);


--
-- Name: comum_projeto_472e1a89; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_projeto_472e1a89 ON comum_projeto USING btree (responsavel_id);


--
-- Name: comum_projeto_5f721808; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_projeto_5f721808 ON comum_projeto USING btree (fase_id);


--
-- Name: comum_projeto_7e9f34ab; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX comum_projeto_7e9f34ab ON comum_projeto USING btree (solicitante_id);


--
-- Name: cron_cron_012fc5c3; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX cron_cron_012fc5c3 ON cron_cron USING btree (base_de_dados_id);


--
-- Name: cron_cron_472e1a89; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX cron_cron_472e1a89 ON cron_cron USING btree (responsavel_id);


--
-- Name: cron_cron_dc91ed4b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX cron_cron_dc91ed4b ON cron_cron USING btree (status_id);


--
-- Name: cron_cronograma_57a3d45e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX cron_cronograma_57a3d45e ON cron_cronograma USING btree (projeto_id);


--
-- Name: cron_cronograma_dc91ed4b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX cron_cronograma_dc91ed4b ON cron_cronograma USING btree (status_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: tarefas_tarefa_472e1a89; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX tarefas_tarefa_472e1a89 ON tarefas_tarefa USING btree (responsavel_id);


--
-- Name: tarefas_tarefa_57a3d45e; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX tarefas_tarefa_57a3d45e ON tarefas_tarefa USING btree (projeto_id);


--
-- Name: tarefas_tarefa_dc91ed4b; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX tarefas_tarefa_dc91ed4b ON tarefas_tarefa USING btree (status_id);


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comu_responsavel_id_52e5c95f_fk_comum_responsavel_pessoa_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_equipe_integrante
    ADD CONSTRAINT comu_responsavel_id_52e5c95f_fk_comum_responsavel_pessoa_ptr_id FOREIGN KEY (responsavel_id) REFERENCES comum_responsavel(pessoa_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comum_documentacao_midia_id_f5ff90f3_fk_comum_midia_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_documentacao
    ADD CONSTRAINT comum_documentacao_midia_id_f5ff90f3_fk_comum_midia_id FOREIGN KEY (midia_id) REFERENCES comum_midia(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comum_documentacao_projeto_id_9754552c_fk_comum_projeto_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_documentacao
    ADD CONSTRAINT comum_documentacao_projeto_id_9754552c_fk_comum_projeto_id FOREIGN KEY (projeto_id) REFERENCES comum_projeto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comum_documentacao_tipo_id_f47d905a_fk_comum_tipo_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_documentacao
    ADD CONSTRAINT comum_documentacao_tipo_id_f47d905a_fk_comum_tipo_id FOREIGN KEY (tipo_id) REFERENCES comum_tipo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comum_equipe_integrante_equipe_id_5486b490_fk_comum_equipe_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_equipe_integrante
    ADD CONSTRAINT comum_equipe_integrante_equipe_id_5486b490_fk_comum_equipe_id FOREIGN KEY (equipe_id) REFERENCES comum_equipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comum_pessoa_papel_id_9c932199_fk_comum_papel_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_pessoa
    ADD CONSTRAINT comum_pessoa_papel_id_9c932199_fk_comum_papel_id FOREIGN KEY (papel_id) REFERENCES comum_papel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comum_projeto_fase_id_017a35db_fk_comum_fase_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_projeto
    ADD CONSTRAINT comum_projeto_fase_id_017a35db_fk_comum_fase_id FOREIGN KEY (fase_id) REFERENCES comum_fase(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comum_projeto_solicitante_id_0c7e3280_fk_comum_pessoa_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_projeto
    ADD CONSTRAINT comum_projeto_solicitante_id_0c7e3280_fk_comum_pessoa_id FOREIGN KEY (solicitante_id) REFERENCES comum_pessoa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: comum_responsavel_pessoa_ptr_id_28e27247_fk_comum_pessoa_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comum_responsavel
    ADD CONSTRAINT comum_responsavel_pessoa_ptr_id_28e27247_fk_comum_pessoa_id FOREIGN KEY (pessoa_ptr_id) REFERENCES comum_pessoa(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cron_cron_base_de_dados_id_c5974284_fk_cron_basesdedados_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cron_cron
    ADD CONSTRAINT cron_cron_base_de_dados_id_c5974284_fk_cron_basesdedados_id FOREIGN KEY (base_de_dados_id) REFERENCES cron_basesdedados(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cron_cron_status_id_d914e820_fk_comum_status_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cron_cron
    ADD CONSTRAINT cron_cron_status_id_d914e820_fk_comum_status_id FOREIGN KEY (status_id) REFERENCES comum_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cron_cronograma_projeto_id_35b1cc27_fk_comum_projeto_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cron_cronograma
    ADD CONSTRAINT cron_cronograma_projeto_id_35b1cc27_fk_comum_projeto_id FOREIGN KEY (projeto_id) REFERENCES comum_projeto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cron_cronograma_status_id_03a99734_fk_comum_status_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cron_cronograma
    ADD CONSTRAINT cron_cronograma_status_id_03a99734_fk_comum_status_id FOREIGN KEY (status_id) REFERENCES comum_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cron_responsavel_id_424ece6a_fk_comum_responsavel_pessoa_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cron_cron
    ADD CONSTRAINT cron_responsavel_id_424ece6a_fk_comum_responsavel_pessoa_ptr_id FOREIGN KEY (responsavel_id) REFERENCES comum_responsavel(pessoa_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tare_responsavel_id_7daa3994_fk_comum_responsavel_pessoa_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarefas_tarefa
    ADD CONSTRAINT tare_responsavel_id_7daa3994_fk_comum_responsavel_pessoa_ptr_id FOREIGN KEY (responsavel_id) REFERENCES comum_responsavel(pessoa_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tarefas_tarefa_projeto_id_fa14495d_fk_comum_projeto_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarefas_tarefa
    ADD CONSTRAINT tarefas_tarefa_projeto_id_fa14495d_fk_comum_projeto_id FOREIGN KEY (projeto_id) REFERENCES comum_projeto(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tarefas_tarefa_status_id_e71f7fc9_fk_comum_status_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tarefas_tarefa
    ADD CONSTRAINT tarefas_tarefa_status_id_e71f7fc9_fk_comum_status_id FOREIGN KEY (status_id) REFERENCES comum_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

