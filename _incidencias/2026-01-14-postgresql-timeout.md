---
layout: incidencia
title: "Error de timeout en conexiones a base de datos PostgreSQL"
date: 2026-01-14 10:30:00 +0100
cliente: "acme-corp"
estado: "resuelto"
prioridad: "alta"
tecnologias:
  - "PostgreSQL"
  - "AWS RDS"
  - "Connection Pool"
descripcion_breve: "Timeouts intermitentes en conexiones a PostgreSQL causando errores 500 en la aplicación web"
impacto: "Aproximadamente 15% de las peticiones fallaban, afectando a usuarios durante el checkout"
tiempo_resolucion: "2 horas 15 minutos"
author: tecnico1
toc: true
relacionadas: []
lecciones_aprendidas: |
  - Monitorear activamente el uso del connection pool
  - Configurar alertas proactivas cuando el pool alcance 80% de uso
  - Revisar queries lentas que mantienen conexiones abiertas
---

## 📋 Descripción del Problema

**Contexto:**
El día 14/01/2026 a las 10:30h, el sistema de monitoreo detectó un incremento significativo en errores HTTP 500 en la aplicación web de Acme Corp. Los usuarios reportaron imposibilidad para completar compras.

**Síntomas observados:**
- Errores intermitentes "Connection timeout" en logs de aplicación
- Tiempo de respuesta API incrementado de 200ms a 3000ms
- Tasa de error HTTP 500: 15% del tráfico total
- Dashboard de monitoreo mostraba connection pool al 100%

**Fecha de detección:** 14/01/2026 10:30:00

**Usuarios/Sistemas afectados:**
- Aplicación web principal (checkout y búsqueda de productos)
- Aproximadamente 500 usuarios concurrentes afectados
- Pérdida estimada: 50 transacciones durante el incidente

---

## 🔍 Diagnóstico y Causa Raíz

**Proceso de investigación:**

1. **Verificación de estado de base de datos RDS:**
   - CPU: 45% (normal)
   - Conexiones activas: 200/200 (máximo alcanzado)
   - Memoria: 70% (normal)
   
2. **Análisis de logs de aplicación:**
   ```
   [ERROR] 2026-01-14T10:32:15 - Connection timeout after 5000ms
   [ERROR] 2026-01-14T10:32:18 - Pool exhausted, waiting for available connection
   [ERROR] 2026-01-14T10:32:20 - Could not acquire connection from pool
   ```

3. **Revisión de queries activas:**
   Detectadas múltiples queries de búsqueda sin cerrar conexión correctamente

**Causa raíz identificada:**

El problema fue causado por un bug en el módulo de búsqueda introducido en el despliegue de la versión 2.5.3 del día anterior. Las búsquedas complejas con múltiples filtros no liberaban las conexiones del pool correctamente, causando acumulación de conexiones "colgadas".

**Evidencias:**
```sql
-- Query para ver conexiones activas
SELECT 
    pid,
    usename,
    application_name,
    client_addr,
    state,
    query_start,
    state_change,
    query
FROM pg_stat_activity
WHERE state != 'idle'
ORDER BY query_start;

-- Resultado: 180 conexiones en estado "idle in transaction" 
-- desde hace más de 5 minutos
```

---

## ✅ Solución Implementada

**Pasos de resolución:**

1. **Acción inmediata - Liberar conexiones colgadas:**
   ```sql
   -- Terminar conexiones idle en transacción > 5 minutos
   SELECT pg_terminate_backend(pid)
   FROM pg_stat_activity
   WHERE state = 'idle in transaction'
   AND state_change < now() - interval '5 minutes';
   
   -- Resultado: 175 conexiones terminadas
   ```
   **Tiempo:** 10:35h - Pool liberado, servicio restaurado parcialmente

2. **Rollback de código problemático:**
   ```bash
   # Rollback a versión anterior estable
   cd /opt/acme-app
   git checkout v2.5.2
   pm2 restart all
   
   # Verificar que el servicio responde correctamente
   curl -I https://api.acmecorp.com/health
   ```
   **Tiempo:** 10:45h - Servicio completamente restaurado

3. **Incremento temporal del connection pool:**
   ```javascript
   // config/database.js - Configuración temporal
   pool: {
     max: 300,        // Aumentado de 200
     min: 20,
     idle: 10000,
     acquire: 30000,
     evict: 10000
   }
   ```
   **Tiempo:** 11:00h - Mayor capacidad disponible

