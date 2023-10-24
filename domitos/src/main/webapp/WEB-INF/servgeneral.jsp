<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/servgeneral.css">
</head>
<body>
    <!-- encabezado -->
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
     <!-- menu -->
     <div class="contenedorMayor">
        <div class="contenido1">
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
	
	
   <div class="contenido2">
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
           
   
   <div class="contenido3">
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
</div>
</body>
</html>