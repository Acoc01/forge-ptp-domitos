<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <h2>Regístrate</h2>
                <form:form method="POST" action="/registro" modelAttribute="nuevoUsuario">
                	<div>
                		<form:label path="nombre">Nombre</form:label>
                		<form:input path="nombre"/>
                		<form:errors path="nombre"></form:errors>
                	</div>
                	<div>
                		<form:label path="apellido">Apellido</form:label>
                		<form:input path="apellido"/>
                		<form:errors path="apellido"></form:errors>
                	</div>
                	<div>
                		<form:label path="email">E-mail</form:label>
                		<form:input path="email"/>
                		<form:errors path="email"></form:errors>
                	</div>
                	<div>
                		<form:label path="contrasena">Contraseña</form:label>
                		<form:password path="contrasena"/>
                		<form:errors path="contrasena"></form:errors>
                	</div>
                	<div>
                		<form:label path="confirmacion">Confirmación</form:label>
                		<form:password path="confirmacion"/>
                		<form:errors path="confirmacion"></form:errors>
                	</div>
                	<div>
                		<input type="checkbox" name="domo" value="True" id="domoCheck" onClick="isDomo()">
                		<label for="domoCheck">Quiero ser un domo</label>
                		<input type="checkbox" name="domo" value="False" id="userCheck" onClick="isUser()">
                		<label for="userCheck">Quiero ser un usuario</label>
                	</div>
                	<!--<form:hidden path="domo" value="False"/>-->
                	<input type="submit" value="Registrarme"/>
                </form:form>
            </div>
            <div>
            	<h2>Inicia Sesión</h2>
            	<p>${error_login}</p>
            	<form action="/login" method="POST">
            		<div>
            			<label>E-mail</label>
            			<input type="email" name="email"/>
            		</div>
            		<div>
            			<label>Contraseña</label>
            			<input type="password" name="contrasena"/>
            		</div>
            		<input type="submit" value="Iniciar Sesión">
            	</form>
            </div>
        </div>
    </div>
</body>
<script>
	function isUser(){
		let cb = document.getElementById("domoCheck");
		let cb2 = document.getElementById("userCheck");
		if(cb2.checked == true && cb.checked == true){
			cb.checked=false;
		}
	}
	function isDomo(){
		let cb = document.getElementById("domoCheck");
		let cb2 = document.getElementById("userCheck");
		if(cb.checked == true && cb2.checked == true){
			cb2.checked = false;
		}	
	}
</script>
</html>