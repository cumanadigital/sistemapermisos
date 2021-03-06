toc.dat                                                                                             0000600 0004000 0002000 00000055603 12703706252 014454  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           9                t            zesucreuptos    9.4.5    9.4.5 M    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         .           1262    17221    zesucreuptos    DATABASE     ~   CREATE DATABASE zesucreuptos WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';
    DROP DATABASE zesucreuptos;
             desarrollador01    false                     2615    17378 
   comunuptos    SCHEMA        CREATE SCHEMA comunuptos;
    DROP SCHEMA comunuptos;
          	   useruptos    false                     2615    17222    permisos    SCHEMA        CREATE SCHEMA permisos;
    DROP SCHEMA permisos;
          	   useruptos    false         /           0    0    permisos    ACL     �   REVOKE ALL ON SCHEMA permisos FROM PUBLIC;
REVOKE ALL ON SCHEMA permisos FROM useruptos;
GRANT ALL ON SCHEMA permisos TO useruptos;
               	   useruptos    false    7                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false         0           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5         1           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5         �            3079    11861    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false         2           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    191         �            1259    17536    funcionario    TABLE     u  CREATE TABLE funcionario (
    empleado_uid character varying(36) NOT NULL,
    persona_cedula integer NOT NULL,
    persona_nombres character varying(30) NOT NULL,
    persona_apellidos character varying(40),
    dependencia_nombre character varying(60) NOT NULL,
    categoria_cargo_descripcion character varying(50) NOT NULL,
    funcion_cargo_descripcion character varying(100),
    municipio_nombre character varying(40),
    dependencia_codigonomina character varying(15),
    dependencia_nombre_nomina character varying(60) NOT NULL,
    cargo_codigo character varying(15),
    cargo_denominacion character varying(40)
);
 #   DROP TABLE comunuptos.funcionario;
    
   comunuptos      	   useruptos    false    8         �            1259    17544    denuncia_seguimiento    TABLE       CREATE TABLE denuncia_seguimiento (
    id_seguimiento integer NOT NULL,
    fecha_visita timestamp without time zone,
    id_funcionarioatencion character varying(100),
    id_dependencia character varying(100),
    observaciones text,
    respuesta text,
    id_denuncia integer
);
 *   DROP TABLE permisos.denuncia_seguimiento;
       permisos      	   useruptos    false    7         �            1259    17542 '   denuncia_seguimiento_id_seguimiento_seq    SEQUENCE     �   CREATE SEQUENCE denuncia_seguimiento_id_seguimiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE permisos.denuncia_seguimiento_id_seguimiento_seq;
       permisos    	   useruptos    false    7    182         3           0    0 '   denuncia_seguimiento_id_seguimiento_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE denuncia_seguimiento_id_seguimiento_seq OWNED BY denuncia_seguimiento.id_seguimiento;
            permisos    	   useruptos    false    181         �            1259    17555    denuncias_ausencias    TABLE     h  CREATE TABLE denuncias_ausencias (
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
 )   DROP TABLE permisos.denuncias_ausencias;
       permisos      	   useruptos    false    7         �            1259    17553 #   denuncias_ausencias_id_denuncia_seq    SEQUENCE     �   CREATE SEQUENCE denuncias_ausencias_id_denuncia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE permisos.denuncias_ausencias_id_denuncia_seq;
       permisos    	   useruptos    false    184    7         4           0    0 #   denuncias_ausencias_id_denuncia_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE denuncias_ausencias_id_denuncia_seq OWNED BY denuncias_ausencias.id_denuncia;
            permisos    	   useruptos    false    183         �            1259    17567    dias_feriados    TABLE     �   CREATE TABLE dias_feriados (
    id_diaferiado integer NOT NULL,
    fecha date NOT NULL,
    tipo_fecha character varying(100),
    motivo character varying(255),
    estatus integer,
    observacion text
);
 #   DROP TABLE permisos.dias_feriados;
       permisos      	   useruptos    false    7         5           0    0    COLUMN dias_feriados.estatus    COMMENT     B   COMMENT ON COLUMN dias_feriados.estatus IS '0=Inactivo
1=Activo';
            permisos    	   useruptos    false    186         �            1259    17565    dias_feriados_id_diaferiado_seq    SEQUENCE     �   CREATE SEQUENCE dias_feriados_id_diaferiado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE permisos.dias_feriados_id_diaferiado_seq;
       permisos    	   useruptos    false    186    7         6           0    0    dias_feriados_id_diaferiado_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE dias_feriados_id_diaferiado_seq OWNED BY dias_feriados.id_diaferiado;
            permisos    	   useruptos    false    185         �            1259    17363    periodo    TABLE       CREATE TABLE periodo (
    id_periodo integer NOT NULL,
    nombre_periodo character varying(255),
    fecha_inicio date,
    fecha_cierre date,
    estatus integer,
    id_jefe_personal character varying(100),
    id_jefezona character varying(100),
    observacion text
);
    DROP TABLE permisos.periodo;
       permisos      	   useruptos    false    7         7           0    0    COLUMN periodo.estatus    COMMENT     <   COMMENT ON COLUMN periodo.estatus IS '1=Activo
