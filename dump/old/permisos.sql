--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2016-04-16 16:30:36 VET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 17222)
-- Name: permisos; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA permisos;


SET search_path = permisos, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 17544)
-- Name: denuncia_seguimiento; Type: TABLE; Schema: permisos; Owner: -; Tablespace: 
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


--
-- TOC entry 182 (class 1259 OID 17542)
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE; Schema: permisos; Owner: -
--

CREATE SEQUENCE denuncia_seguimiento_id_seguimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 182
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: -
--

ALTER SEQUENCE denuncia_seguimiento_id_seguimiento_seq OWNED BY denuncia_seguimiento.id_seguimiento;


--
-- TOC entry 185 (class 1259 OID 17555)
-- Name: denuncias_ausencias; Type: TABLE; Schema: permisos; Owner: -; Tablespace: 
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


--
-- TOC entry 184 (class 1259 OID 17553)
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE; Schema: permisos; Owner: -
--

CREATE SEQUENCE denuncias_ausencias_id_denuncia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 184
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: -
--

ALTER SEQUENCE denuncias_ausencias_id_denuncia_seq OWNED BY denuncias_ausencias.id_denuncia;


--
-- TOC entry 187 (class 1259 OID 17567)
-- Name: dias_feriados; Type: TABLE; Schema: permisos; Owner: -; Tablespace: 
--

CREATE TABLE dias_feriados (
    id_diaferiado integer NOT NULL,
    fecha date NOT NULL,
    tipo_fecha character varying(100),
    motivo character varying(255),
    estatus integer,
    observacion text
);


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN dias_feriados.estatus; Type: COMMENT; Schema: permisos; Owner: -
--

COMMENT ON COLUMN dias_feriados.estatus IS '0=Inactivo
1=Activo';


--
-- TOC entry 186 (class 1259 OID 17565)
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE; Schema: permisos; Owner: -
--

CREATE SEQUENCE dias_feriados_id_diaferiado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 186
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: -
--

ALTER SEQUENCE dias_feriados_id_diaferiado_seq OWNED BY dias_feriados.id_diaferiado;


--
-- TOC entry 179 (class 1259 OID 17363)
-- Name: periodo; Type: TABLE; Schema: permisos; Owner: -; Tablespace: 
--

CREATE TABLE periodo (
    id_periodo integer NOT NULL,
    nombre_periodo character varying(255),
    fecha_inicio date,
    fecha_cierre date,
    estatus integer,
    id_jefe_personal character varying(100),
    id_jefezona character varying(100),
    observacion text
);


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN periodo.estatus; Type: COMMENT; Schema: permisos; Owner: -
--

COMMENT ON COLUMN periodo.estatus IS '1=Activo
0=Inactivo';


--
-- TOC entry 180 (class 1259 OID 17366)
-- Name: periodo_id_periodo_seq; Type: SEQUENCE; Schema: permisos; Owner: -
--

CREATE SEQUENCE periodo_id_periodo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 180
-- Name: periodo_id_periodo_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: -
--

ALTER SEQUENCE periodo_id_periodo_seq OWNED BY periodo.id_periodo;


--
-- TOC entry 189 (class 1259 OID 17580)
-- Name: permisos; Type: TABLE; Schema: permisos; Owner: -; Tablespace: 
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
    id_jefeinmediato character varying(100)
);


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN permisos.id_jefeinmediato; Type: COMMENT; Schema: permisos; Owner: -
--

COMMENT ON COLUMN permisos.id_jefeinmediato IS 'extraido de la consulta a BD zees';


--
-- TOC entry 188 (class 1259 OID 17578)
-- Name: permisos_id_permiso_seq; Type: SEQUENCE; Schema: permisos; Owner: -
--

CREATE SEQUENCE permisos_id_permiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 188
-- Name: permisos_id_permiso_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: -
--

ALTER SEQUENCE permisos_id_permiso_seq OWNED BY permisos.id_permiso;


--
-- TOC entry 191 (class 1259 OID 17859)
-- Name: tipo_permiso; Type: TABLE; Schema: permisos; Owner: -; Tablespace: 
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


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN tipo_permiso.tipo_permiso; Type: COMMENT; Schema: permisos; Owner: -
--

