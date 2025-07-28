-- =====================================================
-- SISTEMA DE GESTIÓN ESCOLAR - COLEGIO SAN MARTÍN
-- Archivo: reportes_postgres.sql
-- Descripción: Todas las consultas de reportes para PostgreSQL
-- Base de datos: Neon.tech PostgreSQL
-- =====================================================

-- =====================================================
-- REPORTES BÁSICOS
-- =====================================================

-- 1. LISTA DE ESTUDIANTES POR CURSO
-- Mostrar todos los estudiantes matriculados en un curso específico del año actual
SELECT 
    e.rut,
    CONCAT(e.nombres, ' ', e.apellidos) AS nombre_completo,
    e.fecha_nacimiento,
    EXTRACT(YEAR FROM AGE(e.fecha_nacimiento)) AS edad,
    e.telefono,
    e.email,
    m.fecha_matricula,
    m.estado AS estado_matricula
FROM estudiantes e
JOIN matriculas m ON e.id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.id
WHERE c.nombre = '4° Medio A'  -- Cambiar por el curso deseado
  AND c.anio = 2024
  AND m.estado = 'activo'
ORDER BY e.apellidos, e.nombres;

-- 2. HORARIO DE UN DOCENTE
-- Mostrar todas las asignaturas y cursos que enseña un docente específico
SELECT 
    CONCAT(d.nombres, ' ', d.apellidos) AS docente,
    a.nombre AS asignatura,
    c.nombre AS curso,
    n.nombre AS nivel_educacional,
    a.horas_semanales,
    pa.anio,
    pa.semestre
FROM docentes d
JOIN asignaciones_docentes ad ON d.id = ad.docente_id
JOIN asignaturas a ON ad.asignatura_id = a.id
JOIN cursos c ON ad.curso_id = c.id
JOIN niveles_educacionales n ON c.nivel_id = n.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE d.rut = '23456789-0'  -- Cambiar por RUT del docente deseado
  AND pa.activo = TRUE
ORDER BY c.nombre, a.nombre;

-- 3. ASIGNATURAS DE UN CURSO
-- Listar todas las asignaturas que se imparten en un curso determinado con sus respectivos docentes
SELECT 
    a.codigo,
    a.nombre AS asignatura,
    a.horas_semanales,
    a.tipo,
    CONCAT(d.nombres, ' ', d.apellidos) AS docente,
    d.especialidad
FROM asignaturas a
JOIN asignaciones_docentes ad ON a.id = ad.asignatura_id
JOIN docentes d ON ad.docente_id = d.id
JOIN cursos c ON ad.curso_id = c.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE c.nombre = '3° Medio A'  -- Cambiar por el curso deseado
  AND pa.activo = TRUE
ORDER BY a.nombre;

-- =====================================================
-- REPORTES DE NOTAS
-- =====================================================

-- 4. NOTAS DE UN ESTUDIANTE
-- Mostrar todas las notas de un estudiante en un semestre específico, organizadas por asignatura
SELECT 
    a.nombre AS asignatura,
    te.nombre AS tipo_evaluacion,
    ev.titulo AS evaluacion,
    ev.fecha_evaluacion,
    n.nota,
    ev.ponderacion,
    n.observaciones
FROM notas n
JOIN evaluaciones ev ON n.evaluacion_id = ev.id
JOIN tipos_evaluacion te ON ev.tipo_evaluacion_id = te.id
JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
JOIN asignaturas a ON ad.asignatura_id = a.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
JOIN estudiantes e ON n.estudiante_id = e.id
WHERE e.rut = '19123456-7'  -- Cambiar por RUT del estudiante deseado
  AND pa.anio = 2024
  AND pa.semestre = 2
ORDER BY a.nombre, ev.fecha_evaluacion;

