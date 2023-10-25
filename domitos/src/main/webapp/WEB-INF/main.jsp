<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Domos</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
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
    <main>
        <section id="top">
            <div class="rectangulo">
                <p>Encuentra el Servicio
                <br>que Necesitas
                <br>Donde Quieras
                <br>Cuando Quieras</p>
                <a href="/servicios/general">Más información</a>
            </div>
        </section>
        <section id="middle">
            <h2>¿Qué necesitas?</h2>
            <div id="container-1">
                <div>
                    <a href="/crearAnuncio"><img src="/images/tramites.png" alt="imagen de servicios de tramites" />
                    Servicios de Trámites</a>
                </div>
                <div>
                    <a href="/crearAnuncio"><img src="/images/reparaciones.png" alt="imagen del servicio de reparaciones" />
                    Servicio de Reparaciones</a>
                </div>
                <div>
                    <a href="/crearAnuncio"><img src="/images/main-cuidados.png" alt="imagen de servicios de cuidados" />
                    Servicio de Cuidados</a>
                </div>
            </div>
        </section>
        <section id="down">
            <div id="izq">
                <h3 style="color: white">Servicio Excepcional, Vida Excepcional</h3>
            </div>
            <div id="der">
                <h3>Transforma tu pasión por el servicio en una carrera de Excelencia</h3>
                <a href="/registrarme">Sé un Domo</a>
            </div>

        </section>

    </main>

    <section id="footer">
        <h3>Domos</h3>
        <div id="ftr">
            <div>
                <h4>Navegación del Sitio</h4>
                <ul>
                    <a href="#">
                        <li>Inicio</li>
                    </a>
                    <a href="#">
                        <li>Servicios</li>
                    </a>

                </ul>
            </div>
            <div>
                <h4>Privacidad y Términos</h4>
                <ul>
                    <a href="#">
                        <li>Términos de uso</li>
                    </a>
                    <a href="#">
                        <li>Política de Privacidad</li>
                    </a>
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

</html>