COMMENT ON COLUMN tipo_permiso.tipo_permiso IS '1=Obligatorio
2=Potestativo';


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 191
-- Name: COLUMN tipo_permiso.id_tipo_personal; Type: COMMENT; Schema: permisos; Owner: -
--

COMMENT ON COLUMN tipo_permiso.id_tipo_personal IS '1=Administrativo
2=Docente
3=Obrero';


--
-- TOC entry 190 (class 1259 OID 17857)
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE; Schema: permisos; Owner: -
--

CREATE SEQUENCE tipo_permiso_id_tipopermiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 190
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: -
--

ALTER SEQUENCE tipo_permiso_id_tipopermiso_seq OWNED BY tipo_permiso.id_tipopermiso;


--
-- TOC entry 176 (class 1259 OID 17290)
-- Name: usuario; Type: TABLE; Schema: permisos; Owner: -; Tablespace: 
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    login_usuario character varying(15),
    password_usuario character varying(15),
    id_funcionario character varying(64),
    fecha_ultimo_acceso timestamp without time zone,
    tipo_usuario character varying(20),
    rol_usuario character varying(20)
);


--
-- TOC entry 175 (class 1259 OID 17288)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: permisos; Owner: -
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 175
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: -
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 178 (class 1259 OID 17353)
-- Name: vacaciones; Type: TABLE; Schema: permisos; Owner: -; Tablespace: 
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
    estatus integer
);


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN vacaciones.tipo_personal; Type: COMMENT; Schema: permisos; Owner: -
--

COMMENT ON COLUMN vacaciones.tipo_personal IS '1=Administrativo
2=Docente
3=Obrero';


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN vacaciones.tipo_vacaciones; Type: COMMENT; Schema: permisos; Owner: -
--

COMMENT ON COLUMN vacaciones.tipo_vacaciones IS '1=Regulares
2=Retrasadas';


--
-- TOC entry 2120 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN vacaciones.estatus; Type: COMMENT; Schema: permisos; Owner: -
--

COMMENT ON COLUMN vacaciones.estatus IS '1=Pendiente
2=Aprobado
3=Rechazado';


--
-- TOC entry 177 (class 1259 OID 17351)
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE; Schema: permisos; Owner: -
--

CREATE SEQUENCE vacaciones_id_vacaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2121 (class 0 OID 0)
-- Dependencies: 177
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: -
--

ALTER SEQUENCE vacaciones_id_vacaciones_seq OWNED BY vacaciones.id_vacaciones;


--
-- TOC entry 1955 (class 2604 OID 17547)
-- Name: id_seguimiento; Type: DEFAULT; Schema: permisos; Owner: -
--

ALTER TABLE ONLY denuncia_seguimiento ALTER COLUMN id_seguimiento SET DEFAULT nextval('denuncia_seguimiento_id_seguimiento_seq'::regclass);


--
-- TOC entry 1956 (class 2604 OID 17558)
-- Name: id_denuncia; Type: DEFAULT; Schema: permisos; Owner: -
--

ALTER TABLE ONLY denuncias_ausencias ALTER COLUMN id_denuncia SET DEFAULT nextval('denuncias_ausencias_id_denuncia_seq'::regclass);


--
-- TOC entry 1957 (class 2604 OID 17570)
-- Name: id_diaferiado; Type: DEFAULT; Schema: permisos; Owner: -
--

ALTER TABLE ONLY dias_feriados ALTER COLUMN id_diaferiado SET DEFAULT nextval('dias_feriados_id_diaferiado_seq'::regclass);


--
-- TOC entry 1954 (class 2604 OID 17368)
-- Name: id_periodo; Type: DEFAULT; Schema: permisos; Owner: -
--

ALTER TABLE ONLY periodo ALTER COLUMN id_periodo SET DEFAULT nextval('periodo_id_periodo_seq'::regclass);


--
-- TOC entry 1958 (class 2604 OID 17583)
-- Name: id_permiso; Type: DEFAULT; Schema: permisos; Owner: -
--

