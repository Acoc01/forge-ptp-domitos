package com.example.demo.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelos.Anuncio;

@Repository
public interface RepositorioAnuncio extends CrudRepository<Anuncio, Long> {

	List<Anuncio> findAll();

	List<Anuncio> findByClasificacion(String clasificacion);
	
	
}
