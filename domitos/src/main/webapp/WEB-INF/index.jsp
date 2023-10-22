<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DOMITOS</title>
</head>
<body>
	<div>
		<div>
			<div>
				<h2>Reg�strate</h2>
				<form:form method="POST" action="/registro"
					modelAttribute="nuevoUsuario">
					<div>
						<form:label path="nombre">Nombre</form:label>
						<form:input path="nombre" />
						<form:errors path="nombre"></form:errors>
					</div>
					<div>
						<form:label path="apellido">Apellido</form:label>
						<form:input path="apellido" />
						<form:errors path="apellido"></form:errors>
					</div>
					<div>
						<form:label path="email">E-mail</form:label>
						<form:input path="email" />
						<form:errors path="email"></form:errors>
					</div>
					<div>
						<form:label path="contrasena">Contrase�a</form:label>
						<form:password path="contrasena" />
						<form:errors path="contrasena"></form:errors>
					</div>
					<div>
						<form:label path="confirmacion">Confirmaci�n</form:label>
						<form:password path="confirmacion" />
						<form:errors path="confirmacion"></form:errors>
					</div>
					<div>
						<input class="" type="checkbox" value="True" id="flexCheckDefault"
							name="domo"> <label class="" for="flexCheckDefault">
							Quiero ser un domo </label>
					</div>


					<form:hidden path="domo" value="False" />
					<input type="submit" value="Registrarme" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>