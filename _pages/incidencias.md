---
layout: page
title: "Incidencias"
permalink: /incidencias/
---

<div class="container">
    <h1 class="mb-4">🔧 Registro de Incidencias</h1>
    
    <p class="lead">
        Historial completo de incidencias técnicas, problemas y soluciones documentadas.
    </p>
    
    <!-- Filtros -->
    <div class="card mb-4">
        <div class="card-body">
            <h5>Filtrar por:</h5>
            <div class="btn-group mb-2" role="group">
                <button type="button" class="btn btn-sm btn-outline-secondary" onclick="filterBy('all')">Todas</button>
                <button type="button" class="btn btn-sm btn-outline-danger" onclick="filterBy('abierto')">Abiertas</button>
                <button type="button" class="btn btn-sm btn-outline-warning" onclick="filterBy('en-progreso')">En Progreso</button>
                <button type="button" class="btn btn-sm btn-outline-success" onclick="filterBy('resuelto')">Resueltas</button>
            </div>
        </div>
    </div>
    
    <!-- Tabla de incidencias -->
    <div class="table-responsive">
        <table class="table table-hover" id="incidenciasTable">
            <thead class="thead-light">
                <tr>
                    <th>Fecha</th>
                    <th>Título</th>
                    <th>Cliente</th>
                    <th>Estado</th>
                    <th>Prioridad</th>
                    <th>Tecnologías</th>
                </tr>
            </thead>
            <tbody>
                {% assign incidencias_ordenadas = site.incidencias | sort: "date" | reverse %}
                {% for incidencia in incidencias_ordenadas %}
                <tr data-estado="{{ incidencia.estado }}" data-cliente="{{ incidencia.cliente }}">
                    <td>{{ incidencia.date | date: "%d/%m/%Y" }}</td>
                    <td>
                        <a href="{{ incidencia.url }}">{{ incidencia.title }}</a>
                        {% if incidencia.descripcion_breve %}
                        <br><small class="text-muted">{{ incidencia.descripcion_breve | truncate: 80 }}</small>
                        {% endif %}
                    </td>
                    <td>
                        {% if incidencia.cliente %}
                        {% assign cliente_obj = site.clientes | where: "slug", incidencia.cliente | first %}
                        {% if cliente_obj %}
                        <a href="{{ cliente_obj.url }}">{{ cliente_obj.nombre_cliente }}</a>
                        {% else %}
                        {{ incidencia.cliente }}
                        {% endif %}
                        {% endif %}
                    </td>
                    <td>
                        <span class="badge badge-{% if incidencia.estado == 'resuelto' or incidencia.estado == 'cerrado' %}success{% elsif incidencia.estado == 'en-progreso' %}warning{% else %}danger{% endif %}">
                            {{ incidencia.estado | default: "abierto" }}
                        </span>
                    </td>
                    <td>
                        {% if incidencia.prioridad %}
                        <span class="badge badge-{% if incidencia.prioridad == 'crítica' or incidencia.prioridad == 'alta' %}danger{% elsif incidencia.prioridad == 'media' %}warning{% else %}secondary{% endif %}">
                            {{ incidencia.prioridad }}
                        </span>
                        {% endif %}
                    </td>
                    <td>
                        {% if incidencia.tecnologias %}
                        {% for tech in incidencia.tecnologias limit:2 %}
                        <span class="badge badge-secondary small">{{ tech }}</span>
                        {% endfor %}
                        {% if incidencia.tecnologias.size > 2 %}
                        <small class="text-muted">+{{ incidencia.tecnologias.size | minus: 2 }}</small>
                        {% endif %}
                        {% endif %}
                    </td>
                </tr>
                {% endfor %}
            </tbody>
        </table>
    </div>
    
    {% if site.incidencias.size == 0 %}
    <div class="alert alert-info mt-4">
        <h5>No hay incidencias registradas todavía</h5>
        <p>Comienza documentando una nueva incidencia usando la plantilla en <code>_templates/nueva-incidencia.md</code></p>
    </div>
    {% endif %}
    
    <!-- Estadísticas -->
    <div class="row mt-5">
        <div class="col-md-12">
            <h3>📊 Estadísticas</h3>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h3>{{ site.incidencias.size }}</h3>
                    <p class="text-muted mb-0">Total Incidencias</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h3 class="text-danger">{{ site.incidencias | where: "estado", "abierto" | size }}</h3>
                    <p class="text-muted mb-0">Abiertas</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h3 class="text-warning">{{ site.incidencias | where: "estado", "en-progreso" | size }}</h3>
                    <p class="text-muted mb-0">En Progreso</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h3 class="text-success">{{ site.incidencias | where: "estado", "resuelto" | size }}</h3>
                    <p class="text-muted mb-0">Resueltas</p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function filterBy(estado) {
    const rows = document.querySelectorAll('#incidenciasTable tbody tr');
    rows.forEach(row => {
        if (estado === 'all' || row.dataset.estado === estado) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
}
</script>
