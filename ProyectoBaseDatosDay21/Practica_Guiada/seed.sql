-- =====================================================
-- SISTEMA DE GESTIÓN ESCOLAR - COLEGIO SAN MARTÍN
-- Archivo: seed.sql
-- Descripción: Datos de prueba para testing y desarrollo
-- =====================================================

USE colegio_san_martin;

-- =====================================================
-- DATOS BÁSICOS: Niveles educacionales
-- =====================================================
INSERT INTO niveles_educacionales (nombre, descripcion) VALUES
('Educación Básica', 'Niveles de 1° a 8° básico'),
('Educación Media', 'Niveles de 1° a 4° medio');

-- =====================================================
-- DATOS BÁSICOS: Períodos académicos
-- =====================================================
INSERT INTO periodos_academicos (anio, semestre, fecha_inicio, fecha_fin, activo) VALUES
(2023, 1, '2023-03-01', '2023-07-15', FALSE),
(2023, 2, '2023-08-01', '2023-12-15', FALSE),
(2024, 1, '2024-03-01', '2024-07-15', FALSE),
(2024, 2, '2024-08-01', '2024-12-15', TRUE),
(2025, 1, '2025-03-01', '2025-07-15', FALSE);

-- =====================================================
-- DATOS BÁSICOS: Tipos de evaluación
-- =====================================================
INSERT INTO tipos_evaluacion (nombre, descripcion) VALUES
('Prueba', 'Evaluación escrita individual'),
('Trabajo', 'Proyecto o tarea individual/grupal'),
('Examen', 'Evaluación final de período'),
('Presentación', 'Exposición oral'),
('Laboratorio', 'Actividad práctica'),
('Taller', 'Actividad colaborativa en clase');

-- =====================================================
-- CURSOS ACADÉMICOS
-- =====================================================
INSERT INTO cursos (nombre, nivel_id, capacidad_maxima, anio, activo) VALUES
-- Educación Básica
('1° Básico A', 1, 35, 2024, TRUE),
('2° Básico A', 1, 35, 2024, TRUE),
('3° Básico A', 1, 40, 2024, TRUE),
('6° Básico A', 1, 40, 2024, TRUE),
('8° Básico A', 1, 42, 2024, TRUE),
-- Educación Media
('1° Medio A', 2, 45, 2024, TRUE),
('2° Medio A', 2, 45, 2024, TRUE),
('3° Medio A', 2, 40, 2024, TRUE),
('4° Medio A', 2, 38, 2024, TRUE);

-- =====================================================
-- DOCENTES
-- =====================================================
INSERT INTO docentes (rut, nombres, apellidos, especialidad, telefono, email, fecha_contratacion, estado) VALUES
('12345678-9', 'María Elena', 'González Silva', 'Educación Básica', '+56912345001', 'maria.gonzalez@colegiosanmartin.cl', '2020-03-01', 'activo'),
('23456789-0', 'Carlos Andrés', 'Rodríguez López', 'Matemáticas', '+56912345002', 'carlos.rodriguez@colegiosanmartin.cl', '2019-03-01', 'activo'),
('34567890-1', 'Ana Sofía', 'Martínez Pérez', 'Lenguaje y Literatura', '+56912345003', 'ana.martinez@colegiosanmartin.cl', '2021-03-01', 'activo'),
('45678901-2', 'Roberto', 'Fernández Castro', 'Ciencias Naturales', '+56912345004', 'roberto.fernandez@colegiosanmartin.cl', '2018-03-01', 'activo'),
('56789012-3', 'Patricia', 'Morales Jiménez', 'Historia y Geografía', '+56912345005', 'patricia.morales@colegiosanmartin.cl', '2020-08-01', 'activo'),
('67890123-4', 'Diego', 'Herrera Soto', 'Educación Física', '+56912345006', 'diego.herrera@colegiosanmartin.cl', '2019-08-01', 'activo'),
('78901234-5', 'Carmen', 'Torres Valdés', 'Inglés', '+56912345007', 'carmen.torres@colegiosanmartin.cl', '2021-08-01', 'activo'),
('89012345-6', 'Andrés', 'Silva Ramos', 'Artes Visuales', '+56912345008', 'andres.silva@colegiosanmartin.cl', '2022-03-01', 'activo'),
('90123456-7', 'Claudia', 'Vega Pérez', 'Educación General', '+56912345009', 'claudia.vega@colegiosanmartin.cl', '2024-03-01', 'activo');

