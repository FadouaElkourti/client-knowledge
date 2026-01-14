# ClientLog

Sistema de repositorio interno completo para gestión de clientes, actividades comerciales, incidencias técnicas, reuniones y seguimiento.

## 🚀 Inicio Rápido

```powershell
# Iniciar servidor Jekyll
.\start.ps1
```

Abre en navegador: http://localhost:4000

## 📁 Estructura del Proyecto

```
clientlog/
├── clientes/               # Carpetas por cliente
│   └── cliente-A/
│       ├── index.md                    # Ficha del cliente
│       ├── notas-ia.md                 # Análisis IA
│       ├── incidencias/                # Incidencias técnicas
│       ├── actividades-comerciales/    # Ventas y oportunidades
│       ├── reuniones/                  # Actas de reuniones
│       └── historial/                  # Timeline de eventos
├── scripts/                # Scripts PowerShell
│   ├── nuevo-cliente.ps1
│   ├── nueva-incidencia.ps1
│   ├── nueva-actividad.ps1
│   ├── nueva-reunion.ps1
│   └── start.ps1
├── _templates/             # Plantillas Markdown
├── docs/                   # Documentación
└── _layouts/               # Layouts Jekyll
```

## 💼 Uso Diario

### Crear Nuevo Cliente
```powershell
.\scripts\nuevo-cliente.ps1
```

### Registrar Incidencia
```powershell
.\scripts\nueva-incidencia.ps1
```

### Crear Actividad Comercial
```powershell
.\scripts\nueva-actividad.ps1
```

### Registrar Reunión
```powershell
.\scripts\nueva-reunion.ps1
```

## 📚 Documentación Completa

- [Documentación Completa](docs/DOCUMENTACION-COMPLETA.md)
- [Guía de Inicio Rápido](docs/INICIO-RAPIDO.md)
- [Documentación Técnica](docs/DOCUMENTACION.md)

## 🛠️ Tecnologías

- Jekyll 4.3.4
- Ruby 3.3
- Tailwind CSS (CDN)
- Markdown + Liquid
- PowerShell Scripts

## 📝 Características

✅ Gestión completa de clientes con estructura jerárquica  
✅ Incidencias técnicas con seguimiento detallado  
✅ Actividades comerciales (ventas, ofertas, oportunidades)  
✅ Registro de reuniones con actas y compromisos  
✅ Historial completo de eventos por cliente  
✅ Notas generadas por IA  
✅ Scripts de automatización  
✅ Diseño moderno y responsive  
✅ Front matter YAML estructurado  

## 🔧 Requisitos

- Ruby 3.x con DevKit
- Jekyll 4.x
- Bundler
- PowerShell 5.1+

## 📦 Instalación

```powershell
# Instalar dependencias
bundle install

# Iniciar servidor
.\start.ps1
```

## 📖 Metadatos YAML

Cada documento incluye metadatos estructurados:

```yaml
---
title: "Título"
date: YYYY-MM-DD HH:MM:SS +0200
cliente: "nombre-cliente"
categoria: "Incidencia/Actividad Comercial/Reunión"
estado: "abierto/en_progreso/resuelto"
tags: [tag1, tag2]
ai_relevance: low/medium/high
---
```

## 🎨 Personalización

Ver [docs/DOCUMENTACION-COMPLETA.md](docs/DOCUMENTACION-COMPLETA.md) para personalizar colores, layouts y diseño.

## 📄 Licencia

Uso interno - Todos los derechos reservados

---

**ClientLog v2.0** - Sistema de Repositorio Interno de Clientes

