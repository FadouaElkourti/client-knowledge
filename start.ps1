#!/usr/bin/env pwsh
# Script de inicio rápido para Jekyll
# Ejecuta este script para iniciar el servidor de desarrollo

Write-Host "Iniciando servidor Jekyll..." -ForegroundColor Cyan
Write-Host ""
Write-Host "El servidor se actualizara automaticamente cuando edites archivos" -ForegroundColor Yellow
Write-Host "Abre tu navegador en: http://127.0.0.1:4000/" -ForegroundColor Green
Write-Host "Presiona Ctrl+C para detener el servidor" -ForegroundColor Yellow
Write-Host ""

# Iniciar Jekyll con bundle exec
C:\Ruby33-x64\bin\bundle.bat exec jekyll serve --livereload

# Nota: --livereload hace que el navegador se actualice automaticamente
