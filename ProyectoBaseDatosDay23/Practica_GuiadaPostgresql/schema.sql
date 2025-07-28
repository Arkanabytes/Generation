-- =====================================================
-- SISTEMA DE GESTIÓN ESCOLAR - COLEGIO SAN MARTÍN
-- Base de Datos: PostgreSQL (Neon.tech)
-- Archivo: schema_postgres.sql
-- Descripción: Creación de base de datos y todas las tablas
-- =====================================================
DROP DATABASE IF EXISTS colegio_san_martin;
CREATE DATABASE colegio_san_martin;
USE colegio_san_martin;
-- =====================================================
-- EXTENSIONES NECESARIAS
-- =====================================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- DOMINIOS PERSONALIZADOS (EQUIVALENTE A ENUM EN MYSQL)
-- =====================================================
CREATE TYPE estado_docente AS ENUM ('activo', 'licencia', 'desvinculado');

CREATE TYPE estado_matricula AS ENUM ('activo', 'retirado', 'egresado');

CREATE TYPE tipo_asignatura AS ENUM ('obligatoria', 'electiva');

-- =====================================================
-- TABLA: periodos_academicos
-- Descripción: Gestiona años académicos y semestres
-- =====================================================
CREATE TABLE periodos_academicos (
    id SERIAL PRIMARY KEY,
    anio INTEGER NOT NULL CHECK (anio >= 2020 AND anio <= 2030),
    semestre SMALLINT NOT NULL CHECK (semestre IN (1, 2)),
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    activo BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_periodo UNIQUE (anio, semestre)
);

-- =====================================================
-- TABLA: niveles_educacionales
-- Descripción: Define los niveles educativos (básica/media)
-- =====================================================
CREATE TABLE niveles_educacionales (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLA: cursos
-- Descripción: Información de los cursos del colegio
-- =====================================================
CREATE TABLE cursos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL, -- ej: "1° Básico A"
    nivel_id INTEGER NOT NULL REFERENCES niveles_educacionales(id),
    capacidad_maxima INTEGER DEFAULT 45,
    anio INTEGER NOT NULL CHECK (anio >= 2020 AND anio <= 2030),
    activo BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_curso_anio UNIQUE (nombre, anio)
);

-- =====================================================
-- TABLA: docentes
-- Descripción: Información del personal docente
-- =====================================================
CREATE TABLE docentes (
    id SERIAL PRIMARY KEY,
    rut VARCHAR(12) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    telefono VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    fecha_contratacion DATE NOT NULL,
    estado estado_docente DEFAULT 'activo',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLA: estudiantes
-- Descripción: Información de los estudiantes
-- =====================================================
CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    rut VARCHAR(12) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20),
    email VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLA: asignaturas
