<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link href="/css/login.css" rel="stylesheet">
<link rel="stylesheet" href="/css/servgeneral.css">
</head>
<body>
<nav>
	<button class="titulo" onclick="location.href='/'">Domos</button>
	<c:if test="${ usuarioEnSesion == null }">
		<button class="botones"onclick="location.href='/formulario_registro'">Registrarme</button>
		<button class="botones"onclick="location.href='/login'">Iniciar Sesion</button>
	</c:if>
	<c:if test="${ usuarioEnSesion != null }">
		<button class="botones"onclick="location.href='/logout'">Cerrar Sesion</button>
		<button class="botones"onclick="location.href='/perfil'">${ usuarioEnSesion.nombre }</button>
	</c:if>
</nav>
<!--   <nav class="navbar navbar-expand-lg bg-body-tertiary">
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
</nav> -->
<main class="h-full position-relative align-items-center">
	<section class="container rounded-3 shadow w-25 bg-light position-absolute top-50 start-50 translate-middle">
		<div class="row border-bottom m-3 text-center">
			<h3>Iniciar Sesion</h3>
			<c:if test="${ mensaje != null }">
				<p class="text-success">${ mensaje }</p>
			</c:if>
		</div>
		<div class="row">
			<div class="col	">
				<form action="/login" method="post">
					<div>
						<label for="email" class="form-label text-body-black">E-mail</label>
						<input id="email" type="email" class="form-control" name="email" />
					</div>
					<div>
						<label for="password" class="form-label">Password</label>
						<input id="password" type="password" class="form-control" name="contrasena" />
					</div>
					<div class="d-flex justify-content-center">
						<input type="submit" class="btn bg-light border border-2 btn-1 mt-3 mb-3" value="Inicia Sesión" />
					</div>
				</form>
				<div class="d-flex justify-content-center">
					<a href="/recuperar" class="mt-3 mb-3 text-dark">Recuperar contraseña</a>
				</div>
			</div>	
		</div>
	</section>
</main>
<footer></footer>
</body>
</html>