-- 5. PROMEDIO POR ASIGNATURA
-- Calcular el promedio de notas de un estudiante en cada asignatura por semestre
SELECT 
    a.nombre AS asignatura,
    COUNT(n.nota) AS total_notas,
    ROUND(AVG(n.nota), 1) AS promedio,
    MIN(n.nota) AS nota_minima,
    MAX(n.nota) AS nota_maxima,
    CASE 
        WHEN AVG(n.nota) >= 4.0 THEN 'APROBADO'
        ELSE 'REPROBADO'
    END AS estado
FROM notas n
JOIN evaluaciones ev ON n.evaluacion_id = ev.id
JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
JOIN asignaturas a ON ad.asignatura_id = a.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
JOIN estudiantes e ON n.estudiante_id = e.id
WHERE e.rut = '19123456-7'  -- Cambiar por RUT del estudiante deseado
  AND pa.anio = 2024
  AND pa.semestre = 2
GROUP BY a.id, a.nombre
ORDER BY promedio DESC;

-- 6. ESTUDIANTES CON PROMEDIO ROJO
-- Listar estudiantes con promedio menor a 4.0 en cualquier asignatura del semestre actual
SELECT 
    e.rut,
    CONCAT(e.nombres, ' ', e.apellidos) AS estudiante,
    c.nombre AS curso,
    a.nombre AS asignatura,
    COUNT(n.nota) AS total_evaluaciones,
    ROUND(AVG(n.nota), 1) AS promedio
FROM estudiantes e
JOIN matriculas m ON e.id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.id
JOIN notas n ON e.id = n.estudiante_id
JOIN evaluaciones ev ON n.evaluacion_id = ev.id
JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
JOIN asignaturas a ON ad.asignatura_id = a.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE pa.activo = TRUE
  AND m.estado = 'activo'
GROUP BY e.id, e.rut, estudiante, c.nombre, a.id, a.nombre
HAVING AVG(n.nota) < 4.0  -- Cambiar por nota diferente
ORDER BY promedio ASC, e.apellidos;

-- =====================================================
-- REPORTES ESTADÍSTICOS
-- =====================================================

-- 7. RANKING DE ESTUDIANTES POR CURSO
-- Mostrar los estudiantes de un curso ordenados por su promedio general (mayor a menor)
SELECT 
    ROW_NUMBER() OVER (ORDER BY AVG(n.nota) DESC) AS ranking,
    e.rut,
    CONCAT(e.nombres, ' ', e.apellidos) AS estudiante,
    COUNT(n.nota) AS total_notas,
    ROUND(AVG(n.nota), 1) AS promedio_general,
    CASE 
        WHEN AVG(n.nota) >= 6.0 THEN 'EXCELENTE'
        WHEN AVG(n.nota) >= 5.0 THEN 'BUENO'
        WHEN AVG(n.nota) >= 4.0 THEN 'SUFICIENTE'
        ELSE 'INSUFICIENTE'
    END AS nivel_rendimiento
FROM estudiantes e
JOIN matriculas m ON e.id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.id
JOIN notas n ON e.id = n.estudiante_id
JOIN evaluaciones ev ON n.evaluacion_id = ev.id
JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE c.nombre = '4° Medio A'  -- Cambiar por el curso deseado
  AND pa.activo = TRUE
  AND m.estado = 'activo'
GROUP BY e.id, e.rut, estudiante
ORDER BY promedio_general DESC;

-- 8. ESTADÍSTICAS POR ASIGNATURA
-- Para cada asignatura mostrar: promedio general, nota más alta, nota más baja, cantidad de estudiantes
SELECT 
    a.nombre AS asignatura,
    a.codigo,
    COUNT(DISTINCT n.estudiante_id) AS total_estudiantes,
    COUNT(n.nota) AS total_evaluaciones,
    ROUND(AVG(n.nota), 1) AS promedio_general,
    MIN(n.nota) AS nota_minima,
    MAX(n.nota) AS nota_maxima,
    ROUND(STDDEV(n.nota), 2) AS desviacion_estandar,
    SUM(CASE WHEN n.nota < 4.0 THEN 1 ELSE 0 END) AS estudiantes_reprobados,
    ROUND((SUM(CASE WHEN n.nota < 4.0 THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT n.estudiante_id)), 1) AS porcentaje_reprobacion
