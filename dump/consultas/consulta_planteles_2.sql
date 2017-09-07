select * from ( 
	(SELECT pl_estadistico,
			pl_nombre,
			pl_coddea,
			cast( pl_municipio as  int)as  pl_municipio,
			UPPER(municipio_nombre) AS municipio_nombre
		FROM comun.planteles
		LEFT JOIN comun.municipio ON( CAST(municipio_codigo AS INT) = CAST(pl_municipio AS INT) )  
		WHERE pl_coddea = 'ZE_INTERNA'
		order by   pl_nombre 
	)
union(
	SELECT dependencia_uid AS pl_estadistico,
	dependencia_nombre AS pl_nombre ,
	dependencia_codigonomina AS pl_coddea ,
	dependencia_municipio AS pl_municipio,
	UPPER(municipio_nombre) AS municipio_nombre
	FROM comun.dependencia
	LEFT JOIN comun.municipio ON( CAST(municipio_codigo AS INT) = CAST(dependencia_municipio AS INT) )
	where (  dependencia_codigonomina like '0020%' or dependencia_codigonomina like '001%')
	     and dependencia_codigonomina   <> '002071847' and   dependencia_codigonomina <> '002071837' 
	     and dependencia_codigonomina   <> '002071857' and   dependencia_codigonomina <> '002071837' 
	     and dependencia_codigonomina   <> '002071827' and   dependencia_codigonomina <> '001200489' 
	     and dependencia_codigonomina   <> '001200487' and  dependencia_codigonomina <> '001200480'
	order by dependencia_nombre--dependencia_codigonomina
	) 
) as alias order by  alias.pl_nombre