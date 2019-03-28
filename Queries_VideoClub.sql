
--Cuál es la película más popular por semana, mes y año?

select count (*)as cantidad, p.id_pelicula,  a.fecha_alquiler  from pelicula as p
	inner join casete as c on p.id_pelicula=c.id_pelicula
	inner join alquiler as a on a.id_casete=c.id_casete
	group by p.id_pelicula, a.fecha_alquiler 
	having a.fecha_alquiler >= to_date('20190321','YYYYMMDD')and  a.fecha_alquiler <= to_date('20190325','YYYYMMDD');

--Cuál es la película más popular por mes?

select count (*)as cantidad, p.id_pelicula,  a.fecha_alquiler  from pelicula as p
	inner join casete as c on p.id_pelicula=c.id_pelicula
	inner join alquiler as a on a.id_casete=c.id_casete
	group by p.id_pelicula, a.fecha_alquiler 
	having a.fecha_alquiler >= to_date('20190301','YYYYMMDD')and  a.fecha_alquiler <= to_date('20190331','YYYYMMDD');

--Cuál es la película más popular por año?
select count (*)as cantidad, p.id_pelicula,  a.fecha_alquiler  from pelicula as p
	inner join casete as c on p.id_pelicula=c.id_pelicula
	inner join alquiler as a on a.id_casete=c.id_casete
	group by p.id_pelicula, a.fecha_alquiler 
	having a.fecha_alquiler >= to_date('20180301','YYYYMMDD')and  a.fecha_alquiler <= to_date('20190331','YYYYMMDD');

--Cuáles son las 5 películas menos populares?
select count (*)as cantidad, p.id_pelicula from pelicula as p
	inner join casete as c on p.id_pelicula=c.id_pelicula
	inner join alquiler as a on a.id_casete=c.id_casete
	group by p.id_pelicula 
	order by cantidad asc 
	limit 5

--Cuál actor aparece en más películas?
    select count(*)as cantidad, r.id_actor , a.nombre_real from reparto as r
	inner join pelicula as p on p.id_pelicula= r.id_pelicula
	inner join actor as a on a.id_actor=r.id_actor
	group by r.id_actor , a.nombre_real
	order by cantidad desc
	limit 1;

--Cuál es la categoría de películas más solicitada?
select count(*)as cantidad, p.categoria from pelicula as p
	inner join casete as c on p.id_pelicula=c.id_pelicula
	inner join alquiler as a on a.id_casete=c.id_casete
	group by p.categoria 
	order by cantidad desc
	limit 1
        
--Cuál es el usuario que ha alquilado más películas? Cuál menos?
select  count (*)as cantidad,m.id_miembro from alquiler as a 
	inner join miembros m on m.id_miembro=a.id_miembro
	group by m.id_miembro
	order by cantidad desc    