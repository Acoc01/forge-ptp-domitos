package com.example.demo.modelos;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="medallas")
public class Medalla {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=2, max=50, message="Este campo debe tener entre 2 y 50 caracteres")
	private String titulo;
	
	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=2, max=50, message="Este campo debe tener entre 2 y 50 caracteres")
	private String color;
	
	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=2, max=50, message="Este campo debe tener entre 2 y 50 caracteres")
	private String tipo;
	
	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=2, max=50, message="Este campo debe tener entre 2 y 50 caracteres")
	private String tiempo;
	
	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=2, max=50, message="Este campo debe tener entre 2 y 50 caracteres")
	private String descripcion;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
//Joins
	
	//usuario
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="usuario_id")
	private Usuario usuario;

	//constructor
	public Medalla() {
	}

	//getters n setters
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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getTiempo() {
		return tiempo;
	}

	public void setTiempo(String tiempo) {
		this.tiempo = tiempo;
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
