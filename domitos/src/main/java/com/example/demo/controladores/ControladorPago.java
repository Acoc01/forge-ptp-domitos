package com.example.demo.controladores;

import java.math.BigDecimal;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.mercadopago.MercadoPagoConfig;
import com.mercadopago.client.payment.PaymentClient;
import com.mercadopago.client.payment.PaymentCreateRequest;
import com.mercadopago.client.payment.PaymentPayerRequest;
import com.mercadopago.exceptions.MPApiException;
import com.mercadopago.exceptions.MPException;
import com.mercadopago.resources.payment.Payment;

@RestController
public class ControladorPago {

	@PostMapping("/process_payment")
	public ResponseEntity<Payment> processPayment(@RequestBody Map<String, Object> request) {
		
		//System.out.println(request.get("email"));
		BigDecimal amount = BigDecimal.valueOf((Integer)request.get("transactionAmount"));
		String token = (String)request.get("token");
		String email = (String)request.get("email");
		String paymentMethodId = (String)request.get("paymentMethodId");
		String description = (String)request.get("description");
		
		MercadoPagoConfig.setAccessToken("TEST-8291678554455497-101315-3f38e6ad3710fcaae1973e2164b64cb4-1021394133");
		 
		PaymentClient client = new PaymentClient();
		
		PaymentCreateRequest createRequest =
				PaymentCreateRequest.builder()
					.transactionAmount(amount)
					.token(token)
					.description(description)
					.installments(1)
					.paymentMethodId(paymentMethodId)
					.payer(PaymentPayerRequest.builder().email(email).build())
					.build();
		Payment payment = new Payment();
		try {
			payment = client.create(createRequest);
			System.out.println(payment);
			return new ResponseEntity<>(payment, HttpStatus.OK);
		}catch(MPApiException ex) {
			System.out.printf(
					"MercadoPago Error. Status: %s, Content: %s%n",
					ex.getApiResponse(), ex.getStatusCode(), ex.getApiResponse().getContent()
					);
		}catch(MPException ex) {
			ex.printStackTrace();
		}
		return new ResponseEntity<>(payment, HttpStatus.BAD_REQUEST);
	}

}
