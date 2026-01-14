---
layout: page
title: "Clientes"
permalink: /clientes/
---

<div class="container">
    <h1 class="mb-4">📁 Base de Clientes</h1>
    
    <p class="lead">
        Sistema de documentación técnica para gestión de clientes, infraestructura y conocimiento interno.
    </p>
    
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h2 class="text-primary">{{ site.clientes.size }}</h2>
                    <p class="text-muted mb-0">Clientes Activos</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h2 class="text-danger">{{ site.incidencias | where: "estado", "abierto" | size }}</h2>
                    <p class="text-muted mb-0">Incidencias Abiertas</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h2 class="text-warning">{{ site.incidencias | where: "estado", "en-progreso" | size }}</h2>
                    <p class="text-muted mb-0">En Progreso</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center">
                <div class="card-body">
                    <h2 class="text-success">{{ site.incidencias | where: "estado", "resuelto" | size }}</h2>
                    <p class="text-muted mb-0">Resueltas (mes)</p>
                </div>
            </div>
        </div>
    </div>
    
    <hr class="my-5">
    
    <h2 class="mb-4">Listado de Clientes</h2>
    
    <div class="row">
        {% assign clientes_ordenados = site.clientes | sort: "nombre_cliente" %}
        {% for cliente in clientes_ordenados %}
        <div class="col-md-6 mb-4">
            <div class="card h-100">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <h4 class="card-title">
                                <a href="{{ cliente.url }}">{{ cliente.nombre_cliente }}</a>
                            </h4>
                            {% if cliente.sector %}
                            <p class="text-muted small mb-2">
                                <strong>Sector:</strong> {{ cliente.sector }}
                            </p>
                            {% endif %}
                        </div>
                        {% if cliente.criticidad %}
                        <span class="badge badge-{% if cliente.criticidad == 'crítica' or cliente.criticidad == 'alta' %}danger{% elsif cliente.criticidad == 'media' %}warning{% else %}secondary{% endif %}">
                            {{ cliente.criticidad | upcase }}
                        </span>
                        {% endif %}
                    </div>
                    
                    {% if cliente.descripcion %}
                    <p class="card-text">{{ cliente.descripcion | truncate: 150 }}</p>
                    {% endif %}
                    
                    <div class="mt-3">
                        {% if cliente.tecnologias %}
                        <div class="mb-2">
                            {% for tech in cliente.tecnologias limit:4 %}
                            <span class="badge badge-secondary small">{{ tech }}</span>
                            {% endfor %}
                        </div>
                        {% endif %}
                        
                        {% assign incidencias_cliente = site.incidencias | where: "cliente", cliente.slug %}
                        {% assign incidencias_abiertas = incidencias_cliente | where: "estado", "abierto" | size %}
                        
                        <small class="text-muted">
                            📊 {{ incidencias_cliente.size }} incidencias totales
                            {% if incidencias_abiertas > 0 %}
                            · <span class="text-danger">{{ incidencias_abiertas }} abiertas</span>
                            {% endif %}
                        </small>
                    </div>
                </div>
                <div class="card-footer bg-white border-top-0">
                    <a href="{{ cliente.url }}" class="btn btn-sm btn-outline-primary">Ver detalles →</a>
                </div>
            </div>
        </div>
        {% endfor %}
    </div>
    
    {% if site.clientes.size == 0 %}
    <div class="alert alert-info">
        <h5>No hay clientes registrados todavía</h5>
        <p>Comienza creando un nuevo cliente usando la plantilla en <code>_templates/cliente-base.md</code></p>
    </div>
    {% endif %}
</div>
