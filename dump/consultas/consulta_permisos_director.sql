SELECT 	P.id_permiso, 
	P.id_funcionario, 
	
	per.persona_cedula as cedula_persona,
	btrim((COALESCE(per.persona_apellidos, ''::character varying)::text || ' '::text) || COALESCE(per.persona_nombres, ''::character varying)::text) AS apellidos_nombres,
	--per.persona_apellidos as nombre_persona,
	--per.persona_nombres as apellido_persona,
	COALESCE(plan.pl_estadistico, fd.dependencia_uid, d.dependencia_uid) AS id_departamento_persona,
	COALESCE(plan.pl_nombre, fd.dependencia_nombre, d.dependencia_nombre) AS departamento_persona,
	COALESCE(fc.funcion_cargo_descripcion, c.cargo_denominacion) AS cargo_persona,
	car.categoria_cargo_descripcion,
	c.cargo_codigo,
	c.cargo_denominacion ,
	upper(m.municipio_nombre::text) AS municipio_nombre,
												
	P.fecha_permiso, 
	P.numero_dias, 
	P.id_tipopermiso, 
	TP.nombre_tipo,
	TP.numero_dias as TPnumero_dias,
	P.motivo_permiso, 
	P.fecha_desde, 
	P.fecha_hasta, 
	P.fecha_recepcion, 
	
	P.observacion, 
	P.id_jefeinmediato, 

	per2.persona_cedula as cedula_persona2,
	btrim((COALESCE(per2.persona_apellidos, ''::character varying)::text || ' '::text) || COALESCE(per2.persona_nombres, ''::character varying)::text) AS apellidos_nombres2,
	per2.persona_apellidos as nombre_persona2,
	per2.persona_nombres as apellido_persona2,
	COALESCE(plan2.pl_nombre, fd2.dependencia_nombre, d2.dependencia_nombre) AS departamento_persona2,
	COALESCE(fc2.funcion_cargo_descripcion, c2.cargo_denominacion) AS cargo_persona2,
	car2.categoria_cargo_descripcion as categoria_cargo_descripcion2,
	c2.cargo_codigo as cargo_codigo2,
	c2.cargo_denominacion as cargo_denominacion2 ,
	upper(m2.municipio_nombre::text) AS municipio_nombre2,
	
	'---' as separador
FROM permisos.permisos AS P       
INNER JOIN permisos.tipo_permiso AS TP ON TP.id_tipopermiso = P.id_tipopermiso
/*-- enlace hacia funcionario*/
LEFT JOIN comun.empleado_dependencia ed ON ed.empleado_dep_uid = P.id_funcionario
/*-- enlaces hacia la persona */
LEFT JOIN comun.empleado e ON e.empleado_uid = ed.empleado_dep_empleado
LEFT JOIN comun.persona per ON per.persona_cedula = e.empleado_persona
/*-- enlaces hacia la dependencia*/
LEFT JOIN comun.dependencia d ON d.dependencia_uid::text = ed.empleado_dep_dependencia::text
LEFT JOIN comun.dependencia fd ON fd.dependencia_uid::text = ed.empleado_dep_dependencia_lab::text
LEFT JOIN comun.planteles plan ON plan.pl_estadistico::text = ed.empleado_dep_dependencia_lab::text
LEFT JOIN comun.municipio m ON m.municipio_codigo = d.dependencia_municipio
LEFT JOIN comun.estado et ON et.estado_codigo = m.municipio_estado
/*-- enlaces hacia cargo*/
LEFT JOIN comun.cargo c ON c.cargo_codigo::text = ed.empleado_dep_codigocargo::text
LEFT JOIN comun.categoria_cargo car ON car.categoria_cargo_uid::text = c.cargo_categoria::text
LEFT JOIN comun.funcion_cargo fc ON fc.funcion_cargo_uid::text = ed.empleado_dep_cargofuncional::text


/*-- enlace hacia jefe inmediato*/
LEFT JOIN comun.empleado_dependencia ed2 ON ed2.empleado_dep_uid = P.id_jefeinmediato
/*-- enlaces hacia la persona */
LEFT JOIN comun.empleado e2 ON e2.empleado_uid = ed2.empleado_dep_empleado
LEFT JOIN comun.persona per2 ON per2.persona_cedula = e2.empleado_persona
/*-- enlaces hacia la dependencia*/
LEFT JOIN comun.dependencia d2 ON d2.dependencia_uid::text = ed2.empleado_dep_dependencia::text
LEFT JOIN comun.dependencia fd2 ON fd2.dependencia_uid::text = ed2.empleado_dep_dependencia_lab::text
LEFT JOIN comun.planteles plan2 ON plan2.pl_estadistico::text = ed2.empleado_dep_dependencia_lab::text
LEFT JOIN comun.municipio m2 ON m2.municipio_codigo = d2.dependencia_municipio
LEFT JOIN comun.estado et2 ON et2.estado_codigo = m2.municipio_estado
/*-- enlaces hacia cargo*/
LEFT JOIN comun.cargo c2 ON c2.cargo_codigo::text = ed2.empleado_dep_codigocargo::text
LEFT JOIN comun.categoria_cargo car2 ON car2.categoria_cargo_uid::text = c2.cargo_categoria::text
LEFT JOIN comun.funcion_cargo fc2 ON fc2.funcion_cargo_uid::text = ed2.empleado_dep_cargofuncional::text

ORDER BY P.id_permiso DESC