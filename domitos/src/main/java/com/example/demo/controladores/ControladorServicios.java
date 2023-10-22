package com.example.demo.controladores;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	public String mostrarFormulario(Model model, HttpSession session) {
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null) {
			return "redirect:/";
		}
	    model.addAttribute("clasificaciones", Clasificacion.Clasificacion);
	    model.addAttribute("usuario", user);
	    return "anuncio.jsp";
	}


	@PostMapping("/guardarAnuncio")
	public String guardarAnuncio(@RequestParam ("titulo")String titulo, 
	                             @RequestParam ("descripcion") String descripcion,
	                             @DateTimeFormat(pattern = "yyyy-MM-dd") @RequestParam  ("fechaLimite") Date fechaLimite,
	                             @RequestParam ("clasificacion")String clasificacion,
	                             @RequestParam ("creadorId") Long hostId) {

		Usuario creador = servicios.encontrarUsuario(hostId);
	    Anuncio anuncio = new Anuncio();
	    anuncio.setTitulo(titulo);
	    anuncio.setDescripcion(descripcion);
	    anuncio.setFechaLimite(fechaLimite);
	    anuncio.setClasificacion(clasificacion);
	    anuncio.setCreador(creador);

	    ra.guardarAnuncio(anuncio);

	    return "redirect:/mostrarAnuncios";
	}



	@GetMapping("/mostrarAnuncios")
	public String mostrarAnuncios(Model model) {
		
		
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
		
		
		return "servdomo.jsp";
	}

}
