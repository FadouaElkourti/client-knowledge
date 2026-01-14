# 📚 TechDocs - Sistema de Documentación Técnica

Sistema de documentación técnica basado en Jekyll para gestión interna de clientes, incidencias, infraestructura y conocimiento.

## 🎯 Objetivo

Crear un repositorio centralizado donde documentar:
- **Clientes:** Información, infraestructura, arquitectura
- **Incidencias:** Problemas técnicos, diagnóstico, soluciones
- **Historial:** Cambios, mantenimientos, evolución
- **Conocimiento:** Lecciones aprendidas, procedimientos

**Optimizado para agentes IA:** Estructura y metadatos diseñados para facilitar el procesamiento por IA.

---

## 📁 Estructura del Proyecto

```
jekyll-theme-memoirs-master/
├── _clientes/              # Collection de clientes
│   ├── acme-corp.md       # Ejemplo de cliente
│   └── [cliente-slug]/    # Carpeta adicional por cliente
│       ├── infraestructura.md
│       ├── arquitectura.md
│       └── historial/
│
├── _incidencias/          # Collection de incidencias
│   └── YYYY-MM-DD-titulo.md
│
├── _layouts/              # Plantillas HTML
│   ├── cliente.html       # Layout para clientes
│   ├── incidencia.html    # Layout para incidencias
│   ├── default.html
│   ├── page.html
│   └── post.html
│
├── _includes/             # Componentes reutilizables
│   ├── toc.html          # Tabla de contenidos
│   ├── pagination.html
│   └── ...
│
├── _templates/            # Plantillas Markdown
│   ├── cliente-base.md
│   ├── nueva-incidencia.md
│   └── infraestructura.md
│
├── _pages/               # Páginas estáticas
│   ├── clientes.md       # Índice de clientes
│   └── incidencias.md    # Índice de incidencias
│
├── scripts/              # Scripts de automatización
│   ├── nuevo-cliente.ps1
│   └── nueva-incidencia.ps1
│
├── _config.yml           # Configuración principal
└── index.html            # Página de inicio
```

---

## 🚀 Instalación y Configuración

### 1. Prerrequisitos

```powershell
# Instalar Ruby con DevKit
winget install RubyInstallerTeam.RubyWithDevKit.3.3

# Recargar variables de entorno
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

# Instalar Jekyll y Bundler
gem install jekyll bundler
```

### 2. Instalar Dependencias

```powershell
cd jekyll-theme-memoirs-master
bundle install
```

### 3. Ejecutar Servidor Local

```powershell
bundle exec jekyll serve
```

Accede a: `http://localhost:4000`

---

## 📝 Uso del Sistema

### Crear un Nuevo Cliente

**Opción 1: Usar script automatizado**
```powershell
.\scripts\nuevo-cliente.ps1 -Nombre "Acme Corp" -Slug "acme-corp" -Sector "Retail" -Criticidad "alta"
```

**Opción 2: Manual**
1. Copia `_templates/cliente-base.md` a `_clientes/nombre-cliente.md`
2. Edita el archivo y completa la información
3. Guarda y Jekyll regenerará el sitio automáticamente

**Campos importantes:**
- `slug`: identificador único (usado en URLs y referencias)
- `nombre_cliente`: nombre completo para mostrar
- `criticidad`: baja | media | alta | crítica
- `tecnologias`: array de tecnologías usadas

### Documentar una Incidencia

**Opción 1: Usar script automatizado**
```powershell
.\scripts\nueva-incidencia.ps1 -Cliente "acme-corp" -Titulo "Error de timeout en PostgreSQL" -Prioridad "alta"
```

**Opción 2: Manual**
1. Copia `_templates/nueva-incidencia.md` a `_incidencias/YYYY-MM-DD-titulo.md`
2. Completa todas las secciones:
   - 📋 Descripción del Problema
   - 🔍 Diagnóstico y Causa Raíz
   - ✅ Solución Implementada
   - 🎯 Resultado Final
   - 📚 Lecciones Aprendidas
   - 🤖 Notas del Agente IA

**Estructura recomendada:**
```yaml
---
layout: incidencia
title: "Título descriptivo"
date: YYYY-MM-DD HH:MM:SS +0100
cliente: "slug-del-cliente"
estado: "abierto"  # abierto | en-progreso | resuelto | cerrado
prioridad: "alta"  # baja | media | alta | crítica
tecnologias:
  - "PostgreSQL"
  - "AWS RDS"
toc: true
---
```

### Documentar Infraestructura

1. Copia `_templates/infraestructura.md` a `_clientes/[cliente-slug]/infraestructura.md`
2. Documenta:
   - Servidores y especificaciones
   - Arquitectura de red
   - Almacenamiento y backups
   - Seguridad y accesos
   - Monitoreo y métricas
   - Procedimientos operativos

---

## 🤖 Optimización para Agentes IA

### Metadata Estructurada

Cada documento incluye metadata en formato JSON para facilitar el procesamiento por IA:

```yaml
# En clientes
ai_metadata:
  version: "1.0"
  structured_format: true
  indexable: true
```

```json
// En cada cliente
{
  "id_cliente": "acme-corp",
  "estado": "activo",
  "tecnologias": ["aws", "postgresql"],
  "criticidad": "alta"
}
```

```json
// En cada incidencia
{
  "tipo_problema": "database_connection_pool_exhaustion",
  "severidad": "alta",
  "automatizable": true,
  "keywords": ["postgresql", "timeout"],
  "patron_similar": "INC-2025-03-15"
}
```

### Formato de Secciones

Las incidencias siguen un formato consistente:

