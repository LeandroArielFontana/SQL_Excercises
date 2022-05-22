DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

# CONSULTAS SOBRE UNA TABLA

#1 Lista el nombre de todos los productos que hay en la tabla producto
select nombre from producto;

#2 Lista los nombres y los precios de todos los productos de la tabla producto
select nombre, precio from producto;

#3 Lista todas las columnas de la tabla producto
select * from producto;

#4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre, precio * 0.9470, precio from producto;

#5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre as "nombre de producto", precio * 0.9470 as "euros", precio as "dolares" from producto;

#6 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula
select upper(nombre), precio from producto;

#7 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula
select lower(nombre), precio from producto;

#8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre, upper(left (nombre, 2)) from fabricante;

#9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio
select nombre, round(precio) from producto;

#10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, round(precio) from producto;

#11 Lista el código de los fabricantes que tienen productos en la tabla producto
select codigo_fabricante from producto;

#12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
select distinct codigo_fabricante from producto;

#13 Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre asc;

#14 Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;

#15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre from producto order by nombre asc, precio desc;

#16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;

#17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * from fabricante where codigo >= 4 limit 2;

#18 Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio asc limit 1;

#19 Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select nombre, precio from producto order by precio desc limit 1;

#20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
select nombre from producto where codigo_fabricante = 2;

#21 Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre from producto where precio <= 120;

#22 Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre from producto where precio >= 400;

#23 Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
select nombre from producto where not precio >= 400;

#24 Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select * from producto where precio >= 80 and precio <= 300;

#25 Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select * from producto where precio between 60 and 200;

#26 Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
select * from producto where precio >= 200 and codigo_fabricante = 6;

#27 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * from producto where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5;

#28 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from producto where codigo_fabricante in (1,3,5);

#29 Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio * 100 as "centimos" from producto;

#30 Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante where nombre like "s%";

#31 Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante where nombre like "%e";

#32 Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where nombre like "%w%";

#33 Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where length(nombre) = 4;

#34 Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select * from producto where nombre like "%portatil%";

#35 Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select * from producto where nombre like "%monitor%" and precio <= 215;

#36 Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre, precio from producto where precio >= 180 order by precio desc, nombre asc;

# CONSULTAS MULTITABLA (COMPOSICION INTERNA)

# - Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

#1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
#2 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
#3 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
#4 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.

#5 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.

#6 Devuelve una lista de todos los productos del fabricante Lenovo.

#7 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.

#8 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.

#9 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.

#10 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.

#11 Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.

#12 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)

#13 Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.

# CONSULTAS MULTITABLA (COMPOSICION EXTERNA)

# - Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

#1 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
#2 Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
#3 ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

# CONSULTAS RESUMEN

# SUBCONSULTAS (EN LA CLAUSULA WHERE)
























