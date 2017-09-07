--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2016-08-01 10:35:00 GYT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 11 (class 2615 OID 20360)
-- Name: permisos; Type: SCHEMA; Schema: -; Owner: useruptos
--

CREATE SCHEMA permisos;


ALTER SCHEMA permisos OWNER TO useruptos;

SET search_path = permisos, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 217 (class 1259 OID 20361)
-- Name: denuncia_seguimiento; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE denuncia_seguimiento (
    id_seguimiento integer NOT NULL,
    fecha_visita timestamp without time zone,
    id_funcionarioatencion character varying(100),
    id_dependencia character varying(100),
    observaciones text,
    respuesta text,
    id_denuncia integer
);


ALTER TABLE denuncia_seguimiento OWNER TO useruptos;

--
-- TOC entry 218 (class 1259 OID 20367)
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE; Schema: permisos; Owner: useruptos
--

CREATE SEQUENCE denuncia_seguimiento_id_seguimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE denuncia_seguimiento_id_seguimiento_seq OWNER TO useruptos;

--
-- TOC entry 2216 (class 0 OID 0)
-- Dependencies: 218
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE denuncia_seguimiento_id_seguimiento_seq OWNED BY denuncia_seguimiento.id_seguimiento;


--
-- TOC entry 219 (class 1259 OID 20369)
-- Name: denuncias_ausencias; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE denuncias_ausencias (
    id_denuncia integer NOT NULL,
    id_funcionario character varying(100),
    id_dependencia character varying(100),
    fecha_denuncia date,
    dias_ausencia integer,
    id_jefeinmediato character varying(100),
    observaciones text,
    respuesta text,
    fecha_respuesta date,
    estatus character varying(255)
);


ALTER TABLE denuncias_ausencias OWNER TO useruptos;

--
-- TOC entry 220 (class 1259 OID 20375)
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE; Schema: permisos; Owner: useruptos
--

CREATE SEQUENCE denuncias_ausencias_id_denuncia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE denuncias_ausencias_id_denuncia_seq OWNER TO useruptos;

--
-- TOC entry 2217 (class 0 OID 0)
-- Dependencies: 220
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE denuncias_ausencias_id_denuncia_seq OWNED BY denuncias_ausencias.id_denuncia;


--
-- TOC entry 221 (class 1259 OID 20377)
-- Name: dias_feriados; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE dias_feriados (
    id_diaferiado integer NOT NULL,
    fecha date NOT NULL,
    tipo_fecha character varying(100),
    motivo character varying(255),
    estatus integer,
    jornada character varying(10),
    id_tipo_personal1 integer,
    id_tipo_personal character varying(10)
);


ALTER TABLE dias_feriados OWNER TO useruptos;

--
-- TOC entry 2218 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN dias_feriados.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN dias_feriados.estatus IS '0=Inactivo
1=Activo';


--
-- TOC entry 2219 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN dias_feriados.id_tipo_personal1; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN dias_feriados.id_tipo_personal1 IS '1=Administrativo
2=Docente
3=Obrero';


--
-- TOC entry 222 (class 1259 OID 20380)
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE; Schema: permisos; Owner: useruptos
--

CREATE SEQUENCE dias_feriados_id_diaferiado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dias_feriados_id_diaferiado_seq OWNER TO useruptos;

--
-- TOC entry 2220 (class 0 OID 0)
-- Dependencies: 222
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE dias_feriados_id_diaferiado_seq OWNED BY dias_feriados.id_diaferiado;


--
-- TOC entry 223 (class 1259 OID 20382)
-- Name: periodo; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE periodo (
    id_periodo integer NOT NULL,
    nombre_periodo character varying(255),
    fecha_inicio date,
    fecha_cierre date,
    fecha_recaudo_ini date,
    fecha_recaudo_fin date,
    id_jefe_personal character varying(100),
    id_jefezona character varying(100),
    estatus integer,
    observacion text
);


ALTER TABLE periodo OWNER TO useruptos;

--
-- TOC entry 2221 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN periodo.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN periodo.estatus IS '1=Activo
0=Inactivo';


--
-- TOC entry 224 (class 1259 OID 20388)
-- Name: periodo_id_periodo_seq; Type: SEQUENCE; Schema: permisos; Owner: useruptos
--

CREATE SEQUENCE periodo_id_periodo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE periodo_id_periodo_seq OWNER TO useruptos;

--
-- TOC entry 2222 (class 0 OID 0)
-- Dependencies: 224
-- Name: periodo_id_periodo_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE periodo_id_periodo_seq OWNED BY periodo.id_periodo;


--
-- TOC entry 225 (class 1259 OID 20390)
-- Name: permisos; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE permisos (
    id_permiso integer NOT NULL,
    id_funcionario character varying(100),
    fecha_permiso date,
    numero_dias integer,
    motivo_permiso character varying(255),
    fecha_desde date,
    fecha_hasta date,
    fecha_recepcion timestamp without time zone,
    id_tipopermiso integer,
    observacion text,
    id_jefeinmediato character varying(100),
    numero_solicitud character varying(100),
    estatus character varying(100),
    estatus_observacion text
);


ALTER TABLE permisos OWNER TO useruptos;

--
-- TOC entry 2223 (class 0 OID 0)
-- Dependencies: 225
-- Name: COLUMN permisos.id_jefeinmediato; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN permisos.id_jefeinmediato IS 'extraido de la consulta a BD zees';


--
-- TOC entry 226 (class 1259 OID 20396)
-- Name: permisos_id_permiso_seq; Type: SEQUENCE; Schema: permisos; Owner: useruptos
--

CREATE SEQUENCE permisos_id_permiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE permisos_id_permiso_seq OWNER TO useruptos;

--
-- TOC entry 2224 (class 0 OID 0)
-- Dependencies: 226
-- Name: permisos_id_permiso_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE permisos_id_permiso_seq OWNED BY permisos.id_permiso;


