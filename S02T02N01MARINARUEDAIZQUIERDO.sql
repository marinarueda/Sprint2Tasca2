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
/*19*/SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
/*20*/SELECT nombre FROM producto WHERE codigo = 2;

USE universidad;
/*1*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre;
/*2*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
/*3*/SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'ORDER BY apellido1, apellido2, nombre;
/*4*/SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'profesor' AND persona.telefono IS NULL AND persona.nif LIKE '%K';
/*5*/SELECT asignatura.nombre FROM asignatura WHERE asignatura.id = 7 AND asignatura.curso = 3 AND asignatura.cuatrimestre = 1;
/*6*/SELECT DISTINCT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS nombre_departamento FROM persona JOIN profesor ON persona.nif = persona.nif JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre;
/*7*/SELECT DISTINCT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona JOIN alumno_se_matricula_asignatura ON persona.nif = persona.nif JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id WHERE persona.nif = '26902806M';
/*8*/SELECT DISTINCT departamento.nombre FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
/*9*/SELECT DISTINCT persona.nombre, persona.apellido1, persona.apellido2 FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 AND tipo = 'alumno';
/*Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.*/
/*1*/SELECT departamento.nombre AS nombre_departamento, persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN departamento ON persona.id = departamento.id WHERE persona.tipo = 'profesor' ORDER BY nombre_departamento, persona.apellido1, persona.apellido2, persona.nombre;
/*2*/SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona LEFT JOIN departamento ON persona.id = departamento.id WHERE persona.tipo = 'profesor' AND departamento.id IS NULL;
/*3*/SELECT departamento.nombre AS nombre_departamento FROM departamento LEFT JOIN persona ON departamento.id = persona.id WHERE persona.id IS NULL;
/*4*/SELECT persona.apellido1, persona.apellido2, persona.nombre FROM asignatura RIGHT JOIN persona ON asignatura.id_profesor = persona.id WHERE asignatura.id_profesor IS NULL AND persona.tipo = 'profesor';
/*5*/SELECT DISTINCT asignatura.nombre FROM asignatura RIGHT JOIN persona ON persona.id = asignatura.id_profesor WHERE persona.id IS NULL AND persona.tipo = 'profesor';
/*6*/SELECT departamento.nombre AS nombre_departamento FROM departamento LEFT JOIN asignatura ON departamento.id = asignatura.id LEFT JOIN curso_escolar ON asignatura.id = curso_escolar.id WHERE asignatura.curso IS NULL;
/*Consultes resum:*/
/*1*/SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';
/*2*/SELECT COUNT(*) AS total_alumnos_1999 FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
/*3*/SELECT departamento.nombre AS nombre_departamento, COUNT(persona.id) AS numero_profesores FROM departamento LEFT JOIN persona ON departamento.id = persona.id AND persona.tipo = 'profesor' WHERE persona.id IS NOT NULL GROUP BY departamento.nombre ORDER BY numero_profesores DESC;
/*4*/SELECT departamento.nombre AS nombre_departamento, persona.nombre AS nombre_profesor FROM departamento LEFT JOIN persona ON departamento.id = persona.id AND persona.tipo = 'profesor' ORDER BY departamento.nombre;
/*5*/SELECT grado.nombre AS nombre_grado, COUNT(asignatura.id) AS numero_asignaturas FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY numero_asignaturas DESC;






























