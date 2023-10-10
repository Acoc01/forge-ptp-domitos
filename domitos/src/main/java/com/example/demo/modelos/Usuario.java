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
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="usuarios")
public class Usuario {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=2, max=50, message="Este campo debe tener entre 2 y 50 caracteres")
	private String nombre;
	
	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=2, max=50, message="Este campo debe tener entre 2 y 50 caracteres")
	private String apellido;
	
	@NotEmpty(message="Este campo es obligatorio")
	@Email(message="Ingresa un mail válido")
	private String email;
	
	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=6, message="La contraseña requiere al menos 6 caracteres")
	private String contrasena;
	
	@Transient
	@NotEmpty(message="Este campo es obligatorio")
	@Size(min=6, message="La contraseña requiere al menos 6 caracteres")
	private String confirmacion;
	
	@NotNull
	private Boolean domo;
	
	private Integer cuentaBancaria;
	
	private Integer rut;
	
	private String descripcion;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
//Joins
	@OneToMany(fetch=FetchType.LAZY, mappedBy="usuario")
	private List<Direccion> direcciones;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="creador")
	private List<Anuncio> anunciosCreados;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="medallas_de_usuarios",
			   joinColumns=@JoinColumn(name="usuario_id"),
			   inverseJoinColumns=@JoinColumn(name="medalla_id"))
	private List<Medalla> medallas;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(name="postulaciones",
			   joinColumns=@JoinColumn(name="domo_id"),
			   inverseJoinColumns=@JoinColumn(name="anuncio_id"))
	private List<Anuncio> listaAnuncios;
	
//constructor
	public Usuario() {}
	
//getters n setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getContrasena() {
		return contrasena;
	}
	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public String getConfirmacion() {
		return confirmacion;
	}
	public void setConfirmacion(String confirmacion) {
		this.confirmacion = confirmacion;
	}

	public Boolean getDomo() {
		return domo;
	}
	public void setDomo(Boolean domo) {
		this.domo = domo;
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

	public Integer getCuentaBancaria() {
		return cuentaBancaria;
	}
	public void setCuentaBancaria(Integer cuentaBancaria) {
		this.cuentaBancaria = cuentaBancaria;
	}

	public Integer getRut() {
		return rut;
	}
	public void setRut(Integer rut) {
		this.rut = rut;
	}

	public List<Direccion> getDirecciones() {
		return direcciones;
	}
	public void setDirecciones(List<Direccion> direcciones) {
		this.direcciones = direcciones;
	}

	public List<Anuncio> getAnunciosCreados() {
		return anunciosCreados;
	}
	public void setAnunciosCreados(List<Anuncio> anunciosCreados) {
		this.anunciosCreados = anunciosCreados;
	}

	public List<Medalla> getMedallas() {
		return medallas;
	}
	public void setMedallas(List<Medalla> medallas) {
		this.medallas = medallas;
	}

	public List<Anuncio> getListaAnuncios() {
		return listaAnuncios;
	}
	public void setListaAnuncios(List<Anuncio> listaAnuncios) {
		this.listaAnuncios = listaAnuncios;
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
