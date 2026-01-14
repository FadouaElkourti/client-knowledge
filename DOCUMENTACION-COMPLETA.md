# ClientLog - Documentación Completa

**ClientLog** es un sistema de repositorio interno completo para gestionar clientes, actividades comerciales, incidencias técnicas, reuniones y seguimiento.

## 📋 Índice

1. [Características](#características)
2. [Estructura del Sistema](#estructura-del-sistema)
3. [Instalación](#instalación)
4. [Uso Diario](#uso-diario)
5. [Plantillas Disponibles](#plantillas-disponibles)
6. [Scripts de Automatización](#scripts-de-automatización)
7. [Metadatos y Front Matter](#metadatos-y-front-matter)
8. [Personalización](#personalización)

---

## 🎯 Características

- ✅ **Gestión completa de clientes** - Estructura jerárquica por carpetas
- ✅ **Incidencias técnicas** - Registro detallado de problemas y soluciones
- ✅ **Actividades comerciales** - Ventas, ofertas, oportunidades
- ✅ **Reuniones** - Actas, seguimiento y compromisos
- ✅ **Historial** - Timeline de eventos y notas
- ✅ **Notas IA** - Sección para análisis automático por IA
- ✅ **Scripts PowerShell** - Automatización de tareas comunes
- ✅ **Diseño moderno** - Tailwind CSS con interfaz tipo redes sociales
- ✅ **Búsqueda y filtrado** - Organización por tags y categorías

---

## 📁 Estructura del Sistema

```
clientes/
├── cliente-A/
│   ├── index.md                    # Ficha principal del cliente
│   ├── notas-ia.md                 # Análisis y notas generadas por IA
│   ├── incidencias/                # Incidencias técnicas
│   │   └── 2026-01-14-timeout-postgresql.md
│   ├── actividades-comerciales/    # Ventas, ofertas, oportunidades
│   │   └── 2026-01-14-oferta-cloud.md
│   ├── reuniones/                  # Actas de reuniones
│   │   └── 2026-01-10-seguimiento-mensual.md
│   └── historial/                  # Timeline de eventos
│       └── 2026-01-14-nota-ejemplo.md
├── cliente-B/
│   └── ...
└── cliente-C/
    └── ...

_templates/                         # Plantillas Markdown
├── cliente-base.md
├── incidencia.md
├── actividad-comercial.md
├── reunion.md
└── historial.md

scripts/                            # Scripts PowerShell
├── nuevo-cliente.ps1
├── nueva-incidencia.ps1
├── nueva-actividad.ps1
├── nueva-reunion.ps1
└── start.ps1
```

---

## 🚀 Instalación

### Requisitos Previos

- Ruby 3.x con DevKit
- Jekyll 4.x
- Bundler
- PowerShell 5.1+ (Windows)

### Pasos

1. **Clonar o descargar el repositorio**

2. **Instalar dependencias**
   ```powershell
   bundle install
   ```

3. **Iniciar servidor Jekyll**
   ```powershell
   .\start.ps1
   ```

4. **Abrir navegador**
   ```
   http://localhost:4000
   ```

---

## 📖 Uso Diario

### Crear un Nuevo Cliente

```powershell
.\scripts\nuevo-cliente.ps1
```

El script solicitará:
- Nombre del cliente (slug)
- Razón social completa
- Sector/Industria
- Contacto principal
- Email y teléfono

Creará automáticamente:
- Carpeta del cliente
- Subcarpetas (incidencias, actividades, reuniones, historial)
- `index.md` con ficha del cliente
- `notas-ia.md` para análisis IA

### Registrar una Incidencia

```powershell
.\scripts\nueva-incidencia.ps1
```

### Crear Actividad Comercial

```powershell
.\scripts\nueva-actividad.ps1
```

### Registrar una Reunión

```powershell
.\scripts\nueva-reunion.ps1
```

---

## 📝 Plantillas Disponibles

### 1. Cliente Base (`_templates/cliente-base.md`)

```yaml
---
layout: cliente
title: "[NOMBRE DEL CLIENTE]"
nombre: "[Razón Social]"
sector: "[Sector]"
fecha_alta: YYYY-MM-DD
contacto_principal: "[Nombre]"
email: "email@cliente.com"
telefono: "+34 XXX XXX XXX"
estado: "activo"
tags: [cliente, sector]
ai_relevance: medium
---
```

### 2. Incidencia (`_templates/incidencia.md`)

```yaml
---
layout: incidencia
title: "[TÍTULO]"
date: YYYY-MM-DD HH:MM:SS +0200
cliente: "nombre-cliente"
categoria: "Incidencia"
tipo_incidencia: "Técnica"
prioridad: "media"
estado: "abierto"
tags: [tag1, tag2]
sistema_afectado: "Sistema"
tiempo_estimado: "2 horas"
ai_relevance: medium
---
```

### 3. Actividad Comercial (`_templates/actividad-comercial.md`)

```yaml
---
layout: page
title: "[TÍTULO]"
date: YYYY-MM-DD HH:MM:SS +0200
cliente: "nombre-cliente"
categoria: "Actividad Comercial"
tipo_actividad: "Venta"
estado: "en_progreso"
valor_estimado: 0
probabilidad: 50
fecha_cierre_estimada: YYYY-MM-DD
tags: [comercial, venta]
responsable: admin
ai_relevance: high
---
```

### 4. Reunión (`_templates/reunion.md`)

```yaml
---
layout: page
title: "Reunión - [ASUNTO]"
date: YYYY-MM-DD HH:MM:SS +0200
cliente: "nombre-cliente"
categoria: "Reunión"
tipo_reunion: "Seguimiento"
duracion: "60 min"
ubicacion: "Online"
asistentes: [persona1, persona2]
estado: "planificada"
tags: [reunion, seguimiento]
responsable: admin
ai_relevance: medium
---
```

### 5. Historial (`_templates/historial.md`)

```yaml
---
layout: page
title: "Entrada de Historial"
date: YYYY-MM-DD HH:MM:SS +0200
cliente: "nombre-cliente"
categoria: "Historial"
tipo_evento: "Nota"
tags: [historial, nota]
autor: admin
ai_relevance: low
---
```

---

## ⚙️ Scripts de Automatización

### start.ps1
Inicia el servidor Jekyll con livereload automático.

```powershell
.\start.ps1
```

### nuevo-cliente.ps1
Crea estructura completa de un nuevo cliente.

### nueva-incidencia.ps1
Registra una nueva incidencia técnica.

### nueva-actividad.ps1
Crea una actividad comercial (venta/oferta/oportunidad).

### nueva-reunion.ps1
Registra una reunión con acta y seguimiento.

---

## 🏷️ Metadatos y Front Matter

### Campos Comunes

| Campo | Descripción | Valores |
|-------|-------------|---------|
| `title` | Título del documento | Texto libre |
| `date` | Fecha y hora | YYYY-MM-DD HH:MM:SS +0200 |
| `cliente` | Cliente asociado | Slug del cliente |
| `categoria` | Tipo de contenido | Incidencia, Actividad Comercial, Reunión, Historial |
| `tags` | Etiquetas | Array de strings |
| `estado` | Estado actual | abierto, en_progreso, resuelto, cerrado |
| `ai_relevance` | Relevancia para IA | low, medium, high |

### Campos Específicos por Tipo

**Incidencias:**
- `tipo_incidencia`: Técnica, Funcional, Infraestructura
- `prioridad`: baja, media, alta, crítica
- `sistema_afectado`: Sistema o servicio afectado
- `tiempo_estimado`: Tiempo estimado de resolución

**Actividades Comerciales:**
- `tipo_actividad`: Venta, Oferta, Oportunidad, Seguimiento, Renovación
- `valor_estimado`: Valor en EUR
- `probabilidad`: % de cierre (0-100)
- `fecha_cierre_estimada`: YYYY-MM-DD

**Reuniones:**
- `tipo_reunion`: Seguimiento, Comercial, Técnica, Estratégica, Kickoff
- `duracion`: Duración estimada
- `ubicacion`: Online, Presencial, Oficina cliente
- `asistentes`: Array de nombres

---

## 🎨 Personalización

### Cambiar Colores

Edita `_layouts/default.html` y modifica la configuración de Tailwind:

```javascript
tailwind.config = {
    theme: {
        extend: {
            colors: {
                primary: '#5B21B6',   // Purple
                secondary: '#0EA5E9'  // Blue
            }
        }
    }
}
```

### Modificar Diseño del Homepage

Edita `index.html` para personalizar:
- Hero section
- Cards de estadísticas
- Layout de actividades

### Añadir Nuevos Layouts

Crea un nuevo archivo en `_layouts/` siguiendo la estructura existente.

---

## 🔧 Solución de Problemas

### Jekyll no inicia

```powershell
# Reinstalar gems
bundle install
```

### CSS no se aplica

El sistema usa **Tailwind CSS via CDN**, por lo que no requiere compilación. Si ves problemas, verifica que `_layouts/default.html` incluya:

```html
<script src="https://cdn.tailwindcss.com"></script>
```

### Error en scripts PowerShell

Asegúrate de ejecutar desde el directorio raíz del proyecto:

```powershell
cd c:\Users\...\jekyll-theme-memoirs-master
.\scripts\nuevo-cliente.ps1
```

---

## 📊 Integración con IA

El campo `ai_relevance` en cada documento permite priorizar contenido para procesamiento por IA:

- `high`: Contenido crítico para análisis
- `medium`: Contenido estándar
- `low`: Contenido informativo

Las **Notas IA** (`notas-ia.md`) están diseñadas para almacenar análisis automáticos y recomendaciones generadas por sistemas de inteligencia artificial.

---

## 📞 Soporte

Para preguntas o problemas, consulta:
- Documentación de Jekyll: https://jekyllrb.com/docs/
- Tailwind CSS: https://tailwindcss.com/docs
- Markdown Guide: https://www.markdownguide.org/

---

**ClientLog v2.0** - Sistema de Repositorio Interno de Clientes  
Actualizado: Enero 2026
