<%-- 
    Document   : control
    Created on : 30-jul-2014, 14:46:45
    Author     : inmaculada.garcia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ejercicios Tags</title>
    </head>
    <body>
        <h1>Etiquetas de Control</h1>
        <p>
            Resultado de la prueba de <strong>if, else, elseif</strong>:<br/>            
            <s:if test="%{false}">
                Este mensaje no se verá
            </s:if>
            <s:elseif test="%{true}">
                Este mensaje sí se verá
            </s:elseif>
            <s:else>
                Este mensaje tampoco se verá
            </s:else>
        </p>
    </body>
</html>
