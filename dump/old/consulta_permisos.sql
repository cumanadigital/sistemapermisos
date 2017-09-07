SELECT 
  vacaciones.id_periodo
FROM 
  permisos.denuncia_seguimiento, 
  permisos.denuncias_ausencias, 
  permisos.dias_feriados, 
  permisos.periodo, 
  permisos.permisos, 
  permisos.tipo_permiso, 
  permisos.vacaciones, 
  comunuptos.funcionario
WHERE 
  denuncia_seguimiento.id_denuncia = denuncias_ausencias.id_denuncia AND
  permisos.id_tipopermiso = tipo_permiso.id_tipopermiso AND
  vacaciones.id_periodo = periodo.id_periodo AND
  funcionario.empleado_uid = permisos.id_funcionario;
