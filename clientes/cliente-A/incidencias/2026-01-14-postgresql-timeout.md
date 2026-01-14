---
layout: incidencia
title: "Timeout en PostgreSQL durante horario pico"
date: 2026-01-14 10:30:00 +0200
cliente: "Cliente A"
categoria: "Incidencia"
tipo_incidencia: "Infraestructura"
prioridad: "alta"
estado: "resuelto"
tags: [postgresql, timeout, base-datos, rendimiento]
autor: admin
sistema_afectado: "Base de Datos PostgreSQL"
tiempo_resolucion: "2 horas"
ai_relevance: high
---

## 📋 Descripción del Problema

El cliente reportó timeouts intermitentes en consultas a la base de datos PostgreSQL durante las horas pico de uso (10:00-12:00).

## 🔍 Análisis Inicial

- **Síntomas observados:** Consultas tardando >30 segundos, timeouts en aplicación web
- **Sistemas afectados:** Base de datos PostgreSQL 14, aplicación web
- **Impacto en el negocio:** Usuarios no pueden acceder a reportes en tiempo real

## 🛠️ Pasos de Resolución

1. Revisar logs de PostgreSQL en el servidor
2. Identificar queries lentas en pg_stat_statements
3. Analizar plan de ejecución de consultas problemáticas
4. Aplicar optimización de índices
5. Verificar configuración de pool de conexiones

## ✅ Solución Aplicada

Se identificó una query sin índice en la tabla `transactions` que causaba full table scans. Se creó el índice faltante y se optimizaron las consultas más frecuentes.

```sql
CREATE INDEX idx_transactions_date ON transactions(created_at);
```

## 📊 Resultados

- **Tiempo de consulta reducido:** De 45s a 0.3s
- **Carga de CPU:** Reducida del 85% al 20%
- **Satisfacción del cliente:** Alta

## 🔗 Referencias

- Ticket: #12345
- Documentación: [PostgreSQL Performance Tuning]
