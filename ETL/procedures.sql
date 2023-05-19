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
CREATE PROCEDURE listar_anio_conteo()
BEGIN
  select 
		convert(concat(year(fecha),'.' ,month(fecha)), decimal(5,1)) as anio, 
		sum(cantAbusados) as conteo 
	from dbabusos.abuso as ab 
    group by convert(concat(year(fecha),'.' ,month(fecha)), decimal(5,1)) 
    order by sum(cantAbusados) desc;
END
$$
DELIMITER $$
DROP PROCEDURE IF EXISTS listar_generos_conteo$$
CREATE PROCEDURE listar_generos_conteo()
BEGIN
	SELECT genero, sum(cantAbusados) as cant FROM genero as gn, abuso as ab where gn.idGenero = ab.idGenero group by genero;
END
$$
DELIMITER $$
DROP PROCEDURE IF EXISTS listar_armas_anio_conteo$$
CREATE PROCEDURE listar_armas_anio_conteo()
BEGIN
	SELECT arma,  year(fecha) as anio, sum(cantAbusados) as cant FROM usoarmas as am, abuso as ab where am.idusoArmas = ab.idArma group by arma, year(fecha);
END
$$