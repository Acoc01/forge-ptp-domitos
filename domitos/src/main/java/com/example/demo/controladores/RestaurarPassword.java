package com.example.demo.controladores;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.modelos.Usuario;
import com.example.demo.servicios.Servicios;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Controller
public class RestaurarPassword {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private Servicios servicios;
	
	@GetMapping("/recuperar")
	public String form() {
		return "recuperar_form.jsp";
	}
	
	@PatchMapping("/recuperar")
	public String procesarForm(@RequestParam("email") String email, Model model) {
		
		String randomStr = Long.toHexString(Double.doubleToLongBits(Math.random()));
		
		try {
			
			servicios.updateResetPasswordToken(randomStr, email);
			String resetPasswordLink = "localhost:8080/reiniciar_password?token="+randomStr;
			sendEmail(email, resetPasswordLink);
			model.addAttribute("mensaje", "Hemos enviado un link a su correo para reiniciar la contraseña");
			
		}catch(MessagingException | UnsupportedEncodingException ex) {
			
			model.addAttribute("error", "Error al mandar mensaje");
			
		}
		
		return "recuperar_form.jsp";
	}
	
	public void sendEmail(String email, String link) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("dkaacoc@gmail.com", "Domos Soporte");
		helper.setTo(email);
		
		String subject = "Este es el link para reiniciar tu contraseña";
	    String content = "<p>Hello,</p>"
	            + "<p>You have requested to reset your password.</p>"
	            + "<p>Click the link below to change your password:</p>"
	            + "<p><a href=\"" + link + "\">Change my password</a></p>"
	            + "<br>"
	            + "<p>Ignore this email if you do remember your password, "
	            + "or you have not made the request.</p>";
	    helper.setSubject(subject);
	    helper.setText(content, true);
	    mailSender.send(message);
	}
	
	@GetMapping("/reiniciar_password")
	public String formReinicio(@Param(value = "token") String token, Model model) {
		Usuario usuario = servicios.getByResetPasswordToken(token);
		model.addAttribute("token", token);
		if(usuario == null) {
			model.addAttribute("mensaje", "Token Invalido");
			return "mensaje";
		}
		
		return "reiniciar_password.jsp";
	}
	
	@PatchMapping("/reiniciar_password")
	public String procesarFormReinicio(@RequestParam("token") String token, @RequestParam("password") String password, Model model) {
		Usuario user = servicios.getByResetPasswordToken(token);
		if(user == null) {
			model.addAttribute("mensaje", "Token Invalido");
			return "redirect:/reiniciar_password";
		}else {
			servicios.updatePassword(user, password);
			model.addAttribute("mensaje","Se ha actualizado su contraseña");
		}
		return "redirect:/login";
	}
}
