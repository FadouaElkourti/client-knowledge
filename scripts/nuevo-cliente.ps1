# Script para crear nuevo cliente
# Uso: .\nuevo-cliente.ps1 -Nombre "Acme Corporation" -Slug "acme-corp"

param(
    [Parameter(Mandatory=$true)]
    [string]$Nombre,
    
    [Parameter(Mandatory=$true)]
    [string]$Slug,
    
    [Parameter(Mandatory=$false)]
    [string]$Sector = "Tecnología",
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("baja", "media", "alta", "crítica")]
    [string]$Criticidad = "media"
)

# Configuración
$FechaHoy = Get-Date -Format "yyyy-MM-dd"
$RutaClientes = "_clientes"
$RutaCompleta = Join-Path $RutaClientes "$Slug.md"

# Verificar que existe el directorio
if (!(Test-Path $RutaClientes)) {
    New-Item -ItemType Directory -Path $RutaClientes -Force | Out-Null
}

# Verificar que no existe ya
if (Test-Path $RutaCompleta) {
    Write-Error "El cliente '$Slug' ya existe en $RutaCompleta"
    exit 1
}

# Crear contenido desde plantilla
$Contenido = @"
---
layout: cliente
title: "$Nombre"
nombre_cliente: "$Nombre"
slug: "$Slug"
sector: "$Sector"
contacto: "contacto@$Slug.com"
fecha_inicio: "$FechaHoy"
descripcion: "Descripción breve del cliente"
criticidad: "$Criticidad"
author: admin
toc: true
etiquetas:
  - cliente-activo
tecnologias:
  - "Tecnología 1"
---

## 📋 Información General

### Descripción del Cliente

$Nombre es una empresa del sector $Sector.

**Servicios contratados:**
- ✅ Servicio 1
- ✅ Servicio 2

### Datos de Contacto

**Contacto Principal:**
- **Nombre:** [Nombre]
- **Cargo:** [Cargo]
- **Email:** contacto@$Slug.com
- **Teléfono:** +34 600 000 000

---

## 🖥️ Infraestructura

**Stack tecnológico:**
- Frontend: [Tecnología]
- Backend: [Tecnología]
- Base de datos: [Tecnología]

[📄 Ver documentación completa de infraestructura](./infraestructura/)

---

## 🤖 Metadata AI

``````json
{
  "id_cliente": "$Slug",
  "estado": "activo",
  "sector": "$Sector",
  "criticidad": "$Criticidad"
}
``````
"@

# Crear archivo
$Contenido | Out-File -FilePath $RutaCompleta -Encoding UTF8

# Crear estructura de carpetas para el cliente
$CarpetaCliente = Join-Path $RutaClientes $Slug
New-Item -ItemType Directory -Path $CarpetaCliente -Force | Out-Null

Write-Host ""
Write-Host "✅ Cliente creado exitosamente!" -ForegroundColor Green
Write-Host ""
Write-Host "📄 Archivo: $RutaCompleta" -ForegroundColor Cyan
Write-Host "📁 Carpeta: $CarpetaCliente" -ForegroundColor Cyan
Write-Host "🏢 Nombre: $Nombre" -ForegroundColor Cyan
Write-Host "🔖 Slug: $Slug" -ForegroundColor Cyan
Write-Host "📊 Criticidad: $Criticidad" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 Próximos pasos:" -ForegroundColor Yellow
Write-Host "   1. Edita el archivo para completar los detalles"
Write-Host "   2. Copia _templates/infraestructura.md a la carpeta del cliente"
Write-Host "   3. Reinicia Jekyll para ver los cambios"
Write-Host "   4. Accede a http://localhost:4000/clientes/$Slug/"
Write-Host ""

# Preguntar si desea abrir el archivo
$Abrir = Read-Host "¿Deseas abrir el archivo ahora? (s/n)"
if ($Abrir -eq "s") {
    code $RutaCompleta
}
"@