ALTER TABLE ONLY permisos ALTER COLUMN id_permiso SET DEFAULT nextval('permisos_id_permiso_seq'::regclass);


--
-- TOC entry 1959 (class 2604 OID 17862)
-- Name: id_tipopermiso; Type: DEFAULT; Schema: permisos; Owner: -
--

ALTER TABLE ONLY tipo_permiso ALTER COLUMN id_tipopermiso SET DEFAULT nextval('tipo_permiso_id_tipopermiso_seq'::regclass);


--
-- TOC entry 1952 (class 2604 OID 17293)
-- Name: id_usuario; Type: DEFAULT; Schema: permisos; Owner: -
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 1953 (class 2604 OID 17356)
-- Name: id_vacaciones; Type: DEFAULT; Schema: permisos; Owner: -
--

ALTER TABLE ONLY vacaciones ALTER COLUMN id_vacaciones SET DEFAULT nextval('vacaciones_id_vacaciones_seq'::regclass);


--
-- TOC entry 2092 (class 0 OID 17544)
-- Dependencies: 183
-- Data for Name: denuncia_seguimiento; Type: TABLE DATA; Schema: permisos; Owner: -
--

COPY denuncia_seguimiento (id_seguimiento, fecha_visita, id_funcionarioatencion, id_dependencia, observaciones, respuesta, id_denuncia) FROM stdin;
\.


--
-- TOC entry 2122 (class 0 OID 0)
-- Dependencies: 182
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE SET; Schema: permisos; Owner: -
--

SELECT pg_catalog.setval('denuncia_seguimiento_id_seguimiento_seq', 1, false);


--
-- TOC entry 2094 (class 0 OID 17555)
-- Dependencies: 185
-- Data for Name: denuncias_ausencias; Type: TABLE DATA; Schema: permisos; Owner: -
--

COPY denuncias_ausencias (id_denuncia, id_funcionario, id_dependencia, fecha_denuncia, dias_ausencia, id_jefeinmediato, observaciones, respuesta, fecha_respuesta, estatus) FROM stdin;
\.


--
-- TOC entry 2123 (class 0 OID 0)
-- Dependencies: 184
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE SET; Schema: permisos; Owner: -
--

SELECT pg_catalog.setval('denuncias_ausencias_id_denuncia_seq', 1, false);


--
-- TOC entry 2096 (class 0 OID 17567)
-- Dependencies: 187
-- Data for Name: dias_feriados; Type: TABLE DATA; Schema: permisos; Owner: -
--

COPY dias_feriados (id_diaferiado, fecha, tipo_fecha, motivo, estatus, observacion) FROM stdin;
\.


--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 186
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE SET; Schema: permisos; Owner: -
--

SELECT pg_catalog.setval('dias_feriados_id_diaferiado_seq', 1, false);


--
-- TOC entry 2089 (class 0 OID 17363)
-- Dependencies: 179
-- Data for Name: periodo; Type: TABLE DATA; Schema: permisos; Owner: -
--

COPY periodo (id_periodo, nombre_periodo, fecha_inicio, fecha_cierre, estatus, id_jefe_personal, id_jefezona, observacion) FROM stdin;
\.


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 180
-- Name: periodo_id_periodo_seq; Type: SEQUENCE SET; Schema: permisos; Owner: -
--

SELECT pg_catalog.setval('periodo_id_periodo_seq', 1, false);


--
-- TOC entry 2098 (class 0 OID 17580)
-- Dependencies: 189
-- Data for Name: permisos; Type: TABLE DATA; Schema: permisos; Owner: -
--

COPY permisos (id_permiso, id_funcionario, fecha_permiso, numero_dias, motivo_permiso, fecha_desde, fecha_hasta, fecha_recepcion, id_tipopermiso, observacion, id_jefeinmediato) FROM stdin;
\.


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 188
-- Name: permisos_id_permiso_seq; Type: SEQUENCE SET; Schema: permisos; Owner: -
--

SELECT pg_catalog.setval('permisos_id_permiso_seq', 1, false);


--
-- TOC entry 2100 (class 0 OID 17859)
-- Dependencies: 191
-- Data for Name: tipo_permiso; Type: TABLE DATA; Schema: permisos; Owner: -
--

