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
            <a href="/login">Iniciar Sesión</a>
            <a href="/registro">Registro</a>
        </nav>
    </header>  
     <!-- menu -->
   <div class="contenido">
    <h1>Tramites</h1>
    <c:forEach items="${tramites}" var="tramites">
       
        <h4>${tramites.titulo}</h4>
        <p>${tramites.descripcion}</p>
        <p>Fecha Límite: ${tramites.fechaLimite}</p>
        <p>Precio: ${ tramites.precio }</p>
        <c:if test="${ usuario.domo == true && tramites.listaDomos.contains(usuario) == false}">
		   <form action="anuncio/${ tramites.id }/solicitar" method="POST">
			   <input type="hidden" value="${ usuario.id }" name="id">
			   <input type="submit" value="Enlistarse">	
		   </form> 
        </c:if>
    </c:forEach>
    <c:if test="${ usuario.domo == false}">
   		<a href="crearAnuncio">Crear mi anuncio</a>
    </c:if>
	</div>
	
	
   <div class="contenido">
	   <h1>Cuidados</h1>
		<h2>Cuidado Adulto Mayor</h2>
		<c:forEach items="${cuidadoAdulto}" var="cuidadoAdulto">
			
			<h4>${cuidadoAdulto.titulo}</h4>
			<p>${cuidadoAdulto.descripcion}</p>
			<p>Fecha Límite: ${cuidadoAdulto.fechaLimite}</p>
			<p>Precio: ${ cuidadoAdulto.precio }</p>
			<c:if test="${ usuario.domo == true && cuidados.listaDomos.contains(usuario) == false}">
			   <form action="anuncio/${ cuidados.id }/solicitar" method="POST">
				   <input type="hidden" value="${ usuario.id }" name="id">
				   <input type="submit" value="Enlistarse">	
			   </form> 
			</c:if>
		</c:forEach>
	   <h2>Mascotas</h2>
		<c:forEach items="${mascotas}" var="mascotas">
		   
			<h4>${mascotas.titulo}</h4>
			<p>${mascotas.descripcion}</p>
			<p>Fecha Límite: ${mascotas.fechaLimite}</p>
			<p>Precio: ${ mascotas.precio }</p>
			<c:if test="${ usuario.domo == true && mascotas.listaDomos.contains(usuario) == false}">
			   <form action="anuncio/${ mascotas.id }/solicitar" method="POST">
				   <input type="hidden" value="${ usuario.id }" name="id">
				   <input type="submit" value="Enlistarse">	
			   </form> 
			</c:if>
		</c:forEach>
	   <h2>Cuidados Niños</h2>
		<c:forEach items="${cuidadoNino}" var="cuidadoNino">
		   
			<h4>${cuidadoNino.titulo}</h4>
			<p>${cuidadoNino.descripcion}</p>
			<p>Fecha Límite: ${cuidadoNino.fechaLimite}</p>
			<p>Precio: ${ cuidadoNino.precio }</p>
			<c:if test="${ usuario.domo == true && cuidadoNino.listaDomos.contains(usuario) == false}">
			   <form action="anuncio/${ cuidadoNino.id }/solicitar" method="POST">
				   <input type="hidden" value="${ usuario.id }" name="id">
				   <input type="submit" value="Enlistarse">	
			   </form> 
			</c:if>
		</c:forEach>
		<c:if test="${ usuario.domo == false}">
			   <a href="crearAnuncio">Crear mi anuncio</a>
		</c:if>
	</div>
           
   
   <div class="contenido">
    <h1>Reparaciones</h1>
    <c:forEach items="${reparaciones}" var="reparaciones">
       
        <h4>${reparaciones.titulo}</h4>
        <p>${reparaciones.descripcion}</p>
        <p>Fecha Límite: ${reparaciones.fechaLimite}</p>
        <p>Precio: ${ reparaciones.precio }</p>
        <c:if test="${ usuario.domo == true && reparaciones.listaDomos.contains(usuario) == false}">
		   <form action="anuncio/${ reparaciones.id }/solicitar" method="POST">
			   <input type="hidden" value="${ usuario.id }" name="id">
			   <input type="submit" value="Enlistarse">	
		   </form> 
        </c:if>
    </c:forEach>
    <c:if test="${ usuario.domo == false}">
   		<a href="crearAnuncio">Crear mi anuncio</a>
    </c:if>
	</div>
</body>
</html>