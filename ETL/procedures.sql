use dbabusos;
DELIMITER $$
DROP PROCEDURE IF EXISTS listar_ciudades_anio_conteo$$
CREATE PROCEDURE listar_ciudades_anio_conteo()
BEGIN
  select 
		mp.municipio, year(fecha) as anio, 
		sum(cantAbusados) as conteo 
	from dbabusos.abuso as ab inner join dbabusos.municipio as mp 
    on ab.idMunicipio = mp.codDane 
    group by year(fecha), municipio 
    order by sum(cantAbusados) desc;
END
$$
DELIMITER $$
DROP PROCEDURE IF EXISTS listar_anio_conteo$$
CREATE PROCEDURE lista_anio_conteo()
BEGIN
  select 
		mp.municipio, year(fecha) as anio, 
		sum(cantAbusados) as conteo 
	from dbabusos.abuso as ab inner join dbabusos.municipio as mp 
    on ab.idMunicipio = mp.codDane 
    group by year(fecha), municipio 
    order by sum(cantAbusados) desc;
END
$$