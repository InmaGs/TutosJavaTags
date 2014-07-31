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
        <p>
            Resultado de la prueba de <strong>iterator</strong>:<br/>
        <table>
            <thead>
                <tr>
                    <td>Valor</td>
                    <td>Indice</td>
                    <td>Conteo</td>
                    <td>¿Es primero?</td>
                    <td>¿Es último?</td>
                    <td>¿Es par?</td>
                    <td>¿Es impar?</td>
                </tr>
            </thead>
            <tbody>
                <s:iterator begin="1" end="10" step="2" var="valorActual" status="estatus">
                    <tr>
                        <td><s:property/></td>
                        <td><s:property value="#estatus.index"/></td>
                        <td><s:property value="#estatus.count"/></td>
                        <td><s:property value="#estatus.first"/></td>
                        <td><s:property value="#estatus.last"/></td>
                        <td><s:property value="#estatus.even"/></td>
                        <td><s:property value="#estatus.odd"/></td>
                    </tr>                  
                </s:iterator>
            </tbody>
        </table>    
        </p>
    </body>
</html>
