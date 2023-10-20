<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Certificado de antecedentes penales</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">Domos</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="ml-5 collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="#">Inicio</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#"></a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	              Servicios
	          </a>
	          <ul class="dropdown-menu">
	            <li><a class="dropdown-item" href="#">Cuidados</a></li>
	            <li><a class="dropdown-item" href="#">Tramites</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Reparaciones</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
	
		<h1>Adjunta tu certificado de antecendetes penales</h1>
		<p>Debes cargar una foto de tu certificado de antecedentes reciente (antigüedad máxima de un mes desde la fecha de emisión), el cual puedes obtener en la oficina del Registro Civil sin costo alguno. Si ya cuentas con la clave única del Registro Civil, puedes obtenerlo sin salir de tu casa. Pon especial atención en que todos los campos sean visibles, y sube el documento completo. RECUERDA: Es importante que el folio, código de verificación y fecha de emisión se vean claramente.</p>
	<img src="/images/certificado_de_antecedentes.png" alt="Cert. de Antecedentes" width="400" height="500">
	<a href="/foto" class="btn btn-dark btn-lg col-4">SUBIR IMAGEN AQUÍ</a>
	
	
	
	</div>
</body>
</html>