COPY tipo_permiso (id_tipopermiso, tipo_permiso, nombre_tipo, numero_dias, reglas_legal, recaudos, id_tipo_personal, fecha_registro, estatus) FROM stdin;
1	1	Matrimonio	8h	CLÁUSULA 72 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES ADMINISTRATIVOS DEL MPPE	COPIA DE CÉDULA DE IDENTIDAD LEGIBLE, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE MATRIMONIO	1	2016-04-05	1
2	1	Cuido	8h	CLÁUSULA 38 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES ADMINISTRATIVO.	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PARTIDA DE NACIMIENTO, ORIGINAL Y COPIA DEL PERMISO AVALADO POR IPASME	1	\N	0
3	2	Realizar Estudios	xh	POR ESTUDIOS DE POST-GRADO, MEJORAMIENTO Y ESPECIALIZACIÓN; SEGÚN LA CLAUSULA Nº 9 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES ADMINISTRATIVO DEL MPPE	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, CONSTANCIA DE ESTUDIO POR LA UNIVERSIDAD DONDE ESPECIFIQUE LAS FECHAS Y LAPSOS PARA LA REALIZACIÓN DEL POST-GRADO	1	\N	1
4	1	Nacimiento de Hijos	14c	LICENCIA DE PATERNIDAD, SEGÚN EL ARTÍCULO 9 DE LA LEY PARA LA PROTECCIÓN DE LAS FAMILIAS, LA MATERNIDAD Y LA PATERNIDAD.	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA ACTA DE MATRIMONIO Y COPIA DE LA PARTIDA NACIMIENTO DEL BEBÉ	1	\N	0
5	1	Matrimonio	8h	ART. 111 INC. 2 DEL REGLAMENTO DEL EJERCICIO DE LA PROFESIÓN DOCENTE.	COPIA DE CÉDULA DE IDENTIDAD LEGIBLE, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE MATRIMONIO	2	\N	1
6	1	Fallecimiento de Familiar	5h	ART. 111 INC. 12 DEL REGLAMENTO DEL EJERCICIO DE LA PROFESIÓN DOCENTE.	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA DEL ACTA DE DEFUNCIÓN Y COPIA PARTIDA DE NACIMIENTO	2	\N	1
7	1	Reposo prenatal	61h	De conformidad con lo establecido en la Cláusula 12 del VI Convención Colectiva de los Trabajadores de la Educación, de fecha 30/06/2.011-2013 y haciendo uso de lo contemplado en la Resolución Nº 91 artículo 1 de la Gaceta Oficial Nº 38.990 de fecha 08 de Agosto de 2008	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL	2	\N	0
8	1	Reposo Post-Natal	89h	De conformidad con lo establecido en la Cláusula 12 del VI Convención Colectiva de los Trabajadores de la Educación, de fecha 30/06/2.011-2013 y haciendo uso de lo contemplado en la Resolución Nº 91 artículo 1 de la Gaceta Oficial Nº 38.990 de fecha 08 de Agosto de 2008	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL	2	\N	1
9	1	Matrimonio	12c	POR MATRIMONIO, SEGÚN CLÁUSULA NOVENA DEL CONTRATO COLECTIVO DEL PERSONAL OBRERO DEL MPPE. 	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE MATRIMONIO.	3	\N	1
10	1	Reposo prenatal	50h	POR PRE Y POST-NATAL DE CONFORMIDAD CON LO ESTABLECIDO EN EL TITULO VI, ARTICULO Nº 336 DE LA LEY ORGÁNICA DEL TRABAJO, LOS TRABAJADORES Y LAS TRABAJADORAS	COPIA DE CÉDULA DE IDENTIDAD, CONSTANCIA DE TRABAJO, VOUCHER, COPIA PERMISO PRE Y POST-NATAL.	3	\N	1
\.


--
-- TOC entry 2127 (class 0 OID 0)
-- Dependencies: 190
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE SET; Schema: permisos; Owner: -
--

SELECT pg_catalog.setval('tipo_permiso_id_tipopermiso_seq', 2, true);


