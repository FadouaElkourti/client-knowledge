---
layout: cliente
title: "[NOMBRE CLIENTE]"
nombre_cliente: "Nombre Completo del Cliente S.A."
slug: "nombre-cliente"  # usado para URLs y referencias
sector: "Retail / Banca / Salud / Industrial / Tecnología"
contacto: "contacto@cliente.com"
fecha_inicio: "2024-01-15"
descripcion: "Breve descripción del cliente y servicios que prestamos"
logo_cliente: "/assets/images/clientes/logo-cliente.png"
criticidad: "alta"  # baja | media | alta | crítica
author: admin
toc: true
etiquetas:
  - cliente-activo
  - cloud
  - 24x7
tecnologias:
  - "AWS"
  - "PostgreSQL"
  - "Java"
  - "React"
---

## 📋 Información General

### Descripción del Cliente

[Nombre del Cliente] es una empresa del sector [sector] fundada en [año] con sede en [ubicación]. Actualmente gestiona [descripción del negocio principal].

**Servicios contratados:**
- ✅ Hosting y mantenimiento de infraestructura
- ✅ Soporte técnico 24x7
- ✅ Gestión de bases de datos
- ✅ Desarrollo y mantenimiento de aplicaciones
- ✅ Consultoría técnica

### Datos de Contacto

**Contacto Principal:**
- **Nombre:** Juan Pérez
- **Cargo:** CTO
- **Email:** juan.perez@cliente.com
- **Teléfono:** +34 600 000 000
- **Horario:** L-V 9:00-18:00

**Contacto Técnico:**
- **Nombre:** María García
- **Cargo:** IT Manager
- **Email:** maria.garcia@cliente.com
- **Teléfono:** +34 600 000 001

**Contacto Emergencias:**
- **Teléfono:** +34 600 999 999
- **Disponibilidad:** 24x7

---

## 🏢 Contexto del Negocio

### Modelo de Negocio

Descripción del modelo de negocio del cliente, sus productos/servicios principales y cómo la tecnología apoya sus operaciones.

**Productos/Servicios principales:**
1. Producto 1: Descripción
2. Producto 2: Descripción
3. Producto 3: Descripción

**Canales de venta:**
- Tienda online: [URL]
- Tienda física: [ubicaciones]
- Distribuidores

### Estacionalidad y Picos de Tráfico

**Temporada alta:**
- Black Friday: Noviembre
- Navidad: Diciembre
- Rebajas: Enero-Febrero, Julio-Agosto

**Capacidad necesaria:**
- Normal: 1000 usuarios concurrentes
- Picos: hasta 5000 usuarios concurrentes

---

## 💼 Acuerdo de Servicio (SLA)

### Niveles de Servicio

| Servicio | Disponibilidad | Tiempo Respuesta | Tiempo Resolución |
|----------|----------------|------------------|-------------------|
| Incidencia Crítica | 99.9% | 15 minutos | 4 horas |
| Incidencia Alta | 99.5% | 1 hora | 8 horas |
| Incidencia Media | 99% | 4 horas | 24 horas |
| Consulta/Petición | - | 8 horas | 5 días laborables |

### Ventanas de Mantenimiento

**Regular:**
- Día: Domingo
- Horario: 02:00 - 06:00 GMT+1
- Frecuencia: Semanal
- Notificación: 72 horas anticipación

**Emergencia:**
- Aprobación: CTO del cliente
- Notificación: Inmediata
- Comunicación: Email + SMS

### Penalizaciones

- Disponibilidad < 99%: Crédito del 10% mensualidad
- Incidencia crítica > 4h: Crédito del 5% mensualidad

---

## 🖥️ Infraestructura

### Resumen Técnico

**Entorno de producción:**
- **Cloud Provider:** AWS (eu-west-1)
- **Servidores:** 8 instancias EC2
- **Base de datos:** RDS PostgreSQL 15
- **Storage:** 2TB S3 + 500GB EBS
- **CDN:** CloudFront
- **Balanceador:** Application Load Balancer

**Entorno de desarrollo:**
- **Ubicación:** On-premise cliente
- **Acceso:** VPN Site-to-Site

[📄 Ver documentación completa de infraestructura](./infraestructura/)

---

## 🏗️ Arquitectura de Solución

### Stack Tecnológico

**Frontend:**
- Framework: React 18.2
- UI Library: Material-UI
- State Management: Redux

**Backend:**
- Lenguaje: Java 17
- Framework: Spring Boot 3.1
- API: REST + GraphQL

**Base de Datos:**
- Principal: PostgreSQL 15
- Cache: Redis 7
- Búsqueda: Elasticsearch 8

**DevOps:**
- CI/CD: GitHub Actions
- Containers: Docker
- Orchestration: ECS
- IaC: Terraform

[📄 Ver documentación completa de arquitectura](./arquitectura/)

---

## 📅 Historial del Cliente

### Hitos Importantes

**2024-01-15:** Inicio de contrato y migración inicial
- Migración de 500GB de datos
- 0 downtime durante migración
- Proyecto completado en 2 semanas

**2024-03-20:** Implementación módulo de pagos
- Integración con Stripe y Redsys
- PCI-DSS compliance validado

