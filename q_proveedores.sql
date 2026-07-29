SET HEADING OFF
SET PAGESIZE 0
SET FEEDBACK OFF
SET TRIMSPOOL ON
SET LINESIZE 32767

SPOOL raw_top_proveedores.txt
SELECT ag.ruc || '~' || REPLACE(ag.razon_social, '~', ' ') || '~' || NVL(tp.nombre_tipo_proveedor, 'Persona Juridica') || '~' || COUNT(DISTINCT a.id_adjudicacion) || '~' || ROUND(SUM(a.monto_adjudicado_soles), 2)
FROM proveedor pr
JOIN agente ag ON pr.id_agente = ag.id_agente
LEFT JOIN tipo_proveedor tp ON pr.id_tipo_proveedor = tp.id_tipo_proveedor
JOIN adjudicacion a ON pr.id_proveedor = a.id_proveedor
GROUP BY ag.ruc, ag.razon_social, tp.nombre_tipo_proveedor
ORDER BY ROUND(SUM(a.monto_adjudicado_soles), 2) DESC;
SPOOL OFF

SPOOL raw_tipo_proveedor.txt
SELECT NVL(tp.nombre_tipo_proveedor, 'Persona Juridica') || '~' || COUNT(DISTINCT a.id_adjudicacion) || '~' || ROUND(SUM(a.monto_adjudicado_soles), 2)
FROM proveedor pr
LEFT JOIN tipo_proveedor tp ON pr.id_tipo_proveedor = tp.id_tipo_proveedor
JOIN adjudicacion a ON pr.id_proveedor = a.id_proveedor
GROUP BY tp.nombre_tipo_proveedor
ORDER BY ROUND(SUM(a.monto_adjudicado_soles), 2) DESC;
SPOOL OFF

SPOOL raw_normativa.txt
SELECT n.nombre_normativa || '~' || COUNT(DISTINCT c.id_convocatoria) || '~' || ROUND(SUM(c.monto_referencial_total), 2)
FROM normativa n
JOIN convocatoria c ON n.id_normativa = c.id_normativa
GROUP BY n.nombre_normativa
ORDER BY COUNT(DISTINCT c.id_convocatoria) DESC;
SPOOL OFF

EXIT;
