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
    
    </div>

        <div class="contenedor_servicios">
            <div class="box1">
                <div class="izquierda">
                    <ul>
                        <li><a href="https://www.youtube.com/watch?v=BV2FfL32mAk&ab_channel=EladioCarrion-Topic"><img src="/images/timbre.png" alt="timbre"></a><button class="timbres" onclick="location.href='https://www.youtube.com/watch?v=2LegcNVM_nM&ab_channel=TravisScottVEVO'">Tramites</button></li>
                        <li><a href="https://www.youtube.com/watch?v=BV2FfL32mAk&ab_channel=EladioCarrion-Topic"><img src="/images/timbre.png" alt="timbre"></a><button class="timbres" onclick="location.href='https://www.youtube.com/watch?v=2LegcNVM_nM&ab_channel=TravisScottVEVO'">Cuidados</button></li>
                        <li><a href="https://www.youtube.com/watch?v=BV2FfL32mAk&ab_channel=EladioCarrion-Topic"><img src="/images/timbre.png" alt="timbre"></a><button class="timbres" onclick="location.href='https://www.youtube.com/watch?v=2LegcNVM_nM&ab_channel=TravisScottVEVO'">Reparaciones</button></li>
                    </ul>
                </div>
                
                <div class="revision">
                    <h2>¡Tramites!</h2>
                    <p><u>Revisión tecnica</u></p>
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
                    <div class="niños">
                <p><u>Niños</u></p>
                	<c:if test="${ usuarioEnSesion != null }">
						<a href="/crearAnuncio">
							<img src="/images/niños.png" alt="niños"></a>
                	</c:if>
                	<c:if test="${ usuarioEnSesion == null }">
						<a href="/login">
							<img src="/images/niños.png" alt="niños"></a>
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
            <div class="box3">
                <div class="electrico">
                <h2>Reparaciones</h2>
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