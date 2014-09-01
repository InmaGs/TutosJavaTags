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
             Valor del Parámetro: <s:property value="#controlAction.parametro"/><br/><br/>
             <!-- De este modo se puede acceder a cualquier parámetro del Action. -->
             Lista de Usuarios: <s:property value="#controlAction.usuarios"/><br/><br/>
             <!-- Se puede agregar estos valores a otras etiquetas: -->
             Lista de Usuarios con iterador:
             <s:iterator value="#controlAction.usuarios">
                 <s:property value="nombre"/>
             </s:iterator><br/>             
         </p>
         <p>
             Etiqueta <strong>bean</strong>:<br/>
             <!-- Instancia en el jsp una clase que siga la especificación JavaBeans. 
                Notar que este bean no se coloca en la cima del stack, por lo que para hacer 
                referencia al bean se debe usar el nombre completo que se asigne junto con #-->
             <!-- Para el ejemplo usamos la clase usuario: -->
             <s:bean name="com.javatutoriales.struts2.tags.modelo.Usuario" var="beanUsuario">
                 <!-- Con el atributo var, le asignamos un nombre a la variable con
                    el que poder instanciar posteriormente.-->
                 <!-- Establecemos unos valores de parámetros: -->
                 <s:param name="nombre" value="%{'Inma'}"/>
                 <s:param name="edad" value="%{'31'}"/>
             </s:bean>
                 <!-- Obtenemos los valores de los parámetros del bean -->
                 Nombre: <s:property value="#beanUsuario.nombre"/><br/>
                 Edad: <s:property value="#beanUsuario.edad"/><br/>
         </p>
         <p>
             Etiqueta <strong>date</strong>:<br/>
             <!-- Permite formatear los objetos de fecha de diferentes maneras -->
             <!-- Invocamos el método que obtiene las fechas actual y futura 
                establecidas en la clase Fechas -->
             
             <s:date name="new com.javatutoriales.struts2.tags.util.Fechas().getFechaActual()" nice="true"/><br/>
             <s:date name="new com.javatutoriales.struts2.tags.util.Fechas().getFechaFutura()" nice="true"/>
             <!-- Con el atributo format le damos formato a la fecha, por ejemplo: format="dd/MM/YYYY, HH:mm" -->
             <!-- El atributo nice pone de forma 'bonita' la fecha. Se hace en el idioma y texto por defecto.
                Para cambiar estas propiedades preestablecidas se hace uso del mecanismo de internacionalización
                de i18n, creando un 'property file' llamado 'struts-mensajes'. Luego, hay que añadir la
                propiedad correspondiente al archivo web.xml-->
         </p>
         <p>
             Etiquetas <strong>i18n</strong> y <strong>text</strong>:<br/>
             <!-- La etiqueta i18n permite acceder a los mensajes del archivo de propiedades 
                donde se colocan las llaves y textos que representan. La etiqueta text convertirá
                a texto estos valores. Para mostrar el ejemplo, creamos un package con un archivo de
                propiedades con los textos.-->
             <!-- En la etiqueta i18n indicamos la ruta del archivo de propiedades: -->
             <s:i18n name="com/javatutoriales/struts2/tags/textos/textos">
                 <!-- Indicamos el texto que queremos mostrar -->
                 <s:text name="instrucciones"/>
                 <s:form>
                     <s:label value="%{getText('etiqueta')}"/>
                     <!-- Otra forma de hacer lo mismo es por medio del atributo key:
                     <s:label key="etiqueta"/> y <s:submit key="boton"/> -->
                     <s:textfield/>
                     <s:submit value="%{getText('boton')}"/>
                 </s:form>
             </s:i18n>
         </p>
         <p>
             Etiqueta <strong>include</strong>: <br/>
             <!-- Permite agregar la salida de un server (Servlet o JSP) en la página
                actual. Útil para contenido que se repite en varias páginas o para agrupar
                el contenido de varias en una sola.-->
             <!-- Agregaremos a esta página el contenido de la página contenido.jsp, 
                incluyendo un parámetro-->
             <s:include value="contenido.jsp">
                 <s:param name="usuario" value="'Inma'"/>
             </s:include>
         </p>
         <p>
             Etiqueta <strong>param</strong>: <br/>
             <!-- Es la etiqueta que se ha estado usando para parametrizar el 
                resto de etiquetas-->
             Esta etiqueta no tiene uso independiente de las otras etiquetas. 
             No puede mostrarse ningún ejemplo en concreto.
         </p>
         <p>
             Etiqueta <strong>property</strong>: <br/>
             <!-- Se usa para especificar las propiedades de un objeto, el cual se espera 
                que está en la cima de la pila.-->
             Esta etiqueta no tiene uso independiente de las otras etiquetas. 
             No puede mostrarse ningún ejemplo en concreto.             
         </p>
         <p>
             Etiqueta <strong>push</strong>: <br/>
             <!-- Su utilidad reside en colocar momentaneamente un objeto en la cima
                del stack. Cuando la etiqueta se cierre, el objeto se quitará de la cima-->
             <!-- Creamo un bean, que da un objeto que se pondrá en el stack -->
             <s:bean name="com.javatutoriales.struts2.tags.modelo.Usuario" var="usuario">
                 <s:param name="nombre" value="'Inmacu'"/>
                 <s:param name="edad" value="32"/>                 
             </s:bean>
             <!-- Comprobamos lo que se encuentra en la cima del stack -->
             Lo que hay en la cima es: <s:property/><br/>
             <!-- Colocamos el bean usuario en la cima: -->
             <s:push value="usuario">
                 <!-- Comprobamos que está en la cima: -->
                 En la cima ahora está: <s:property/><br/>
                 <!-- y obtenemos sus propiedades: -->
                 Propiedades:<br/>
                 Nombre: <s:property value="nombre"/><br/>
                 Edad: <s:property value="edad"/><br/>
             </s:push>
             <!-- Comprobamos nuevamente que usuario ya no está en la cima del stack: -->
             <s:property/>
         </p>
             
        
    </body>
</html>
