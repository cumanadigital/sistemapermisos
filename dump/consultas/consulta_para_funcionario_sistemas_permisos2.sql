SELECT  
--ed.empleado_uid,
-- ed.empleado_dep_uid,
--p.persona_uid,
p.persona_cedula,
trim(COALESCE(p.persona_apellidos ,'') ||' '|| coalesce(p.persona_nombres,'')) as apellidos_Nombres  ,
--trim(p.persona_apellidos) as persona_apellidos,
--trim(p.persona_nombres) as persona_nombres ,

-- COALESCE(plan.pl_estadistico,fd.dependencia_uid,d.dependencia_uid) as ID_DEPENDENCIA_LABORA,
--COALESCE(fd.dependencia_uid,plan.pl_estadistico,d.dependencia_uid) as ID_DEPENDENCIA_LABORA2,
d.dependencia_codigonomina, 
COALESCE(plan.pl_nombre,fd.dependencia_nombre,d.dependencia_nombre) as DEPENDENCIA_LABORA,
-- d.dependencia_uid as id_dep_nomina,
-- d.dependencia_nombre,
--plan.pl_nombre,
--fd.dependencia_nombre,
--d.dependencia_nombre,
--'----',
--fc.funcion_cargo_descripcion,
car.categoria_cargo_descripcion,
COALESCE(fc.funcion_cargo_descripcion,c.cargo_denominacion) as CARGO_LABORA,

UPPER(m.municipio_nombre) AS municipio_nombre


--d.dependencia_codigonomina,
--c.cargo_denominacion,
--c.cargo_codigo, 

--p.persona_telefono
--( COALESCE(plan.pl_nombre,'') || COALESCE(fd.dependencia_nombre,'') ) as DEPENDENCIA_LABORA,

--p.persona_fechanacimiento,p.persona_lugarnac,
--p.persona_ed_uid,p.persona_direccion,
--p.persona_telefono,p.persona_correo,p.persona_uid,
--d.dependencia_uid,d.dependencia_codigonomina,
--fd.dependencia_nombre as Dep Lab ,d.dependencia_municipio, 
--fc.funcion_cargo_descripcion,
--empleado_dep_dependencia_lab, 
--car.categoria_cargo_descripcion
--,e.*
--,ed.*
--,d.*,c.*,m.*
--,pa.*
--,et.*
,car.*
--,fc.*
FROM comun.persona as p
LEFT JOIN comun.empleado as e ON(e.empleado_persona = p.persona_cedula)
LEFT JOIN comun.empleado_dependencia as ed ON(ed.empleado_dep_empleado LIKE e.empleado_uid)
LEFT JOIN comun.dependencia as d ON(d.dependencia_uid = ed.empleado_dep_dependencia)
left JOIN comun.dependencia as fd ON(fd.dependencia_uid = ed.empleado_dep_dependencia_lab)
LEFT JOIN comun.planteles   as plan ON(plan.pl_estadistico = ed.empleado_dep_dependencia_lab)
LEFT JOIN comun.cargo as c ON(c.cargo_codigo = ed.empleado_dep_codigocargo)
--LEFT JOIN comun.parroquia as pa ON(pa.parroquia_uid LIKE d.dependencia_parroquia)
LEFT JOIN comun.municipio as m ON(m.municipio_codigo = d.dependencia_municipio)
LEFT JOIN comun.estado as et ON(et.estado_codigo = m.municipio_estado)
LEFT JOIN comun.categoria_cargo as car ON(car.categoria_cargo_uid = c.cargo_categoria)
LEFT JOIN comun.funcion_cargo  as fc ON(fc.funcion_cargo_uid = ed.empleado_dep_cargofuncional)
--LEFT JOIN comun.empleado_dependencia as fc ON(empleado_dep_dependencia_lab like dependencia_uid)
where 
( 
--p.persona_cedula = 11829328
--or p.persona_cedula = 2775296
--or p.persona_cedula = 3012085
--or p.persona_cedula = 12273927
--or p.persona_cedula = 16486212
--or p.persona_cedula = 15740850
--or p.persona_cedula = 12269509
--or p.persona_cedula = 8436654 	-- norys pino
--or p.persona_cedula = 13221578 	-- franciel
--or p.persona_cedula = 15740850  -- PEREZ SERRA LUIS ELOY
--or p.persona_cedula = 12273927	-- "LOPEZ PEROZA LUZ MARINA"
--or p.persona_cedula = 10462223 	-- rincones
--or p.persona_cedula = 8439584 	-- COORDINACION DE LICENCIA	8439584	SALAS JOSEFINA DEL VALLE
--or p.persona_cedula = 9270735	-- ;"DIAZ HERNANDEZ MARIA GABRIELA";"DIV. ASESORIA JURIDICA"
--or p.persona_cedula = 8437504 	-- 8437504	CARIACO MENESES CARMEN CECILIA	COORD. DE PROTECCION Y BIENESTAR SOCIAL	
--or p.persona_cedula = 10878310  -- DIV. ACADEMICA	MARTINEZ RODRIGUEZ JOSÉ GREGORIO
-- or 
( p.persona_nombres ilike 'MARIELYS%'
or p.persona_apellidos ilike 'MARIELYS%' ) 
-- AND m.municipio_nombre ilike 'CRUZ%'
AND m.municipio_nombre ilike 'andres%'
and car.categoria_cargo_descripcion ilike 'DOCENTE'
 --or fd.dependencia_nombre ilike '%jurid%'
--or d.dependencia_nombre ilike '%INFORMARMA%'
--or d.dependencia_uid = 'nje4gG2D-ooRE-bge9-1sMQ-jfG5IiUl9lUH'
--or empleado_dep_dependencia='sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT'
--OR 
-- empleado_dep_dependencia_lab = 'sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT' -- INFORMATICA
-- OR empleado_dep_dependencia_lab = '1T6AtL7V6-lSHd-tdFb-d4Y0-kjkJEvpJJjiA' -- cpset
-- OR empleado_dep_dependencia_lab = '9tDOAp4l1dLgtD-AaXM-D0U1-ljgJaZdS99' -- COORD. SISTEMA DE GESTION ESCOLAR
-- OR empleado_dep_dependencia_lab = '9WaSPXNl3Pq8plQUD-XBaLX-VSI02-ZQCJKcPStn9' -- cbit 
)
order by m.municipio_nombre, p.persona_apellidos, p.persona_nombres, DEPENDENCIA_LABORA, p.persona_cedula, empleado_dep_serial DESC
--empleado_dep_dependencia_lab='9tDOAp4l1dLgtD-AaXM-D0U1-ljgJaZdSUko'--sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT'