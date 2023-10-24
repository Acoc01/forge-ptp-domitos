package com.example.demo.controladores;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.modelos.Anuncio;
import com.example.demo.modelos.Clasificacion;
import com.example.demo.modelos.Usuario;
import com.example.demo.servicios.ServicioAnuncio;
import com.example.demo.servicios.Servicios;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorServicios {

	@Autowired
	private ServicioAnuncio ra;
	@Autowired
	private Servicios servicios;

	@GetMapping("/crearAnuncio")
	public String mostrarFormulario(@ModelAttribute("anuncio") Anuncio anuncio, Model model, HttpSession session) {
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/login";
		}
		if(user.getDomo() == true) {
			return "redirect:/";
		}
		Usuario usuario = servicios.encontrarUsuario(user.getId());
	    model.addAttribute("clasificaciones", Clasificacion.Clasificacion);
	    model.addAttribute("usuario", usuario);
	    return "crearAnuncio.jsp";
	}
	
	@GetMapping("/servicios/general")
	public String serviciosGeneral(HttpSession session, Model model) {
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/login";
		}
		if(user != null && user.getDomo() == true) {
			return "redirect:/servicios/domo";
		}
		return "servgeneral.jsp";
	}
	
//	@PostMapping("/guardarAnuncio")
//	public String guardarAnuncio(@Valid @ModelAttribute("anuncio") Anuncio anuncio, BindingResult result, HttpSession session, Model model) {
//		Usuario temp = (Usuario)session.getAttribute("usuarioEnSesion");
//		if(temp == null) {
//			return "redirect:/";
//		}
//		if(result.hasErrors()) {
//			model.addAttribute("clasificaciones", Clasificacion.Clasificacion);
//			model.addAttribute("usuario", temp);
//			return "anuncio.jsp";
//		}else {
//
//			ra.guardarAnuncio(anuncio);
//			return "redirect:/mostrarAnuncios";
//		}
//		
//	}


	@PostMapping("/guardarAnuncio")
	public String guardarAnuncio(@RequestParam ("titulo")String titulo, 
	                             @RequestParam ("descripcion") String descripcion,
	                             @DateTimeFormat(pattern = "yyyy-MM-dd") @RequestParam  ("fechaLimite") Date fechaLimite,
	                             @RequestParam ("clasificacion")String clasificacion,
	                             @RequestParam ("creadorId") Long hostId,
	                             @RequestParam ("direccion") String direccion,
	                             @RequestParam ("precio") Integer precio, HttpSession session) {

		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/login";
		}
		if(user.getDomo() == true) {
			return "redirect:/";
		}
		Usuario creador = servicios.encontrarUsuario(hostId);
	    Anuncio anuncio = new Anuncio();
	    anuncio.setTitulo(titulo);
	    anuncio.setDescripcion(descripcion);
	    anuncio.setFechaLimite(fechaLimite);
	    anuncio.setClasificacion(clasificacion);
	    anuncio.setCreador(creador);
	    anuncio.setDireccion(direccion);
	    anuncio.setPrecio(precio);

	    ra.guardarAnuncio(anuncio);

	    return "redirect:/perfil";
	}



	@GetMapping("/mostrarAnuncios")
	public String mostrarAnuncios(Model model, HttpSession session) {
		
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/login";
		}
		
		Usuario usuario = servicios.encontrarUsuario(user.getId());
		model.addAttribute("usuario",usuario);
		
		List<Anuncio> tramites = ra.encontrarAnuncios("tramites");
		List<Anuncio> cuidados = ra.encontrarAnuncios("cuidados");
		List<Anuncio> reparaciones = ra.encontrarAnuncios("reparaciones");
		List<Anuncio> cuidadoAdultoMayor = ra.encontrarAnuncios("cuidadoAdulto");
		List<Anuncio> cuidadoNinos = ra.encontrarAnuncios("cuidadoNinos");
		List<Anuncio> mascotas = ra.encontrarAnuncios("cuidadoMascotas");
		
		
		model.addAttribute("tramites", tramites);
		model.addAttribute("cuidados", cuidados);
		model.addAttribute("reparaciones", reparaciones);
		model.addAttribute("cuidadoAdulto", cuidadoAdultoMayor);
		model.addAttribute("cuidadoNino", cuidadoNinos);
		model.addAttribute("mascotas", mascotas);
		
		
		return "servdomo.jsp";
	}
	
	@GetMapping("/anuncios/{id}")
	public String detalles(@PathVariable("id") Long anuncioId, HttpSession session, Model model) {
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/login";
		}
		Anuncio miAnuncio = ra.encontrarAnuncioPorId(anuncioId);
		model.addAttribute("anuncio",miAnuncio);
		model.addAttribute("postulantes", miAnuncio.getListaDomos());
		return "detallesAnuncio.jsp";
	}
	
	@PostMapping("/anuncio/{anuncioId}/solicitar")
	public String solicitud(@PathVariable("anuncioId") Long anuncioId, @RequestParam("id") Long userId, HttpSession session, Model model) {

		Usuario temp = (Usuario)session.getAttribute("usuarioEnSesion");
		if(temp == null) {
			return "redirect:/login";
		}
		if(temp.getDomo() == false) {
			return "redirect:/";
		}
		Anuncio anuncio = ra.encontrarAnuncioPorId(anuncioId);
		Usuario user = servicios.encontrarUsuario(userId);
		List<Usuario> domos = anuncio.getListaDomos();
		domos.add(user);
		anuncio.setListaDomos(domos);
		user.getListaAnuncios().add(anuncio);
		ra.guardarAnuncio(anuncio);
		servicios.guardarUsuario(user);
		
		
		List<Anuncio> tramites = ra.encontrarAnuncios("tramites");
		List<Anuncio> cuidados = ra.encontrarAnuncios("cuidados");
		List<Anuncio> reparaciones = ra.encontrarAnuncios("reparaciones");
		List<Anuncio> cuidadoAdultoMayor = ra.encontrarAnuncios("cuidadoAdulto");
		List<Anuncio> cuidadoNinos = ra.encontrarAnuncios("cuidadoNinos");
		List<Anuncio> mascotas = ra.encontrarAnuncios("mascotas");
		
		
		model.addAttribute("tramites", tramites);
		model.addAttribute("cuidados", cuidados);
		model.addAttribute("reparaciones", reparaciones);
		model.addAttribute("cuidadoAdulto", cuidadoAdultoMayor);
		model.addAttribute("cuidadoNino", cuidadoNinos);
		model.addAttribute("mascotas", mascotas);
		
		return "redirect:/mostrarAnuncios";
	}

}
