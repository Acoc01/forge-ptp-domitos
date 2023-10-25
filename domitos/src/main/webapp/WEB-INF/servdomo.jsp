<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Servicios</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/servgeneral.css">
<link rel="stylesheet" type="text/css" href="/css/main.css">
</head>
<body>
	<nav>
		<button class="titulo" onclick="location.href='/'">Domos</button>
		<c:if test="${ usuarioEnSesion == null }">
			<button class="botones fs-2" onclick="location.href='/registrarme'">Registrarme</button>
			<button class="botones fs-2" onclick="location.href='/login'">Iniciar
				Sesion</button>
		</c:if>
		<c:if test="${ usuarioEnSesion != null }">
			<button class="botones fs-2" onclick="location.href='/logout'">Cerrar
				Sesion</button>
			<button class="botones fs-2" onclick="location.href='/perfil'">${ usuarioEnSesion.nombre }</button>
		</c:if>
	</nav>
	<!-- menu -->
	<div class="container">

		<div class="row text-center">
			<h1>Tramites</h1>
			<c:forEach items="${tramites}" var="anuncio">

				<div class="col-sm-4">
					<div class="card text-center mt-2">
						<div class="card-header">${ anuncio.titulo }</div>
						<div class="card-body">
							<h5 class="card-title">Precio: ${ anuncio.precio } CLP</h5>
							<p class="card-text">${ anuncio.descripcion }</p>
							<c:if
								test="${ usuario.domo == true && anuncio.listaDomos.contains(usuario) == false  }">
								<form action="anuncio/${ anuncio.id }/solicitar" method="POST">
									<input type="hidden" value="${ usuario.id }" name="id">
									<input class="btn btn-primary mt-3" type="submit"
										value="Enlistarse">
								</form>
							</c:if>
						</div>
						<div class="card-footer text-body-secondary">Fecha Limite:
							${ anuncio.fechaLimite }</div>
					</div>
				</div>

				<%-- 				<h4>${tramites.titulo}</h4>
				<p>${tramites.descripcion}</p>
				<p>Fecha Límite: ${tramites.fechaLimite}</p>
				<p>Precio: ${ tramites.precio }</p>
				<c:if
					test="${ usuario.domo == true && tramites.listaDomos.contains(usuario) == false}">
					<form action="anuncio/${ tramites.id }/solicitar" method="POST">
						<input type="hidden" value="${ usuario.id }" name="id"> <input
							type="submit" value="Enlistarse">
					</form>
				</c:if>
 --%>
			</c:forEach>
			<c:if test="${ usuario.domo == false}">
				<a href="crearAnuncio">Crear mi anuncio</a>
			</c:if>
		</div>
	</div>



	<div class="container">
		<div class="row text-center">

			<h1>Cuidados</h1>
			<h2 class="h2">Cuidado Adulto Mayor</h2>
			<c:forEach items="${cuidadoAdulto}" var="anuncio">

				<div class="col-sm-4">
					<div class="card text-center mt-2">
						<div class="card-header">${ anuncio.titulo }</div>
						<div class="card-body">
							<h5 class="card-title">Precio: ${ anuncio.precio } CLP</h5>
							<p class="card-text">${ anuncio.descripcion }</p>
							<c:if
								test="${ usuario.domo == true && anuncio.listaDomos.contains(usuario) == false  }">
								<form action="anuncio/${ anuncio.id }/solicitar" method="POST">
									<input type="hidden" value="${ usuario.id }" name="id">
									<input class="btn btn-primary mt-3" type="submit"
										value="Enlistarse">
								</form>
							</c:if>
						</div>
						<div class="card-footer text-body-secondary">Fecha Limite:
							${ anuncio.fechaLimite }</div>
					</div>
				</div>
				<%-- 			<h4>${cuidadoAdulto.titulo}</h4>
			<p>${cuidadoAdulto.descripcion}</p>
			<p>Fecha Límite: ${cuidadoAdulto.fechaLimite}</p>
			<p>Precio: ${ cuidadoAdulto.precio }</p>
			<c:if
				test="${ usuario.domo == true && cuidados.listaDomos.contains(usuario) == false}">
				<form action="anuncio/${ cuidados.id }/solicitar" method="POST">
					<input type="hidden" value="${ usuario.id }" name="id"> <input
						type="submit" value="Enlistarse">
				</form>
			</c:if>
 --%>
			</c:forEach>
			<h2 class="h2">Mascotas</h2>
			<c:forEach items="${mascotas}" var="anuncio">

				<div class="col-sm-4">
					<div class="card text-center mt-2">
						<div class="card-header">${ anuncio.titulo }</div>
						<div class="card-body">
							<h5 class="card-title">Precio: ${ anuncio.precio } CLP</h5>
							<p class="card-text">${ anuncio.descripcion }</p>
							<c:if
								test="${ usuario.domo == true && anuncio.listaDomos.contains(usuario) == false  }">
								<form action="anuncio/${ anuncio.id }/solicitar" method="POST">
									<input type="hidden" value="${ usuario.id }" name="id">
									<input class="btn btn-primary mt-3" type="submit"
										value="Enlistarse">
								</form>
							</c:if>
						</div>
						<div class="card-footer text-body-secondary">Fecha Limite:
							${ anuncio.fechaLimite }</div>
					</div>
				</div>
				<%-- 			<h4>${mascotas.titulo}</h4>
			<p>${mascotas.descripcion}</p>
			<p>Fecha Límite: ${mascotas.fechaLimite}</p>
			<p>Precio: ${ mascotas.precio }</p>
			<c:if
				test="${ usuario.domo == true && mascotas.listaDomos.contains(usuario) == false}">
				<form action="anuncio/${ mascotas.id }/solicitar" method="POST">
					<input type="hidden" value="${ usuario.id }" name="id"> <input
						type="submit" value="Enlistarse">
				</form>
			</c:if>
 --%>
			</c:forEach>
			<h2 class="h2">Cuidados Niños</h2>
			<c:forEach items="${cuidadoNino}" var="anuncio">

				<div class="col-sm-4">
					<div class="card text-center mt-2">
						<div class="card-header">${ anuncio.titulo }</div>
						<div class="card-body">
							<h5 class="card-title">Precio: ${ anuncio.precio } CLP</h5>
							<p class="card-text">${ anuncio.descripcion }</p>
							<c:if
								test="${ usuario.domo == true && anuncio.listaDomos.contains(usuario) == false  }">
								<form action="anuncio/${ anuncio.id }/solicitar" method="POST">
									<input type="hidden" value="${ usuario.id }" name="id">
									<input class="btn btn-primary mt-3" type="submit"
										value="Enlistarse">
								</form>
							</c:if>
						</div>
						<div class="card-footer text-body-secondary">Fecha Limite:
							${ anuncio.fechaLimite }</div>
					</div>
				</div>
				<%-- 			<h4>${cuidadoNino.titulo}</h4>
			<p>${cuidadoNino.descripcion}</p>
			<p>Fecha Límite: ${cuidadoNino.fechaLimite}</p>
			<p>Precio: ${ cuidadoNino.precio }</p>
			<c:if
				test="${ usuario.domo == true && cuidadoNino.listaDomos.contains(usuario) == false}">
				<form action="anuncio/${ cuidadoNino.id }/solicitar" method="POST">
					<input type="hidden" value="${ usuario.id }" name="id"> <input
						type="submit" value="Enlistarse">
				</form>
			</c:if>
 --%>
			</c:forEach>
			<c:if test="${ usuario.domo == false}">
				<a href="crearAnuncio">Crear mi anuncio</a>
			</c:if>
		</div>
	</div>


	<div class="container">
		<div class="row text-center">

			<h1>Reparaciones</h1>
			<c:forEach items="${reparaciones}" var="reparaciones">

				<div class="col-sm-4">
					<div class="card text-center mt-2">
						<div class="card-header">${ anuncio.titulo }</div>
						<div class="card-body">
							<h5 class="card-title">Precio: ${ anuncio.precio } CLP</h5>
							<p class="card-text">${ anuncio.descripcion }</p>
							<c:if
								test="${ usuario.domo == true && anuncio.listaDomos.contains(usuario) == false  }">
								<form action="anuncio/${ anuncio.id }/solicitar" method="POST">
									<input type="hidden" value="${ usuario.id }" name="id">
									<input class="btn btn-primary mt-3" type="submit"
										value="Enlistarse">
								</form>
							</c:if>
						</div>
						<div class="card-footer text-body-secondary">Fecha Limite:
							${ anuncio.fechaLimite }</div>
					</div>
				</div>
				<%-- 			<h4>${reparaciones.titulo}</h4>
			<p>${reparaciones.descripcion}</p>
			<p>Fecha Límite: ${reparaciones.fechaLimite}</p>
			<p>Precio: ${ reparaciones.precio }</p>
			<c:if
				test="${ usuario.domo == true && reparaciones.listaDomos.contains(usuario) == false}">
				<form action="anuncio/${ reparaciones.id }/solicitar" method="POST">
					<input type="hidden" value="${ usuario.id }" name="id"> <input
						type="submit" value="Enlistarse">
				</form>
			</c:if>
 --%>
			</c:forEach>
			<c:if test="${ usuario.domo == false}">
				<a href="crearAnuncio">Crear mi anuncio</a>
			</c:if>
		</div>
	</div>
	<section id="footer">
		<h3>Domos</h3>
		<div id="ftr">
			<div>
				<h4>Navegación del Sitio</h4>
				<ul>
					<a href="#"><li>Inicio</li></a>
					<a href="#"><li>Servicios</li></a>

				</ul>
			</div>
			<div>
				<h4>Privacidad y Términos</h4>
				<ul>
					<a href="#"><li>Términos de uso</li></a>
					<a href="#"><li>Política de Privacidad</li></a>
				</ul>
			</div>
			<div>
				<h4>Contactos</h4>
				<ul>
					<li>DomosLtda@domos.cl</li>
					<li>+56912345678</li>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>