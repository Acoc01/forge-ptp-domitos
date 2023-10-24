<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link href="/css/login.css" rel="stylesheet">
<link href="/css/foto_perfil.css" rel="stylesheet">
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
		<button class="botones"onclick="location.href='/servicios/general'">Inicio</button>
	</c:if>
</nav>
<!--  <nav class="navbar navbar-expand-lg bg-body-tertiary">
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
<main class="h-full position-relative">
	<!-- Seccion donde va la informacion principal del usuario -->
	<section class="container-fluid bg-light">
		<div class="row border-bottom text-center pt-3">
			<h3>Perfil</h3>
		</div>
		<div class="row">
			<div class="d-flex align-items-center">
				<img src="/images/Profile.png" class="profile-photo float-start rounded-4">
				<div class="info">
					<p class="border-bottom">Nombre: ${ usuario.nombre }</p>
					<p class="border-bottom">E-mail: ${ usuario.email }</p>	
				</div>
			</div>
		</div>
	</section>
	<!-- Seccion de anuncios hechos por el usuario -->
	<section class="container-fluid">
		<div class="row border-bottom mb-3 mt-3 text-center">
			<c:if test="${ usuario.domo == false }">
				<h3>Mis Anuncios</h3>
			</c:if>
			<c:if test="${ usuario.domo == true }">
				<h3>Mis Postulaciones</h3>
			</c:if>
		</div>
		<!-- Aqui deberian mostrarse los anuncios del usuario ordenados desde el mas reciente al mas antiguo -->
		<!-- La idea es que se muestre un solo anuncio por fila o tres por fila, en este ejemplo hay tres por fila pero es provicional -->
		<div class="row card-section pb-4">
			<c:if test="${ usuario.domo == false }">
				<c:forEach items="${ anuncios }" var="anuncio">
					<div class="col-sm-4">
						<div class="card text-center mt-2">
						  <div class="card-header">
							${ anuncio.clasificacion }
						  </div>
						  <div class="card-body">
							<h5 class="card-title">${ anuncio.titulo }</h5>
							<p class="card-text">${ anuncio.descripcion }</p>
							<c:if test="${ usuario.id == usuarioEnSesion.id }">
								<a href="/anuncios/${ anuncio.id }" class="btn btn-primary">Ver Solicitantes</a>
							</c:if>
						  </div>
						  <div class="card-footer text-body-secondary">
							${ anuncio.createdAt }
						  </div>
						</div>
					</div>	
				</c:forEach>
			</c:if>
			<c:if test="${ usuario.domo == true}">
				<c:forEach items="${ postulaciones }" var="anuncio">
					<div class="col-sm-4 mt-2">
						<div class="card text-center">
						  <div class="card-header">
							${ anuncio.clasificacion }
						  </div>
						  <div class="card-body">
							<h5 class="card-title">${ anuncio.titulo }</h5>
							<p class="card-text">${ anuncio.descripcion }</p>
						  </div>
						  <div class="card-footer text-body-secondary">
							${ anuncio.createdAt }
						  </div>
						</div>
					</div>	
				</c:forEach>
			</c:if>
		</div>
		
	</section>
</main>
<footer></footer>
</body>
</html>
