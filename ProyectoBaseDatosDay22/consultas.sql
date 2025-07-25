


INSERT INTO estudiantes (rut, nombres, apellidos, fecha_nacimiento, direccion, telefono, email) VALUES
-- Estudiantes básica
('20256897-7', 'Martina', 'Remi Torrealba', '2017-04-15', 'Av. Carrascal 1234, Santiago', '+56987654666', 'martina.remi@gmail.com');



INSERT INTO matriculas (estudiante_id, curso_id, fecha_matricula, estado, observaciones) VALUES
-- 1° Básico A
(21, 9, '2017-04-15', 'activo', 'Matrícula regular');


INSERT INTO docentes (rut, nombres, apellidos, especialidad, telefono, email, fecha_contratacion, estado) VALUES
('15989765-9', 'Marta Eva', 'González Perez', 'Educación Básica', '+56912345777', 'marta.eva@colegiosanmartin.cl', '2020-03-01', 'activo');



INSERT INTO asignaturas (codigo, nombre, descripcion, horas_semanales, tipo, activa)
    VALUES ('TEC', 'Tecnología', 'Uso de herramientas tecnológicas y pensamiento computacional', 2,
     'obligatoria', TRUE);


INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
(1, 1, 'Prueba Unidad 1: Introducción a la Informática', 'Evaluación sobre conceptos básicos', '2024-08-15', 30.00);


INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones)
    VALUES (38, 1, 6.8, 'Nota actualizada tras revisión.');

INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(35, 2, 6.5, 'Reconoce la mayoría de los conceptos tecnicos');
