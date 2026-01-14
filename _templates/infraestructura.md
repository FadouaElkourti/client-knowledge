---
layout: cliente
title: "Infraestructura de [NOMBRE CLIENTE]"
nombre_cliente: "Nombre del Cliente"
slug: "slug-cliente"
descripcion: "Documentación completa de la infraestructura del cliente"
fecha_actualizacion: YYYY-MM-DD
author: admin
toc: true
etiquetas:
  - infraestructura
  - arquitectura
---

## 🖥️ Resumen Ejecutivo

**Entorno:** Producción / Desarrollo / Testing
**Proveedor Cloud:** AWS / Azure / GCP / On-Premise
**Nivel de servicio:** 24x7 / Horario comercial
**Contacto técnico:** nombre@cliente.com

---

## 🏗️ Arquitectura General

```
┌─────────────────────────────────────────┐
│          DIAGRAMA ASCII O ENLACE        │
│                                         │
│   [Balanceador] → [App Servers]        │
│         ↓                               │
│   [Base de Datos] ← [Cache]            │
└─────────────────────────────────────────┘
```

**Componentes principales:**
- Componente 1: descripción
- Componente 2: descripción
- Componente 3: descripción

---

## 🖥️ Servidores

### Servidor de Aplicación - PRD-APP-01

**Especificaciones:**
- **Sistema Operativo:** Ubuntu 22.04 LTS
- **CPU:** 8 vCPUs
- **RAM:** 32 GB
- **Disco:** 500 GB SSD
- **IP Privada:** 10.0.1.10
- **IP Pública:** 203.0.113.10

**Software instalado:**
- Application Server: Apache Tomcat 9.0.75
- Java: OpenJDK 17
- Agent de monitoreo: Datadog Agent

**Propósito:**
Servidor principal de aplicación web para el sistema ERP.

**Accesos:**
- SSH: `ssh admin@203.0.113.10`
- Usuario admin: Documentado en vault
- Llaves SSH: En repositorio de claves

---

### Base de Datos - PRD-DB-01

**Especificaciones:**
- **Sistema Operativo:** Red Hat Enterprise Linux 8
- **CPU:** 16 vCPUs
- **RAM:** 64 GB
- **Disco:** 2 TB SSD (RAID 10)
- **IP Privada:** 10.0.1.20

**Software instalado:**
- DBMS: PostgreSQL 15.3
- Backup: pgBackRest
- Replicación: Streaming replication

**Propósito:**
Base de datos principal del ERP.

**Configuración crítica:**
```ini
max_connections = 500
shared_buffers = 16GB
effective_cache_size = 48GB
maintenance_work_mem = 2GB
```

---

## 🌐 Red y Conectividad

### VLANs

| VLAN | Nombre | Subnet | Gateway | Propósito |
|------|--------|--------|---------|-----------|
| 10 | DMZ | 10.0.1.0/24 | 10.0.1.1 | Servidores web públicos |
| 20 | APP | 10.0.2.0/24 | 10.0.2.1 | Servidores de aplicación |
| 30 | DB | 10.0.3.0/24 | 10.0.3.1 | Bases de datos |
| 40 | MGMT | 10.0.4.0/24 | 10.0.4.1 | Gestión y monitoreo |

### Firewall Rules

**Reglas principales:**
```
# Acceso web público
ALLOW TCP 443 FROM any TO 10.0.1.0/24

# Aplicación a base de datos
ALLOW TCP 5432 FROM 10.0.2.0/24 TO 10.0.3.20

# Gestión SSH
ALLOW TCP 22 FROM 203.0.113.0/24 TO 10.0.4.0/24
```

### VPN

**Tipo:** Site-to-Site IPSec VPN
**Proveedor:** Fortinet FortiGate
**Túnel:** cliente-hq ↔ datacenter-principal
**Subredes remotas:** 192.168.10.0/24

---

## 🗄️ Almacenamiento

### Storage Principal

- **Tipo:** SAN iSCSI
- **Capacidad:** 10 TB
- **RAID:** RAID 6
- **Snapshot:** Diario, retención 7 días

### Backups

