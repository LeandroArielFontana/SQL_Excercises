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
SELECT nombre FROM producto;

#2 Lista los nombres y los precios de todos los productos de la tabla producto
SELECT nombre, precio FROM producto;

#3 Lista todas las columnas de la tabla producto
SELECT * FROM producto;

#4 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio * 0.9470, precio FROM producto;

#5 Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre AS "nombre de producto", precio * 0.9470 AS "euros", precio AS "dolares" FROM producto;

#6 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula
SELECT upper(nombre), precio FROM producto;

#7 Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula
SELECT lower(nombre), precio FROM producto;

#8 Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT nombre, upper(LEFT (nombre, 2)) FROM fabricante;

#9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio
SELECT nombre, round(precio) FROM producto;

#10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT nombre, round(precio) FROM producto;

#11 Lista el código de los fabricantes que tienen productos en la tabla producto
SELECT codigo_fabricante FROM producto;

#12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT codigo_fabricante FROM producto;

#13 Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

#14 Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

#15 Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;

#16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

#17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT * FROM fabricante WHERE codigo >= 4 LIMIT 2;

#18 Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

#19 Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

#20 Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

#21 Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre FROM producto WHERE precio <= 120;

#22 Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE precio >= 400;

#23 Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE NOT precio >= 400;

#24 Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT * FROM producto WHERE precio >= 80 AND precio <= 300;

#25 Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT * FROM producto WHERE precio BETWEEN 60 AND 200;

#26 Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT * FROM producto WHERE precio >= 200 AND codigo_fabricante = 6;

#27 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT * FROM producto WHERE codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

#28 Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT * FROM producto WHERE codigo_fabricante IN (1,3,5);

#29 Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT nombre, precio * 100 AS "centimos" FROM producto;

#30 Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT nombre FROM fabricante WHERE nombre LIKE "s%";

#31 Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT nombre FROM fabricante WHERE nombre LIKE "%e";

#32 Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT nombre FROM fabricante WHERE nombre LIKE "%w%";

#33 Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT nombre FROM fabricante WHERE length(nombre) = 4;

#34 Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT * FROM producto WHERE nombre LIKE "%portatil%";

#35 Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT * FROM producto WHERE nombre LIKE "%monitor%" AND precio <= 215;

#36 Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;

# CONSULTAS MULTITABLA (COMPOSICION INTERNA)

# - Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

#1 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo; 

#2 Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

#3 Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT p.codigo, p.nombre, p.codigo_fabricante, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

#4 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

#5 Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

#6 Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE "Lenovo");

#7 Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto p WHERE p.codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre LIKE "Crucial") AND p.precio >= 200;

#8 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy y Seagate. Sin utilizar el operador IN.
SELECT * FROM producto p 
WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE "Asus") 
OR p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE "Hewlett%")
OR p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE "Seagate");

#9 Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM producto p 
WHERE p.codigo_fabricante 
IN (
		(SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE "Asus"), 
		(SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE "Hewlett%"),
		(SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE "Seagate")
    );

#10 Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT p.nombre, p.precio FROM producto p WHERE p.codigo_fabricante IN (SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE "%e");

#11 Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT p.nombre, p.precio FROM producto p WHERE p.codigo_fabricante IN (SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE "%w%");

#12 Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT p.nombre, p.precio, f.nombre 
FROM producto p 
INNER JOIN fabricante f 
ON p.codigo_fabricante = f.codigo 
WHERE p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

#13 Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

# CONSULTAS MULTITABLA (COMPOSICION EXTERNA)

# - Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.

#1 Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

#2 Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;

# URL: https://josejuansanchez.org/bd/ejercicios-consultas-sql/index.html#ejercicios.-realizaci%C3%B3n-de-consultas-sql