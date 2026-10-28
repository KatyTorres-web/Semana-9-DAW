<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String nombreSesion =
        (String) session.getAttribute("nombre");

    if (nombreSesion == null) {
        nombreSesion = "No hay nombre en la sesion";
    }

    String nombreSeguro = nombreSesion
        .replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace("\"", "&quot;")
        .replace("'", "&#39;");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Verificar sesión</title>
</head>
<body>
    <h2>Datos de la sesión</h2>
    <p>Nombre: <%= nombreSeguro %></p>
    <a href="index.jsp">Volver</a>
</body>
</html>
