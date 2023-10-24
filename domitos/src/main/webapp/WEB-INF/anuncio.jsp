<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Nuevo Anuncio</title>
            <link rel="stylesheet" type="text/css" href="css/creaServicio.css">
        </head>

        <body>
            <header>
                <h1>Domos</h1>
            </header>
            <main>
                <h1>Crear Anuncio</h1>
                <form action="/guardarAnuncio" method="post">
                    <div>
                        <label for="direccion">Dirección:</label>
                        <input type="text" id="direccion" name="direccion" required><br>
                    </div>
                    <div>
                        <label for="titulo">Título:</label>
                        <input type="text" id="titulo" name="titulo" required><br>
                    </div>
                    <div>
                        <label for="fechaLimite">Fecha Límite:</label>
                        <input type="date" id="fechaLimite" name="fechaLimite" required><br>
                    </div>
                    <div>
                        <label for="descripcion">Descripción:</label><br>
                        <textarea id="descripcion" name="descripcion" rows="6" cols="40" required></textarea><br>
                    </div>
                    <div>
                        <label for="precio">Precio:</label>
                        <input id="precio" name="precio" type="text">
                    </div>
                    <div>
                        <label>Clasificacion</label>
                        <select name="clasificacion" class="form-select">
                            <c:forEach items="${clasificaciones}" var="clasificacion">
                                <option value="${clasificacion}">${clasificacion}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="btn">
                        <input type="hidden" name="creadorId" value="${usuario.id }">
                        <input type="submit" value="Crear Anuncio">
                    </div>
                </form>
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