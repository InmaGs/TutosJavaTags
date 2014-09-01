<%-- 
    Document   : newjsp
    Created on : 01-sep-2014, 16:40:09
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
        <h1>Etiquetas de Formulario</h1>
        <p>
            Etiqueta <strong>form</strong>:<br/>
            Es la etiqueta que engloba a todas las demás. No funciona por sí sola, por
            lo que no se puede mostrar un ejemplo, pero sin esta, las demás no funcionan bien.
        </p>
        <p>
            Etiqueta <strong>label</strong>:<br/>
            Coloca un texto que identifica a un elemento del formulario. Al hacer click sobre
            una etiqueta se suele hacer click sobre el elemento con el que está relacionado.
            Para indicar la relación se usa el atributo 'for'.<br/>
            Esta etiqueta no tiene ejemplo, ya que se necesita otro elemento más para que
            tenga sentido.
        </p>
        <p>
            Etiqueta <strong>head</strong>:<br/>
            Agrega elementos para funcionamiento y apariencia visual en el encabezado
            de la página. Agregará tanto scripts como hojas de estilo. <br/>
            No se ve ningún ejemplo de este tag.
        </p>
        <p>
            Etiqueta <strong>file</strong>:<br/>
            Muestra un componente para cargar un archivo al servidor.<br/>
            Ejemplo:<br/>
            <!-- Se cargarán archivos de imagen de cualquier tipo -->
            <s:form>        
                <s:file accept='image/*' name='fileTest' id="fileTest"/>
                <!-- Si queremos que se acepten archivos de texto plano:
                accept='text/html,text/plain' -->
            </s:form>
        </p>
        <p>
            Etiqueta <strong>checkbox</strong>:<br/>
            Muestra un elemento input de tipo checkbox. La diferencia con html5 está en que
            Struts agrega un elemento hidden por cada checkbox que colocamos y un interceptor
            especial determina si el valor es true o false y lo establece correctamente en el Action.
            <s:form>
                <s:label for="checkboxTest" value="Checkbox: "/>
                <s:checkbox id="checkboxTest" name="checkboxTest" value="false"/>
            </s:form>
        </p>
        <p>
            Etiqueta <strong>checkboxlist</strong>:
            Muestra una serie de checkboxs como el anterior.
            <s:form>
                <s:checkboxlist list="{'uno','dos','tres','cuatro','cinco'}"
                                id="checkboxlistTest" name="checkboxlistTest"/>
            </s:form>                
            Para asignar diferentes valores al nombre del checkbox y su valor:
            <s:form>
                <s:checkboxlist list="#{'1':'uno','2':'dos','3':'tres','4':'cuatro','5':'cinco'}" 
                                id="checkboxlistTest" name="checkboxlistTest"/>
            </s:form>
            Lo normal es generar los checkbox a través de una lista de objetos (recibida
            generalmente del atributo de un bean). Como ejemplo, se crea una lista de objetos
            'Usuario', de la que obtenemos el 'nombre' como etiqueta y 'edad' como valor.
            <!-- En primer lugar, se crean los objetos con bean: -->
            <s:bean name="com.javatutoriales.struts2.tags.modelo.Usuario" var="usuario1">
                <s:param name="nombre" value="%{'Inma1'}"/>
                <s:param name="edad" value="%{1}"/>
            </s:bean>
            <s:bean name="com.javatutoriales.struts2.tags.modelo.Usuario" var="usuario2">
                <s:param name="nombre" value="%{'Inma2'}"/>
                <s:param name="edad" value="%{2}"/>
            </s:bean>
            <s:bean name="com.javatutoriales.struts2.tags.modelo.Usuario" var="usuario3">
                <s:param name="nombre" value="%{'Inma3'}"/>
                <s:param name="edad" value="%{3}"/>
            </s:bean>
            <s:form>
                <s:checkboxlist list="{#usuario1,#usuario2,#usuario3}" 
                                id="checkboxlistTest" name="checkboxlistTest"
                                listKey="edad" listValue="nombre"/>
                <!-- Para asignar el valor se usa listKey y para el atributo listValue -->
                <!-- De otro modo, se puede obtener la lista de forma dinámica para un action -->
            </s:form>
        </p>
        <p>
            Etiqueta <strong>radio</strong>:<br/>
            Muestra un campo de entrada de tipo radio. Su funcionamiento es similar al anterior.
            <!-- Reutilizando los beans creados en el apartado anterior: -->
            <s:form>
                <s:radio list="{#usuario1,#usuario2,#usuario3}"
                         id="radioTest" name="radioTest" listKey="edad" listValue="nombre"/>
            </s:form>
        </p>
    </body>
</html>
