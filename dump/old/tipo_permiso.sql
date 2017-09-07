SELECT 
	id_tipopermiso, 
	tipo_permiso, 
	CASE WHEN tipo_permiso=1 THEN 'Obligatorio'
	     WHEN tipo_permiso=2 THEN 'Postestativo'
	END AS tipo_permiso_txt,  
	nombre_tipo, 
	numero_dias, 
	reglas_legal, 
	recaudos, 
	id_tipo_personal, 
	CASE WHEN id_tipo_personal=1 THEN 'Administrativo'
	     WHEN id_tipo_personal=2 THEN 'Docente'
	     WHEN id_tipo_personal=3 THEN 'Obrero'
	END AS tipo_permiso_txt,
	fecha_registro, 
	estatus
  FROM permisos.tipo_permiso
  ORDER BY estatus DESC, id_tipo_personal, tipo_permiso;
