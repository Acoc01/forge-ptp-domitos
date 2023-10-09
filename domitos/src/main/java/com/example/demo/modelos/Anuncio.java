package com.example.demo.modelos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="anuncios")
public class Anuncio {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=2, max=50, message="Este campo debe tener entre 2 y 50 caracteres")
	private String titulo;
	
	private String descripcion;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@Future(message="Debe ser una fecha futura")
	private Date fechaLimite;
	
//(pendiente)LISTO: private String clasificacion; //viajes, compras, tramites, eventos 
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
//Joins
	
	// Relación Many-to-Many con Clasificación
	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "anuncios_clasificaciones", 
               joinColumns = @JoinColumn(name = "anuncio_id"), 
               inverseJoinColumns = @JoinColumn(name = "clasificacion_id"))
    private List<Clasificacion> clasificaciones = new ArrayList<>();

//constructor
	public Anuncio() {}
	
//setters n getters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Date getFechaLimite() {
		return fechaLimite;
	}
	public void setFechaLimite(Date fechaLimite) {
		this.fechaLimite = fechaLimite;
	}

//methods
	@PrePersist
  	protected void onCreate() {
  	    this.createdAt = new Date();
  	}
	@PreUpdate
 	protected void onUpdate() {
 	    this.updatedAt = new Date();
 	}
}
