package com.example.demo.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.modelos.Usuario;
import com.example.demo.servicios.Servicios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuarios {

	@Autowired
	private Servicios servicio;
	
	@GetMapping("/")
	public String index(@ModelAttribute("nuevoUsuario") Usuario nuevoUsuario) {
		return "login.jsp";
	}
	
	@PostMapping("/registro")
	public String registro(@Valid @ModelAttribute("nuevoUsuario") Usuario nuevoUsuario,
						   BindingResult result,
						   HttpSession session) {
		
		servicio.registrar(nuevoUsuario, result);

		if(result.hasErrors()) {
			return "index.jsp";
		} else {
			session.setAttribute("usuarioEnSesion", nuevoUsuario);
			return "redirect:/dashboard";
		}
	}
	@PostMapping("/registro/domo")
	public String registroDomo(@Valid @ModelAttribute("nuevoUsuario") Usuario nuevoUsuario,
							   BindingResult result,
							   HttpSession session) {
		servicio.registrar(nuevoUsuario, result);

		if(result.hasErrors()) {
			return "index.jsp";
		} else {
			session.setAttribute("usuarioEnSesion", nuevoUsuario);
			return "redirect:/dashboard";
		}
		
	}
	
	@PostMapping("/login") 
	public String login(@RequestParam("email") String email,
						@RequestParam("contrasena") String contrasena,
						RedirectAttributes redirectAttributes,
						HttpSession session) {
		
		Usuario usuarioInicioSesion = servicio.login(email, contrasena); 
		
		if(usuarioInicioSesion == null) {
			redirectAttributes.addFlashAttribute("error_login", "La información de Inicio de Sesión no es correcta");
			return "redirect:/";
		} else {
			session.setAttribute("usuarioEnSesion", usuarioInicioSesion);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("usuarioEnSesion");
		return "redirect:/";
	}
	
	@GetMapping("/dashboard")
	public String temporal() {
		return "temp.jsp";
	}
}
