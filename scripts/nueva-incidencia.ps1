# Script para crear nueva incidencia
# Uso: .\nueva-incidencia.ps1 -Cliente "acme-corp" -Titulo "Descripción del problema"

param(
    [Parameter(Mandatory=$true)]
    [string]$Cliente,
    
    [Parameter(Mandatory=$true)]
    [string]$Titulo,
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("baja", "media", "alta", "crítica")]
    [string]$Prioridad = "media",
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("abierto", "en-progreso", "resuelto", "cerrado")]
    [string]$Estado = "abierto"
)

# Configuración
$FechaHoy = Get-Date -Format "yyyy-MM-dd"
$HoraHoy = Get-Date -Format "HH:mm:ss"
$TimestampArchivo = Get-Date -Format "yyyy-MM-dd-HHmmss"
$NombreArchivo = "$FechaHoy-" + ($Titulo -replace '[^\w\s-]', '' -replace '\s+', '-').ToLower()
$RutaIncidencias = "_incidencias"
$RutaCompleta = Join-Path $RutaIncidencias "$NombreArchivo.md"

# Verificar que existe el directorio de incidencias
if (!(Test-Path $RutaIncidencias)) {
    New-Item -ItemType Directory -Path $RutaIncidencias -Force | Out-Null
}

# Verificar que existe el cliente
$RutaCliente = "_clientes\$Cliente.md"
if (!(Test-Path $RutaCliente)) {
    Write-Warning "El cliente '$Cliente' no existe en _clientes/"
    $Continuar = Read-Host "¿Deseas continuar de todas formas? (s/n)"
    if ($Continuar -ne "s") {
        Write-Host "Operación cancelada."
        exit
    }
}

# Crear contenido desde plantilla
$Contenido = @"
---
layout: incidencia
title: "$Titulo"
date: $FechaHoy $HoraHoy +0100
cliente: "$Cliente"
estado: "$Estado"
prioridad: "$Prioridad"
tecnologias:
  - "Tecnología 1"
  - "Tecnología 2"
descripcion_breve: "Descripción breve del problema"
impacto: ""
tiempo_resolucion: ""
author: admin
toc: true
relacionadas: []
---

## 📋 Descripción del Problema

**Contexto:**
[Describir el contexto en el que ocurrió el problema]

**Síntomas observados:**
- Síntoma 1
- Síntoma 2

**Fecha de detección:** $FechaHoy $HoraHoy

---

## 🔍 Diagnóstico y Causa Raíz

**Proceso de investigación:**

1. Paso 1 del diagnóstico
2. Paso 2 del diagnóstico

**Causa raíz identificada:**

[Explicación de la causa raíz]

---

## ✅ Solución Implementada

**Pasos de resolución:**

1. **Paso 1:** Descripción
   ``````bash
   # Comandos ejecutados
   ``````

2. **Paso 2:** Descripción

---

## 🎯 Resultado Final

**Estado actual:**
[Descripción del estado final]

---

## 📚 Lecciones Aprendidas

**Conclusiones:**
- Lección 1
- Lección 2

---

## 🤖 Notas del Agente IA

**Contexto para IA:**
``````json
{
  "tipo_problema": "",
  "severidad": "$Prioridad",
  "automatizable": false,
  "keywords": []
}
``````
"@

# Crear archivo
$Contenido | Out-File -FilePath $RutaCompleta -Encoding UTF8

Write-Host ""
Write-Host "✅ Incidencia creada exitosamente!" -ForegroundColor Green
Write-Host ""
Write-Host "📄 Archivo: $RutaCompleta" -ForegroundColor Cyan
Write-Host "👤 Cliente: $Cliente" -ForegroundColor Cyan
Write-Host "📊 Estado: $Estado" -ForegroundColor Cyan
Write-Host "⚡ Prioridad: $Prioridad" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 Próximos pasos:" -ForegroundColor Yellow
Write-Host "   1. Edita el archivo para completar los detalles"
Write-Host "   2. Reinicia Jekyll para ver los cambios"
Write-Host "   3. Accede a http://localhost:4000/incidencias/"
Write-Host ""

# Preguntar si desea abrir el archivo
$Abrir = Read-Host "¿Deseas abrir el archivo ahora? (s/n)"
if ($Abrir -eq "s") {
    code $RutaCompleta
}
"@