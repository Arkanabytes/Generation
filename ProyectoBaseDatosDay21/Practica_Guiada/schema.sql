-- =====================================================
-- SISTEMA DE GESTIÓN ESCOLAR - COLEGIO SAN MARTÍN
-- Archivo: schema.sql
-- Descripción: Creación de base de datos y todas las tablas
-- =====================================================


DROP DATABASE IF EXISTS colegio_san_martin;
-- Crear base de datos
CREATE DATABASE colegio_san_martin;
USE colegio_san_martin;

-- =====================================================
-- TABLA: periodos_academicos
-- Descripción: Gestiona años académicos y semestres
-- =====================================================
CREATE TABLE periodos_academicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    anio YEAR NOT NULL,
    semestre TINYINT NOT NULL CHECK (semestre IN (1, 2)),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    activo BOOLEAN DEFAULT FALSE,
    UNIQUE KEY unique_periodo (anio, semestre)
);

-- =====================================================
-- TABLA: niveles_educacionales
-- Descripción: Define los niveles educativos (básica/media)
-- =====================================================
CREATE TABLE niveles_educacionales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- =====================================================
-- TABLA: cursos
-- Descripción: Información de los cursos del colegio
-- =====================================================
CREATE TABLE cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL, -- ej: "1° Básico A"
    nivel_id INT NOT NULL,
    capacidad_maxima INT DEFAULT 45,
    anio YEAR NOT NULL,
    activo BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (nivel_id) REFERENCES niveles_educacionales(id),
    UNIQUE KEY unique_curso_anio (nombre, anio)
);

-- =====================================================
-- TABLA: docentes
-- Descripción: Información del personal docente
-- =====================================================
CREATE TABLE docentes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rut VARCHAR(12) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    fecha_contratacion DATE NOT NULL,
    estado ENUM('activo', 'licencia', 'desvinculado') DEFAULT 'activo',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLA: estudiantes
-- Descripción: Información de los estudiantes
-- =====================================================
CREATE TABLE estudiantes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rut VARCHAR(12) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLA: asignaturas
-- Descripción: Materias que se imparten en el colegio
-- =====================================================
CREATE TABLE asignaturas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    horas_semanales INT DEFAULT 2,
    tipo ENUM('obligatoria', 'electiva') DEFAULT 'obligatoria',
    activa BOOLEAN DEFAULT TRUE
);

-- =====================================================
-- TABLA: matriculas
-- Descripción: Registro de estudiantes matriculados por curso y año
-- =====================================================
CREATE TABLE matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT NOT NULL,
    curso_id INT NOT NULL,
    fecha_matricula DATE NOT NULL,
    estado ENUM('activo', 'retirado', 'egresado') DEFAULT 'activo',
    observaciones TEXT,
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id),
    UNIQUE KEY unique_estudiante_curso (estudiante_id, curso_id)
);

-- =====================================================
-- TABLA: profesores_jefe
-- Descripción: Asignación de profesores jefe a cursos
-- =====================================================
CREATE TABLE profesores_jefe (
    id INT PRIMARY KEY AUTO_INCREMENT,
    docente_id INT NOT NULL,
    curso_id INT NOT NULL,
    anio YEAR NOT NULL,
    FOREIGN KEY (docente_id) REFERENCES docentes(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id),
    UNIQUE KEY unique_profesor_curso_anio (docente_id, anio),
    UNIQUE KEY unique_curso_anio (curso_id, anio)
);

-- =====================================================
-- TABLA: asignaciones_docentes
-- Descripción: Qué docente enseña qué asignatura en qué curso
-- =====================================================
CREATE TABLE asignaciones_docentes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    docente_id INT NOT NULL,
    asignatura_id INT NOT NULL,
    curso_id INT NOT NULL,
    periodo_academico_id INT NOT NULL,
    FOREIGN KEY (docente_id) REFERENCES docentes(id),
    FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id),
    FOREIGN KEY (periodo_academico_id) REFERENCES periodos_academicos(id),
    UNIQUE KEY unique_asignacion (docente_id, asignatura_id, curso_id, periodo_academico_id)
);

-- =====================================================
-- TABLA: tipos_evaluacion
-- Descripción: Tipos de evaluaciones (prueba, trabajo, examen, etc.)
-- =====================================================
CREATE TABLE tipos_evaluacion (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);

-- =====================================================
-- TABLA: evaluaciones
-- Descripción: Evaluaciones realizadas por asignatura y curso
-- =====================================================
CREATE TABLE evaluaciones (
    id INT PRIMARY KEY AUTO_INCREMENT,
    asignacion_docente_id INT NOT NULL,
    tipo_evaluacion_id INT NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    fecha_evaluacion DATE NOT NULL,
    ponderacion DECIMAL(5,2) DEFAULT 100.00, -- porcentaje de la nota final
    FOREIGN KEY (asignacion_docente_id) REFERENCES asignaciones_docentes(id),
    FOREIGN KEY (tipo_evaluacion_id) REFERENCES tipos_evaluacion(id)
);

-- =====================================================
-- TABLA: notas
-- Descripción: Notas obtenidas por los estudiantes
-- =====================================================
CREATE TABLE notas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    evaluacion_id INT NOT NULL,
    estudiante_id INT NOT NULL,
    nota DECIMAL(2,1) NOT NULL CHECK (nota >= 1.0 AND nota <= 7.0),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT,
    FOREIGN KEY (evaluacion_id) REFERENCES evaluaciones(id),
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id),
    UNIQUE KEY unique_evaluacion_estudiante (evaluacion_id, estudiante_id)
);

