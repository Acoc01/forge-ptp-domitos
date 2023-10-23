package com.example.demo.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.modelos.Anuncio;
import com.example.demo.modelos.Usuario;
import com.example.demo.servicios.ServicioAnuncio;
import com.example.demo.servicios.Servicios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuarios {

	@Autowired
	private Servicios servicio;
	@Autowired ServicioAnuncio sa;
	
	@GetMapping("/")
	public String index(@ModelAttribute("nuevoUsuario") Usuario nuevoUsuario) {
		return "index.jsp";
	}

	@PostMapping("/registro")
	public String registro(@Valid @ModelAttribute("nuevoUsuario") Usuario nuevoUsuario,
						   BindingResult result,
						   HttpSession session, @RequestParam("domo") Boolean domo) {
		
		servicio.registrar(nuevoUsuario, result, domo);

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
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/";
		}
		session.removeAttribute("usuarioEnSesion");
		return "redirect:/";
	}
	
	@GetMapping("/perfil")
	public String perfil(HttpSession session, Model model) {
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/";
		}
		Usuario usuario = servicio.encontrarUsuario(user.getId());
		List<Anuncio> misAnuncios = sa.encontrarMisAnuncios(usuario.getId());
		model.addAttribute("anuncios",misAnuncios);
		model.addAttribute("usuario",usuario);
		model.addAttribute("postulaciones", usuario.getListaAnuncios());
		return "perfil.jsp";
	}
	@GetMapping("/perfil/{id}")
	public String perfil(@PathVariable("id") Long userId, HttpSession session, Model model) {
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/";
		}
		Usuario usuario = servicio.encontrarUsuario(userId);
		List<Anuncio> misAnuncios = sa.encontrarMisAnuncios(usuario.getId());
		model.addAttribute("anuncios",misAnuncios);
		model.addAttribute("usuario",usuario);
		model.addAttribute("postulaciones", usuario.getListaAnuncios());
		return "perfil.jsp";
	}
	@GetMapping("/dashboard")
	public String temporal(HttpSession session) {
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/";
		}
		return "servdomo.jsp";
	}
	
	@GetMapping("/login")
	public String iniciarSesion() {
		return "login.jsp";
	}
}