FROM asignaturas a
JOIN asignaciones_docentes ad ON a.id = ad.asignatura_id
JOIN evaluaciones ev ON ad.id = ev.asignacion_docente_id
JOIN notas n ON ev.id = n.evaluacion_id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE pa.activo = TRUE
GROUP BY a.id, a.nombre, a.codigo
ORDER BY promedio_general DESC;

-- 9. DOCENTES CON MÁS CURSOS
-- Listar docentes ordenados por la cantidad de cursos diferentes que enseñan
SELECT 
    d.rut,
    CONCAT(d.nombres, ' ', d.apellidos) AS docente,
    d.especialidad,
    COUNT(DISTINCT ad.curso_id) AS total_cursos,
    COUNT(DISTINCT ad.asignatura_id) AS total_asignaturas,
    STRING_AGG(DISTINCT c.nombre, ', ' ORDER BY c.nombre) AS cursos_asignados,
    SUM(a.horas_semanales) AS total_horas_semanales
FROM docentes d
JOIN asignaciones_docentes ad ON d.id = ad.docente_id
JOIN cursos c ON ad.curso_id = c.id
JOIN asignaturas a ON ad.asignatura_id = a.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE pa.activo = TRUE
  AND d.estado = 'activo'
GROUP BY d.id, d.rut, docente, d.especialidad
ORDER BY total_cursos DESC, total_horas_semanales DESC;

-- =====================================================
-- REPORTES ADMINISTRATIVOS
-- =====================================================

-- 10. ESTUDIANTES SIN NOTAS
-- Identificar estudiantes que no tienen notas registradas en el semestre actual
SELECT 
    e.rut,
    CONCAT(e.nombres, ' ', e.apellidos) AS estudiante,
    c.nombre AS curso,
    n.nombre AS nivel,
    m.fecha_matricula,
    COUNT(no.id) AS total_notas,
    CASE WHEN COUNT(no.id) = 0 THEN 'SIN NOTAS' ELSE 'CON NOTAS' END AS estado_notas
FROM estudiantes e
JOIN matriculas m ON e.id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.id
JOIN niveles_educacionales n ON c.nivel_id = n.id
LEFT JOIN notas no ON e.id = no.estudiante_id
LEFT JOIN evaluaciones ev ON no.evaluacion_id = ev.id
LEFT JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
LEFT JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id AND pa.activo = TRUE
WHERE m.estado = 'activo'
  AND c.anio = 2024
GROUP BY e.id, e.rut, estudiante, c.nombre, n.nombre, m.fecha_matricula
ORDER BY c.nombre, estudiante;

-- 11. CURSOS SIN PROFESOR JEFE
-- Listar cursos que no tienen profesor jefe asignado
SELECT 
    c.id,
    c.nombre AS curso,
    n.nombre AS nivel,
    c.capacidad_maxima,
    COUNT(m.id) AS estudiantes_matriculados,
    c.anio,
    COALESCE(CONCAT(d.nombres, ' ', d.apellidos), 'SIN ASIGNAR') AS profesor_jefe
FROM cursos c
JOIN niveles_educacionales n ON c.nivel_id = n.id
LEFT JOIN profesores_jefe pj ON c.id = pj.curso_id AND pj.anio = c.anio
LEFT JOIN docentes d ON pj.docente_id = d.id
LEFT JOIN matriculas m ON c.id = m.curso_id AND m.estado = 'activo'
WHERE c.activo = TRUE
GROUP BY c.id, c.nombre, n.nombre, c.capacidad_maxima, c.anio, d.nombres, d.apellidos
ORDER BY n.nombre, c.nombre;

