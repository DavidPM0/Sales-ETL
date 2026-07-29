# Sales ETL - Peru Public Procurement Analytics Dashboard

Un dashboard ejecutivo moderno e interactivo para visualizar y analizar el proceso de Contrataciones del Estado Peruano (Convocatorias vs. Adjudicaciones), alimentado por datos almacenados en **Oracle 19c Database** (`usr_etl` / `ORCLPDB1`).

---

## 🚀 Vistas del Dashboard

El proyecto incluye 3 vistas principales construidas con HTML5, CSS3 vanila y JavaScript:

1. **[Convocatoria vs Adjudicados (`dashboard.html`)](dashboard.html)**
   * Resumen por Entidad Pública con tabla interactiva, ordenamiento y buscador.
   * Tarjetas KPI ejecutivas con comparación anual (2024 vs 2023) y porcentaje de variación.
   * Gráfico de barras horizontal por Sector (Chart.js).
   * Gráfico de serie de tiempo de Evolución Mensual de Convocatorias vs. Adjudicaciones.

2. **[Top por Departamento (`departamentos.html`)](departamentos.html)**
   * Desglose completo por departamento.
   * Tarjetas visuales de **TOP 5** por año con barras de progreso relativas.
   * Resumen histórico anual para el departamento de Lima.

3. **[Mapa Geográfico (`mapa.html`)](mapa.html)**
   * Mapa geográfico interactivo de Perú construido con Leaflet JS y azulejos oscuros (CARTO Dark Matter).
   * Burbujas proporcionales por departamento según el monto adjudicado.
   * Fondo marino personalizado (`#1e293b`) y tarjetas emergentes (*popups*) en modo oscuro.

---

## 🗄️ Arquitectura de Datos

* **Motor BD:** Oracle Database 19c Enterprise / Standard (PDB `ORCLPDB1`).
* **Dataset Consolidador:** `data.json` (Generado desde consultas aggregadas en Oracle 19c).
* **Cobertura:** 
  * Convocatorias totales: `305,943`
  * Adjudicaciones totales: `255,156`
  * Monto Adjudicado total: `S/ 226,044,471,041.99`
  * Cobertura nacional: 25 Departamentos y 3,008 Entidades Públicas.

---

## 💻 Ejecución Local

Puedes servir los archivos desde cualquier servidor web estático local (como Python HTTP Server):

```bash
python -m http.server 8000
```

Luego abre en tu navegador:
* `http://localhost:8000/dashboard.html`
* `http://localhost:8000/departamentos.html`
* `http://localhost:8000/mapa.html`

---

© 2024 Sales ETL - Visualización de Datos.
