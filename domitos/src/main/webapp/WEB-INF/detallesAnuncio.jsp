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
<link rel="stylesheet" href="/css/servgeneral.css">
</head>
<body>
    
<nav>
	<button class="titulo" onclick="location.href='/'">Domos</button>
	<c:if test="${ usuarioEnSesion == null }">
		<button class="botones"onclick="location.href='/registrarme'">Registrarme</button>
		<button class="botones"onclick="location.href='/login'">Iniciar Sesion</button>
	</c:if>
	<c:if test="${ usuarioEnSesion != null }">
		<button class="botones"onclick="location.href='/logout'">Cerrar Sesion</button>
		<button class="botones"onclick="location.href='/perfil'">${ usuarioEnSesion.nombre }</button>
	</c:if>
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