-- 12. RESUMEN POR NIVEL EDUCACIONAL
-- Mostrar cantidad de estudiantes, docentes y asignaturas por nivel (básica/media)
SELECT 
    n.nombre AS nivel_educacional,
    COUNT(DISTINCT c.id) AS total_cursos,
    COUNT(DISTINCT m.estudiante_id) AS total_estudiantes,
    COUNT(DISTINCT ad.docente_id) AS total_docentes,
    COUNT(DISTINCT ad.asignatura_id) AS total_asignaturas,
    ROUND(AVG(matriculados.cantidad), 1) AS promedio_estudiantes_por_curso,
    SUM(c.capacidad_maxima) AS capacidad_total,
    ROUND((COUNT(DISTINCT m.estudiante_id) * 100.0 / SUM(c.capacidad_maxima)), 1) AS porcentaje_ocupacion
FROM niveles_educacionales n
JOIN cursos c ON n.id = c.nivel_id
JOIN matriculas m ON c.id = m.curso_id
JOIN asignaciones_docentes ad ON c.id = ad.curso_id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
JOIN (
    SELECT 
        c2.id, 
        COUNT(m2.id) AS cantidad
    FROM cursos c2
    LEFT JOIN matriculas m2 ON c2.id = m2.curso_id AND m2.estado = 'activo'
    WHERE c2.anio = 2024
    GROUP BY c2.id
) matriculados ON c.id = matriculados.id
WHERE c.anio = 2024
  AND m.estado = 'activo'
  AND pa.activo = TRUE
GROUP BY n.id, n.nombre
ORDER BY n.nombre;

-- =====================================================
-- CONSULTAS ADICIONALES ÚTILES
-- =====================================================

-- REPORTE EXTRA 1: ESTUDIANTES CON MEJOR RENDIMIENTO GENERAL (TOP 10)
SELECT 
    ROW_NUMBER() OVER (ORDER BY AVG(n.nota) DESC) AS posicion,
    e.rut,
    CONCAT(e.nombres, ' ', e.apellidos) AS estudiante,
    c.nombre AS curso,
    COUNT(n.nota) AS total_evaluaciones,
    ROUND(AVG(n.nota), 1) AS promedio_general
FROM estudiantes e
JOIN matriculas m ON e.id = m.estudiante_id
JOIN cursos c ON m.curso_id = c.id
JOIN notas n ON e.id = n.estudiante_id
JOIN evaluaciones ev ON n.evaluacion_id = ev.id
JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE pa.activo = TRUE
  AND m.estado = 'activo'
GROUP BY e.id, e.rut, estudiante, c.nombre
HAVING COUNT(n.nota) >= 3
ORDER BY promedio_general DESC
LIMIT 10;

-- REPORTE EXTRA 2: DISTRIBUCIÓN DE NOTAS POR RANGO
WITH distribucion AS (
    SELECT 
        CASE
            WHEN n.nota >= 6.0 THEN 'Excelente (6.0-7.0)'
            WHEN n.nota >= 5.0 THEN 'Bueno (5.0-5.9)'
            WHEN n.nota >= 4.0 THEN 'Suficiente (4.0-4.9)'
            ELSE 'Insuficiente (1.0-3.9)'
        END AS rango_notas,
        COUNT(*) AS cantidad_notas
    FROM notas n
    JOIN evaluaciones ev ON n.evaluacion_id = ev.id
    JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
    JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
    WHERE pa.activo = TRUE
    GROUP BY rango_notas
),
total AS (
    SELECT COUNT(*) AS total_notas
    FROM notas n2
    JOIN evaluaciones ev2 ON n2.evaluacion_id = ev2.id
    JOIN asignaciones_docentes ad2 ON ev2.asignacion_docente_id = ad2.id
    JOIN periodos_academicos pa2 ON ad2.periodo_academico_id = pa2.id
    WHERE pa2.activo = TRUE
)
SELECT 
    d.rango_notas,
    d.cantidad_notas,
    ROUND(d.cantidad_notas * 100.0 / t.total_notas, 1) AS porcentaje
