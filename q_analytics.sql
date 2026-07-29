SET HEADING OFF
SET PAGESIZE 0
SET FEEDBACK OFF
SET TRIMSPOOL ON
SET LINESIZE 32767

SPOOL raw_grupos_cubso.txt
SELECT g.descripcion_grupo || '~' || COUNT(DISTINCT a.id_adjudicacion) || '~' || ROUND(SUM(a.monto_adjudicado_soles), 2)
FROM grupo g
JOIN familia f ON g.id_grupo = f.id_grupo
JOIN clase cl ON f.id_familia = cl.id_familia
JOIN commodity cm ON cl.id_clase = cm.id_clase
JOIN cubso cb ON cm.id_commodity = cb.id_commodity
JOIN item_convocatoria i ON cb.id_cubso = i.id_cubso
JOIN adjudicacion a ON i.id_item_convocatoria = a.id_item_convocatoria
GROUP BY g.descripcion_grupo
ORDER BY ROUND(SUM(a.monto_adjudicado_soles), 2) DESC;
SPOOL OFF

SPOOL raw_commodities.txt
SELECT cm.descripcion_commodity || '~' || COUNT(DISTINCT a.id_adjudicacion) || '~' || ROUND(SUM(a.monto_adjudicado_soles), 2)
FROM commodity cm
JOIN cubso cb ON cm.id_commodity = cb.id_commodity
JOIN item_convocatoria i ON cb.id_cubso = i.id_cubso
JOIN adjudicacion a ON i.id_item_convocatoria = a.id_item_convocatoria
GROUP BY cm.descripcion_commodity
ORDER BY ROUND(SUM(a.monto_adjudicado_soles), 2) DESC;
SPOOL OFF

SPOOL raw_objeto_contractual.txt
SELECT oc.nombre_objeto_contractual || '~' || COUNT(DISTINCT c.id_convocatoria) || '~' || COUNT(DISTINCT a.id_adjudicacion) || '~' || ROUND(SUM(a.monto_adjudicado_soles), 2)
FROM objeto_contractual oc
JOIN proceso p ON oc.id_objeto_contractual = p.id_objeto_contractual
JOIN convocatoria c ON p.id_proceso = c.id_proceso
LEFT JOIN item_convocatoria i ON c.id_convocatoria = i.id_convocatoria
LEFT JOIN adjudicacion a ON i.id_item_convocatoria = a.id_item_convocatoria
GROUP BY oc.nombre_objeto_contractual
ORDER BY ROUND(SUM(a.monto_adjudicado_soles), 2) DESC;
SPOOL OFF

SPOOL raw_sistema_contratacion.txt
SELECT sc.sistema_contratacion || '~' || COUNT(DISTINCT a.id_adjudicacion) || '~' || ROUND(SUM(a.monto_adjudicado_soles), 2)
FROM sistema_contratacion sc
JOIN item_convocatoria i ON sc.id_sistema_contratacion = i.id_sistema_contratacion
JOIN adjudicacion a ON i.id_item_convocatoria = a.id_item_convocatoria
GROUP BY sc.sistema_contratacion
ORDER BY ROUND(SUM(a.monto_adjudicado_soles), 2) DESC;
SPOOL OFF

SPOOL raw_tipo_proceso.txt
SELECT tp.tipo_proceso_seleccion || '~' || COUNT(DISTINCT c.id_convocatoria) || '~' || COUNT(DISTINCT a.id_adjudicacion) || '~' || ROUND(SUM(a.monto_adjudicado_soles), 2)
FROM tipo_proceso tp
JOIN proceso p ON tp.id_tipo_proceso = p.id_tipo_proceso
JOIN convocatoria c ON p.id_proceso = c.id_proceso
LEFT JOIN item_convocatoria i ON c.id_convocatoria = i.id_convocatoria
LEFT JOIN adjudicacion a ON i.id_item_convocatoria = a.id_item_convocatoria
GROUP BY tp.tipo_proceso_seleccion
ORDER BY ROUND(SUM(a.monto_adjudicado_soles), 2) DESC;
SPOOL OFF

EXIT;