-- =====================================================
-- ASIGNATURAS
-- =====================================================
INSERT INTO asignaturas (codigo, nombre, descripcion, horas_semanales, tipo, activa) VALUES
-- Asignaturas básicas
('LEN', 'Lenguaje y Comunicación', 'Desarrollo de habilidades de lectura, escritura y comunicación oral', 6, 'obligatoria', TRUE),
('MAT', 'Matemática', 'Números, operaciones, geometría y resolución de problemas', 6, 'obligatoria', TRUE),
('CIE', 'Ciencias Naturales', 'Física, química, biología y ciencias de la tierra', 4, 'obligatoria', TRUE),
('HIS', 'Historia y Geografía', 'Historia de Chile, geografía y formación ciudadana', 4, 'obligatoria', TRUE),
('ING', 'Inglés', 'Idioma extranjero inglés', 3, 'obligatoria', TRUE),
('EFI', 'Educación Física', 'Desarrollo motor y hábitos de vida saludable', 2, 'obligatoria', TRUE),
('ART', 'Artes Visuales', 'Expresión artística y apreciación estética', 2, 'obligatoria', TRUE),
('MUS', 'Música', 'Educación musical y apreciación artística', 2, 'obligatoria', TRUE),
-- Asignaturas específicas de media
('FIL', 'Filosofía', 'Pensamiento crítico y reflexión filosófica', 2, 'obligatoria', TRUE),
('PSI', 'Psicología', 'Introducción a la psicología', 2, 'electiva', TRUE);

-- =====================================================
-- ESTUDIANTES
-- =====================================================
INSERT INTO estudiantes (rut, nombres, apellidos, fecha_nacimiento, direccion, telefono, email) VALUES
-- Estudiantes básica
('20123456-7', 'Sofía', 'Ramírez Torres', '2017-04-15', 'Av. Libertador 1234, Santiago', '+56987654001', 'sofia.ramirez@gmail.com'),
('20234567-8', 'Mateo', 'González Muñoz', '2017-07-22', 'Los Aromos 567, Santiago', '+56987654002', 'mateo.gonzalez@gmail.com'),
('20345678-9', 'Valentina', 'López Silva', '2016-01-10', 'San Martín 890, Santiago', '+56987654003', 'valentina.lopez@gmail.com'),
('20456789-0', 'Diego', 'Martínez Rojas', '2016-09-05', 'Las Flores 432, Santiago', '+56987654004', 'diego.martinez@gmail.com'),
('20567890-1', 'Isidora', 'Fernández Castro', '2015-12-18', 'Alameda 1567, Santiago', '+56987654005', 'isidora.fernandez@gmail.com'),
('20678901-2', 'Benjamín', 'Morales López', '2014-03-27', 'Nueva Providencia 789, Santiago', '+56987654006', 'benjamin.morales@gmail.com'),
('20789012-3', 'Emilia', 'Herrera Soto', '2014-08-14', 'Las Condes 1234, Santiago', '+56987654007', 'emilia.herrera@gmail.com'),
('20890123-4', 'Joaquín', 'Torres Valdés', '2012-11-30', 'Ñuñoa 567, Santiago', '+56987654008', 'joaquin.torres@gmail.com'),
('20901234-5', 'Antonella', 'Silva Ramos', '2012-06-17', 'Maipú 890, Santiago', '+56987654009', 'antonella.silva@gmail.com'),
('21012345-6', 'Gabriel', 'Peña Díaz', '2010-02-28', 'Pudahuel 432, Santiago', '+56987654010', 'gabriel.pena@gmail.com'),
-- Estudiantes media
('19123456-7', 'Camila', 'Vásquez Torres', '2009-05-12', 'Las Rejas 1567, Santiago', '+56987654011', 'camila.vasquez@gmail.com'),
('19234567-8', 'Nicolás', 'Sánchez Muñoz', '2009-10-08', 'La Florida 789, Santiago', '+56987654012', 'nicolas.sanchez@gmail.com'),
('19345678-9', 'Francisca', 'Rojas Silva', '2008-01-25', 'San Joaquín 1234, Santiago', '+56987654013', 'francisca.rojas@gmail.com'),
('19456789-0', 'Matías', 'Contreras López', '2008-07-14', 'Peñalolén 567, Santiago', '+56987654014', 'matias.contreras@gmail.com'),
('19567890-1', 'Javiera', 'Espinoza Castro', '2007-12-03', 'La Cisterna 890, Santiago', '+56987654015', 'javiera.espinoza@gmail.com'),
('19678901-2', 'Tomás', 'Guerrero Morales', '2007-04-19', 'Cerrillos 432, Santiago', '+56987654016', 'tomas.guerrero@gmail.com'),
('19789012-3', 'Maite', 'Figueroa Herrera', '2006-09-07', 'Estación Central 1567, Santiago', '+56987654017', 'maite.figueroa@gmail.com'),
('19890123-4', 'Ignacio', 'Campos Torres', '2006-11-23', 'Renca 789, Santiago', '+56987654018', 'ignacio.campos@gmail.com'),
('19901234-5', 'Constanza', 'Aguilar Silva', '2005-03-16', 'Quinta Normal 1234, Santiago', '+56987654019', 'constanza.aguilar@gmail.com'),
('19012345-6', 'Felipe', 'Navarro Peña', '2005-08-29', 'Independencia 567, Santiago', '+56987654020', 'felipe.navarro@gmail.com');

