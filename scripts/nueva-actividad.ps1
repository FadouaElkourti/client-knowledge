# Script PowerShell: Crear Nueva Actividad Comercial

Write-Host "=== ClientLog: Nueva Actividad Comercial ===" -ForegroundColor Cyan
Write-Host ""

# Solicitar datos de la actividad
$cliente = Read-Host "Nombre del cliente (ej: cliente-A)"
$titulo = Read-Host "Titulo de la actividad"
$tipo = Read-Host "Tipo de actividad (Venta/Oferta/Oportunidad/Seguimiento/Renovacion)"
$valor = Read-Host "Valor estimado en EUR"
$probabilidad = Read-Host "Probabilidad de cierre (0-100)"
$fecha_cierre = Read-Host "Fecha estimada de cierre (YYYY-MM-DD)"

# Generar fecha actual
$fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$fecha_archivo = Get-Date -Format "yyyy-MM-dd"

# Generar slug
$slug = $titulo.ToLower() -replace '\s+','-' -replace '[^a-z0-9-]',''
$archivo = "$fecha_archivo-$slug.md"

# Verificar que existe el cliente
$dirCliente = "clientes\$cliente"
if (-not (Test-Path $dirCliente)) {
    Write-Host "Error: El cliente '$cliente' no existe." -ForegroundColor Red
    Write-Host "Ejecuta primero: .\scripts\nuevo-cliente.ps1" -ForegroundColor Yellow
    exit 1
}

# Crear directorio de actividades si no existe
$dirActividades = "$dirCliente\actividades-comerciales"
if (-not (Test-Path $dirActividades)) {
    New-Item -ItemType Directory -Path $dirActividades | Out-Null
}

# Contenido del archivo
$contenido = @"
---
layout: page
title: "$titulo"
date: $fecha +0200
cliente: "$cliente"
categoria: "Actividad Comercial"
tipo_actividad: "$tipo"
estado: "en_progreso"
valor_estimado: $valor
probabilidad: $probabilidad
fecha_cierre_estimada: $fecha_cierre
tags: [comercial, $tipo.ToLower(), $cliente]
responsable: admin
ai_relevance: high
---

## 💼 Resumen de la Actividad

[Breve descripción de la actividad comercial]

## 🎯 Objetivos

- Objetivo 1
- Objetivo 2
- Objetivo 3

## 📈 Detalles de la Oportunidad

- **Valor estimado:** {{ page.valor_estimado }}€
- **Probabilidad de cierre:** {{ page.probabilidad }}%
- **Fecha estimada de cierre:** {{ page.fecha_cierre_estimada }}
- **Estado actual:** {{ page.estado }}

## 💡 Productos/Servicios Ofrecidos

1. Producto/Servicio 1
2. Producto/Servicio 2
3. Producto/Servicio 3

## 👤 Contactos Involucrados

- **Contacto principal:** Nombre y cargo
- **Decisores:** 
- **Influenciadores:**

## 📋 Próximos Pasos

- [ ] Acción 1
- [ ] Acción 2
- [ ] Acción 3

## 📝 Notas

[Observaciones, comentarios adicionales]
"@

# Guardar archivo
$rutaCompleta = "$dirActividades\$archivo"
$contenido | Out-File -FilePath $rutaCompleta -Encoding UTF8

Write-Host ""
Write-Host "Actividad comercial creada exitosamente!" -ForegroundColor Green
Write-Host "Ubicacion: $rutaCompleta" -ForegroundColor Gray
Write-Host ""
Write-Host "Edita el archivo para completar los detalles." -ForegroundColor Yellow
