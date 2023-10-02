use universidad;
					-- PRIMERAS CONSULTAS --
select apellido1, apellido2, nombre from persona order by apellido1, apellido2, nombre;
select nombre, apellido1, apellido2 from persona where telefono is null;
select * from persona where fecha_nacimiento like '1999-%';
select * from persona inner join profesor on profesor.id_profesor=persona.id where persona.telefono is null and persona.nif like '%K';
select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
select apellido1, apellido2, nombre, profesor.id_departamento from persona inner join profesor on persona.id=profesor.id_profesor order by apellido1, apellido2, nombre;
select a.nombre, ce.anyo_inicio, ce.anyo_fin from alumno_se_matricula_asignatura aa join curso_escolar ce on aa.id_curso_escolar=ce.id join asignatura a on aa.id_asignatura=a.id join persona p on aa.id_alumno=p.id where p.nif = '26902806M';
select distinct d.nombre as Departamento, a.nombre as Asignatura, g.nombre as Grado from asignatura a right join grado g on a.id_grado=g.id left join profesor p on a.id_profesor=p.id_profesor right join departamento d on p.id_departamento=d.id where g.nombre like '%Infor%';
select distinct p.nombre, ce.anyo_inicio from alumno_se_matricula_asignatura aa join asignatura a on aa.id_asignatura=a.id join curso_escolar ce on aa.id_curso_escolar=ce.id join persona p on p.id=aa.id_alumno where ce.anyo_inicio = 2018;
					-- LEFT & RIGHT JOINS --
select d.nombre as Departamento, pe.apellido1 as Apellido1, pe.apellido2 as Apellido2, pe.nombre as Nombre from departamento d right join profesor p on p.id_departamento=d.id right join persona pe on p.id_profesor=pe.id order by departamento, apellido1, apellido2, nombre;
select d.nombre as Departamento, pe.apellido1 as Apellido1, pe.apellido2 as Apellido2, pe.nombre as Nombre from departamento d right join profesor p on p.id_departamento=d.id right join persona pe on p.id_profesor=pe.id where d.nombre is null;
select d.nombre, d.id as Departamento from departamento d left join profesor p on p.id_departamento=d.id where p.id_profesor is null;
select pe.nombre, pe.apellido1 as Nombre, a.nombre as Asignatura from persona pe left join profesor p on p.id_profesor=pe.id left join asignatura a on a.id_profesor=p.id_profesor where a.nombre is null order by pe.nombre;
select a.nombre as Asignatura, p.id_profesor from asignatura a left join profesor p on a.id_profesor=p.id_profesor where p.id_profesor is null;
select distinct d.nombre as Departamento, ce.id as Curso_Escolar from alumno_se_matricula_asignatura aa right join asignatura a on aa.id_asignatura=a.id right join curso_escolar ce on aa.id_curso_escolar=ce.id right join profesor p on a.id_profesor=p.id_profesor right join departamento d on p.id_departamento=d.id where ce.id is null;
					-- RESUMEN --
select count(nombre) from persona where tipo = 'alumno';
select count(fecha_nacimiento) from persona where fecha_nacimiento like '1999%' and tipo = 'alumno';
select d.nombre, count(p.id_profesor) from departamento d right join profesor p on p.id_departamento=d.id group by d.id order by count(p.id_profesor) desc;
select d.nombre, count(p.id_profesor) from departamento d left join profesor p on p.id_departamento=d.id group by d.id;
select g.nombre as 'Grado', count(a.nombre) as 'Asignaturas' from asignatura a right join grado g on a.id_grado=g.id group by g.id order by count(a.nombre) desc;
select g.nombre as 'Grado', count(a.nombre) as 'Asignaturas' from asignatura a right join grado g on a.id_grado=g.id group by g.id having count(a.id) > 40;
select g.nombre, a.tipo, sum(a.creditos) as 'Suma' from asignatura a join grado g on a.id_grado=g.id group by g.id, a.tipo;
select ce.anyo_inicio, count(aa.id_alumno) as 'Alumnos_Matriculados' from alumno_se_matricula_asignatura aa join curso_escolar ce on aa.id_curso_escolar=ce.id group by ce.anyo_inicio;
select p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, count(a.id_profesor) as 'Numero_Asignaturas' from asignatura a right join profesor p on a.id_profesor=p.id_profesor join persona pe on p.id_profesor=pe.id group by p.id_profesor order by count(p.id_profesor) desc;
select * from persona where tipo = 'alumno' order by fecha_nacimiento desc limit 1;
select pe.nombre, p.id_profesor, d.nombre, a.nombre as 'Asignatura' from profesor p join persona pe on p.id_profesor=pe.id join departamento d on p.id_departamento=d.id left join asignatura a on a.id_profesor=p.id_profesor where a.nombre is null;