-- Descripción: Materias que se imparten en el colegio
-- =====================================================
CREATE TABLE asignaturas (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    horas_semanales INTEGER DEFAULT 2,
    tipo tipo_asignatura DEFAULT 'obligatoria',
    activa BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLA: matriculas
-- Descripción: Registro de estudiantes matriculados por curso y año
-- =====================================================
CREATE TABLE matriculas (
    id SERIAL PRIMARY KEY,
    estudiante_id INTEGER NOT NULL REFERENCES estudiantes(id),
    curso_id INTEGER NOT NULL REFERENCES cursos(id),
    fecha_matricula DATE NOT NULL,
    estado estado_matricula DEFAULT 'activo',
    observaciones TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_estudiante_curso UNIQUE (estudiante_id, curso_id)
);

-- =====================================================
-- TABLA: profesores_jefe
-- Descripción: Asignación de profesores jefe a cursos
-- =====================================================
CREATE TABLE profesores_jefe (
    id SERIAL PRIMARY KEY,
    docente_id INTEGER NOT NULL REFERENCES docentes(id),
    curso_id INTEGER NOT NULL REFERENCES cursos(id),
    anio INTEGER NOT NULL CHECK (anio >= 2020 AND anio <= 2030),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_profesor_curso_anio UNIQUE (docente_id, anio),
    CONSTRAINT unique_curso_anio_prof_jefe UNIQUE (curso_id, anio)
);
-- =====================================================
-- TABLA: asignaciones_docentes
-- Descripción: Qué docente enseña qué asignatura en qué curso
-- =====================================================
CREATE TABLE asignaciones_docentes (
    id SERIAL PRIMARY KEY,
    docente_id INTEGER NOT NULL REFERENCES docentes(id),
    asignatura_id INTEGER NOT NULL REFERENCES asignaturas(id),
    curso_id INTEGER NOT NULL REFERENCES cursos(id),
    periodo_academico_id INTEGER NOT NULL REFERENCES periodos_academicos(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT unique_asignacion UNIQUE (docente_id, asignatura_id, curso_id, periodo_academico_id)
);

-- =====================================================
-- TABLA: tipos_evaluacion
-- Descripción: Tipos de evaluaciones (prueba, trabajo, examen, etc.)
-- =====================================================
CREATE TABLE tipos_evaluacion (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLA: evaluaciones
-- Descripción: Evaluaciones realizadas por asignatura y curso
-- =====================================================
CREATE TABLE evaluaciones (
    id SERIAL PRIMARY KEY,
    asignacion_docente_id INTEGER NOT NULL REFERENCES asignaciones_docentes(id),
    tipo_evaluacion_id INTEGER NOT NULL REFERENCES tipos_evaluacion(id),
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT,
    fecha_evaluacion DATE NOT NULL,
    ponderacion NUMERIC(5,2) DEFAULT 100.00, -- porcentaje de la nota final
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- =====================================================
-- TABLA: notas
-- Descripción: Notas obtenidas por los estudiantes
-- =====================================================
CREATE TABLE notas (
    id SERIAL PRIMARY KEY,
    evaluacion_id INTEGER NOT NULL REFERENCES evaluaciones(id),
    estudiante_id INTEGER NOT NULL REFERENCES estudiantes(id),
    nota NUMERIC(2,1) NOT NULL CHECK (nota >= 1.0 AND nota <= 7.0),
    fecha_registro TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    observaciones TEXT,
    CONSTRAINT unique_evaluacion_estudiante UNIQUE (evaluacion_id, estudiante_id)
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

-- Índices para RUTs (consultas frecuentes)
CREATE INDEX idx_estudiantes_rut ON estudiantes(rut);

CREATE INDEX idx_docentes_rut ON docentes(rut);

-- =====================================================
-- TRIGGERS PARA ACTUALIZAR TIMESTAMP AUTOMÁTICAMENTE
-- =====================================================

-- Función para actualizar timestamp
CREATE OR REPLACE FUNCTION actualizar_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Aplicar trigger a tablas relevantes
CREATE TRIGGER trigger_actualizar_periodos 
    BEFORE UPDATE ON periodos_academicos 
    FOR EACH ROW EXECUTE FUNCTION actualizar_timestamp();

CREATE TRIGGER trigger_actualizar_cursos 
    BEFORE UPDATE ON cursos 
    FOR EACH ROW EXECUTE FUNCTION actualizar_timestamp();

CREATE TRIGGER trigger_actualizar_docentes 
    BEFORE UPDATE ON docentes 
    FOR EACH ROW EXECUTE FUNCTION actualizar_timestamp();

CREATE TRIGGER trigger_actualizar_estudiantes 
    BEFORE UPDATE ON estudiantes 
    FOR EACH ROW EXECUTE FUNCTION actualizar_timestamp();

-- =====================================================
-- VISTAS ÚTILES PARA CONSULTAS FRECUENTES
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
-- FUNCIONES ALMACENADAS ÚTILES
-- =====================================================

-- Función para calcular promedio de estudiante por asignatura
CREATE OR REPLACE FUNCTION calcular_promedio_estudiante_asignatura(
    p_estudiante_id INTEGER,
    p_asignatura_id INTEGER,
    p_periodo_academico_id INTEGER
)
RETURNS NUMERIC(3,1) AS $$
DECLARE
    promedio NUMERIC(3,1);
BEGIN
    SELECT AVG(n.nota)
    INTO promedio
    FROM notas n
    JOIN evaluaciones ev ON n.evaluacion_id = ev.id
    JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
    WHERE n.estudiante_id = p_estudiante_id 
      AND ad.asignatura_id = p_asignatura_id
      AND ad.periodo_academico_id = p_periodo_academico_id;
    
    RETURN COALESCE(promedio, 0);
END;
$$ LANGUAGE plpgsql;

-- Función para validar RUT chileno
CREATE OR REPLACE FUNCTION validar_rut(rut_completo VARCHAR)
RETURNS BOOLEAN AS $$
DECLARE
    rut_numeros VARCHAR;
    digito_verificador VARCHAR; -- Cambiado de CHAR(1) a VARCHAR
    suma INTEGER := 0;
    multiplicador INTEGER := 2;
    resto INTEGER;
    dv_calculado VARCHAR; -- Cambiado de CHAR(1) a VARCHAR
    i INTEGER;
BEGIN
    -- Limpiar RUT (quitar puntos y guión)
    rut_completo := REPLACE(REPLACE(rut_completo, '.', ''), '-', '');

    -- Separar número del dígito verificador
    rut_numeros := SUBSTRING(rut_completo FROM 1 FOR LENGTH(rut_completo) - 1);
    digito_verificador := UPPER(SUBSTRING(rut_completo FROM LENGTH(rut_completo)));

    -- Validar que el RUT tenga entre 8 y 9 dígitos
    IF LENGTH(rut_numeros) < 7 OR LENGTH(rut_numeros) > 8 THEN
        RETURN FALSE;
    END IF;

    -- Calcular dígito verificador
    FOR i IN REVERSE LENGTH(rut_numeros)..1 LOOP
        suma := suma + (SUBSTRING(rut_numeros FROM i FOR 1)::INTEGER * multiplicador);
        multiplicador := multiplicador + 1;
        IF multiplicador > 7 THEN
            multiplicador := 2;
        END IF;
    END LOOP;

    resto := suma % 11;

    IF resto = 0 THEN
        dv_calculado := '0';
    ELSIF resto = 1 THEN
        dv_calculado := 'K';
    ELSE
        dv_calculado := (11 - resto)::TEXT;
    END IF;

    RETURN dv_calculado = digito_verificador;
END;
$$ LANGUAGE plpgsql;

-- =====================================================
-- TRIGGERS PARA VALIDACIONES
-- =====================================================

-- Trigger para validar capacidad del curso
CREATE OR REPLACE FUNCTION validar_capacidad_curso()
RETURNS TRIGGER AS $$
DECLARE
    capacidad INTEGER;
    matriculados INTEGER;
BEGIN
    SELECT c.capacidad_maxima INTO capacidad
    FROM cursos c WHERE c.id = NEW.curso_id;
    
    SELECT COUNT(*) INTO matriculados
    FROM matriculas m WHERE m.curso_id = NEW.curso_id AND m.estado = 'activo';
    
    IF matriculados >= capacidad THEN
        RAISE EXCEPTION 'El curso ha alcanzado su capacidad máxima de % estudiantes', capacidad;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_validar_capacidad_curso
    BEFORE INSERT ON matriculas
    FOR EACH ROW EXECUTE FUNCTION validar_capacidad_curso();

-- Trigger para validar RUT al insertar estudiantes
CREATE OR REPLACE FUNCTION validar_rut_estudiante()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT validar_rut(NEW.rut) THEN
        RAISE EXCEPTION 'RUT inválido: %', NEW.rut;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_validar_rut_estudiante
    BEFORE INSERT OR UPDATE ON estudiantes
    FOR EACH ROW EXECUTE FUNCTION validar_rut_estudiante();

-- Trigger para validar RUT al insertar docentes
CREATE TRIGGER trigger_validar_rut_docente
    BEFORE INSERT OR UPDATE ON docentes
    FOR EACH ROW EXECUTE FUNCTION validar_rut_estudiante();

-- =====================================================
-- CONFIGURACIÓN DE SEGURIDAD Y PERMISOS
-- =====================================================

-- Crear roles para diferentes tipos de usuarios
-- CREATE ROLE admin_escolar;
-- CREATE ROLE docente_usuario;
-- CREATE ROLE secretaria_usuario;

-- Permisos para administrador escolar
-- GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_escolar;
-- GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO admin_escolar;

-- Permisos para docentes (solo lectura de estudiantes y escritura de notas)
-- GRANT SELECT ON estudiantes, cursos, asignaturas TO docente_usuario;
-- GRANT SELECT, INSERT, UPDATE ON notas, evaluaciones TO docente_usuario;

-- =====================================================
-- COMENTARIOS FINALES
-- =====================================================
/*
CARACTERÍSTICAS PRINCIPALES DE LA MIGRACIÓN A POSTGRESQL:

1. CAMBIOS PRINCIPALES:
   - AUTO_INCREMENT → SERIAL
   - TINYINT → SMALLINT
   - ENUM → Tipos personalizados (CREATE TYPE)
   - DECIMAL → NUMERIC
   - UNIQUE KEY → CONSTRAINT
   - ON UPDATE CURRENT_TIMESTAMP → Triggers personalizados

2. MEJORAS AGREGADAS:
   - Extensión UUID para posibles usos futuros
   - Timestamps con zona horaria (TIMESTAMP WITH TIME ZONE)
   - Función de validación de RUT chileno
   - Triggers automáticos para actualización de timestamps
   - Mejor manejo de errores con RAISE EXCEPTION
   - Funciones en PL/pgSQL más robustas

3. OPTIMIZACIONES:
   - Índices específicos para PostgreSQL
   - Constraints más explícitos
   - Mejor documentación de funciones

4. COMPATIBILIDAD:
   - Mantiene toda la funcionalidad del sistema original
   - Listo para usar en Neon.tech
   - Compatible con aplicaciones web modernas
   - Fácil integración con ORMs como Prisma, TypeORM, etc.

La estructura está optimizada para PostgreSQL y lista para producción.
*/
