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
    

		<h1 class="text-center" style="font-size: 50px">�Qu� servicio necesitas?</h1>
        <div class="contenedor_servicios">
           <section id="caja1">
            <div class="box1">
                <div class="izquierda">
                    <ul>
                        <li><a href="http://localhost:8080/servicios/general#caja1"><img src="/images/timbre.png" alt="timbre"></a><button class="timbres" onclick="http://localhost:8080/servicios/general#caja1">Tramites</button></li>
                        <li><a href="http://localhost:8080/servicios/general#caja2"><img src="/images/timbre.png" alt="timbre"></a><button class="timbres" onclick="http://localhost:8080/servicios/general#caja2">Cuidados</button></li>
                        <li><a href="http://localhost:8080/servicios/general#caja3"><img src="/images/timbre.png" alt="timbre"></a><button class="timbres" onclick="http://localhost:8080/servicios/general#caja3">Arreglos</button></li>
                    </ul>
                </div>
                
                <div class="revision">
                    <h2>Tramites</h2>
                    <p><u>Revisi�n tecnica</u></p>
                    <c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
							<img src="/images/tramites.png" alt="revisiontecnica">
						 </a>
                    </c:if>
                    <c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
							<img src="/images/tramites.png" alt="revisiontecnica">
						 </a>
                    </c:if>
                </div>
                <div class="filas">
                    <p><u>Hacer filas</u></p>
                    <c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
							<img src="/images/filas.png" alt="hacerfilas">
						</a>
                    </c:if>
                    <c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
							<img src="/images/filas.png" alt="hacerfilas">
						</a>
                    </c:if>

                </div>    
            </div>
            </section>
            <section id="caja2">
            <div class="box2">
                <div class="adultos">
                <h2>Cuidados</h2>
                <p><u>Adultos Mayores</u></p>
                	<c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
							<img src="/images/adulto.png" alt="adultomayor">
						</a>
                	</c:if>
                	<c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
							<img src="/images/adulto.png" alt="adultomayor">
						</a>
                	</c:if>
                </div>
                    <div class="ninos">
                <p><u>Ni�os</u></p>
                	<c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
							<img src="/images/ni�os.png" alt="ni�os"></a>
                	</c:if>
                	<c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
							<img src="/images/ni�os.png" alt="ni�os"></a>
                	</c:if>
                    </div>
                    <div class="mascotas">
                <p><u>Mascotas</u></p>
                	<c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
							<img src="/images/mascotas.png" alt="mascotas"></a>
                	</c:if>
                	<c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
							<img src="/images/mascotas.png" alt="mascotas"></a>
                	</c:if>
                    </div>
            </div>
            </section>
            <section id="caja3">
            <div class="box3">
                <div class="electrico">
                <h2>Arreglos</h2>
                <p><u>Casa</u></p>
                	<c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
							<img src="/images/reparocasa.png" alt="electrico"></a>
                	</c:if>
                	<c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
							<img src="/images/reparocasa.png" alt="electrico"></a>
                	</c:if>
            </div>
                <div class="gasfiter">          
                <p><u>Muebles</u></p>
                	<c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
							<img src="/images/reparomuebles.png" alt="gasfiter"></a>
                	</c:if>
                	<c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
							<img src="/images/reparomuebles.png" alt="gasfiter"></a>
                	</c:if>
                        </div>
                        <div class="mecanico">
                <p><u>Mecanico</u></p>
                	<c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
								<img src="/images/mecanico.png" alt="mecanico"></a>
                	</c:if>
                	<c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
								<img src="/images/mecanico.png" alt="mecanico"></a>
                	</c:if>
                        </div>
            </div>
            </section>
        
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
    </div>
</section>
</div>
</body>
</html>