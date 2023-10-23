package com.example.demo.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.modelos.Usuario;
import com.example.demo.servicios.Servicios;

import jakarta.servlet.http.HttpSession;

@Controller
public class ControladorPruebaPago {
	@Autowired
	private Servicios servicio;
	@GetMapping("/pago")
	public String pagar(@RequestParam(value="id") Long userId,HttpSession session, Model model,
						@RequestParam(value="precio") Integer precio) {
		Usuario user = (Usuario)session.getAttribute("usuarioEnSesion");
		if(user == null || user.getDomo() == true) {
			return "redirect:/";
		}
		Usuario usuario = servicio.encontrarUsuario(userId);
		model.addAttribute("domo", usuario);
		model.addAttribute("precio", precio);
		return "pago.jsp";
	}

}
