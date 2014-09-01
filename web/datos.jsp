<%-- 
    Document   : datos
    Created on : 01-sep-2014, 9:40:10
    Author     : inmaculada.garcia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ejercicios Tags</title>
    </head>
    <body>
        <h1>Etiquetas de Datos</h1>
        
        <p>
            Etiqueta <strong>a</strong>:<br/>
            <!-- Genera un hipervínculo hacia alguna url interna o externa -->
            <s:a href="control.jsp">Hipervínculo con href</s:a><br/>
            <s:a action="control">Hipervínculo con action</s:a><br/><br/>
            Se añaden parámetros a las direcciones (para comprobar, ver la barra de direcciones):<br/>
            <s:a href="control.jsp?param1=%{'abc'}&param2=%{'123'}">Hipervínculo con href
            </s:a><br/>
            <s:a action="control">Hipervínculo con action
                <s:param name="param1" value="%{'abc'}"/>
                <s:param name="param2" value="%{'123'}"/>
            </s:a><br/><br/> 
            <!--A continuación, sólo se trabaja con action, ya que los siguientes
                atributos aplicados no funcionan para href-->
            Asignación de valores a parámetos (escribir los parámetros en la barra de direeciones):<br/>
            <s:a action="control" includeParams="get">Action con parámetros</s:a><br/><br/>
            Enlace con protocolo, host y puerto:<br/>
            <s:a action="control" forceAddSchemeHostAndPort="true">Action con protocolo</s:a>
            <!-- Otros atributos de a, son: Namespace, para especificar el espacio en el que se encuentra el 
            action. Method, para especificar la ejecución de un método en concreto -->            
         </p>
         <p>
             Etiqueta <strong>url</strong>:<br/>
             <!-- Para crear una url. Sus atributos son similares a los de a -->
             <!-- Creamos un enlace a una imágen, guardada en una carpeta llamada img 
                dentro del proyecto, pero fuera de la carpeta web-inf. La etiqueta de Struts que genera
                la url debe ser incluída dentro de la que genera la imágen.-->
             Insertar una imágen: <br/>
             <img src="
             <s:url value="/img/homer.png" />" alt="Homer"/>
             <!-- Si ponemos simplemente <s:url value="/img/homer.png"/> aparece la ruta en la
                pantalla --> <br/>
             Enlace a google:<br/>
             <s:url value="https://www.google.es" var="enlace">
                 <!-- El atributo var (variable) asigna un 'nombre' a la url, para poder colocarla 
                    luego en un enlace -->
                 <!-- Se añade un parámetro que permite la búsqueda en la propia página de google -->
                 <s:param name="q" value="'Java+tutoriales'"/>
             </s:url>
             <!-- Generamos ahora el enlace a google, usando a: -->
             <s:a value="%{enlace}">Búsqueda en Google</s:a>             
         </p>
         <p>
             Etiqueta <strong>Action</strong>:<br/>
             <!-- Invoca al método execute y permite ejecutar el Action dentro de una página jsp.
                El resutl del Action se ignorará a no ser que se indique lo contrario.-->    
             Comprobación de una variable, que dará null o no según se ejecute un Action:<br/>
         <s:action name="control" namespace="/" var="controlAction">
             <!-- Se le asigna una variable para poder referenciarlo posteriormente -->
             <!-- Para comprobar el resultado del Action, colocamos etiquetas dentro 
                y fuera de la etiqueta action si la variable controlAction es nula o no-->
             Dentro de la etiqueta Action: <s:property value="#controlAction == null" />             <br/> 
             <!--Asignamos un valor a un parámetro: -->
                 <s:param name="parametro" value="%{'abc123'}"/>
         </s:action>
             Fuera de la etiqueta Action: <s:property value="#controlAction == null"/><br/><br/>
                 <!-- Obtenemos el valor del parámetro -->
             Valor del Parámetro: <s:property value="#controlAction.parametro"/><br/>
             <!-- De este modo se puede acceder a cualquier parámetro del Action. -->
             Lista de Usuarios: <s:property value="#controlAction.usuarios"/><br/>
             <!-- Se puede agregar estos valores a otras etiquetas: -->
             Lista de Usuarios con iterador:
             <s:iterator value="#controlAction.usuarios">
                 <s:property value="nombre"/>
             </s:iterator>
             
         </p>
        
    </body>
</html>
