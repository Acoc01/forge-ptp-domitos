package com.example.demo.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorPruebaPago {
	@GetMapping("/pago")
	public String pagar() {
		return "pago.jsp";
	}

}