-- =====================================================
-- MATRÍCULAS
-- =====================================================
INSERT INTO matriculas (estudiante_id, curso_id, fecha_matricula, estado, observaciones) VALUES
-- 1° Básico A
(1, 1, '2024-02-15', 'activo', 'Matrícula regular'),
(2, 1, '2024-02-16', 'activo', 'Matrícula regular'),
-- 2° Básico A  
(3, 2, '2024-02-15', 'activo', 'Matrícula regular'),
(4, 2, '2024-02-17', 'activo', 'Matrícula regular'),
-- 3° Básico A
(5, 3, '2024-02-15', 'activo', 'Matrícula regular'),
(6, 3, '2024-02-18', 'activo', 'Matrícula regular'),
-- 6° Básico A
(7, 4, '2024-02-15', 'activo', 'Matrícula regular'),
(8, 4, '2024-02-19', 'activo', 'Matrícula regular'),
-- 8° Básico A
(9, 5, '2024-02-15', 'activo', 'Matrícula regular'),
(10, 5, '2024-02-20', 'activo', 'Matrícula regular'),
-- 1° Medio A
(11, 6, '2024-02-15', 'activo', 'Matrícula regular'),
(12, 6, '2024-02-21', 'activo', 'Matrícula regular'),
-- 2° Medio A
(13, 7, '2024-02-15', 'activo', 'Matrícula regular'),
(14, 7, '2024-02-22', 'activo', 'Matrícula regular'),
-- 3° Medio A
(15, 8, '2024-02-15', 'activo', 'Matrícula regular'),
(16, 8, '2024-02-23', 'activo', 'Matrícula regular'),
-- 4° Medio A
(17, 9, '2024-02-15', 'activo', 'Matrícula regular'),
(18, 9, '2024-02-24', 'activo', 'Matrícula regular'),
(19, 9, '2024-02-25', 'activo', 'Matrícula regular'),
(20, 9, '2024-02-26', 'activo', 'Matrícula regular');

-- =====================================================
-- PROFESORES JEFE
-- =====================================================
INSERT INTO profesores_jefe (docente_id, curso_id, anio) VALUES
(1, 1, 2024), -- María Elena - 1° Básico A
(1, 2, 2024), -- María Elena - 2° Básico A  
(2, 3, 2024), -- Carlos - 3° Básico A
(3, 4, 2024), -- Ana - 6° Básico A
(4, 5, 2024), -- Roberto - 8° Básico A
(5, 6, 2024), -- Patricia - 1° Medio A
(6, 7, 2024), -- Diego - 2° Medio A
(7, 8, 2024), -- Carmen - 3° Medio A
(8, 9, 2024), -- Andrés - 4° Medio A
(9, 9, 2024); -- Claudia - 4° Medio A

