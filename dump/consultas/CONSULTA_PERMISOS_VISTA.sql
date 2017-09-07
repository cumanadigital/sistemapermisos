SELECT 
	P.id_permiso, P.id_funcionario, P.fecha_permiso, P.numero_dias, 
	TP.nombre_tipo,
	TP.numero_dias as TPnumero_dias,
	P.motivo_permiso, 
	P.fecha_desde, P.fecha_hasta, P.fecha_recepcion, P.id_tipopermiso, P.observacion, 
	P.id_jefeinmediato, 

	--F.empleado_uid, F.persona_cedula, F.persona_nombres, F.persona_apellidos, 
	--F.dependencia_nombre, F.categoria_cargo_descripcion, F.funcion_cargo_descripcion, 
	--F.municipio_nombre, F.dependencia_codigonomina, F.dependencia_nombre_nomina, 
	--F.cargo_codigo, F.cargo_denominacion
	'----'
FROM permisos.permisos AS P       
INNER JOIN permisos.tipo_permiso AS TP ON TP.id_tipopermiso = P.id_tipopermiso
--INNER JOIN comunuptos.funcionario AS F ON F.empleado_uid LIKE id_funcionario
--INNER JOIN permisos.vista_funcionario AS F ON (F.persona_uid LIKE P.id_funcionario)

			

--SELECT empleado_dep_uid, persona_uid, persona_cedula, apellidos_nombres, 
--       dependencia_labora, cargo_labora, categoria_cargo_descripcion, 
--       cargo_codigo, cargo_denominacion, municipio_nombre
--  FROM permisos.vista_funcionario
--  WHERE persona_cedula = 11829328