FROM distribucion d
CROSS JOIN total t
ORDER BY 
    CASE d.rango_notas
        WHEN 'Excelente (6.0-7.0)' THEN 1
        WHEN 'Bueno (5.0-5.9)' THEN 2
        WHEN 'Suficiente (4.0-4.9)' THEN 3
        ELSE 4
    END;

-- REPORTE EXTRA 3: DOCENTES CON SUS ASIGNATURAS Y CARGA ACADÉMICA
SELECT 
    d.rut,
    CONCAT(d.nombres, ' ', d.apellidos) AS docente,
    d.especialidad,
    COUNT(DISTINCT ad.curso_id) AS cursos_asignados,
    COUNT(DISTINCT ad.asignatura_id) AS asignaturas_diferentes,
    SUM(a.horas_semanales) AS total_horas_semanales,
    STRING_AGG(DISTINCT CONCAT(a.nombre, ' (', c.nombre, ')'), '; ') AS detalle_asignaciones,
    CASE 
        WHEN EXISTS (SELECT 1 FROM profesores_jefe pj WHERE pj.docente_id = d.id AND pj.anio = EXTRACT(YEAR FROM CURRENT_DATE)) 
        THEN 'SÍ' 
        ELSE 'NO' 
    END AS es_profesor_jefe
FROM docentes d
JOIN asignaciones_docentes ad ON d.id = ad.docente_id
JOIN asignaturas a ON ad.asignatura_id = a.id
JOIN cursos c ON ad.curso_id = c.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE pa.activo = TRUE
  AND d.estado = 'activo'
GROUP BY d.id, d.rut, docente, d.especialidad
ORDER BY total_horas_semanales DESC;

-- =====================================================
-- CONSULTAS ESPECÍFICAS PARA ANÁLISIS AVANZADO
-- =====================================================

-- ANÁLISIS 1: Rendimiento académico por nivel educacional
SELECT 
    n.nombre AS nivel,
    COUNT(DISTINCT e.id) AS total_estudiantes,
    COUNT(no.id) AS total_notas,
    ROUND(AVG(no.nota), 2) AS promedio_general,
    MIN(no.nota) AS nota_minima,
    MAX(no.nota) AS nota_maxima,
    ROUND(STDDEV(no.nota), 2) AS desviacion_estandar,
    COUNT(CASE WHEN no.nota < 4.0 THEN 1 END) AS notas_rojas,
    ROUND(COUNT(CASE WHEN no.nota < 4.0 THEN 1 END) * 100.0 / COUNT(no.id), 1) AS porcentaje_reprobacion
FROM niveles_educacionales n
JOIN cursos c ON n.id = c.nivel_id
JOIN matriculas m ON c.id = m.curso_id
JOIN estudiantes e ON m.estudiante_id = e.id
JOIN notas no ON e.id = no.estudiante_id
JOIN evaluaciones ev ON no.evaluacion_id = ev.id
JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
WHERE pa.activo = TRUE
  AND m.estado = 'activo'
GROUP BY n.id, n.nombre
ORDER BY n.nombre;