1. **📋 Descripción:** Contexto, síntomas, impacto
2. **🔍 Diagnóstico:** Proceso de investigación, causa raíz
3. **✅ Solución:** Pasos ejecutados, código/comandos
4. **🎯 Resultado:** Estado final, validación
5. **📚 Lecciones:** Conclusiones, mejoras propuestas
6. **🤖 Notas IA:** Metadata específica, patrones, automatización

### Schema JSON-LD

Las incidencias incluyen metadata estructurada en formato JSON-LD para mejorar la indexación:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "headline": "{{ page.title }}",
  "articleBody": {
    "problema": "...",
    "causa": "...",
    "solucion": "..."
  }
}
</script>
```

---

## 🔍 Búsqueda y Navegación

### Índices Principales

- **`/clientes/`**: Listado completo de clientes con filtros
- **`/incidencias/`**: Registro de incidencias con estado y prioridad
- **`/clientes/[slug]/`**: Página del cliente con enlaces a documentación

### Navegación por Cliente

Cada página de cliente incluye:
- Sidebar con enlaces rápidos
- Resumen de incidencias relacionadas
- Links a infraestructura, arquitectura, historial

### Filtros en Incidencias

La página de incidencias permite filtrar por:
- Estado (abierto, en-progreso, resuelto)
- Cliente
- Prioridad
- Tecnología

---

## 📊 Collections de Jekyll

### Collection: Clientes

```yaml
collections:
  clientes:
    output: true
    permalink: /clientes/:path/
    sort_by: nombre
```

**Uso:**
- Cada archivo en `_clientes/` genera una página
- Accesible vía `site.clientes` en Liquid
- URL: `/clientes/[slug]/`

### Collection: Incidencias

```yaml
collections:
  incidencias:
    output: true
    permalink: /incidencias/:path/
    sort_by: date
```

**Uso:**
- Cada archivo en `_incidencias/` genera una página
- Accesible vía `site.incidencias` en Liquid
- URL: `/incidencias/YYYY-MM-DD-titulo/`

---

## 🎨 Layouts Personalizados

### Layout: cliente.html

**Características:**
- Sidebar con navegación del cliente
- Metadata AI-readable
- Sección de incidencias relacionadas
- Links a documentación técnica

**Uso:**
```yaml
layout: cliente
```

### Layout: incidencia.html

**Características:**
- Estructura consistente de secciones
- Metadata JSON-LD
- Estado visual (badges)
- Referencias a cliente y documentos relacionados

**Uso:**
```yaml
layout: incidencia
```

---

## 🔧 Mantenimiento

### Regenerar Sitio

```powershell
# Regenerar todo
bundle exec jekyll build

# Servidor en modo watch (regenera automáticamente)
bundle exec jekyll serve --watch
```

### Actualizar Dependencias

```powershell
bundle update
```

### Limpiar Cache

```powershell
bundle exec jekyll clean
```

---

## 📦 Despliegue

### Opción 1: GitHub Pages

1. Commit y push al repositorio
2. Configurar GitHub Pages en Settings
3. Jekyll se compilará automáticamente

### Opción 2: Servidor Interno

```powershell
# Build del sitio estático
bundle exec jekyll build

# Los archivos generados están en _site/
# Copiar a servidor web (Apache, Nginx, etc.)
```

---

## 🔒 Seguridad

### Para uso interno

- ❌ No incluir credenciales en los archivos
- ❌ No subir a repositorios públicos
- ✅ Usar variables de entorno para datos sensibles
- ✅ Configurar autenticación en servidor web
- ✅ Mantener backups regulares

### Información sensible

Almacenar en sistemas seguros:
- Contraseñas → Password Manager
- Claves SSH → Vault
- Tokens API → Secrets Manager

En documentos, solo referencias:
```markdown
**Credenciales:** Ver vault [nombre-del-vault]
**Acceso:** Documentado en sistema de gestión de accesos
```

---

## 📋 Checklist de Implementación

### Configuración Inicial

- [x] Instalar Ruby y Jekyll
- [x] Configurar `_config.yml`
- [x] Crear collections (clientes, incidencias)
- [x] Personalizar layouts
- [x] Crear plantillas reutilizables

### Contenido Inicial

- [x] Crear cliente de ejemplo (Acme Corp)
- [x] Crear incidencia de ejemplo
- [ ] Migrar clientes existentes
- [ ] Migrar documentación actual
- [ ] Migrar historial de incidencias

### Automatización

- [x] Scripts para nuevo cliente
- [x] Scripts para nueva incidencia
- [ ] Script de backup automático
- [ ] Integración con sistema de tickets

### Mejoras Futuras

- [ ] Implementar búsqueda full-text (Algolia/Lunr.js)
- [ ] Añadir dashboard con métricas
- [ ] Integrar con sistema de monitoreo
- [ ] API REST para agentes IA
- [ ] Notificaciones automáticas

---

## 🆘 Solución de Problemas

### Jekyll no compila

```powershell
# Verificar errores
bundle exec jekyll build --verbose

# Reinstalar dependencias
rm Gemfile.lock
bundle install
```

### Changes no se reflejan

```powershell
# Limpiar cache y regenerar
bundle exec jekyll clean
bundle exec jekyll serve --force_polling
```

### Errores en collections

Verificar en `_config.yml`:
- Rutas correctas
- Sintaxis YAML válida
- Collections definidas correctamente

---

## 📞 Soporte

Para dudas o problemas:
1. Revisar esta documentación
2. Consultar [documentación oficial de Jekyll](https://jekyllrb.com/docs/)
3. Contactar al equipo de DevOps

---

## 📄 Licencia

Uso interno exclusivo de la empresa. No distribuir.

---

**Última actualización:** 14/01/2026
**Versión:** 1.0
**Mantenedor:** Equipo DevOps
