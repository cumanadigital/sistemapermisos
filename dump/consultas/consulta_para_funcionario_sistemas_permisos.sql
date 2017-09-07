SELECT  
--e.empleado_uid,
ed.empleado_dep_uid,
p.persona_uid,
p.persona_cedula,
trim(COALESCE(p.persona_apellidos ,'') ||' '|| coalesce(p.persona_nombres,'')) as apellidos_Nombres  ,
--trim(p.persona_apellidos) as persona_apellidos,
--trim(p.persona_nombres) as persona_nombres ,
COALESCE(plan.pl_nombre,fd.dependencia_nombre,d.dependencia_nombre) as DEPENDENCIA_LABORA,
--plan.pl_nombre,
--fd.dependencia_nombre,
--d.dependencia_nombre,
--'----',
--fc.funcion_cargo_descripcion,
car.categoria_cargo_descripcion,
COALESCE(fc.funcion_cargo_descripcion,c.cargo_denominacion) as CARGO_LABORA,

UPPER(m.municipio_nombre) AS municipio_nombre


--d.dependencia_nombre,
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
left JOIN comun.dependencia as fd ON(fd.dependencia_uid = empleado_dep_dependencia_lab)
LEFT JOIN comun.planteles   as plan ON(plan.pl_estadistico = empleado_dep_dependencia_lab)
LEFT JOIN comun.cargo as c ON(c.cargo_codigo = ed.empleado_dep_codigocargo)
--LEFT JOIN comun.parroquia as pa ON(pa.parroquia_uid LIKE d.dependencia_parroquia)
LEFT JOIN comun.municipio as m ON(m.municipio_codigo = d.dependencia_municipio)
LEFT JOIN comun.estado as et ON(et.estado_codigo = m.municipio_estado)
LEFT JOIN comun.categoria_cargo as car ON(car.categoria_cargo_uid = c.cargo_categoria)
LEFT JOIN comun.funcion_cargo  as fc ON(fc.funcion_cargo_uid = ed.empleado_dep_cargofuncional)
--LEFT JOIN comun.empleado_dependencia as fc ON(empleado_dep_dependencia_lab like dependencia_uid)
where 
( 
p.persona_cedula = 11829328
or p.persona_cedula = 2775296
or p.persona_cedula = 3012085
or p.persona_cedula = 12273927
or p.persona_cedula = 16486212
or p.persona_cedula = 15740850
or p.persona_cedula = 12269509
or p.persona_cedula = 8436654 -- norys pino
or p.persona_cedula = 13221578 -- franciel
or p.persona_nombres ilike 'kleit%'
)
order by p.persona_cedula, empleado_dep_serial DESC
--empleado_dep_dependencia_lab='9tDOAp4l1dLgtD-AaXM-D0U1-ljgJaZdSUko'--sWqrPUl1-3lDq-6547-uTDf-TyfobRmSomkT'

--plan.pl_nombre Ilike '%infra%' 
--or 
--COALESCE(plan.pl_nombre,fd.dependencia_nombre) = '%division de cultura%'
--( COALESCE(plan.pl_nombre,'')) =''
--COALESCE (mun_lab.mun_uid,mun.mun_uid )='$municipio'
--fd.dependencia_nombre Ilike '%pago%' or 
--plan.pl_nombre Ilike '%infra%' 
-- order by p.persona_cedula, empleado_dep_serial DESC