---
layout: page
title: "Reunión - [ASUNTO]"
date: YYYY-MM-DD HH:MM:SS +0200
cliente: "Nombre del Cliente"
categoria: "Reunión"
tipo_reunion: "Seguimiento" # Seguimiento, Comercial, Técnica, Estratégica, Kickoff
duracion: "60 min"
ubicacion: "Online" # Online, Presencial, Oficina cliente
asistentes: [persona1, persona2]
estado: "planificada" # planificada, realizada, cancelada, pospuesta
tags: [reunion, seguimiento]
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
4. **Punto 3** (15 min)
5. **Conclusiones y próximos pasos** (5 min)

## 📝 Notas y Acuerdos

### Temas Tratados

[Resumen de los temas discutidos]

### Decisiones Tomadas

- Decisión 1
- Decisión 2
- Decisión 3

### Acciones Comprometidas

| Acción | Responsable | Fecha Límite | Estado |
|--------|-------------|--------------|--------|
| Acción 1 | Persona | DD/MM/YYYY | Pendiente |
| Acción 2 | Persona | DD/MM/YYYY | Pendiente |

## 🔄 Próximos Pasos

- [ ] Acción de seguimiento 1
- [ ] Acción de seguimiento 2
- [ ] Programar próxima reunión

## 📎 Documentos Adjuntos

- Presentación: [enlace]
- Acta anterior: [enlace]

## 🗓️ Próxima Reunión

- **Fecha propuesta:** [fecha]
- **Temas a tratar:** [lista]
