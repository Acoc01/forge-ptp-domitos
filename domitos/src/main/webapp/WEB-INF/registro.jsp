<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/servgeneral.css">
    <link rel="stylesheet" type="text/css" href="/css/main.css">
    <style>
        nav {
    width: 100vw;
    height: 13%; 
    background-color: black;
    display: flex;
    color:white;
    padding-right: 2%;
    }
    nav .titulo{
        margin-right: 63%;
        margin-left: 2%;
        color: #FFF;
        background-color: black;
        font-family: Roboto Slab;
        font-size: 64px;
        font-style: normal;
        font-weight: 700;
        line-height: normal;
    }
    nav .botones{
        display: flex;
        align-items: end;
        margin: 1% 2% 2% 0%;
        font-size: 25px;
        background-color: black;
        color: white;

    }
        body {
            background-image: url('pexels-martin-p�chy-2844474.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            display: flex;
            flex-direction: column;
            align-items: center; 
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 25%;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            padding: 15px;
        }
    #footer {
	border: 2px solid rgba(0, 0, 0, 0.54);
    background: rgba(255, 0, 0, 0.40);
    color: rgba(0, 0, 0, 0.50);
    padding-left: 5%;
	width: 100vw;
	}


	#footer h3{
	font-family: Roboto;
	font-size: 40px;
	font-weight: 600;
	font-style: italic;
	padding: 20px;

	}

	#ftr{
		display: flex;
		flex-direction: row

	}
	#ftr div{
		width: 25%;
		padding: 20px;
	}
	#ftr h4{
		font-family: Inter;
		font-size: 25px;
		font-weight: bold;
	padding: 1%;

	}
	#ftr ul li, #ftr ul a{
		list-style-type: none;
	font-family: Inter;
	font-size: 20px;
	text-decoration: none;
	color: rgba(0, 0, 0, 0.50);
	}
        .form-group {
            margin-bottom: 20px;
        }
        .center-button { 
            text-align: center;
        }
    </style>
</head>
<body class="bg-white">
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
    <br><br>
    <div class="container rounded-3 bg-light shadow">
        <h2>Formulario de Registro</h2>
                <form:form method="POST" action="/registro" modelAttribute="nuevoUsuario">
                	<div class="form-group">
                		<form:label path="nombre">Nombre</form:label>
                		<form:input path="nombre" class="form-control"/>
                		<form:errors path="nombre"></form:errors>
                	</div>
                	<div class="form-group">
                		<form:label path="apellido">Apellido</form:label>
                		<form:input path="apellido" class="form-control"/>
                		<form:errors path="apellido"></form:errors>
                	</div>
                	<div class="form-group">
                		<form:label path="email">E-mail</form:label>
                		<form:input path="email" class="form-control"/>
                		<form:errors path="email"></form:errors>
                	</div>
                	<div class="form-group">
                		<form:label path="contrasena">Contrase�a</form:label>
                		<form:password path="contrasena" class="form-control"/>
                		<form:errors path="contrasena"></form:errors>
                	</div>
                	<div class="form-group">
                		<form:label path="confirmacion">Confirmacion</form:label>
                		<form:password path="confirmacion" class="form-control"/>
                		<form:errors path="confirmacion"></form:errors>
                	</div>
                	<div class="form-group d-flex justify-content-around" role="group" aria-label="">
                		<input class="btn-check" type="checkbox" name="domo" value="True" id="domoCheck" onClick="isDomo()">
                		<label class="btn btn-outline-primary" for="domoCheck">Quiero ser un domo</label>
                		<input class="ml-3 btn-check" type="checkbox" name="domo" value="False" id="userCheck" onClick="isUser()">
                		<label class="btn btn-outline-primary" for="userCheck">Quiero ser un usuario</label>
                	</div>
                	<!--<form:hidden path="domo" value="False"/>-->
					<div class="d-flex justify-content-center">
						<input type="submit" class="btn bg-light border border-2 btn-1 mt-3 mb-3" value="Registrarme" />
					</div>
                </form:form>
    </div>
    <br><br><br>
    
    <section id="footer">
        <h3>Domos</h3>
        <div id="ftr">
           <div>
            <h4>Navegaci�n del Sitio</h4>
            <ul>
                <a href="#"><li>Inicio</li></a>
                <a href="#"><li>Servicios</li></a>
                
            </ul>
           </div>
           <div>
            <h4>Privacidad y T�rminos</h4>
            <ul>
                <a href="#"><li>T�rminos de uso</li></a>
                <a href="#"><li>Pol�tica de Privacidad</li></a>
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
