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
            background-image: url('pexels-martin-péchy-2844474.jpg');
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
    background: rgba(150, 0, 0, 0.95);
    color: rgba(0, 0, 0, 0.50);
    padding-left: 5%;
	width: 100%
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
        <h2>Crea tu Anuncio</h2>
				<form action="/guardarAnuncio" method="post">
					<div class="form-group">
						<label for="direccion">Dirección:</label>
						<input class="form-control" type="text" id="direccion" name="direccion" required><br>
					</div>

					<div class="form-goup">
						<label for="titulo">Título:</label>
						<input class="form-control" type="text" id="titulo" name="titulo" required><br>
					</div>

					<div class="form-group">
						<label for="fechaLimite">Fecha Límite:</label>
						<input class="form-control" type="date" id="fechaLimite" name="fechaLimite" required><br>
					</div>
					
					<div class="form-group">
						<label for="descripcion">Descripción:</label><br>
						<textarea class="form-control" id="descripcion" name="descripcion" rows="4" cols="50" required></textarea><br>
					</div>

					<div class="form-group">
						<label for="precio">Precio:</label>
						<input class="form-control" id="precio" name="precio" type="text">
					</div>
					<div class="form-group">
					   <label>Clasificacion</label>
					   <select name="clasificacion" class="form-select">
							  <c:forEach items="${clasificaciones}" var="clasificacion">
								   <option value="${clasificacion}">${clasificacion}</option>
							  </c:forEach>
					   </select>
					</div>
					<input type="hidden" name="creadorId" value="${ usuario.id }"> 
					<input class="btn bg-light border border-2 btn-1 mt-3 mb-3 "type="submit" value="Crear Anuncio">
				</form>
    </div>
    <br><br><br>
    
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
