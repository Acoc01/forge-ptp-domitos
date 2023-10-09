package com.example.demo.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.modelos.Usuario;


@Repository
public interface RepositorioUsuarios extends CrudRepository<Usuario, Long> {
	
	List<Usuario> findAll();
	Usuario findByEmail(String email);
}
