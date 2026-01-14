# 🚀 Inicio Rápido

## Workflow Diario

### Primera vez (solo una vez):
```powershell
# Instalar dependencias
C:\Ruby33-x64\bin\bundle.bat install
```

### Cada vez que trabajes (inicio rápido):
```powershell
# Opción 1: Usar el script
.\start.ps1

# Opción 2: Comando manual
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --livereload
```

### ¿Qué hace el servidor?
- ✅ Se queda corriendo en segundo plano
- ✅ Detecta cambios automáticamente en archivos `.md`, `.html`, `.scss`
- ✅ Recompila el sitio cuando guardas cambios
- ✅ Con `--livereload` el navegador se actualiza solo (recomendado)
- ✅ Abre http://127.0.0.1:4000/ en tu navegador

### Workflow típico:
1. Ejecuta `.\start.ps1` UNA VEZ
2. Deja el servidor corriendo
3. Edita archivos en VS Code
4. Guarda (Ctrl+S)
5. El navegador se actualiza automáticamente

### Para detener:
- Presiona `Ctrl+C` en la terminal donde corre Jekyll

## ¿Cuándo ejecutar `bundle install` de nuevo?

Solo cuando:
- Cambies el archivo `Gemfile`
- Agregues/quites plugins de Jekyll
- Actualices versiones de gemas

## Tips:

### Si el puerto 4000 está ocupado:
```powershell
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --port 4001 --livereload
```

### Ver más detalles de compilación:
```powershell
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --livereload --verbose
```

### Limpiar caché y recompilar:
```powershell
C:\Ruby33-x64\bin\bundle.bat exec jekyll clean
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --livereload
```

### Ver todos los drafts:
```powershell
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --livereload --drafts
```

## Estructura de Archivos a Editar

```
📁 Contenido que editas:
├── _clientes/          ← Archivos de clientes (Markdown)
├── _incidencias/       ← Archivos de incidencias (Markdown)
├── _templates/         ← Plantillas para copiar
├── _config.yml         ← Configuración del sitio
├── index.html          ← Página principal
├── _pages/             ← Páginas estáticas
└── assets/css/         ← Estilos personalizados

📁 Generado automáticamente (NO editar):
└── _site/              ← Sitio compilado (Git ignore)
```

## Scripts de Automatización

### Crear nuevo cliente:
```powershell
.\scripts\nuevo-cliente.ps1 -nombreCliente "Empresa XYZ" -slug "empresa-xyz" -sector "Tecnología"
```

### Crear nueva incidencia:
```powershell
.\scripts\nueva-incidencia.ps1 -titulo "Error en producción" -cliente "acme-corp" -prioridad "alta"
```

## Solución de Problemas

### Error: "Address already in use"
El puerto 4000 está ocupado. Mata el proceso o usa otro puerto:
```powershell
# Encontrar proceso en puerto 4000
Get-Process -Id (Get-NetTCPConnection -LocalPort 4000).OwningProcess

# Matar proceso
Stop-Process -Id <ID_DEL_PROCESO>

# O usar otro puerto
.\start.ps1 --port 4001
```

### Error: "cannot load such file"
Ejecuta `bundle install` de nuevo.

### Cambios no se reflejan:
1. Verifica que el servidor esté corriendo
2. Limpia caché: `bundle exec jekyll clean`
3. Reinicia el servidor
4. Fuerza recarga en navegador: Ctrl+Shift+R