0=Inactivo';
            permisos    	   useruptos    false    178         �            1259    17366    periodo_id_periodo_seq    SEQUENCE     x   CREATE SEQUENCE periodo_id_periodo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE permisos.periodo_id_periodo_seq;
       permisos    	   useruptos    false    178    7         8           0    0    periodo_id_periodo_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE periodo_id_periodo_seq OWNED BY periodo.id_periodo;
            permisos    	   useruptos    false    179         �            1259    17580    permisos    TABLE     ~  CREATE TABLE permisos (
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
    DROP TABLE permisos.permisos;
       permisos      	   useruptos    false    7         9           0    0     COLUMN permisos.id_jefeinmediato    COMMENT     T   COMMENT ON COLUMN permisos.id_jefeinmediato IS 'extraido de la consulta a BD zees';
            permisos    	   useruptos    false    188         �            1259    17578    permisos_id_permiso_seq    SEQUENCE     y   CREATE SEQUENCE permisos_id_permiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE permisos.permisos_id_permiso_seq;
       permisos    	   useruptos    false    7    188         :           0    0    permisos_id_permiso_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE permisos_id_permiso_seq OWNED BY permisos.id_permiso;
            permisos    	   useruptos    false    187         �            1259    17859    tipo_permiso    TABLE     0  CREATE TABLE tipo_permiso (
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
 "   DROP TABLE permisos.tipo_permiso;
       permisos      	   useruptos    false    7         ;           0    0     COLUMN tipo_permiso.tipo_permiso    COMMENT     N   COMMENT ON COLUMN tipo_permiso.tipo_permiso IS '1=Obligatorio
2=Potestativo';
            permisos    	   useruptos    false    190         <           0    0 $   COLUMN tipo_permiso.id_tipo_personal    COMMENT     Z   COMMENT ON COLUMN tipo_permiso.id_tipo_personal IS '1=Administrativo
2=Docente
3=Obrero';
            permisos    	   useruptos    false    190         �            1259    17857    tipo_permiso_id_tipopermiso_seq    SEQUENCE     �   CREATE SEQUENCE tipo_permiso_id_tipopermiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE permisos.tipo_permiso_id_tipopermiso_seq;
       permisos    	   useruptos    false    190    7         =           0    0    tipo_permiso_id_tipopermiso_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE tipo_permiso_id_tipopermiso_seq OWNED BY tipo_permiso.id_tipopermiso;
            permisos    	   useruptos    false    189         �            1259    17290    usuario    TABLE     =  CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    login_usuario character varying(15),
    password_usuario character varying(15),
    id_funcionario character varying(64),
    fecha_ultimo_acceso timestamp without time zone,
    tipo_usuario character varying(20),
    rol_usuario character varying(20)
);
    DROP TABLE permisos.usuario;
       permisos      	   useruptos    false    7         �            1259    17288    usuario_id_usuario_seq    SEQUENCE     x   CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE permisos.usuario_id_usuario_seq;
       permisos    	   useruptos    false    7    175         >           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;
            permisos    	   useruptos    false    174         �            1259    17353 
   vacaciones    TABLE     L  CREATE TABLE vacaciones (
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
     DROP TABLE permisos.vacaciones;
       permisos      	   useruptos    false    7         ?           0    0    COLUMN vacaciones.tipo_personal    COMMENT     U   COMMENT ON COLUMN vacaciones.tipo_personal IS '1=Administrativo
2=Docente
3=Obrero';
            permisos    	   useruptos    false    177         @           0    0 !   COLUMN vacaciones.tipo_vacaciones    COMMENT     L   COMMENT ON COLUMN vacaciones.tipo_vacaciones IS '1=Regulares
2=Retrasadas';
            permisos    	   useruptos    false    177         A           0    0    COLUMN vacaciones.estatus    COMMENT     N   COMMENT ON COLUMN vacaciones.estatus IS '1=Pendiente
2=Aprobado
3=Rechazado';
            permisos    	   useruptos    false    177         �            1259    17351    vacaciones_id_vacaciones_seq    SEQUENCE     ~   CREATE SEQUENCE vacaciones_id_vacaciones_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE permisos.vacaciones_id_vacaciones_seq;
       permisos    	   useruptos    false    7    177         B           0    0    vacaciones_id_vacaciones_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE vacaciones_id_vacaciones_seq OWNED BY vacaciones.id_vacaciones;
            permisos    	   useruptos    false    176         �           2604    17547    id_seguimiento    DEFAULT     �   ALTER TABLE ONLY denuncia_seguimiento ALTER COLUMN id_seguimiento SET DEFAULT nextval('denuncia_seguimiento_id_seguimiento_seq'::regclass);
 T   ALTER TABLE permisos.denuncia_seguimiento ALTER COLUMN id_seguimiento DROP DEFAULT;
       permisos    	   useruptos    false    182    181    182         �           2604    17558    id_denuncia    DEFAULT     �   ALTER TABLE ONLY denuncias_ausencias ALTER COLUMN id_denuncia SET DEFAULT nextval('denuncias_ausencias_id_denuncia_seq'::regclass);
 P   ALTER TABLE permisos.denuncias_ausencias ALTER COLUMN id_denuncia DROP DEFAULT;
       permisos    	   useruptos    false    184    183    184         �           2604    17570    id_diaferiado    DEFAULT     |   ALTER TABLE ONLY dias_feriados ALTER COLUMN id_diaferiado SET DEFAULT nextval('dias_feriados_id_diaferiado_seq'::regclass);
 L   ALTER TABLE permisos.dias_feriados ALTER COLUMN id_diaferiado DROP DEFAULT;
       permisos    	   useruptos    false    186    185    186         �           2604    17368 
   id_periodo    DEFAULT     j   ALTER TABLE ONLY periodo ALTER COLUMN id_periodo SET DEFAULT nextval('periodo_id_periodo_seq'::regclass);
 C   ALTER TABLE permisos.periodo ALTER COLUMN id_periodo DROP DEFAULT;
       permisos    	   useruptos    false    179    178         �           2604    17583 
   id_permiso    DEFAULT     l   ALTER TABLE ONLY permisos ALTER COLUMN id_permiso SET DEFAULT nextval('permisos_id_permiso_seq'::regclass);
 D   ALTER TABLE permisos.permisos ALTER COLUMN id_permiso DROP DEFAULT;
       permisos    	   useruptos    false    187    188    188         �           2604    17862    id_tipopermiso    DEFAULT     |   ALTER TABLE ONLY tipo_permiso ALTER COLUMN id_tipopermiso SET DEFAULT nextval('tipo_permiso_id_tipopermiso_seq'::regclass);
 L   ALTER TABLE permisos.tipo_permiso ALTER COLUMN id_tipopermiso DROP DEFAULT;
       permisos    	   useruptos    false    190    189    190         �           2604    17293 
   id_usuario    DEFAULT     j   ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);
 C   ALTER TABLE permisos.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       permisos    	   useruptos    false    174    175    175         �           2604    17356    id_vacaciones    DEFAULT     v   ALTER TABLE ONLY vacaciones ALTER COLUMN id_vacaciones SET DEFAULT nextval('vacaciones_id_vacaciones_seq'::regclass);
 I   ALTER TABLE permisos.vacaciones ALTER COLUMN id_vacaciones DROP DEFAULT;
       permisos    	   useruptos    false    176    177    177                   0    17536    funcionario 
   TABLE DATA                 COPY funcionario (empleado_uid, persona_cedula, persona_nombres, persona_apellidos, dependencia_nombre, categoria_cargo_descripcion, funcion_cargo_descripcion, municipio_nombre, dependencia_codigonomina, dependencia_nombre_nomina, cargo_codigo, cargo_denominacion) FROM stdin;
 
   comunuptos    	   useruptos    false    180       2079.dat !          0    17544    denuncia_seguimiento 
   TABLE DATA               �   COPY denuncia_seguimiento (id_seguimiento, fecha_visita, id_funcionarioatencion, id_dependencia, observaciones, respuesta, id_denuncia) FROM stdin;
    permisos    	   useruptos    false    182       2081.dat C           0    0 '   denuncia_seguimiento_id_seguimiento_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('denuncia_seguimiento_id_seguimiento_seq', 1, false);
            permisos    	   useruptos    false    181         #          0    17555    denuncias_ausencias 
   TABLE DATA               �   COPY denuncias_ausencias (id_denuncia, id_funcionario, id_dependencia, fecha_denuncia, dias_ausencia, id_jefeinmediato, observaciones, respuesta, fecha_respuesta, estatus) FROM stdin;
    permisos    	   useruptos    false    184       2083.dat D           0    0 #   denuncias_ausencias_id_denuncia_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('denuncias_ausencias_id_denuncia_seq', 1, false);
            permisos    	   useruptos    false    183         %          0    17567    dias_feriados 
   TABLE DATA               `   COPY dias_feriados (id_diaferiado, fecha, tipo_fecha, motivo, estatus, observacion) FROM stdin;
    permisos    	   useruptos    false    186       2085.dat E           0    0    dias_feriados_id_diaferiado_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('dias_feriados_id_diaferiado_seq', 1, false);
            permisos    	   useruptos    false    185                   0    17363    periodo 
   TABLE DATA               �   COPY periodo (id_periodo, nombre_periodo, fecha_inicio, fecha_cierre, estatus, id_jefe_personal, id_jefezona, observacion) FROM stdin;
    permisos    	   useruptos    false    178       2077.dat F           0    0    periodo_id_periodo_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('periodo_id_periodo_seq', 1, false);
            permisos    	   useruptos    false    179         '          0    17580    permisos 
   TABLE DATA               �   COPY permisos (id_permiso, id_funcionario, fecha_permiso, numero_dias, motivo_permiso, fecha_desde, fecha_hasta, fecha_recepcion, id_tipopermiso, observacion, id_jefeinmediato) FROM stdin;
    permisos    	   useruptos    false    188       2087.dat G           0    0    permisos_id_permiso_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('permisos_id_permiso_seq', 1, false);
            permisos    	   useruptos    false    187         )          0    17859    tipo_permiso 
   TABLE DATA               �   COPY tipo_permiso (id_tipopermiso, tipo_permiso, nombre_tipo, numero_dias, reglas_legal, recaudos, id_tipo_personal, fecha_registro, estatus) FROM stdin;
    permisos    	   useruptos    false    190       2089.dat H           0    0    tipo_permiso_id_tipopermiso_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('tipo_permiso_id_tipopermiso_seq', 1, false);
            permisos    	   useruptos    false    189                   0    17290    usuario 
   TABLE DATA               �   COPY usuario (id_usuario, login_usuario, password_usuario, id_funcionario, fecha_ultimo_acceso, tipo_usuario, rol_usuario) FROM stdin;
    permisos    	   useruptos    false    175       2074.dat I           0    0    usuario_id_usuario_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, true);
            permisos    	   useruptos    false    174                   0    17353 
   vacaciones 
   TABLE DATA                 COPY vacaciones (id_vacaciones, fecha_solicitud, id_funcionario, tipo_personal, cargo_funcional, numero_dias, fecha_desde, fecha_hasta, id_periodo, fecha_retorno, observacion, id_jefeinmediato, id_jefepersonal, id_municipio, id_dependencialaboral, tipo_vacaciones, estatus) FROM stdin;
    permisos    	   useruptos    false    177       2076.dat J           0    0    vacaciones_id_vacaciones_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('vacaciones_id_vacaciones_seq', 1, false);
            permisos    	   useruptos    false    176         �           2606    17575    fecha 
   CONSTRAINT     M   ALTER TABLE ONLY dias_feriados
    ADD CONSTRAINT fecha PRIMARY KEY (fecha);
 ?   ALTER TABLE ONLY permisos.dias_feriados DROP CONSTRAINT fecha;
       permisos      	   useruptos    false    186    186         �           2606    17563    id_denuncia 
   CONSTRAINT     _   ALTER TABLE ONLY denuncias_ausencias
    ADD CONSTRAINT id_denuncia PRIMARY KEY (id_denuncia);
 K   ALTER TABLE ONLY permisos.denuncias_ausencias DROP CONSTRAINT id_denuncia;
       permisos      	   useruptos    false    184    184         �           2606    17376 
   id_periodo 
   CONSTRAINT     Q   ALTER TABLE ONLY periodo
    ADD CONSTRAINT id_periodo PRIMARY KEY (id_periodo);
 >   ALTER TABLE ONLY permisos.periodo DROP CONSTRAINT id_periodo;
       permisos      	   useruptos    false    178    178         �           2606    17588 
   id_permiso 
   CONSTRAINT     R   ALTER TABLE ONLY permisos
    ADD CONSTRAINT id_permiso PRIMARY KEY (id_permiso);
 ?   ALTER TABLE ONLY permisos.permisos DROP CONSTRAINT id_permiso;
       permisos      	   useruptos    false    188    188         �           2606    17552    id_seguimiento 
   CONSTRAINT     f   ALTER TABLE ONLY denuncia_seguimiento
    ADD CONSTRAINT id_seguimiento PRIMARY KEY (id_seguimiento);
 O   ALTER TABLE ONLY permisos.denuncia_seguimiento DROP CONSTRAINT id_seguimiento;
       permisos      	   useruptos    false    182    182         �           2606    17867    id_tipopermiso 
   CONSTRAINT     ^   ALTER TABLE ONLY tipo_permiso
    ADD CONSTRAINT id_tipopermiso PRIMARY KEY (id_tipopermiso);
 G   ALTER TABLE ONLY permisos.tipo_permiso DROP CONSTRAINT id_tipopermiso;
       permisos      	   useruptos    false    190    190         �           2606    17295 
   id_usuario 
   CONSTRAINT     Q   ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_usuario PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY permisos.usuario DROP CONSTRAINT id_usuario;
       permisos      	   useruptos    false    175    175         �           2606    17361    id_vacaciones 
   CONSTRAINT     Z   ALTER TABLE ONLY vacaciones
    ADD CONSTRAINT id_vacaciones PRIMARY KEY (id_vacaciones);
 D   ALTER TABLE ONLY permisos.vacaciones DROP CONSTRAINT id_vacaciones;
       permisos      	   useruptos    false    177    177                                                                                                                                     2079.dat                                                                                            0000600 0004000 0002000 00000626327 12703706252 014277  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        JJKddGW9-8MS2-4aqC-1vvV-WmR4YmwxCqxG	4687292	SUCRE	NELLYS ELENA	DIV DE COOR DTTOS ESCOLARES	DOCENTE	SUPERVISORA	Sucre	006738086	GE NUEVA CORDOBA	1125DI	DOC. V   /AULA
19yPYAbP-tNcC-QWSm-rXyZ-7AVT0uBM83Fw	5075439	RODRIGUEZ	EDGAR RAMON	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	COORD. MUNICIPAL EDUCACIÓN FÍSICA ESPECIAL	Sucre	006970068	NER NUC ESC RURAL N 068	113AWH	DOC. CONTRATADO A
nQkaP0TJ-FvIw-olc3-Iwop-xv17oEcg3XTt	5689055	LEON	JOSE RAFAEL	DIV DE COOR DTTOS ESCOLARES	DOCENTE	ANALISTA	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	1124DI	DOC. IV  /AULA
nQkaP0TJ-FvIw-olc3-Iwop-xv17oEcg3XTt	5689055	LEON	JOSE RAFAEL	DIV DE COOR DTTOS ESCOLARES	DOCENTE	ANALISTA DE PERSONAL	Sucre	007933003	E.B. MARISCAL DE AYACUCHO	1146DH	DOC. VI  /AULA
fBsOWHnN-8Keh-Hr9K-d5gb-u0yraWVWSyyi	5692570	MARQUEZ	DAISY LUISA	DIV. ACADEMICA	DOCENTE	APOYO ADMINISTRATIVO	Sucre	007914550	CB JOSE S GONZALEZ	1145DH	DOC. V   /AULA
vayoN4sZ-7I3r-fsiD-HWyO-2UgLEIsvb8UO	5707091	MORILLO FLORES	OMAIRA DEL ARMEN.	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE MUNICIPIO ESCOLAR Nº 06	Mejía	006970438	NER NUC ESC RURAL N 438	1122DI	DOC. II  /AULA
VNbeJXxh-UpCL-v1Vk-FHfA-pHtPK0ih4g1W	5708862	RIVAS CENTENO	ESTEBAN JOSE	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	COORD. DE ENLACE INTERINSTITUCIONAL	Sucre	006393320	CEBA. EL ISLOTE	1181ZH	DOC. I   /AULA
VNbeJXxh-UpCL-v1Vk-FHfA-pHtPK0ih4g1W	5708862	RIVAS CENTENO	ESTEBAN JOSE	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE		Sucre	007931709	EB CANTARRANA	1144DH	DOC. IV  /AULA
Azz6bLgJ-TPbo-Hpo2-34r6-Gul3XZugzZ6a	5875919	RAUSSEO ROJAS	ALEJANDRO MARCELINO	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE MUNICIPIO ESCOLAR Nº 04	Benítez	006736148	GE JOSE J ESCOBAR P	112AWI	DOC. CONTRATADO A
7Sr5D4iY-bD93-gRX8-o0al-mT0maleKNlsX	5907106	SALAZAR SUBERO	JOSEFINA DEL CARMEN	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE DE MUNICIPIO ESCOLAR Nº 7	Cajigal	004110130	JI RURAL ESCOLAR 130	1115DI	DOC. V   /AULA
OMtnu1ql-eVmb-WVO7-WKho-6gYgBCI3tVkx	5907342	GUILIANI SALAZAR	FABIAN ANTONIO	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE		Sucre	006731240	GE ADELAIDA NUÑEZ SUCRE	114AWH	DOC. CONTRATADO A
RxbTOVzN-zwq9-QrDK-Qkko-boiahUp5A9Ht	7955792	ECHEZURIA A.	CARLOS R.	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	SOPORTE TECNICO	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	20000C	TECNICO SUPERIOR UNIVERSI
qF1t8i1R-aBsB-NbdF-uB57-ete1D7q9IREg	8319211	HERRERA RODRIGUEZ	CARMEN DEL ROSARIO	DIV. ACADEMICA	DOCENTE	SISTEMATIZADORA	Sucre	007914550	CB JOSE S GONZALEZ	1146DH	DOC. VI  /AULA
u2HZnstO-yR4X-SBnI-Y8kX-JMHKWyYfgzEr	8436859	MARIN CORONADO	DANIEL ANTERO	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	COORD. ATLETISMO ESCOLAR	Sucre	006735890	GE JAVIER ALCALA VASQUEZ	1125DI	DOC. V   /AULA
pfCRsgnf-GJhg-QekF-KF0u-0Xv7POBc8X7S	8444104	RODRIGUEZ LOPEZ	NINFA MARGARITA	DIV DE COOR DTTOS ESCOLARES	DOCENTE	SUPERVISORA	Sucre	005506000	IC BAS JOSE A RAMOS S	1145DH	DOC. V   /AULA
eSKzFG32-pLEc-0DJm-JWP1-bw6ssJ9tof9I	8444220	HERNANDEZ CARMONA	JESÚS RAFAEL	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	JEFE DE DIVISION	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	114AWH	DOC. CONTRATADO A
eSKzFG32-pLEc-0DJm-JWP1-bw6ssJ9tof9I	8444220	HERNANDEZ CARMONA	JESÚS RAFAEL	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	JEFE DE DIVISION	Sucre	005602000	CD EMILIO TEBAR CARRASCO	115AWH	DOC. CONTRATADO A
lF9gnBT3-oAxd-9gdS-HXRR-g5aLsiTSZc96	8637491	HERNANDEZ GONZALEZ	HENRRY MIGUEL	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	COORD. GENERAL DE EDUC. FISICA, DEPORTE Y RECREACION MUNICIPIO SUCRE	Sucre	006397380	CEA MARCO ANT SALUZZO	1195NH	DOC. V   /AULA
pBxl0qeV-h5cK-wvmI-auoU-pDtxY3Wb2Zk3	8637873	CALDERA ESPINOZA	JOSÉ MANUEL	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	COORD. DEPORTE ESCOLAR	Sucre	007912150	CB CRUZ SALMERON A	1133DH	DOC. III /AULA
pBxl0qeV-h5cK-wvmI-auoU-pDtxY3Wb2Zk3	8637873	CALDERA ESPINOZA	JOSÉ MANUEL	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE		Sucre	007912150	CB CRUZ SALMERON A	1134DH	DOC. IV  /AULA
xnU97cAG-TbDW-v6Ld-WGpb-i9lQ1GCVHKNI	9273038	BELLO	GILBERTO LUIS	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE MUNICIPIO ESCOLAR Nº 11	Mejía	006737215	GE LUISA B DE RAMIREZ	1132DH	DOC. II  /AULA
Jy5nlJKl-Woaq-HzbJ-EbIh-y4UBgVVw1Ouz	9277945	CORDERO	ANTONIO RAFAEL	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	COORD. ENLACE F.V.D.E	Sucre	005506000	IC BAS JOSE A RAMOS S	1145DH	DOC. V   /AULA
9eYKXFLP-aaZS-0hqn-MYdS-O1YFuJvWMhT2	9279586	CHACON FRANCO	CRISEIDA MERCEDES	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFA DE DIVISION	Ribero	006563110	ESC DR ELISO SILVA DIAZ	1123DI	DOC. III /AULA
9eYKXFLP-aaZS-0hqn-MYdS-O1YFuJvWMhT2	9279586	CHACON FRANCO	CRISEIDA MERCEDES	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFA DE DIVISION	Sucre	006731240	GE ADELAIDA NUÑEZ SUCRE	1134DH	DOC. IV  /AULA
qbORHtrB-oFoR-wEp2-AfjK-C93E684hkMUC	9938605	BERROTERAN ROJAS	SHEIRA JOSEFINA	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE MUNICIPIO ESCOLAR Nº 10	Mariño	006739935	GE VIRGINIA BOR	1125DI	DOC. V   /AULA
9vsiY0EM-Uofl-5vWr-xE9b-uoxeX7jpk7Bl	9974366	CORONADO RODRIGUEZ	FRANCISCO ALBERTO	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE		Sucre	007310026	CP APEP CAIGUIRE	114AWH	DOC. CONTRATADO A
ymPo2LMA-naRN-FiLh-ebFI-KvrC041GZl0E	9976205	AMAYA CORONADO	ROSALBA	DIV DE COOR DTTOS ESCOLARES	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
giX1gHbw-qDmt-1W94-qL3x-FjQmaRg4yHN6	9978963	JIMENEZ M	MARYS T	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE DE MUNICIPIO ESCOLAR Nº 08	Andrés Eloy Blanco	006737546	GE MATIAS PARRA ALCALA	1125DI	DOC. V   /AULA
aOxGczwJ-YzLZ-vNfT-YeIJ-OJDiIzK8Q4jM	10462223	RINCONES GONZALEZ	JOSE GREGORIO	DIV DE PERSONAL	DOCENTE	JEFE DE DIVISION	Sucre	006394350	CEA FCO ARISTEGUIETA B	1173NH	DOC. III /AULA
cRwwnKV4-XmXe-tuYg-j8g8-gTOPbjtMpn6W	10463028	GOITIA GUERRA	MARIBY JOSEFINA	DIV DE COOR DTTOS ESCOLARES	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
cRwwnKV4-XmXe-tuYg-j8g8-gTOPbjtMpn6W	10463028	GOITIA GUERRA	MARIBY JOSEFINA	DIV DE COOR DTTOS ESCOLARES	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
bdCFuXmi-Axut-vOYO-mVkN-xohQhenJ6PHi	10877861	ANDARCIA M	VILMA CAROLINA	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE DE MUNICIPIO Nº 01	Andrés Eloy Blanco	007912050	CD JOSE M CARRERA	1143DH	DOC. III /AULA
tGB71liZ-pEcS-Ds1y-FgTr-vJLa2hDAovTO	10878310	MARTINEZ RODRIGUEZ	JOSÉ GREGORIO	DIV. ACADEMICA	DOCENTE	JEFE DE DIVISION	Sucre	007911370	LICEO ANT J DE SUCRE	1135DH	DOC. V   /AULA
24asAViO-gzXv-aiX8-ij7r-B7wnQC0zWIJl	10945859	BETANCOURT	CARMEN ELENA	DIV. ACADEMICA	DOCENTE	FACILITADORA	Sucre	006740235	UPE REP DE ARGENTINA	1124DI	DOC. IV  /AULA
3TIolz5o-PiUz-OwkB-oDkc-wadXzdmB2O4J	10949302	TOLEDO NUÑEZ	LUIS RAMON	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	COORD. DE ENLACE CON LOS CONSEJOS COMUNALES y COORD. DEL P.E.N.A.E	Sucre	007914550	CB JOSE S GONZALEZ	4130WH	DOC. (NG)/AULA
ho4pzswf-xDGe-iqv8-V94I-giR5ryusGF6L	11828475	SANCHEZ NEGRIN	KARENLY DEL VALLE	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE DE MUNICIPIO Nº 12	Montes	006970436	NER NUC ESC RURAL N 436	1111DI	DOC. I   /AULA
wHcs9QYA-Rzik-NFpH-xmgK-rIhkT7TyfYln	11829328	HERNANDEZ CAMPOS	OSWALDO ENRIQUES	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	COORD. SISTEMAS Y BASES DE DATOS	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	20000C	TECNICO SUPERIOR UNIVERSI
vAXudhr2-atrt-paRU-8ysX-K1bjLJWFlZhB	12273927	LOPEZ PEROZA	LUZ MARINA	DIV. DE INFORMATICA Y SISTEMAS	DOCENTE	JEFA DE DIVISION	Sucre	006625200	EN PEDRO ARNAL	4140WH	DOC. (NG)/AULA
YjuIh9tp-vvME-gYuO-2HSF-uWdo8457FPdE	12664427	PRADA DE OLIVIER	DIVANOSKA CARMELITA	DIV DE PERSONAL	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	300000	PROFESIONAL UNIV. I
7j2vNzpf-31zJ-y1ph-9iWm-y2DSnW0Wr6Vn	12665827	VELIZ MORALES	ODER LUIS	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	COORDINADOR SOPORTE TECNICO	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	300000	PROFESIONAL UNIV. I
7j2vNzpf-31zJ-y1ph-9iWm-y2DSnW0Wr6Vn	12665827	VELIZ MORALES	ODER LUIS	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	SOPORTE TECNICO	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	30000C	PROFESIONAL UNIVERSITARIO
tWqFMqZr-WqGH-2jxS-xcZ7-TOUpC777ZhDW	13051438	MARQUEZ BASTARDO	EVELYN MARIA	DIV DE COOR DTTOS ESCOLARES	ADMINISTRATIVO	SECRETARIA	Sucre	001200480	DESPACHO DEL DIRECTOR ZONA SUC	20000C	TECNICO SUPERIOR UNIVERSI
H2i8e7nh-bl5N-SBau-pCX7-mKU39rGAMMGs	13052053	HERNANDEZ C.	LEONARDO J.	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	DOCENTE	COORD. DE DEPORTE ESCOLAR MUNICIPAL	Bolívar	006734930	GE FCO MEJIA	4120WI	DOC. (NG)/AULA
uIZp8JQZ-rWlS-2a4F-lLx5-DB508IX9jLKI	13221578	CORASPE P.	FRANCIEL J.	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	JEFA (E) DE DIVISION	Sucre	006731240	GE ADELAIDA NUÑEZ SUCRE	30000C	PROFESIONAL UNIVERSITARIO
uIZp8JQZ-rWlS-2a4F-lLx5-DB508IX9jLKI	13221578	CORASPE P.	FRANCIEL J.	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	SOPORTE TECNICO	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	300000	PROFESIONAL UNIV. I
uC2vFMIm-5IIU-mfA9-8Dgg-59IGDdcBTyGN	13293498	ZAPATA AGUILERA	JESUS ALEXANDER	DIV DE COOR DTTOS ESCOLARES	DOCENTE	JEFE DE MUNICIPIO ESCOLAR Nº 3	Arismendi	007933267	EB LAS CHARAS	1122DI	DOC. II  /AULA
lruEtbBP-BSXm-7BEW-n1Su-nqOfGr8GpdjK	13498704	CEDEÑO B.	ERIKA DEL VALLE	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	SECRETARIA	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	100000	BACHILLER I
c4usr9KN-IjOc-yf1I-dlXE-ktvFK48l5gb7	13539047	FARIAS	RICHARD JOSE	DIV DE COOR DTTOS ESCOLARES	OBRERO	MENSAJERO	Sucre	007950569	U E LAS PALOMAS	8030C	ASEADOR CONTRATADO
HJ1yojtb-sl5j-yyza-nBmu-YIfyvTFnhd9v	13630478	VERA NUÑEZ	NAYAHIBITH JOSE	DIV DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
HJ1yojtb-sl5j-yyza-nBmu-YIfyvTFnhd9v	13630478	VERA NUÑEZ	NAYAHIBITH JOSE	DIV DE PERSONAL	DOCENTE	SECRETARIA	Sucre	006562832	ESC CRUZ DE LA UNION	4120WI	DOC. (NG)/AULA
XCnp7V8g-k9Dd-H1nl-QBgK-4JBSeYoi3QgX	13847923	COVA VEROES	LIL CAROLINA	DIV DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006490385	IEEB SIMON BOLIVAR	100000	BACHILLER I
XCnp7V8g-k9Dd-H1nl-QBgK-4JBSeYoi3QgX	13847923	COVA VEROES	LIL CAROLINA	DIV DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	999999990	COMISIÓN DE SERVICIOS	100000	BACHILLER I
23g3vFwS-0TXC-f5EZ-z6rt-ZD3idVYr5xjs	14124487	RIVERO SALAZAR	MARLUZ JOSEFINA	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
8k982VWv-NA1R-sihP-3HB9-gQLOwLpPb7e9	14596137	CHACON FRANCO	ARMANDO LUIS	DIV DE COOR DTTOS ESCOLARES	ADMINISTRATIVO	SECRETARIO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
EpdmHNqm-o1Q4-UyHS-GclZ-r8utiq3m4uZW	15318478	RODRIGUEZ MORENO	ESTHER MARIA	DIV DE COOR DTTOS ESCOLARES	DOCENTE	SUPERVISORA	Bolívar	006970227	NER NUC ESC RURAL N 227	1141WH	DOC. I   /AULA
EpdmHNqm-o1Q4-UyHS-GclZ-r8utiq3m4uZW	15318478	RODRIGUEZ MORENO	ESTHER MARIA	DIV DE COOR DTTOS ESCOLARES	DOCENTE	SUPERVISORA	Mejía	007913125	C D FRANCISCO ALEMAN P	1143DH	DOC. III /AULA
Ldbscar0-uv5r-6Is2-2zL3-o3fVKKFxde0Z	15741212	GUEVARA CASTILLO	EDGAR FERNANDO	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	SOPORTE TECNICO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	200000	TSU I
pmDy8wtR-DaaH-bleF-Oik0-o3JmPvNeJhqq	15935274	ACUÑA CORONADO	EMIRA GRABIELA	DIV. ACADEMICA	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	001200480	DESPACHO DEL DIRECTOR ZONA SUC	10000C	BACHILLER CONTRATADO
kIe0INc9-8Qtt-E3IS-IbOP-XGzJAz8b3azT	16485514	FLORES PATIÑO	MARY TRINI	DIV DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	005786900	CD MODESTO SILVA	10000C	BACHILLER CONTRATADO
2H4ED5GG-ALM0-P9LN-rpTw-goYSvU2oPZtp	16486117	HERRERA H.	CARMEN E.	DIV DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
2H4ED5GG-ALM0-P9LN-rpTw-goYSvU2oPZtp	16486117	HERRERA H.	CARMEN E.	DIV DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006562832	ESC CRUZ DE LA UNION	100000	BACHILLER I
ogUoxPCB-udih-bRPd-bWHt-NZ2k3MFGUPHD	17214533	BETANCOURT GUTIERREZ	GELSON MIGUEL	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	SOPORTE TECNICO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
z41J0ojo-QqxJ-3X86-2Hzn-rvIegytJqMqE	17911085	SENIOR YEGRES	BARBARA ELU	DIV. DE COORD ENTES PUBLI Y PRIV  DEP	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
ztpVHylO-I47h-jLDU-7lGL-66djvyvct02w	18211942	RONDON URBANO	CLAUDIO ROBERTO	DIV. DE INFORMATICA Y SISTEMAS	ADMINISTRATIVO	PROGRAMADOR DE SISTEMAS Y BASES DE DATOS	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	10000C	BACHILLER CONTRATADO
QWQVVhll-L8Iz-gZna-JvV1-WKSXTQGeajQq	22749322	RODRIGUEZ COTA 	FERNAN ENRIQUE	DIV. ACADEMICA	DOCENTE	COORDINADOR PROGRAMA MANOS A LA SIEMBRA	Sucre	006970201	NER NUC ESC RURAL N 201	1123DI	DOC. III /AULA
l5sTQARM-cIIW-vSAC-UX3f-87GUFvvC73ge	4189242	GOMEZ M. 	REINALDO E.     	ALMACEN GENERAL	DOCENTE	COORDINADOR	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	4130WH	DOC. (NG)/AULA
SRzX912M-0ctK-Nmg5-5wCL-Q5jPorJ356Ou	11828531	MARTINEZ 	MARY            	ALMACEN GENERAL	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
wGeNr06o-cXPA-rcFS-C6gS-d96QIzgesFGv	12271535	CARVAJAL	MARIA TERESA	ALMACEN GENERAL	ADMINISTRATIVO	SECRETARIA	Ribero	006568093	ESC BOLIVARIANA SANTA CRUZ	10000C	BACHILLER CONTRATADO
c3amHwKJ-kUkN-NxiW-9h0F-yGlEcc4yIZRp	13359431	GUZMAN LOBATON	RAMON JOSE	ALMACEN GENERAL	OBRERO	AYUDANTE DE ALMACEN	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8630N 	AYUDANTE DE ALMACEN      
1c3n6608-PIDS-MdNn-cOCd-OgQr86R6h5ZO	17540371	ROJAS ROJAS	RICHARD DANIEL	ALMACEN GENERAL	OBRERO	AYUDANTE DE ALMACEN	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
kOM7INSp-hrmA-e0hY-hB8j-XVLO9kAJ1xl0	17911545	DOMINGUEZ 	HECTOR         	ALMACEN GENERAL	OBRERO	AYUDANTE DE ALMACEN	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
6AXzF8N7-XVns-ofKx-M6sE-pv4LFzxCIvXq	4184189	DE LA ROSA	LUIS ALFREDO	ALMACEN INTERNO	OBRERO	ASISTENTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
eiPKvv9D-j8Ov-E9q9-naNR-YIkDmgCHeinE	6806639	CARVAJAL GUZMAN	LUIS JOSE	ALMACEN INTERNO	OBRERO	COORDINADOR	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8490N 	SUPERVISOR DE MANT       
UOvkhr2J-dlE7-QrQf-ejlY-QzWV65tQq8kg	8637569	MIERES GUZMAN	LUIS JOSE	ALMACEN INTERNO	OBRERO	ASISTENTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
glZmAnOL-1mYH-Yvft-Md4I-EsYu9LhN3oY7	5085292	SALAZAR	EVELYN TIBISAY	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	300000	PROFESIONAL UNIV. I
glZmAnOL-1mYH-Yvft-Md4I-EsYu9LhN3oY7	5085292	SALAZAR	EVELYN TIBISAY	ANALISTAS DE PERSONAL	DOCENTE	ANALISTA	Sucre	007933325	EBA. CANTARRANA	4180ZH	DOC. (NG)/AULA
Ju9vtaze-CwQG-tlnh-LVKO-2hlHiAHksiGe	10945524	PEREZ	EVELIN COROMOTO	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
Ju9vtaze-CwQG-tlnh-LVKO-2hlHiAHksiGe	10945524	PEREZ	EVELIN COROMOTO	ANALISTAS DE PERSONAL	DOCENTE	ANALISTA	Sucre	007933325	EBA. CANTARRANA	1181ZH	DOC. I   /AULA
QrfW7gVp-ixbY-bsPB-6TgP-tSFewrA2TUoo	10953633	VASQUEZ HERNANDEZ	ANA ROSA	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	300000	PROFESIONAL UNIV. I
1RndwOmA-FeZn-NKwh-FntD-HG2BDLU1Q4kX	12658428	ROJAS LEMUS	EVELYN CAROLINA	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	001200489	DIV DE PERSONAL	200000	TSU I
1RndwOmA-FeZn-NKwh-FntD-HG2BDLU1Q4kX	12658428	ROJAS LEMUS	EVELYN CAROLINA	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	002071745	DIVISION DE DOCENCIA	20000C	TECNICO SUPERIOR UNIVERSI
mV6dg5x4-Pcpj-F4Yt-ced8-weW0eWAoF89T	12659398	CORONADO SERRANO	MARY CRUZ	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
3Zv9tdRG-kp1B-nW75-XZDT-KwAkl1he8HTz	12661569	SUAREZ RODRIGUEZ	FRANKLIN JOSE	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	001200489	DIV DE PERSONAL	10000C	BACHILLER CONTRATADO
3Zv9tdRG-kp1B-nW75-XZDT-KwAkl1he8HTz	12661569	SUAREZ RODRIGUEZ	FRANKLIN JOSE	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
1aGgon3E-rA0h-oCPf-ILPR-Ouro9b7iMfCA	14283685	PEREZ ZAPATA	JOEL ALEXANDER	ANALISTAS DE PERSONAL	ADMINISTRATIVO	COORDINADOR	Sucre	001200489	DIV DE PERSONAL	310000	PROFESIONAL UNIV. II
TjoYc3p5-LQ67-z3bG-61l0-LbUjvgPFpp0u	14815821	SALAZAR BARRIOS	YODANNY YSABELA	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	001200482	DIV. DE CORD ENTES PUBLI Y PRIV CUT	100000	BACHILLER I
4FTepZKu-6YYP-zyGY-Cjyw-996HoT0GuBUq	15360982	MARIN GUTIERREZ	EHILIN DEL VALLE	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
zARhLtTP-kvwS-i1ME-Zo9m-DrO8ng4DoAQp	17673368	CARREÑO	JUAN CARLOS.	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	001200489	DIV DE PERSONAL	200000	TSU I
zARhLtTP-kvwS-i1ME-Zo9m-DrO8ng4DoAQp	17673368	CARREÑO	JUAN CARLOS.	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
8GEGhXGk-pXqL-xZpg-eJcz-SiMwjQwLl6VV	18210513	CUMANA R	FRANCISCO MIGUEL	ANALISTAS DE PERSONAL	ADMINISTRATIVO	ANALISTA	Sucre	001070586	DPTO PAGO DIRECTO R NOR O	10000C	BACHILLER CONTRATADO
z5OQGtMz-1SBY-MhLb-aLel-cIgUcEESjw1j	18211110	GONZALEZ CASERTA	GINA TERESA	ANALISTAS DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
euFkqLuT-Q7rw-XogA-nAy9-Rkte1NkMVudK	8374420	MORGADO SEBASTIANI	YADELSY DEL VALLE	AUDITORIA INTERNA	ADMINISTRATIVO	AUDITORA	Sucre	999999990	COMISIÓN DE SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
Z6wBfaGt-pob3-CpUL-KAzD-JsIxFht6SGZ5	10839224	RAMOS CORDOVA	RUTH DEL VALLE	AUDITORIA INTERNA	ADMINISTRATIVO	AUDITORA	Sucre	999999990	COMISIÓN DE SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
JkawKnGv-B2nJ-q5zu-qnNY-XB5srewjdbUF	5694275		LOPEZ DE H. LUISA T.     	CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS	DOCENTE	ADMINISTRADOR	Sucre	006564880	ESC JOSE A RAMOS SUCRE	1134DH	DOC. IV  /AULA
VIkqjsWi-RnJb-n6tM-sDfT-uqEAibzZR1nb	9271678	GUZMAN PRESILLA	LEONARDA DEL VALLE	CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS	DOCENTE	SUPERVISORA	Valdez	007700003	CEBIT GUIRIA	1134DH	DOC. IV  /AULA
vVta84TT-UOmS-gKfw-XcrA-sMKzKZUsUhFn	11384329	BENITEZ PATIÑO	ROSSANA JOSELBA	CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS	DOCENTE	DOCENTE DEL CPSET	Ribero	007700004	CEBIT CARIACO	1134DH	DOC. IV  /AULA
NZvxU9D9-BoDh-dGfC-z9Lj-8eSpN4IbGMZ9	12276710	PERDOMO BENITEZ	SELSY DEL VALLE	CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS	ADMINISTRATIVO	DOCENTE	Sucre	001200489	DIV DE PERSONAL	20000C	TECNICO SUPERIOR UNIVERSI
fwmKyimL-KSDP-14gn-Nb3g-RKV6eeca161I	13924308	FLORES FARIAS	CLAUDIMER DOLORES	CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS	DOCENTE	DOCENTE DEL CPSET	Ribero	007700004	CEBIT CARIACO	1133DH	DOC. III /AULA
jl0tDUfh-0h7I-tJSv-NVmC-T03AtNcok1TK	13924912	LEON B.	EDUARDO R.	CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS	ADMINISTRATIVO	COORDINADOR	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	20000C	TECNICO SUPERIOR UNIVERSI
eTIx8Eef-0Won-Dwk3-g9so-qCoyfSHnyhOb	17213876	ROMERO RUIZ	VICTOR JOSE	CENTRO DE PRODUCCION Y SOLUCIONES EDUCATIVAS TECNOLOGICAS	ADMINISTRATIVO	PROGRAMADOR	Sucre	007911647	C B ANTONIO LEMUS PEREZ	10000C	BACHILLER CONTRATADO
E5GvigKJ-S36P-7Cbq-YNx1-q30EsEFAmXaa	5706127	MUNDARAY M	ANAHYS DEL V	CONSEJO ZONAL I	ADMINISTRATIVO		Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
HI7qyzHa-EhOG-k8ZQ-SF2s-HWm71JTVZyOe	14597039	RENGEL BASTARDO	ANGELICA MARIA	CONSEJO ZONAL I	ADMINISTRATIVO	COORDINADORA	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	30000C	PROFESIONAL UNIVERSITARIO
Omf6rZYY-ZRTa-2bcW-au8J-iOLGPfmgKF7P	13358915	MUÑOZ FRONTADO	JEAN CARLOS	COORD. ANALISIS SITUACIONAL	DOCENTE	ASISTENTE	Sucre	006731542	GE ANX NOR PEDRO ARNAL	4120WI	DOC. (NG)/AULA
bTqnolgO-m0Zf-jJ6P-jHvY-zSbGsi8Ovk9g	14126200	CESIN E	RICHARD E	COORD. ANALISIS SITUACIONAL	DOCENTE	ASISTENTE	Sucre	006731542	GE ANX NOR PEDRO ARNAL	1123DI	DOC. III /AULA
TVAN7AXe-YmQ8-PS15-0PBL-oVoDwST9hQZD	15935969	CASTAÑEDA RIVERO	ELVIS GREGORIO	COORD. ANALISIS SITUACIONAL	DOCENTE	ASISTENTE	Sucre	006731542	GE ANX NOR PEDRO ARNAL	1123DI	DOC. III /AULA
ZJhRVTcj-Uqeq-arbb-Zpjg-danatPqDEqU9	18904519	GUTIERREZ GOMEZ	YULIMAR JOSE	COORD. ANALISIS SITUACIONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
QMGF9zsf-N3BA-2bSU-UuIT-du4njj7WXbga	5692295	CASTAÑEDA DE RIVERO	FLOR MARIA	COORD. ARCHIVO GENERAL	ADMINISTRATIVO	SECRETARIA	Sucre	001200480	DESPACHO DEL DIRECTOR ZONA SUC	100000	BACHILLER I
9E8JPka5-2U9m-E7BU-T3tf-PFCizbiag3mr	8635042	BARRIOS GONZALEZ	SIURMAN CECILIA	COORD. ARCHIVO GENERAL	ADMINISTRATIVO	SECRETARIA	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
dnNslYAg-A1by-1wxU-1BGI-5DoXdN4tpVCJ	10883091	MARTINEZ DE MARTINEZ	NINOSKA DEL CARMEN	COORD. ARCHIVO GENERAL	DOCENTE		Sucre	006399964	EBA GRAN MARISCAL DE AYACUCHO	4180ZH	DOC. (NG)/AULA
512aNubG-4dKL-rprg-ZAeR-6YwTAWYtqGS6	14670868	MACHADO BARRETO 	JUAN CARLOS	COORD. ARCHIVO GENERAL	ADMINISTRATIVO	COORDINADOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
q0hs9EAv-edXA-Nw9Y-Tvyh-q8LJYpSknm88	16315711	BERMUDEZ MALAVE	NORIBEL DEL VALLE	COORD. ARCHIVO GENERAL	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
2kdpiQHj-avmY-mfOb-UpMX-NXhvwJFSst7u	5088903	DE LA ROSA M.	BELKYS M.	COORD. BECAS NACIONALES	ADMINISTRATIVO	TRABAJADOR SOCIAL	Sucre	001200487	DIV. DE PROTECCION Y DES EST	30000C	PROFESIONAL UNIVERSITARIO
UYlyMysb-9uiI-TVFe-ZFlL-786FyXsbvAHf	5697111	GONZALEZ L	YURAIMA R     	COORD. BECAS NACIONALES	DOCENTE	COORDINADORA	Sucre	004107465	JI NUEVA TOLEDO	1715WI	DOC. V   /SUB-DIRE
EjC6BkYQ-T3yK-zIMa-iwfG-HohzPo6jyk2e	8381283	ARISMENDI ZARZALEJO	ANAYS	COORD. BECAS NACIONALES	DOCENTE	COORDINADOR	Sucre	006399000	CEA REPUBLICA ARGENTINA	1174NH	DOC. IV  /AULA
W7uonspS-b4Mk-iQ3M-fmAw-zAhXHkI0g4PN	9450388	RAMIREZ BEJARANO	EUDIS DEL VALLE	COORD. BECAS NACIONALES	ADMINISTRATIVO	TRABAJADOR SOCIAL	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	300000	PROFESIONAL UNIV. I
I0o7xyXy-FiuH-M38k-wdEu-Sv4Ddp1kKWyO	9976178	CABELLO CORDERO	ENEIDA DEL VALLE	COORD. BECAS NACIONALES	ADMINISTRATIVO	SECRETARIA	Bermúdez	600740775	SUPERV NOR ORIENTAL	100000	BACHILLER I
zmJv5XbF-04GP-xShi-4ATY-y0MuwGlRODkV	10513281	TINEO RODRIGUEZ	ELIZABETH	COORD. BECAS NACIONALES	ADMINISTRATIVO	AYUDANTE DE ARCHIVO	Sucre	007912085	CB VICENTE S Y URBANEJA	100000	BACHILLER I
zmJv5XbF-04GP-xShi-4ATY-y0MuwGlRODkV	10513281	TINEO RODRIGUEZ	ELIZABETH	COORD. BECAS NACIONALES	OBRERO	AYUDANTE DE ARCHIVO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
rTnpD16d-7Kiv-Aiao-x6qg-NlKnbqo18iGr	14815501	HERRERA LASTRA	NIURBYS LUISA	COORD. BECAS NACIONALES	ADMINISTRATIVO	ANALISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
NIFZtU0b-YdCW-EDmO-2SnX-JlZBOIDV4pMu	17672181	MILLAN MALAVE	JORGE LUIS	COORD. BECAS NACIONALES	ADMINISTRATIVO	SECRETARIA	Sucre	001070586	DPTO PAGO DIRECTO R NOR O	10000C	BACHILLER CONTRATADO
Vinvi52c-NP1C-1niZ-SM5r-jC3oelDiLM7n	4785788	SALAZAR FOUCALULT	JOSE GREGORIO	COORD. BIENES NACIONALES	ADMINISTRATIVO	SECRETARIO	Sucre	001200482	DIV. DE CORD ENTES PUBLI Y PRIV CUT	10000C	BACHILLER CONTRATADO
Gw4ny39O-PBN9-mzF6-natV-yxeinRL4y6dZ	11825540	FREDA BAEZ	YACQUELIN	COORD. BIENES NACIONALES	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	200000	TSU I
moObJHWo-oyVl-aq7c-RdYM-xOMZwNqDRoJQ	12270979	PEREZ RODRIGUEZ	MARIA ALEJANDRAA	COORD. BIENES NACIONALES	ADMINISTRATIVO	COORDINADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
KHJ1BPoQ-eljb-0Gb3-fXrR-HJ8ibgCDuw5X	12272889	SERRANO LOPEZ	SUGEYS MARINA	COORD. BIENES NACIONALES	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	20000C	TECNICO SUPERIOR UNIVERSI
om1NHZ42-PF03-DRWa-crdq-O9dpNHEJJItO	13772320	GONZALEZ FEBRES	MIRELYS	COORD. BIENES NACIONALES	OBRERO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8670N 	RECEPTOR-INFORMADOR      
Fthu24jf-KYZ5-ZZFB-4eL0-zocr4SjYO7DO	13835153	ESTRADA PETRIGLIA	ELIAS JOSGREG	COORD. BIENES NACIONALES	ADMINISTRATIVO	ADMINISTRATIVO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	20000C	TECNICO SUPERIOR UNIVERSI
N6rKTRwn-OgBI-vBG6-kSkS-zv9j8lCSzlFa	17212718	RAVELO PEINADO	BLANCA ANG	COORD. BIENES NACIONALES	ADMINISTRATIVO	ADMINISTRATIVO	Sucre	006490380	IEEB EZEQUIEL ZAMORA	10000C	BACHILLER CONTRATADO
DlUXAuDA-w1ZF-plEz-juMd-T66acDbNPKmW	17950286	VILLAZANA MARTINEZ	MARIA TERESA	COORD. BIENES NACIONALES	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
LIPYztVZ-JBgh-YI5r-nRet-5Z8QOb8WheqC	5704392	MARQUEZ VERA	VISNELLYS JOSEFINA	COORD. COMPRAS	ADMINISTRATIVO	SECRETARIA	Sucre	001070586	DPTO PAGO DIRECTO R NOR O	10000C	BACHILLER CONTRATADO
vWeZ7q5H-w9nR-jWfu-WcBQ-IiRoYIdoMf0C	8435598	ARCIA GARCIA	ELSA DEL VALLE	COORD. COMPRAS	ADMINISTRATIVO	ANALISTA	Sucre	001200486	DIV. DE PLANIFICACION Y PRESUPUESTO	300000	PROFESIONAL UNIV. I
IAgWNAUa-ON2F-ZRZP-KKax-YbjR30O3eJWE	10952824	RODRIGUEZ GUZMAN	NORMELIS DEL VALLE	COORD. COMPRAS	ADMINISTRATIVO	ANALISTA	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
8abPMnDv-ui7c-ZE7U-KVAK-NKnx5erdclWc	11379082	FIGUEROA ZAPATA	ELBA JOSEFINA	COORD. COMPRAS	ADMINISTRATIVO	ANALISTA	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	10000C	BACHILLER CONTRATADO
dWMq5HKN-V2Cj-AUkM-4XI8-Ku0jLH6hzP07	12657097	CARABALLO VELIZ	YENNI BEATRIS	COORD. COMPRAS	ADMINISTRATIVO	SECRETARIA	Sucre	001200487	DIV. DE PROTECCION Y DES EST	100000	BACHILLER I
s4jfmgHI-HVDb-kum9-scir-ByDrPUoOZosq	13220701	ROSAS LOPEZ	JUAN CARLOS	COORD. COMPRAS	DOCENTE	COORDINADOR	Sucre	005786900	CD MODESTO SILVA	4150WH	DOC. (NG)/AULA
RTK6uA9I-GPFD-QGWL-5A0e-lxc7FyOMginq	13358847	GONZALEZ MORA	ANA DOLORES	COORD. COMPRAS	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
DAoucJP8-A6Bz-GI5t-dyb6-qQpfVPQXpRVE	14009903	CARIACO BLANCA	MAGALY JOSEFINA	COORD. COMPRAS	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
6vvjoUyv-NCzy-obgk-Oesr-V8sOpFjjWxpz	14886220	CASTILLO VASQUEZ	FEGLYS DE JESUS	COORD. COMPRAS	ADMINISTRATIVO	ANALISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
ETCak07y-S901-uWpP-dcOx-LR256ynhTbUv	15742989	CALDERA VASQUEZ 	JOSE GREGORIO	COORD. COMPRAS	OBRERO	MENSAJERO	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8636N 	OPER DE MAQ FOTOCOPIADORA
MVUzeLp2-xxRj-vi7a-D1Pc-ihtL5LXdBBbo	17910703	ZERPA MARCANO	ONAXIS DEL VALLE	COORD. COMPRAS	OBRERO	OPERADOR DE MAQUINA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
TJF6yKAJ-ZhUz-DDHe-VXvv-If46UPNkEYtA	4050798	SALAZAR DE FALCON	HELENYA JOSE	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	SOCIOLOGA	Sucre	004700043	NIBE SUCRE	310000	PROFESIONAL UNIV. II
OPL5F2Jx-cFyc-UdwS-4hlX-9Dl5QxgZPKcX	4185179	HIDALGO DE DE LA ROSA	GLEDIS MIGUELINA	COORD. COMUNIDADES EDUCATIVAS	DOCENTE		Sucre	007915780	CB LUIS GRATEROL B	1134DH	DOC. IV  /AULA
uWKTEWYf-HdKR-bYBE-6lLS-hmhMGA3J6e7G	4218472	GAMBOA DE PAREJO 	NELLY MARIA	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	ADMINISTRADOR INTERNO	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
cltA6bAM-biIG-X4gi-IJY6-MO1hIxBSkoZC	4946808	VILLARROEL	ALEXIS JOSEFINA	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	SUPERVISOR	Sucre	007933003	E.B. MARISCAL DE AYACUCHO	1145DH	DOC. V   /AULA
4blfdafY-hCOL-CEd0-RFHq-12HIgxe1QN2b	5075872	GUERRA MENDEZ	ALICIA JOSEFINA	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	COORDINADOR	Sucre	007911647	C B ANTONIO LEMUS PEREZ	4130WH	DOC. (NG)/AULA
KhpywHJN-lWD9-yoHo-sbOb-xsyxXapi7xYQ	5087525	ALVAREZ E	GRECIA M	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	SECRETARIA	Sucre	001200484	DIV. ACADEMICA	100000	BACHILLER I
XXUEOOr1-AfXU-bTSF-qdkb-aJK6fAxzOPDA	5088709	MARTINEZ D	ANA ROSALIA	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	SUPERVISOR	Sucre	007933003	E.B. MARISCAL DE AYACUCHO	1135DH	DOC. V   /AULA
54q27cMZ-gYNN-KAUC-OYDC-QEHJo0sSAfMk	5690839	ARCAS MARQUEZ	FERNANDO LUIS	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	SUPERVISOR	Mejía	007913125	C D FRANCISCO ALEMAN P	1141WH	DOC. I   /AULA
ImIw9jk4-woTC-oblo-keyM-tzVEyoIlJDzM	5696743	MORALES M	MANUEL M	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	ABOGADO	Sucre	001200489	DIV DE PERSONAL	200000	TSU I
qvNIwmBC-fBQj-Iww7-AYIT-2Llk7NXiVtmg	8440262	BELA DA FONSECA JIMENEZ	MARITZA JOSEFINA	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	ADMINISTRADOR INTERNO	Sucre	005508090	U.I. JUAN P. PEREZ A.	10000C	BACHILLER CONTRATADO
YNftKa8o-2o03-wO4a-lynA-Jlu7HEwULs8X	8484048	FERMIN ORTIZ	PETRA AGRIPINA	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	ADMINISTRADOR INTERNO	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	300000	PROFESIONAL UNIV. I
f3upOEPP-D38z-xJVb-WLVK-nyv4yIe0Gvmt	8654027	MILLAN OTERO	RICHARD JOSÉ	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	COORDINADOR	Sucre	006970201	NER NUC ESC RURAL N 201	1124DI	DOC. IV  /AULA
fHdxiTHo-l6xY-2rSw-MrgS-vx2nnDo5FBNP	9278056	BRUZUAL HERNANDEZ	MAGDA JOSEFINA	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	ADMINISTRADOR INTERNO	Sucre	005786900	CD MODESTO SILVA	1151WH	DOC. I   /AULA
NmwepaoQ-C51c-DvWO-Tkv2-PdwnIRiroTgq	9278889	MAESTRE RONDON	HENRY LUIS	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	ADMINISTRADOR INTERNO	Bermúdez	006738570	GE PETRICA DE QUILARQUE	1132DH	DOC. II  /AULA
8S1xrWrm-tmQa-uQMI-hNmz-sPWOaYg4B0Qm	9974485	GUERRA RODRIGUEZ	YEMNIFER COROMOTO	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	SUPERVISOR	Sucre	006732086	GE LUIS A MORALES R	1122DI	DOC. II  /AULA
iYsU89mY-JBhO-P6st-5WzP-fHprYhAz2vXf	11375505	MARQUEZ GARCIA	NINOSKA JOSEFINA	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
rDC7ks9v-Kv3g-KlGY-qz9H-x5EtH7yHXvEQ	11446726	ROMERO	NEIDA MARGARITA	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	SUPERVISORA	Sucre	006970068	NER NUC ESC RURAL N 068	1142DH	DOC. II  /AULA
rDC7ks9v-Kv3g-KlGY-qz9H-x5EtH7yHXvEQ	11446726	ROMERO	NEIDA MARGARITA	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	SUPERVISORA	Sucre	006970068	NER NUC ESC RURAL N 068	1143DH	DOC. III /AULA
f5LRt2De-PGJC-XGdX-xwNf-jVxHf6fQhEYI	11602225	MONTES R 	AYMARA DEL VALLE	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	ADMINISTRADOR INTERNO	Bolívar	006970227	NER NUC ESC RURAL N 227	4120WI	DOC. (NG)/AULA
VStLQNC5-1YpX-K0fU-SIJf-ky0oOHMFcw2C	13942617	BELLO HERNANDEZ	IDALIA NINOSKA	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	ADMINISTRADOR INTERNO	Sucre	007912247	CB VII GDO REP ARGENTINA	30000C	PROFESIONAL UNIVERSITARIO
ZdbpR58j-c1tl-8Sl9-On9Q-BPqusWX3NjMy	14124249	ALEMAN BOADAS	LUIS EMILIO	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	ADMINISTRADOR INTERNO	Sucre	002071745	DIVISION DE DOCENCIA	20000C	TECNICO SUPERIOR UNIVERSI
1iP2WQES-oKhC-sjMo-RFzb-KliuKpGOKVeh	14124653	RODRIGUEZ DIAZ	JUAN MANUEL	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	ADMINISTRADOR INTERNO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
CdEPCfd6-eQOa-033E-S6GQ-iNFKIPxbQrWD	15113022	LOPEZ MARCANO	VIRGILIO RAFAEL	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	SECRETARIO	Benítez	006736148	GE JOSE J ESCOBAR P	4130WH	DOC. (NG)/AULA
SpJXpqrK-uCHQ-g9XF-HEFD-SE2dWDJEOpOH	15740484	PEREZ ARCAS	MARY CARMEN	COORD. COMUNIDADES EDUCATIVAS	DOCENTE	SUPERVISORA	Sucre	006740235	UPE REP DE ARGENTINA	1122DI	DOC. II  /AULA
6BS63hVi-tuIi-DglK-jMxo-MAF5tBbdK4he	16673580	ROBALLO GONZALEZ	MARIANNETH YELINET	COORD. COMUNIDADES EDUCATIVAS	ADMINISTRATIVO	ADMINISTRADOR INTERNO	Sucre	001070586	DPTO PAGO DIRECTO R NOR O	10000C	BACHILLER CONTRATADO
pZo8PYzZ-OEY4-exAy-iDR5-KpO6ZmhgLn90	4684332	FRANCO A	CARMEN A	COORD. CONTABILIDAD	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	100000	BACHILLER I
VjY1p20q-uRwA-4lXQ-SLxE-w9jz0eu5NZtJ	4692730	TRUJILLO T	JOSE G	COORD. CONTABILIDAD	ADMINISTRATIVO	ANALISTA FEDE	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	200000	TSU I
NNhFVdEv-P2Kv-VMD7-gqh6-IeZluUEG6z1j	8641708	BRUZUAL ARENAS	CARMEN ELOINA	COORD. CONTABILIDAD	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	100000	BACHILLER I
AvAPQKiH-FvAb-BaAi-tuXX-jkyRdXf4oiwC	9271512	ALCANTARA	LERIDA JOSEFINA	COORD. CONTABILIDAD	ADMINISTRATIVO	AGENTE RETENCION DE IMPUESTOS	Ribero	007935024	EB STA MARIA	30000C	PROFESIONAL UNIVERSITARIO
E4op1moz-3oF8-7rJv-uBKU-CtUjWB22gTxB	11383041	BARRETO	YAMILET DEL ROSARIO	COORD. CONTABILIDAD	ADMINISTRATIVO	ANALISTA	Sucre	002071827	SEC EDUC PRE Y ESP	20000C	TECNICO SUPERIOR UNIVERSI
IjbIGIzh-eWIR-euJZ-LDMZ-VlLHqUXd0lVm	11827562	ARREDONDO DE MUNDARIN	MORELIA DEL CARMEN	COORD. CONTABILIDAD	ADMINISTRATIVO	ANALISTA SIGECOF	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
Qr7xEmjM-days-YCpe-Am8n-rOvYf9GFp281	12272555	SANCHEZ CORDERO	MARIA MARCELINA	COORD. CONTABILIDAD	OBRERO	RECEPTOR DE DOCUMENTOS	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
taDfsPJO-thqj-T0uN-FaAU-QTVHlWGnKZaU	12666588	ASTUDILLO AGUILERA	YECENIA COROMOTO	COORD. CONTABILIDAD	ADMINISTRATIVO	ANALISTA SIGECOF	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
hA0jUG4R-sjVn-Wiwu-Y2nW-UzN4oR9xijGB	13772075	LICET GONZALEZ	ISABEL CRISPINA	COORD. CONTABILIDAD	ADMINISTRATIVO	ANALISTA SIGECOF	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
vzZUU3ny-9RRA-EpQR-UIdC-EADcEDPSg0J9	15741132	LANDAETA MENDOZA	ANA JULIA	COORD. CONTABILIDAD	ADMINISTRATIVO	COORDINADORA	Sucre	007911647	C B ANTONIO LEMUS PEREZ	30000C	PROFESIONAL UNIVERSITARIO
eLJhKOq2-VtR9-EkPK-wb7b-3yxsqvgMV7Cg	5696783	RIVERO	CARMEN MARIA	COORD. DEFENSORIAS EDUCATIVAS	ADMINISTRATIVO	COORDINADOR DEFENSORIAS EDUCATIVAS	Sucre	006740235	UPE REP DE ARGENTINA	300000	PROFESIONAL UNIV. I
DgRpp6nd-G8Ib-kH7H-1NlE-HASQZOkFK0Gb	8437070	HERNANDEZ CARIACO	CARMEN MILAGROS	COORD. DEFENSORIAS EDUCATIVAS	DOCENTE	ABOGADA	Sucre	006566015	ESC ASCANIO J VELASQUEZ	1126DI	DOC. VI  /AULA
l951ntVJ-kYja-vlbT-3k8l-khfVDg4nX0Mp	9981396	MALAVE HERNANDEZ	JACQUELINE DE LOURDES	COORD. DEFENSORIAS EDUCATIVAS	ADMINISTRATIVO	TRABAJADOR SOCIAL	Sucre	006731525	GE ANDRES ELOY BLANCO	30000C	PROFESIONAL UNIVERSITARIO
EREQxsuV-eYFM-Ng5f-aGiF-zZeX9Dp4EOd3	12275214	ACUÑA M.	AMIRA MARIA	COORD. DEFENSORIAS EDUCATIVAS	DOCENTE	ABOGADA	Sucre	005508090	U.I. JUAN P. PEREZ A.	4150WH	DOC. (NG)/AULA
hbCtQNgs-9NA1-tpOR-UMK9-h4M0SaP6Icxd	14886447	VILLAFRANCA LOPEZ	OVANNYS CAROLINA	COORD. DEFENSORIAS EDUCATIVAS	DOCENTE	COORDINADORA	Sucre	007933003	E.B. MARISCAL DE AYACUCHO	4130WH	DOC. (NG)/AULA
42kuphEk-2Hln-Bh8P-EDdc-w6RXpK4r5MTv	15933120	CAMPOS MARCANO	MARIA GRABIELA	COORD. DEFENSORIAS EDUCATIVAS	DOCENTE	ABOGADA	Ribero	006567110	ESC PANTOÑO	4120WI	DOC. (NG)/AULA
YitXddSE-7saw-RZTa-fq9d-jERfs3zsCSck	12663359	AYALA  ALVAREZ	LUIS ALBERTO	COORD. DE INFRAESTRUCTURA	OBRERO	TECNICO ELECTRICISTA	Cajigal	006970383	NER NUC ESC RURAL N 383	8030N 	ASEADOR                  
YrKYOxab-OA3p-hs7S-JW0n-HcpHW0D4jruq	13923827	BRAVO MARTINEZ	LUISA CAROLINA	COORD. DE INFRAESTRUCTURA	DOCENTE	ASISTENTE	Sucre	006564880	ESC JOSE A RAMOS SUCRE	2127DI	TSU EN EDUCACION
6tchZRWg-5dgq-L8XZ-fJTV-NfvUfyQsBcRo	20992514	MAIZ	SAMUEL JOSE	COORD. DE INFRAESTRUCTURA	OBRERO	TECNICO EN REFRIGERACION	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
XsAteLOY-Pj8N-dZmU-00L2-7fjiwhFkhyl1	84423278	REYES ROMERO	MARIA JANNETH	COORD. DE INFRAESTRUCTURA	ADMINISTRATIVO	COORDINADORA	Sucre	006320059	CAPEP LA INMACULADA	10000C	BACHILLER CONTRATADO
JTZx3kKQ-vQSu-YMSr-baom-runKdPzmGkCl	10461750	ASTUDILLO RUIZ	ANABELIS	COORD. DEPARTAMENTO DE CAJA	ADMINISTRATIVO	SECRETARIA	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	20000C	TECNICO SUPERIOR UNIVERSI
5BpUg7nG-5jr5-lwFP-EBL0-hGQOBh0Zmjsf	13075041	ESPAÑA MARTINEZ	REINALDO DANIEL	COORD. DEPARTAMENTO DE CAJA	ADMINISTRATIVO	COORDINADOR	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
1LAbFVur-SQBh-0u7g-lmS8-zT5PSD4vcQMy	8647207	LEZAMA	CARLOS JOSE       	COORD. EDUCACION DE JOVENES, ADULTAS Y ADULTOS	DOCENTE	ENLACE DE LAS ESCUELAS DE ARTES Y OFICIO	Sucre	007914550	CB JOSE S GONZALEZ	1134DH	DOC. IV  /AULA
evAqUYL9-LjPJ-guCA-5Z1t-lOmOPo20lg0r	12272254	SALAZAR GUTIERREZ	NORELYS  DEL CARMEN	COORD. EDUCACION DE JOVENES, ADULTAS Y ADULTOS	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
AsSVsISL-SFqD-pv71-JCOD-iPLrSliRdImx	13052788	FERNANDEZ AGUILAR	GREISMARY DE LOS ANGELES	COORD. EDUCACION DE JOVENES, ADULTAS Y ADULTOS	DOCENTE	COORDINADORA	Sucre	006530230	CPC CAIGUIRE ABAJO	1194NH	DOC. IV  /AULA
7Diy2CGy-ablW-p3yi-zEkM-MQAFL0TsRX8m	15934896	CASTAÑEDA MENESES	RAINIERO JESÚS	COORD. EDUCACION DE JOVENES, ADULTAS Y ADULTOS	ADMINISTRATIVO	ADMINISTRATIVO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
Dy2GC1gw-kbsm-7ngm-QOk7-jplRpXejgZBw	5700190	MARCANO B	MARITZA DEL V	COORD. EDUCACION ESPECIAL	DOCENTE	COLECTIVO DE GESTION	Sucre	006412147	EE CDI	2167DI	TSU EN EDUCACION
YEIdp44J-pXlq-uly6-vEZ7-XlUddTmG72nI	8440494	BELLO MARCHAN	MARY CRUZ	COORD. EDUCACION ESPECIAL	DOCENTE	COLECTIVO DE GESTION	Montes	006421290	A I JOSE LUIS RAMOS	1163DI	DOC. III /AULA
v742kupo-nF3m-6LSf-umGo-Ly28BxDdAzIl	8647996	MUÑOZ	ANA JOSEFINA	COORD. EDUCACION ESPECIAL	DOCENTE	COLECTIVO DE GESTION	Sucre	006731542	GE ANX NOR PEDRO ARNAL	4120WI	DOC. (NG)/AULA
XJfSNCiE-N9hD-RhlJ-N8Fa-SJEuShmkEHGN	9457043	GONZALEZ VEGAS	IGNACIO JOSE	COORD. EDUCACION ESPECIAL	DOCENTE	COLECTIVO DE GESTION	Sucre	006490510	CENDA JOSEFA CAMEJO	1163DI	DOC. III /AULA
1hZoPrkK-dq1p-ZByX-diap-TXemrGWriI4J	12657722	CASTRO SALAZAR	AIMARA HELENA	COORD. EDUCACION ESPECIAL	DOCENTE		Sucre	006422260	AI ANEXA PEDRO ARNAL	2167DI	TSU EN EDUCACION
tpQICACP-deMr-wb0k-g2Xk-AAs05wtdAZoK	15249716	VALLENILLA C.	MILDRED	COORD. EDUCACION ESPECIAL	DOCENTE	COORDINADORA	Sucre	006422260	AI ANEXA PEDRO ARNAL	1163DI	DOC. III /AULA
aNyoqoR2-st2s-18cq-2yx0-MFAYaArfdVvq	16620851	PACHECO MARCANO	AMBAR YANITZA	COORD. EDUCACION ESPECIAL	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
qerAp4NU-w5sv-2NZE-eQ8k-jy0Z6gzbZr6g	3873608	MATA DE GIL	MARITZA DEL VALLE	COORD. EDUCACION INICIAL	DOCENTE	COLECTIVO DE GESTION	Sucre	004170406	CEIB CORAZON DE JESUS	1113DI	DOC. III /AULA
IxgPft8F-7IX1-a7uH-AJ99-hAncDiUh2eRL	4184831	RODRIGUEZ DE G	JESUS DEL CARMEN	COORD. EDUCACION INICIAL	ADMINISTRATIVO	SECRETARIA	Sucre	001200484	DIV. ACADEMICA	100000	BACHILLER I
XI1JgqmZ-N6Qm-3uNM-e1YT-DcIxoJ0YW9mU	5706843	RIVERO RODRIGUEZ	EDELMIRA COROMOTO	COORD. EDUCACION INICIAL	DOCENTE	EQUIPO TECNICO DE EDUCACION INICIAL	Sucre	004107465	JI NUEVA TOLEDO	1115DI	DOC. V   /AULA
AcV9wTds-tpTO-69f2-onoJ-CRVtLFIKf9WW	8443930	SALDO	MARBELYS GREGORIA	COORD. EDUCACION INICIAL	ADMINISTRATIVO	ENLACE PAE SENIFA	Sucre	999999990	COMISIÓN DE SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
1M7BiDYm-SdlE-YDZU-TVt0-k5PlUvBavPo2	8641343	RODRIGUEZ MARCANO	JESUS MANUEL	COORD. EDUCACION INICIAL	OBRERO	CHOFER	Sucre	999999990	COMISIÓN DE SERVICIOS	8260N	CHOFER DE TRANSP.
bhslbViL-F9TL-YvlK-ZcQ8-UtQRO9FKYvGO	8653396	VARGAS RODRÍGUEZ	MARIA YNÉS	COORD. EDUCACION INICIAL	DOCENTE	COLECTIVO DE GESTION	Sucre	004108520	JI RPBLCA ARGENTINA	112AWI	DOC. CONTRATADO A
Mfb9OsB1-sUKY-hvvC-Jxs2-zL4gItJhfJc1	8654243	MAESTRE GALANTON	ELIZETH COROMOTO	COORD. EDUCACION INICIAL	ADMINISTRATIVO	ANALISTA	Sucre	999999990	COMISIÓN DE SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
lNMas0Gi-QD5t-Xyp6-gh0o-pNlXW2qohs41	10463173	SERRANO	MARIA JOSEFINA	COORD. EDUCACION INICIAL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
PBThUSKH-QVyI-TG4r-xr8v-ShFJFYFBNQGU	10463687	MUÑOZ GOMEZ	RUBEN JOSE	COORD. EDUCACION INICIAL	OBRERO	MENSAJERO	Sucre	005602000	CD EMILIO TEBAR CARRASCO	8030N 	ASEADOR                  
KQ7evoSo-i9i9-LHQn-Ycte-Oml2GTOJcM4L	10945156	LAREZ Z	ESTHER P	COORD. EDUCACION INICIAL	DOCENTE	COLECTIVO DE GESTION	Libertador	004107820	JI PEDRO E MARCANO	1111DI	DOC. I   /AULA
kZRPAH64-oBtJ-FZgg-R7GT-pxlbRnFu7zMw	10949209	CORDOVA VALLEJO	MISAIDA JOSEFINA	COORD. EDUCACION INICIAL	DOCENTE	ENLACE EDUCACION FISICA/INICIAL ZONAL	Sucre	004106530	JI MALARIOLOGIA	2117DI	TSU EN EDUCACION
d6pEPnUe-kRY0-paU5-FRKd-HWqAXdleahhf	11689314	HEREDIA CASTRO	IVETT ELENA	COORD. EDUCACION INICIAL	DOCENTE	EQUIPO TECNICO DE EDUCACION INICIAL	Montes	004108854	PE CREACION SAN BALTAZAR	1113DI	DOC. III /AULA
Rd3Q5Wnp-6y1O-uMab-6snF-fRwUz8VLqWLX	12269853	GONZALEZ ROMERO	YUSMARY MARIA	COORD. EDUCACION INICIAL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
LiTQUyLi-cvDC-OOvH-pQHr-0kNlbf6rk7yt	12662072	ARCIA	YURVYS COROMOTO	COORD. EDUCACION INICIAL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
LiTQUyLi-cvDC-OOvH-pQHr-0kNlbf6rk7yt	12662072	ARCIA	YURVYS COROMOTO	COORD. EDUCACION INICIAL	ADMINISTRATIVO		Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
PQlwUXVf-R6Hc-4ejC-kq49-ukzABMqBbLVC	13220308	CASTRO PEREZ	CARMENLUISA DEL VALLE	COORD. EDUCACION INICIAL	DOCENTE	ENLACE INTERMISIONES	Sucre	004106740	JI MARCO A SALUZZO	2117DI	TSU EN EDUCACION
qsHqAEFa-fOyl-MFue-0GWC-MkTgFHLaKro7	13220832	MARTINEZ BASTARDO	GABRIELA ALEJANDRA	COORD. EDUCACION INICIAL	DOCENTE	COORDINADORA	Sucre	004170548	CEIB HILDA DE LA CRUZ DIA	1114DI	DOC. IV  /AULA
uiWZgJOw-uEWu-ewcd-15HS-AFa1nWm6OM9m	3049876	ACOSTA FLORES	JUAN JOSE	COORD. EDUCACION INTERCULTURAL	ADMINISTRATIVO	EQUIPO TECNICO	Sucre	999999990	COMISIÓN DE SERVICIOS	310000	PROFESIONAL UNIV. II
J24XIXDl-teYC-4jEY-23QK-P3vEeylaQeSf	8455660	TAMANAICO	JOSE MEDARDO	COORD. EDUCACION INTERCULTURAL	DOCENTE	COORDINADOR	Sucre	006970353	NER NUC ESC RURAL N 353	4120WI	DOC. (NG)/AULA
iuajiEO8-Egpn-TMql-M5jd-iQeB8VAH3KDg	9279574	ROJAS RODRIGUEZ	YUSMANY MARIA	COORD. EDUCACION INTERCULTURAL	ADMINISTRATIVO	FACILITADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
1cUJrnH6-EXhJ-tXZf-SHS6-Vz2lGG3X1JYz	10466345	CHACON LARA	JOSE RAFAEL	COORD. EDUCACION INTERCULTURAL	DOCENTE	COORDINADOR	Ribero	006970352	NER NUC ESC RURAL N 352	1121DI	DOC. I   /AULA
BtxDG149-JZrK-cXDk-otlK-zTgp5oLZJhGn	10952577	CORDOVA VASQUEZ	ALEJANDRA JOSEFINA	COORD. EDUCACION INTERCULTURAL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
WvsI7G7r-zo3o-QWmX-EoHh-W32EHfyayKAd	4687317	VARGAS MATA	MERCEDES DEL VALLE	COORD. SEGURO SOCIAL	ADMINISTRATIVO	ANALISTA	Sucre	001200489	DIV DE PERSONAL	210000	TSU II
QNApALD1-S5gH-K1Tn-cCIw-qCI77jCy61XX	10954206	TINEO DÍAZ	ROSMARY MARÍA	COORD. EDUCACION INTERCULTURAL	ADMINISTRATIVO	ADMINISTRATIVO	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	20000C	TECNICO SUPERIOR UNIVERSI
BxGjxWZR-75lf-FY1m-J723-NeLiMPMSnmny	13517498	MARIN VARGAS	YARELYS COROMOTO	COORD. EDUCACION INTERCULTURAL	DOCENTE	ASISTENTE ADMINISTRATIVO	Ribero	006787076	U.E. CREACION SANTA ANA	4120WI	DOC. (NG)/AULA
FUO7bqEu-xKGc-GfWo-2MYH-BOkniVYKTi8w	16817792	CARVAJAL ARAYAN	SUSANA EMILIA	COORD. EDUCACION INTERCULTURAL	ADMINISTRATIVO	SECRETARIA	Sucre	002071873	DIV ADMINISTRATIVA	10000C	BACHILLER CONTRATADO
QoFQZVuI-fVCm-x16D-Ajci-NpDy3qkNe8Qj	17213022	HERNANDEZ RODRIGUEZ	CAROL DEL VALLE	COORD. EDUCACION INTERCULTURAL	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
k1pojjit-xuou-ynCR-OEao-qSYDLtNS5LMm	8437708	NUÑEZ 	JULIO CESAR	COORD. ENLACE INTER INSTITUCIONAL Y CONTROL DE GESTION	DOCENTE	APOYO DE PROGRAMAS	Sucre	005786900	CD MODESTO SILVA	1152DH	DOC. II  /AULA
jswO1033-2woR-F1iF-teHH-Yoj0AP3HJZ0J	9055376	ORTEGA DE LOPEZ	AMARILYS T.	COORD. ENLACE INTER INSTITUCIONAL Y CONTROL DE GESTION	DOCENTE	COORDINADOR	Sucre	006399957	EBA ESC TECNICA DE PESCA	1186NH	DOC. VI  /AULA
GWFnwmlA-OWtB-zEFH-C3iD-WVCVBaBylU2T	9270966	ORTIZ 	JOSEFINA DEL VALLE	COORD. ENLACE INTER INSTITUCIONAL Y CONTROL DE GESTION	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
MA1Z2rzE-6HVC-lES1-0sAk-4D48TaSr6EIa	15596358	VISAEZ TRILLO	LIZ NATACHA	COORD. ENLACE INTER INSTITUCIONAL Y CONTROL DE GESTION	ADMINISTRATIVO	SECRETARIA	Sucre	005786900	CD MODESTO SILVA	10000C	BACHILLER CONTRATADO
qPXOIpeJ-fKoy-URNV-ucia-JxmyXWhAfReJ	3339020	SERPA PERDOMO	DEL VALLE JOSEFINA	COORD. ESTRATEGIA DE LIBRE ESCOLARIDAD	DOCENTE	COORDINADOR	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1146DH	DOC. VI  /AULA
T3vEMSU1-yDeq-tWVX-DoX8-r2BC2UAYVq9I	4691734		MOTA FERNANDO L          	COORD. ESTRATEGIA DE LIBRE ESCOLARIDAD	OBRERO	PORTERO	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8260N 	CHOFER DE TRANSP.        
kzoyvE4f-dwFQ-51Dl-DokR-fAb0QxMYJXPC	5708751	CAMPOS RODRIGUEZ	IGNACIO LUIS	COORD. ESTRATEGIA DE LIBRE ESCOLARIDAD	DOCENTE	ASESORA	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	4120WI	DOC. (NG)/AULA
QGmZMxe6-sk3n-hian-POh8-ndbbq4dnAzC8	12666956	MEDINA CORDOVA	GRECIA ALEJANDRA	COORD. ESTRATEGIA DE LIBRE ESCOLARIDAD	DOCENTE	TRANSCRIPTOR	Sucre	007933232	E B REBECA MEJIAS RAMIREZ	4120WI	DOC. (NG)/AULA
eoACrejG-Gz16-zTn3-4t1R-ve2o2HzKhT06	13772340	BARRERA BARRERA	RUBEN DARIO	COORD. ESTRATEGIA DE LIBRE ESCOLARIDAD	DOCENTE		Sucre	006530230	CPC CAIGUIRE ABAJO	1181ZH	DOC. I   /AULA
elHeuAdD-Xokc-urOH-VrKJ-bXEuN3LpLEIj	14009346	FERNANDEZ AGUILAR	LUIS JOSE	COORD. ESTRATEGIA DE LIBRE ESCOLARIDAD	DOCENTE	COORD. DEPARTAMENTO DE EVALUACION	Sucre	006738087	GE NUEVA ESPARTA	1123DI	DOC. III /AULA
TgrnJS5W-oL6w-TXJQ-zr8M-soEo6qorcfun	14125413	GOMEZ HERNANDEZ	YULIS DEL VALLE	COORD. ESTRATEGIA DE LIBRE ESCOLARIDAD	ADMINISTRATIVO	SECRETARIA	Sucre	001200486	DIV. DE PLANIFICACION Y PRESUPUESTO	100000	BACHILLER I
SVCc3uw4-KPYf-1zLD-Wyab-3jFvLLB7ZQzC	14284934	CANACHE	YADIRA JOSEFINA	COORD. ESTRATEGIA DE LIBRE ESCOLARIDAD	OBRERO	ASEADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
dnNslYAg-A1by-1wxU-1BGI-5DoXdN4tpVCJ	10883091	MARTINEZ DE MARTINEZ	NINOSKA DEL CARMEN	COORD. EVALUACION DE DESEMPEÑO DEL PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	ANALISTA	Sucre	001200489	DIV DE PERSONAL	300000	PROFESIONAL UNIV. I
J7Ak0A68-Qp5M-rhDe-hRSJ-FLPo8dMJxTvk	11375005	VILLARROEL S.	MEYCIS K.	COORD. EVALUACION DE DESEMPEÑO DEL PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	ANALISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	200000	TSU I
YI1BVbqF-DEnf-WSZ7-Fg7g-V2SC9CmCwiai	11829404	YEGRES CASTILLO	DUNIA NATHALY	COORD. EVALUACION DE DESEMPEÑO DEL PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	ANALISTA	Sucre	001200489	DIV DE PERSONAL	300000	PROFESIONAL UNIV. I
YI1BVbqF-DEnf-WSZ7-Fg7g-V2SC9CmCwiai	11829404	YEGRES CASTILLO	DUNIA NATHALY	COORD. EVALUACION DE DESEMPEÑO DEL PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	ANALISTA	Sucre	006320059	CAPEP LA INMACULADA	200000	TSU I
GNx6MnWm-BWc4-IeGG-JAag-OUTfv93OGhQX	13432326	OLIVERO SANCHEZ	NEYMI	COORD. EVALUACION DE DESEMPEÑO DEL PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	COORDINADORA	Sucre	001200489	DIV DE PERSONAL	300000	PROFESIONAL UNIV. I
GNx6MnWm-BWc4-IeGG-JAag-OUTfv93OGhQX	13432326	OLIVERO SANCHEZ	NEYMI	COORD. EVALUACION DE DESEMPEÑO DEL PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	COORDINADORA	Sucre	999999990	COMISIÓN DE SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
EUlWYuB0-KwVf-Kl8F-sP0i-PzJB6NeArlvh	15743548	FLORES NATERA 	YUDIANDRIS DEL VALLE	COORD. EVALUACION DE DESEMPEÑO DEL PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
5Xyk06go-Oc2s-AIGQ-cP5a-83LiFAPsGns2	3870998	GUEVARA	ARAMINTA DEL CARMEN	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	DOCENTE	SOCIOLOGA	Sucre	006530230	CPC CAIGUIRE ABAJO	4190NH	DOC. (NG)/AULA
IRi52o5L-hJNz-eKLZ-8Ypd-tITilvtK08Ei	4185329	ARCIA DE CARABALLO	GLADYS JOSEFINA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	ADMINISTRATIVO	SOCIOLOGA	Sucre	001200487	DIV. DE PROTECCION Y DES EST	300000	PROFESIONAL UNIV. I
IRi52o5L-hJNz-eKLZ-8Ypd-tITilvtK08Ei	4185329	ARCIA DE CARABALLO	GLADYS JOSEFINA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	DOCENTE	SOCIOLOGA	Sucre	005786905	I DE C MODESTO SILVA NOCT	1184ZH	DOC. IV  /AULA
iFO2XFOD-1RW3-mwZv-J0sK-1oSregblPPV6	4692961	RAMOS DE LOPEZ	ELENA JOSEFINA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	ADMINISTRATIVO	ANALISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
81XbXJGi-1J4m-EN8w-5ZH1-cCeCWezf9Mp1	5695311	CALDERA	FLORENCIO ANTONIO	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	OBRERO	MENSAJERO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8590N 	MENSAJERO                
KgCv6F8o-g8U4-L1mI-cxu8-CUIS1oh1zKJH	8440263	MENDOZA DE DIAZ 	JANNET DEL VALLE	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	OBRERO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8490N 	SUPERVISOR DE MANT       
SO62thQQ-RAXG-3ml6-zDdS-5HECQedNF1Bu	8643377	VELASQUEZ SANABRIA	LUIS OMAR	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	OBRERO		Sucre	004085000	CDP EL BRASIL	8030C	ASEADOR CONTRATADO
tKYlMRFH-JGKR-jawR-y1t3-T6VutPXXIJCV	9279172	ARRIOJA	ADELAIDA DEL CARMEN	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	OBRERO	ASEADORA	Sucre	006735890	GE JAVIER ALCALA VASQUEZ	8030N	ASEADOR
nxNjS4hZ-xcyz-zWWu-MUUR-irG56ayxQzZw	10064361	OCHOA NAVARRETE	MERCEDES AMERICA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	ADMINISTRATIVO	COORDINADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	300000	PROFESIONAL UNIV. I
Tqu35asI-BJV7-n3nF-W8LM-V15neQRkcE6K	10463548	MARQUEZ URBANEJA	MARIA ELENA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	OBRERO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
OzSY7mJd-mFJV-iww2-o7P4-AdkNvIYNvLJt	10469646	OTERO RENGEL	YARITZA JOSEFINA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	ADMINISTRATIVO	ANALISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
D5HbYZIQ-spUW-nTaK-jS7o-PEDLmyuKysF3	11383891	SERPA PERDOMO	CELIA ROSA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	OBRERO	ASEADORA	Sucre	006732255	GE CANDIDO RAMIREZ	8030N	ASEADOR
vsajHkeF-Oays-Tk28-ApZm-Y2gOyy9LiCVw	11824105	GARCIA LOPEZ	HAYDEE JOSEFINA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	OBRERO	ASEADORA	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
Umed1jnX-0u4i-X58L-vjol-qENtKMOAzV1Z	12270673	MUÑOZ RODRIGUEZ	DISNELYS JOSEFINA	COORD. EVALUACION DE EFICIENCIA DEL PERSONAL OBRERO	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
ulHBfOAi-tjfD-htiA-n0iu-iykooIQURKqc	3605143	ATAY QUIJADA	LUIS RAMON	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	999999990	COMISIÓN DE SERVICIOS	1164DI	DOC. IV  /AULA
VXFaOCaQ-0Y59-2JtR-HoHS-y3yGLUtq9ELd	5089157	USCATEGUI RIVERO	YAJAIRA DEL VALLE	COORD. FORMACION DOCENTE	DOCENTE	FACILITADORA	Mejía	006970521	NER 521	1144DH	DOC. IV  /AULA
VXFaOCaQ-0Y59-2JtR-HoHS-y3yGLUtq9ELd	5089157	USCATEGUI RIVERO	YAJAIRA DEL VALLE	COORD. FORMACION DOCENTE	DOCENTE	FACILITADORA	Sucre	006562832	ESC CRUZ DE LA UNION	1122DI	DOC. II  /AULA
V9fbC1ej-8AiR-y7rU-DjuL-PwNKL6UAeJnh	5705178	JUAN DE DIOS	RODRIGUEZ SANCHEZ	COORD. FORMACION DOCENTE		FACILITADOR	Sucre	006391954	CEA BOLIVARIANO	1171YH	DOC. I   /AULA
QDOvpIjj-vvCg-ORn8-b1Wt-mcZCYWSHv2Mu	8641572	TABEROA	ANA Y	COORD. FORMACION DOCENTE	DOCENTE	FACILITADORA	Arismendi	004108710	JI ROJAS PAUL	111AWI	DOC. CONTRATADO A
TD3wF2Cr-dv2C-382T-LiIZ-Ws4Ubkg7C9fo	8643769	HERNANDEZ	MARIA MAIGUALYDA	COORD. FORMACION DOCENTE	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
CDbxg0bz-9TdU-JeYb-MZUf-BbOdgI1gcREG	9270380	MARCANO URBANEJA	JULIA MARGARITA	COORD. FORMACION DOCENTE	DOCENTE	FACILITADORA	Sucre	006564880	ESC JOSE A RAMOS SUCRE	1123DI	DOC. III /AULA
YRlpoudl-nJ9F-RNmH-fIwe-P7S6bkDnHxZl	9273622	VELASQUEZ	BEDA DEL VALLE	COORD. FORMACION DOCENTE	OBRERO	ASEADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
LV3WPTqb-Tgr0-x5aw-6SN4-SDVecbMruSBZ	10466536	MARTINEZ 	JANET J.	COORD. FORMACION DOCENTE	DOCENTE	FACILITADORA	Sucre	006731525	GE ANDRES ELOY BLANCO	1123DI	DOC. III /AULA
XSXWFsY2-pvq3-EB37-grzb-AHzdFHSG5gN2	10506557	MEJIAS VILLALBA	PEDRO ISRAEL	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Montes	006731818	GE ARENAS	1124DI	DOC. IV  /AULA
QMsqkjCk-3Yl8-Ol5U-Orky-jclUPO3rD3XB	10954633	LUNAR	CAROLINA DEL VALLE	COORD. FORMACION DOCENTE	DOCENTE	FACILITADORA	Sucre	005786900	CD MODESTO SILVA	1133DH	DOC. III /AULA
QMsqkjCk-3Yl8-Ol5U-Orky-jclUPO3rD3XB	10954633	LUNAR	CAROLINA DEL VALLE	COORD. FORMACION DOCENTE	DOCENTE	FACILITADORA	Sucre	005786900	CD MODESTO SILVA	1134DH	DOC. IV  /AULA
utKiPURV-FrFR-1P06-o4Co-oNrVbGyFjGPF	10954676	VELASQUEZ DE ARIAS	NOREYMA JOSEFINA	COORD. FORMACION DOCENTE	DOCENTE	COORDINADORA	Sucre	006970353	NER NUC ESC RURAL N 353	1133DH	DOC. III /AULA
VO6kuL9i-M2Z4-OFwG-OVMX-n3S4MWzK9fCY	11378203	SALAZAR ORTIZ	CARLOS RAFAEL	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	006568063	ESC SAN LUIS	113AWH	DOC. CONTRATADO A
koBMioBS-NP61-1HEx-u3b7-puaWRrcWHRkZ	11381674	REYES LOPEZ	DANIEL JOSÉ	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	005500550	CCB CUMANA	1181ZH	DOC. I   /AULA
koBMioBS-NP61-1HEx-u3b7-puaWRrcWHRkZ	11381674	REYES LOPEZ	DANIEL JOSÉ	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	006732088	GE BRASIL II	1124DI	DOC. IV  /AULA
jHi60EuQ-9qhO-qm9x-zcrN-UyjOtlmMi1EB	12270692	VILLALBA	LUIS ENMANUEL	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	006738090	GE NUEVA TOLEDO	4120WI	DOC. (NG)/AULA
zxDv9LWT-Lqee-vwMV-q8Wb-h3hUsWM25VI1	12530319	CARRILLO M	ROMINA J	COORD. FORMACION DOCENTE	DOCENTE	RESPONSABLE DEL EJE Nº 2	Andrés Eloy Blanco	006970105	NER NUC ESC RURAL N 105	1123DI	DOC. III /AULA
Wn6Wi56k-7j0h-GXcS-fZxc-Lgkcr0Cmt13s	12661990	ZURITA VARGAS	ELOY JOSE	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	006736458	GE JUAN FREITES	112AWI	DOC. CONTRATADO A
FUdA36aB-Ou7C-iHNO-BQwa-0Q8ZHkqsJuhH	13221875	RODRIGUEZ MARCANO	LEONEL JESUS	COORD. FORMACION DOCENTE	DOCENTE	COORDINADOR	Sucre	006738090	GE NUEVA TOLEDO	1121WI	DOC. I   /AULA
OhxDAXsT-38OE-qYiq-yrvz-dz9vedTon3Tv	14290911	ANGULO RIVERA	GLENYS DEL CARMEN	COORD. FORMACION DOCENTE	DOCENTE	FACILITADORA	Sucre	006970353	NER NUC ESC RURAL N 353	4130WH	DOC. (NG)/AULA
siwW1In0-RZH5-IK8w-2Jip-FJcHNsZDEBWU	14855463	NARVAEZ R	YSELIS M	COORD. FORMACION DOCENTE	ADMINISTRATIVO	FACILITADOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
uVE70Ojq-R3Dy-txKx-mBdJ-G6lrAaMwBq7h	15249054	RAMIREZ LOPEZ	JUAN MANUEL	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	006970353	NER NUC ESC RURAL N 353	1132DH	DOC. II  /AULA
uVE70Ojq-R3Dy-txKx-mBdJ-G6lrAaMwBq7h	15249054	RAMIREZ LOPEZ	JUAN MANUEL	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	006970353	NER NUC ESC RURAL N 353	1133DH	DOC. III /AULA
tLfhZtJ6-AjqV-8OJ2-K533-TD3ffcKk9eZV	16486160	MARCANO SALAZAR	MARIA JOSE	COORD. FORMACION DOCENTE	DOCENTE	SECRETARIA	Bolívar	006970227	NER NUC ESC RURAL N 227	1132DH	DOC. II  /AULA
xzznHRhP-4jL7-oeD9-LVyN-0keIbt9SeJFY	16486212	MACHADO RODRIGUEZ	MARIBEL BEATRIZ	COORD. FORMACION DOCENTE	DOCENTE	SISTEMATIZADORA	Sucre	006731525	GE ANDRES ELOY BLANCO	4120WI	DOC. (NG)/AULA
LzzLYbM2-4tBh-WpkU-Xsy7-R9WAms1lGlFE	17214803	GUZMAN G 	JAVIER C        	COORD. FORMACION DOCENTE	DOCENTE	FACILITADOR	Sucre	006732073	GE BR ALBERTO SANABRIA	4120WI	DOC. (NG)/AULA
EwbKPZ4a-VfS6-b2Yh-LST0-yWg609LZMxYM	17445280	PEINADO CORONADO	ARBELLYS JOSE	COORD. FORMACION DOCENTE	ADMINISTRATIVO	SECRETARIA	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
7Yy90xvK-ymt0-VYYC-I9zI-Mx4caamdlOBf	19089709	ARAUJO TRIAS	MARIA JESUS	COORD. FORMACION DOCENTE	ADMINISTRATIVO	SECRETARIA	Sucre	001070586	DPTO PAGO DIRECTO R NOR O	10000C	BACHILLER CONTRATADO
kWj9huE7-4vq5-0nZw-E0Ql-Vhr4leXN12Ev	3872433	GUZMAN ZERPA.	MARLENI DEL VALLE	COORD. GESTION INTEGRAL DE RIESGO	DOCENTE	COORDINADOR	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1143DH	DOC. III /AULA
wHixfwrW-tCJc-KsVE-YN4N-sLTEJwpVR088	8439584	SALAS	JOSEFINA DEL VALLE	COORDINACION DE LICENCIA	ADMINISTRATIVO	COORDINADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
wHixfwrW-tCJc-KsVE-YN4N-sLTEJwpVR088	8439584	SALAS	JOSEFINA DEL VALLE	COORDINACION DE LICENCIA	DOCENTE	COORDINADORA	Sucre	006394350	CEA FCO ARISTEGUIETA B	1191ZH	DOC. I   /AULA
on8iJLbg-0cYT-Y61v-K77d-rKWkqXXFQqs9	10504534	DIAZ CABELLO	JENITH ELOISA	COORDINACION DE LICENCIA	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
AwuirtgK-43gi-PS79-rzkz-QzA76IhLlHHf	13598061	RONDON RODRIGUEZ	OMAR ALEJANDRO	COORDINACION DE LICENCIA	OBRERO	TRANSCRIPTOR	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8590N 	MENSAJERO                
AwuirtgK-43gi-PS79-rzkz-QzA76IhLlHHf	13598061	RONDON RODRIGUEZ	OMAR ALEJANDRO	COORDINACION DE LICENCIA	OBRERO	TRANSCRIPTOR	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
68MjLfy7-9ha3-8mMe-QNbj-92yLGRSQDkxo	5699615	CAMPOS RAMIREZ	RAMON DAVID	COORD. MISION SABER Y TRABAJO	DOCENTE	COORDINADOR	Sucre	007911370	LICEO ANT J DE SUCRE	1144DH	DOC. IV  /AULA
lNsqO3rI-RM7g-IB0Z-XP6H-5gDZGkIdP2bc	12271365	PAREJO GARCIA	AURISTELA D	COORD. MISION SABER Y TRABAJO	ADMINISTRATIVO	ADMINISTRATIVO	Sucre	004082500	CDP BEBEDERO	20000C	TECNICO SUPERIOR UNIVERSI
GsLu85ln-n0K2-ORTM-9fbe-eOxjp5iq4J7J	8437256	VALLEJO BASTARDO	DALIA MARGARITA	COORD. MISION SUCRE	DOCENTE	COORDINADORA	Sucre	007912153	CB BR RAFAEL C MACHADO	1144DH	DOC. IV  /AULA
gVNcg8E3-kBb8-Xi2w-JZ6Z-9hWVc2vjnFY1	14183434	PEREZ RAMOS	DAYANA MARILIN	COORD. MISION SUCRE	ADMINISTRATIVO	SECRETARIA	Sucre	004107455	JI NUEVA ESPARTA	10000C	BACHILLER CONTRATADO
qTcg4WJp-SG1o-skLY-TWwX-z02Iyumbdl1a	19538544	BRUZUAL BRUZUAL	ANGELA ADRIANA	COORD. MISION SUCRE	ADMINISTRATIVO	SECRETARIA	Sucre	007950530	UE ALI PRIMERA	10000C	BACHILLER CONTRATADO
6BZgNXNi-LCwz-cvRo-cocm-GqXCi032UzX8	19762996	ESPIN GUERRA	ANDREA CAROLINA	COORD. MISION SUCRE	ADMINISTRATIVO	SECRETARIA	Sucre	004108510	JI RENDON	10000C	BACHILLER CONTRATADO
dB7FyVWE-7gc6-c3a8-MMyD-VyNghx7YDQm3	23923017	SALAZAR PATIÑO	YOSMAR JOSE	COORD. MISION SUCRE	ADMINISTRATIVO	SECRETARIO	Sucre	007912150	CB CRUZ SALMERON A	10000C	BACHILLER CONTRATADO
RoERoDaE-OTL5-iqKZ-B1o7-9ZR2YLAdxKKX	5694384	SEGURA	AUSENCIO JOSE	COORD. MORAL Y LUCES	DOCENTE	COORDINADOR	Sucre	007912150	CB CRUZ SALMERON A	1131DH	DOC. I   /AULA
RoERoDaE-OTL5-iqKZ-B1o7-9ZR2YLAdxKKX	5694384	SEGURA	AUSENCIO JOSE	COORD. MORAL Y LUCES	DOCENTE	COORDINADOR	Sucre	007912150	CB CRUZ SALMERON A	113AWH	DOC. CONTRATADO A
lCJVBul4-WxjL-iCuu-jcL6-DPDjsNMPlcEl	5702585	RIVAS CHIRINOS	ANTONIO RAFAEL	COORD. MORAL Y LUCES	DOCENTE	COLECTIVO DE GESTION	Montes	006567930	ESC ROSARIO S DE RAUSSEO	3138WH	MAESTRO NORMALISTA EN EDU
5jpZJd52-aiM8-Eu0g-sgKa-3LszAXo3MH8X	8503376	COLS BALLESTERO	JAVIER GERARDO	COORD. MORAL Y LUCES	DOCENTE	COORDINADOR FORMACIÓN Y CAPACITACIÓN	Benítez	007950573	U E CAÑO DE AJIES	4120WI	DOC. (NG)/AULA
g8PsJWnO-RiPk-69rz-2oM3-nigJr4DcAHnq	8639395	VELASQUEZ MATA	DEL VALLE	COORD. MORAL Y LUCES	DOCENTE	COORDINADORA	Sucre	007950781	UE DR JOSE MARIA VARGAS	1134DH	DOC. IV  /AULA
3LIJ9pBJ-Lpr4-vW5N-zM0c-pF38FZRJCGfv	8643475	CHACON GUEVARA	VICTOR HUMBERTO	COORD. MORAL Y LUCES	ADMINISTRATIVO	COLECTIVO DE GESTION	Sucre	001200486	DIV. DE PLANIFICACION Y PRESUPUESTO	30000C	PROFESIONAL UNIVERSITARIO
sut5WrKi-Os6L-e1ue-swTg-0zrlWqUUy9Ez	10217327	ARIAS A	CELIA DEL V	COORD. MORAL Y LUCES	DOCENTE	ENLACE MUNICIPAL Nº 06	Bermúdez	007914940	CCB JOSE FCO BERMUDEZ	1181ZH	DOC. I   /AULA
AmvY47NX-NJ6o-X1Ec-Lc4i-REQfyDn17UIk	10884441	CEDEÑO CAMPOS	CLAUDIA DEL CARMEN	COORD. MORAL Y LUCES	DOCENTE	ENLACE MUNICIPAL Nº 04	Benítez	004101060	JI BEAPERTHUY	1113DI	DOC. III /AULA
ieHVZAzc-uTdy-p3Jn-NzRU-kk0m92zIH6m2	10946854	FUENTES VELASQUEZ	HILDA ELINA	COORD. MORAL Y LUCES	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
BUAgUlge-Vfm7-F3l3-Q2Ki-V7x9mZJKPngV	11381874	FIGUEROA	ELKYS JOSE	COORD. MORAL Y LUCES	DOCENTE	COLECTIVO DE GESTION	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	4130WH	DOC. (NG)/AULA
AfwJyAYJ-krLW-8Tyx-nYx7-Bp5fHhfQSH1v	11824205	SALAZAR ROSQUE	WILMEN JOSE	COORD. MORAL Y LUCES	ADMINISTRATIVO	SUPERVISOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
AfwJyAYJ-krLW-8Tyx-nYx7-Bp5fHhfQSH1v	11824205	SALAZAR ROSQUE	WILMEN JOSE	COORD. MORAL Y LUCES	OBRERO	COLECTIVO DE GESTION	Sucre	001070586	DPTO PAGO DIRECTO R NOR O	8030C	ASEADOR CONTRATADO
RULNQ4LJ-MSyN-u6nw-8btj-QsTFag1tB7FX	12274460	LICET	JAIRO LUIS	COORD. MORAL Y LUCES	OBRERO	MENSAJERO INTERNO	Sucre	004107213	PE MORAL Y LUCES	8030N 	ASEADOR                  
SqKjYQxH-7Jay-DoUb-Zo9P-sDFDuoiQUS7N	12660023	DIAZ BETANCOURT	ANGEL FELIX	COORD. MORAL Y LUCES	ADMINISTRATIVO	ENLACE MUNICIPAL MUNICIPIO Nº 06	Bolívar	007913900	CD JESUS MARCANO E	5140WH	LIC. PROFESIONAL NO DOC.
PcOVsIBT-TPm9-7MSf-L36Q-qKQRGLcyvTTU	13220574	VASQUEZ	JOSE GREGORIO	COORD. MORAL Y LUCES	DOCENTE	ENLACE MUNICIPAL Nº 08	Cruz Salmerón Acosta	007911460	CB SALVADOR CORDOVA	4130WH	DOC. (NG)/AULA
nn8U73Uw-RAS1-W6XH-PgST-3zkB6QULQ8Ou	15787560	MORENO R	OMAR J	COORD. MORAL Y LUCES	DOCENTE	ENLACE MUNICIPAL Nº 09	Libertador	006970067	NER NUC ESC RURAL N 067	4120WI	DOC. (NG)/AULA
QXBQaijP-tjBo-bA0G-x1jh-t4yZi1BBG7dI	16997150	BERMUDEZ R	JAVIER D	COORD. MORAL Y LUCES	ADMINISTRATIVO	SUPERVISOR	Sucre	007950530	UE ALI PRIMERA	10000C	BACHILLER CONTRATADO
hqX9PREp-GnDP-vPeF-lSUs-mELbDtjKwYsX	4295040	RONDON GIL	CLAUDIO R       	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	DOCENTE	Sucre	007933330	EBA. LA LLANADA	1185NH	DOC. V   /AULA
prXr5GiJ-7kTw-shrZ-X52J-xZyv0B09WD3V	4495559	RODRIGUEZ R	JESUS S	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	EQUIPO TECNICO DE RURAL	Sucre	006505580	IEE SUCRE	4160WI	DOC. (NG)/AULA
TjVVFAvo-8oI3-EZLf-TPNM-KR0HF4IvMO7a	4683116	RENDON CENTENO	ELEAZAR F.	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	EQUIPO TECNICO DE RURAL	Sucre	007915780	CB LUIS GRATEROL B	1141WH	DOC. I   /AULA
JlapMdij-YUbp-TuVs-ELAU-14qpiiKaxEWZ	5689706	CABELLO G.	YOLIS T.	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	COORDINADORA REGIONAL	Sucre	007911647	C B ANTONIO LEMUS PEREZ	113AWH	DOC. CONTRATADO A
j0e8YBuA-aspg-MqWr-a7w1-s5zH14QiriM3	6901088	MARQUEZ COLON	MARIA YSABEL	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	EQUIPO TECNICO PEDAGOGICO	Benítez	006561260	ESC AGUSTIN GARCIA P	1122DI	DOC. II  /AULA
U8N5pKGW-ImrF-QcdU-nGb6-CuDhzaTttNaP	8645335	MAHSEREDJIAN ORDAZ	CLAUDIA KATIUNA	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	EQUIPO TECNICO DE CULTURA	Sucre	006625200	EN PEDRO ARNAL	4130WH	DOC. (NG)/AULA
7DSGtWpc-oDap-QsiL-RoVA-lJJ76vm2Ehb3	8649436	AMAYA G	DEYANIRA DEL ROSARIO	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	001200482	DIV. DE CORD ENTES PUBLI Y PRIV CUT	20000C	TECNICO SUPERIOR UNIVERSI
aQuYosiK-0psZ-q5S2-JtQp-gvK1z5qVd6Q6	11832672	PATIÑO P	NELSON J	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	EQUIPO TECNICO PEDAGOGICO	Sucre	006970201	NER NUC ESC RURAL N 201	1122DI	DOC. II  /AULA
q7c8V3xC-ps4H-lb8l-gD9G-6fnrcjaA4CEn	12531686	ROMERO DE GONZALEZ	NEIDA DEL VALLE	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	EQUIPO TECNICO EJE Nº 2	Andrés Eloy Blanco	006970105	NER NUC ESC RURAL N 105	1122DI	DOC. II  /AULA
ME3nRR1p-p2BH-rAXD-HKU2-9UTCgF92sYhP	13294214	VILLAFAÑA CARABALLO	RAYNAN JOSEFINA	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	002071745	DIVISION DE DOCENCIA	20000C	TECNICO SUPERIOR UNIVERSI
btsNbJgD-wFvZ-zp8K-kIeO-CzEQcY0gwhBF	13507116	GUTIERREZ L	MARIADELA	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	ADMINISTRATIVO	ANALISTA	Sucre	001200489	DIV DE PERSONAL	300000	PROFESIONAL UNIV. I
OhxDAXsT-38OE-qYiq-yrvz-dz9vedTon3Tv	14290911	ANGULO RIVERA	GLENYS DEL CARMEN	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	EQUIPO TECNICO PEDAGOGICO	Sucre	006970201	NER NUC ESC RURAL N 201	1122DI	DOC. II  /AULA
T7PLk9HM-P4s1-N4Yy-W6rN-BVDlxT1rrzyI	15361603	RONDON R	ANAYS J	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	ADMINISTRATIVO	SECRETARIA	Sucre	002071837	SEC EDUC PRIMARIA	10000C	BACHILLER CONTRATADO
T7PLk9HM-P4s1-N4Yy-W6rN-BVDlxT1rrzyI	15361603	RONDON R	ANAYS J	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
NN127Gnr-RfQL-bPUc-7Bf2-QrDMyPWE4oAh	15741078	AMAYA GONZALEZ	MIRTHA J	COORD. NIVEL DE EDUCACION PRIMARIA BOLIVARIANA	DOCENTE	ANALISTA BONO BOLIVARIANO	Andrés Mata	006732257	GE CANGREJAL	4120WI	DOC. (NG)/AULA
wo1Ob6YH-tvnk-lWfB-LWjo-iSJQGJWrLcPj	5871047	NUÑEZ BRITO	YNES MARIA	COORD. PLAN SALUD	ADMINISTRATIVO	COORDINADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
wo1Ob6YH-tvnk-lWfB-LWjo-iSJQGJWrLcPj	5871047	NUÑEZ BRITO	YNES MARIA	COORD. PLAN SALUD	ADMINISTRATIVO	SECRETARIA	Sucre	001200489	DIV DE PERSONAL	10000C	BACHILLER CONTRATADO
UUzdqdMm-83iT-gROJ-5WJW-sH1TFgPalDDw	8647696	LANZA	HIPOLITO JOSE	COORD. PLAN SALUD	ADMINISTRATIVO	ANALISTA	Sucre	004106406	P E LUISA CACERES DE A	10000C	BACHILLER CONTRATADO
rIBFlk4o-wxZi-0bH7-aqAr-4vK26jFX4PU3	12740245	FERMIN VELASQUEZ	CLEIDER DAVID	COORD. PLAN SALUD	ADMINISTRATIVO	ANALISTA	Sucre	999999990	COMISIÓN DE SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
FgXjorrn-iP3U-UKZc-gGXB-hUMIWf835SkD	13358576	GOMEZ NUÑEZ	JOSE AGUSTIN	COORD. PLAN SALUD	DOCENTE	ANALISTA	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	113AWH	DOC. CONTRATADO A
FgXjorrn-iP3U-UKZc-gGXB-hUMIWf835SkD	13358576	GOMEZ NUÑEZ	JOSE AGUSTIN	COORD. PLAN SALUD	DOCENTE	ANALISTA	Sucre	007911647	C B ANTONIO LEMUS PEREZ	1134DH	DOC. IV  /AULA
EGX3A5t4-w1Wq-Tdj4-QCVd-8iuXVOl6C7UP	17538849	BASTARDO HERNANDEZ	LUIS DANIEL	COORD. PLAN SALUD	ADMINISTRATIVO	ANALISTA	Sucre	006738087	GE NUEVA ESPARTA	10000C	BACHILLER CONTRATADO
8k3OD6la-UcYI-xpy9-IyIR-HMbpSdzi0e7X	5880564	RODRIGUEZ GONZALEZ	MIGDALIS JOSEFINA	COORD. PLANTELES PRIVADOS	DOCENTE	COORDINADORA	Bermúdez	006399095	CEA REPUBLICA DE HAITI	1184NH	DOC. IV  /AULA
8S1xrWrm-tmQa-uQMI-hNmz-sPWOaYg4B0Qm	9974485	GUERRA RODRIGUEZ	YEMNIFER COROMOTO	COORD. PLANTELES PRIVADOS	DOCENTE	SUPERVISORA	Sucre	006732086	GE LUIS A MORALES R	1124DI	DOC. IV  /AULA
pVLcgaaq-GQGr-b1dL-WRLk-OqGgqnE8XOKt	9980332	PEREZ	ISABEL TERESA	COORD. PLANTELES PRIVADOS	DOCENTE	SUPERVISORA	Sucre	005508090	U.I. JUAN P. PEREZ A.	1243WC	DOC. III /COORD.S-
RCceFSF7-zR6i-BFCG-j9Jk-1FwBX8ybJZ3H	3490988	GUTIERREZ ESCALONA	JESUS ARNALDO	COORD. PRENSA Y RELACIONES PUBLICAS	DOCENTE		Sucre	005786905	I DE C MODESTO SILVA NOCT	1184NH	DOC. IV  /AULA
qPxNluHH-mE3v-qUUe-i9yK-CFhZnLYUAx6u	3642258	CONTRERAS M	MANUEL DEL J	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO	ASESORA	Sucre	007911370	LICEO ANT J DE SUCRE	300000	PROFESIONAL UNIV. I
rYAq2z3A-SPsV-W6PN-MzyL-TYoNe7QXAWLC	5083931	ROMERO GAMARDO	LUIS GERARDO	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO	FOTOGRAFO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
pEHtQS5h-NPni-3Aei-z9OK-HDZvKmv5AXlV	5704527	FUENTES	CESAR LUIS	COORD. PRENSA Y RELACIONES PUBLICAS	DOCENTE		Sucre	006732086	GE LUIS A MORALES R	112AWI	DOC. CONTRATADO A
PcZe7pdG-siGr-wEcc-ksI4-NPxLkyfK3GCa	6806554	RUIZ S.	JUAN J.	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO	COORDINADOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	20000C	TECNICO SUPERIOR UNIVERSI
t8FZpPw8-HpAR-wMoj-ayx5-MEscgG6DgJZM	8636552	PINTO	URANIA DEL VALLE	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO	ANALISTA DE PRENSA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
0dOuqMIW-zSip-SY8O-nrrO-UYMDmuTCm8dJ	8644826	ACOSTA MUÑOZ	ELIO JOSE	COORD. PRENSA Y RELACIONES PUBLICAS	OBRERO	FOTOGRAFO	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	8510N 	SUPERV. DE SERV. ESP.    
1zpD12sI-Y7PP-vxMU-Kn6U-zwYhsPf8Kzf8	8654579	VELAZQUEZ SALAZAR	OCTAVIO ISAIAS	COORD. PRENSA Y RELACIONES PUBLICAS	OBRERO	CHOFER	Sucre	006736458	GE JUAN FREITES	8030C	ASEADOR CONTRATADO
1zpD12sI-Y7PP-vxMU-Kn6U-zwYhsPf8Kzf8	8654579	VELAZQUEZ SALAZAR	OCTAVIO ISAIAS	COORD. PRENSA Y RELACIONES PUBLICAS	OBRERO	CHOFER	Sucre	006736458	GE JUAN FREITES	8030N	ASEADOR
6Bio1YYA-LwUO-PeDB-mbgO-sne4pbx7cJhl	9973222	GUTIERREZ GUTIERREZ	CARMEN JOSEFINA	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO	PERIODISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
ddpfxWZy-5N6Z-BQba-8NYI-pqMswhlxTSeI	9973794	DURAN GONZALEZ	ELIDA MARIA	COORD. PRENSA Y RELACIONES PUBLICAS	DOCENTE		Cruz Salmerón Acosta	007932383	EB MANICUARE	1141WH	DOC. I   /AULA
OSi6ID0e-7ECa-6LQP-X8BU-TgwNkg4nIZjb	12276738	ALBELAEZ P.	JUAN C	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO	COORDINADOR	Sucre	001200482	DIV. DE CORD ENTES PUBLI Y PRIV CUT	20000C	TECNICO SUPERIOR UNIVERSI
aLDagHgl-iRgO-t373-LIwl-yVrmHUXZ5Y5Y	12455498	SUAREZ CASTRILLON	YESSICA PATRICIA	COORD. PRENSA Y RELACIONES PUBLICAS	OBRERO	PROTOCOLO	Sucre	005508090	U.I. JUAN P. PEREZ A.	8030C	ASEADOR CONTRATADO
aLDagHgl-iRgO-t373-LIwl-yVrmHUXZ5Y5Y	12455498	SUAREZ CASTRILLON	YESSICA PATRICIA	COORD. PRENSA Y RELACIONES PUBLICAS	OBRERO	PROTOCOLO	Sucre	005508090	U.I. JUAN P. PEREZ A.	8030N	ASEADOR
1AubL82F-F7vp-v8WV-kPxY-0oDzoi1rogtQ	14671356	BRITO RODRÍGUEZ	MARY CARMEN	COORD. PRENSA Y RELACIONES PUBLICAS	OBRERO	PROTOCOLO	Ribero	004109390	JI VALENTIN VALIENTE	8030C	ASEADOR CONTRATADO
6qswmDPe-ykGB-1ybu-4QUe-vkqlPmSyZxpn	16313195	MILLAN CORTESIA	GREGORY JOSE	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO	FOTOGRAFO	Sucre	999999990	COMISIÓN DE SERVICIOS	10000C	BACHILLER CONTRATADO
6qswmDPe-ykGB-1ybu-4QUe-vkqlPmSyZxpn	16313195	MILLAN CORTESIA	GREGORY JOSE	COORD. PRENSA Y RELACIONES PUBLICAS	OBRERO	EDITOR  DE AUDIOVISUALES	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
dWlDwczn-PieN-Y6z3-ok7O-J3cYDkQcNUjK	16703781	GUTIERREZ BRITO	ALVIN JOSE	COORD. PRENSA Y RELACIONES PUBLICAS	OBRERO	EDITOR  DE AUDIOVISUALES	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
V7vGwhUW-PbSf-pphP-JqWX-PM6Y6EtjwTlN	17114520	LOPEZ MARIN	EDITH VANESSA	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO	SECRETARIA	Sucre	002071745	DIVISION DE DOCENCIA	10000C	BACHILLER CONTRATADO
V7vGwhUW-PbSf-pphP-JqWX-PM6Y6EtjwTlN	17114520	LOPEZ MARIN	EDITH VANESSA	COORD. PRENSA Y RELACIONES PUBLICAS	ADMINISTRATIVO		Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
x58v2lV9-AyUD-a92u-CKKV-qEnwTW4M8vdm	4687593	SALCEDO CORONADO	NELLYS JOSEFINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	007914550	CB JOSE S GONZALEZ	1132DH	DOC. II  /AULA
xo0OhJMW-QM8y-BxLM-ipZN-gGoCJpKvNN02	5083514	URBANEJA RIVAS	ALI ANTONIO	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	200000	TSU I
xo0OhJMW-QM8y-BxLM-ipZN-gGoCJpKvNN02	5083514	URBANEJA RIVAS	ALI ANTONIO	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE		Sucre	006394350	CEA FCO ARISTEGUIETA B	1181ZH	DOC. I   /AULA
DYQphcMZ-LN3s-HUEX-CIFc-S8M76IRAJFof	5088005	SULBARAN DE MARVAL	VILMA MERCEDES	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	007914550	CB JOSE S GONZALEZ	4130WH	DOC. (NG)/AULA
7ZQYzcUI-Drxb-rSi5-lWM2-6ntPpeX8rv7A	5337570	SIFONTES	MIREIDA DEL VALLE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ASISTENTE	Sucre	006736458	GE JUAN FREITES	30000C	PROFESIONAL UNIVERSITARIO
Fjnuw8CF-sL9A-f0Bg-gFZ0-CQgKAnHIgvTD	5492211	LICETT RINCONES	SOLANGE DEL VALLE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006738086	GE NUEVA CORDOBA	1123DI	DOC. III /AULA
Fjnuw8CF-sL9A-f0Bg-gFZ0-CQgKAnHIgvTD	5492211	LICETT RINCONES	SOLANGE DEL VALLE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE		Sucre	006738086	GE NUEVA CORDOBA	1124DI	DOC. IV  /AULA
0S1ovKFT-rC2X-CLUH-8MOk-BKPftMzdrt55	5689697	GOMEZ GONZALEZ	JOSE MANUEL	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	NUTRICIONISTA	Sucre	004700043	NIBE SUCRE	300000	PROFESIONAL UNIV. I
wLhouwA0-EL4Y-9xfd-TRvx-8FlUswGaeCNQ	5702659	LOPEZ F	CARMEN L	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006399957	EBA ESC TECNICA DE PESCA	1181ZH	DOC. I   /AULA
RAg1ZXfh-OnY4-9Qqf-3g6M-UWA2ePYSMdE7	5702906	CASTAÑEDA	CARLOS JOSE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO		Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
isH5k2gl-TkSe-hgYt-N9v0-WjQuHvf8GMhD	5704523	VELASQUEZ DE M.	MARIA DEL V.	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	007950503	EB CREACION NURUCUAL	1141WH	DOC. I   /AULA
hCdjUonj-lg1O-fpBp-etKH-LMYaxHftN2rB	5708777	RODRIGUEZ VASQUEZ	PABLO ANTONIO	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	CONTROL Y SEGUIMIENTO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
tTzXbIGT-riI3-0O4W-Z2h4-fhySz5Jq7hBQ	6806423	RIVAS M.	ALEXANDER J.	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	RELACION INTER-INSTITUCIONAL	Sucre	008411063	CAI BICENTENARIO	4160WI	DOC. (NG)/AULA
Fac945ke-a0eE-CEbh-bkJi-cN6WEXOSU53t	8289735	RONDON	YANEXIS MARINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	SUPERVISORA	Sucre	005601647	UE. BARTOLOME DE LA ROCA	1132DH	DOC. II  /AULA
lZrQ9OEZ-oDBl-HSzc-I2Tf-etGUuk8cDrfe	8336447	GONZALEZ QUEZADA	PERLA MARIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	005601647	UE. BARTOLOME DE LA ROCA	1145DH	DOC. V   /AULA
fNMAjfmF-Wc3X-s9Go-9AiY-Folv49IqS4zH	8436309	BERNAEZ FUENTES	OLIVIA JOSEFINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
PI1mGvD9-K8wb-Lpku-gzq9-d0hptYJYcM7m	8436654	PINO	NORYS A	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	300000	PROFESIONAL UNIV. I
tkLVQnKz-cv3Y-nZYR-TBZr-jxGCoI5l4QUc	8440018	GUERRA MARQUEZ	ISABEL CRISTINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	CONTROL Y SEGUIMIENTO	Sucre	006738975	GE RENDON	1123DI	DOC. III /AULA
tkLVQnKz-cv3Y-nZYR-TBZr-jxGCoI5l4QUc	8440018	GUERRA MARQUEZ	ISABEL CRISTINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE		Sucre	006738975	GE RENDON	1124DI	DOC. IV  /AULA
4TbHJsAf-QeOD-c0Ts-O6WF-eRpULCkbdLLO	8635117	SOTERANO MARQUEZ	THAMARA SOLEDAD	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
ayO2GYhK-tNUf-6ZSg-AiPW-x7WFa78stfOf	8637705	FIGUEROA RODRIGUEZ	FERNANDA DEL VALLE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	ANALISTA	Sucre	006970353	NER NUC ESC RURAL N 353	4120WI	DOC. (NG)/AULA
2tWh5q9P-zntY-093e-sS3C-LNFeJSULOccC	8639251	GARCIA SEGURA	ADA MARINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	30000C	PROFESIONAL UNIVERSITARIO
sjRb2ETy-8cuh-r7im-1DQX-PZkRg3vOMIPD	8639912	RODRIGUEZ SANCHEZ	ANA MARIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE		Sucre	006393320	CEBA. EL ISLOTE	4190ZH	DOC. (NG)/AULA
WxulPnnx-2kpa-qQxB-g0KG-Pa5Uvt7erS8Y	8644003	LOPEZ DE MADRID	ROSA MARGARITA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
qcvaWCeW-PcMt-2vay-sMsX-spGFRt7SJVN4	8645229	CENTENO L.	DANIEL J.	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006738090	GE NUEVA TOLEDO	4120WI	DOC. (NG)/AULA
u41bt0QY-BTiq-3x48-c3Em-EzoccJ3MvhjB	8651917	CHIRINOS PAREJO	ROSAY ELENA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	ANALISTA SUMARIO PAE	Sucre	006970068	NER NUC ESC RURAL N 068	4120DI	DOC. (NG)/AULA
25oRBx9T-GBBB-VFYb-pCYw-pMivT9kJ2C1w	8654674	BARRIOS GONZALEZ	CRUZ RAFAEL	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006970353	NER NUC ESC RURAL N 353	1121DI	DOC. I   /AULA
QJeUR1Ju-YAsf-JBHH-Tzn2-XBofyAVDMYCK	9270621	CEDEÑO VELASQUEZ	NOHEMI JOSEFINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006738086	GE NUEVA CORDOBA	1123DI	DOC. III /AULA
1IFi5Nzc-RF9F-vAoV-ibNE-pNPKBt5Muf3d	9934681	ACOSTA LEONETT	NELSON JOSE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	VERIFICADOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
kzUA6F1D-f67r-GWjD-Gojh-5ZT1KbuTZB90	9973909	HERRERA JIMENEZ	BEATRIZ ELENA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE		Sucre	006970068	NER NUC ESC RURAL N 068	1113DI	DOC. III /AULA
6T774NI0-zBRd-Zqxp-eAZz-6T9uF9cL3LPr	9974397	FIGUEROA O.	MARISOL DEL V.	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006970068	NER NUC ESC RURAL N 068	4130WH	DOC. (NG)/AULA
5LVg3mvN-1Pzr-8bg7-kcFp-DA5Na4yITCTL	9976197	DURAN	ANACELYS DEL VALLE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	004107440	JI NUEVA ANDALUCIA	2117DI	TSU EN EDUCACION
Dac9E8NR-9lEo-iiPk-EVPb-PXO3JS3zTHPS	10464089	MARQUEZ VALERIO	DORANNE DEL VALLE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	004107465	JI NUEVA TOLEDO	1113DI	DOC. III /AULA
8OvSFdA0-uu3C-iGnh-cnsq-4j56AdSakYtn	10947065	MOLINET ASTUDILLO	EUSNOVIA YOSMAR	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	007931527	EB BRASIL III	1122DI	DOC. II  /AULA
eEWqN0Z5-CxvQ-bWrt-GeWa-mGpqTkGy70s7	10948375	MORALES UGAS	EUFRASIS MARIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	11001C	BACHILLER CONTRATADO
pU9twB9x-GkMQ-P62S-1A1b-6Uw8eBmsSG3s	10949784	VICENT MARTINEZ	JOSE FELIX	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO		Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
XGNsBQnp-4hZC-T7tr-epO9-amOi4mP0zZQh	11376398	MEJIAS DE PEREZ	MAYRA THAIS	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE		Sucre	004100544	P E ANTONIO GUZMAN BLANCO	1114DI	DOC. IV  /AULA
Xwogt096-FUgd-vwvI-hLGK-kM1Afzfnc96g	11380715	ASTUDILLO ANTON	VIRGINIA JOSEFINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	OBRERO	VERIFICADORA	Sucre	006421280	A I ESTADO NUEVA ESPARTA	8490N 	SUPERVISOR DE MANT       
luUSTrOw-LZlo-GBFD-wgwv-9gtYyfMAMa5N	11380906	RAMIREZ QUINAL	MILENA JOSEFINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Bolívar	006970227	NER NUC ESC RURAL N 227	112AWI	DOC. CONTRATADO A
L9p8A5MM-IsLp-Wz0z-Vu9f-9UnnGoWOaGaK	11383316	MALAVE CENTENO	YORLENYS JOSE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Sucre	007912150	CB CRUZ SALMERON A	30000C	PROFESIONAL UNIVERSITARIO
PN6z2Iv1-JrmO-mO9o-PgPQ-48k5nXychHNU	11383513	MARIN	AUDREY LILIANA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
abyDk61B-ZOUu-uqfK-LmOS-KrU0ZCWYzwDZ	11827113	MAESTRE O.	KEILA K.	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	004108640	JI RIO CARIBE	1112DI	DOC. II  /AULA
AGStCuWA-yP7T-n3e5-oqI2-JjjxzopDYdiN	11828623	GONZALEZ LISBOA	TAMARA JOSEFINA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	1113DI	DOC. III /AULA
aXQaLymW-18Ku-PmTb-8Opv-UqcZS1kSHBuw	11834425	DURAN GUTIÉRREZ	MAYLETH PAOLA ANDREA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Ribero	004109390	JI VALENTIN VALIENTE	1112DI	DOC. II  /AULA
yzyUWEpe-8eTm-wD0r-kcCm-Hlbwn4JolUdW	12270844	RICARDI CEDEÑO	CARMEN TERESA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
l3sWmn8j-X0U1-JFJM-vqxh-Qu7Y5a6t6TCW	12660921	RODRIGUEZ LICETT	GLENNY DEL VALLE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Andrés Mata	006970354	NER NUC ESC RURAL N 354	10000C	BACHILLER CONTRATADO
oKP76LGQ-nOxK-ZuTt-jWOn-A5ijQwJlRcx8	12661142	ESPIN GARCIA	KARLA ALEJANDRA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE		Sucre	006734775	GE FCO ARISTEGUIETA B	112AWI	DOC. CONTRATADO A
s4cPKmc9-jyIs-XFJp-oHeL-OyHDFVF6bgKK	13015195	HERRERA P.	MARIELA DEL V.	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	007931529	EB BRASIL IV	4120WI	DOC. (NG)/AULA
EfQ0n0A7-ObjO-YWWc-t3Cf-5xn6q5yjeMgk	13053799	ZERPA L.	GABRIELA B.	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	004106740	JI MARCO A SALUZZO	2127DI	TSU EN EDUCACION
1VSx6z3r-iFZM-Z19s-aQKB-ElMWaqgAgXfp	13318011	NORIEGA DE M.	YANEURYS J.	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Sucre	006737640	GE MILA DE LA ROCA	30000C	PROFESIONAL UNIVERSITARIO
2yHyaCKu-67UB-A5g9-NzdA-yqZNQ6iv8XrE	13358280	ZERPA JIMENEZ	YNES MARIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ANALISTA	Sucre	004107465	JI NUEVA TOLEDO	30000C	PROFESIONAL UNIVERSITARIO
2yHyaCKu-67UB-A5g9-NzdA-yqZNQ6iv8XrE	13358280	ZERPA JIMENEZ	YNES MARIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO		Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
eoACrejG-Gz16-zTn3-4t1R-ve2o2HzKhT06	13772340	BARRERA BARRERA	RUBEN DARIO	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006394350	CEA FCO ARISTEGUIETA B	1184ZH	DOC. IV  /AULA
zydxtxLU-Rgqv-eY4F-qUZN-TNd7LYY3CEqO	13784185	LOPEZ	ZONELLYS DEL CARMEN	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	004107450	JI NUEVA CORDOBA	1122DI	DOC. II  /AULA
GAf1hrf1-uKvx-i9Qb-SVhC-yyImCliNrUkE	13835747	PICO CABELLO	FARIDES SOFIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	004101162	PE BOCA DE SABANA	1111DI	DOC. I   /AULA
GAf1hrf1-uKvx-i9Qb-SVhC-yyImCliNrUkE	13835747	PICO CABELLO	FARIDES SOFIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE		Sucre	004101162	PE BOCA DE SABANA	1113DI	DOC. III /AULA
BEiPKjeW-UJ1z-5dTr-saj6-Zam7EezJQOcT	14105016	TRIVIÑO RAMOS	MIGUEL ANTONIO	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	COORDINADOR PARROQUIAL	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
NHMCHhI9-YEdz-9aFB-zNMJ-XbmUs0zzm38X	14125820	IZAGUIRRE RIVAS	LISCAR DEL VALLE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006738087	GE NUEVA ESPARTA	1121WI	DOC. I   /AULA
KuxE9Z4P-5xAj-bVej-OwpR-37tFGzIWE7oB	14284071	GONZALEZ MAESTRE	YURIMAR	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	VERIFICADORA	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
Uf4G0xy5-5Id6-fMaV-Bs49-nFawhDTrZkRm	14314280	ROMERO HOMER	MARIA ALEJANDRA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006391736	CEA LAS PALOMAS	4180ZH	DOC. (NG)/AULA
O7cx3eHd-KkVY-LbSa-BGa1-pEPlSwfaXjRe	14671602	CORDOVA HERNANDEZ	OSCAR ENRIQUE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
idfpM8bo-JTnK-FTON-FfvD-XHrH9SYEcUTQ	14815804	MALAVE FIGUERA	ROSYDANIA LIBERTAD	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	100000	BACHILLER I
idfpM8bo-JTnK-FTON-FfvD-XHrH9SYEcUTQ	14815804	MALAVE FIGUERA	ROSYDANIA LIBERTAD	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	999999990	COMISIÓN DE SERVICIOS	100000	BACHILLER I
OSWnh7ke-YVVS-kLoL-F3fz-WaJYXmP9XDM1	15111887	RODRIGUEZ MATA	RONNEL DAVID	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006735890	GE JAVIER ALCALA VASQUEZ	1122DI	DOC. II  /AULA
QRhZKXz8-jfwx-LNXI-SJfY-dE7PVdpDETpq	15361176	MARTINEZ M	YENNYS J	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	ANALISTA	Bolívar	007913900	CD JESUS MARCANO E	4140WH	DOC. (NG)/AULA
1bxRMO3Y-8NGP-2xWc-VEKU-vXQWnBGjNmF7	16301264	BRICEÑO ASTUDILLO	ANDREINA MARIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	SECRETARIA	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	10000C	BACHILLER CONTRATADO
1bxRMO3Y-8NGP-2xWc-VEKU-vXQWnBGjNmF7	16301264	BRICEÑO ASTUDILLO	ANDREINA MARIA	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
1sjW2yj4-MlzW-FLvZ-iMh8-RGKpQA4BSug3	16314494	PEÑA REYES	MIGUEL ANGEL	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	20000C	TECNICO SUPERIOR UNIVERSI
s7c3NGF6-zZGJ-o6G2-ebhF-VOiwNaawLTOK	16315031	MALAVE GUERRA	JOSE LUIS	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	DOCENTE	COORDINADOR PARROQUIAL	Sucre	006970068	NER NUC ESC RURAL N 068	2127DI	TSU EN EDUCACION
1AZG051q-8Ie9-ljke-osgw-dPTZxTN9AkUM	18211225	FRANCO FRANCO	DAYANA MERCEDES	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
94fxc2bd-djnU-Mz6t-mftF-6sktS5jIAntx	18418556	CARDIET GUTIERREZ	ZULIMAR JOSE	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
gXFNs4Jf-7Tc4-MCn1-tpdj-eLRNYbZzh3ra	19538679	GAMBOA RODRIGUEZ	RONNY ALEXANDER	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	VERIFICADOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
gXFNs4Jf-7Tc4-MCn1-tpdj-eLRNYbZzh3ra	19538679	GAMBOA RODRIGUEZ	RONNY ALEXANDER	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO		Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
yeSmftNf-uQID-bQ3T-hWgT-UwIzsQ9j70xA	24690751	ROBAYO MARQUEZ	BERTHA DE JESÚS	COORD. PROGRAMA DE ALIMENTACION ESCOLAR (PAE)	ADMINISTRATIVO	NUTRICIONISTA	Sucre	001200487	DIV. DE PROTECCION Y DES EST	30000C	PROFESIONAL UNIVERSITARIO
QygnS3ke-EdZ2-NJui-hLvq-OZKpYk3lIYWE	5692473	MARIN RODRIGUEZ	ELISO A	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	ASISTENTE AUDIOVISUALES	Cajigal	005529500	CB DIEGO CARBONELL	1144DH	DOC. IV  /AULA
afK5GbNh-HB8a-MYnL-mbhq-jvKinYtlWIWP	5697796	GUZMAN DE CARBONELLO	ISABEL DEL VALLE	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	ASISTENTE DE BIBLIOTECA	Sucre	006738985	GE REP ARGENTINA	1125DI	DOC. V   /AULA
C30KxSJA-ZkY3-MZs7-uLS1-yfvEy2wcqr5l	5700780	MARQUETT DE M	BLANCA JOSEFINA	COORD. RECURSOS PARA EL APRENDIZAJE	ADMINISTRATIVO	COLECTIVO DE RECURSOS PARA EL APRENDIZAJE	Sucre	007950581	U E ANTONIO JOSE DE SUCRE	100000	BACHILLER I
WsTsM8Nr-WwbH-VeX4-Irwv-Einaa5eBI6MT	8436131	ABREU R	YOLIDA A	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	COLECTIVO DE RECURSOS PARA EL APRENDIZAJE	Sucre	007933232	E B REBECA MEJIAS RAMIREZ	1125DI	DOC. V   /AULA
x8lVPKkk-RVvc-n5os-ho2S-sTTbgZmHomER	8440829	GONZALEZ A 	CRUZ DEL V    	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	COLECTIVO DE RECURSOS PARA EL APRENDIZAJE	Sucre	006399959	EBA ANTONIO LEMUS  PEREZ	1185NH	DOC. V   /AULA
x8lVPKkk-RVvc-n5os-ho2S-sTTbgZmHomER	8440829	GONZALEZ A 	CRUZ DEL V    	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	COLECTIVO DE RECURSOS PARA EL APRENDIZAJE	Sucre	007914550	CB JOSE S GONZALEZ	1145DH	DOC. V   /AULA
PWGRU27L-jbao-Mwz1-9xd5-1Gj4wlFfOR2E	8443847	CORDOVA GONZALEZ	LUISA MERCEDES	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	COLECTIVO DE RECURSOS PARA EL APRENDIZAJE	Arismendi	007919279	CB S JUAN DE LAS GALDONAS	1144DH	DOC. IV  /AULA
zb6iNnGe-B8Jn-oUDY-zIN1-3ppShHUA6dAp	11439090	MERLO YARIT	NANCY YALILE	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	COORDINADORA	Ribero	006739840	GE VALENTIN VALIENTE	1121DI	DOC. I   /AULA
6E3uNhP1-iDY1-t6sc-gUae-D7uAzIDG1sPe	12276221	RODRIGUEZ MARCANO	HILDREY MIRAIDA JOSE	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	COORDINADOR	Bolívar	006970227	NER NUC ESC RURAL N 227	1141WH	DOC. I   /AULA
d3AKVnKU-pB3j-hXIF-1B00-bpa0DFE3Anqv	12276867	VASQUEZ RODRIGUEZ	SOLANGE J.	COORD. RECURSOS PARA EL APRENDIZAJE	DOCENTE	COLECTIVO DE RECURSOS PARA EL APRENDIZAJE	Sucre	006970353	NER NUC ESC RURAL N 353	1131DH	DOC. I   /AULA
XLLPlj8c-9LSA-4gKr-NtAV-7sNIY8BgU5Ki	12666431	RUIZ DE GIL	FRANCELINA DEL VALLE	COORD. RECURSOS PARA EL APRENDIZAJE	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
lMXz5yTB-Yi3T-PS0K-qnmm-iwqwdBPHYUEZ	15361902	VELASQUEZ CABRERA	MARLENE MARIA	COORD. RECURSOS PARA EL APRENDIZAJE	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	20000C	TECNICO SUPERIOR UNIVERSI
wJOl2Gze-BfHd-9Gxm-2YuF-5L9vAR0dR22F	5692247	BLANCO ARREDONDO	CARMEN JOSEFINA	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	DOCENTE METODOLÓGICO	Sucre	005506000	IC BAS JOSE A RAMOS S	114AWH	DOC. CONTRATADO A
cVCMBq0R-Kmx4-Oowc-gUJ1-6qvVVnhW0zH6	8439326	ACUÑA SIFONTES	SIMON JOSE	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	COORD. DE LOGÍSTICA Y MATERIALES	Sucre	006562118	ESC BR RAFAEL CASTRO M	4120WI	DOC. (NG)/AULA
XFn4eTkv-bKiH-nrtr-IIPG-Z1NSFLMoUSZi	8440991	GONZALEZ	EDITH	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	DOCENTE METODOLÓGICO	Sucre	006739215	GE RIO CARIBE	1122DI	DOC. II  /AULA
3D5xMZxr-lwdW-88Vz-p4jJ-ErmXsUMS0On4	8638816	SUAREZ VELASQUEZ	LINAIDA ROSA	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	OBRERO	SECRETARIA	Sucre	006422260	AI ANEXA PEDRO ARNAL	8030N 	ASEADOR                  
u9OAWgKX-bnn5-h8hl-ftcW-ApwKVdlbfJCf	9270131	DE LA ROSA	CARMEN YANITZA	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	COORDINADORA ACADEMICA	Libertador	006970067	NER NUC ESC RURAL N 067	113AWH	DOC. CONTRATADO A
qN3dHdB2-jbQ1-aaIl-IURC-JwZ59Ds3yvY5	9977539	CALVO MAGO	LUISA NEOVYS	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	ADMINISTRATIVO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
pGjvsZKM-NuPr-daDY-3MRW-2jarLzqjBp7F	10469615	SUAREZ VELSAQUEZ	MILAGRO DEL VALLE	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	DOCENTE METODOLÓGICO	Sucre	006391736	CEA LAS PALOMAS	4170ZH	DOC. (NG)/AULA
b3oP8szD-rTyM-HjUq-u6SF-oxGUBgUidNCv	10946952	REYES CARREÑO	DEYANIRA TRINIDAD	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	DOCENTE METODOLÓGICO	Sucre	006391736	CEA LAS PALOMAS	1181ZH	DOC. I   /AULA
Q40owjqg-zWvz-gw5v-yOLu-L2abEe0kk56h	11380395	PLANCHE CARDIET	FELIX ANTONIO	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	COORDINADOR DE LOGISTICA	Sucre	006970068	NER NUC ESC RURAL N 068	2127WI	TSU EN EDUCACION
Q40owjqg-zWvz-gw5v-yOLu-L2abEe0kk56h	11380395	PLANCHE CARDIET	FELIX ANTONIO	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE		Sucre	006970068	NER NUC ESC RURAL N 068	4120WI	DOC. (NG)/AULA
brD7naW5-bpQY-qEah-6uKy-Ld72OEyWRFAB	11381912	MUNDARAIN NUÑEZ	RUBEN DAVID	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	COORDINADOR DE LOGISTICA	Sucre	006391736	CEA LAS PALOMAS	4170ZH	DOC. (NG)/AULA
yTCgy3bu-FFeR-gexU-qFsk-dYwQTMoh0v3i	11382037	CASTAÑEDA LOBATON	GLADYS COROMOTO	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE		Sucre	006731240	GE ADELAIDA NUÑEZ SUCRE	114AWH	DOC. CONTRATADO A
LMMNCwiv-VS3f-1nhv-5YV8-zFJhUTEhBHJw	12270793	VILLAFRANCA B.	MARLENE J.	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	DOCENTE METODOLÓGICO	Sucre	006732073	GE BR ALBERTO SANABRIA	1122DI	DOC. II  /AULA
hIPhM9op-JELW-vzjf-sQtb-QyuK5vNE3gva	12657524	SANCHEZ ALFONZO	HILDEMARYS	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	COORDINADOR	Sucre	004108520	JI RPBLCA ARGENTINA	2117DI	TSU EN EDUCACION
9REJJgQo-21fJ-lhRJ-L9WI-VjZgOJ1itHTp	12659102	MATA ACUÑA	FRANK ARQUIMEDES	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	ADMINISTRATIVO	COORDINADOR	Sucre	999999990	COMISIÓN DE SERVICIOS	10000C	BACHILLER CONTRATADO
JxX4uiL2-Nz1N-N3yb-7g2F-tF4cDeFfUghs	13051739	LOPEZ MACHADO	YELITZA KARINA	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	COORDINADOR DE NOMINA	Sucre	006391736	CEA LAS PALOMAS	1181ZH	DOC. I   /AULA
TfAfw05W-cLDK-Ad3L-9u02-kHKCIOHap1js	13539444	GARCIA	JOSEFINA ORANGELIS	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	DOCENTE METODOLÓGICO	Sucre	006391736	CEA LAS PALOMAS	4180ZH	DOC. (NG)/AULA
00Nan9Q2-t5Lv-cJpZ-Q19h-bTuLvQHlhzBM	14009278	LEMUS BOLIVAR	MARIBEL	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	OBRERO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
dT8MbHVG-8hus-7SLe-Ecso-xkk9w7Jc2JCh	14597644	APONTE GUEVARA	RAFAEL ERNESTO	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE		Sucre	006391736	CEA LAS PALOMAS	4170ZH	DOC. (NG)/AULA
dT8MbHVG-8hus-7SLe-Ecso-xkk9w7Jc2JCh	14597644	APONTE GUEVARA	RAFAEL ERNESTO	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE		Sucre	007932113	EB CORAZON DE JESUS	4130WH	DOC. (NG)/AULA
0a6tbnw9-siwR-tLUB-WCax-SB5Caj0tRdG7	11375329	RODRIGUEZ R 	JUAN R	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR	Sucre	004103850	JI FCO ARISTEGUIETA B	8985N	VIGILANTE
EkUWDhsZ-LV41-uyI1-av7m-fk9IQUgD5pjQ	15288651	RUIZ GUTIERREZ	XIOMARA DEL VALLE	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	DOCENTE	DOCENTE METODOLÓGICO	Sucre	006391736	CEA LAS PALOMAS	4170ZH	DOC. (NG)/AULA
rhymT7Js-XluT-8OjJ-v6WR-4Zqrxb9S2KC6	15741663	MOTA GUILARTE	RAMON NIGUEL	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	ADMINISTRATIVO	APOYO TECNICO FIJO	Sucre	999999990	COMISIÓN DE SERVICIOS	20000C	TECNICO SUPERIOR UNIVERSI
UOyvD6WC-7h6e-g5hn-II16-lJf4uOqniNi5	20346563	RODRIGUEZ MILANO	PAOLA YENIRE DEL VALLE	COORD. REGIONAL MISION ROBINSON EDO. SUCRE	ADMINISTRATIVO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
SlAMnOrR-pj0w-wJBF-hyWx-mcgJ1XJUBS0C	8433855	NORIEGA MATA	YRAIDA JOSEFINA	COORD. REGISTRO Y VERIFICACION	ADMINISTRATIVO	ANALISTA	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	300000	PROFESIONAL UNIV. I
aKfEUX2a-fGCb-2Ikq-FDsS-3CAnBzU0rGuF	11378728	TRUJILLO GUTIERREZ	LOLIMAR	COORD. REGISTRO Y VERIFICACION	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
kNiAtMnw-D8UF-laUZ-cqiA-jAdoR92jBq6Z	11380931	DIAZ DE BENITEZ	ROSA BEATRIZ	COORD. REGISTRO Y VERIFICACION	ADMINISTRATIVO	ANALISTA	Sucre	006564880	ESC JOSE A RAMOS SUCRE	20000C	TECNICO SUPERIOR UNIVERSI
7cpWzq3s-Msqe-4WXw-k366-6zJ8uPXAOllB	12661912	CORONADO JIMENEZ	OLYS MARIA	COORD. REGISTRO Y VERIFICACION	ADMINISTRATIVO	COORDINADORA	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
2pwWPjl2-XexK-o1xd-CMBE-4kO8h4CCbv91	12665628	BETANCOURT GUEVARA	MARYURIS ELENA	COORD. REGISTRO Y VERIFICACION	ADMINISTRATIVO	ANALISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
DxIzPqPy-FXEM-AGxM-Cp7u-AEG4uXW0Cydx	2926141	TOTESAUTT SANCHEZ	ROMULO ANTONIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	007912153	CB BR RAFAEL C MACHADO	8030N 	ASEADOR                  
iHX5lG52-tRFU-1kv0-HUkP-mGFErML5SPDE	3937691	LOPEZ GOURIE	RAMON ENRIQUE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
Is7i13m1-nkXK-PGDQ-vRz5-ZkKSz32a3oUx	4079666	ROMERO SERRANO	LUIS MARGARITO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
7Gsz1OJ5-Uu2e-jvcn-sUXl-Nx0ie2Nduefk	4189031	PINEDA 	EDGAR JOSÉ	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	001200480	DESPACHO DEL DIRECTOR ZONA SUC	8985N 	VIGILANTE                
pJG4xA4h-eXrd-EQNH-EJcj-OB3xVUQFMwnP	5077369	CUMANA	FRANCISCO J.	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8590N 	MENSAJERO                
Mk7GVkVD-x4b0-3ydj-REJu-LAv4tnS4jytT	5077827	MAZA	VICTOR J.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
NbmVBv5x-J5R2-aaqK-Allr-uOazpEScXseV	5078868	SOTILLO ANDRADE	PEDRO LUIS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007912085	CB VICENTE S Y URBANEJA	8030C	ASEADOR CONTRATADO
NbmVBv5x-J5R2-aaqK-Allr-uOazpEScXseV	5078868	SOTILLO ANDRADE	PEDRO LUIS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007912085	CB VICENTE S Y URBANEJA	8030N	ASEADOR
OxTIPTVa-Aiai-609E-qpOH-0DRNmOP2uX8t	5085997	ARREAZA SALAZAR	RAMON ANTONIO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006564880	ESC JOSE A RAMOS SUCRE	8985N 	VIGILANTE                
ZBtfaL9P-vtJT-GyMt-Ire9-0XhfpOhAcMJT	5086882	PATIÑO FERNANDEZ	ALEXYS RAFAEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
zg9YKfNB-exJi-jFKU-70UE-1DT5snPgvfU5	5087597	GOMEZ 	LUIS               	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
CH6ebCfM-nYUQ-iRxp-LxAD-6hht0zQtutQD	5187562	ROSALES	LUISA MERCEDES	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR INTERNA	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	8001N 	SUPERV. DE SERV. INTERNOS
JFH1AUZi-Jc7G-AdDU-bGC9-rR5eK62A5Qf5	5691777	SALAZAR B.	JOSE F.	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
XaZOZaAs-RUnr-BS8H-Lxl3-KCw1hi0rcLgR	5693553	GODDELIETT	JULIO CESAR	COORD. RELACIONES LABORALES	OBRERO	SEGURIDAD	Sucre	006731525	GE ANDRES ELOY BLANCO	8985N	VIGILANTE
XaZOZaAs-RUnr-BS8H-Lxl3-KCw1hi0rcLgR	5693553	GODDELIETT	JULIO CESAR	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006731525	GE ANDRES ELOY BLANCO	8985C	VIGILANTE CONTRATADO
nI5aGRIf-Bjt6-H8kp-u1tb-m3dAHRNVycfD	5694792	CORREA ALVAREZ	CARLOS JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	001200480	DESPACHO DEL DIRECTOR ZONA SUC	8985N 	VIGILANTE                
FVqJyrH6-bA0e-TQJI-Rqyu-x6XKxa8rg7sa	5698206	RODRIGUEZ FRONTADO	DOMINGO JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	005623000	EP E DE PESCA DE CUMANA	8030N	ASEADOR
c9rq7qYV-2At5-BPyq-G2rN-NdqxEnz0Xf7c	5699419	MARTINEZ	JESUS MANUEL	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
qBdgWsrp-Yr9I-m4Dg-8dSU-JBLRqeWqpzno	5700206	RODRIGUEZ	FRANCISCO JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006625200	EN PEDRO ARNAL	8985C	VIGILANTE CONTRATADO
WbkVTwcC-dNjX-n8mc-oMVj-pAIJt7KwqEC5	5700286	MORENO V.	RAFAEL E.	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
7c50PIQU-Gaqy-nue3-CjXl-VsiRjhJoYJdE	5701427	GONZALEZ	CONCEPCION DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007911647	C B ANTONIO LEMUS PEREZ	8985N	VIGILANTE
KccvQ6OG-WtRm-4xRm-1HnC-VgquzPx0KRkc	5702440	MORA GUZMAN	LUIS ARQUIMEDES	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	005786900	CD MODESTO SILVA	8510N	SUPERV. DE SERV. ESP.
IGXcpjmt-qdag-Hy5Y-XwGR-R5RXftTUFymm	5705190	LEON CABELLO	ROSA ANA	COORD. RELACIONES LABORALES	OBRERO		Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8001N 	SUPERV. DE SERV. INTERNOS
26IV6xjv-HfU2-HbFt-ReDL-Am6CsYmmfT61	5705794	MUDARRA GONZALEZ	JORGE RAFAEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Ribero	006970032	NER NUC ESC RURAL N 032	8030N 	ASEADOR                  
Lt674Nug-sILq-oFaK-AssO-bH4sKIqHmHds	5705826	YANEZ V	WILLIAM J	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
Lt674Nug-sILq-oFaK-AssO-bH4sKIqHmHds	5705826	YANEZ V	WILLIAM J	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8630N 	AYUDANTE DE ALMACEN      
68baTYXY-Jiue-KJG8-veP3-sC1AXXAWMkeZ	5706390	PATINO FERNANDEZ	JOSE LUIS	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8260N 	CHOFER DE TRANSP.        
e4NSdWsm-MVxd-63X0-FYag-A3qtuCRXt1qu	5708741	FIGUEROA PATIÑO	ARQUIMEDES RAFAEL	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006738090	GE NUEVA TOLEDO	8030N 	ASEADOR                  
tcglWYjh-Trom-Sh3g-xh5k-dRbX1lJ0LJXA	5857317	LAREZ A	EUGENIO V	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
tcglWYjh-Trom-Sh3g-xh5k-dRbX1lJ0LJXA	5857317	LAREZ A	EUGENIO V	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
29zy08L3-VtC2-g4qm-iWGe-FAVQ3JZwwwO4	5871980	MAGO GIUSTI	GERONIMO MIGUEL	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	002071738	DIV ASUNTO LABORALES	8030C	ASEADOR CONTRATADO
Iy7zvSsx-cPD2-ycMO-q0wG-sg5Lfcx4Ib58	5876386	GONZALEZ GOMEZ	OLIVIA FLORENCIA	COORD. RELACIONES LABORALES	OBRERO	SUPERVISORA	Sucre	006564880	ESC JOSE A RAMOS SUCRE	8030N	ASEADOR
Tz670Jo4-nTqq-or5K-ONB8-xLwi0kyWDMJP	6521195	MOLINETT GUERRA	JOSE VICENTE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
Tz670Jo4-nTqq-or5K-ONB8-xLwi0kyWDMJP	6521195	MOLINETT GUERRA	JOSE VICENTE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
A7LKVykq-VuIs-AJbT-nTwb-An6EiVtgxWre	6957779	FERMIN	DOUGLA MANUEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Bermúdez	005788600	CB TAVERA ACOSTA	8030C	ASEADOR CONTRATADO
v7ctgskR-rna7-VD28-3J53-8zwthvlr8dge	7957781	HERNANDEZ R.	FRANK E.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE PLANTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8001N 	SUPERV. DE SERV. INTERNOS
g7uWP5ZK-JNqc-rBcU-YwyB-LSUt7cju9DrH	7995703	GARCIA	ARACELIS JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
TPwW0y1n-UQQg-viZA-t3o8-GxmLpCUggp9U	7999601	GUERRA NORIEGA	JOSE GREGORIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	006739639	GE SUCRE	8030C	ASEADOR CONTRATADO
HOtsBrva-zclM-ux67-NumI-X0aqcmSRUPyF	8342542	MARQUEZ MILLAN	ELENA JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006737460	GE MARCO ANTONIO SALUZZO	8030C	ASEADOR CONTRATADO
ipnH7HoD-07nc-btSL-dfS8-l8gY7V3hj7iR	8374327	CARDOZO MONTAÑO	BENITO ANTONIO	COORD. RELACIONES LABORALES	DOCENTE	COORDINADOR	Sucre	007915780	CB LUIS GRATEROL B	4130WH	DOC. (NG)/AULA
6Xw2STcO-gO8Z-Wffx-vQAt-yumMmKVeQudz	8400668	BELLO RINCONES	GUILLERMO ELOY	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Montes	006970436	NER NUC ESC RURAL N 436	8030N 	ASEADOR                  
wL648ngB-Jq98-9aEy-BlHl-NTd3nSGKRP3C	8423974	JIMENEZ SUAREZ	FRANCISCA DE PAULA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	8030C	ASEADOR CONTRATADO
Cij9ZHxJ-gUT2-8gsD-SVSi-A0j6A0RIgQHM	8433100	RODRIGUEZ 	OLIVIA MARIA   	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR INTERNA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8001N 	SUPERV. DE SERV. INTERNOS
VlPfGqTC-acR7-0dgs-2FzU-DkxzzpDiWEUM	8433382	ANTON 	ANGEL MIGUEL       	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	005786900	CD MODESTO SILVA	8030N 	ASEADOR                  
ehcJGyXa-yF5i-z13T-SYbz-81u819UgEoYs	8435786	PERETTI PEINADO	FRANZUA JOSE	COORD. RELACIONES LABORALES	OBRERO	PORTERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
6H5tEFjH-Jaim-yfJO-3JoD-ubCn5nzMVeXN	8435816	HENRIQUEZ	JOSE LUIS	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE MANTENIMIENTO	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8490N 	SUPERVISOR DE MANT       
n43fiF2u-HCFm-LFhp-5t1Q-aVoAkY7BC959	8437682	CARVAJAL MARCANO	JORGE LUIS	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
n43fiF2u-HCFm-LFhp-5t1Q-aVoAkY7BC959	8437682	CARVAJAL MARCANO	JORGE LUIS	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N	ASEADOR
LrGYeFMH-y6d8-Figv-OGJa-k8opzqgMJJ9D	8439583	SALAS DE ANTON	ADELA MARIA	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE MANTENIMIENTO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
JFBa6N5b-SsGm-Yn8F-4GRh-H91RohwKz8hu	8442863	MARCANO GUTIERREZ	MARISELA	COORD. RELACIONES LABORALES	OBRERO		Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8590N 	MENSAJERO                
6M8a0vcf-WHTZ-TAC5-E9wP-GLmWbDxi7E33	8443905	ROSALES MARQUEZ	FREDDY JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERV. DE SERV. ESPECIALES	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	8030N	ASEADOR
8W4Otb1u-EBL9-8A2y-Eoa3-ilxFNXK5KX4b	8449351	BRITO RAMOS	SIMON RAFAEL	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
A5t9bMK1-tNFv-4ErE-47qz-5002ZRM0VyE6	8635391	ARREDONDO ORTIZ	YAJAIRA	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
eoHToMGR-7wLc-7FdL-DLE7-WKjcEvda3cdR	8636787	RODRIGUEZ	CARLOS JULIO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006505175	TEV MANZANARES	8985C	VIGILANTE CONTRATADO
eoHToMGR-7wLc-7FdL-DLE7-WKjcEvda3cdR	8636787	RODRIGUEZ	CARLOS JULIO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006505175	TEV MANZANARES	8985N	VIGILANTE
sIZvOjpN-GYzv-7hNZ-G7Ah-LV716n8av2kS	8636792	SALAZAR G	JESUS E	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006739639	GE SUCRE	8985N 	VIGILANTE                
7HKtbKst-xWdM-5dY3-fjwH-je9CYAOIcXHy	8637980	GONZALEZ CONTRERA	DIAMARYS JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
V3pwCiDa-xEAm-Nonq-ne1N-2NDbri4ayMrG	8641166	PINO	WILMAN JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8260N 	CHOFER DE TRANSP.        
bypeyBkB-4ZUX-aMDv-nWQb-eWCTdF4Wm9CA	8641348	ARISMENDI GUEVARA	NARBEL DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	PORTERA	Sucre	004170580	CEI DR JOSE MARIA VARGAS 	8030C	ASEADOR CONTRATADO
BsGbCHKB-Dahm-Y2sG-A08a-AwiUcs1UZaCs	8641614	CORONADO F.	ALEXANDER J.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
8tLMnJtn-tzkM-bq1b-oNi8-Kgy83AT40rJ0	8645051	LOPEZ ESTACIO	RAMON ANTONIO	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
8tLMnJtn-tzkM-bq1b-oNi8-Kgy83AT40rJ0	8645051	LOPEZ ESTACIO	RAMON ANTONIO	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N	ASEADOR
0EsOQKVT-SLyb-oYEP-ARpj-ktOCdxBemhVR	8650562	SOTILLO LAREZ	LEOPOLDO JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	8030C	ASEADOR CONTRATADO
PKnYF761-A93P-Mj5l-xXb9-OTqeGFaS7WxJ	8650583	DE LA ROSA SANCHEZ	JULIO CESAR	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
xaz4lrwQ-jZbB-s50a-5aSj-fUCfNROxj8Nv	8650977	MARCANO GUTIERREZ	MARIA	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
83VlccfP-GE9N-NP9Q-uBfM-NvZDGwXpVZ6w	8653177	GUERRA ASTUDILLO	LUISA MARIELA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
EF653hZw-RlJe-igyn-I1dT-IEqKVQOz21mu	9063966	RODRIGUEZ SERRA	HORTENCIA JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
pmjtM9TV-ODf2-ya75-xqOb-1Y4ZuYC6ybh8	9269203	ARMARIO VASQUEZ	YSABEL MARIA	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	8590N 	MENSAJERO                
BMoV5QyV-Wq0f-4CC2-7sIQ-ulPAwsorBeFV	9270008	ROJAS 	HECTOR A.          	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
BMoV5QyV-Wq0f-4CC2-7sIQ-ulPAwsorBeFV	9270008	ROJAS 	HECTOR A.          	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
awJDIi6S-rTnb-JIZR-5MXZ-I32DZoJjgygh	9271882	CABEZA M.	MARCOS B.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
U8Y2PHSB-KnnD-4Rz9-Qlhs-wXoKggeM2T0P	9272864	BELIZARIO AREU	JOSÉ ASUNC	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
PeIj3W8t-T5Mu-KHpP-44nl-wqjX882SQITR	9276050	FLORES BALDAN	ORLANDO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
Cx7zQ0h9-zBR8-H2R5-pY0T-y0brfCxdtXDD	9277518	GARCIA L	FERNANDO A	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
o2DvLh1w-ag7p-qrDp-r1fD-EIHZbpgGtcoc	9278047	CASTAÑEDA DE DEFITT	DANY DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
Bge6ggjq-eCrZ-CSRf-PTF9-ZfezYtCKzWAn	9278386	ASTUDILLO 	PEDRO LUIS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
ci6zshlN-bk5U-YYlR-5z6y-aXLEZoz7pmBu	9278951	GOMEZ MATA	HEYRA MARIA	COORD. RELACIONES LABORALES	OBRERO	RECEPTOR DE DOCUMENTOS	Sucre	004085000	CDP EL BRASIL	8030N 	ASEADOR                  
tKYlMRFH-JGKR-jawR-y1t3-T6VutPXXIJCV	9279172	ARRIOJA	ADELAIDA DEL CARMEN	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006735890	GE JAVIER ALCALA VASQUEZ	8030C	ASEADOR CONTRATADO
hAZ1XVdX-ovyd-ZD4Z-ZNIS-KtMYJPpfSyxz	9279203	FIGUERAS	ARGELIA MARGARITA	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8590N 	MENSAJERO                
XoI73l4o-5iV4-xaKT-AlUL-WpPdcWn7Of9E	9451190	RODRIGUEZ CAMPOS	FRANK AQUILES	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006732255	GE CANDIDO RAMIREZ	8030N 	ASEADOR                  
iYDpawT8-CVyK-o8c8-B7PV-GewrLpvpwB5Z	9974802	MENDOZA	MARIA ANGELICA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
K2aQUmmo-4irl-QyNl-q2Qv-89ucCXpesYyU	9976077	MARCANO	CARLOS JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	007931527	EB BRASIL III	8030C	ASEADOR CONTRATADO
A4blkLsh-5AkT-bFIG-L0E1-CEg1IfM8DETx	9976722	GAMARDO	BRISEIDA JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
mqurbZ3p-nGdz-Jkwa-frvm-e9PiFRQYfahY	9976997	BARRIOS RODRIGUEZ	JESUS ALBERTO	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006736458	GE JUAN FREITES	8030N	ASEADOR
bdE27Zdl-L8j1-QKtC-3yS7-w5oY2VZrcmnt	9981526	GUTIERREZ RODRIGUEZ	YUSMELY DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
aZ0d2uvr-J1OR-sCRf-4X8V-OTEaLBVMD9zT	10460766	RAMOS CORDOVA	MAIGUALIDA JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
JTNGmQYf-RZdR-NX25-UJ1r-w9OwEs9Dt37b	10461077	PAZO PEINADO	LUISA MAGDALENA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	005508090	U.I. JUAN P. PEREZ A.	8030C	ASEADOR CONTRATADO
JTNGmQYf-RZdR-NX25-UJ1r-w9OwEs9Dt37b	10461077	PAZO PEINADO	LUISA MAGDALENA	COORD. RELACIONES LABORALES	OBRERO	PORTERA	Sucre	005508090	U.I. JUAN P. PEREZ A.	8030N	ASEADOR
VgJ82Gta-JJcX-OKTx-perL-TGWAJD3IcaZH	10461967	TOVAR BENITEZ	OLY MARLINA	COORD. RELACIONES LABORALES	OBRERO	SUPERVISORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8490N 	SUPERVISOR DE MANT       
aP66xEoH-zgIS-j8np-7aK7-rUFOxteeDlmj	10462833	RAMIREZ FERNANDEZ	JOSÉ GREGORIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006566005	ESC MADRE ALBERTA GIMENEZ	8030C	ASEADOR CONTRATADO
aP66xEoH-zgIS-j8np-7aK7-rUFOxteeDlmj	10462833	RAMIREZ FERNANDEZ	JOSÉ GREGORIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006566005	ESC MADRE ALBERTA GIMENEZ	8985N	VIGILANTE
BU4rSDkT-OeYT-p47h-Rgx6-iLKvW3xABGc1	10462885	VARGAS CH.	MELANIA J.	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
PBThUSKH-QVyI-TG4r-xr8v-ShFJFYFBNQGU	10463687	MUÑOZ GOMEZ	RUBEN JOSE	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	001200484	DIV. ACADEMICA	8030N	ASEADOR
Cu4jK5Hn-yaDV-HBbf-YzuJ-IwBqsTqQrI84	10464201	ALCALA G	AQUILES R.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
9cyAHHx0-hbp2-LGe9-IV65-7xE6PYUY6PV7	10947212	RODRIGUEZ	MARVELLYS JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
HduzuGY6-FSTU-eIB3-l8JM-ome24O5hB6nk	10949700	FUENTES COVA	MARIELA DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
aGLIfvaQ-MSbB-PUIS-zzrU-lQcsmTqCKYRs	10950055	LUNAR	PEDRO ANTONIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE MANTENIMIENTO	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	8001N 	SUPERV. DE SERV. INTERNOS
hIVrPT6t-LkV3-BpoV-WS19-qpv4wx82XcoG	10952549	URBANEJA	RICHARD JOSÉ	COORD. RELACIONES LABORALES	OBRERO	ASEADOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
095xcPCj-nYyD-1hi2-1rC4-QM8oamKZYA6j	10953056	ALCALA GONZALEZ	JOSE LUIS	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SERVICIO	Sucre	007912247	CB VII GDO REP ARGENTINA	8001N 	SUPERV. DE SERV. INTERNOS
sP6r9EVT-tgZE-Sm5L-8Ox0-3k17uSRfKBPw	10953235	CORTEZ VILLALBA	ELIZABETH	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
ScbhNYKJ-DhZB-I4jK-jchD-jyyj3AGs2wmO	10953546	GUEVARA BRITO 	HORTENCIA MARGARITA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
RVHSqiPC-wbHM-LsmS-e67B-XkfIXhIIbmjm	10954238	GIL NAVARRO	LUIS JOSE	COORD. RELACIONES LABORALES	DOCENTE	MENSAJERO	Ribero	006787076	U.E. CREACION SANTA ANA	4120WI	DOC. (NG)/AULA
hRvN7bsA-dRer-SYmV-3vhz-nlSpIHzvzY3Y	11158791	MARIÑA	JORGE LUIS	COORD. RELACIONES LABORALES	OBRERO		Sucre	006732086	GE LUIS A MORALES R	8985C	VIGILANTE CONTRATADO
0a6tbnw9-siwR-tLUB-WCax-SB5Caj0tRdG7	11375329	RODRIGUEZ R 	JUAN R	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004103850	JI FCO ARISTEGUIETA B	8985C	VIGILANTE CONTRATADO
DVgPvzfW-3bmN-OVB9-yRXQ-8ADOuOaT85FI	11376134	RODRIGUEZ	GEYSER AUGUSTO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Montes	006564705	ESC ISAIAS RUIZ DE C	8030C	ASEADOR CONTRATADO
DVgPvzfW-3bmN-OVB9-yRXQ-8ADOuOaT85FI	11376134	RODRIGUEZ	GEYSER AUGUSTO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Montes	006564705	ESC ISAIAS RUIZ DE C	8985N	VIGILANTE
u0JogpKg-38qz-er8C-lytX-15R1huvXBeet	11376362	ARIAS RINCONES	WUAIQUIRIA KATIUZKA	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
UN40pVjm-cTs2-q8LE-39Dh-ZhIHFDqBBSNg	11378657	RODRIGUEZ PALMAR	MARCO ANTONIO	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006522232	CENTRO PREESCOLAR CUMANA	8030N 	ASEADOR                  
KxTT834R-FQuZ-j4Dn-l7kq-7F4FwhjYgyst	11380365	ARTEAGA R.	SERGIO J.	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006738975	GE RENDON	8030N	ASEADOR
KxTT834R-FQuZ-j4Dn-l7kq-7F4FwhjYgyst	11380365	ARTEAGA R.	SERGIO J.	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006738975	GE RENDON	8985N	VIGILANTE
CC8rFsti-rjLK-JJmY-BmWn-Hlp1nNWzBMYg	11381261	ARIAS RINCONES	YUMAIRA COROMOTO	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
iOCbTp6p-alKs-tS4J-SZwz-ejbP0k0LrxqD	11381640	CORDERO BARRETO 	CARLOS ALBERTO	COORD. RELACIONES LABORALES	OBRERO	MANTENIMIENTO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8370N 	ENCUADERNADOR            
3vX8i8vd-iJOJ-rjg3-31Uj-tSsemxb24y9w	11382014	BASTARDO	MAGALYS COROMOTO	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	004110201	JI RURAL ESCOLAR 201	8030C	ASEADOR CONTRATADO
2x6HMSL5-I9Oy-M8EL-OabY-LEYMjps4IhNY	11382097	FIGUEROA HERNANDEZ	MIGUEL EDUA	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
vExtev6P-U8M4-Ybqq-960R-Scj9MlAgrpil	11827298	TOVAR GAMBOA	RAMON JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
vExtev6P-U8M4-Ybqq-960R-Scj9MlAgrpil	11827298	TOVAR GAMBOA	RAMON JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
LQPShjsO-befd-LcmS-Ez0h-IMchxLakTFf5	11828488	GONZALEZ	HENRY ANTONIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006399959	EBA ANTONIO LEMUS  PEREZ	8030N 	ASEADOR                  
LQPShjsO-befd-LcmS-Ez0h-IMchxLakTFf5	11828488	GONZALEZ	HENRY ANTONIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006399968	EBA ALI PRIMERA	8985N	VIGILANTE
w4sPpym6-X5Zd-GNBW-0WMk-EESrxMd8xQZR	11828792	DE LA ROSA D	JUAN BAUTISTA	COORD. RELACIONES LABORALES	OBRERO	COORDINADOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
8hnPNn5o-I1LS-Ucxn-kMqT-nIxx2D1G9nvo	11829607	ALEMAN BENITEZ	RAMON ALBERTO	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
EYBstL78-mJ4w-4bfv-xxiO-tBjcVdzp5RsD	11830430	COLON MALAVE	JESUS RAFAEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	8030C	ASEADOR CONTRATADO
eDlAqjIC-f2xV-VNqR-4dnn-Tg6cdfd1pp4N	11831161	MATA 	LUIS SAMIR          	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8490N 	SUPERVISOR DE MANT       
StofbvUn-vloq-40b3-o3Ih-sRbjqapKUPTq	11831399	ASTUDILLO	ANGEL CELESTINO	COORD. RELACIONES LABORALES	OBRERO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
VPWmfA1k-RtOy-HiIX-bPju-FJtHT1gC07im	11831817	RONDON	RICHARD JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007912085	CB VICENTE S Y URBANEJA	8030N 	ASEADOR                  
VPWmfA1k-RtOy-HiIX-bPju-FJtHT1gC07im	11831817	RONDON	RICHARD JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007912085	CB VICENTE S Y URBANEJA	8985N	VIGILANTE
p55OBuyI-0g4M-iipn-Yso9-OVwVPhOQnfoR	11832381	HERNANDEZ RODRIGUEZ	JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	007933330	EBA. LA LLANADA	8030C	ASEADOR CONTRATADO
94y0Abwb-UyHm-S3TM-capw-QJiEjdkMGUo7	12267822	LEZAMA	MARITZA JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N	ASEADOR
94y0Abwb-UyHm-S3TM-capw-QJiEjdkMGUo7	12267822	LEZAMA	MARITZA JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
xUhqJJxj-Qc4p-b3s3-PMsC-48eRNcYkoG6I	12268255	SALAZAR RODRIGUEZ	MARY CECILIA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	007912085	CB VICENTE S Y URBANEJA	8030N 	ASEADOR                  
LByktDvs-vS5C-ALGa-jxEr-Ep1sa9PybhKr	12268611	ARREDONDO DE CARRILLO	LUISA GREGORINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
9GVPMPkB-swOJ-q1jG-2cRk-jgBlqWcYEQea	12269135	BARDAN MILLAN	EDUARDO EMILIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004107213	PE MORAL Y LUCES	8030N 	ASEADOR                  
GDKSvOo5-vfUs-2BM2-Zoka-Bfl50ZIaQknb	12269191	ARRIOJA	LUIS J.	COORD. RELACIONES LABORALES	OBRERO	JEFE DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8001N 	SUPERV. DE SERV. INTERNOS
t0t5qB9o-tUch-3BA6-H1c4-XLPCI3kKsUi1	12269929	RAMIREZ MEDINA	RUBEN JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
c6d1xiX1-A19x-QFis-gRqJ-soZBndQpvZmL	12270263	SALGADO R.	CESAR A.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8690N 	PORTERO                  
gpO8XtAD-jWcx-sGvK-Bj2r-BgFaLiPTbBop	12272785	RIVAS ARENAS	JOSE JESUS	COORD. RELACIONES LABORALES	OBRERO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
ZJACyB4E-SPp3-iAQA-ElpW-Lw3nfRXVk3qI	12275654	PEÑALVER	ORLANDO JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006625200	EN PEDRO ARNAL	8985C	VIGILANTE CONTRATADO
ZJACyB4E-SPp3-iAQA-ElpW-Lw3nfRXVk3qI	12275654	PEÑALVER	ORLANDO JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006625200	EN PEDRO ARNAL	8985N	VIGILANTE
8S6N2mrQ-DjrJ-1Fns-dgpg-gucnse0yEXLO	12645227	FIGUERA LEZAMA	JORGE LUIS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006731542	GE ANX NOR PEDRO ARNAL	8030N 	ASEADOR                  
kLrh2tSP-4Sdt-Pu17-jKUN-xm2VCOr7Sbbv	12657449	GARCIA	CARMEN CECILIA	COORD. RELACIONES LABORALES	OBRERO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
ZCRNMydE-XgeI-Ewid-sw56-89ppoYnyH25n	12658287	NAVAS SERRANO	CLAUDIA ELENA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
ZCRNMydE-XgeI-Ewid-sw56-89ppoYnyH25n	12658287	NAVAS SERRANO	CLAUDIA ELENA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N	ASEADOR
37f6Q8Q3-ojaE-U8nG-fRgm-LrOiAt5uYVb4	12659193	PATIÑO GONZALEZ	MARIA YSABEL	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
TZlUik7y-isTn-sZJ7-k4qa-2AFK2eXm8eKm	12660657	PEÑA ACOSTA	MARCO LEANDRO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004107714	PE PARCELAMIENTO MIRANDA	8030N 	ASEADOR                  
wg8tdKTN-uui6-dOt2-Chfm-Xfxl982jtjuS	12662011	ESPINOZA RONDON	WUILLIAN RAFAEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
wg8tdKTN-uui6-dOt2-Chfm-Xfxl982jtjuS	12662011	ESPINOZA RONDON	WUILLIAN RAFAEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N	ASEADOR
WP0nPIqO-fhbW-f8ZM-LBtQ-s6aig1LlgiDA	12662811	SUAREZ RODRIGUEZ	RONALD JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	005786900	CD MODESTO SILVA	8030N 	ASEADOR                  
bwrophra-NBYV-zhpM-CLHH-Q7tsD301hvV6	12663259	YGUARO PATIÑO	MARILYS DEL CARMEN	COORD. RELACIONES LABORALES	OBRERO	SECRETARIA	Sucre	006736458	GE JUAN FREITES	8030C	ASEADOR CONTRATADO
YjuIh9tp-vvME-gYuO-2HSF-uWdo8457FPdE	12664427	PRADA DE OLIVIER	DIVANOSKA CARMELITA	COORD. RELACIONES LABORALES	ADMINISTRATIVO	ASESORA LEGAL	Sucre	001200481	DIV. DE ASESORIA LEGAL	30000C	PROFESIONAL UNIVERSITARIO
lT5tY9gH-o3qP-igNp-sfav-zsWrFaheRoTW	12665590	SEGURA MERCIE	JHONNY JOSE	COORD. RELACIONES LABORALES	OBRERO		Sucre	006970201	NER NUC ESC RURAL N 201	8030N	ASEADOR
dkKMevAX-9DIr-HPyC-BuG1-N6QApQJX8zpx	12666484	RODRIGUEZ SERRA	ANA CAROLINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
gY3MkVqp-iyHm-RlNC-TYQi-oFeAT2HCnBd9	13042421	MATA DELGADO	EDITH SOMAIRA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	004100192	P E AEROPUERTO	8030N 	ASEADOR                  
x997KkfM-bsKG-PL8f-MMnp-VemyIeVHyXWb	13044719	SALAZAR	RONALD ARGENIS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
Hnwbn2Xe-2VS8-yZ4x-9Q6p-LBHRQwypYfai	13051023	SANCHEZ	ROMY JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
Hnwbn2Xe-2VS8-yZ4x-9Q6p-LBHRQwypYfai	13051023	SANCHEZ	ROMY JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
vGtkW3nO-UYdC-g6TP-1X4N-DvNaTbfxJx8q	13052462	ZURITA	ALFREDO MANUEL	COORD. RELACIONES LABORALES	OBRERO	ASEADOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
BzQ3ziZi-gevj-kWjZ-JsQs-pNz27Mbti2bk	13053177	CALVO	JOSE LUIS	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004106006	J I LA LLANADA	8030C	ASEADOR CONTRATADO
BzQ3ziZi-gevj-kWjZ-JsQs-pNz27Mbti2bk	13053177	CALVO	JOSE LUIS	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004106006	J I LA LLANADA	8985N	VIGILANTE
4D7LYb50-WNzD-JTB8-fm17-E8Zj3I06FrUx	13053315	MARCANO MARIÑO	MARISOL DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
gMn4Aemr-ducq-SZ96-jspV-YN5TFlYpzHy8	13358975	QUINTERO CORTESIA	JOSE GREGORIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	001200489	DIV DE PERSONAL	8985N	VIGILANTE
gMn4Aemr-ducq-SZ96-jspV-YN5TFlYpzHy8	13358975	QUINTERO CORTESIA	JOSE GREGORIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	005786900	CD MODESTO SILVA	8030N 	ASEADOR                  
s4jfIIGU-7OIm-7sXx-w6G6-pey0ahNQE7z6	13359565	GAMBOA	JUAN CARLOS	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
CQDM1eRz-J7He-1pvM-Jyrz-oJWGBZrb7DY3	13359601	GARCIA	RICHARD ALEXANDER	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
3oZr1eHL-BRQk-PQ8U-ldsa-WGYkh9R03S16	13360602	SIFONTES MARQUEZ	YURITZA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006731542	GE ANX NOR PEDRO ARNAL	8030N 	ASEADOR                  
kdb8lyix-GXYI-YYYZ-UWAm-q0k5ZctSSXJh	13498611	MARTINEZ DE FERNÁNDEZ	YOANA DEL ROSARIO	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006490380	IEEB EZEQUIEL ZAMORA	8030C	ASEADOR CONTRATADO
oAM3e1Ya-Out6-zDTl-efDE-ebFVoKxP0PaR	13597502	ROSALES LIMPIO	JULIAN JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
oAM3e1Ya-Out6-zDTl-efDE-ebFVoKxP0PaR	13597502	ROSALES LIMPIO	JULIAN JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985C	VIGILANTE CONTRATADO
HP7UszGo-5OzG-bdrx-DWqE-OEiGcD5f42dY	13772975	ZERPA C.	LUIS E.	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
LDSiWblP-mm7d-MHmx-F81N-TYN025cxzHte	13835407	MILLAN M	CRISTIAN S	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
f1x26Qe8-4Vao-1rYq-zNp0-2uFYJnaqfkea	13941710	VILLAFRANCA MARIN	DAVID JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
vxll7D1V-6gjQ-6qxb-xiXY-YIWIKTsbkrYZ	13942016	MARQUEZ HENRIQUEZ	MARYURY CAROLINA	COORD. RELACIONES LABORALES	OBRERO	MENSAJERA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
lY96iTGf-NhXh-uu8L-KbbP-GdQPZkprLAkZ	13942641	CASTILLO	IVAN JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006970201	NER NUC ESC RURAL N 201	8030C	ASEADOR CONTRATADO
lY96iTGf-NhXh-uu8L-KbbP-GdQPZkprLAkZ	13942641	CASTILLO	IVAN JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006970201	NER NUC ESC RURAL N 201	8030N	ASEADOR
V3fGoML5-p8xM-CrHc-S8QC-Iwpi8qYDFueQ	13942764	GAMARDO	DANIELITZA	COORD. RELACIONES LABORALES	OBRERO	PORTERA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
txtverWv-BqvC-28Rj-ZegY-ABqJfVDkymNM	13942792	URBANEJA ROSALES	ALDA JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
txtverWv-BqvC-28Rj-ZegY-ABqJfVDkymNM	13942792	URBANEJA ROSALES	ALDA JOSEFINA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	999999990	COMISIÓN DE SERVICIOS	8030N	ASEADOR
N7M2On0l-Hdw9-5ITi-tRko-UGQnDazhvzew	14008862	MORENO AMAYA	CARMEN LUISA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
E1boYLA0-Y1Sj-GQwP-IzXK-6dsOHcnAt8HL	14105708	MARTINEZ LEIBA	TEODORO DE JESUS	COORD. RELACIONES LABORALES	DOCENTE	SUPERVISOR GENERAL	Valdez	006565985	ESC MACURO	4120WI	DOC. (NG)/AULA
1ruVvoNv-y34i-3z2B-eRg8-57mCZg8CPgLl	14124597	SALAZAR PATIÑO	DANIEL JOSE	COORD. RELACIONES LABORALES	OBRERO		Sucre	007911370	LICEO ANT J DE SUCRE	8985N 	VIGILANTE                
GY6meMgS-LAYZ-klKs-KxNr-zwKwrsQ6WtPT	14126055	SOJO AVILE	ABRAHAM ERNESTO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007931527	EB BRASIL III	8985C	VIGILANTE CONTRATADO
WXDeZCKo-q3Jq-qu8e-Lj51-2xh2EZuU3lAA	14126056	SOJO AVILE	ABRAHAM ERNESTO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007931527	EB BRASIL III	8985C	VIGILANTE CONTRATADO
WXDeZCKo-q3Jq-qu8e-Lj51-2xh2EZuU3lAA	14126056	SOJO AVILE	ABRAHAM ERNESTO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007931527	EB BRASIL III	8985N	VIGILANTE
uRTX0p72-jzdX-pJWE-Otgk-3wotaPyp6ym3	14126167	MENDOZA R.	LUIS V.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004100429	JI ANDRES E BLANCO	8985N 	VIGILANTE                
XszAGVEl-CEUT-MRbs-qvNk-wzV0aXNU1PrN	14283053	ANDRADES MARCANO	HECTOR LUIS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007310044	CPAPEP C DE QUEZADA	8030N 	ASEADOR                  
33JRy0PP-EPYJ-E4rb-kajc-wGK7KgoyzFCG	14284663	RODRIGUEZ AVILA	JUAN ERNESTO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006738090	GE NUEVA TOLEDO	8030C	ASEADOR CONTRATADO
33JRy0PP-EPYJ-E4rb-kajc-wGK7KgoyzFCG	14284663	RODRIGUEZ AVILA	JUAN ERNESTO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006738090	GE NUEVA TOLEDO	8985N	VIGILANTE
fN5S6ok4-e9TD-nNGL-A4Fs-Jkt01QWOLx0q	14285359	YURYS MARY	ROMERO GONZALEZ	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	001200489	DIV DE PERSONAL	8985N	VIGILANTE
fN5S6ok4-e9TD-nNGL-A4Fs-Jkt01QWOLx0q	14285359	YURYS MARY	ROMERO GONZALEZ	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	005786900	CD MODESTO SILVA	8030N 	ASEADOR                  
yXoKG99a-DKqg-PwKu-UExu-xO57oKFpw5zY	14419435	GONZALEZ	DAVID JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	005602000	CD EMILIO TEBAR CARRASCO	8985N 	VIGILANTE                
5dtUXMhX-T6vv-oBFL-O4UB-g6TUo2vxajnJ	14419654	GONZALEZ	MARTHA ROSA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	005786900	CD MODESTO SILVA	8030N 	ASEADOR                  
fo7PiYHO-ScD0-m7Qw-mai9-FN6u09XFlq9h	14439229	RODRIGUEZ B	ALBA M	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	999999990	COMISIÓN DE SERVICIOS	8030N	ASEADOR
xsCxi1mt-ddfN-Kpwh-Yy88-TDPyxGFdVTsZ	14498336	HENRIQUEZ BASTARDO	ARELYS	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
pVvo7j6s-M4kT-UqKJ-5hx6-GYI1c4Kurmom	14498967	ACUÑA	FRANCISCO JAVIER	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	002071734	DESP JEF ZONA EDO SUCRE	8030C	ASEADOR CONTRATADO
4mYWJtgr-veEz-GqRE-U54i-AppsjZPiI4Uw	14596045	DUQUE MORENO	ANGEL LUIS	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
4mYWJtgr-veEz-GqRE-U54i-AppsjZPiI4Uw	14596045	DUQUE MORENO	ANGEL LUIS	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
clWOmmjy-aQJj-3Nau-EWDC-JW2ubqaYOfD0	14596502	ESPIN CARRERA	ANDRYS DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985C	VIGILANTE CONTRATADO
clWOmmjy-aQJj-3Nau-EWDC-JW2ubqaYOfD0	14596502	ESPIN CARRERA	ANDRYS DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
sbULQbpg-1lAz-uua4-Wlp4-Z6V99eQYfVwp	14596650	ARREDONDO PAREJO	RAFAEL ANTONIO	COORD. RELACIONES LABORALES	OBRERO		Sucre	005602000	CD EMILIO TEBAR CARRASCO	8985N	VIGILANTE
YdWitMOE-K8uR-dZA3-v5rL-lDcGFBbd527x	14596960	FIGUEROA DE LA R	ADOLFO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004102407	JI CUMANAGOTOS	8030C	ASEADOR CONTRATADO
4hjjmGgk-hFVW-RTqg-HTeD-ymYinEUUeRid	14597089	ZURITA	GLENDYS DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	004102407	JI CUMANAGOTOS	8030C	ASEADOR CONTRATADO
s7XMooHI-rZF7-d8bs-RRCD-aHSA08zrmHqv	14619174	NOGUERA	JOSE ALEJANDRO   	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8590N 	MENSAJERO                
pUYc4CRC-HWiy-7Q9u-tr83-bUBYm6MDbLfH	14661035	GUZMAN RAMIREZ	EMELYS MILAGROS	COORD. RELACIONES LABORALES	OBRERO	RECEPTOR DE DOCUMENTOS	Sucre	006738087	GE NUEVA ESPARTA	8030N 	ASEADOR                  
RGC4uH9G-RDSl-Yy8L-Z0a0-Uu41EEZfWlC0	14661362	VALLEJO ROJAS	CRUZ MIGUEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006738090	GE NUEVA TOLEDO	8030N 	ASEADOR                  
FuNX1np5-V3Mp-B1rl-jKbp-WW1rwgUixgxb	14661658	MILLAN 	FADEL KARIM	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Ribero	006970104	NER NUC ESC RURAL N 104	8985N	VIGILANTE
FuNX1np5-V3Mp-B1rl-jKbp-WW1rwgUixgxb	14661658	MILLAN 	FADEL KARIM	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Ribero	006970104	NER NUC ESC RURAL N 104	8030N 	ASEADOR                  
LdcCzgtC-WKOP-nhZ6-Ki1u-XJplJ2yg5IAr	14661744	ALEMAN JIMENEZ 	JULIO JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8510N 	SUPERV. DE SERV. ESP.    
1WV7cnWh-imhx-IG4s-4AJO-0bpoLQ4hYaT1	14671067	MUDARRA MARIN	LUIS JESUS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
jcXV7zjT-kSax-pz1R-7I2E-xu9wRMFtg9Yg	14671526	RAVELO BRITO	HENRY ALEXANDER	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	004100755	JI BACH A SANABRIA	8985C	VIGILANTE CONTRATADO
TNAplMTv-YpKc-KxXn-ea4z-HjtNcyZYqkVI	14816975	FUENTES	JESUS SALVADOR	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006739639	GE SUCRE	8985N 	VIGILANTE                
0LkhNBwq-xPxa-HZLc-4t99-YWQh0m20WIAI	14885902	DURAN GONZALEZ	JOSE GREGORIO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006530080	CPE GRN MARISCAL AYACUCHO	8030N 	ASEADOR                  
kqTbjmN4-bO4R-G8Ns-bEAe-U0m7YVcL7VwW	14886671	MUNDARAIN	MARIANGELES	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006564880	ESC JOSE A RAMOS SUCRE	8030C	ASEADOR CONTRATADO
2k0u92bt-YMgJ-daGn-LRGf-farWQert78Be	15110163	ARCIA A	OSWALDO E.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	004100580	JI ANX N PEDRO ARNAL	8985C	VIGILANTE CONTRATADO
HPzSg7TL-8EBj-ursr-fxTH-z3zu9zd6VUTM	15111171	MORENO CERMEÑO	RAFAEL ALEXANDER	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006412147	EE CDI	8985N 	VIGILANTE                
HPzSg7TL-8EBj-ursr-fxTH-z3zu9zd6VUTM	15111171	MORENO CERMEÑO	RAFAEL ALEXANDER	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006736458	GE JUAN FREITES	8985N	VIGILANTE
IuKOXdPh-saoT-KP3z-9gbF-SJgj6OqoyA1N	15268574	SANCHEZ PEÑALVER	YULIMAR COROMOTO	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
CODlZZNX-qw8n-FRWu-zpm2-TRpmYaRvlHgE	15288021	VICTOR JOSE	ZAMBRANO PEREDA	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	004106406	P E LUISA CACERES DE A	8985N 	VIGILANTE                
Tr4NWlGz-ZivN-sU7P-jm6s-ySOZHByHcAfd	15288825	SALAZAR YANEZ	JOSE IVAN	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
4CWEAMVj-4vX8-1nNg-lBYf-2FMND3DfHvJh	15346263	SUAREZ SUAREZ	PABLO RAFAEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
KlCmVKxy-lQCd-oAl5-rVm6-khDzW22rGYyA	15361848	ZORRILLA ALCANTARA	JESUS AQUILES	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006564880	ESC JOSE A RAMOS SUCRE	8030C	ASEADOR CONTRATADO
Q27voMhu-O4gC-MiH8-ygVq-bsRNt5VgwIQ6	15361890	VASQUEZ GARCÍA	MAHILY BRICILA	COORD. RELACIONES LABORALES	OBRERO		Montes	006736205	GE JOSE LUIS RAMOS	8030N	ASEADOR
PoonOiyf-5bXH-wIiV-H5on-cDSiSoXLyXbr	15575084	MATA MATA	MARYURIS DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	RECEPTOR DE DOCUMENTOS	Sucre	006564880	ESC JOSE A RAMOS SUCRE	8985C	VIGILANTE CONTRATADO
wA3UshM2-DiND-X5mn-pkGQ-FZsvEFDS1WXG	15629492	JKEIM SALEM	FANNY	COORD. RELACIONES LABORALES	DOCENTE	SECRETARIA	Sucre	006732086	GE LUIS A MORALES R	4120WI	DOC. (NG)/AULA
b8Kw6q9E-Dy4S-VIzk-a3iS-631V8ELdp4Bp	15740597	MOREY PEREZ	JAVIER JOSE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006970201	NER NUC ESC RURAL N 201	8030C	ASEADOR CONTRATADO
mYjEfZ8D-J2vv-bwL6-QJBf-tt0pk7xOJLWz	15742464	GUEVARA DIAZ	JESUS GREGORIO	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8590N 	MENSAJERO                
y3GvSE8W-mUnl-r3DY-WzAM-gKVUK0wgj2DS	15933063	AGUANA SALAZAR	JOHAN MANUEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	005508090	U.I. JUAN P. PEREZ A.	8030C	ASEADOR CONTRATADO
y3GvSE8W-mUnl-r3DY-WzAM-gKVUK0wgj2DS	15933063	AGUANA SALAZAR	JOHAN MANUEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	005508090	U.I. JUAN P. PEREZ A.	8030N	ASEADOR
9yIbdtD6-u4lU-ES5x-DLho-Np9ramyALDu4	15934387	AMUNDARAYN PAREJO	JOSE FRANCISCO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	001200489	DIV DE PERSONAL	8985N	VIGILANTE
9yIbdtD6-u4lU-ES5x-DLho-Np9ramyALDu4	15934387	AMUNDARAYN PAREJO	JOSE FRANCISCO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006738084	GE NUEVA ANDALUCIA	8985C	VIGILANTE CONTRATADO
R3XMjQRb-pdma-MAgs-9jK5-7szSJnWbf3uH	15936371	MORA RAPOSO	ROGER LUIS	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
Cg3UDhf6-R48x-WkG3-cQwL-eurZAiQdSOS9	16313206	ROSALES ROSALES	LUISANNYS	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
2cjruR0G-4xjd-g5vj-hdHt-Q1ij9rZrLK7L	16313524	RODRIGUEZ CENTENO	JAVIER JOSE	COORD. RELACIONES LABORALES	OBRERO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
0bHCRb5b-NSkr-S6vt-5hAd-rGhBiffezKid	16313970	GOMEZ LEZAMA	YELLY UWENCIA	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
l7ChGtQw-ZmhG-4xDb-cqTe-5DaOiONOZwr8	16314077	VALLEJO	HIBRAHIN EDUARDO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006394350	CEA FCO ARISTEGUIETA B	8985N 	VIGILANTE                
ay4xJjPz-v17E-9tDC-eYbR-ufq6dnJrRtQO	16314581	GUTIERREZ MORENO	CRISTINO RAFAEL	COORD. RELACIONES LABORALES	OBRERO	TECNICO EN REFRIGERACION	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
ay4xJjPz-v17E-9tDC-eYbR-ufq6dnJrRtQO	16314581	GUTIERREZ MORENO	CRISTINO RAFAEL	COORD. RELACIONES LABORALES	OBRERO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N	ASEADOR
g5KfdVE9-47Ta-nyAK-hGKe-zHc7NlnhRCqr	16315798	SERRANO ZURITA	OSCAR LUIS	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Montes	006734498	GE ELVIRA DE GARCIA R	8985N 	VIGILANTE                
qquyIOxH-GnZx-g0B0-hqH9-uJrRyFruSPSb	16485467	BELLO	ROMEL JOSÉ	COORD. RELACIONES LABORALES	OBRERO	MANTENIMIENTO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
3iHaRArd-98bk-f9id-oFZ1-Ryj2ooAwCPHL	16701171	CARVAJAL VEGAS	JOSE GREGORIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	001200480	DESPACHO DEL DIRECTOR ZONA SUC	8985N 	VIGILANTE                
ByrQ9JBX-Qkvm-kI7h-05yd-tXlzv80iLhJs	16701676	CARIACO GONZALEZ	LUISA DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	005652032	ETC VICENTE DE SUCRE Y URBANEJA	8030C	ASEADOR CONTRATADO
ByrQ9JBX-Qkvm-kI7h-05yd-tXlzv80iLhJs	16701676	CARIACO GONZALEZ	LUISA DEL VALLE	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	005652032	ETC VICENTE DE SUCRE Y URBANEJA	8030N	ASEADOR
XDvgrvjr-JQKT-DAHA-O4OE-8YBfZLw70VCc	16702344	RODRIGUEZ	JESUS A.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
XDvgrvjr-JQKT-DAHA-O4OE-8YBfZLw70VCc	16702344	RODRIGUEZ	JESUS A.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
tXPuAOqI-Xigy-AYoH-opKz-oeaUeVGpBlAk	16702743	DIAZ BRITO	EDUARDO JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006530230	CPC CAIGUIRE ABAJO	8985N	VIGILANTE
ZUeJzLva-wpov-b9La-jEVA-gWQVjiU8BaTf	16703442	SALAS MARQUEZ	FRANK ENRIQUE	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
bmbyJK1Z-4Jyg-BphJ-dXxl-P2JF0gRJ9sm7	16703576	OSORIO MALAVE	JOSE FELIX	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006399961	EBA TRES PICOS	8985C	VIGILANTE CONTRATADO
kBbOzjy8-9FVv-qf6b-QBy9-zIU9CC8Dl4r9	16703639	ROMERO ANDRADE	CRISTIAN ALEJANDRO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004082500	CDP BEBEDERO	8985N	VIGILANTE
rLRhiZE3-razA-744I-Vu0w-2Az3kDX3qisI	16817289	DIAZ GARCIA	PATRICIA DEL CARMEN	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006530097	CPE AÑO INTERNAC NI/O	8030C	ASEADOR CONTRATADO
oNMGN3z7-AOXE-DbTU-unYo-ppwkoW02hrX7	16826026	VITAL	VARGELYS COROMOTO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
oNMGN3z7-AOXE-DbTU-unYo-ppwkoW02hrX7	16826026	VITAL	VARGELYS COROMOTO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N	VIGILANTE
Su2oQJ7p-daBH-ZsCL-yPbt-qxTMGxOtTP6Z	16995821	PARRA MARTINEZ	LUIS JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
wdZG0orz-OXVu-MCak-l34Z-7CpsvYwseAwG	16995926	ARCIA MONTAÑO	MARCO AANTONIO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
jt1cqG9b-POP2-ItQi-My4b-gKPfUCkNpab3	17212055	AQNDRADES ANDRADES	JOSE GREGORIO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007931709	EB CANTARRANA	8030C	ASEADOR CONTRATADO
q5mbWrV0-Chtu-XE1z-1PUw-koBALI5XXCzA	17445372	BRUZUAL M.	JUAN C.	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
jjYppZoH-Eheh-qt6c-MMnF-3nwOrG3hJ3is	17445769	GONZALEZ ACOSTA	JULIO CESAR	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
oOgH8dLD-kPrK-unZ1-jmM4-LxPObhqvkZqG	17446988	SANTAMARIA ZERPA	JOSE ANTONIO	COORD. RELACIONES LABORALES	OBRERO		Sucre	006505580	IEE SUCRE	8030C	ASEADOR CONTRATADO
xxKVoOp8-QghZ-oEVN-E1la-7iLIBtvr0C2Z	17447580	JHONNY ALFREDO	PIRONA GUTIERREZ	COORD. RELACIONES LABORALES	OBRERO		Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
23OYQPGy-aaMX-pV8U-mvxf-MRAqNba6qKOD	17538209	FIGUEROA RODRIGUEZ	WANDER ANTONIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006399961	EBA TRES PICOS	8985N 	VIGILANTE                
EUC9jgZl-HVoO-YCi4-e9B8-k3V2JOSSLtVi	17540714	RAMIREZ RODRIGUEZ	FRANCYS COROMOTO	COORD. RELACIONES LABORALES	OBRERO	ASEADORA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
XAiimCBx-bTWF-iu7b-h2wd-1WbwnBfxRdKo	17909885	RODRIGUEZ MARQUEZ	DEIVY ANTONIO	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	004085000	CDP EL BRASIL	8985N	VIGILANTE
gkdKHseu-GlhX-rnwj-r0ho-dx91vTrET56q	17911658	RODRIGUEZ	JEAN CARLOS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Bermúdez	004087500	CDP GUAYACAN DE LAS F	8030C	ASEADOR CONTRATADO
gkdKHseu-GlhX-rnwj-r0ho-dx91vTrET56q	17911658	RODRIGUEZ	JEAN CARLOS	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Bermúdez	004087500	CDP GUAYACAN DE LAS F	8030N	ASEADOR
68ddthxI-IQlJ-4xXY-nDxD-0sumALDViSxW	18212074	RIVERO PATIÑO	ANGEL DEL JESUS	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	007932113	EB CORAZON DE JESUS	8030N 	ASEADOR                  
hWPYB8N8-jZGL-jZAy-rsQL-y8yasRJFQSB1	18416588	GOMEZ CORTESIA	JOSE FRANCISCO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006970201	NER NUC ESC RURAL N 201	8985N 	VIGILANTE                
W16nOPqr-niib-DFkP-dAqh-q86kGNs564MM	18581516	SANCHEZ GOMEZ	JUAN DAVID	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	005506000	IC BAS JOSE A RAMOS S	8030N 	ASEADOR                  
W16nOPqr-niib-DFkP-dAqh-q86kGNs564MM	18581516	SANCHEZ GOMEZ	JUAN DAVID	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	005506000	IC BAS JOSE A RAMOS S	8985N	VIGILANTE
Gs9TOMeM-nha0-6auR-NpMB-IqePOZSHb0Tu	18775583	SUAREZ RODRIGUEZ	JESUS JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006738090	GE NUEVA TOLEDO	8030N 	ASEADOR                  
yOGeQoBT-eR2f-388d-zklS-K8HxEsOwmXNF	18777843	LANZA RODRIGUEZ	JOSE ANGEL	COORD. RELACIONES LABORALES	OBRERO	SEGURIDAD	Sucre	006970201	NER NUC ESC RURAL N 201	8985N	VIGILANTE
yOGeQoBT-eR2f-388d-zklS-K8HxEsOwmXNF	18777843	LANZA RODRIGUEZ	JOSE ANGEL	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	006970201	NER NUC ESC RURAL N 201	8030C	ASEADOR CONTRATADO
jom8akwV-Aqc5-IJJf-lPv5-V77jc6Zcpk6m	18917672	DIAZ MARIN	RUTHCELIS JOSE	COORD. RELACIONES LABORALES	ADMINISTRATIVO	RECEPTOR DE DOCUMENTOS	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
eHBK6G2x-itAp-xpB4-lEAK-i8ydXCb1HnC4	19762403	BENITEZ LEON	PEDRO RAFAEL	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
ZRgcmWFi-hxxV-ftbF-F3o8-aeg3jNkfneP6	20052004	AVILEZ LEON	CARLOS EDUARDO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007915780	CB LUIS GRATEROL B	8030C	ASEADOR CONTRATADO
ZRgcmWFi-hxxV-ftbF-F3o8-aeg3jNkfneP6	20052004	AVILEZ LEON	CARLOS EDUARDO	COORD. RELACIONES LABORALES	OBRERO	VIGILANTE	Sucre	007915780	CB LUIS GRATEROL B	8030N	ASEADOR
Wujrhq9a-WdMG-lGRZ-3N1q-uo2ipYMGhuvI	20574611	GONZALEZ MARTINEZ	DANIEL JOSE	COORD. RELACIONES LABORALES	OBRERO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
dcysWIxc-mI0g-2Zv9-vI4J-mR7k6UtvoUUb	21093559	MARCANO VELASQUEZ	JHONNY JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	007911370	LICEO ANT J DE SUCRE	8030C	ASEADOR CONTRATADO
dcysWIxc-mI0g-2Zv9-vI4J-mR7k6UtvoUUb	21093559	MARCANO VELASQUEZ	JHONNY JOSE	COORD. RELACIONES LABORALES	OBRERO	SUPERVISOR DE SEGURIDAD	Sucre	007911370	LICEO ANT J DE SUCRE	8985N	VIGILANTE
JWxIWeQe-3uHW-QNfO-Px5y-a7EzAynGRIsT	21095932	BRUZUAL VELASQUEZ	FRANKLIN ALEXANDER	COORD. RELACIONES LABORALES	OBRERO	MENSAJERO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N	ASEADOR
bwrophra-NBYV-zhpM-CLHH-Q7tsD301hvV6	12663259	YGUARO PATIÑO	MARILYS DEL CARMEN	COORD. SALA POLITICA	ADMINISTRATIVO	SECRETARIA	Sucre	006736458	GE JUAN FREITES	100000	BACHILLER I
ZWhXOmj1-a38V-3X7z-veou-igH0kB5EKGvX	15290101	MUÑOZ RENGEL	ELISANDY DEL CARMEN	COORD. SALA POLITICA	ADMINISTRATIVO	SECRETARIA	Sucre	006625200	EN PEDRO ARNAL	10000C	BACHILLER CONTRATADO
g8PsJWnO-RiPk-69rz-2oM3-nigJr4DcAHnq	8639395	VELASQUEZ MATA	DEL VALLE	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTORA	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	111AWI	DOC. CONTRATADO A
bIjD3D41-1m3r-91Ei-JeIK-lNC4UELvDcPV	8653833	VASQUEZ RIVERA	VICENTA MARIBEL	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTORA	Sucre	007933003	E.B. MARISCAL DE AYACUCHO	1143DH	DOC. III /AULA
5vagPFgv-DyXR-esGo-9Pqi-7hrztzE2biWG	8654335	VELASQUEZ RAMOS	YOSELY DEL VALLE	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTORA	Sucre	004082500	CDP BEBEDERO	1113DI	DOC. III /AULA
4FkJL7Qu-gp66-bVfP-BJJM-c8oeGKHn6gNT	8887635	PINTO BERMUDEZ	MERCEDES COROMOTO	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTORA	Sucre	007912153	CB BR RAFAEL C MACHADO	4140WH	DOC. (NG)/AULA
MREgnIvN-m5BS-IIch-3hHc-OHgXrSqstk40	9276617	VILLARROEL CASTILLO	JUAN CARLOS	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTOR	Sucre	006625200	EN PEDRO ARNAL	1144DH	DOC. IV  /AULA
NgWcNXrm-xmbA-1qbD-hKWJ-uVclcHphzhAA	9973493	BARRERA	RODOLFO J	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	SEGUIMIENTO Y CONTROL DE PERSONAL	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	1126DI	DOC. VI  /AULA
VYSo8JHt-pji8-qtiC-jkpy-UQh3Dpa8cckQ	11832070	TENORIO BOADA	LAURYS CAROLINA	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTORA	Sucre	006738084	GE NUEVA ANDALUCIA	1122DI	DOC. II  /AULA
VYSo8JHt-pji8-qtiC-jkpy-UQh3Dpa8cckQ	11832070	TENORIO BOADA	LAURYS CAROLINA	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTORA	Sucre	006738084	GE NUEVA ANDALUCIA	1124DI	DOC. IV  /AULA
sF7oEFi3-r3nm-zYhR-i0AW-pivSwqowPKbi	13499080	DIAZ BARRIOS	EDULYMAR DEL VALLE	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTORA	Sucre	006970068	NER NUC ESC RURAL N 068	1114DI	DOC. IV  /AULA
XKkLeiV1-PxxK-0W2y-p4kf-ovg9rIB8ueTq	13751962	RODRIGUEZ SOLORZANO	JHONNY GREGORIO	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTOR	Sucre	005786900	CD MODESTO SILVA	1131DH	DOC. I   /AULA
i5DcpJMp-v0Sd-z5jz-LI28-AfWH0VVF5Y3R	14124361	ASTUDILLO BLANCO	RUBEN JOSE	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	COORDINADOR	Sucre	006731542	GE ANX NOR PEDRO ARNAL	1123DI	DOC. III /AULA
i5DcpJMp-v0Sd-z5jz-LI28-AfWH0VVF5Y3R	14124361	ASTUDILLO BLANCO	RUBEN JOSE	COORD. SEGUIMIENTO Y CONTROL	DOCENTE		Sucre	007950581	U E ANTONIO JOSE DE SUCRE	1123DI	DOC. III /AULA
y0fP1NgC-iv6C-XSjw-eI8I-8VMqcruW3TNX	14421641	REYES RODRIGUEZ	MILLER JOSÉ	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTOR	Bermúdez	006970355	NER NUC ESC RURAL N 355	2127DI	TSU EN EDUCACION
Sp1GvlFC-BIpB-kxAN-08wR-YF3VuEAH6Ixj	16315055	MILLAN FLORES	ROBEL JOSE	COORD. SEGUIMIENTO Y CONTROL	ADMINISTRATIVO	SECRETARIO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
FwRna2DJ-kF3d-DZ7c-sipS-J7ntE7fs9Hu8	17763235	FUENTES ESPINOZA	MARIA DE L OURDES	COORD. SEGUIMIENTO Y CONTROL	DOCENTE	INSPECTORA	Sucre	004107440	JI NUEVA ANDALUCIA	2127DI	TSU EN EDUCACION
uWKTEWYf-HdKR-bYBE-6lLS-hmhMGA3J6e7G	4218472	GAMBOA DE PAREJO 	NELLY MARIA	COORD. SEGURO SOCIAL	ADMINISTRATIVO	ASISTENTE	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	300000	PROFESIONAL UNIV. I
pMSrlUqH-Gn45-L1IQ-21Fz-EMxErgA8Xxhv	5077469	LUNAR ANTON	ELAINE JOSEFINA	COORD. SEGURO SOCIAL	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	001200489	DIV DE PERSONAL	100000	BACHILLER I
Av3Mvmgr-5f5s-tXBq-fvXY-QXpbPjJJ7O4V	5082236	LARA BASTARDO	MARIA JOSEFINA	COORD. SEGURO SOCIAL	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
WKFRjzVR-qWfH-xRJt-hef8-lq1d7i8FRydA	6271423	SILVA SAN VICENTE	ROSA ELENA	COORD. SEGURO SOCIAL	ADMINISTRATIVO	COORDINADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
cisJTTVc-jCdS-4xVI-dYYE-dn7gVBq9U7d4	15361703	GAMBOA LIZARDO	JOHNATTAN JOSE	COORD. SEGURO SOCIAL	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	10000C	BACHILLER CONTRATADO
Sjelqxdr-hJzQ-U3qU-HQlO-vPOOAvcMCMSq	19979205	MARQUEZ VELASQUEZ	VANESSA GABRIELA	COORD. SEGURO SOCIAL	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
GWGtMpk3-gA0f-IjQi-wED3-UstkaibTNPac	11409787	SIRIT OTTOLINA	JENNIFER	COORD. SENIFA	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	999999990	COMISIÓN DE SERVICIOS	30000C	PROFESIONAL UNIVERSITARIO
cSiahT6i-2hGb-tpRt-PwOV-coMxD7AFCTxV	4185479	VELASQUEZ MILLAN	CRISANTO ANTONIO	COORD. SERVICIOS BASICOS	OBRERO	CHOFER	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	8260N 	CHOFER DE TRANSP.        
Pg2j75f8-Oi7a-Ehiq-x9UH-bpA9W5C66Mh8	4445701	DEVITA RAMOS	MARIO RAMON	COORD. SERVICIOS BASICOS	OBRERO	MANTENIMIENTO	Sucre	006302208	OFIC DE SUPERV ZONA NO 12	8490N 	SUPERVISOR DE MANT       
1WD2GWKP-Eo9U-Dez2-hpkW-GkXPRG27IJA7	4685756	LIZARDO S	FRANCISCO M	COORD. SERVICIOS BASICOS	OBRERO	CHOFER	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
E7bKOrXr-Pzat-bITo-CVgf-JzWrsOXwCw1G	4688463	CORONADO S.	PABLO A.	COORD. SERVICIOS BASICOS	OBRERO	MANTENIMIENTO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
bfDU6luP-AcKQ-HU5P-WjeY-P2ghxwvL1tre	5699721	MARQUEZ	ANDRES ELOY	COORD. SERVICIOS BASICOS	OBRERO	COORDINADOR	Sucre	006738975	GE RENDON	8030C	ASEADOR CONTRATADO
bfDU6luP-AcKQ-HU5P-WjeY-P2ghxwvL1tre	5699721	MARQUEZ	ANDRES ELOY	COORD. SERVICIOS BASICOS	OBRERO	COORD. SERVICIOS BÁSICOS	Sucre	006738975	GE RENDON	8030N	ASEADOR
mm8lNSiR-EIC4-uUTk-ITGB-IP4P0eHfxvkE	6315920	SANCHEZ	HENRYS JOSE	COORD. SERVICIOS BASICOS	OBRERO	ELECTRICISTA	Sucre	007931709	EB CANTARRANA	8030C	ASEADOR CONTRATADO
mm8lNSiR-EIC4-uUTk-ITGB-IP4P0eHfxvkE	6315920	SANCHEZ	HENRYS JOSE	COORD. SERVICIOS BASICOS	OBRERO	ELECTRICISTA	Sucre	007931709	EB CANTARRANA	8030N	ASEADOR
GrC8QZUz-RSFY-nQAF-MK7R-gaPkUjgtkXmT	8423085	FIGUEROA R. 	FERNANDO JOSE	COORD. SERVICIOS BASICOS	OBRERO	HERRERO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
uGzxOaRK-v89d-R7jE-2wJH-4wSZtfLqd8ML	8443252	ORTIZ HERNANDEZ	LUIS ANTONIO	COORD. SERVICIOS BASICOS	OBRERO	MECANICO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
tPKfxFsM-eStl-TIYn-OhNV-15fXfASthdhY	8642888	RINCONES SOLANO	JESUS MIGUEL	COORD. SERVICIOS BASICOS	OBRERO	MECANICO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030C	ASEADOR CONTRATADO
GAiH6MvE-HZie-PHrs-QHUi-OtJdJRXd5WgH	9272691	ROBLES MUJICA	ALFREDO JOSE	COORD. SERVICIOS BASICOS	OBRERO	ELECTRICISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
dTs6VAEE-QtRR-KZWp-YHNL-FaYAlnAfg4Ph	10953268	CORDERO GUTIERREZ	ANDRES JOSE	COORD. SERVICIOS BASICOS	OBRERO	CHOFER	Sucre	007931527	EB BRASIL III	8985C	VIGILANTE CONTRATADO
9kGZ4kqm-JK9f-C9Gw-385V-tKqW4I7KGak5	10954682	RONDON CHACON	JUAN CARLOS	COORD. SERVICIOS BASICOS	OBRERO	SUPERVISOR DE MANTENIMIENTO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8490N 	SUPERVISOR DE MANT       
Aiex6kpr-ay4z-Fsop-OPjF-lmadY1yuWSl6	11825144	MALAVE	ALEXANDER JOSE	COORD. SERVICIOS BASICOS	OBRERO	ELECTRICISTA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
sbULQbpg-1lAz-uua4-Wlp4-Z6V99eQYfVwp	14596650	ARREDONDO PAREJO	RAFAEL ANTONIO	COORD. SERVICIOS BASICOS	OBRERO	CHOFER	Sucre	005602000	CD EMILIO TEBAR CARRASCO	8985C	VIGILANTE CONTRATADO
mdMYdIOI-OA2O-cHtX-kjDo-G2A5A72RcKaS	15111108	SALAZAR	JOSE FRANCISCO	COORD. SERVICIOS BASICOS	OBRERO	MANTENIMIENTO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8985C	VIGILANTE CONTRATADO
MFvuDvO4-ryuI-kBwl-EwEV-H9UcgjIZX4je	15112892	ASTUDILLO SANCHEZ	OMARYS DEL VALLE	COORD. SERVICIOS BASICOS	ADMINISTRATIVO	SECRETARIA	Sucre	001200491	DIV DE COOR DTTOS ESCOLARES	10000C	BACHILLER CONTRATADO
MFvuDvO4-ryuI-kBwl-EwEV-H9UcgjIZX4je	15112892	ASTUDILLO SANCHEZ	OMARYS DEL VALLE	COORD. SERVICIOS BASICOS	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
RTcEYAHd-KptU-kt7y-Rfy6-cUZiAkDvzjeD	18210684	LAREZ PATIÑO	JULIO JOSE	COORD. SERVICIOS BASICOS	OBRERO	CHOFER	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
UuS0MPl5-UqGP-mFD0-cn7f-kVoogUjP4JXV	12269509	FIGUEROA VALLENILLA	YSABEL CRISITNA	COORD. SISTEMA DE GESTION ESCOLAR	OBRERO	ANALISTA SGE	Sucre	006564880	ESC JOSE A RAMOS SUCRE	8030C	ASEADOR CONTRATADO
zWXkEKvt-EyPG-dldQ-yCSb-PEtlZpwqd9IO	13731222	SALAZAR ROSAL	MILAGROS ALBELIS	COORD. SISTEMA DE GESTION ESCOLAR	ADMINISTRATIVO	ANALISTA	Sucre	001200489	DIV DE PERSONAL	20000C	TECNICO SUPERIOR UNIVERSI
2MDU6lDf-R2VY-SNQT-tmtc-1NFhmfkGGioE	15740850	PEREZ SERRA	LUIS ELOY	COORD. SISTEMA DE GESTION ESCOLAR	ADMINISTRATIVO	COORDINADOR ZONAL	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	10000C	BACHILLER CONTRATADO
1R8abSCi-n8AC-Nj6r-cYIy-Q5I5wM3B0IWL	9272597		AYALA DE N. ALBA ROSA    	COORD. TITULOS	DOCENTE		Sucre	006970201	NER NUC ESC RURAL N 201	1124DI	DOC. IV  /AULA
Pi98RbAE-xGBY-4UER-vc7A-jUm6v8IQH8V5	10801570	MONSALVO POMBO	IVONNE	COORD. TITULOS	DOCENTE	SUPERVISORA	Montes	006564705	ESC ISAIAS RUIZ DE C	1124DI	DOC. IV  /AULA
PvzqoGmO-zJSF-sfXo-fzs7-2yAr2Syh8R4X	4681405	ARREAZA CAMPOS	YAZIRA MARGARITA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006739639	GE SUCRE	1123DI	DOC. III /AULA
8mHHLA5Q-170g-1TmC-n8dw-6HFBQEEaYM22	5880206	ALBORNOZ B	MISBELYS DEL V	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Valdez	007700003	CEBIT GUIRIA	1132DH	DOC. II  /AULA
BRDL7HId-jQG3-EnIa-XeJc-3eaUjVTmjxYv	6548669	DUARTE PARIMA	VALIA HAYDEE.	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006562832	ESC CRUZ DE LA UNION	1122DI	DOC. II  /AULA
Ahc64cDp-rud4-kmav-B77K-RmfjhLjSAvmC	6932861	NORIEGA M	ZORAIDA M	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006590295	EB NUESTRA S. DEL CARMEN	1122DI	DOC. II  /AULA
Yvcw2cuU-FMaM-jHOM-hIYZ-t84mT5ILY41M	8380576	SANCHEZ MARCANO	ENCARNACION MARIA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Mejía	006970521	NER 521	2127WI	TSU EN EDUCACION
t6TxwybY-w51r-JT3b-lss9-VsyQ7D2xwBiE	8635690	SALAZAR	MAYULI DEL CARMEN	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006732086	GE LUIS A MORALES R	1131DH	DOC. I   /AULA
sqJE6OdG-5KKz-Byse-gqmH-OfO60FP4pTPe	8649615	GARCIA	ANA FELICIA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	004107465	JI NUEVA TOLEDO	1111DI	DOC. I   /AULA
VIkqjsWi-RnJb-n6tM-sDfT-uqEAibzZR1nb	9271678	GUZMAN PRESILLA	LEONARDA DEL VALLE	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	SUPERVISORA CBIT	Valdez	007700003	CEBIT GUIRIA	1133DH	DOC. III /AULA
tGIBIaKq-fIgJ-9oRS-pfPQ-2h5il8B4cDOG	9277939	LOPEZ DURAN	MARIBEL DE JESUS	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Valdez	007700003	CEBIT GUIRIA	1132DH	DOC. II  /AULA
VtW1yS91-shqE-gEYh-g0fW-uFYp7cNbA8cl	9976633	CARMEN JOSEFINA	ESPARRAGOZA DE SALAZAR	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006738090	GE NUEVA TOLEDO	1123DI	DOC. III /AULA
RyuM7U0t-hgBE-nYqn-N1T4-t3SrawB9EdKI	10462879	QUIJADA	ELCIDA DEL CARMEN	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	SUPERVISORA CBIT	Sucre	005508090	U.I. JUAN P. PEREZ A.	1143DH	DOC. III /AULA
RyuM7U0t-hgBE-nYqn-N1T4-t3SrawB9EdKI	10462879	QUIJADA	ELCIDA DEL CARMEN	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	SUPERVISORA CBIT	Sucre	005508090	U.I. JUAN P. PEREZ A.	1144DH	DOC. IV  /AULA
en7wVYvd-QVDh-Nzcw-343x-obX1ahMoAjzt	10800021	RAMIREZ	HONCLIS JOSEFINA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Mejía	006737215	GE LUISA B DE RAMIREZ	1122DI	DOC. II  /AULA
GPDFQlQz-o7fS-CXya-E5UP-FFv5GVkC3spp	10876794	VELASQUEZ M	LEONIDES	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Andrés Eloy Blanco	006567750	ESC RAFAEL RAMOS DIAZ	1121DI	DOC. I   /AULA
qIvp3gl3-Q2ch-mTab-L3VU-DiRznsiPBsW5	10881486	HERNANDEZ	JOSE L.	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Ribero	007700004	CEBIT CARIACO	4130WH	DOC. (NG)/AULA
cI3kaWWM-oUrF-b5P4-M51Q-z9Yqk4W2NjNP	11382177	MAICA RIVAS	ADRIANA JUSTINA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	005508090	U.I. JUAN P. PEREZ A.	114AWH	DOC. CONTRATADO A
x2Tq2LZd-2Hu2-466K-hdwD-oVbTRSAduvP3	11382650	GOMEZ	ELILAYDA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	007700006	CEBIT CUMANA	1133DH	DOC. III /AULA
hF0BSu7u-AASh-6KDz-w7ho-sJWMyxflNSwk	11382657	MAESTRE V.	ALEXANDER	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	007700006	CEBIT CUMANA	2137DH	TSU EN EDUCACION
Ambpmdf5-aDk0-TTAn-wGGE-uPepsZ7Rk1xr	11441588	MORENO	SHIRLEY F.	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Andrés Mata	007918079	CC ANDRES MATA	1141DH	DOC. I   /AULA
TOggcFrS-8XOr-cINP-LVcu-fdXB8F9hNFAE	11828056	RODRIQUEZ SUAREZ	HAIDEE	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006732086	GE LUIS A MORALES R	4130WH	DOC. (NG)/AULA
ItLOMWDX-Zafy-1EsH-urZ6-qwyOUjoIoJeS	11829638	LOPEZ	LUIS	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	007918186	CB MARIANO DE LA COVA	1141DH	DOC. I   /AULA
TfqbEECW-Kn4S-AcHV-6gIK-Mr4HICCNgXhh	11832413	MARQUEZ BASTARDO	CARLOS DAVID	COORD. ZONAL DE INFORMATICA EDUCATIVA	ADMINISTRATIVO	COORDINADOR ADMINISTRATIVO	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	20000C	TECNICO SUPERIOR UNIVERSI
7IXHap6C-KO4w-fvWl-wKEn-VsldrHdZfrZg	12268918	MAGO	ELVIRA J	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Bolívar	007950393	CEBIT GOLINDANO	1131DH	DOC. I   /AULA
wm4c7dof-wRT4-CXRR-LgdU-n1w6Bj8ZISoB	12271196	FIGUERAS BARRIOS	ANGEL LUIS	COORD. ZONAL DE INFORMATICA EDUCATIVA	ADMINISTRATIVO	COORDINADOR TECNICO	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	20000C	TECNICO SUPERIOR UNIVERSI
Lv1pzJ8F-z6ei-SJgS-C1UG-QnhP3WOwvSMA	12275693	ACEVEDO ESPINOZA	PAOLA DE LOS ANGELES	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006970353	NER NUC ESC RURAL N 353	1122DI	DOC. II  /AULA
rYAKxzWz-Pg90-rfvw-gKpr-UcAI97OzeDDB	12276856	MELLO MUNDARAIN	LOURDY MAR	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	COORDINADORA ACADEMICA	Sucre	006732073	GE BR ALBERTO SANABRIA	1123DI	DOC. III /AULA
rYAKxzWz-Pg90-rfvw-gKpr-UcAI97OzeDDB	12276856	MELLO MUNDARAIN	LOURDY MAR	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	COORDINADORA ACADEMICA	Sucre	006732073	GE BR ALBERTO SANABRIA	1124DI	DOC. IV  /AULA
OIEUKZgN-HzXE-HVyB-pOTl-8lgfXATyuv55	12530099	SALAZAR S	MAIBET	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Arismendi	006970167	NER NUC ESC RURAL N 167	1123DI	DOC. III /AULA
y4MLSYiA-ElIn-pgD3-M7cx-zThAxSAJCcrP	12659282	CASTILLO BRAVO	KLEITZER JESUS	COORD. ZONAL DE INFORMATICA EDUCATIVA	ADMINISTRATIVO	COORDINADOR ZONAL	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	10000C	BACHILLER CONTRATADO
kim18Lj9-I6Uz-Pb4n-CHFB-NEQd5LVoDajx	12663994	CORONADO ACOSTA	ERIK JOSE	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006413024	EQUIPO TEC INTEG	4160WI	DOC. (NG)/AULA
5GD9cmjP-IWct-saku-nDEo-VDStFknxKJg4	12741365	TOLEDO MORENO	JORGE LUIS	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Andrés Eloy Blanco	006737546	GE MATIAS PARRA ALCALA	1121DI	DOC. I   /AULA
yejp2QQh-0fcx-gXLK-Cl20-j4r0NNv6kOVq	13220242	LOPEZ DE LOPEZ	CELENIA MARIA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	007911647	C B ANTONIO LEMUS PEREZ	1131DH	DOC. I   /AULA
4KZ8Bx1T-hpax-uNWV-qV7u-8ZVbcJ3xcwx0	13360534	RONDON MARQUEZ	CARLOS OSWALDO	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006731542	GE ANX NOR PEDRO ARNAL	1121DI	DOC. I   /AULA
FIpbZBI8-pvoB-K3Vd-F4Ib-SM0pJUnnzNG5	13630089	ROJAS M.	GREGORI	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	005508090	U.I. JUAN P. PEREZ A.	1133DH	DOC. III /AULA
rMXPuYaA-fzLT-Us7r-6Qbq-Kj6KDdMncH2d	13631114	GAMBOA ESPINOZA	CLAUDIA YNES	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	SUPERVISORA	Sucre	007950781	UE DR JOSE MARIA VARGAS	1124DI	DOC. IV  /AULA
i9gPN8I5-eMSi-xENg-W8PB-wNZG5htnMfUa	13836468	ORTEGA S	LUIS E	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Ribero	006970351	NER NUC ESC RURAL N 351	4120WI	DOC. (NG)/AULA
80roH94H-4jWX-1JAJ-6sUl-2NoFRfgE6Ajv	13923117	PATIÑO	JESUS R	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Bermúdez	007912058	CB PEDRO J SALAZAR S	1131DH	DOC. I   /AULA
fwmKyimL-KSDP-14gn-Nb3g-RKV6eeca161I	13924308	FLORES FARIAS	CLAUDIMER DOLORES	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	DOCENTE DEL CPSET	Ribero	007700004	CEBIT CARIACO	1132DH	DOC. II  /AULA
cuVhRnUA-RaUd-ciE7-6YFZ-70ljMDae6pvk	13942721	MALAVE	CESAR AUGUSTO	COORD. ZONAL DE INFORMATICA EDUCATIVA	OBRERO	VIGILANTE	Sucre	006739639	GE SUCRE	8985C	VIGILANTE CONTRATADO
dNUmWvxK-Smek-GIE5-Vs15-fiyc8jzifylj	14063105	MARTINEZ F.	CANMARY	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Valdez	006564530	ESC MARIA BLANDIN DE A	1121DI	DOC. I   /AULA
RmnwLnou-U2Qp-MAeI-VQCi-wOPKIJBTXAqh	14105501	MARTINEZ L	YESENIA M.	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Valdez	007700003	CEBIT GUIRIA	4130WH	DOC. (NG)/AULA
bTqnolgO-m0Zf-jJ6P-jHvY-zSbGsi8Ovk9g	14126200	CESIN E	RICHARD E	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006731542	GE ANX NOR PEDRO ARNAL	1121DI	DOC. I   /AULA
3J3Jpv7e-EA9a-cD4C-Z86y-AeusXqbvZUs6	14290553	ORTEGA S	CARNELLYS	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Bermúdez	007912058	CB PEDRO J SALAZAR S	4130WH	DOC. (NG)/AULA
HhYZulGK-GVoE-E35q-PisK-visLbWb5Cu7Y	14419964	DURAN SERRANO	DANIEL E	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Bolívar	007950393	CEBIT GOLINDANO	4130WH	DOC. (NG)/AULA
xqf2XP8n-VCZ0-XENB-TqIk-6jkVSBVVHwFi	14421868	CABELLO M	JOSMERI DEL V.	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Arismendi	007911960	LN CARLOS FCO GRISANTI	4140WH	DOC. (NG)/AULA
eem3EkcO-xc6m-TjpQ-aXCX-Ka0oertrOPgL	14422776	GARCIA R	MILAGRO DEL V	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Bermúdez	006738570	GE PETRICA DE QUILARQUE	1121DI	DOC. I   /AULA
0gkmjpOI-C2cU-gnC6-p44W-hh3Sd83EuVVR	14439973	MUJICA	FREDDY	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Ribero	006970352	NER NUC ESC RURAL N 352	1121DI	DOC. I   /AULA
VH64Bgtu-yVNe-TNxK-qYvA-95pnhUsuNUKy	14815270	SALAZAR P	MARIA FERNANDA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Montes	006567930	ESC ROSARIO S DE RAUSSEO	112AWI	DOC. CONTRATADO A
FXmwegr3-rnfL-utCY-78sT-6Xrv20OVAvwJ	14815736	SALAZAR P	CARLOS M	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Ribero	006739840	GE VALENTIN VALIENTE	4120WI	DOC. (NG)/AULA
GwiuNG7t-taZE-Dy4P-3veW-FPPyEjyAeHuW	14830307	ROJAS M	MARIELA DEL V	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Valdez	007700003	CEBIT GUIRIA	1121WH	DOC. I   /AULA
HcvrV28t-5EXM-bs3g-p7az-gqwrEPWn9vnb	14993903	RODRIGUEZ GOMEZ	YORMARI	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006590155	ESC BOLIV LA MONTA?ITA	4120WI	DOC. (NG)/AULA
vKenKRO9-2mcl-ysB6-EW9Q-3fRVvTfVJm4r	15208725	GAMBOA V	MARIA SOLEDAD	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Montes	006736205	GE JOSE LUIS RAMOS	1121DI	DOC. I   /AULA
TX5TGXCs-5APJ-xP2S-JKBF-AuxOujLWvLrX	15243062	SALAZAR MARCANO	JUAN CARLOS	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Arismendi	006567870	ESC RITA SUCRE DE RAMOS	1121DI	DOC. I   /AULA
OTdGHBxM-2Mzz-fanx-VyQH-PAJZUr8iYbkL	15243611	CARREÑO	ANGELES M.	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Benítez	006970385	NER NUC ESC RURAL N 385	4110WI	DOC. (NG)/AULA
8gOKzl28-PsQu-9OJq-TEkh-d526nw9jxUuY	15414347	RIVERA C	ISABEL G	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Bermúdez	007912058	CB PEDRO J SALAZAR S	4130WH	DOC. (NG)/AULA
A5lRymrS-vySN-pWTP-FF5i-5nN7WgNATCak	15568089	SANCHEZ C	ADRIANA C	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Montes	006970291	NER NUC ESC RURAL N 291	4120WI	DOC. (NG)/AULA
Mts10Rff-OeM3-q0ms-QW2b-sJXWGVtqVpsj	15934925	RODRIGUEZ M.	ELDRI DEL V.	COORD. ZONAL DE INFORMATICA EDUCATIVA	ADMINISTRATIVO	SECRETARIA	Sucre	001200489	DIV DE PERSONAL	10000C	BACHILLER CONTRATADO
TVAN7AXe-YmQ8-PS15-0PBL-oVoDwST9hQZD	15935969	CASTAÑEDA RIVERO	ELVIS GREGORIO	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	006731542	GE ANX NOR PEDRO ARNAL	1121DI	DOC. I   /AULA
2YvEXDdL-CaiQ-M8WY-DzKK-CYSuW8n9MFed	16255640	RIVAS T	MARIA O	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Bermúdez	006970355	NER NUC ESC RURAL N 355	4120WI	DOC. (NG)/AULA
7c8wuBey-ou5F-t8pV-3hXW-i0gNnflK11Cs	16995000	AXTHAMMER DE LA ROSA	HEIDI ALEJANDRA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	SUPERVISORA	Sucre	007950781	UE DR JOSE MARIA VARGAS	1123DI	DOC. III /AULA
7c8wuBey-ou5F-t8pV-3hXW-i0gNnflK11Cs	16995000	AXTHAMMER DE LA ROSA	HEIDI ALEJANDRA	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	SUPERVISORA CANAIMA Y COLECCION BICENTENARIO	Sucre	006738090	GE NUEVA TOLEDO	1122DI	DOC. II  /AULA
PRSELGNL-wMZJ-OBW8-OsCe-YWyfdE6GEl4M	17054742	RODRIGUEZ	CESAR	COORD. ZONAL DE INFORMATICA EDUCATIVA	ADMINISTRATIVO	TUTOR CBIT	Andrés Mata	007918079	CC ANDRES MATA	10000C	BACHILLER CONTRATADO
FDCNngQk-9aqT-nLIp-83zP-qcXuQR5cTC6u	17236635	GONZALEZ R	ALCIDES C	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Sucre	005601647	UE. BARTOLOME DE LA ROCA	4130WH	DOC. (NG)/AULA
3GFVX7kd-yFQ2-4wK9-5M46-4p8cXa5D7DhC	17713990	RICARDI V	JOHANNA C	COORD. ZONAL DE INFORMATICA EDUCATIVA	DOCENTE	TUTOR CBIT	Ribero	006970352	NER NUC ESC RURAL N 352	1123DI	DOC. III /AULA
98nSpmD0-lBEE-82d9-oPAy-2VSKpAaOZzqH	20063216	SALAZAR BRAVO	AMARLYS CRUZ	COORD. ZONAL DE INFORMATICA EDUCATIVA	ADMINISTRATIVO	TUTOR CBIT	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
SKqoBduK-uhyv-oVS3-r61V-TBR5jCWZb50U	20063943	GOITIA ROSILLO	DANIEL JOSE	COORD. ZONAL DE INFORMATICA EDUCATIVA	ADMINISTRATIVO	TUTOR CBIT	Sucre	004103777	JI FE Y ALEGRIA	10000C	BACHILLER CONTRATADO
3SDRyEx6-orsc-Gu8O-OBiB-2nimQzObJfVl	5704506	GAMARDO 	MAURO JOSÉ	COORD. ZONAL DE INSTRUCCION PREMILITAR	DOCENTE	COORDINADOR	Sucre	007911370	LICEO ANT J DE SUCRE	1145DH	DOC. V   /AULA
3SDRyEx6-orsc-Gu8O-OBiB-2nimQzObJfVl	5704506	GAMARDO 	MAURO JOSÉ	COORD. ZONAL DE INSTRUCCION PREMILITAR	DOCENTE	COORDINADOR	Sucre	007911370	LICEO ANT J DE SUCRE	1146DH	DOC. VI  /AULA
BKG25LA8-E9cC-VA2T-gylz-HzAzZ3hQuuie	14816552	RINCONES M	YOLISBERT	COORD. ZONAL DE INSTRUCCION PREMILITAR	ADMINISTRATIVO	SECRETARIA	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	10000C	BACHILLER CONTRATADO
ufhQwqB8-pyXj-HSFE-gapk-WoF6jUCfGQSN	5075203	MUNDARAY MORA	CESAR LOREZO	COORD. ZONAL DE LICEOS BOLIVARIANOS	DOCENTE	COORDINADOR ENLACE - CENAMEC	Sucre	006394350	CEA FCO ARISTEGUIETA B	1685NI	DOC. V   /COORD.R.
2alYqRi7-UKC0-D49f-jeJx-duDUIiDje6Jp	5084123	ANTON DE MALAVE	MARIA ELIZABETH	COORD. ZONAL DE LICEOS BOLIVARIANOS	ADMINISTRATIVO	SECRETARIA	Sucre	001200480	DESPACHO DEL DIRECTOR ZONA SUC	110000	BACHILLER II
Sw1ueoyG-BSR6-pb8Q-dEUf-DGw6gU0GtPDy	10947542	RODRIGUEZ D.	MARTHA E.	COORD. ZONAL DE LICEOS BOLIVARIANOS	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
EmoRMtRn-mH70-42Rf-Bzix-t5cKbwZ1hrXR	11060944	ESCOBAR SALAZAR	GREGORY CARLOS	COORD. ZONAL DE LICEOS BOLIVARIANOS	DOCENTE	DOCENTE ITINERANTE	Sucre	007912153	CB BR RAFAEL C MACHADO	114AWH	DOC. CONTRATADO A
cHzmEPer-7a7J-exdQ-OBSx-lCmm9KBl7UTa	11375341	CASTAÑEDA DE MARRERO	ORLEIDYS	COORD. ZONAL DE LICEOS BOLIVARIANOS	DOCENTE	DOCENTE ITINERANTE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	4140WH	DOC. (NG)/AULA
QSgWmLUj-PcmE-OcL3-SAdm-I4792Lji5CUB	13052457	SUBERO RODRIGUEZ	FLOR AAMANDA	COORD. ZONAL DE LICEOS BOLIVARIANOS	DOCENTE	EQUIPO DE VOCERIA	Valdez	007912250	LICEO DOMINGO BADARACCO B	4120WI	DOC. (NG)/AULA
Ctq6A5S0-X7bV-kSaM-L5vk-u3q6K4ebaNZq	16374256	MUÑOZ MEDINA	MILGRETH DEL CARMEN	COORD. ZONAL DE LICEOS BOLIVARIANOS	DOCENTE	DOCENTE ITINERANTE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	114AWH	DOC. CONTRATADO A
YHKz6YAF-ghlY-fob0-LKet-aHyl6kL7HIYS	3873089	NASARET DIAZ	OCTAVIO	COORD. ZONAL MEDIA GENERAL Y TECNICA	OBRERO	ANALISTA DE PERSONAL	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	8030N	ASEADOR
BAyB5n7h-ldHM-G6T0-0CW6-ML9st97ODLsu	5692179	LOPEZ	NERIS FELIPA	COORD. ZONAL MEDIA GENERAL Y TECNICA	DOCENTE	COORDINADORA	Sucre	006394350	CEA FCO ARISTEGUIETA B	1181ZH	DOC. I   /AULA
UCbN2nlI-yws8-uBJx-t6jL-XSuSZim4JE4o	5857113	RUIZ M	LEONARDO J	COORD. ZONAL MEDIA GENERAL Y TECNICA	DOCENTE	APOYO PEDAGOGICO DE LAS ESCUELAS TECNICAS	Sucre	007911375	LN ANT J DE SUCRE	1183ZH	DOC. III /AULA
UCbN2nlI-yws8-uBJx-t6jL-XSuSZim4JE4o	5857113	RUIZ M	LEONARDO J	COORD. ZONAL MEDIA GENERAL Y TECNICA	DOCENTE	APOYO PEDAGOGICO DE LAS ESCUELAS TECNICAS	Sucre	007914550	CB JOSE S GONZALEZ	1144DH	DOC. IV  /AULA
3MHp0fJS-d0hZ-x2P0-twYp-c6MW28xknaCG	11828062	GUTIERREZ	JUAN JOSE	COORD. ZONAL MEDIA GENERAL Y TECNICA	ADMINISTRATIVO	APOYO ADMINISTRATIVO	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	10000C	BACHILLER CONTRATADO
QNd5eoma-kyRM-xdoN-1FwG-hYcjtVNX2Wpu	11830103	VELASQUEZ CEDEÑO	ESTHER DEL CARMEN	COORD. ZONAL MEDIA GENERAL Y TECNICA	DOCENTE	APOYO PEDAGOGICO A LOS LICEOS BOLIVARIANOS	Sucre	006970353	NER NUC ESC RURAL N 353	1133DH	DOC. III /AULA
H9gQaqKm-Qj0J-XOFx-7dPS-1rBcrXqe2N55	12658962	MARQUEZ MUNDARAIN	GISETH ADAM	COORD. ZONAL MEDIA GENERAL Y TECNICA	ADMINISTRATIVO	COORD. DE PASANTIAS	Sucre	001200484	DIV. ACADEMICA	30000C	PROFESIONAL UNIVERSITARIO
OJ5Q40Zj-QpBz-R1z1-sdcC-xBLbOy5giL0w	12662926	ROMERO	BERTYS DEL VALLE	COORD. ZONAL MEDIA GENERAL Y TECNICA	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
0EfmO5KJ-Dh0r-9Qlc-N5XN-igtvZrW1mKAO	15509962	CORDERO GUAIMARE	ALINETH DEL VALLE	COORD. ZONAL MEDIA GENERAL Y TECNICA	DOCENTE	APOYO PEDAGOGICO A LOS LICEOS BOLIVARIANOS	Sucre	006566015	ESC ASCANIO J VELASQUEZ	1132DH	DOC. II  /AULA
OkYYkbzX-MCQ3-y6d8-8QqR-J9Dpses2xjoC	5707193	DIAZ GONZALEZ	CARLOS A	DIRECCION DE ZONA	DOCENTE	JEFE DE ZONA	Bermúdez	007918440	LICEO SIMON RODRIGUEZ	1143DH	DOC. III /AULA
stSZJiho-pofQ-hZD5-WVIP-E2eEwYQshY4S	6271929	ALCALA RAMIREZ	JUAN RAMON	DIRECCION DE ZONA	OBRERO	SEGURIDAD	Sucre	006731240	GE ADELAIDA NUÑEZ SUCRE	8985C	VIGILANTE CONTRATADO
stSZJiho-pofQ-hZD5-WVIP-E2eEwYQshY4S	6271929	ALCALA RAMIREZ	JUAN RAMON	DIRECCION DE ZONA	OBRERO		Sucre	006731240	GE ADELAIDA NUÑEZ SUCRE	8985N	VIGILANTE
LyUfXgKv-OS3I-nccH-IRvN-WaIohdHfL1AC	8365313	ALCALA SIFONTES	RAQUEL ALEJANDRINA	DIRECCION DE ZONA	DOCENTE	COLECTIVO DE GESTION	Sucre	007911375	LN ANT J DE SUCRE	1186NH	DOC. VI  /AULA
LyUfXgKv-OS3I-nccH-IRvN-WaIohdHfL1AC	8365313	ALCALA SIFONTES	RAQUEL ALEJANDRINA	DIRECCION DE ZONA	DOCENTE		Sucre	004100580	JI ANX N PEDRO ARNAL	1715WI	DOC. V   /SUB-DIRE
wAciqGQ6-BHl1-w6k6-wgX0-SAFVZt1T5YSC	10463344	JIMENEZ	WUIRMAN JOSE	DIRECCION DE ZONA	OBRERO	CHOFER	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985C	VIGILANTE CONTRATADO
dTs6VAEE-QtRR-KZWp-YHNL-FaYAlnAfg4Ph	10953268	CORDERO GUTIERREZ	ANDRES JOSE	DIRECCION DE ZONA	OBRERO	CHOFER	Sucre	007931527	EB BRASIL III	8985N	VIGILANTE
qehf9Ebd-BzHd-BfLv-XJYX-lyP9znrOlOZL	14597961	ALFONZO SUAREZ	NORMA VANESSA	DIRECCION DE ZONA	ADMINISTRATIVO	COLECTIVO DE GESTION DE DIRECCION ZONAL	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
4YIGJ7Qq-LKZP-gRsi-z2oQ-liBN3e3GYEOc	14670928	PAREJO PAREJO	SOL YSBEIDA	DIRECCION DE ZONA	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
xacisIos-7cPO-YCYH-6ENE-7ADYxwq5sDo4	16313020	MUJICA DE DIAZ	REGINA DEL VALLE	DIRECCION DE ZONA	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
yEccIHeH-1aot-0Qmx-t3zP-camaPrSJyuYj	17447551	DIAZ CASTAÑEDA	NAVIORLYS ELENA	DIRECCION DE ZONA	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
b0hUtTbM-Bj82-crbe-1HIx-6wKcr1QYQ00s	19892205	SALAZAR BRITO	MARYELIN KARINA	DIRECCION DE ZONA	ADMINISTRATIVO	COLECTIVO DE GESTION DE DIRECCION ZONAL	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
kedYoUtg-TGua-TgLl-LTSY-2fiVTM3EYwaq	8645385	TARACHE DE B.	MAYRA C.	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	310000	PROFESIONAL UNIV. II
CjGdu48Q-X4FH-NMXz-sinl-uW4blb5CI52b	8651202	RIVAS	LILYIS COROMOTO	DIV. ASESORIA JURIDICA	DOCENTE	ABOGADA	Sucre	006731240	GE ADELAIDA NUÑEZ SUCRE	4130WH	DOC. (NG)/AULA
qB2OiQc5-50pj-9Cad-oq2m-6YpJDYdeA5Rq	9270735	DIAZ HERNANDEZ	MARIA GABRIELA	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	JEFA (E) DE DIVISION	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	310000	PROFESIONAL UNIV. II
rdEKXKBK-8ogo-ntb3-GPSt-Uooymwd0SAud	10222626	MARCANO GONZALEZ	HAYDEE MARIA	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	30000C	PROFESIONAL UNIVERSITARIO
GW9MLEOR-2CY9-pjo5-IWPB-tS6vI7kmTYwm	10460924	HENRIQUEZ RODRIGUEZ	NATALIA DEL VALLE	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	300000	PROFESIONAL UNIV. I
GW9MLEOR-2CY9-pjo5-IWPB-tS6vI7kmTYwm	10460924	HENRIQUEZ RODRIGUEZ	NATALIA DEL VALLE	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	30000C	PROFESIONAL UNIVERSITARIO
kuDOZ8jM-yFlj-OfJz-l6dH-iA1vmtZ6RtiC	10950261	GUEVARA VALLERA	ANA LUMEL	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ENLACE IPASME	Sucre	001200481	DIV. DE ASESORIA LEGAL	30000C	PROFESIONAL UNIVERSITARIO
jWTze2NC-PI4n-RzpA-0nWq-oNAFjODTxTVA	11828810	GOMEZ C	FRANAVIS DEL V	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	SECRETARIA	Sucre	001200481	DIV. DE ASESORIA LEGAL	10000C	BACHILLER CONTRATADO
zLT7rrBj-rwGa-iqyJ-Zt29-BipSRx6HN2HN	12270785	MARQUEZ V	VICTOR J	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	SECRETARIO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
uQyxqXYT-2yJ0-IFqz-eqfJ-iOoNk6YEpZIq	13052405	HERRERA MARCANO	THARMARY DEL CARMEN	DIV. ASESORIA JURIDICA	DOCENTE	SECRETARIA	Sucre	004108510	JI RENDON	2117DI	TSU EN EDUCACION
J06AiMbE-TpPs-QgGE-Sicl-3DMLboEAs5ZA	13539960	TOVAR LANZA	CLARIBERT DEL VALLE	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	SECRETARIA	Sucre	001200490	DIV. DE INFORMATICA Y SISTEMAS	110000	BACHILLER II
J06AiMbE-TpPs-QgGE-Sicl-3DMLboEAs5ZA	13539960	TOVAR LANZA	CLARIBERT DEL VALLE	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
J06AiMbE-TpPs-QgGE-Sicl-3DMLboEAs5ZA	13539960	TOVAR LANZA	CLARIBERT DEL VALLE	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	SECRETARIA	Sucre	007950503	EB CREACION NURUCUAL	100000	BACHILLER I
QzdJTjfJ-PKyH-AkBj-EdlS-CufTBz4ifDK3	13941670	SOTILLO PENOTT	IVETTE DEL VALLE	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	30000C	PROFESIONAL UNIVERSITARIO
RMevuEDZ-IFOm-Mgq8-ZlOR-0D4M0mhDBxTp	14671450	RODRIGUEZ V	JESUS E	DIV. ASESORIA JURIDICA	DOCENTE	ABOGADO	Sucre	005601647	UE. BARTOLOME DE LA ROCA	4140WH	DOC. (NG)/AULA
inXgXm8h-NM92-jHq5-KLge-IO7zmqhB0pG1	14816611	SUAREZ O	LAURYS M	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	30000C	PROFESIONAL UNIVERSITARIO
SiquyRlV-rftq-6LKf-EYYZ-Au0fRrgRUJk3	15112387	GARCIA GUEVARA	ALEJANDRO JOSE	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ABOGADO	Sucre	007914550	CB JOSE S GONZALEZ	30000C	PROFESIONAL UNIVERSITARIO
C4YlARFs-rcOI-uDhX-VFIl-ixYjg1amNYpG	15936763	RAMOS G.	MELISSA J.	DIV. ASESORIA JURIDICA	ADMINISTRATIVO	ABOGADA	Sucre	001200481	DIV. DE ASESORIA LEGAL	30000C	PROFESIONAL UNIVERSITARIO
rpp6kUtS-8ayT-uAwt-mmr1-ZJ5mBXLQluuz	16703543	MENDOZA GARCIA	CESAR MIGUEL	DIV. ASESORIA JURIDICA	DOCENTE	ABOGADA	Sucre	006391736	CEA LAS PALOMAS	4180ZH	DOC. (NG)/AULA
mpf4sYm5-fupx-tZqM-mJGm-w4Jm1xdFqn46	2120635	CAMPOS VILLAROEL	REGULO ANTONIO	DIVISION DE CULTURA	ADMINISTRATIVO	COORD. DEL ÁREA PRE - HOSPITALARIA	Sucre	999999990	COMISIÓN DE SERVICIOS	10000C	BACHILLER CONTRATADO
sGOaN1Au-AflE-ZJoN-NdzH-COQIhs4DN9DP	8637587	ASTUDILLO PADRON	ANGEL JESUS	DIVISION DE CULTURA	DOCENTE	COORD. DE ENLACE INTITUCIONES PUBLICAS Y PRIVADAS	Sucre	007912247	CB VII GDO REP ARGENTINA	2127DI	TSU EN EDUCACION
dtRYC64J-7jEu-zdrm-3mic-oMuuke3lOF0H	9271501	VILLALBA DE REYES	NORELIS COROMOTO	DIVISION DE CULTURA	DOCENTE	COORDINADORA DE DANZA	Sucre	006739215	GE RIO CARIBE	2127DI	TSU EN EDUCACION
u0x3LDiy-ZmDC-VAZM-89Ey-huzcCQRccWjQ	10460887	SANABRIA GARCIA	MARIA ANGELICA	DIVISION DE CULTURA	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
dr3Pm06E-4x1K-Sad1-HZoZ-nxCt8pZmdxIg	10465719	ESPARRAGOZA SANABRIA	ANGEL JOSE	DIVISION DE CULTURA	ADMINISTRATIVO	COORDINADOR DE ARTES PLASTICAS	Sucre	006736458	GE JUAN FREITES	100000	BACHILLER I
wD0wxzwg-OUdq-lc3n-H1I0-Ri9gJr0EzGer	11383360	HIDROGO MARCANO	ELIEXER JOSE	DIVISION DE CULTURA	DOCENTE	COORDINADOR DE MUSICA	Sucre	006738084	GE NUEVA ANDALUCIA	1124DI	DOC. IV  /AULA
nm26XN1U-Nuor-KKOj-0y8B-D0aaUjcpvXJQ	11832788	MARVAL EVARISTO	BASILIO ANTONIO	DIVISION DE CULTURA	DOCENTE	JEFA DE DIVISION	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1124DI	DOC. IV  /AULA
Wn9VvjPR-wBrV-NSJf-cBoJ-XmoTDCW7iP0j	12270940	RAMOS MAZA	ALEXIS JOSE	DIVISION DE CULTURA	ADMINISTRATIVO	ASISTENTE ADMINISTRATIVO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
VVw2Y17k-cdiU-dKCA-S5Mu-wHLtoCAzrfEL	12546830	MALAVE MARQUEZ	YUBISAY DEL VALLE	DIVISION DE CULTURA	ADMINISTRATIVO	SECRETARIA	Sucre	001070586	DPTO PAGO DIRECTO R NOR O	10000C	BACHILLER CONTRATADO
tNTdtRs4-kvKS-f4M0-Gpof-IqHSyi2kcgBx	13539506	RODRIGUEZ CABELLO	LEIDYMAR DEL VALLE	DIVISION DE CULTURA	DOCENTE	COORD. DE INVESTIGACIÓN CULTURAL	Sucre	006738975	GE RENDON	1124DI	DOC. IV  /AULA
QQUcjEbn-qD0R-3fR8-dHZE-6L5pqkGJBhFE	13631550	DIMAS HERNANDEZ	CARMEN JULIANA	DIVISION DE CULTURA	ADMINISTRATIVO	DISEÑADOR GRÁFICO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
GgmwrrqQ-FNHJ-Jnek-sZNZ-A8QDLa9u4I7d	14009453	NUÑEZ DELGADO	ANDY EDUARDO	DIVISION DE CULTURA	DOCENTE	COORDINADOR DE TEATRO	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1133DH	DOC. III /AULA
a1ngHavE-Yy9F-EfJ5-UULV-C4EWhpQyBPcj	17761921	RONDON RONDON	ENRIQUE JOSÉ	DIVISION DE CULTURA	ADMINISTRATIVO	ASISTENTE DE LA COORD. INVESTIGACION CULTURAL	Sucre	004107455	JI NUEVA ESPARTA	10000C	BACHILLER CONTRATADO
UXMlyDId-UDry-20H8-C8oQ-edek1XadSNCv	3842598	VALLENILLA 	NERINARDA     	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	AYUDANTE DE ARCHIVO	Sucre	001200487	DIV. DE PROTECCION Y DES EST	100000	BACHILLER I
9DWXdv9d-eAyR-yUH6-vbLc-sGiKV6nlKk6d	4185205	ORDAZ RIVAS	RAMON DE LA CRUZ	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	PSICOLOGO ESCOLAR	Montes	004700170	NIBE CUMANACOA	300000	PROFESIONAL UNIV. I
nTIZqBpv-EeOi-0w6A-Cjha-Uznx00u0pUNk	4185229	GUILARTE DE M	LUISA JOSEFINA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	COORDINADOR SECOPRODE	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	310000	PROFESIONAL UNIV. II
HHmqmzN4-N9XG-i3p1-6cmR-HcKFSf2guJ57	5522213	HERNANDEZ DE SERRANO	MARISOL JOSEFINA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	TRABAJADOR SOCIAL	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
1yRso6v9-xPz9-yEpr-jWK7-K6xkDoANJetv	5697591	MADRID RODRIGUEZ	MARIA EUGENIA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO		Sucre	004700043	NIBE SUCRE	300000	PROFESIONAL UNIV. I
PooSHEem-NOUU-R8Xh-z6bl-gLvELCfWOZx1	6355959	PAREDES PAREDES	GERMAN JOSE	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	COORDINADOR	Sucre	001200487	DIV. DE PROTECCION Y DES EST	300000	PROFESIONAL UNIV. I
PooSHEem-NOUU-R8Xh-z6bl-gLvELCfWOZx1	6355959	PAREDES PAREDES	GERMAN JOSE	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	RESPONSABLE DE UNIDAD OPERATIVA	Ribero	004700171	NIBE CARIACO	300000	PROFESIONAL UNIV. I
AA79FRul-S19V-szSH-Sp4j-urJ4xMAgMmxz	6633587	YANEZ MANRRIQUE	FRANCISCA KATIUSCA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	CANTINA ESCOLAR	Sucre	007915780	CB LUIS GRATEROL B	10000C	BACHILLER CONTRATADO
TbwBU9vc-bfQQ-MHkQ-isiD-nmpL5h95wl7R	6955337	FARIAS GONZALEZ	JOSE FELIX	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO		Sucre	001200487	DIV. DE PROTECCION Y DES EST	300000	PROFESIONAL UNIV. I
rZLf5v0Q-SwBk-VTKA-hp7N-Tp74NojZCtje	8442937	BOADA CARRILLO	LETICIA DEL CARMEN	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
vVfst78R-rMki-yhFg-eqPx-CHMJxp7onKla	8525855	HERNANDEZ G. 	ELIS H.     	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	DOCENTE	JEFE DE DIVISION	Sucre	005786905	I DE C MODESTO SILVA NOCT	1183ZH	DOC. III /AULA
hH03VLu3-mQ8c-ip1e-AgrA-kMRa3drLp2W6	8637772	LEON FERMIN	YOZAIRA ELENA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	TRABAJADOR SOCIAL	Sucre	005602000	CD EMILIO TEBAR CARRASCO	30000C	PROFESIONAL UNIVERSITARIO
hH03VLu3-mQ8c-ip1e-AgrA-kMRa3drLp2W6	8637772	LEON FERMIN	YOZAIRA ELENA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO		Sucre	006202200	OFIC DE SUPERV ZONA NO 12	300000	PROFESIONAL UNIV. I
OXeErCfQ-Y8gw-TJmK-4Sdi-29wZ0dYmFtIp	8649441	SALAZAR BUTTO	ROSALBA DEL CARMEN	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO		Bermúdez	004700172	NIBE CARUPANO	30000C	PROFESIONAL UNIVERSITARIO
LWXRnGUa-VMMd-1P1v-bEn2-9uZGdTEGcIAb	9979424	GUERRA	FRANCYS LUISA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	RESPONSABLE AREA SALUD	Sucre	001200487	DIV. DE PROTECCION Y DES EST	30000C	PROFESIONAL UNIVERSITARIO
l951ntVJ-kYja-vlbT-3k8l-khfVDg4nX0Mp	9981396	MALAVE HERNANDEZ	JACQUELINE DE LOURDES	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	TRABAJADOR SOCIAL	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	300000	PROFESIONAL UNIV. I
pbylgvRQ-uhvT-3gnc-1Fy3-VCasZEFStnIj	10568408	GUZMAN BLANCO	INGRID ESMERALDA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	DOCENTE	RESPONSABLE AREA SALUD	Ribero	006787076	U.E. CREACION SANTA ANA	4120WI	DOC. (NG)/AULA
GM3x18NK-pNbT-CLuP-fikv-IyNALhc2yWlR	10834101	ROMERO RUIZ	JESUS ADOLFO	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
Y37MwxVQ-6D0e-FDXD-5bPA-xfG2zYI9eguN	11863629	FUENMAYOR YSEA.	MAYSORE	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	DOCENTE	EQUIPO TECNICO ZONAL	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	2117DI	TSU EN EDUCACION
iehRyl33-3D6S-0cer-QKGq-Qy0bJ6DjlEHx	12661945	JIMENEZ RAMOS 	YANIRA DEL 	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
dMYqSPx2-XoZm-7bVI-bGWb-RNoxApyKgZ0n	13051156	GAMARDO LIZARDO	JUMIGLIZ DE LOURDES	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	TRABAJADOR SOCIAL	Sucre	004108520	JI RPBLCA ARGENTINA	30000C	PROFESIONAL UNIVERSITARIO
x8yO4Sha-Lcep-zHAA-wZOq-tOd2ENckyuTj	14660975	BRITO 	YUSDEILY NADIUSKA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
KxTT834R-FQuZ-j4Dn-l7kq-7F4FwhjYgyst	11380365	ARTEAGA R.	SERGIO J.	DPTO. DE SEGURIDAD	OBRERO	SEGURIDAD INTERNA	Sucre	006738975	GE RENDON	8985C	VIGILANTE CONTRATADO
7Diy2CGy-ablW-p3yi-zEkM-MQAFL0TsRX8m	15934896	CASTAÑEDA MENESES	RAINIERO JESÚS	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	SECRETARIA	Sucre	999999990	COMISIÓN DE SERVICIOS	10000C	BACHILLER CONTRATADO
hztpufWn-WhD0-JUZy-UFcz-38CvpQfsZs07	16702447	ANTON LOPEZ	ROAXY DEL CAR	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	OBRERO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8670N 	RECEPTOR-INFORMADOR      
xRmzj2wf-lM0d-4E1m-bOgv-HcofldWKDhdy	16995240	TINOCO CARRIZALES	JOSBETT CAROLINA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	SECRETARIA	Sucre	001200482	DIV. DE CORD ENTES PUBLI Y PRIV CUT	10000C	BACHILLER CONTRATADO
xRmzj2wf-lM0d-4E1m-bOgv-HcofldWKDhdy	16995240	TINOCO CARRIZALES	JOSBETT CAROLINA	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
9HU8ZGDV-KTWg-SN2y-GHOp-0LMMuiebb1oB	18210834	PEREZ	RAYMAR	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
yeSmftNf-uQID-bQ3T-hWgT-UwIzsQ9j70xA	24690751	ROBAYO MARQUEZ	BERTHA DE JESÚS	DIV.  PROTECCION Y DESARROLLO ESTUDIANTIL	ADMINISTRATIVO	RESPONSABLE AREA SALUD	Sucre	001200487	DIV. DE PROTECCION Y DES EST	300000	PROFESIONAL UNIV. I
crlyt8Km-gTSr-hbfx-RhZ1-st01PNqZWM9I	3872067	SALAYA FIGUEROA	ANA DEL VALLE	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	10000C	BACHILLER CONTRATADO
i6ufzD3u-EhOY-5xSS-37ys-sngXEkcPn3ed	5696825	ACUÑA	YURAIMA ELENA	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	200000	TSU I
VCJTmbNK-Nj2x-NTVj-AMQx-PuXZP60cPgLT	6434256	TORRES MARTINEZ	BELSY EDITH	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
RH2KUDPu-kMWf-rPrV-ggjI-FYQcstjH4uEl	8443864		MEDINA B CALIXTA B       	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO		Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	100000	BACHILLER I
2hJYtK1P-1HA8-fSCf-V4Cn-rmntjZHPjuAu	8444155	RONDON MAROT	NUNILA DEL VALLE	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	001200487	DIV. DE PROTECCION Y DES EST	200000	TSU I
7A32UqVW-RLJB-I9Kl-soZE-tuzG9sP5EBYs	8644408	ORTIZ GOMEZ	BENILDE JOSEFINA	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	001200486	DIV. DE PLANIFICACION Y PRESUPUESTO	100000	BACHILLER I
PliFtQIU-USfL-Uy01-syhg-vFAiz2bFJhq5	8647041	TREMONT RIVAS	AMIRA CONCEPCION	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	006738087	GE NUEVA ESPARTA	100000	BACHILLER I
9V0VLXdb-eDf4-FlHo-Gd8x-EGtFcpUSqen1	9276246	MAZA BETANCOURT	ALEIDYS JOSEFINA	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADOR DE PLANILLAS	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	100000	BACHILLER I
GGfVCHDp-PCtY-IjR8-JgXg-p1amXXtUj6dp	10461593	RONDON	CARMEN ROSA	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
IF1K7Iyh-pmxw-mHEz-cYr4-tdlUOtO96zVL	10467365	VELIZ CASTILLO	JUANA IBELISE	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
LrXYFAhG-nNgr-6zu0-MuDy-aRCA86zDvP4F	11381599	AGUILERA SALAZAR	CARMEN YNES	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
2qRUmWZz-SHKj-yRSD-Fj50-frWLVjBhanpQ	12289864	VILLARROEL LEZAMA	ROSBELYS DEL VALLE	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	DOCENTE	JEFA DE DIVISION	Sucre	007931709	EB CANTARRANA	1134DH	DOC. IV  /AULA
Acw58rZF-N8wD-36ce-GOmK-YPmFdaHUjAtS	12663427	CASTAÑEDA J	ROBERT J	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADOR DE AUTENTICADO	Sucre	001200484	DIV. ACADEMICA	10000C	BACHILLER CONTRATADO
bLmVzsLn-BGVA-KjHB-IPV3-iCOv6HP3t8qM	13630912	RIVAS SUAREZ	MARIA DEL VALLE	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	ASISTENTE DE EVALUACION	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
xFxEz21y-YyT3-i2uD-uqvi-2aMMSBp0X4N9	13631646	RODRIGUEZ RIVERO	YORFRED JOSE	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADOR	Sucre	001200488	DIV RTRO,CONTROL Y EVAL DE EST	10000C	BACHILLER CONTRATADO
ylHc8Iub-ltkn-qKn2-btxL-fQacDWCDAir5	13772137	GONZALEZ MARCANO	CARMEN TEODORA	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
gEQ5yz1Q-zsQO-NpM6-T6zQ-7SmdQYIZ7LoM	14124535	BOADA HERNANDEZ	YUSMARY	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	VERIFICADORA	Sucre	006302200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
J9hC5pth-UAKd-Ckev-SFDY-VijjttdXRBXz	14597472	BELISARIO BOADA	LUISA EUGENIA	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO		Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
d9olkJWq-NzT3-XDbM-RNBQ-hkLbmrMWqcwe	14815459	ACUÑA BERMUDEZ	LUISA MINERVA	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO		Sucre	004108510	JI RENDON	20000C	TECNICO SUPERIOR UNIVERSI
zxMJvW2f-s3dn-WXUK-abDX-Ru2K0Ird5DKQ	15935119	ZAVALA LANZA	GISELA DEL CARMEN	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	ADMINISTRATIVO	EMISOR DE DOCUMENTOS	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
1DdiaI69-oipr-nE5F-Mm64-OUypgpx9FfIY	17911572	BERMUDEZ MALAVE	HECTOR JOSE	DIV.  REGISTRO, CONTROL Y EVALUACION DE ESTUDIOS	OBRERO	AYUDANTE DE ARCHIVO	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
ymMN2szC-dD6D-vZ4f-KPDa-TDIBgqkuF2gw	4188155	BARDAN 	LUIS A.           	DPTO. DE SEGURIDAD	OBRERO	VIGILANTE FIN DE SEMANA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
KccvQ6OG-WtRm-4xRm-1HnC-VgquzPx0KRkc	5702440	MORA GUZMAN	LUIS ARQUIMEDES	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR NOCTURNO MUNICIPIO SUCRE	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
29zy08L3-VtC2-g4qm-iWGe-FAVQ3JZwwwO4	5871980	MAGO GIUSTI	GERONIMO MIGUEL	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR	Sucre	002071738	DIV ASUNTO LABORALES	8030N	ASEADOR
A7LKVykq-VuIs-AJbT-nTwb-An6EiVtgxWre	6957779	FERMIN	DOUGLA MANUEL	DPTO. DE SEGURIDAD	OBRERO	VIGILANTE	Bermúdez	005788600	CB TAVERA ACOSTA	8030N	ASEADOR
v2yf1RAH-TQpD-3las-kHZb-28zM44a8W7g1	8654658	RONDON S.	JORGE R.	DPTO. DE SEGURIDAD	OBRERO	VIGILANTE FIN DE SEMANA	Sucre	999999990	COMISIÓN DE SERVICIOS	8985C	VIGILANTE CONTRATADO
UL6x1T6j-b8eU-GBGX-R73J-rLZuADOIK0wx	9427409	SUNIAGA MARIN	ROMEL NICOLAS	DPTO. DE SEGURIDAD	OBRERO	SEGURIDAD INTERNA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8985N 	VIGILANTE                
IxbrkuEz-ETza-7sX4-aPTk-aLAPHfjtT3wE	10469528	BOADA	FRANKLIN	DPTO. DE SEGURIDAD	ADMINISTRATIVO	SUPERVISOR	Sucre	999999990	COMISIÓN DE SERVICIOS	10000C	BACHILLER CONTRATADO
wCBJ9TCK-NRII-kazZ-O8oQ-AKCGEdjstUFp	11833184	ALEN MEDINA	FRANKLIN RAFAEL	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR	Sucre	006731240	GE ADELAIDA NUÑEZ SUCRE	8030C	ASEADOR CONTRATADO
L8TGkeCu-Ir07-9KIb-8T3g-mknUrbfcWG09	12662251	ACUÑA CAMPOS	GERALDO ANTONIO	DPTO. DE SEGURIDAD	OBRERO	SEGURIDAD INTERNA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	8030N 	ASEADOR                  
6bzEdiFP-Vqv9-gcxI-N3hI-kky4NL5LtmPW	13221930	PEREZ	NELSON	DPTO. DE SEGURIDAD	OBRERO	SEGURIDAD INTERNA	Sucre	999999990	COMISIÓN DE SERVICIOS	8985C	VIGILANTE CONTRATADO
MhECwLWx-MJce-5tU3-abDs-pPgoU6njypDJ	14009234	CORTESIA G.	EDWAR J.	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR INTERNO	Sucre	006422260	AI ANEXA PEDRO ARNAL	8030C	ASEADOR CONTRATADO
ynG8IzWi-BleX-Re6K-olsr-bt7bjgMaAEsZ	14126917	DURAN G	LUGO J.	DPTO. DE SEGURIDAD	OBRERO	SEGURIDAD INTERNA	Sucre	004103850	JI FCO ARISTEGUIETA B	8985N 	VIGILANTE                
qvNkpyEv-D6GZ-g5bv-6fPY-BWiufgtmg9UT	14284977	AGUILERA BARRIOS	JOSE ANGEL	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR	Sucre	999999990	COMISIÓN DE SERVICIOS	8985C	VIGILANTE CONTRATADO
YdWitMOE-K8uR-dZA3-v5rL-lDcGFBbd527x	14596960	FIGUEROA DE LA R	ADOLFO	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR	Sucre	004102407	JI CUMANAGOTOS	8030N	ASEADOR
bmbyJK1Z-4Jyg-BphJ-dXxl-P2JF0gRJ9sm7	16703576	OSORIO MALAVE	JOSE FELIX	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR	Sucre	006399961	EBA TRES PICOS	8985N	VIGILANTE
kBbOzjy8-9FVv-qf6b-QBy9-zIU9CC8Dl4r9	16703639	ROMERO ANDRADE	CRISTIAN ALEJANDRO	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR	Sucre	006732073	GE BR ALBERTO SANABRIA	8985N	VIGILANTE
kBbOzjy8-9FVv-qf6b-QBy9-zIU9CC8Dl4r9	16703639	ROMERO ANDRADE	CRISTIAN ALEJANDRO	DPTO. DE SEGURIDAD	OBRERO	SUPERVISOR INTERNO	Sucre	006732073	GE BR ALBERTO SANABRIA	8985C	VIGILANTE CONTRATADO
Gq8DyO0v-5e9Y-OOJV-NLsc-8NF759gzv1cY	17910510	CORDOVA	RODOLFO JOSE	DPTO. DE SEGURIDAD	OBRERO	SEGURIDAD INTERNA	Sucre	004100755	JI BACH A SANABRIA	8985C	VIGILANTE CONTRATADO
QWG2WlwT-EYwX-su9d-Tdq6-9zuqQ2kxo7zr	3684825	CASTILLO	EDITH	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	006505175	TEV MANZANARES	1765WI	DOC. V  /SUB-DIRE
eqBdIJCM-Db8c-Ivsj-Je5g-hf8CVKCmCk8c	3840912	ESCALONA PERDOMO	MARIANA DE JESUS	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	005508090	U.I. JUAN P. PEREZ A.	1144DH	DOC. IV  /AULA
8Y7dGjYL-jNzJ-GGwQ-BD9v-3N0xD3DO9j4p	4684388	MUNDARAIN GUZMAN	ELVIA MARIA	MUNICIPIO ESCOLAR Nº14	ADMINISTRATIVO	SECRETARIA	Sucre	006738985	GE REP ARGENTINA	100000	BACHILLER I
L9g3XEsA-6hoG-eoSY-w3uE-sbJFYIzvxPtr	5075324		HERNANDEZ V POLICARPO A  	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	19S4DC	DOC. IV  /SUPERVIS
4jqVKUHh-Qlu6-EUUn-pehR-4sIgEZs0dd2f	5080910	MARCANO QUIJADA	ELENA MARIA DEL CARMEN	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	007933003	E.B. MARISCAL DE AYACUCHO	1845DC	DOC. V   /DIRECTOR
oESPMP8u-ykb8-2o2S-y1pr-Csk8kDhaXxM1	5083910	SALAZAR DE NUÑEZ	GLADYS JOSEFINA	MUNICIPIO ESCOLAR Nº14	DOCENTE	ADMINISTRATIVO ENLACE MUNICIPAL	Sucre	006736458	GE JUAN FREITES	1126DI	DOC. VI  /AULA
Tu31YaPA-uB9K-UfHJ-GqBT-gCUCjkzp8xo9	5451733	RIVERO MENDOZA	CARMEN ELENA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	006970353	NER NUC ESC RURAL N 353	1125DI	DOC. V   /AULA
2DfojG8x-Gm97-wAD4-dSNa-HTLrjWIHB15T	5692178	GUERRA D	MORELIA DEL VALLE	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006738090	GE NUEVA TOLEDO	1135DH	DOC. V   /AULA
tq82vs9e-MKGS-wPYS-p7yZ-8PYRtsTnSRCg	5692982		DURAN R JOSE F           	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1146DH	DOC. VI  /AULA
Xu3PRj04-gsil-c4YJ-4UAu-U2FGGpV3hdbh	5701680	DIAZ HERNANDEZ	BRUNILDE MARIA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	004170406	CEIB CORAZON DE JESUS	1112DI	DOC. II  /AULA
Ean1W139-FJkS-VcoF-SBR7-jK9mVY7A5ccV	5702865	ROJAS PLATA	EMMA GUADALUPE	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1145DH	DOC. V   /AULA
a8wjXZpr-2G1l-7OV8-a8xS-KLpLrsOlmQcn	5703045	BRUZUAL DE BRITO	YUSTMELLYS JOSEFINA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006564880	ESC JOSE A RAMOS SUCRE	1124DI	DOC. IV  /AULA
1kG5odD9-6bih-9cB2-jQC8-fyIN2rQ6Fl1Y	5704794	DE LA ROSA C.	JANNETT I.	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Ribero	007935024	EB STA MARIA	1124DI	DOC. IV  /AULA
uDvY0zvf-DTtK-klyO-64uk-sYTpSFmBjqem	5706037		GALVIZ L FLOR J          	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006505580	IEE SUCRE	1765WI	DOC. V  /SUB-DIRE
gT2IO8rq-Yldf-eujE-ceHe-9of3pUjesuN9	5858338	SALAZAR DE R	ALBA NELI	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	005602000	CD EMILIO TEBAR CARRASCO	1155WH	DOC. V   /AULA
N2ulybqb-EDPr-x0kI-atVi-RsVj4zqx245Q	5874433	CORDERO NORIEGA	ZELEIRA RAQUEL	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1125DI	DOC. V   /AULA
2sswhzup-v7U6-TNFO-6ZnL-DEIxlJwgyRM7	5879954	GARCIA MALAVE	ZULAY DEL VALLE	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Ribero	007935024	EB STA MARIA	1124DI	DOC. IV  /AULA
RWtyr2nk-X3fj-gZH3-ccaC-qQEiloqBfY7d	5983389	MARIA DEL VALLE	OBANDO MALAVE	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	1715WI	DOC. V   /SUB-DIRE
ioYhe25t-ZTjF-OQV2-vJ3R-B41dtuCeZBeS	5983734	MARCANO FIGUEROA	GERARDO ANTONIO	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006394350	CEA FCO ARISTEGUIETA B	1184NH	DOC. IV  /AULA
ADRIZ3ip-XB8I-jDvN-kXCY-VsPPycnCyvTX	8424140	MARCANO	WILLIAN ENRIQUE	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Arismendi	007919279	CB S JUAN DE LAS GALDONAS	1144DH	DOC. IV  /AULA
o8uSDWM6-68Cj-ytDd-HqQT-FnDS2SgPJO2X	8427425	ROMERO C	NIRSA DEL V	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006394350	CEA FCO ARISTEGUIETA B	1186NH	DOC. VI  /AULA
mKPMb19u-z9I5-IRsu-HoxT-ih9r7mcSas67	8437634	LOPEZ DE MARCANO	ELEIDA DEL VALLE	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	004110201	JI RURAL ESCOLAR 201	1715WI	DOC. V   /SUB-DIRE
ufZOmc79-p5T9-5gBd-84q9-VKoTDAaumj5p	8437741	ROSAL FUENTES	MARY JOSEFINA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	006738090	GE NUEVA TOLEDO	1134DH	DOC. IV  /AULA
4xjAXcKL-Yfbi-NAF6-Mais-0gSx1yS9P1S0	8437769	GUZMAN GAMARDO	JOSEFA ISABEL	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	1112DI	DOC. II  /AULA
8DWwJQYr-9m4y-j10l-XDal-Eu7r9A0cUdF6	8438375	RODRIGUEZ QUIJADA	SIMON EDUARDO	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006422256	AI ANDRES ELOY BLANCO	1163DI	DOC. III /AULA
rVwKi1g8-7JG5-H2FC-bvA9-x3DbsdvAj05C	8442365	ZAPATA CASTILLO	EMMARUVI DEL VALLE	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1132DH	DOC. II  /AULA
SuOxmsbf-JY4M-iW3l-ZdTL-tr0T73TSUdmo	8451855	CORDERO NORIEGA	ENIO RAFAEL	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	007933003	E.B. MARISCAL DE AYACUCHO	1145DH	DOC. V   /AULA
zNMpPe7S-Od1h-8riF-FiuZ-YD01JVpTmhr8	8527937	SOLORZANO	JOSE GREGORIO	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006970068	NER NUC ESC RURAL N 068	1134DH	DOC. IV  /AULA
lp1BKlSx-dQKF-aIlt-uyEn-aajced5frX1E	8638075	LICET L.	DUCGLAINES M.	MUNICIPIO ESCOLAR Nº14	ADMINISTRATIVO	SECRETARIA	Sucre	006732086	GE LUIS A MORALES R	10000C	BACHILLER CONTRATADO
IDioZK8h-tqOM-RjUP-KTqV-BsF0xUE3MuxB	8654701	RODRIGUEZ	ANA DELIS	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	004150051	PROGRAMAS NO CONVENCIONAL	1113DI	DOC. III /AULA
zp2p1v1V-jTJI-Ho1V-kjHk-E4MOMgObN6ci	8969784	PEREZ PEREZ	JOSE LUIS	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	005508085	U.E. G. MARISCAL AYACUCHO	1124DI	DOC. IV  /AULA
qhLP3dLs-2PWP-VpSz-a3nH-cs4LSt0rF8Dy	9270413	ORTIZ	LUISA ELENA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	007914550	CB JOSE S GONZALEZ	1143DH	DOC. III /AULA
3i81PBO4-zANF-mRNJ-C1nJ-h6NhvobXrdtN	9273381	ESCOBAR DE G	YEME Y	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	006564880	ESC JOSE A RAMOS SUCRE	1725DI	DOC. V   /SUB-DIRE
rujZ9Fk2-FT1G-kX1o-7x2Q-fE0LFeYr9sEc	9276962	GAMARDO VASQUEZ	NACARY TERESA	MUNICIPIO ESCOLAR Nº14	DOCENTE	JEFA	Sucre	006522232	CENTRO PREESCOLAR CUMANA	1115DI	DOC. V   /AULA
KFYbksuW-T6NP-qnkD-zYA1-VkWf59VqDUO0	9973040	FERNANDEZ B.	MISAEL N.	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	006739639	GE SUCRE	1123DI	DOC. III /AULA
Le3vtrEE-5mgI-2QPX-8VTz-RqizwsMR6x1v	9974700	LUNAR NORIEGA	JOSE INOCENTE	MUNICIPIO ESCOLAR Nº14	DOCENTE	DOC. FUNCIÓN ADMINISTRATIVA	Sucre	006970353	NER NUC ESC RURAL N 353	4120WI	DOC. (NG)/AULA
mtJKXnk6-1b4l-0r03-VSUi-l5hSv1228WCU	9981217	MAESTRE	YOALIS DEL V	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Arismendi	004108665	JI RITA S DE RAMOS	1112DI	DOC. II  /AULA
MJpmUlvV-Xfqp-EYjj-9874-scrHirv9ympu	9982098	MARIN MATA	YADIRA ISABEL	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	007931709	EB CANTARRANA	1142DH	DOC. II  /AULA
DcauHszC-evOx-c9eB-yYLk-352klo62sO5P	10288333	CHIRINOS ARISMENDI	NIURKA COROMOTO	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	006738086	GE NUEVA CORDOBA	1123DI	DOC. III /AULA
q2hX77u1-cwJt-6tMz-Qr7r-CnOLIziAAIsQ	10292214	TORRES C	DAMELIS J.	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	005601647	UE. BARTOLOME DE LA ROCA	1133DH	DOC. III /AULA
2qIpGprJ-vHK6-ENru-XkdW-w2bkdY4c1kTb	10469836	BASTARDO DE AREINAMO	YANELI	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	007914550	CB JOSE S GONZALEZ	1133DH	DOC. III /AULA
JhwwJgZa-yGBY-8nfq-ZGFs-3IttYLFs1SS4	10884769	LEON SILVA	YEIDELYS YAROBY	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	006738087	GE NUEVA ESPARTA	1123DI	DOC. III /AULA
0RE7lXHa-XI5b-ZKwC-qDXm-jvFivN5mGeBC	10948092	MEDINA RAMOS	DARLYN CELENIA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	004103777	JI FE Y ALEGRIA	1113DI	DOC. III /AULA
CKu88BgG-pD72-eoao-kKSf-3k441HlNl9xU	11535629	SIFONTES	NEIDA DEL CARMEN	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	005601647	UE. BARTOLOME DE LA ROCA	1143DH	DOC. III /AULA
QziEGNHf-b7wJ-wjmU-DA0l-F7buXyV0cqJ3	11643286	MORALES DIAZ	LISBETH MARIA FELIPA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	006738090	GE NUEVA TOLEDO	1141WH	DOC. I   /AULA
XdtLgIon-l4YD-2rt3-FUm9-rHS7JSP0agMH	11825071	BARRETO	JORGE A	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	005786905	I DE C MODESTO SILVA NOCT	1181ZH	DOC. I   /AULA
ywQRP4vS-GhIW-Zy6l-irzF-WVZU32ffmind	11827164	CABRERA RIVERO	SUSANA DEL CARMEN	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	004101162	PE BOCA DE SABANA	1112DI	DOC. II  /AULA
Ck50EMcO-RG4R-Uexl-OZ0g-1O4LYh8CPOC6	11828055	CASTAÑEDA	ANGHIT ESTHER	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	007911370	LICEO ANT J DE SUCRE	113AWH	DOC. CONTRATADO A
jOvFGgEi-7UwY-NCuD-nsGf-EONdNcHWl9Gr	11829252	GALANTON ROMERO	GLADYS MERCEDES	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	005500550	CCB CUMANA	1182ZH	DOC. II  /AULA
WAoa9P6c-DPtO-qDyU-Jgrg-OIzd2VmHqdOu	11932460	MORA GONZALEZ	ROSA MARIA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISOR	Sucre	007918186	CB MARIANO DE LA COVA	1145DH	DOC. V   /AULA
lsTCK0yj-m0Vg-XSe2-WMfL-9LjN1DTLPRRd	12272572	CASTAÑEDA	DESIRET JOSEFINA	MUNICIPIO ESCOLAR Nº14	ADMINISTRATIVO	ADMINISTRATIVO	Sucre	001200489	DIV DE PERSONAL	20000C	TECNICO SUPERIOR UNIVERSI
CmWt0qpn-dNEB-mHWc-acXa-Mzoo69mKwwj7	12665422	SALMERON SALMERON	MARIA ESTHER	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	007912247	CB VII GDO REP ARGENTINA	1142DH	DOC. II  /AULA
r4J4L713-eYZE-fxDO-dcoF-QRns8ms2xu5w	13220061	TINEO RODRIGUEZ	LUISA XIOMARA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	006970353	NER NUC ESC RURAL N 353	1123DI	DOC. III /AULA
hGTnigX3-gkw2-DGIR-M3ok-OA0sJ7jdq5Hx	13885033	ACUÑA GONZALEZ	VANYUSHKA ALEJANDRA	MUNICIPIO ESCOLAR Nº14	ADMINISTRATIVO	SECRETARIA	Sucre	999999990	COMISIÓN DE SERVICIOS	11001C	BACHILLER CONTRATADO
SNoMsgOR-XgUy-z00B-KD9T-xEfEdE03ewLv	14454732	OCOPIO BASTARDO	FLORANGEL VERUSKA	MUNICIPIO ESCOLAR Nº14	DOCENTE	SUPERVISORA	Sucre	004107450	JI NUEVA CORDOBA	2117DI	TSU EN EDUCACION
lfct38tV-Wl7u-Vjyu-IA6N-i3vbpMdM7Y2k	17021928	GRANADO BRAZON	ZUNIMAR DEL VALLE	MUNICIPIO ESCOLAR Nº14	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
L5iJkDpM-6sdF-3Iy2-Ndah-vMcXflx5iXGX	8639458	VASQUEZ RAMOS	LUIS BELTRAN	OFICINA DE ATENCION AL CIUDADANO	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	30000C	PROFESIONAL UNIVERSITARIO
ibZTGKz4-sTqV-xgT0-4Not-eNDyuLqWTR73	11826311	GOMEZ BERMUDEZ	YOVELIS DEL VALLE	OFICINA DE ATENCION AL CIUDADANO	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
WImKTK32-0Dxh-yAHQ-S6Ss-DcpXJJRAI5VO	11829809	JIMENEZ DE RODRIGUEZ	MARICELA	OFICINA DE ATENCION AL CIUDADANO	DOCENTE	ANALISTA	Sucre	006738087	GE NUEVA ESPARTA	112AWI	DOC. CONTRATADO A
l8ATNqdo-l0UZ-88Nv-LGMt-nyNF5wG0dvZW	13220601	MENDOZA FIGUEROA	NIRCEDES ESMERALDA	OFICINA DE ATENCION AL CIUDADANO	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
l8ATNqdo-l0UZ-88Nv-LGMt-nyNF5wG0dvZW	13220601	MENDOZA FIGUEROA	NIRCEDES ESMERALDA	OFICINA DE ATENCION AL CIUDADANO	ADMINISTRATIVO	COORDINADORA	Sucre	001200485	DIV. DE ADMINISTRACION Y SERVICIOS	210000	TSU II
NvLeBDeR-d5qi-PPnc-eTn8-WJ5YxVKoodbX	14125599	GOMEZ  ESPARRAGOZA	MAILYN DE LOS ANGELES	OFICINA DE ATENCION AL CIUDADANO	ADMINISTRATIVO	ANALISTA	Sucre	004103777	JI FE Y ALEGRIA	10000C	BACHILLER CONTRATADO
NvLeBDeR-d5qi-PPnc-eTn8-WJ5YxVKoodbX	14125599	GOMEZ  ESPARRAGOZA	MAILYN DE LOS ANGELES	OFICINA DE ATENCION AL CIUDADANO	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
l1xRz4oc-MXWC-cUJI-rl2f-8GjtEWQEz0Kd	15575726	GARCIA ARCIA	ALEJANDRA JOSE	OFICINA DE ATENCION AL CIUDADANO	ADMINISTRATIVO	ANALISTA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
U1XELHL6-RaqM-wvH0-ktzP-zMm7hWrozZLd	17445503	ALVAREZ TORREALBA	JOEZEER EULISES	OFICINA DE ATENCION AL CIUDADANO	OBRERO	MENSAJERO	Sucre	006530080	CPE GRN MARISCAL AYACUCHO	8030N 	ASEADOR                  
8WWfnmLT-W4PL-DFBb-Kf6x-obXHTVKkWmZt	8647343	RAMIREZ COLON	ALEXIS RAMON	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	SECRETARIO	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
gXk4u32v-tZw6-nclB-YLF3-KbZv5LEeyxdN	9270527	RIVAS CABELLO	LISBETH B	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	SECRETARIA	Sucre	001200489	DIV DE PERSONAL	100000	BACHILLER I
RxmHKiFD-MGH0-Voy9-Zx9n-T07MJcRzF9Tw	10217020	QUIJADA	JANIDE MARIA	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO		Bermúdez	006522310	CPE PLAYA GRANDE (PREESCOLAR)	100000	BACHILLER I
0mf1kvWl-DUI1-uP8n-cAlU-ZSdOZSytrTis	11384148	FIGUEROA	MILAGROS C	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO		Sucre	004082500	CDP BEBEDERO	100000	BACHILLER I
3gQmmVF9-J5bF-3x3Z-o7le-ItNaNCTUJA9X	11779285	GUERRA MALAVE	EIRA YAKELIN	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	SECRETARIA	Sucre	007911370	LICEO ANT J DE SUCRE	10000C	BACHILLER CONTRATADO
ZE5m9weY-Pepo-pJuL-d55m-LHEOHQcUfuBA	12661725	RODRIGUEZ ESPIN	CLARITZA	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO		Sucre	006102200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
zF7bHvLz-kAl7-zoYW-DME9-iHLAXBUofzWn	13498522	BRUZUAL	ALBANELYS	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	SECRETARIA	Sucre	006738087	GE NUEVA ESPARTA	10000C	BACHILLER CONTRATADO
alr5NULq-QZXi-b0LE-GXd5-ofchFEQrbOY4	14420945	REYES VALLENILLA	NERSY JOSEFINA	PERSONAL ADMINISTRATIVO	OBRERO	RECEPTOR DE DOCUMENTOS	Sucre	004103850	JI FCO ARISTEGUIETA B	8030C	ASEADOR CONTRATADO
qzBGRNzy-k3v0-NGos-am0M-Eos2BMY328Al	14508928	MARIN LOPEZ	YATSIRIS YANATSY	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	RECEPTOR DE DOCUMENTOS	Sucre	001200482	DIV. DE CORD ENTES PUBLI Y PRIV CUT	20000C	TECNICO SUPERIOR UNIVERSI
QTRJj7ye-Q4yP-stct-tktx-YcTSi9vHRHyA	14597825	MUNDARAY	EVELYN DEL VALLE	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	SECRETARIA	Sucre	006102200	OFIC DE SUPERV ZONA NO 12	10000C	BACHILLER CONTRATADO
FUO7bqEu-xKGc-GfWo-2MYH-BOkniVYKTi8w	16817792	CARVAJAL ARAYAN	SUSANA EMILIA	PERSONAL ADMINISTRATIVO	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
IsJn2s6g-N9bS-wrPV-mJSu-mi9nv0GO1uTV	8641293	PAREDES ARENAS	CESAR MARCELINO	PROGRAMA TODAS LAS MANOS A LA SIEMBRA	DOCENTE	COORDINADOR ZONAL	Montes	007918796	EB JOSE RAFAEL LLOVERA	1141DH	DOC. I   /AULA
kszhGDtR-HBvX-X0tM-nc1W-BuCAnA1w59tW	4686042	RODRIGUEZ DE R	DIGNA DEL VALLE	SECRETARIA DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	001200480	DESPACHO DEL DIRECTOR ZONA SUC	100000	BACHILLER I
yR2so8PZ-voFd-Sr5p-NdRA-VWgU1LlzFNdE	10945774	RODRIGUEZ GUTIERREZ	MARIELYS DEL VALLE	SECRETARIA DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
fss91FuW-gnBh-P1ew-NE6M-3WX468d3OmSA	16703716	VASQUEZ VASQUEZ	YULITZA DEL CARMEN	SECRETARIA DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	001200489	DIV DE PERSONAL	10000C	BACHILLER CONTRATADO
fss91FuW-gnBh-P1ew-NE6M-3WX468d3OmSA	16703716	VASQUEZ VASQUEZ	YULITZA DEL CARMEN	SECRETARIA DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
xsSE39iX-HCrs-bXuD-xXVm-UYlYbjps9Tzo	18903371	GUERRA CABALLERO	YONICAR MARIA	SECRETARIA DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	001200489	DIV DE PERSONAL	10000C	BACHILLER CONTRATADO
xsSE39iX-HCrs-bXuD-xXVm-UYlYbjps9Tzo	18903371	GUERRA CABALLERO	YONICAR MARIA	SECRETARIA DE PERSONAL	ADMINISTRATIVO	SECRETARIA	Sucre	006202200	OFIC DE SUPERV ZONA NO 12	100000	BACHILLER I
\.


                                                                                                                                                                                                                                                                                                         2081.dat                                                                                            0000600 0004000 0002000 00000000005 12703706252 014243  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2083.dat                                                                                            0000600 0004000 0002000 00000000005 12703706252 014245  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2085.dat                                                                                            0000600 0004000 0002000 00000000005 12703706252 014247  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2077.dat                                                                                            0000600 0004000 0002000 00000000005 12703706252 014250  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2087.dat                                                                                            0000600 0004000 0002000 00000000005 12703706252 014251  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2089.dat                                                                                            0000600 0004000 0002000 00000005452 12703706252 014266  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	Matrimonio	8h	CLÁUSULA 72 DEL VIII CONTRATO COLECTIVO DE LOS TRABAJADORES ADMINISTRATIVOS DEL MPPE	COPIA DE CÉDULA DE IDENTIDAD LEGIBLE, CONSTANCIA DE TRABAJO, VOUCHER Y COPIA DEL ACTA DE MATRIMONIO	1	2016-04-05	1
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


                                                                                                                                                                                                                      2074.dat                                                                                            0000600 0004000 0002000 00000000345 12703706252 014254  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	admin	1234	ho4pzswf-xDGe-iqv8-V94I-giR5ryusGF6L	\N	admin	admin
2	director	1234	uC2vFMIm-5IIU-mfA9-8Dgg-59IGDdcBTyGN	\N	jefeinmediato	jefeinmediato
3	secre	1234	2H4ED5GG-ALM0-P9LN-rpTw-goYSvU2oPZtp	\N	secretaria	secretaria
\.


                                                                                                                                                                                                                                                                                           2076.dat                                                                                            0000600 0004000 0002000 00000000005 12703706252 014247  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000054023 12703706252 015374  0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = permisos, pg_catalog;

ALTER TABLE ONLY permisos.vacaciones DROP CONSTRAINT id_vacaciones;
ALTER TABLE ONLY permisos.usuario DROP CONSTRAINT id_usuario;
ALTER TABLE ONLY permisos.tipo_permiso DROP CONSTRAINT id_tipopermiso;
ALTER TABLE ONLY permisos.denuncia_seguimiento DROP CONSTRAINT id_seguimiento;
ALTER TABLE ONLY permisos.permisos DROP CONSTRAINT id_permiso;
ALTER TABLE ONLY permisos.periodo DROP CONSTRAINT id_periodo;
ALTER TABLE ONLY permisos.denuncias_ausencias DROP CONSTRAINT id_denuncia;
ALTER TABLE ONLY permisos.dias_feriados DROP CONSTRAINT fecha;
SET search_path = comunuptos, pg_catalog;

SET search_path = permisos, pg_catalog;

ALTER TABLE permisos.vacaciones ALTER COLUMN id_vacaciones DROP DEFAULT;
ALTER TABLE permisos.usuario ALTER COLUMN id_usuario DROP DEFAULT;
ALTER TABLE permisos.tipo_permiso ALTER COLUMN id_tipopermiso DROP DEFAULT;
ALTER TABLE permisos.permisos ALTER COLUMN id_permiso DROP DEFAULT;
ALTER TABLE permisos.periodo ALTER COLUMN id_periodo DROP DEFAULT;
ALTER TABLE permisos.dias_feriados ALTER COLUMN id_diaferiado DROP DEFAULT;
ALTER TABLE permisos.denuncias_ausencias ALTER COLUMN id_denuncia DROP DEFAULT;
ALTER TABLE permisos.denuncia_seguimiento ALTER COLUMN id_seguimiento DROP DEFAULT;
DROP SEQUENCE permisos.vacaciones_id_vacaciones_seq;
DROP TABLE permisos.vacaciones;
DROP SEQUENCE permisos.usuario_id_usuario_seq;
DROP TABLE permisos.usuario;
DROP SEQUENCE permisos.tipo_permiso_id_tipopermiso_seq;
DROP TABLE permisos.tipo_permiso;
DROP SEQUENCE permisos.permisos_id_permiso_seq;
DROP TABLE permisos.permisos;
DROP SEQUENCE permisos.periodo_id_periodo_seq;
DROP TABLE permisos.periodo;
DROP SEQUENCE permisos.dias_feriados_id_diaferiado_seq;
DROP TABLE permisos.dias_feriados;
DROP SEQUENCE permisos.denuncias_ausencias_id_denuncia_seq;
DROP TABLE permisos.denuncias_ausencias;
DROP SEQUENCE permisos.denuncia_seguimiento_id_seguimiento_seq;
DROP TABLE permisos.denuncia_seguimiento;
SET search_path = comunuptos, pg_catalog;

DROP TABLE comunuptos.funcionario;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
DROP SCHEMA permisos;
DROP SCHEMA comunuptos;
--
-- Name: comunuptos; Type: SCHEMA; Schema: -; Owner: useruptos
--

CREATE SCHEMA comunuptos;


ALTER SCHEMA comunuptos OWNER TO useruptos;

--
-- Name: permisos; Type: SCHEMA; Schema: -; Owner: useruptos
--

CREATE SCHEMA permisos;


ALTER SCHEMA permisos OWNER TO useruptos;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = comunuptos, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: funcionario; Type: TABLE; Schema: comunuptos; Owner: useruptos; Tablespace: 
--

CREATE TABLE funcionario (
    empleado_uid character varying(36) NOT NULL,
    persona_cedula integer NOT NULL,
    persona_nombres character varying(30) NOT NULL,
    persona_apellidos character varying(40),
    dependencia_nombre character varying(60) NOT NULL,
    categoria_cargo_descripcion character varying(50) NOT NULL,
    funcion_cargo_descripcion character varying(100),
    municipio_nombre character varying(40),
    dependencia_codigonomina character varying(15),
    dependencia_nombre_nomina character varying(60) NOT NULL,
    cargo_codigo character varying(15),
    cargo_denominacion character varying(40)
);


ALTER TABLE funcionario OWNER TO useruptos;

SET search_path = permisos, pg_catalog;

--
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
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE denuncia_seguimiento_id_seguimiento_seq OWNED BY denuncia_seguimiento.id_seguimiento;


--
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
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE denuncias_ausencias_id_denuncia_seq OWNED BY denuncias_ausencias.id_denuncia;


--
-- Name: dias_feriados; Type: TABLE; Schema: permisos; Owner: useruptos; Tablespace: 
--

CREATE TABLE dias_feriados (
    id_diaferiado integer NOT NULL,
    fecha date NOT NULL,
    tipo_fecha character varying(100),
    motivo character varying(255),
    estatus integer,
    observacion text
);


ALTER TABLE dias_feriados OWNER TO useruptos;

--
-- Name: COLUMN dias_feriados.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN dias_feriados.estatus IS '0=Inactivo
1=Activo';


--
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
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE dias_feriados_id_diaferiado_seq OWNED BY dias_feriados.id_diaferiado;


--
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
-- Name: COLUMN periodo.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN periodo.estatus IS '1=Activo
0=Inactivo';


--
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
-- Name: periodo_id_periodo_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE periodo_id_periodo_seq OWNED BY periodo.id_periodo;


--
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
-- Name: COLUMN permisos.id_jefeinmediato; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN permisos.id_jefeinmediato IS 'extraido de la consulta a BD zees';


--
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
-- Name: permisos_id_permiso_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE permisos_id_permiso_seq OWNED BY permisos.id_permiso;


--
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
-- Name: COLUMN tipo_permiso.tipo_permiso; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN tipo_permiso.tipo_permiso IS '1=Obligatorio
2=Potestativo';


--
-- Name: COLUMN tipo_permiso.id_tipo_personal; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN tipo_permiso.id_tipo_personal IS '1=Administrativo
2=Docente
3=Obrero';


--
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
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE tipo_permiso_id_tipopermiso_seq OWNED BY tipo_permiso.id_tipopermiso;


--
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
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
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
-- Name: COLUMN vacaciones.tipo_personal; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.tipo_personal IS '1=Administrativo
2=Docente
3=Obrero';


--
-- Name: COLUMN vacaciones.tipo_vacaciones; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.tipo_vacaciones IS '1=Regulares
2=Retrasadas';


--
-- Name: COLUMN vacaciones.estatus; Type: COMMENT; Schema: permisos; Owner: useruptos
--

COMMENT ON COLUMN vacaciones.estatus IS '1=Pendiente
2=Aprobado
3=Rechazado';


--
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
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE OWNED BY; Schema: permisos; Owner: useruptos
--

ALTER SEQUENCE vacaciones_id_vacaciones_seq OWNED BY vacaciones.id_vacaciones;


--
-- Name: id_seguimiento; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY denuncia_seguimiento ALTER COLUMN id_seguimiento SET DEFAULT nextval('denuncia_seguimiento_id_seguimiento_seq'::regclass);


--
-- Name: id_denuncia; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY denuncias_ausencias ALTER COLUMN id_denuncia SET DEFAULT nextval('denuncias_ausencias_id_denuncia_seq'::regclass);


--
-- Name: id_diaferiado; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY dias_feriados ALTER COLUMN id_diaferiado SET DEFAULT nextval('dias_feriados_id_diaferiado_seq'::regclass);


--
-- Name: id_periodo; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY periodo ALTER COLUMN id_periodo SET DEFAULT nextval('periodo_id_periodo_seq'::regclass);


--
-- Name: id_permiso; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY permisos ALTER COLUMN id_permiso SET DEFAULT nextval('permisos_id_permiso_seq'::regclass);


--
-- Name: id_tipopermiso; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY tipo_permiso ALTER COLUMN id_tipopermiso SET DEFAULT nextval('tipo_permiso_id_tipopermiso_seq'::regclass);


--
-- Name: id_usuario; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- Name: id_vacaciones; Type: DEFAULT; Schema: permisos; Owner: useruptos
--

ALTER TABLE ONLY vacaciones ALTER COLUMN id_vacaciones SET DEFAULT nextval('vacaciones_id_vacaciones_seq'::regclass);


SET search_path = comunuptos, pg_catalog;

--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: comunuptos; Owner: useruptos
--

COPY funcionario (empleado_uid, persona_cedula, persona_nombres, persona_apellidos, dependencia_nombre, categoria_cargo_descripcion, funcion_cargo_descripcion, municipio_nombre, dependencia_codigonomina, dependencia_nombre_nomina, cargo_codigo, cargo_denominacion) FROM stdin;
\.
COPY funcionario (empleado_uid, persona_cedula, persona_nombres, persona_apellidos, dependencia_nombre, categoria_cargo_descripcion, funcion_cargo_descripcion, municipio_nombre, dependencia_codigonomina, dependencia_nombre_nomina, cargo_codigo, cargo_denominacion) FROM '$$PATH$$/2079.dat';

SET search_path = permisos, pg_catalog;

--
-- Data for Name: denuncia_seguimiento; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY denuncia_seguimiento (id_seguimiento, fecha_visita, id_funcionarioatencion, id_dependencia, observaciones, respuesta, id_denuncia) FROM stdin;
\.
COPY denuncia_seguimiento (id_seguimiento, fecha_visita, id_funcionarioatencion, id_dependencia, observaciones, respuesta, id_denuncia) FROM '$$PATH$$/2081.dat';

--
-- Name: denuncia_seguimiento_id_seguimiento_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('denuncia_seguimiento_id_seguimiento_seq', 1, false);


--
-- Data for Name: denuncias_ausencias; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY denuncias_ausencias (id_denuncia, id_funcionario, id_dependencia, fecha_denuncia, dias_ausencia, id_jefeinmediato, observaciones, respuesta, fecha_respuesta, estatus) FROM stdin;
\.
COPY denuncias_ausencias (id_denuncia, id_funcionario, id_dependencia, fecha_denuncia, dias_ausencia, id_jefeinmediato, observaciones, respuesta, fecha_respuesta, estatus) FROM '$$PATH$$/2083.dat';

--
-- Name: denuncias_ausencias_id_denuncia_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('denuncias_ausencias_id_denuncia_seq', 1, false);


--
-- Data for Name: dias_feriados; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY dias_feriados (id_diaferiado, fecha, tipo_fecha, motivo, estatus, observacion) FROM stdin;
\.
COPY dias_feriados (id_diaferiado, fecha, tipo_fecha, motivo, estatus, observacion) FROM '$$PATH$$/2085.dat';

--
-- Name: dias_feriados_id_diaferiado_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('dias_feriados_id_diaferiado_seq', 1, false);


--
-- Data for Name: periodo; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY periodo (id_periodo, nombre_periodo, fecha_inicio, fecha_cierre, estatus, id_jefe_personal, id_jefezona, observacion) FROM stdin;
\.
COPY periodo (id_periodo, nombre_periodo, fecha_inicio, fecha_cierre, estatus, id_jefe_personal, id_jefezona, observacion) FROM '$$PATH$$/2077.dat';

--
-- Name: periodo_id_periodo_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('periodo_id_periodo_seq', 1, false);


--
-- Data for Name: permisos; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY permisos (id_permiso, id_funcionario, fecha_permiso, numero_dias, motivo_permiso, fecha_desde, fecha_hasta, fecha_recepcion, id_tipopermiso, observacion, id_jefeinmediato) FROM stdin;
\.
COPY permisos (id_permiso, id_funcionario, fecha_permiso, numero_dias, motivo_permiso, fecha_desde, fecha_hasta, fecha_recepcion, id_tipopermiso, observacion, id_jefeinmediato) FROM '$$PATH$$/2087.dat';

--
-- Name: permisos_id_permiso_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('permisos_id_permiso_seq', 1, false);


--
-- Data for Name: tipo_permiso; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY tipo_permiso (id_tipopermiso, tipo_permiso, nombre_tipo, numero_dias, reglas_legal, recaudos, id_tipo_personal, fecha_registro, estatus) FROM stdin;
\.
COPY tipo_permiso (id_tipopermiso, tipo_permiso, nombre_tipo, numero_dias, reglas_legal, recaudos, id_tipo_personal, fecha_registro, estatus) FROM '$$PATH$$/2089.dat';

--
-- Name: tipo_permiso_id_tipopermiso_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('tipo_permiso_id_tipopermiso_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY usuario (id_usuario, login_usuario, password_usuario, id_funcionario, fecha_ultimo_acceso, tipo_usuario, rol_usuario) FROM stdin;
\.
COPY usuario (id_usuario, login_usuario, password_usuario, id_funcionario, fecha_ultimo_acceso, tipo_usuario, rol_usuario) FROM '$$PATH$$/2074.dat';

--
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, true);


--
-- Data for Name: vacaciones; Type: TABLE DATA; Schema: permisos; Owner: useruptos
--

COPY vacaciones (id_vacaciones, fecha_solicitud, id_funcionario, tipo_personal, cargo_funcional, numero_dias, fecha_desde, fecha_hasta, id_periodo, fecha_retorno, observacion, id_jefeinmediato, id_jefepersonal, id_municipio, id_dependencialaboral, tipo_vacaciones, estatus) FROM stdin;
\.
COPY vacaciones (id_vacaciones, fecha_solicitud, id_funcionario, tipo_personal, cargo_funcional, numero_dias, fecha_desde, fecha_hasta, id_periodo, fecha_retorno, observacion, id_jefeinmediato, id_jefepersonal, id_municipio, id_dependencialaboral, tipo_vacaciones, estatus) FROM '$$PATH$$/2076.dat';

--
-- Name: vacaciones_id_vacaciones_seq; Type: SEQUENCE SET; Schema: permisos; Owner: useruptos
--

SELECT pg_catalog.setval('vacaciones_id_vacaciones_seq', 1, false);


--
-- Name: fecha; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY dias_feriados
    ADD CONSTRAINT fecha PRIMARY KEY (fecha);


--
-- Name: id_denuncia; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY denuncias_ausencias
    ADD CONSTRAINT id_denuncia PRIMARY KEY (id_denuncia);


--
-- Name: id_periodo; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY periodo
    ADD CONSTRAINT id_periodo PRIMARY KEY (id_periodo);


--
-- Name: id_permiso; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY permisos
    ADD CONSTRAINT id_permiso PRIMARY KEY (id_permiso);


--
-- Name: id_seguimiento; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY denuncia_seguimiento
    ADD CONSTRAINT id_seguimiento PRIMARY KEY (id_seguimiento);


--
-- Name: id_tipopermiso; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY tipo_permiso
    ADD CONSTRAINT id_tipopermiso PRIMARY KEY (id_tipopermiso);


--
-- Name: id_usuario; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT id_usuario PRIMARY KEY (id_usuario);


--
-- Name: id_vacaciones; Type: CONSTRAINT; Schema: permisos; Owner: useruptos; Tablespace: 
--

ALTER TABLE ONLY vacaciones
    ADD CONSTRAINT id_vacaciones PRIMARY KEY (id_vacaciones);


--
-- Name: permisos; Type: ACL; Schema: -; Owner: useruptos
--

REVOKE ALL ON SCHEMA permisos FROM PUBLIC;
REVOKE ALL ON SCHEMA permisos FROM useruptos;
GRANT ALL ON SCHEMA permisos TO useruptos;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             