**Configuración modificada:**
- `max_connections` PostgreSQL: 200 → 300
- `pool.max` aplicación: 200 → 300
- `pool.idle` aplicación: 30000ms → 10000ms (liberar conexiones idle más rápido)

---

## 🎯 Resultado Final

**Estado actual:**
- ✅ Servicio completamente restaurado a las 11:15h
- ✅ Tasa de error < 0.1% (nivel normal)
- ✅ Tiempo de respuesta API: 180ms promedio
- ✅ Connection pool operando al 60%

**Validación:**
- ✅ Load test con 1000 usuarios concurrentes - OK
- ✅ Verificación de búsquedas complejas - OK
- ✅ Monitoreo de conexiones durante 2 horas - Estable

**Fecha de resolución:** 14/01/2026 12:45:00

---

## 📚 Lecciones Aprendidas

**Conclusiones:**
- El código del módulo de búsqueda no implementaba correctamente el patrón try-finally para cerrar conexiones
- Faltaban pruebas de integración que verificaran la liberación de conexiones
- El monitoreo actual no alertaba proactivamente sobre pool exhaustion

**Mejoras propuestas:**
- [x] Implementar alerta cuando connection pool > 80%
- [x] Code review para verificar cierre correcto de conexiones
- [ ] Añadir pruebas automatizadas de connection pooling
- [ ] Implementar circuit breaker para prevenir cascadas de fallos
- [ ] Documentar patrones correctos de manejo de conexiones

**Documentación actualizada:**
- [x] Runbook de respuesta a connection pool exhaustion
- [x] Playbook de rollback de despliegues
- [ ] Guía de desarrollo: Manejo de conexiones DB

---

## 🤖 Notas del Agente IA

**Contexto para IA:**
```json
{
  "tipo_problema": "database_connection_pool_exhaustion",
  "severidad": "alta",
  "tiempo_deteccion_minutos": 5,
  "tiempo_resolucion_minutos": 135,
  "automatizable": true,
  "keywords": [
    "postgresql", 
    "connection pool", 
    "timeout", 
    "idle in transaction",
    "resource exhaustion"
  ],
  "patron_similar": "INC-2025-03-15-db-connections",
  "metricas": {
    "conexiones_activas_pico": 200,
    "conexiones_idle_transaction": 175,
    "error_rate_pico": "15%",
    "usuarios_afectados": 500,
    "transacciones_perdidas": 50
  }
}
```

**Patrones detectados:**
- **Patrón:** Agotamiento de connection pool tras despliegue
- **Frecuencia:** 2ª vez en 6 meses (anterior: marzo 2025)
- **Indicador temprano:** Incremento gradual de conexiones "idle in transaction"

**Recomendaciones para prevención:**
- Implementar timeout automático para conexiones idle in transaction (< 30s)
- Pre-deployment check: validar que nuevos cambios no introducen leaks de conexiones
- Monitoreo continuo de pg_stat_activity con alertas tempranas
- Considerar usar PgBouncer como connection pooler externo

**Automatización posible:**
```python
# Script de detección automática
def check_connection_pool_health():
    idle_connections = query("SELECT count(*) FROM pg_stat_activity 
                             WHERE state = 'idle in transaction' 
                             AND state_change < now() - interval '2 minutes'")
    
    if idle_connections > 50:
        alert("High number of idle in transaction connections")
        # Auto-remediation: kill connections > 5 minutes
        query("SELECT pg_terminate_backend(pid) 
               FROM pg_stat_activity 
               WHERE state = 'idle in transaction' 
               AND state_change < now() - interval '5 minutes'")
```

**Relación con incidencias previas:**
Esta incidencia es similar a INC-2025-03-15 donde también hubo problemas con connection pool, pero en ese caso fue por un query lento, no por leak de conexiones.

---

## 📎 Archivos Adjuntos

- [Logs completos de la incidencia](../assets/logs/2026-01-14-db-timeout.log)
- [Gráficas de monitoreo](../assets/images/incidencias/2026-01-14-graphs.png)
- [Análisis de queries lentas](../assets/docs/2026-01-14-slow-queries.pdf)