--
-- TOC entry 227 (class 1259 OID 20398)
-- Name: tipo_permiso; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE tipo_permiso (
    id_tipopermiso integer NOT NULL,
    tipo_permiso integer,
    nombre_tipo character varying(255),
    numero_dias character varying(20),
    reglas_legal text,
    recaudos text,
    id_tipo_personal integer,
    fecha_registro date,
    estatus character varying(20)
);


ALTER TABLE tipo_permiso OWNER TO useruptos;

--
-- TOC entry 228 (class 1259 OID 20404)
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE; Schema: permisos; Owner: useruptos
--

CREATE SEQUENCE tipo_permiso_id_tipopermiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_permiso_id_tipopermiso_seq OWNER TO useruptos;

--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 228
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE tipo_permiso_id_tipopermiso_seq OWNED BY tipo_permiso.id_tipopermiso;


--
-- TOC entry 229 (class 1259 OID 20406)
-- Name: usuario; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    login_usuario character varying(15),
    password_usuario character varying(15),
    id_funcionario character varying(64),
    fecha_ultimo_acceso timestamp without time zone,
    tipo_usuario character varying(20),
    rol_usuario character varying(20),
    estatus_usuario character varying(10),
    id_dependencia text
);


ALTER TABLE usuario OWNER TO useruptos;

--
-- TOC entry 230 (class 1259 OID 20412)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: permisos; Owner: useruptos
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO useruptos;

--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 230
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 231 (class 1259 OID 20414)
-- Name: vacaciones; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE vacaciones (
    id_vacaciones integer NOT NULL,
    fecha_solicitud date,
    id_funcionario character varying(100),
    tipo_personal character varying(100),
    cargo_funcional character varying(255),
    numero_dias integer,
    fecha_desde date,
    fecha_hasta date,
    id_periodo integer,
    fecha_retorno date,
    observacion text,
    id_jefeinmediato character varying(100),
    id_jefepersonal character varying(100),
    id_municipio character varying(100),
    id_dependencialaboral character varying(100),
    tipo_vacaciones integer,
    estatus integer,
    condicion_laboral integer
);


ALTER TABLE vacaciones OWNER TO useruptos;

--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN vacaciones.tipo_personal; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.tipo_personal IS '1=Administrativo
2=Docente
3=Obrero';


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN vacaciones.tipo_vacaciones; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.tipo_vacaciones IS '1=Regulares
2=Atrasadas';


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN vacaciones.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.estatus IS '1=Pendiente
2=Aprobado
3=Rechazado';


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 231
-- Name: COLUMN vacaciones.condicion_laboral; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.condicion_laboral IS '1.- Contratado
2.- Fijo';


--
-- TOC entry 232 (class 1259 OID 20420)
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE; Schema: permisos; Owner: useruptos
--

CREATE SEQUENCE vacaciones_id_vacaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vacaciones_id_vacaciones_seq OWNER TO useruptos;

--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 232
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE vacaciones_id_vacaciones_seq OWNED BY vacaciones.id_vacaciones;


--
-- TOC entry 233 (class 1259 OID 20422)
-- Name: vista_funcionario; Type: VIEW; Schema: permisos; Owner: useruptos
--

CREATE VIEW vista_funcionario AS
 SELECT ed.empleado_dep_uid,
    p.persona_uid,
    p.persona_cedula,
    btrim((((COALESCE(p.persona_apellidos, ''::character varying))::text || ' '::text) || (COALESCE(p.persona_nombres, ''::character varying))::text)) AS apellidos_nombres,
    p.persona_apellidos,
    p.persona_nombres,
    COALESCE(plan.pl_nombre, fd.dependencia_nombre, d.dependencia_nombre) AS dependencia_labora,
    COALESCE(fc.funcion_cargo_descripcion, c.cargo_denominacion) AS cargo_labora,
    car.categoria_cargo_descripcion,
    c.cargo_codigo,
    c.cargo_denominacion,
    upper((m.municipio_nombre)::text) AS municipio_nombre
   FROM ((((((((((comun.persona p
     LEFT JOIN comun.empleado e ON ((e.empleado_persona = p.persona_cedula)))
     LEFT JOIN comun.empleado_dependencia ed ON (((ed.empleado_dep_empleado)::text ~~ (e.empleado_uid)::text)))
     LEFT JOIN comun.dependencia d ON (((d.dependencia_uid)::text = (ed.empleado_dep_dependencia)::text)))
     LEFT JOIN comun.dependencia fd ON (((fd.dependencia_uid)::text = (ed.empleado_dep_dependencia_lab)::text)))
     LEFT JOIN comun.planteles plan ON (((plan.pl_estadistico)::text = (ed.empleado_dep_dependencia_lab)::text)))
     LEFT JOIN comun.cargo c ON (((c.cargo_codigo)::text = (ed.empleado_dep_codigocargo)::text)))
     LEFT JOIN comun.municipio m ON ((m.municipio_codigo = d.dependencia_municipio)))
     LEFT JOIN comun.estado et ON ((et.estado_codigo = m.municipio_estado)))
     LEFT JOIN comun.categoria_cargo car ON (((car.categoria_cargo_uid)::text = (c.cargo_categoria)::text)))
     LEFT JOIN comun.funcion_cargo fc ON (((fc.funcion_cargo_uid)::text = (ed.empleado_dep_cargofuncional)::text)))
  ORDER BY p.persona_cedula, ed.empleado_dep_serial DESC;


ALTER TABLE vista_funcionario OWNER TO useruptos;

