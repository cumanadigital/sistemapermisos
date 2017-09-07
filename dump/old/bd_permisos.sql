--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.5
-- Dumped by pg_dump version 9.4.5
-- Started on 2016-05-17 21:02:03 GYT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 17222)
-- Name: permisos; Type: SCHEMA; Schema: -; Owner: useruptos
--

CREATE SCHEMA permisos;


ALTER SCHEMA permisos OWNER TO useruptos;

SET search_path = permisos, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 17544)
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
-- TOC entry 182 (class 1259 OID 17542)
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
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 182
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE denuncia_seguimiento_id_seguimiento_seq OWNED BY denuncia_seguimiento.id_seguimiento;


--
-- TOC entry 185 (class 1259 OID 17555)
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
-- TOC entry 184 (class 1259 OID 17553)
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
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 184
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE denuncias_ausencias_id_denuncia_seq OWNED BY denuncias_ausencias.id_denuncia;


--
-- TOC entry 187 (class 1259 OID 17567)
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
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN dias_feriados.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN dias_feriados.estatus IS '0=Inactivo
1=Activo';


--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 187
-- Name: COLUMN dias_feriados.id_tipo_personal1; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN dias_feriados.id_tipo_personal1 IS '1=Administrativo
2=Docente
3=Obrero';


--
-- TOC entry 186 (class 1259 OID 17565)
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
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 186
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE dias_feriados_id_diaferiado_seq OWNED BY dias_feriados.id_diaferiado;


--
-- TOC entry 179 (class 1259 OID 17363)
-- Name: periodo; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
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


ALTER TABLE periodo OWNER TO useruptos;

--
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 179
-- Name: COLUMN periodo.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN periodo.estatus IS '1=Activo
0=Inactivo';


--
-- TOC entry 180 (class 1259 OID 17366)
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
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 180
-- Name: periodo_id_periodo_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE periodo_id_periodo_seq OWNED BY periodo.id_periodo;


--
-- TOC entry 189 (class 1259 OID 17580)
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
    id_jefeinmediato character varying(100)
);


ALTER TABLE permisos OWNER TO useruptos;

--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 189
-- Name: COLUMN permisos.id_jefeinmediato; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN permisos.id_jefeinmediato IS 'extraido de la consulta a BD zees';


--
-- TOC entry 188 (class 1259 OID 17578)
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
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 188
-- Name: permisos_id_permiso_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE permisos_id_permiso_seq OWNED BY permisos.id_permiso;


--
-- TOC entry 195 (class 1259 OID 17914)
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
-- TOC entry 194 (class 1259 OID 17912)
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
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 194
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE tipo_permiso_id_tipopermiso_seq OWNED BY tipo_permiso.id_tipopermiso;


--
-- TOC entry 176 (class 1259 OID 17290)
-- Name: usuario; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
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


ALTER TABLE usuario OWNER TO useruptos;

--
-- TOC entry 175 (class 1259 OID 17288)
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
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 175
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 178 (class 1259 OID 17353)
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
    estatus integer
);


ALTER TABLE vacaciones OWNER TO useruptos;

--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN vacaciones.tipo_personal; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.tipo_personal IS '1=Administrativo
2=Docente
3=Obrero';


--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN vacaciones.tipo_vacaciones; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.tipo_vacaciones IS '1=Regulares
2=Retrasadas';


--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 178
-- Name: COLUMN vacaciones.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.estatus IS '1=Pendiente
2=Aprobado
3=Rechazado';


--
-- TOC entry 177 (class 1259 OID 17351)
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
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 177
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE vacaciones_id_vacaciones_seq OWNED BY vacaciones.id_vacaciones;


--
-- TOC entry 1954 (class 2604 OID 17547)
-- Name: id_seguimiento; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY denuncia_seguimiento ALTER COLUMN id_seguimiento SET DEFAULT nextval('denuncia_seguimiento_id_seguimiento_seq'::regclass);


--
-- TOC entry 1955 (class 2604 OID 17558)
-- Name: id_denuncia; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY denuncias_ausencias ALTER COLUMN id_denuncia SET DEFAULT nextval('denuncias_ausencias_id_denuncia_seq'::regclass);


--
-- TOC entry 1956 (class 2604 OID 17570)
-- Name: id_diaferiado; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY dias_feriados ALTER COLUMN id_diaferiado SET DEFAULT nextval('dias_feriados_id_diaferiado_seq'::regclass);


--
-- TOC entry 1953 (class 2604 OID 17368)
-- Name: id_periodo; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY periodo ALTER COLUMN id_periodo SET DEFAULT nextval('periodo_id_periodo_seq'::regclass);


--
-- TOC entry 1957 (class 2604 OID 17583)
-- Name: id_permiso; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY permisos ALTER COLUMN id_permiso SET DEFAULT nextval('permisos_id_permiso_seq'::regclass);


--
-- TOC entry 1958 (class 2604 OID 17917)
-- Name: id_tipopermiso; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY tipo_permiso ALTER COLUMN id_tipopermiso SET DEFAULT nextval('tipo_permiso_id_tipopermiso_seq'::regclass);


--
-- TOC entry 1951 (class 2604 OID 17293)
-- Name: id_usuario; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 1952 (class 2604 OID 17356)
-- Name: id_vacaciones; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY vacaciones ALTER COLUMN id_vacaciones SET DEFAULT nextval('vacaciones_id_vacaciones_seq'::regclass);


--
-- TOC entry 1968 (class 2606 OID 17563)
-- Name: id_denuncia; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY denuncias_ausencias
    ADD CONSTRAINT id_denuncia PRIMARY KEY (id_denuncia);


--
-- TOC entry 1970 (class 2606 OID 17928)
-- Name: id_diaferiado; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY dias_feriados
    ADD CONSTRAINT id_diaferiado PRIMARY KEY (id_diaferiado);


--
-- TOC entry 1964 (class 2606 OID 17376)
-- Name: id_periodo; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT id_periodo PRIMARY KEY (id_periodo);


--
-- TOC entry 1972 (class 2606 OID 17588)
-- Name: id_permiso; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT id_permiso PRIMARY KEY (id_permiso);


--
-- TOC entry 1966 (class 2606 OID 17552)
-- Name: id_seguimiento; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY denuncia_seguimiento
    ADD CONSTRAINT id_seguimiento PRIMARY KEY (id_seguimiento);


--
-- TOC entry 1960 (class 2606 OID 17295)
-- Name: id_usuario; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_usuario PRIMARY KEY (id_usuario);


--
-- TOC entry 1962 (class 2606 OID 17361)
-- Name: id_vacaciones; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY vacaciones
    ADD CONSTRAINT id_vacaciones PRIMARY KEY (id_vacaciones);


--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 7
-- Name: permisos; Type: ACL; Schema: -; Owner: useruptos
--

REVOKE ALL ON SCHEMA permisos FROM PUBLIC;
REVOKE ALL ON SCHEMA permisos FROM useruptos;
GRANT ALL ON SCHEMA permisos TO useruptos;


-- Completed on 2016-05-17 21:02:04 GYT

--
-- PostgreSQL database dump complete
--

