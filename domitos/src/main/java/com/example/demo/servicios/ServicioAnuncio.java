package com.example.demo.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.modelos.Anuncio;
import com.example.demo.repositorios.RepositorioAnuncio;

@Service
public class ServicioAnuncio {

	@Autowired
	private RepositorioAnuncio  ra;
	
	public Anuncio guardarAnuncio(Anuncio anuncio) {
		return ra.save(anuncio);
	}
	
	public List<Anuncio> encontrarAnuncios ( String clasificacion) {
		return ra.findByClasificacion(clasificacion);
	}
	
	public List<Anuncio> encontrarMisAnuncios(Long id){
		return ra.findByCreadorId(id);
	}
	
	public Anuncio encontrarAnuncioPorId(Long id) {
		return ra.findById(id).orElse(null);
	}
	
	
	

}