**2024-06-10:** Escalado para Black Friday
- Aumento de capacidad 5x
- Load testing completado

**2024-09-15:** Actualización mayor de plataforma
- Upgrade Java 11 → 17
- PostgreSQL 13 → 15
- React 16 → 18

[📄 Ver historial completo de cambios](./historial/cambios-relevantes/)

### Mantenimientos Programados

[📄 Ver registro de mantenimientos](./historial/mantenimientos/)

---

## 🔧 Incidencias Recientes

{% assign cliente_incidencias = site.incidencias | where: "cliente", page.slug | sort: "date" | reverse | limit: 10 %}

{% if cliente_incidencias.size > 0 %}
<div class="table-responsive">
  <table class="table table-hover">
    <thead>
      <tr>
        <th>Fecha</th>
        <th>Título</th>
        <th>Estado</th>
        <th>Prioridad</th>
      </tr>
    </thead>
    <tbody>
      {% for inc in cliente_incidencias %}
      <tr>
        <td>{{ inc.date | date: "%d/%m/%Y" }}</td>
        <td><a href="{{ inc.url }}">{{ inc.title }}</a></td>
        <td><span class="badge badge-{{ inc.estado }}">{{ inc.estado }}</span></td>
        <td>{{ inc.prioridad }}</td>
      </tr>
      {% endfor %}
    </tbody>
  </table>
</div>

[📄 Ver todas las incidencias](../incidencias/?cliente={{ page.slug }})

{% else %}
<p class="alert alert-success">✅ No hay incidencias registradas para este cliente.</p>
{% endif %}

---

## 📊 Métricas y KPIs

### Disponibilidad (último mes)

- **Uptime:** 99.95%
- **Downtime:** 22 minutos (mantenimiento programado)
- **Incidencias:** 3 (2 menores, 1 media)

### Performance

- **Response Time promedio:** 85ms
- **95th percentile:** 250ms
- **Error rate:** 0.02%

### Uso de Recursos

- **CPU promedio:** 45%
- **RAM promedio:** 60%
- **Storage usado:** 1.2TB / 2TB (60%)
- **Bandwidth:** 500GB/mes promedio

---

## 💰 Información Comercial

### Contrato Actual

- **Tipo:** Anual con renovación automática
- **Inicio:** 15/01/2024
- **Renovación:** 15/01/2026
- **Mensualidad:** 5.000€ + IVA
- **Facturación:** Trimestral anticipada

### Servicios Adicionales Contratados

- Horas desarrollo: 40h/mes
- Storage adicional: 500GB
- Backup offsite: Sí
- Soporte 24x7: Sí

---

## 🤖 Notas del Agente IA

```json
{
  "id_cliente": "nombre-cliente",
  "estado": "activo",
  "nivel_servicio": "premium",
  "industria": "retail",
  "tamano": "mediana_empresa",
  "empleados": "200-500",
  "facturacion_anual_estimada": "10M-50M EUR",
  "tecnologias_principales": [
    "aws", "postgresql", "java", "react"
  ],
  "complejidad_infraestructura": "media-alta",
  "criticidad_servicio": "alta",
  "horario_negocio": {
    "dias": "lunes-domingo",
    "horas": "24x7",
    "timezone": "Europe/Madrid"
  },
  "patron_uso": {
    "picos_trafico": ["black-friday", "navidad", "rebajas"],
    "temporada_baja": ["agosto"],
    "crecimiento_anual": "15%"
  },
  "integraciones_externas": [
    "stripe", "redsys", "sendgrid", "aws-ses"
  ],
  "compliance": ["GDPR", "PCI-DSS"],
  "backup_strategy": "diario-incremental-semanal-completo",
  "rpo_rto": {
    "rpo": "24h",
    "rto": "4h"
  },
  "proxima_revision": "2026-01-15",
  "alertas_activas": 0,
  "incidencias_abiertas": 0,
  "satisfaccion_cliente": "alta"
}
```

**Patrones identificados:**
- Cliente estable con crecimiento sostenido
- Requiere escalado para campañas estacionales
- Proactivo en aplicar actualizaciones de seguridad
- Comunicación fluida con equipo técnico

**Recomendaciones:**
- Considerar migrar a arquitectura multi-región para mayor resiliencia
- Implementar auto-scaling para picos de tráfico
- Revisar plan de disaster recovery anualmente
- Evaluar implementación de caché distribuida para mejorar performance

---

## 📎 Documentación Relacionada

### Enlaces Internos
- [Infraestructura detallada](./infraestructura/)
- [Arquitectura de aplicación](./arquitectura/)
- [Procedimientos operativos](./runbooks/)
- [Historial de cambios](./historial/cambios-relevantes/)
- [Registro de mantenimientos](./historial/mantenimientos/)

### Enlaces Externos
- [Portal del cliente](https://portal.cliente.com)
- [Dashboard de monitoreo](https://monitoring.empresa.com/cliente)
- [Repositorio de código](https://github.com/empresa/cliente-app)

### Documentos
- [Contrato firmado](../assets/docs/contrato-cliente.pdf)
- [SLA acordado](../assets/docs/sla-cliente.pdf)
- [Diagrama de arquitectura](../assets/docs/arquitectura-cliente.pdf)
