# 📚 TechDocs - Sistema de Documentación Técnica

Sistema de gestión de conocimiento técnico basado en Jekyll para documentar clientes, incidencias y soluciones. Diseño moderno tipo red social, AI-friendly y 100% Markdown.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Jekyll](https://img.shields.io/badge/Jekyll-4.3.4-red)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 🚀 Inicio Rápido

### Prerrequisitos
- Ruby 3.3+ con DevKit
- Bundler 4.0+
- Git

### Instalación (primera vez)

```powershell
# 1. Clonar repositorio
git clone <tu-repo>
cd jekyll-theme-memoirs-master

# 2. Instalar dependencias
C:\Ruby33-x64\bin\bundle.bat install

# 3. Iniciar servidor
.\start.ps1
```

### Uso diario

```powershell
# Iniciar servidor (auto-reload activado)
.\start.ps1

# Abre http://127.0.0.1:4000/ en tu navegador
# El servidor detecta cambios automáticamente
# Solo guarda archivos y refresca el navegador
```

---

## 🛠️ Tecnologías Utilizadas

### Core
- **Jekyll 4.3.4** - Generador de sitios estáticos
- **Ruby 3.3** - Lenguaje base
- **Liquid** - Motor de plantillas
- **Kramdown** - Parser de Markdown

### Frontend
- **Bootstrap 4.4** - Framework CSS responsivo
- **SCSS/Sass** - Preprocesador CSS
- **jQuery 3.x** - Librería JavaScript
- **Rouge** - Syntax highlighting para código

### Plugins Jekyll
```ruby
# Gemfile
gem "jekyll", "~> 4.3.0"
gem "jekyll-paginate"
gem "jekyll-sitemap"
gem "jekyll-feed"
gem "jekyll-seo-tag"
gem "wdm", ">= 0.1.0" if Gem.win_platform?
```

### Dependencias Completas
Ver `Gemfile.lock` para la lista completa de 39 gemas instaladas.

---

## 📂 Estructura del Proyecto

```
jekyll-theme-memoirs-master/
├── _clientes/              # Documentación de clientes (Markdown)
│   └── acme-corp.md
├── _incidencias/           # Registro de incidencias (Markdown)
│   └── 2026-01-14-postgresql-timeout.md
├── _templates/             # Plantillas reutilizables
│   ├── cliente-base.md
│   ├── nueva-incidencia.md
│   └── infraestructura.md
├── _layouts/               # Layouts HTML + Liquid
│   ├── default.html        # Layout base
│   ├── cliente.html        # Para páginas de clientes
│   └── incidencia.html     # Para páginas de incidencias
├── _includes/              # Componentes reutilizables
│   ├── header.html
│   └── footer.html
├── _pages/                 # Páginas estáticas
│   ├── clientes.md
│   └── incidencias.md
├── assets/
│   ├── css/
│   │   ├── theme.scss      # Estilos base
│   │   └── custom-modern.scss  # Diseño moderno (TU ARCHIVO)
│   ├── js/
│   └── images/
├── scripts/                # PowerShell scripts
│   ├── nuevo-cliente.ps1
│   └── nueva-incidencia.ps1
├── _site/                  # Sitio compilado (Git ignore)
├── vendor/                 # Gemas locales (Git ignore)
├── _config.yml             # Configuración principal
├── index.html              # Página de inicio
├── Gemfile                 # Dependencias Ruby
├── start.ps1               # Script de inicio rápido
└── README.md               # Este archivo
```

---

## ✏️ Cómo Modificar Contenido

### Cambiar Textos

#### Página Principal (`index.html`)
```html
<h1 class="hero-title">💡 Bienvenido al Knowledge Hub</h1>
```
Edita directamente el HTML. Guarda y refresca.

#### Configuración del Sitio (`_config.yml`)
```yaml
name: 'TechDocs'
description: 'Sistema de documentación técnica'
timezone: Europe/Madrid
```

### Crear Nuevo Cliente

**Opción 1: Script automático**
```powershell
.\scripts\nuevo-cliente.ps1 -nombreCliente "Empresa XYZ" -slug "empresa-xyz" -sector "Fintech"
```

**Opción 2: Manual**
1. Copia `_templates/cliente-base.md`
2. Guárdalo en `_clientes/nombre-cliente.md`
3. Edita el front-matter YAML
4. Escribe en Markdown

### Crear Nueva Incidencia

**Script automático**
```powershell
.\scripts\nueva-incidencia.ps1 -titulo "Error en producción" -cliente "acme-corp" -prioridad "alta"
```

**Front-matter ejemplo:**
```yaml
---
layout: incidencia
title: "Error de timeout en PostgreSQL"
date: 2026-01-14
cliente: acme-corp
estado: resuelto
prioridad: alta
tecnologias:
  - PostgreSQL
  - Docker
---
```

---

## 🎨 Cómo Modificar Estilos

### Archivo Principal de Estilos Personalizados
**`assets/css/custom-modern.scss`**

Este archivo contiene todo el diseño moderno:

```scss
---
---

/* Variables CSS */
:root {
    --primary-color: #40FFDC;
    --secondary-color: #6366f1;
    --success-color: #10b981;
    /* ... más variables */
}

/* Hero Section */
.hero-section {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

/* Cards de Estado */
.status-card {
    background: var(--bg-white);
    border-radius: var(--radius-lg);
}
```

### Cambios Comunes

#### Cambiar colores principales
```scss
:root {
    --primary-color: #FF6B6B;        /* Tu color */
    --secondary-color: #4ECDC4;      /* Tu color */
}
```

#### Cambiar gradiente del hero
```scss
.hero-section {
    background: linear-gradient(135deg, #FA8BFF 0%, #2BD2FF 100%);
}
```

#### Cambiar fuente
En `assets/css/theme.scss`:
```scss
body {
    font-family: 'Roboto', sans-serif;
}
```

#### Cambiar tamaño de cards
```scss
.feed-card {
    padding: 2rem;  /* Aumenta el espacio interno */
}
```

### Aplicar Cambios de Estilo
1. Edita `assets/css/custom-modern.scss`
2. Guarda el archivo (Ctrl+S)
3. Jekyll recompila automáticamente
4. Refresca navegador (F5)
5. Si no ves cambios: Ctrl+Shift+R (hard refresh)

---

## ⚙️ Configuración Avanzada

### Cambiar Idioma de Fechas
`_config.yml`:
```yaml
timezone: Europe/Madrid
locale: es-ES
```

### Agregar Nuevo Plugin
1. Añade al `Gemfile`:
```ruby
gem 'jekyll-archives'
```
2. Añade a `_config.yml`:
```yaml
plugins:
  - jekyll-archives
```
3. Ejecuta:
```powershell
C:\Ruby33-x64\bin\bundle.bat install
```
4. Reinicia el servidor

### Cambiar Estructura de URLs
`_config.yml`:
```yaml
collections:
  incidencias:
    permalink: /casos/:year/:month/:day/:title/
```

---

## 🔧 Comandos Útiles

### Desarrollo
```powershell
# Iniciar servidor con live-reload
.\start.ps1

# Iniciar en otro puerto
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --port 4001

# Ver drafts
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --drafts

# Modo verbose (debug)
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --verbose
```

### Mantenimiento
```powershell
# Limpiar caché
C:\Ruby33-x64\bin\bundle.bat exec jekyll clean

# Actualizar gemas
C:\Ruby33-x64\bin\bundle.bat update

# Verificar dependencias
C:\Ruby33-x64\bin\bundle.bat check
```

### Build para Producción
```powershell
# Compilar sitio estático
C:\Ruby33-x64\bin\bundle.bat exec jekyll build

# Output en _site/ listo para deploy
```

---

## 📖 Guías de Edición

### Sintaxis Markdown

```markdown
# Título H1
## Título H2
### Título H3

**Negrita** o __negrita__
*Cursiva* o _cursiva_

- Lista item 1
- Lista item 2

1. Lista numerada
2. Item 2

[Enlace](https://ejemplo.com)

![Imagen](ruta/imagen.png)

```código en línea```

```python
# Bloque de código
def funcion():
    return True
```

> Cita o nota importante

---

Línea horizontal
```

### Front-Matter (Metadatos)

Siempre al inicio del archivo Markdown:

```yaml
---
layout: incidencia
title: "Título de la incidencia"
date: 2026-01-14
cliente: acme-corp
estado: resuelto
prioridad: alta
tecnologias:
  - Python
  - Docker
tags:
  - backend
  - database
descripcion_breve: "Resumen corto"
---

<!-- Aquí empieza el contenido Markdown -->
```

### Liquid Templates

Usado en layouts y páginas:

```liquid
<!-- Variables -->
{{ site.title }}
{{ page.title }}
{{ cliente.nombre }}

<!-- Condicionales -->
{% if page.estado == 'resuelto' %}
  <span class="badge-success">Resuelto</span>
{% endif %}

<!-- Loops -->
{% for cliente in site.clientes %}
  <h2>{{ cliente.nombre }}</h2>
{% endfor %}

<!-- Filtros -->
{{ page.date | date: "%d/%m/%Y" }}
{{ page.descripcion | truncate: 100 }}
```

---

## 🐛 Solución de Problemas

### Error: "Address already in use"
```powershell
# Matar proceso en puerto 4000
Get-Process -Id (Get-NetTCPConnection -LocalPort 4000).OwningProcess | Stop-Process

# O usar otro puerto
.\start.ps1 --port 4001
```

### Error: "cannot load such file"
```powershell
# Reinstalar gemas
C:\Ruby33-x64\bin\bundle.bat install
```

### Cambios no se reflejan
1. Verifica que el servidor esté corriendo
2. Limpia caché: `bundle exec jekyll clean`
3. Reinicia servidor
4. Hard refresh: Ctrl+Shift+R

### Errores de Liquid
Revisa sintaxis en archivos `.html`:
- Cada `{% if %}` necesita `{% endif %}`
- Cada `{% for %}` necesita `{% endfor %}`
- Verifica comillas y paréntesis

---

## 📦 Deployment

### GitHub Pages
```yaml
# _config.yml
url: "https://tuusuario.github.io"
baseurl: "/tu-repo"
```

### Netlify
1. Conecta repositorio
2. Build command: `bundle exec jekyll build`
3. Publish directory: `_site`

### Servidor Propio
```powershell
# Build
bundle exec jekyll build

# Sube contenido de _site/ a tu servidor
```

---

## 📚 Recursos

### Documentación Oficial
- [Jekyll Docs](https://jekyllrb.com/docs/)
- [Liquid Template](https://shopify.github.io/liquid/)
- [Markdown Guide](https://www.markdownguide.org/)
- [Bootstrap 4](https://getbootstrap.com/docs/4.4/)

### Archivos de Referencia
- `DOCUMENTACION.md` - Guía completa del sistema
- `INICIO-RAPIDO.md` - Workflow diario
- `README-PROYECTO.md` - Resumen ejecutivo

---

## 🤝 Contribuir

1. Crea una rama: `git checkout -b feature/nueva-funcionalidad`
2. Haz commits: `git commit -m "Añade nueva funcionalidad"`
3. Push: `git push origin feature/nueva-funcionalidad`
4. Crea Pull Request

---

## 📄 Licencia

MIT License - Basado en [Memoirs Jekyll Theme](https://github.com/wowthemesnet/jekyll-theme-memoirs)

---

## ✨ Características

- ✅ Diseño moderno tipo red social
- ✅ Auto-reload en desarrollo
- ✅ Responsive design
- ✅ Syntax highlighting
- ✅ SEO optimizado
- ✅ AI-friendly metadata (JSON-LD)
- ✅ Scripts de automatización
- ✅ 100% Markdown para contenido
- ✅ Sistema de colecciones Jekyll
- ✅ Búsqueda y filtros

---

## 📞 Soporte

¿Problemas? Revisa:
1. Terminal del servidor (errores de compilación)
2. Consola del navegador (errores JavaScript)
3. `INICIO-RAPIDO.md` (solución de problemas comunes)

---

**Última actualización:** Enero 2026
**Versión:** 1.0.0