--
-- TOC entry 2086 (class 0 OID 17290)
-- Dependencies: 176
-- Data for Name: usuario; Type: TABLE DATA; Schema: permisos; Owner: -
--

COPY usuario (id_usuario, login_usuario, password_usuario, id_funcionario, fecha_ultimo_acceso, tipo_usuario, rol_usuario) FROM stdin;
1	admin	1234	ho4pzswf-xDGe-iqv8-V94I-giR5ryusGF6L	\N	admin	admin
2	director	1234	uC2vFMIm-5IIU-mfA9-8Dgg-59IGDdcBTyGN	\N	jefeinmediato	jefeinmediato
3	secre	1234	2H4ED5GG-ALM0-P9LN-rpTw-goYSvU2oPZtp	\N	secretaria	secretaria
\.


--
-- TOC entry 2128 (class 0 OID 0)
-- Dependencies: 175
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: permisos; Owner: -
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, true);


--
-- TOC entry 2088 (class 0 OID 17353)
-- Dependencies: 178
-- Data for Name: vacaciones; Type: TABLE DATA; Schema: permisos; Owner: -
--

COPY vacaciones (id_vacaciones, fecha_solicitud, id_funcionario, tipo_personal, cargo_funcional, numero_dias, fecha_desde, fecha_hasta, id_periodo, fecha_retorno, observacion, id_jefeinmediato, id_jefepersonal, id_municipio, id_dependencialaboral, tipo_vacaciones, estatus) FROM stdin;
\.


--
-- TOC entry 2129 (class 0 OID 0)
-- Dependencies: 177
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE SET; Schema: permisos; Owner: -
--

SELECT pg_catalog.setval('vacaciones_id_vacaciones_seq', 1, false);


--
-- TOC entry 1971 (class 2606 OID 17575)
-- Name: fecha; Type: CONSTRAINT; Schema: permisos; Owner: -; Tablespace: 
--

ALTER TABLE ONLY dias_feriados
    ADD CONSTRAINT fecha PRIMARY KEY (fecha);


--
-- TOC entry 1969 (class 2606 OID 17563)
-- Name: id_denuncia; Type: CONSTRAINT; Schema: permisos; Owner: -; Tablespace: 
--

ALTER TABLE ONLY denuncias_ausencias
    ADD CONSTRAINT id_denuncia PRIMARY KEY (id_denuncia);


--
-- TOC entry 1965 (class 2606 OID 17376)
-- Name: id_periodo; Type: CONSTRAINT; Schema: permisos; Owner: -; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT id_periodo PRIMARY KEY (id_periodo);


--
-- TOC entry 1973 (class 2606 OID 17588)
-- Name: id_permiso; Type: CONSTRAINT; Schema: permisos; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT id_permiso PRIMARY KEY (id_permiso);


--
-- TOC entry 1967 (class 2606 OID 17552)
-- Name: id_seguimiento; Type: CONSTRAINT; Schema: permisos; Owner: -; Tablespace: 
--

ALTER TABLE ONLY denuncia_seguimiento
    ADD CONSTRAINT id_seguimiento PRIMARY KEY (id_seguimiento);


--
-- TOC entry 1975 (class 2606 OID 17867)
-- Name: id_tipopermiso; Type: CONSTRAINT; Schema: permisos; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_permiso
    ADD CONSTRAINT id_tipopermiso PRIMARY KEY (id_tipopermiso);


--
-- TOC entry 1961 (class 2606 OID 17295)
-- Name: id_usuario; Type: CONSTRAINT; Schema: permisos; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_usuario PRIMARY KEY (id_usuario);


--
-- TOC entry 1963 (class 2606 OID 17361)
-- Name: id_vacaciones; Type: CONSTRAINT; Schema: permisos; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vacaciones
    ADD CONSTRAINT id_vacaciones PRIMARY KEY (id_vacaciones);


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 7
-- Name: permisos; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA permisos FROM PUBLIC;
REVOKE ALL ON SCHEMA permisos FROM useruptos;
GRANT ALL ON SCHEMA permisos TO useruptos;


-- Completed on 2016-04-16 16:30:37 VET

--
-- PostgreSQL database dump complete
--

