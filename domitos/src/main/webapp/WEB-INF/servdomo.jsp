<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Servicios</title>
 <link rel="stylesheet" type="text/css" href="style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
     <!-- encabezado -->
    <header>
        <h2>D'mos</h2>
        <nav>
            <a href="#">Iniciar Sesión</a>
            <a href="#">Registro</a>
        </nav>
    </header>  
     <!-- menu -->
   <div class="contenido">
    <h1>Tramites</h1>
    <c:forEach items="${tramites}" var="tramites">
       
        <h4>${tramites.titulo}</h4>
        <p>${tramites.descripcion}</p>
        <p>Fecha Límite: ${tramites.fechaLimite}</p>
        <c:if test="${ usuario.domo == true && tramites.listaDomos.contains(usuario) == false}">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  Launch demo modal
			</button>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
				  <div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Ingrese el precio a cobrar por su servicio</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				  </div>
				  <div class="modal-body">
					   <form action="anuncio/${ tramites.id }/solicitar" method="POST">
							  <label for="precio">Precio:</label>
							  <input type="text" name="precio" id="precio">
						   <input type="hidden" value="${ usuario.id }" name="id">
						   <input type="submit" value="Enlistarse">	
					   </form> 
				  </div>
				  <div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				  </div>
				</div>
			  </div>
			</div>
        </c:if>
    </c:forEach>
    <c:if test="${ usuario.domo == false}">
   		<a href="crearAnuncio">Crear mi anuncio</a>
    </c:if>
	</div>
	
	
   <div class="contenido">
   <h1>Cuidados</h1>
    <c:forEach items="${cuidados}" var="cuidados">
        
        <h4>${cuidados.titulo}</h4>
        <p>${cuidados.descripcion}</p>
        <p>Fecha Límite: ${cuidados.fechaLimite}</p>
    </c:forEach>
	</div>
           
   
   <div class="contenido">
    <h1>Reparaciones</h1>
    <c:forEach items="${reparaciones}" var="reparaciones">
       
        <h4>${reparaciones.titulo}</h4>
        <p>${reparaciones.descripcion}</p>
        <p>Fecha Límite: ${reparaciones.fechaLimite}</p>
    </c:forEach>
	</div>
    
   
   <div class="contenido">
    <h1>Cuidado Adulto Mayor</h1>
    <c:forEach items="${cuidadoAdulto}" var="cuidadoAdulto">
        
        <h4>${cuidadoAdulto.titulo}</h4>
        <p>${cuidadoAdulto.descripcion}</p>
        <p>Fecha Límite: ${cuidadoAdulto.fechaLimite}</p>
    </c:forEach>
	</div>
	
	
   <div class="contenido">
   <h1>Cuidados Niños</h1>
    <c:forEach items="${cuidadoNino}" var="cuidadoNino">
       
        <h4>${cuidadoNino.titulo}</h4>
        <p>${cuidadoNino.descripcion}</p>
        <p>Fecha Límite: ${cuidadoNino.fechaLimite}</p>
    </c:forEach>
	</div>
	
	
   <div class="contenido">
   <h1>Mascotas</h1>
    <c:forEach items="${mascotas}" var="mascotas">
       
        <h4>${mascotas.titulo}</h4>
        <p>${mascotas.descripcion}</p>
        <p>Fecha Límite: ${mascotas.fechaLimite}</p>
    </c:forEach>
	</div>
	
</body>
</html>