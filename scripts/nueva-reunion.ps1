# Script PowerShell: Crear Nueva Reunión

Write-Host "=== ClientLog: Nueva Reunion ===" -ForegroundColor Cyan
Write-Host ""

# Solicitar datos de la reunión
$cliente = Read-Host "Nombre del cliente (ej: cliente-A)"
$asunto = Read-Host "Asunto de la reunion"
$tipo = Read-Host "Tipo de reunion (Seguimiento/Comercial/Tecnica/Estrategica/Kickoff)"
$duracion = Read-Host "Duracion estimada (ej: 60 min)"
$ubicacion = Read-Host "Ubicacion (Online/Presencial/Oficina cliente)"

# Generar fecha actual
$fecha = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$fecha_archivo = Get-Date -Format "yyyy-MM-dd"

# Generar slug
$slug = $asunto.ToLower() -replace '\s+','-' -replace '[^a-z0-9-]',''
$archivo = "$fecha_archivo-$slug.md"

# Verificar que existe el cliente
$dirCliente = "clientes\$cliente"
if (-not (Test-Path $dirCliente)) {
    Write-Host "Error: El cliente '$cliente' no existe." -ForegroundColor Red
    Write-Host "Ejecuta primero: .\scripts\nuevo-cliente.ps1" -ForegroundColor Yellow
    exit 1
}

# Crear directorio de reuniones si no existe
$dirReuniones = "$dirCliente\reuniones"
if (-not (Test-Path $dirReuniones)) {
    New-Item -ItemType Directory -Path $dirReuniones | Out-Null
}

# Contenido del archivo
$contenido = @"
---
layout: page
title: "Reunion - $asunto"
date: $fecha +0200
cliente: "$cliente"
categoria: "Reunion"
tipo_reunion: "$tipo"
duracion: "$duracion"
ubicacion: "$ubicacion"
asistentes: [persona1, persona2]
estado: "planificada"
tags: [reunion, $tipo.ToLower()]
responsable: admin
ai_relevance: medium
---

## 📅 Información de la Reunión

- **Fecha:** {{ page.date | date: "%d/%m/%Y %H:%M" }}
- **Duración:** {{ page.duracion }}
- **Ubicación:** {{ page.ubicacion }}
- **Tipo:** {{ page.tipo_reunion }}

## 👥 Asistentes

{% for asistente in page.asistentes %}
- {{ asistente }}
{% endfor %}

## 🎯 Objetivos de la Reunión

1. Objetivo 1
2. Objetivo 2
3. Objetivo 3

## 📋 Agenda

1. **Apertura y bienvenida** (5 min)
2. **Punto 1** (15 min)
3. **Punto 2** (20 min)
4. **Conclusiones y próximos pasos** (10 min)

## 📝 Notas y Acuerdos

### Temas Tratados

[Resumen de los temas discutidos]

### Decisiones Tomadas

- Decisión 1
- Decisión 2

### Acciones Comprometidas

| Acción | Responsable | Fecha Límite | Estado |
|--------|-------------|--------------|--------|
| Acción 1 | Persona | DD/MM/YYYY | Pendiente |

## 🔄 Próximos Pasos

- [ ] Acción de seguimiento 1
- [ ] Programar próxima reunión

## 📎 Documentos Adjuntos

- Presentación: [enlace]
"@

# Guardar archivo
$rutaCompleta = "$dirReuniones\$archivo"
$contenido | Out-File -FilePath $rutaCompleta -Encoding UTF8

Write-Host ""
Write-Host "Reunion creada exitosamente!" -ForegroundColor Green
Write-Host "Ubicacion: $rutaCompleta" -ForegroundColor Gray
Write-Host ""
Write-Host "Edita el archivo para completar los detalles." -ForegroundColor Yellow
