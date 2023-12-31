use tienda;
select nombre from producto;
select nombre, precio from producto;
select * from producto;
select nombre, concat('€', format(precio, 2, 'sp_SP')), concat('$', format(precio * 1.07, 2, 'en_US')) from producto;
select nombre as 'Nombre de producto', concat('€', format(precio, 2, 'sp_SP')) as 'Euros', concat('$', format(precio * 1.07, 2, 'en_US')) as 'Dólares' from producto;
select upper(nombre), precio from producto;
select lower(nombre), precio from producto;
select nombre, upper(substr(nombre, 1, 2)) from fabricante;
select nombre, round(precio) from producto;
select nombre, format(precio, 0) from producto;
select codigo_fabricante from producto;
select distinct codigo_fabricante from producto;
select nombre from fabricante order by nombre;
select nombre from fabricante order by nombre desc;
select nombre, precio from producto order by nombre asc, precio desc;
select * from fabricante limit 5;
select * from fabricante where codigo > 3 limit 2;
select nombre, precio from producto order by precio asc limit 1;
select nombre, precio from producto order by precio desc limit 1;
select nombre from producto where codigo_fabricante = 2;
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo; -- producto.precio no es necesario ya que no es ambiguo
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo order by fabricante.nombre;
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo;
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo order by producto.precio limit 1;
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo order by producto.precio desc limit 1;
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre='Lenovo';
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre='Crucial' and producto.precio > 200;
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre = 'Asus' or fabricante.nombre = 'Hewlett-Packard' or fabricante.nombre = 'Seagate';
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');
select nombre, precio from producto where nombre like '%e';
select producto.nombre, precio from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like '%w%';
select producto.nombre, precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo where producto.precio >= 180 order by precio desc, producto.nombre asc; -- No tiene sentido ordenar por nombre, ya que el precio es primordial y en este caso es diferencial
select codigo, nombre from fabricante where exists (select * from producto where producto.codigo_fabricante = fabricante.codigo); -- select no importa porque la orden esta en la relacion (exists >> codigo)
select * from fabricante left join producto on fabricante.codigo=producto.codigo_fabricante;
select * from fabricante left join producto on fabricante.codigo=producto.codigo_fabricante where producto.nombre is null;
select nombre from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo');
select * from producto where precio = (select max(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));
select nombre from producto where precio = (select max(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));
select nombre from producto where precio = (select min(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Hewlett-Packard'));
select nombre from producto where precio >= (select max(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Lenovo'));
select nombre from producto where precio > (select avg(precio) from producto where codigo_fabricante = (select codigo from fabricante where nombre = 'Asus'));