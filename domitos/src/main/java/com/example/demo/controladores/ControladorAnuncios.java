package com.example.demo.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorAnuncios {

	@GetMapping("/certificado")
	public String certificado() {
		return "certificado.jsp";
	}
}
