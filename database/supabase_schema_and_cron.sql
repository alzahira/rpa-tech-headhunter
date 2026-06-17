-- ====================================================================================
-- ESQUEMA DE BASE DE DATOS: RPA Tech Headhunter
-- Base de datos: PostgreSQL (Supabase)
-- ====================================================================================

-- 1. CREACIÓN DE LA TABLA PRINCIPAL
-- Esta tabla almacena las vacantes extraídas y los resultados de la evaluación de la IA.
CREATE TABLE ofertas_infojobs (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    titulo TEXT NOT NULL,
    empresa TEXT,
    enlace TEXT UNIQUE NOT NULL, -- UNIQUE evita registros duplicados si el robot raspa la misma oferta varios días
    match_score INTEGER,         -- Nota de afinidad calculada por la IA (0-100)
    motivo TEXT                  -- Justificación en texto generada por la IA
);

-- Índices para mejorar el rendimiento de las consultas (especialmente para el CRON y el dashboard)
CREATE INDEX idx_ofertas_created_at ON ofertas_infojobs(created_at);
CREATE INDEX idx_ofertas_match_score ON ofertas_infojobs(match_score DESC);

-- ====================================================================================
-- 2. AUTOMATIZACIÓN DE MANTENIMIENTO (pg_cron)
-- Rutina autónoma para evitar que la base de datos supere los límites de almacenamiento
-- ====================================================================================

-- Habilitar la extensión nativa de CRON en PostgreSQL (Requerido en Supabase)
CREATE EXTENSION IF NOT EXISTS pg_cron;

-- Programar la tarea de limpieza:
-- Se ejecuta todos los días a las 03:00 AM ('0 3 * * *')
-- Acción: Borrar cualquier registro cuya fecha de creación sea anterior a 30 días.
SELECT cron.schedule(
    'purga_ofertas_antiguas', 
    '0 3 * * *', 
    $$ DELETE FROM ofertas_infojobs WHERE created_at < NOW() - INTERVAL '30 days'; $$
);

-- Nota: Para ver los trabajos programados activos puedes ejecutar:
-- SELECT * FROM cron.job;