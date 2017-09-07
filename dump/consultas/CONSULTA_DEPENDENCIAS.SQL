SELECT  
	--ed.empleado_dep_uid,
	---p.persona_uid,
	--p.persona_cedula,
	--trim(COALESCE(p.persona_apellidos ,'') ||' '|| coalesce(p.persona_nombres,'')) as apellidos_Nombres  ,
	dependencia_uid,
	dependencia_codigonomina,
	d.dependencia_nombre,
	--COALESCE(plan.pl_nombre,fd.dependencia_nombre,d.dependencia_nombre) as DEPENDENCIA_LABORA,
	--COALESCE(fc.funcion_cargo_descripcion,c.cargo_denominacion) as CARGO_LABORA,
	--car.categoria_cargo_descripcion,
	--c.cargo_codigo,
	--c.cargo_denominacion,
	UPPER(m.municipio_nombre) AS municipio_nombre,
	dependencia_depende
--FROM comun.persona as p
--LEFT JOIN comun.empleado as e ON(e.empleado_persona = p.persona_cedula)
--LEFT JOIN comun.empleado_dependencia as ed ON(ed.empleado_dep_empleado LIKE e.empleado_uid)

FROM comun.dependencia as d 
-- ON(d.dependencia_uid = ed.empleado_dep_dependencia)
--left JOIN comun.dependencia as fd ON(fd.dependencia_uid = empleado_dep_dependencia_lab)
--LEFT JOIN comun.planteles   as plan ON(plan.pl_estadistico = empleado_dep_dependencia_lab)
--LEFT JOIN comun.cargo as c ON(c.cargo_codigo = ed.empleado_dep_codigocargo)
--LEFT JOIN comun.parroquia as pa ON(pa.parroquia_uid LIKE d.dependencia_parroquia)
LEFT JOIN comun.municipio as m ON(m.municipio_codigo = d.dependencia_municipio)
LEFT JOIN comun.estado as et ON(et.estado_codigo = m.municipio_estado)
--LEFT JOIN comun.categoria_cargo as car ON(car.categoria_cargo_uid = c.cargo_categoria)
--LEFT JOIN comun.funcion_cargo  as fc ON(fc.funcion_cargo_uid = ed.empleado_dep_cargofuncional)
-- where p.persona_cedula = $cedula
-- order by p.persona_cedula, ed.empleado_dep_serial DESC

WHERE  

   dependencia_codigonomina ILIKE  '0010%' 
OR dependencia_codigonomina ILIKE  '0012%' 
OR dependencia_codigonomina ILIKE  '0020%' 
OR dependencia_codigonomina ILIKE  '4007%'  
--OR dependencia_codigonomina ILIKE  '0077%' 
--OR dependencia_codigonomina ILIKE  '0077%' 
--OR dependencia_codigonomina ILIKE  '0077%' 
--OR dependencia_codigonomina ILIKE  '0077%' 
--OR dependencia_codigonomina ILIKE  '0077%' 

OR dependencia_codigonomina ILIKE  '0061%'
OR dependencia_codigonomina ILIKE  '00620%'
OR dependencia_codigonomina ILIKE  '00630%'
OR dependencia_codigonomina ILIKE  '00694%'
--OR dependencia_codigonomina ILIKE  '0077%' 

--OR dependencia_codigonomina ILIKE  '0041%'

ORDER BY dependencia_codigonomina
-- municipio_codigo, , d.dependencia_nombre