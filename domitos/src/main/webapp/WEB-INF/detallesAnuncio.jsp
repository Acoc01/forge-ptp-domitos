<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet">
<link href="css/foto_perfil.css" rel="stylesheet">
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
<main class="h-full position-relative bg-secondary">
	<!-- Seccion donde va la informacion principal del usuario -->
	<!-- Seccion de anuncios hechos por el usuario -->
	<section class="container-fluid bg-primary-subtle">
		<div class="row border-bottom mb-3 mt-1 text-center">
			<h3>Candidatos para ${ anuncio.titulo }</h3>
		</div>
		<!-- Aqui deberian mostrarse los anuncios del usuario ordenados desde el mas reciente al mas antiguo -->
		<!-- La idea es que se muestre un solo anuncio por fila o tres por fila, en este ejemplo hay tres por fila pero es provicional -->
		<div class="row bg-primary-subtle pb-4">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Nombre</th>
						<th>Pago</th>
					</tr>
				</thead>
				<c:forEach items="${ postulantes }" var="postulante">
					<tr>
						<td><a href="/perfil/${ postulante.id }">${ postulante.nombre } ${ postulante.apellido }</a></td>	
						<td><a href="/pago?id=${postulante.id }&precio=${anuncio.precio}" class="btn btn-primary">Pagar</a></td>
					</tr>
				</c:forEach>
				<tbody>
				</tbody>
			</table>
		</div>
	</section>
</main>
<footer></footer>
</body>
</html>