**Estrategia de backup:**
- **Frecuencia:** Diaria incremental, semanal completa
- **Retención:** 30 días online, 1 año offline
- **Ubicación:** 
  - Primaria: Datacenter local
  - Secundaria: AWS S3 (región eu-west-1)
- **RPO:** 24 horas
- **RTO:** 4 horas

**Procedimiento de restauración:**
1. Verificar backup disponible
2. Ejecutar script de restauración
3. Validar integridad de datos

---

## 🔐 Seguridad

### Accesos y Autenticación

- **Sistema de autenticación:** Active Directory
- **MFA:** Obligatorio para accesos externos
- **VPN:** Requerida para acceso remoto
- **Bastion Host:** 203.0.113.100

### Certificados SSL

| Dominio | Proveedor | Expiración | Renovación |
|---------|-----------|------------|------------|
| app.cliente.com | Let's Encrypt | 15/03/2026 | Automática |
| api.cliente.com | DigiCert | 20/06/2026 | Manual |

### Parches y Actualizaciones

- **SO:** Mensual, tercer domingo del mes
- **Aplicaciones:** Según calendario del proveedor
- **Seguridad crítica:** Inmediata tras evaluación

---

## 📊 Monitoreo

### Herramientas

- **APM:** Datadog
- **Logs:** ELK Stack (Elasticsearch, Logstash, Kibana)
- **Infraestructura:** Prometheus + Grafana
- **Uptime:** Pingdom

### Métricas Clave

| Métrica | Umbral Warning | Umbral Critical | Acción |
|---------|----------------|-----------------|--------|
| CPU | 70% | 85% | Escalar verticalmente |
| RAM | 80% | 90% | Investigar memory leaks |
| Disco | 75% | 90% | Limpiar logs / Expandir |
| Latencia DB | 100ms | 500ms | Optimizar queries |

### Alertas Configuradas

```yaml
- nombre: "High CPU Usage"
  condicion: "cpu.usage > 85%"
  duracion: "5 minutos"
  notificar: "oncall@empresa.com"
  
- nombre: "Database Connection Pool Full"
  condicion: "db.connections.used / db.connections.max > 0.9"
  notificar: "dba@empresa.com"
```

---

## 🔄 Procedimientos de Operación

### Reinicio de Aplicación

```bash
# 1. Conectar al servidor
ssh admin@prd-app-01

# 2. Detener aplicación
sudo systemctl stop tomcat

# 3. Verificar que no hay procesos
ps aux | grep java

# 4. Iniciar aplicación
sudo systemctl start tomcat

# 5. Verificar logs
sudo tail -f /var/log/tomcat/catalina.out
```

### Despliegue de Nueva Versión

1. Crear backup pre-despliegue
2. Notificar a usuarios (ventana de mantenimiento)
3. Ejecutar script de despliegue
4. Smoke tests
5. Rollback si es necesario

---

## 📞 Contactos

### Equipo Técnico Cliente

| Rol | Nombre | Email | Teléfono |
|-----|--------|-------|----------|
| CTO | Juan Pérez | juan.perez@cliente.com | +34 600 000 000 |
| Sysadmin | María García | maria.garcia@cliente.com | +34 600 000 001 |

### Proveedores

| Servicio | Proveedor | Contacto | SLA |
|----------|-----------|----------|-----|
| Cloud | AWS | aws-support@amazon.com | Premium |
| SSL | DigiCert | soporte@digicert.com | Estándar |

---

## 🤖 Metadata para IA

```json
{
  "entorno": "produccion",
  "tipo_infraestructura": "cloud_hibrida",
  "tecnologias": ["linux", "postgresql", "java", "tomcat"],
  "nivel_criticidad": "alto",
  "ventana_mantenimiento": "domingo 02:00-06:00",
  "requiere_aprobacion_cambios": true,
  "equipo_responsable": "ops-team",
  "ultima_auditoria": "2025-01-10",
  "proxima_revision": "2026-07-01"
}
```

**Patrones de uso:**
- Peak hours: 09:00-18:00 GMT+1
- Tráfico promedio: 1000 req/min
- Usuarios concurrentes: ~500

**Dependencias críticas:**
- Servicio externo API: api.proveedor.com
- Sistema de pago: gateway.payment.com
- Servicio de email: SMTP Office365
