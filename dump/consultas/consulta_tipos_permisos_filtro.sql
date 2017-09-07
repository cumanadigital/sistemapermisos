SELECT 	id_tipopermiso, 
	tipo_permiso, 
	CASE 	WHEN tipo_permiso=1 THEN 'Obligatorio'
		WHEN tipo_permiso=2 THEN 'Postestativo'
	END AS tipo_permiso_txt,  
	nombre_tipo, 
	numero_dias, 
	--cast(numero_dias as int) as ndias,
	reglas_legal, 
	recaudos, 
	id_tipo_personal, 
	CASE 	WHEN id_tipo_personal=1 THEN 'Administrativo'
		WHEN id_tipo_personal=2 THEN 'Docente'
		WHEN id_tipo_personal=3 THEN 'Obrero'
	END AS id_tipo_personal_txt,
	fecha_registro, 
	estatus 
FROM permisos.tipo_permiso
WHERE id_tipo_personal IN ('1','2','3') 
AND estatus LIKE '1'
AND (
numero_dias IN ('xxC','xxH') -- PERMISOS CORTOS
OR numero_dias IN ('1C','2C','3C','1H','2H','3H') -- PERMISOS CORTOS 

OR numero_dias IN ('4C','5C','6C','7C','8C','9C','10C','11C','12C','13C','14C','15C') --PERMISOS MEDIOS
OR numero_dias IN ('4H','5H','6H','7H','8H','9H','10H','11H','12H','13H','14H','15H') --PERMISOS MEDIOS

OR numero_dias IN ('16C','17C','18C','19C','20C','21C','22C','23C','24C','25C','26C','27C','28C','29C','30C') --PERMISOS LARGOS
OR numero_dias IN ('16H','17H','18H','19H','20H','21H','22H','23H','24H','25H','26H','27H','28H','29H','30H') --PERMISOS LARGOS
)
ORDER BY numero_dias ;