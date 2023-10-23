package com.example.demo.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelos.Postulacion;

@Repository
public interface RepositorioPostulaciones extends CrudRepository<Postulacion, Long>{

}
