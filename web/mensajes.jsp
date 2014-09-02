<%-- 
    Document   : mensajes
    Created on : 02-sep-2014, 15:22:16
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
        <h1>Etiquetas UI de no formulario</h1>
        <p>
            Etiqueta <strong>actionmessage</strong>:<br/>
            Mostrará un mensaje establecido previamente en el Action. La etiqueta
            informará de cualquier mensaje que NO sea de error.<br/>
            <s:actionmessage/>
        </p>
        <p>
            Etiqueta <strong>actionerror</strong>:<br/>
            Mostrará los mensajes de error que hayamos agregado en el Action.<br/>
            <s:actionerror/>
        </p>
        <p>
            Etiqueta <strong>fielderror</strong>:<br/>
            Mostrará los mensajes que ocurran al haber un error cuando se rellenan
            los campos de un formulario.<br/>
            <!-- Se pone la etiqueta antes del formulario para que se sitúen 
                los errores en un grupo antes que el formulario. Para que cada error
                aparezca junto al campo que representa, se pone dentro del formulario
                y haciendo uso del atributo fieldName-->
            <s:fielderror/>
            <s:form action="mensajes.action">
                <s:label value="Nombre" for="nombre"/>
                <s:textfield name="nombre" id="nombre"/>
                <s:fielderror fieldName="nombre"/><br/>
                <s:label value="Password" for="password"/>
                <s:password name="password" id="password"/>
                <s:fielderror fieldName="password"/><br/>
                <s:label value="Correo" for="correo"/>
                <s:textfield name="correo" id="correo"/>
                <s:fielderror fieldName="correo"/>
                <s:submit value="Enviar"/>
            </s:form>
                <!-- Para agrupar los errores, se usa fieldset-->
        <fieldset>
            <legend>Nombre y correo</legend>
            <s:fielderror>
                <s:param>nombre</s:param>
                <s:param>correo</s:param>
            </s:fielderror>
        </fieldset>
        <fieldset>
            <legend>Password</legend>
            <s:fielderror>
                <s:param>password</s:param>
            </s:fielderror>
        </fieldset>
            
                
                
        </p>
    </body>
</html>
