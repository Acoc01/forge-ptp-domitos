<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/reset-pwd.js" defer></script>
<link href="/css/login.css" rel="stylesheet">
<link href="/css/servgeneral.css" rel="stylesheet">
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
	</c:if>
</nav>
<main class="h-full position-relative align-items-center">
	<section class="container rounded-3 shadow w-25 bg-light position-absolute top-50 start-50 translate-middle">
		<div class="row border-bottom m-3 text-center">
			<h3>Recuperar Contraseña</h3>
		</div>
		<div class="row">
			<div class="col	">
				<form action="/reiniciar_password" method="post">
				    <input type="hidden" name="_method" value="PATCH">
					<div>
						<label for="password" class="form-label text-body-black">Contraseña</label>
						<input id="password" type="password" class="form-control" name="password" />
					</div>
					<div>
						<label for="confirmacion" class="form-label text-body-black">Confirmacion</label>
						<input id="confirmacion" type="password" class="form-control" name="confirmacion" oninput="checkPasswordMatch(this);"/>
					</div>
					<input type="hidden" name="token" value="${ token }"/>
					<div class="d-flex justify-content-center">
						<input type="submit" class="btn bg-light border border-2 btn-1 mt-3 mb-3" value="Cambiar" />
					</div>
				</form>
			</div>	
		</div>
	</section>
</main>

</body>
</html>
