<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nuevo Anuncio</title>
</head>
<body>
	 <h1>Crear Anuncio</h1>
    <form action="/guardarAnuncio" method="post">
        <label for="direccion">Dirección:</label>
        <input type="text" id="direccion" name="direccion" required><br>

        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" required><br>

        <label for="fechaLimite">Fecha Límite:</label>
        <input type="date" id="fechaLimite" name="fechaLimite" required><br>

        <label for="descripcion">Descripción:</label><br>
        <textarea id="descripcion" name="descripcion" rows="4" cols="50" required></textarea><br>
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
       	<input type="hidden" name="creadorId" value="${ usuario.id }"> 
        <input type="submit" value="Crear Anuncio">
    </form>
</body>
</html>