-- ANÁLISIS 2: Evolución de notas por estudiante (comparar evaluaciones)
WITH notas_estudiante AS (
    SELECT 
        e.id,
        CONCAT(e.nombres, ' ', e.apellidos) as estudiante,
        c.nombre as curso,
        a.nombre as asignatura,
        AVG(n.nota) as promedio_asignatura,
        COUNT(n.nota) as total_evaluaciones
    FROM estudiantes e
    JOIN matriculas m ON e.id = m.estudiante_id
    JOIN cursos c ON m.curso_id = c.id
    JOIN notas n ON e.id = n.estudiante_id
    JOIN evaluaciones ev ON n.evaluacion_id = ev.id
    JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
    JOIN asignaturas a ON ad.asignatura_id = a.id
    JOIN periodos_academicos pa ON ad.periodo_academico_id = pa.id
    WHERE pa.activo = TRUE
      AND m.estado = 'activo'
    GROUP BY e.id, estudiante, c.nombre, a.id, a.nombre
)
SELECT 
    estudiante,
    curso,
    COUNT(asignatura) as asignaturas_cursadas,
    ROUND(AVG(promedio_asignatura), 1) as promedio_general,
    MIN(promedio_asignatura) as asignatura_mas_baja,
    MAX(promedio_asignatura) as asignatura_mas_alta,
    SUM(total_evaluaciones) as total_evaluaciones_rendidas,
    COUNT(CASE WHEN promedio_asignatura < 4.0 THEN 1 END) as asignaturas_reprobadas
FROM notas_estudiante
GROUP BY id, estudiante, curso
ORDER BY promedio_general DESC;

-- =====================================================
-- FUNCIONES ÚTILES PARA CÁLCULOS
-- =====================================================

-- Función para calcular promedio ponderado (si se implementa ponderación)
/*
CREATE OR REPLACE FUNCTION calcular_promedio_ponderado(
    p_estudiante_id INTEGER,
    p_asignatura_id INTEGER,
    p_periodo_id INTEGER
) 
RETURNS DECIMAL(3,1) AS $$
DECLARE
    promedio DECIMAL(3,1);
BEGIN
    SELECT 
        ROUND(
            SUM(n.nota * (ev.ponderacion / 100.0)) / 
            SUM(ev.ponderacion / 100.0), 1
        )
    INTO promedio
    FROM notas n
    JOIN evaluaciones ev ON n.evaluacion_id = ev.id
    JOIN asignaciones_docentes ad ON ev.asignacion_docente_id = ad.id
    WHERE n.estudiante_id = p_estudiante_id 
      AND ad.asignatura_id = p_asignatura_id
      AND ad.periodo_academico_id = p_periodo_id;
    
    RETURN COALESCE(promedio, 0);
END;
$$ LANGUAGE plpgsql;
*/

-- =====================================================
-- INSTRUCCIONES DE USO PARA POSTGRESQL
-- =====================================================

/*
PRINCIPALES DIFERENCIAS CON MYSQL:

1. FUNCIONES DE FECHA:
   - MySQL: TIMESTAMPDIFF(YEAR, fecha, CURDATE())
   - PostgreSQL: EXTRACT(YEAR FROM AGE(fecha))

2. CONCATENACIÓN:
   - MySQL: CONCAT()
   - PostgreSQL: CONCAT() o || (ambos funcionan)

3. AGGREGACIÓN DE CADENAS:
   - MySQL: GROUP_CONCAT()
   - PostgreSQL: STRING_AGG()

4. VARIABLES DE SESIÓN (RANKING):
   - MySQL: @rownum variables
   - PostgreSQL: ROW_NUMBER() OVER()

5. LÍMITES:
   - MySQL: LIMIT
   - PostgreSQL: LIMIT (igual)

6. TIPOS DE DATOS:
   - MySQL: YEAR
   - PostgreSQL: INTEGER para años

INSTRUCCIONES PARA USAR EN NEON.TECH:

1. Conectarse a la base de datos de Neon
2. Ejecutar las consultas una por una
3. Para consultas parametrizadas, cambiar los valores WHERE según necesidad
4. Las consultas están optimizadas para PostgreSQL 14+

EJEMPLOS DE PERSONALIZACIÓN:
- Cambiar curso: WHERE c.nombre = 'TU_CURSO_AQUI'
- Cambiar estudiante: WHERE e.rut = 'RUT_ESTUDIANTE'
- Cambiar período: WHERE pa.anio = 2024 AND pa.semestre = 1
- Filtrar por estado: WHERE m.estado = 'activo'

Para testing, todas las consultas usan pa.activo = TRUE para mostrar datos del período actual.
*/