--
-- TOC entry 2060 (class 2604 OID 20427)
-- Name: id_seguimiento; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY denuncia_seguimiento ALTER COLUMN id_seguimiento SET DEFAULT nextval('denuncia_seguimiento_id_seguimiento_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 20428)
-- Name: id_denuncia; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY denuncias_ausencias ALTER COLUMN id_denuncia SET DEFAULT nextval('denuncias_ausencias_id_denuncia_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 20429)
-- Name: id_diaferiado; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY dias_feriados ALTER COLUMN id_diaferiado SET DEFAULT nextval('dias_feriados_id_diaferiado_seq'::regclass);


--
-- TOC entry 2063 (class 2604 OID 20430)
-- Name: id_periodo; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY periodo ALTER COLUMN id_periodo SET DEFAULT nextval('periodo_id_periodo_seq'::regclass);


--
-- TOC entry 2064 (class 2604 OID 20431)
-- Name: id_permiso; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY permisos ALTER COLUMN id_permiso SET DEFAULT nextval('permisos_id_permiso_seq'::regclass);


--
-- TOC entry 2065 (class 2604 OID 20432)
-- Name: id_tipopermiso; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY tipo_permiso ALTER COLUMN id_tipopermiso SET DEFAULT nextval('tipo_permiso_id_tipopermiso_seq'::regclass);


--
-- TOC entry 2066 (class 2604 OID 20433)
-- Name: id_usuario; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2067 (class 2604 OID 20434)
-- Name: id_vacaciones; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY vacaciones ALTER COLUMN id_vacaciones SET DEFAULT nextval('vacaciones_id_vacaciones_seq'::regclass);


--
-- TOC entry 2196 (class 0 OID 20361)
-- Dependencies: 217
-- Data for Name: denuncia_seguimiento; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY denuncia_seguimiento (id_seguimiento, fecha_visita, id_funcionarioatencion, id_dependencia, observaciones, respuesta, id_denuncia) FROM stdin;
\.


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 218
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('denuncia_seguimiento_id_seguimiento_seq', 1, false);


--
-- TOC entry 2198 (class 0 OID 20369)
-- Dependencies: 219
-- Data for Name: denuncias_ausencias; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY denuncias_ausencias (id_denuncia, id_funcionario, id_dependencia, fecha_denuncia, dias_ausencia, id_jefeinmediato, observaciones, respuesta, fecha_respuesta, estatus) FROM stdin;
\.


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 220
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('denuncias_ausencias_id_denuncia_seq', 1, false);


--
-- TOC entry 2200 (class 0 OID 20377)
-- Dependencies: 221
-- Data for Name: dias_feriados; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY dias_feriados (id_diaferiado, fecha, tipo_fecha, motivo, estatus, jornada, id_tipo_personal1, id_tipo_personal) FROM stdin;
2	2016-04-19	1	Proclamación de la independencia de Venezuela	1	1	\N	1-2-3
8	2016-01-06	4	Día de Reyes y día del deporte.	1	1	\N	1-2-3
9	2016-07-05	1	Declaración de la Independencia de Venezuela (1811).	1	1	\N	1-2-3
12	2016-10-12	1	Día de la Resistencia Indígena (1492).	1	1	\N	1-2-3
13	2016-02-08	4	Asuesto de Carnaval	1	1	\N	1-2-3
7	2016-01-03	4	Asueto Navideño	1	1	\N	1-2-3
6	2016-01-02	1	Asueto Navideño	1	1	\N	1-2-3
5	2016-01-01	4	Año Nuevo	1	1	\N	1-2-3
14	2016-01-04	4	Asueto Navideño	1	1	\N	1-2-3
15	2016-01-05	4	Asueto Navideño	1	1	\N	1-2-3
16	2016-02-09	1	Asuesto de Carnaval	1	1	\N	1-2-3
19	2016-03-21	4	Semana Santa	1	1	\N	1-2-3
20	2016-03-22	4	Semana Santa	1	1	\N	1-2-3
21	2016-03-23	4	Semana Santa	1	1	\N	1-2-3
22	2016-05-01	5	Día del Trabajador	1	1	\N	1-2-3
17	2016-03-24	5	Semana Santa - Jueves Santo	1	1	\N	1-2-3
18	2016-03-25	5	Semana Santa - Viernes Santo	1	1	\N	1-2-3
25	2016-12-31	5	Fin de Año	1	1	\N	1-2-3
26	2016-06-24	5	Batalla de Carabobo	1	1	\N	1-2-3
27	2016-07-24	1	Natalicio del Libertador Simón Bolívar	1	1	\N	1-2-3
23	2016-12-24	5	Víspera de Navidad	1	1	\N	1-2-3
24	2016-12-25	5	Navidad	1	1	\N	1-2-3
28	2016-09-04	4	Día del Personal Administrativo	1	1	\N	1--
\.


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 222
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('dias_feriados_id_diaferiado_seq', 28, true);


--
-- TOC entry 2202 (class 0 OID 20382)
-- Dependencies: 223
-- Data for Name: periodo; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY periodo (id_periodo, nombre_periodo, fecha_inicio, fecha_cierre, fecha_recaudo_ini, fecha_recaudo_fin, id_jefe_personal, id_jefezona, estatus, observacion) FROM stdin;
2	PERIODO 2016-I VIII CONT COLECTIVA	2015-09-16	2016-08-16	2015-09-15	2015-12-15			0	
1	PERIODO ESCOLAR 2015-2016	2015-09-01	2016-08-31	2015-12-15	2016-01-15			1	
\.


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 224
-- Name: periodo_id_periodo_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('periodo_id_periodo_seq', 5, true);


--
-- TOC entry 2204 (class 0 OID 20390)
-- Dependencies: 225
-- Data for Name: permisos; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY permisos (id_permiso, id_funcionario, fecha_permiso, numero_dias, motivo_permiso, fecha_desde, fecha_hasta, fecha_recepcion, id_tipopermiso, observacion, id_jefeinmediato, numero_solicitud, estatus, estatus_observacion) FROM stdin;
1	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2016-03-28	2	expo	2016-04-04	2016-04-05	2016-03-28 00:00:00	155	expo	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	\N	\N	\N
2	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2016-04-01	3	expo de proyecto	2016-04-11	2016-04-13	2016-04-26 02:37:51	155	expo de proyecto	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	\N	\N	\N
3	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2016-04-06	1	dolor de cabeza	2016-04-05	2016-04-06	2016-04-26 04:13:09	105	dolor de cabeza	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	\N	\N	\N
4	TRyS3ADv-bdWm-AH9e-gpRJ-Qw12Ulb1Vvda	2016-04-06	1	expro de proyecto	2016-04-18	2016-04-22	2016-04-27 10:17:57	155	expro de proyecto	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	\N	\N	\N
5	TRyS3ADv-bdWm-AH9e-gpRJ-Qw12Ulb1Vvda	2016-04-01	5	expo de proyecto	2016-04-11	2016-04-14	2016-04-27 10:37:43	154	expo de proyecto	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	\N	\N	\N
6	TRyS3ADv-bdWm-AH9e-gpRJ-Qw12Ulb1Vvda	2016-07-01	1	consulta medica	2016-07-04	2016-07-04	2016-07-03 10:26:15	105	consulta medica	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	\N	\N	\N
7	vA7bNR1A-Vsf3-cVmQ-pnV9-vNvZoMiSMLGn	2016-07-12	1	viaje a plc	2016-07-22	2016-07-22	2016-07-13 03:50:03	156	viaje a plc	NEHFKVKC-khgu-rNii-jNbC-z67xrujUip7d	57869b6bcb053	\N	\N
8	1aGExLXw-40Ov-vrGl-u8p2-SgBfDzPvwwoY	2016-07-15	1	Caminata 5K Cumaná 500	2016-07-18	2016-07-18	2016-07-15 09:58:45	107	Caminata 5K Cumaná 500	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5788ec15d105e	\N	\N
9	ub4nuFO3-hFwN-qQbR-U0a0-hUKc9I9xE4y8	2016-07-15	1	partido de futbolito	2016-07-18	2016-07-19	2016-07-15 10:50:48	107	partido de futbolito	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5788f848948de	\N	\N
10	vA7bNR1A-Vsf3-cVmQ-pnV9-vNvZoMiSMLGn	2016-07-15	2	viaje	2016-07-26	2016-07-27	2016-07-15 10:54:03	156	viaje	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5788f90b5b571	\N	\N
11	1aGExLXw-40Ov-vrGl-u8p2-SgBfDzPvwwoY	2016-07-22	2	Juegos del Personal Docente	2016-07-25	2016-07-26	2016-07-23 12:27:05	107	Juegos del Personal Docente	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	57939ad9cb7e8	\N	\N
12	ub4nuFO3-hFwN-qQbR-U0a0-hUKc9I9xE4y8	2016-07-23	1	juego de futbolito	2016-07-29	2016-07-29	2016-07-23 01:03:25	107	juego de futbolito	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5793a35d0473f	\N	\N
13	8nuLmfAF-nINZ-XMUS-etSF-gcKOBzgDEjNd	2016-07-22	2	evento religioso	2016-07-27	2016-07-28	2016-07-23 01:06:02	156	evento religioso	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5793a3fa7b890	\N	\N
14	WpZ1durh-QZO5-gizu-xyUa-CtRCduQu8839	2016-07-12	3	Fallecimiento de Padre	2016-07-11	2016-07-21	2016-07-23 01:07:29	106	Fallecimiento de Padre	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5793a4512ae90	\N	\N
15	trBCRhTY-Fwpx-VZv8-FyXL-j1tkW2gUQvF6	2016-07-15	3	Consulta del Padre en Caracas	2016-07-18	2016-07-21	2016-07-23 02:57:05	151	Consulta del Padre en Caracas	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5793be01dddbf	\N	\N
16	vA7bNR1A-Vsf3-cVmQ-pnV9-vNvZoMiSMLGn	2016-07-21	3	viaje	2016-04-25	2016-04-27	2016-07-23 03:17:35	361	viaje	NEHFKVKC-khgu-rNii-jNbC-z67xrujUip7d	5793c2cfeed48	\N	\N
17	8BAzAKsY-Aixy-m2XM-19qD-gMiam0FzGF3X	2016-07-08	1	examen en la upel	2016-07-12	2016-07-12	2016-07-23 09:06:31	255	examen en la upel	pJWbiK23-o1tr-kAS9-TnKC-t3k5SUeYKZm8	57941497860b6	\N	\N
18	3UAXETmt-hS18-LoIw-Zdz2-A7h363veSPvI	2016-07-14	1	ir a alcaldia	2016-07-14	2016-07-14	2016-07-23 09:07:38	256	ir a alcaldia	pJWbiK23-o1tr-kAS9-TnKC-t3k5SUeYKZm8	579414da340c4	\N	\N
19	Vz18gKRb-rg1i-yR6u-efnU-tL5zmGMVvbsz	2016-07-11	3	congreso pedagogico en maturin	2016-07-18	2016-07-20	2016-07-23 09:08:50	259	congreso pedagogico en maturin	pJWbiK23-o1tr-kAS9-TnKC-t3k5SUeYKZm8	579415229aa84	\N	\N
20	cM352LxE-1eWY-vTio-h4ZD-32xuH4MzXO0s	2016-07-04	2	caminata 10k	2016-07-06	2016-07-07	2016-07-23 09:10:03	107	caminata 10k	pJWbiK23-o1tr-kAS9-TnKC-t3k5SUeYKZm8	5794156b327d9	\N	\N
21	azutofq0-WRTf-nvqs-IAyp-0JKxwMndwDBX	2016-07-14	2	resfriado	2016-07-14	2016-07-15	2016-07-23 09:10:51	205	resfriado	pJWbiK23-o1tr-kAS9-TnKC-t3k5SUeYKZm8	5794159b92fb5	\N	\N
22	VcHYvr93-Eboz-SikD-tyIy-AwOlcglN4SWi	2016-07-18	2	predefensa de proyecto	2016-07-20	2016-07-21	2016-07-24 10:25:10	155	predefensa de proyecto	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5794cfc63c011	\N	\N
23	zlfWScUT-UvSv-gbe5-ZoON-yUqmaxIumHQm	2016-07-06	3	Viaje personal a mariguitar	2016-07-06	2016-07-08	2016-07-24 10:26:08	156	Viaje personal a mariguitar	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5794d00006efb	\N	\N
24	0tJPTUJL-6Pau-schz-GGsA-Qsnya56NnUCW	2016-07-11	1	Congreso en PLC	2016-07-14	2016-07-14	2016-07-24 10:26:57	259	Congreso en PLC	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5794d0318c222	\N	\N
25	RuzwyHFQ-Rhpl-m6si-b6DA-PTktZdlY24hF	2016-07-04	2	Seminario FE2016	2016-07-11	2016-07-12	2016-07-24 10:27:47	158	Seminario FE2016	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5794d0638ca84	\N	\N
26	BLDS2o2T-rEgp-rp1o-jh9D-cm4g1mrnZTct	2016-07-05	1	seminario	2016-07-07	2016-07-07	2016-07-24 12:56:55	158	seminario	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5794f3574942e	\N	\N
27	vA7bNR1A-Vsf3-cVmQ-pnV9-vNvZoMiSMLGn	2016-07-01	14	nacimiento de hijo	2016-06-01	2016-06-21	2016-07-25 12:07:12	304	nacimiento de hijo	4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26	57959070d5c5e	\N	\N
28	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2016-07-01	14	hijo	2016-07-01	2016-07-20	2016-07-25 01:04:39	104	hijo	4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26	57959de7df6b4	\N	\N
29	trBCRhTY-Fwpx-VZv8-FyXL-j1tkW2gUQvF6	2016-07-18	8	MATRIMONIO	2016-07-18	2016-07-27	2016-07-25 05:56:13	101	MATRIMONIO	4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26	5795e23d7f5e8	\N	\N
30	vA7bNR1A-Vsf3-cVmQ-pnV9-vNvZoMiSMLGn	2016-06-27	20	Capacitación SocioPolítica Cuba2016	2016-07-11	2016-08-05	2016-07-25 06:12:32	358	Capacitación SocioPolítica Cuba2016	SCyLu9eu-Fvcr-v1X8-MN9N-q1gDskyLMvz7	5795e61077a06	\N	\N
31	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2016-07-26	3	conferencia de robotica en nueva esparta	2016-04-27	2016-04-29	2016-07-26 08:05:50	159	conferencia de robotica en nueva esparta	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5797521ed7649	\N	\N
32	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2016-07-25	5	conferencioa de robotica en plc	2016-05-02	2016-05-06	2016-07-26 08:08:32	159	conferencioa de robotica en plc	4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26	579752c04111f	\N	\N
33	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2016-07-25	20	Curso de Certificación Eletrónica en Suscerte CCS	2016-08-08	2016-09-02	2016-07-26 08:12:08	154	Curso de Certificación Eletrónica en Suscerte CCS	SCyLu9eu-Fvcr-v1X8-MN9N-q1gDskyLMvz7	57975398bf099	\N	\N
34	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2016-07-26	3	otro	2016-07-26	2016-07-28	2016-07-26 01:47:00	161	otro	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	5797a214de71c	\N	\N
\.


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 226
-- Name: permisos_id_permiso_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('permisos_id_permiso_seq', 34, true);


--
-- TOC entry 2206 (class 0 OID 20398)
-- Dependencies: 227
-- Data for Name: tipo_permiso; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY tipo_permiso (id_tipopermiso, tipo_permiso, nombre_tipo, numero_dias, reglas_legal, recaudos, id_tipo_personal, fecha_registro, estatus) FROM stdin;
151	2	Enfermedad Familiar	xxC	lot	Informe Médico	1	2016-05-05	1
251	2	Enfermedad Familiar	xxC	lot	informe médico	2	2016-05-05	1
308	1	Comparecencia obligatoria ante una autoridad	xxC	LOT	exposición de motivos	3	2016-04-07	1
351	2	Enfermedad Familiar	xxC	LOT	informe médico	3	2016-05-05	1
1001	1	Cuido (Familiares hasta 4º grado de consanguinidad)	8H	POR CUIDO, SEGÚN LA CLÁUSULA 38 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES ADMINISTRATIVO.	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PARTIDA DE NACIMIENTO, ORIGINAL Y COPIA DEL PERMISO AVALADO POR IPASME	1	2016-07-01	0
105	1	Enfermedad	3C	LOT, LEY SEGURO SOCIAL	cedula, copia de vauche. constancia de trabajo, informe medico 	1	2016-06-01	1
106	1	Fallecimiento de Familiar	9H	POR DEFUNCIÓN; SEGÚN LA CLAUSULA 72 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES ADMINISTRATIVOS DEL MPPE	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE DEFUNCIÓN. 	1	2016-07-01	1
153	2	Siniestro	xxC	lot	Informe Médico	1	2016-05-05	1
1003	1	Cuido (Familiares hasta 4º grado de consanguinidad)	8C	POR CUIDO SEGÚN LA CLAUSULA TRIGÉSIMA SEXTA PERMISOS ESPECIALES DE LA CONVENCIÓN COLECTIVA DE TRABAJO BOLIVARIANA, SOCIALISTA Y REVOLUCIONARIA DE LOS TRABAJADORES Y TRABAJADORAS EDUCACIONALES DEPENDIENTES DEL MPPE 2013-2015.	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PARTIDA DE NACIMIENTO, ORIGINAL Y COPIA DEL PERMISO AVALADO POR IPASME	3	2016-07-01	0
1002	1	Cuido (Padres, Hijos, Esposo (a))	15H	POR CUIDO, SEGÚN CLÁUSULA 90 DEL SEGUNDO CONTRATO COLECTIVO DE LOS TRABAJADORES DE LA EDUCACIÓN	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, ORIGINAL Y COPIA DEL PERMISO AVALADO POR IPASME	2	2016-07-01	0
108	1	Comparecencia obligatoria ante una autoridad	xxC	LOT	Informe Médico	1	2016-05-05	1
253	2	Siniestro	xxC	lot	Informe Médico	2	2016-05-05	1
152	2	Accidente Grave Familiar	xxC	lot	informe médico	1	2016-05-05	1
352	2	Accidente Grave Familiar	xxC	lot	Informe Médico	3	2016-05-05	1
353	2	Siniestro	xxC	LOT	Informe Médico	3	2016-05-05	1
107	1	Participación activa en evento deportivo	xxC	lot, contrto colectivo	cedula, informe sobre el evento	1	2016-05-04	1
102	1	Reposo prenatal (50 días hábiles)	50H	POR PRE Y POST-NATAL DE CONFORMIDAD CON LO ESTABLECIDO EN EL TITULO VI, ARTICULO Nº 336 DE LA LEY ORGÁNICA DEL TRABAJO, LOS TRABAJADORES Y LAS TRABAJADORAS.	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL	1	2016-07-01	1
103	1	Reposo Post-Natal (80 días hábiles)	80H	POR PRE Y POST-NATAL DE CONFORMIDAD CON LO ESTABLECIDO EN EL TITULO VI, ARTICULO Nº 336 DE LA LEY ORGÁNICA DEL TRABAJO, LOS TRABAJADORES Y LAS TRABAJADORAS	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL	1	2016-07-01	1
104	1	Nacimiento de Hijos	14C	LICENCIA DE PATERNIDAD, SEGÚN EL ARTÍCULO 9 DE LA LEY PARA LA PROTECCIÓN DE LAS FAMILIAS, LA MATERNIDAD Y LA PATERNIDAD	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA ACTA DE MATRIMONIO Y COPIA DE LA PARTIDA NACIMIENTO DEL BEBÉ	1	2016-07-01	1
154	2	Realizar Estudios	xxH	POR ESTUDIOS DE POST-GRADO, MEJORAMIENTO Y ESPECIALIZACIÓN; SEGÚN LA CLAUSULA Nº 9 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES ADMINISTRATIVO DEL MPPE	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, CONSTANCIA DE ESTUDIO POR LA UNIVERSIDAD DONDE ESPECIFIQUE LAS FECHAS Y LAPSOS PARA LA REALIZACIÓN DEL POST-GRADO	1	2016-07-01	1
203	1	Reposo Post-Natal (89 días hábiles)	89H	De conformidad con lo establecido en la Cláusula 12 del VI Convención Colectiva de los Trabajadores de la Educación, de fecha 30/06/2.011-2013 y haciendo uso de lo contemplado en la Resolución Nº 91 artículo 1 de la Gaceta Oficial Nº 38.990 de fecha 08 de Agosto de 2008	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL	2	2016-07-01	1
204	1	Nacimiento de Hijos	14C	LICENCIA DE PATERNIDAD, SEGÚN EL ARTÍCULO 9 DE LA LEY PARA LA PROTECCIÓN DE LAS FAMILIAS, LA MATERNIDAD Y LA PATERNIDAD	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA ACTA DE MATRIMONIO Y COPIA DE LA PARTIDA NACIMIENTO DEL BEBÉ	2	2016-07-01	1
206	1	Fallecimiento de Familiar	5H	POR DEFUNCIÓN, SEGÚN EL ART. 111 INC. 12 DEL REGLAMENTO DEL EJERCICIO DE LA PROFESIÓN DOCENTE.	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA DEL ACTA DE DEFUNCIÓN Y COPIA PARTIDA DE NACIMIENTO	2	2016-07-01	1
252	2	Accidente Grave Familiar	xxC	lot	informe médico	2	2016-05-05	1
254	2	Realizar Estudios	xxC	POR ESTUDIOS DE POST-GRADO, MEJORAMIENTO Y ESPECIALIZACIÓN; SEGÚN LA CLAUSULA Nº 9 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES DOCENTES DEL MPPE	constancia de estudio	2	2016-05-05	1
302	1	Reposo prenatal (50 días hábiles)	50H	POR PRE Y POST-NATAL DE CONFORMIDAD CON LO ESTABLECIDO EN EL TITULO VI, ARTICULO Nº 336 DE LA LEY ORGÁNICA DEL TRABAJO, LOS TRABAJADORES Y LAS TRABAJADORAS	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL	3	2016-07-01	1
303	1	Reposo Post-Natal (80 días hábiles)	80H	POR PRE Y POST-NATAL DE CONFORMIDAD CON LO ESTABLECIDO EN EL TITULO VI, ARTICULO Nº 336 DE LA LEY ORGÁNICA DEL TRABAJO, LOS TRABAJADORES Y LAS TRABAJADORAS	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL	3	2016-07-01	1
304	1	Nacimiento de Hijos	14C	LICENCIA DE PATERNIDAD, SEGÚN EL ARTÍCULO 9 DE LA LEY PARA LA PROTECCIÓN DE LAS FAMILIAS, LA MATERNIDAD Y LA PATERNIDAD	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA ACTA DE MATRIMONIO Y COPIA DE LA PARTIDA NACIMIENTO DEL BEBÉ	3	2016-07-01	1
306	1	Fallecimiento de Familiar	7C	POR DEFUNCIÓN, SEGÚN CLÁUSULA TERCERA DEL CONTRATO COLECTIVO DEL PERSONAL OBRERO DEL MPPE.	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE DEFUNCIÓN	3	2016-07-01	1
354	2	Realizar Estudios	xxC	POR ESTUDIOS DE POST-GRADO, MEJORAMIENTO Y ESPECIALIZACIÓN; SEGÚN LA CLAUSULA Nº 9 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES DOCENTES DEL MPPE	constancia de estudio	3	2016-05-05	1
355	2	Presentar Exámenes	xxC	LOT	constancia de estudio	3	2016-05-05	1
356	2	Diligencias Personales	xxC	LOT	exposición de motivos	3	2016-05-05	1
357	2	Actividades Deportivas	xxC	LOT	exposición de motivos	3	2016-05-05	1
358	2	Asistencia a Seminario	xxC	LOT	exposición de motivos	3	2016-05-05	1
359	2	Conferencia o Congreso	xxC	LOT	exposición de motivos	3	2016-05-05	1
201	1	Matrimonio	8H	POR MATRIMONIO, SEGÚN EL ART. 111 INC. 2 DEL REGLAMENTO DEL EJERCICIO DE LA PROFESIÓN DOCENTE.	COPIA DE CÉDULA DE IDENTIDAD LEGIBLE, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE MATRIMONIO	2	2016-07-01	0
360	2	Becas	xxC	LOT	exposición de motivos	3	2016-05-05	1
361	2	Otros	xxC	LOT	exposición de motivos	3	2016-05-05	1
101	1	Matrimonio	8H	POR MATRIMONIO, SEGÚN CLÁUSULA 72 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES ADMINISTRATIVOS DEL MPPE	COPIA DE CÉDULA DE IDENTIDAD LEGIBLE, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE MATRIMONIO	1	2016-07-01	1
155	2	Presentar Exámenes	xxC	LOT	constancia de estudio	1	2016-05-05	1
156	2	Diligencias Personales	xxC	LOT	exposición de motivos	1	2016-05-05	1
157	2	Actividades Deportivas	xxC	LOT	exposición de motivos	1	2016-05-05	1
158	2	Asistencia a Seminario	xxC	LOT	exposición de motivos	1	2016-05-05	1
159	2	Conferencia o Congreso	xxC	LOT	exposición de motivos	1	2016-05-05	1
160	2	Becas	xxC	LOT	exposición de motivos	1	2016-05-05	1
161	2	Otros	xxC	LOT	exposición de motivos	1	2016-05-05	1
202	1	Reposo prenatal (61 días hábiles)	61H	De conformidad con lo establecido en la Cláusula 12 del VI Convención Colectiva de los Trabajadores de la Educación, de fecha 30/06/2.011-2013 y haciendo uso de lo contemplado en la Resolución Nº 91 artículo 1 de la Gaceta Oficial Nº 38.990 de fecha 08 de Agosto de 2008	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL	2	2016-07-01	1
205	1	Enfermedad	xxC	LOT	informe médico	2	2016-04-07	1
207	1	Participación activa en evento deportivo	xxC	LOT	exposición de motivos	2	2016-04-07	1
208	1	Comparecencia obligatoria  ante una autoridad	xxC	LOT	exposición de motivos	2	2016-04-07	1
255	2	Presentar Exámenes	xxC	LOT	constancia de estudio	2	2016-05-05	1
256	2	Diligencias Personales	xxC	LOT	exposición de motivos	2	2016-05-05	1
257	2	Actividades Deportivas	xxC	LOT	exposición de motivos	2	2016-05-05	1
258	2	Asistencia a Seminario	xxC	LOT	exposición de motivos	2	2016-05-05	1
259	2	Conferencia o Congreso	xxC	LOT	exposición de motivos	2	2016-05-05	1
260	2	Becas	xxC	LOT	expposición de motivos	2	2016-05-05	1
261	2	Otros	xxC	LOT	exposición de motivos	2	2016-05-05	1
305	1	Enfermedad	xxC	LOT	informe médico	3	2016-04-07	1
307	1	Participación activa en evento deportivo	xxC	LOT	exposición de motivos	3	2016-04-07	1
301	1	Matrimonio	12C	111 POR MATRIMONIO, SEGÚN CLÁUSULA NOVENA DEL CONTRATO COLECTIVO DEL PERSONAL OBRERO DEL MPPE	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE MATRIMONIO	3	2016-07-01	1
\.


--
-- TOC entry 2237 (class 0 OID 0)
-- Dependencies: 228
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('tipo_permiso_id_tipopermiso_seq', 70, true);


--
-- TOC entry 2208 (class 0 OID 20406)
-- Dependencies: 229
-- Data for Name: usuario; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY usuario (id_usuario, login_usuario, password_usuario, id_funcionario, fecha_ultimo_acceso, tipo_usuario, rol_usuario, estatus_usuario, id_dependencia) FROM stdin;
3	secretaria	1234	4IgSNFtx-0NGw-spjU-vf0l-1TAUn3kFbg26	2016-07-26 08:07:27.548235	planta	secretaria	1	ZN0AqxQjq-kaN-IYba-LaQL-La20AKjl2qFA
11	cpset	1234	pJWbiK23-o1tr-kAS9-TnKC-t3k5SUeYKZm8	2016-07-24 10:53:43.506174	planta	jefeinmediato	1	1T6AtL7V6-lSHd-tdFb-d4Y0-kjkJEvpJJjiA
5	juridica	1234	SCyLu9eu-Fvcr-v1X8-MN9N-q1gDskyLMvz7	2016-07-26 08:10:28.130606	planta	juridica	1	XVA9lqpSmX-LZl-oICa-LQXE-lOA2AlCH3ASO
2	cbit	1234	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	2016-07-26 19:35:01.962052	planta	jefeinmediato	1	9WaSPXNl3Pq8plQUD-XBaLX-VSI02-ZQCJKcPStn9,1T6AtL7V6-lSHd-tdFb-d4Y0-kjkJEvpJJjiA,sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT
10	informatica	1234	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	2016-07-24 15:32:11.554267	planta	jefeinmediato	1	sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT
4	personal	1234	zTYaccdG-L4ei-5wOI-hAQo-N9CiEFQp9BYb	2016-07-14 13:01:55.904353	planta	personal	1	0aJzgpnX-aw0l-5AZ8-4c3k-p1wTTtB4IrXW
7	licencia	1234	987BROtP-SH5P-X5hJ-Z9p5-bzhxYDUtO1R2	2016-07-14 12:37:04.305443	planta	licencia	1	sFGJ2zFlcSl-LZm-lYba-LaQR-LoQ9papa3·FQ
8	director	1234	oRn7uP8h-bnuE-KuqY-Qv3z-bzvsbjVMEk9i	2016-07-14 21:23:28.138299	director	director	1	nje4gG2D-ooRE-bge9-1sMQ-jfG5IiUl9lUH
9	gestionescolar	1234	NEHFKVKC-khgu-rNii-jNbC-z67xrujUip7d	2016-07-23 15:15:55.358255	planta	jefeinmediato	1	9tDOAp4l1dLgtD-AaXM-D0U1-ljgJaZdS99
6	bienestar	1234	dIUlHdch-6BIc-OLSU-EMBV-T4diET4CtZq7	2016-07-25 06:20:57.736586	planta	bienestar	1	12299j1B6-jgSd-tDFb-D0q8-kFCLEmYJklip
1	admin	1234	TRyS3ADv-bdWm-AH9e-gpRJ-Qw12Ulb1Vvda	2016-07-25 09:52:20.717541	planta	admin	1	sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT
\.


--
-- TOC entry 2238 (class 0 OID 0)
-- Dependencies: 230
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, true);


--
-- TOC entry 2210 (class 0 OID 20414)
-- Dependencies: 231
-- Data for Name: vacaciones; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY vacaciones (id_vacaciones, fecha_solicitud, id_funcionario, tipo_personal, cargo_funcional, numero_dias, fecha_desde, fecha_hasta, id_periodo, fecha_retorno, observacion, id_jefeinmediato, id_jefepersonal, id_municipio, id_dependencialaboral, tipo_vacaciones, estatus, condicion_laboral) FROM stdin;
5	2016-07-26	WpZ1durh-QZO5-gizu-xyUa-CtRCduQu8839	ADMINISTRATIVO	SOPORTE TECNICO	\N	2016-08-22	2016-10-07	1	2016-10-07	35 dias	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	WpZ1durh-QZO5-gizu-xyUa-CtRCduQu8839	1	1	2
6	2016-07-22	RuzwyHFQ-Rhpl-m6si-b6DA-PTktZdlY24hF	ADMINISTRATIVO	PROGRAMADOR	\N	2016-08-08	2016-08-26	1	2016-08-26	15 dias	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	RuzwyHFQ-Rhpl-m6si-b6DA-PTktZdlY24hF	1	1	1
7	2016-07-26	0tJPTUJL-6Pau-schz-GGsA-Qsnya56NnUCW	DOCENTE	SUPERVISORA	\N	2016-08-01	2016-09-09	1	2016-09-09	vacaciones ecolares	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	0tJPTUJL-6Pau-schz-GGsA-Qsnya56NnUCW	1	2	1
8	2016-07-25	VcHYvr93-Eboz-SikD-tyIy-AwOlcglN4SWi	ADMINISTRATIVO	COORDINADOR ADMINISTRATIVO	\N	2016-08-08	2016-09-23	1	2016-09-23	35 dias	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	VcHYvr93-Eboz-SikD-tyIy-AwOlcglN4SWi	1	1	1
9	2016-07-25	cM352LxE-1eWY-vTio-h4ZD-32xuH4MzXO0s	ADMINISTRATIVO	DOCENTE	\N	2016-08-01	2016-09-16	1	2016-09-16		yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	cM352LxE-1eWY-vTio-h4ZD-32xuH4MzXO0s	1	2	2
10	2016-07-27	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	ADMINISTRATIVO	COORD. SISTEMAS Y BASES DE DATOS	\N	2016-07-26	2016-07-29	1	2016-07-29	bb	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	1	1	2
1	2016-07-26	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	ADMINISTRATIVO	COORD. SISTEMAS Y BASES DE DATOS	\N	2016-08-01	2016-08-19	1	2016-08-19	15 dias 2015	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG	2	2	1
2	2016-07-26	ub4nuFO3-hFwN-qQbR-U0a0-hUKc9I9xE4y8	ADMINISTRATIVO	PROGRAMADOR DE SISTEMAS Y BASES DE DATOS	\N	2016-08-22	2016-09-09	1	2016-09-09	15 dias	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	ub4nuFO3-hFwN-qQbR-U0a0-hUKc9I9xE4y8	1	1	1
3	2016-07-26	BLDS2o2T-rEgp-rp1o-jh9D-cm4g1mrnZTct	ADMINISTRATIVO	SOPORTE TECNICO	\N	2016-08-01	2016-08-19	1	2016-08-19		yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	BLDS2o2T-rEgp-rp1o-jh9D-cm4g1mrnZTct	1	1	2
4	2016-07-26	trBCRhTY-Fwpx-VZv8-FyXL-j1tkW2gUQvF6	ADMINISTRATIVO	SOPORTE TECNICO	\N	2016-08-01	2016-08-19	1	2016-08-19	15 dias	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	yGHpOoTV-RRyY-6A96-Xt0u-NazU9iH51Gpq	SUCRE	trBCRhTY-Fwpx-VZv8-FyXL-j1tkW2gUQvF6	1	3	1
\.


--
-- TOC entry 2239 (class 0 OID 0)
-- Dependencies: 232
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('vacaciones_id_vacaciones_seq', 10, true);


--
-- TOC entry 2071 (class 2606 OID 20436)
-- Name: id_denuncia; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY denuncias_ausencias
    ADD CONSTRAINT id_denuncia PRIMARY KEY (id_denuncia);


--
-- TOC entry 2073 (class 2606 OID 20438)
-- Name: id_diaferiado; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY dias_feriados
    ADD CONSTRAINT id_diaferiado PRIMARY KEY (id_diaferiado);


--
-- TOC entry 2075 (class 2606 OID 20440)
-- Name: id_periodo; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT id_periodo PRIMARY KEY (id_periodo);


--
-- TOC entry 2077 (class 2606 OID 20442)
-- Name: id_permiso; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT id_permiso PRIMARY KEY (id_permiso);


--
-- TOC entry 2069 (class 2606 OID 20444)
-- Name: id_seguimiento; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY denuncia_seguimiento
    ADD CONSTRAINT id_seguimiento PRIMARY KEY (id_seguimiento);


--
-- TOC entry 2079 (class 2606 OID 20446)
-- Name: id_tipopermiso; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY tipo_permiso
    ADD CONSTRAINT id_tipopermiso PRIMARY KEY (id_tipopermiso);


--
-- TOC entry 2081 (class 2606 OID 20448)
-- Name: id_usuario; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_usuario PRIMARY KEY (id_usuario);


--
-- TOC entry 2083 (class 2606 OID 20450)
-- Name: id_vacaciones; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY vacaciones
    ADD CONSTRAINT id_vacaciones PRIMARY KEY (id_vacaciones);


-- Completed on 2016-08-01 10:35:01 GYT

--
-- PostgreSQL database dump complete
--

