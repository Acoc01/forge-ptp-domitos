package com.example.demo.modelos;

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
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
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
	
	@NotEmpty(message="El campo de clasificacion es obligatorio")
	private String clasificacion;
	
	@NotEmpty(message="El campo de direccion es obligatorio")
	private String direccion;
	
	@NotNull(message="El precio es obligatorio")
	private Integer precio;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
//Joins
//	@OneToOne(fetch=FetchType.LAZY) //pendiente: preguntarle a la profe CASCADE TYPE ????????????????????????????????????????????????????
//	@JoinColumn(name="direccion_id")
//	private Direccion direccion;

	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="creador_id")
	private Usuario creador;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="postulaciones",
			   joinColumns=@JoinColumn(name="anuncio_id"),
			   inverseJoinColumns=@JoinColumn(name="domo_id"))
	private List<Usuario> listaDomos;

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

//	public Direccion getDireccion() {
//		return direccion;
//	}
//	public void setDireccion(Direccion direccion) {
//		this.direccion = direccion;
//	}


	public String getClasificacion() {
		return clasificacion;
	}

	public void setClasificacion(String clasificacion) {
		this.clasificacion = clasificacion;
	}

	public Usuario getCreador() {
		return creador;
	}
	public void setCreador(Usuario creador) {
		this.creador = creador;
	}

	public List<Usuario> getListaDomos() {
		return listaDomos;
	}
	public void setListaDomos(List<Usuario> listaDomos) {
		this.listaDomos = listaDomos;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Integer getPrecio() {
		return precio;
	}

	public void setPrecio(Integer precio) {
		this.precio = precio;
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