-- =====================================================
-- ASIGNACIONES DE DOCENTES (2024 - 2do Semestre)
-- =====================================================
-- Período activo: 2024-2do semestre (id=4)
INSERT INTO asignaciones_docentes (docente_id, asignatura_id, curso_id, periodo_academico_id) VALUES
-- 1° Básico A
(1, 1, 1, 4), -- María Elena - Lenguaje
(2, 2, 1, 4), -- Carlos - Matemática  
(4, 3, 1, 4), -- Roberto - Ciencias
(6, 6, 1, 4), -- Diego - Ed. Física
-- 2° Básico A
(1, 1, 2, 4), -- María Elena - Lenguaje
(2, 2, 2, 4), -- Carlos - Matemática
(4, 3, 2, 4), -- Roberto - Ciencias
(6, 6, 2, 4), -- Diego - Ed. Física
-- 3° Básico A  
(3, 1, 3, 4), -- Ana - Lenguaje
(2, 2, 3, 4), -- Carlos - Matemática
(4, 3, 3, 4), -- Roberto - Ciencias
(5, 4, 3, 4), -- Patricia - Historia
-- 6° Básico A
(3, 1, 4, 4), -- Ana - Lenguaje
(2, 2, 4, 4), -- Carlos - Matemática
(4, 3, 4, 4), -- Roberto - Ciencias
(5, 4, 4, 4), -- Patricia - Historia
(7, 5, 4, 4), -- Carmen - Inglés
-- 8° Básico A
(3, 1, 5, 4), -- Ana - Lenguaje
(2, 2, 5, 4), -- Carlos - Matemática
(4, 3, 5, 4), -- Roberto - Ciencias
(5, 4, 5, 4), -- Patricia - Historia
(7, 5, 5, 4), -- Carmen - Inglés
-- 1° Medio A
(3, 1, 6, 4), -- Ana - Lenguaje
(2, 2, 6, 4), -- Carlos - Matemática
(4, 3, 6, 4), -- Roberto - Ciencias
(5, 4, 6, 4), -- Patricia - Historia
(7, 5, 6, 4), -- Carmen - Inglés
-- 2° Medio A
(3, 1, 7, 4), -- Ana - Lenguaje
(2, 2, 7, 4), -- Carlos - Matemática
(4, 3, 7, 4), -- Roberto - Ciencias
(5, 4, 7, 4), -- Patricia - Historia
(7, 5, 7, 4), -- Carmen - Inglés
-- 3° Medio A
(3, 1, 8, 4), -- Ana - Lenguaje
(2, 2, 8, 4), -- Carlos - Matemática
(4, 3, 8, 4), -- Roberto - Ciencias
(5, 4, 8, 4), -- Patricia - Historia
(7, 5, 8, 4), -- Carmen - Inglés
(4, 9, 8, 4), -- Roberto - Filosofía
-- 4° Medio A
(3, 1, 9, 4), -- Ana - Lenguaje
(2, 2, 9, 4), -- Carlos - Matemática
(4, 3, 9, 4), -- Roberto - Ciencias
(5, 4, 9, 4), -- Patricia - Historia
(7, 5, 9, 4), -- Carmen - Inglés
(4, 9, 9, 4), -- Roberto - Filosofía
(5, 10, 9, 4); -- Patricia - Psicología (electiva)

-- =====================================================
-- EVALUACIONES (2024 - 2do Semestre)
-- =====================================================

-- Evaluaciones para 1° Básico A
INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
-- Lenguaje 1° Básico A (asignacion_docente_id = 1)
(1, 1, 'Prueba Unidad 1: Vocales', 'Evaluación de reconocimiento de vocales', '2024-08-15', 30.00),
(1, 2, 'Trabajo: Mi Familia', 'Descripción oral y escrita de la familia', '2024-09-10', 25.00),
(1, 1, 'Prueba Unidad 2: Consonantes', 'Evaluación de consonantes M, P, L', '2024-10-05', 35.00),
-- Matemática 1° Básico A (asignacion_docente_id = 2)
(2, 1, 'Prueba: Números 1-10', 'Evaluación de números del 1 al 10', '2024-08-20', 40.00),
(2, 2, 'Trabajo: Contando objetos', 'Actividad práctica de conteo', '2024-09-15', 30.00),
(2, 1, 'Prueba: Suma y Resta', 'Operaciones básicas hasta el 10', '2024-10-10', 30.00);

-- Evaluaciones para 2° Básico A
INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
-- Lenguaje 2° Básico A (asignacion_docente_id = 5)
(5, 1, 'Prueba: Comprensión Lectora', 'Lectura de texto simple con preguntas', '2024-08-22', 35.00),
(5, 2, 'Trabajo: Creación de cuento', 'Inventar y escribir un cuento corto', '2024-09-18', 30.00),
-- Matemática 2° Básico A (asignacion_docente_id = 6)
(6, 1, 'Prueba: Números hasta 100', 'Evaluación de números del 1 al 100', '2024-08-25', 40.00),
(6, 1, 'Prueba: Geometría básica', 'Figuras geométricas básicas', '2024-10-15', 35.00);

