SELECT P.id_permiso, P.id_funcionario, P.fecha_permiso, P.numero_dias, P.motivo_permiso, 
       P.fecha_desde, P.fecha_hasta, P.fecha_recepcion, P.id_tipopermiso, P.observacion, 
       P.id_jefeinmediato, 
       F.empleado_uid, F.persona_cedula, F.persona_nombres, F.persona_apellidos, 
       F.dependencia_nombre, F.categoria_cargo_descripcion, F.funcion_cargo_descripcion, 
       F.municipio_nombre, F.dependencia_codigonomina, F.dependencia_nombre_nomina, 
       F.cargo_codigo, F.cargo_denominacion
FROM permisos.permisos AS P       
INNER JOIN comunuptos.funcionario AS F ON F.empleado_uid LIKE id_funcionario 
  


/*
SELECT 
  FROM 
*/