-- =====================================================
-- ÍNDICES PARA OPTIMIZAR CONSULTAS FRECUENTES
-- =====================================================

-- Índices para consultas de notas
CREATE INDEX idx_notas_estudiante_fecha ON notas(estudiante_id, fecha_registro);

CREATE INDEX idx_evaluaciones_fecha ON evaluaciones(fecha_evaluacion);

-- Índices para consultas de matriculas
CREATE INDEX idx_matriculas_curso_estado ON matriculas(curso_id, estado);

CREATE INDEX idx_matriculas_estudiante_estado ON matriculas(estudiante_id, estado);

-- Índices para asignaciones
CREATE INDEX idx_asignaciones_periodo ON asignaciones_docentes(periodo_academico_id);

CREATE INDEX idx_asignaciones_docente ON asignaciones_docentes(docente_id);

-- =====================================================
-- VIEWS ÚTILES PARA CONSULTAS FRECUENTES
-- =====================================================

-- Vista: Estudiantes con su información de matrícula actual
CREATE OR REPLACE VIEW vista_estudiantes_activos AS
SELECT 
    e.id,
    e.rut,
    CONCAT(e.nombres, ' ', e.apellidos) AS nombre_completo,
    e.fecha_nacimiento,
    c.nombre AS curso,
    n.nombre AS nivel,
    m.fecha_matricula,
    m.estado
FROM estudiantes e
JOIN matriculas m ON e.id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.id
JOIN niveles_educacionales n ON c.nivel_id = n.id
JOIN periodos_academicos pa ON pa.anio = c.anio
WHERE m.estado = 'activo'
  AND pa.activo = TRUE;

-- Vista: Docentes con sus asignaciones actuales
CREATE OR REPLACE VIEW vista_docentes_asignaciones AS
SELECT 
    d.id,
    d.rut,
    CONCAT(d.nombres, ' ', d.apellidos) AS nombre_completo,
    d.especialidad,
    a.nombre AS asignatura,
    c.nombre AS curso,
    pa.anio,
    pa.semestre
FROM docentes d
JOIN asignaciones_docentes ad ON d.id = ad.docente_id
JOIN asignaturas a ON ad.asignatura_id = a.id
JOIN cursos c ON ad.curso_id = c.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE d.estado = 'activo' AND pa.activo = TRUE;

-- =====================================================
-- PROCEDIMIENTOS ALMACENADOS ÚTILES
-- =====================================================

DELIMITER //    -- Cambiamos el delimitador a //

CREATE PROCEDURE CalcularPromedioEstudianteAsignatura(   -- Definición del procedimiento
    IN p_estudiante_id INT,       -- Parámetro de entrada (id estudiante)
    IN p_asignatura_id INT,       -- Parámetro de entrada (id asignatura)
    IN p_periodo_academico_id INT,-- Parámetro de entrada (id periodo)
    OUT p_promedio DECIMAL(3,1)   -- Parámetro de salida (promedio)
)
BEGIN
    -- Aquí va la lógica del procedimiento
    SELECT AVG(n.nota)    -- Se calcula el promedio de las notas
    INTO p_promedio       -- Se almacena el resultado en la variable de salida
    FROM notas n
    JOIN evaluaciones ev ON n.evaluacion_id = ev.id
    JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
    WHERE n.estudiante_id = p_estudiante_id 
      AND ad.asignatura_id = p_asignatura_id
      AND ad.periodo_academico_id = p_periodo_academico_id;
END //    -- Fin del procedimiento

DELIMITER ;   -- Volvemos al delimitador por defecto ;


-- =====================================================
-- TRIGGERS PARA AUDITORÍA Y VALIDACIONES
-- =====================================================

DELIMITER //

-- Trigger para validar que un curso no exceda su capacidad
CREATE TRIGGER validar_capacidad_curso
BEFORE INSERT ON matriculas
FOR EACH ROW
BEGIN
    DECLARE capacidad INT;
    DECLARE matriculados INT;
    
    SELECT c.capacidad_maxima INTO capacidad
    FROM cursos c WHERE c.id = NEW.curso_id;
    
    SELECT COUNT(*) INTO matriculados
    FROM matriculas m WHERE m.curso_id = NEW.curso_id AND m.estado = 'activo';
    
    IF matriculados >= capacidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El curso ha alcanzado su capacidad máxima';
    END IF;
END //

DELIMITER ;

-- =====================================================
-- COMENTARIOS FINALES
-- =====================================================
/*
Esta estructura de base de datos permite:
1. Gestionar múltiples años académicos y semestres
2. Controlar la matrícula de estudiantes por curso
3. Asignar docentes a asignaturas y cursos específicos
4. Registrar evaluaciones y notas de manera detallada
5. Mantener histórico completo de la información académica
6. Generar reportes complejos mediante las vistas creadas

Características técnicas:
- Normalización hasta 3FN
- Índices para optimizar consultas frecuentes
- Constraints para mantener integridad de datos
- Triggers para validaciones automáticas
- Views para simplificar consultas complejas
- Procedimientos almacenados para cálculos recurrentes
*/
