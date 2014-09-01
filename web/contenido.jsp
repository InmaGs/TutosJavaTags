<%-- 
    Document   : contenido
    Created on : 01-sep-2014, 15:30:25
    Author     : inmaculada.garcia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ejercicios Tags</title>
    </head>
    <body>
        <h1>Contenido</h1>
        <p>
            <!-- Incluimos un parámetro que viene de datos.jsp -->
            Hola, ${param.usuario}. Bienvenido a <a href="http://javatutoriales.com">Java Tutoriales</a>
        </p>
    </body>
</html>
