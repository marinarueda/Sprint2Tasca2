USE tienda;
/*1*/SELECT nombre FROM producto;
/*2*/SELECT nombre, precio FROM producto;
/*3*/SELECT * FROM producto;
/*4*/SELECT nombre, precio, precio*1.2 AS precio_usd FROM producto;
/*5*/SELECT nombre AS alias, precio AS euros, precio*1.2 AS dolars FROM producto;
/*6*/SELECT UPPER(nombre) AS nombre, precio FROM producto;
/*7*/SELECT LOWER(nombre) AS nombre, precio FROM producto;
/*8*/SELECT nombre AS nombre, UPPER(SUBSTR(nombre, 1, 2)) AS dosiniciales FROM fabricante;
/*9*/SELECT nombre AS nombre, ROUND(precio, 2) AS redondeo FROM producto;
/*10*/SELECT nombre AS nombre, TRUNCATE(precio, 0) AS precio_truncado FROM producto;
/*11*/SELECT fabricante.codigo FROM fabricante JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
/*12*/SELECT DISTINCT codigo_fabricante FROM producto;
/*13*/SELECT nombre FROM fabricante ORDER BY nombre ASC;
/*14*/SELECT nombre FROM fabricante ORDER BY nombre DESC;
/*15*/SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
/*16*/SELECT * FROM fabricante LIMIT 5;
/*17*/SELECT * FROM fabricante LIMIT 3, 2;
/*18*/SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;








USE universidad;
/*1*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
/*2*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
/*3*/SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'ORDER BY apellido1, apellido2, nombre;
/*4*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'profesor' AND persona.telefono IS NULL AND persona.nif LIKE '%K';
/*5*/SELECT asignatura.nombre FROM asignatura WHERE asignatura.id = 7 AND asignatura.curso = 3 AND asignatura.cuatrimestre = 1;
/*6*/SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS nombre_departamento FROM persona JOIN profesor ON persona.nif = persona.nif JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre;





