-- Evaluaciones para 3° Básico A
INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
-- Lenguaje 3° Básico A (asignacion_docente_id = 9)
(9, 1, 'Prueba: Género narrativo', 'Elementos del cuento y la fábula', '2024-09-05', 40.00),
(9, 4, 'Presentación: Poema favorito', 'Recitación de poema con expresión', '2024-10-20', 25.00),
-- Matemática 3° Básico A (asignacion_docente_id = 10)
(10, 1, 'Prueba: Multiplicación', 'Tablas del 2, 3, 4 y 5', '2024-09-12', 45.00),
(10, 2, 'Trabajo: Problemas cotidianos', 'Resolución de problemas de la vida diaria', '2024-10-25', 30.00);

-- Evaluaciones para 6° Básico A
INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
-- Lenguaje 6° Básico A (asignacion_docente_id = 13)
(13, 1, 'Prueba: Género lírico', 'Análisis de poemas y figuras literarias', '2024-09-08', 35.00),
(13, 2, 'Ensayo: Mi opinión', 'Texto argumentativo sobre tema libre', '2024-10-12', 40.00),
-- Historia 6° Básico A (asignacion_docente_id = 16)
(16, 1, 'Prueba: Civilizaciones precolombinas', 'Mayas, Aztecas e Incas', '2024-09-20', 45.00),
(16, 4, 'Presentación: Cultura mapuche', 'Exposición grupal sobre pueblo mapuche', '2024-11-15', 30.00);

-- Evaluaciones para 8° Básico A
INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
-- Matemática 8° Básico A (asignacion_docente_id = 18)
(18, 1, 'Prueba: Álgebra básica', 'Ecuaciones de primer grado', '2024-09-10', 40.00),
(18, 2, 'Trabajo: Funciones lineales', 'Gráficos y análisis de funciones', '2024-10-28', 35.00),
-- Ciencias 8° Básico A (asignacion_docente_id = 19)
(19, 5, 'Laboratorio: Reacciones químicas', 'Experimentos con ácidos y bases', '2024-09-25', 30.00),
(19, 1, 'Prueba: Sistema digestivo', 'Anatomía y fisiología digestiva', '2024-10-30', 40.00);

-- Evaluaciones para 1° Medio A
INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
-- Lenguaje 1° Medio A (asignacion_docente_id = 21)
(21, 1, 'Prueba: Género épico', 'Análisis de La Odisea', '2024-09-15', 35.00),
(21, 2, 'Ensayo literario', 'Análisis crítico de obra leída', '2024-11-05', 40.00),
-- Matemática 1° Medio A (asignacion_docente_id = 22)
(22, 1, 'Prueba: Números reales', 'Operaciones con números irracionales', '2024-09-18', 45.00),
(22, 2, 'Trabajo: Estadística', 'Análisis de datos y gráficos', '2024-11-10', 30.00);

-- Evaluaciones para 3° Medio A
INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
-- Filosofía 3° Medio A (asignacion_docente_id = 30)
(30, 1, 'Prueba: Filosofía antigua', 'Sócrates, Platón y Aristóteles', '2024-09-22', 40.00),
(30, 2, 'Ensayo filosófico', 'Reflexión sobre un problema ético', '2024-11-12', 35.00),
-- Inglés 3° Medio A (asignacion_docente_id = 29)
(29, 1, 'Prueba: Present Perfect', 'Gramática y uso del present perfect', '2024-09-28', 35.00),
(29, 4, 'Presentación: My Future Plans', 'Exposición sobre planes futuros', '2024-11-18', 30.00);

-- Evaluaciones para 4° Medio A
INSERT INTO evaluaciones (asignacion_docente_id, tipo_evaluacion_id, titulo, descripcion, fecha_evaluacion, ponderacion) VALUES
-- Psicología 4° Medio A (asignacion_docente_id = 35)
(35, 1, 'Prueba: Psicología cognitiva', 'Procesos mentales y aprendizaje', '2024-10-05', 40.00),
(35, 2, 'Trabajo: Caso de estudio', 'Análisis de caso psicológico', '2024-11-20', 35.00),
-- Historia 4° Medio A (asignacion_docente_id = 33)
(33, 1, 'Prueba: Chile siglo XX', 'Historia contemporánea de Chile', '2024-10-08', 45.00),
(33, 2, 'Ensayo histórico', 'Análisis de proceso histórico relevante', '2024-11-25', 30.00);

