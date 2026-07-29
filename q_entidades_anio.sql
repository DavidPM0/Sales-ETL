SET HEADING OFF
SET PAGESIZE 0
SET FEEDBACK OFF
SET TRIMSPOOL ON
SET LINESIZE 32767

SPOOL raw_entidades_anio.txt
SELECT e.id_entidad || '~' || REPLACE(REPLACE(REPLACE(a.razon_social, '~', ' '), CHR(13), ''), CHR(10), '') || '~' || NVL(t.nombre_tipo_entidad, 'OTRO') || '~' || NVL(s.sector, 'OTRO') || '~' || NVL(d.nombre_departamento, 'DESCONOCIDO') || '~' || NVL(pr.nombre_provincia, 'DESCONOCIDO') || '~' || NVL(di.nombre_distrito, 'DESCONOCIDO') || '~' || to_char(c.fecha_convocatoria, 'YYYY') || '~' || count(distinct c.id_convocatoria) || '~' || round(nvl(sum(distinct c.monto_referencial_total),0),2) || '~' || count(distinct adj.id_adjudicacion) || '~' || round(nvl(sum(adj.monto_adjudicado_soles),0),2)
FROM entidad e
JOIN agente a ON e.id_agente = a.id_agente
LEFT JOIN tipo_entidad t ON e.id_tipo_entidad = t.id_tipo_entidad
LEFT JOIN sector s ON e.id_sector = s.id_sector
LEFT JOIN distrito di ON e.id_distrito = di.id_distrito
LEFT JOIN provincia pr ON di.id_provincia = pr.id_provincia
LEFT JOIN departamento d ON pr.id_departamento = d.id_departamento
JOIN convocatoria c ON e.id_entidad = c.id_entidad
LEFT JOIN item_convocatoria i ON c.id_convocatoria = i.id_convocatoria
LEFT JOIN adjudicacion adj ON i.id_item_convocatoria = adj.id_item_convocatoria
WHERE c.fecha_convocatoria IS NOT NULL
GROUP BY e.id_entidad, a.razon_social, t.nombre_tipo_entidad, s.sector, d.nombre_departamento, pr.nombre_provincia, di.nombre_distrito, to_char(c.fecha_convocatoria, 'YYYY');
SPOOL OFF
EXIT
