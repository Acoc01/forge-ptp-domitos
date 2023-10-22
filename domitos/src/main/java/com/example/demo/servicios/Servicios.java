package com.example.demo.servicios;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.demo.modelos.Usuario;
import com.example.demo.repositorios.RepositorioUsuarios;

@Service
public class Servicios {
	
	@Autowired
	private RepositorioUsuarios repoUsuarios;
	
	public Usuario encontrarUsuario(Long id) {
		return repoUsuarios.findById(id).orElse(null);
	}
	
	/* Método que me registre un nuevo usuario */
    public Usuario registrar(Usuario nuevoUsuario, BindingResult result, Boolean domo) {
        //Comparamos contraseñas
        String contrasena = nuevoUsuario.getContrasena();
        String confirmacion = nuevoUsuario.getConfirmacion();
        if(!contrasena.equals(confirmacion)) {
            //input, clave, mensaje
            result.rejectValue("confirmacion", "Matches", "Las contraseñas no coinciden");
        }

        //Revisamos que el correo que recibimos NO exista en mi BD
        String email = nuevoUsuario.getEmail();
        Usuario existeUsuario = repoUsuarios.findByEmail(email);
        if(existeUsuario != null) {
            //El correo ya está registrado
            result.rejectValue("email", "Unique", "El correo ingresado ya se encuentra registrado.");
        }

        //Si existe error, entonces regresamos null
        if(result.hasErrors()) {
            return null;
        } else {
            //Si NO hay error GUARDAMOS!
            //Encriptamos contraseña
            String contra_encriptada = BCrypt.hashpw(contrasena, BCrypt.gensalt());
            nuevoUsuario.setContrasena(contra_encriptada);
            System.out.println(contrasena);
            System.out.println(contra_encriptada);
            nuevoUsuario.setDomo(domo);
            return repoUsuarios.save(nuevoUsuario);
        }

    }
    
    public Usuario login(String email, String contrasena) {
        //Revisamos que el correo que recibimos esté en BD
        Usuario usuarioInicioSesion = repoUsuarios.findByEmail(email); //Objeto Usuario o null
        //Obj(Usuario) nombre: Elena, apellido: De Troya, password: $2sas9mnasoasla
        if(usuarioInicioSesion == null) {
            return null;
        }

        //Comparamos contraseñas
        //BCrypt.checkpw(Contra NO encriptada, Contra SI encriptada) -> 
        //TRUE todo correcto, FALSE si no coinciden
        if(BCrypt.checkpw(contrasena, usuarioInicioSesion.getContrasena())) {
            return usuarioInicioSesion;
        }

        return null;

    }

    public Usuario updateResetPasswordToken(String token, String email) {
    	Usuario usuarioExiste = repoUsuarios.findByEmail(email);
    	
    	if(usuarioExiste == null) {
    		return null;
    	}
    	
    	usuarioExiste.setResetPasswordToken(token);
    	usuarioExiste.setConfirmacion(email);
    	repoUsuarios.save(usuarioExiste);
    	return usuarioExiste;
    }
    
    public Usuario getByResetPasswordToken(String token) {
    	return repoUsuarios.findByResetPasswordToken(token);
    }
    
    public Usuario updatePassword(Usuario user, String newPassword) {
		String contra_encriptada = BCrypt.hashpw(newPassword, BCrypt.gensalt());
		user.setContrasena(contra_encriptada);
		user.setConfirmacion(contra_encriptada);
		repoUsuarios.save(user);
		return user;
    }

}