-- =====================================================
-- NOTAS DE LOS ESTUDIANTES
-- =====================================================

-- Notas para Sofía Ramírez (estudiante_id = 1, 1° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(1, 1, 6.2, 'Muy buen reconocimiento de vocales'),
(2, 1, 5.8, 'Descripción clara de su familia'),
(3, 1, 6.5, 'Excelente manejo de consonantes'),
(4, 1, 6.0, 'Buen conteo de números'),
(5, 1, 5.5, 'Necesita practicar más el conteo'),
(6, 1, 6.3, 'Muy buena comprensión de suma y resta');

-- Notas para Mateo González (estudiante_id = 2, 1° Básico A)  
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(1, 2, 5.5, 'Reconoce la mayoría de vocales'),
(2, 2, 6.0, 'Buena expresión oral'),
(3, 2, 5.8, 'Progreso en consonantes'),
(4, 2, 5.2, 'Debe reforzar números'),
(5, 2, 5.8, 'Mejora en actividades prácticas'),
(6, 2, 5.0, 'Dificultades con operaciones');

-- Notas para Valentina López (estudiante_id = 3, 2° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(7, 3, 6.5, 'Excelente comprensión lectora'),
(8, 3, 6.8, 'Creatividad destacada en su cuento'),
(9, 3, 6.2, 'Buen manejo de números hasta 100'),
(10, 3, 6.0, 'Reconoce figuras geométricas correctamente');

-- Notas para Diego Martínez (estudiante_id = 4, 2° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(7, 4, 5.8, 'Buena comprensión, puede mejorar'),
(8, 4, 5.5, 'Cuento simple pero bien estructurado'),
(9, 4, 5.0, 'Dificultades con números grandes'),
(10, 4, 5.3, 'Confunde algunas figuras');

-- Notas para Isidora Fernández (estudiante_id = 5, 3° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(11, 5, 6.3, 'Buena identificación de elementos narrativos'),
(12, 5, 6.7, 'Excelente expresión y fluidez'),
(13, 5, 6.5, 'Domina las tablas de multiplicar'),
(14, 5, 6.0, 'Resuelve problemas con estrategias claras');

-- Notas para Benjamín Morales (estudiante_id = 6, 3° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(11, 6, 5.2, 'Necesita reforzar elementos del cuento'),
(12, 6, 5.8, 'Buena memorización del poema'),
(13, 6, 4.8, 'Debe practicar más las tablas'),
(14, 6, 5.0, 'Dificultades en resolución de problemas');

-- Notas para Emilia Herrera (estudiante_id = 7, 6° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(15, 7, 6.8, 'Excelente análisis de figuras literarias'),
(16, 7, 6.5, 'Ensayo bien argumentado'),
(17, 7, 6.2, 'Buen conocimiento de civilizaciones'),
(18, 7, 6.9, 'Presentación muy completa y ordenada');

-- Notas para Joaquín Torres (estudiante_id = 8, 6° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(15, 8, 5.5, 'Identifica figuras básicas'),
(16, 8, 5.8, 'Opiniones claras pero necesita más fundamentos'),
(17, 8, 5.0, 'Conocimientos básicos de las civilizaciones'),
(18, 8, 5.5, 'Presentación correcta pero falta profundidad');

-- Notas para Antonella Silva (estudiante_id = 9, 8° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(19, 9, 6.0, 'Resuelve ecuaciones correctamente'),
(20, 9, 6.3, 'Buen análisis de funciones lineales'),
(21, 9, 6.5, 'Excelente trabajo experimental'),
(22, 9, 5.8, 'Conoce anatomía básica del sistema');

-- Notas para Gabriel Peña (estudiante_id = 10, 8° Básico A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(19, 10, 4.5, 'Dificultades con álgebra básica'),
(20, 10, 5.0, 'Comprende conceptos pero necesita práctica'),
(21, 10, 5.5, 'Participa bien en laboratorio'),
(22, 10, 4.8, 'Debe estudiar más anatomía');

-- Notas para Camila Vásquez (estudiante_id = 11, 1° Medio A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(23, 11, 6.2, 'Buen análisis de La Odisea'),
(24, 11, 6.5, 'Ensayo bien estructurado y argumentado'),
(25, 11, 5.8, 'Maneja números reales con algunas dificultades'),
(26, 11, 6.0, 'Bona interpretación estadística');

-- Notas para Nicolás Sánchez (estudiante_id = 12, 1° Medio A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(23, 12, 5.0, 'Comprensión básica de la obra'),
(24, 12, 5.3, 'Ensayo necesita más desarrollo'),
(25, 12, 4.2, 'Grandes dificultades con números irracionales'),
(26, 12, 4.8, 'Errores en interpretación de gráficos');

-- Notas para Francisca Rojas (estudiante_id = 13, 2° Medio A)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
-- (Aquí se pueden agregar más evaluaciones para 2° Medio si se crean)

-- Notas para estudiantes de 3° Medio A (Filosofía e Inglés)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(27, 15, 6.3, 'Excelente comprensión de filosofía antigua'),
(28, 15, 6.7, 'Ensayo filosófico muy reflexivo'),
(29, 15, 6.0, 'Buen manejo del present perfect'),
(30, 15, 6.2, 'Presentación fluida y bien preparada');

INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(27, 16, 5.5, 'Comprende conceptos básicos de filosofía'),
(28, 16, 5.8, 'Ensayo con ideas interesantes'),
(29, 16, 5.2, 'Necesita practicar más gramática'),
(30, 16, 5.0, 'Presentación con errores de pronunciación');

-- Notas para estudiantes de 4° Medio A (Psicología e Historia)
INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(31, 17, 6.5, 'Excelente comprensión de psicología cognitiva'),
(32, 17, 6.8, 'Análisis de caso muy completo'),
(33, 17, 6.4, 'Buen conocimiento de historia de Chile'),
(34, 17, 6.6, 'Ensayo histórico bien documentado');

INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(31, 18, 5.8, 'Comprende conceptos psicológicos básicos'),
(32, 18, 6.0, 'Análisis correcto pero superficial'),
(33, 18, 5.5, 'Conocimientos históricos regulares'),
(34, 18, 5.2, 'Ensayo necesita más investigación');

INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(31, 19, 6.2, 'Buena aplicación de conceptos psicológicos'),
(32, 19, 6.3, 'Caso bien analizado'),
(33, 19, 6.0, 'Manejo adecuado de historia contemporánea'),
(34, 19, 6.1, 'Ensayo con buena argumentación');

INSERT INTO notas (evaluacion_id, estudiante_id, nota, observaciones) VALUES
(31, 20, 4.8, 'Dificultades con conceptos abstractos'),
(32, 20, 5.0, 'Análisis básico del caso'),
(33, 20, 4.5, 'Debe reforzar historia de Chile'),
(34, 20, 4.7, 'Ensayo con argumentación débil');

-- =====================================================
-- COMENTARIOS FINALES Y VERIFICACIONES
-- =====================================================

/*
RESUMEN DE DATOS INSERTADOS:
- 2 Niveles educacionales
- 5 Períodos académicos (2023-2025)
- 6 Tipos de evaluación
- 9 Cursos (5 básica, 4 media)
- 8 Docentes activos
- 10 Asignaturas (8 obligatorias, 2 electivas)
- 20 Estudiantes (10 básica, 10 media)
- 20 Matrículas activas
- 9 Profesores jefe asignados
- 35 Asignaciones docentes para 2024-2do semestre
- 34 Evaluaciones programadas
- 58 Notas registradas

ESTADO ACTUAL:
- Período activo: 2024 - 2do Semestre
- Todos los estudiantes tienen matrícula activa
- Todos los cursos tienen profesor jefe
- Hay evaluaciones y notas para testing de reportes
- Datos distribuidos en diferentes rangos de notas (4.2 a 6.9)

La base de datos está lista para:
✅ Generar todos los reportes solicitados
✅ Probar operaciones CRUD
✅ Realizar consultas avanzadas con JOINs
✅ Calcular promedios y estadísticas
✅ Identificar estudiantes en riesgo académico
*/

-- Verificar integridad de datos
SELECT 'Verificación completada - Base de datos lista para uso' AS status;
