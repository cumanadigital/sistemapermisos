SELECT 	U.id_usuario, 
	U.login_usuario, 
	--U.password_usuario, 
	U.id_funcionario, 
	U.fecha_ultimo_acceso, 
	U.tipo_usuario, 
	U.rol_usuario, 
	U.estatus_usuario,

	btrim((COALESCE(per.persona_apellidos, ''::character varying)::text || ' '::text) || COALESCE(per.persona_nombres, ''::character varying)::text) AS apellidos_nombres,

	per.persona_apellidos,
    	per.persona_nombres,
    	COALESCE(plan.pl_nombre, fd.dependencia_nombre, d.dependencia_nombre) AS dependencia_labora,
    	COALESCE(fc.funcion_cargo_descripcion, c.cargo_denominacion) AS cargo_labora,
    	car.categoria_cargo_descripcion,
    	c.cargo_codigo,
    	c.cargo_denominacion,
    	upper(m.municipio_nombre::text) AS municipio_nombre,
	
--ed.empleado_dep_uid,

	--P.id_permiso, P.id_funcionario, P.fecha_permiso, P.numero_dias, 
	--TP.nombre_tipo,
	--TP.numero_dias as TPnumero_dias,
	--P.motivo_permiso, 
	--P.fecha_desde, P.fecha_hasta, P.fecha_recepcion, P.id_tipopermiso, P.observacion, 
	--P.id_jefeinmediato, 

	--F.empleado_uid, F.persona_cedula, F.persona_nombres, F.persona_apellidos, 
	--F.dependencia_nombre, F.categoria_cargo_descripcion, F.funcion_cargo_descripcion, 
	--F.municipio_nombre, F.dependencia_codigonomina, F.dependencia_nombre_nomina, 
	--F.cargo_codigo, F.cargo_denominacion
/*
	F.empleado_dep_uid, F.persona_uid, 
	F.persona_cedula, 
	F.apellidos_nombres, 
        F.dependencia_labora, F.cargo_labora, F.categoria_cargo_descripcion, 
        F.cargo_codigo, 
        F.cargo_denominacion, 
	F.municipio_nombre,
 */     
/*
 '--empl_dep--', ed.*,
 '--empl--', e.*,
 '--pers--', per.*,
 '--dep_nom--', d.*,
 '--dep_lab--', fd.*,
 '--plant--', plan.*,
 '--munic--', m.*,
 '--estad--', et.*,
 '--cargo--', c.*,
 '--cat_cargo--', car.*,
 '--func_cargo--', fc.*,
 */
	'----' 
   
FROM permisos.usuario AS U

LEFT JOIN comun.empleado_dependencia ed ON ed.empleado_dep_uid = U.id_funcionario
-- enlaces hacia la persona 
LEFT JOIN comun.empleado e ON e.empleado_uid = ed.empleado_dep_empleado
LEFT JOIN comun.persona per ON per.persona_cedula = e.empleado_persona
-- enlaces hacia la dependencia
LEFT JOIN comun.dependencia d ON d.dependencia_uid::text = ed.empleado_dep_dependencia::text
LEFT JOIN comun.dependencia fd ON fd.dependencia_uid::text = ed.empleado_dep_dependencia_lab::text
LEFT JOIN comun.planteles plan ON plan.pl_estadistico::text = ed.empleado_dep_dependencia_lab::text
LEFT JOIN comun.municipio m ON m.municipio_codigo = d.dependencia_municipio
LEFT JOIN comun.estado et ON et.estado_codigo = m.municipio_estado
-- enlaces hacia cargo
LEFT JOIN comun.cargo c ON c.cargo_codigo::text = ed.empleado_dep_codigocargo::text
LEFT JOIN comun.categoria_cargo car ON car.categoria_cargo_uid::text = c.cargo_categoria::text
LEFT JOIN comun.funcion_cargo fc ON fc.funcion_cargo_uid::text = ed.empleado_dep_cargofuncional::text

--INNER JOIN comunuptos.funcionario AS F ON F.empleado_uid LIKE id_funcionario;

--WHERE F.persona_cedula = 11829328
--WHERE  "demkjIqP-OsQE-MA8h-9aaR-GXtX0dWsiJMG"

ORDER BY U.id_usuario DESC
