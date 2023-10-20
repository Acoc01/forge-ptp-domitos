<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Servicios</title>
 <link rel="stylesheet" type="text/css" href="style.css">
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
    </c:forEach>
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