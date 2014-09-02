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
        <p>
            Etiqueta <strong>select</strong>:<br/>
            Funciona de forma similar a las dos anteriores. En su list puede recibir una lista
            o un mapa de elementos (cualquier tipo de objeto).
            <s:form>
                <s:label for="selectTest" value="Select Mapa: "/>
                <s:select list="#{'1':'uno','2':'dos','3':'tres','4':'cuatro','5':'cinco'}"
                          id="selectTest" name="selectTest" headerKey="-1" 
                          headerValue="Selecciona una opción"/><br/>
                <!-- Aprovechamos de nuevo los bean anteriores -->
                <s:label for="selectTestLista" value="Select Lista: "/>
                <s:select list="{#usuario1,#usuario2,#usuario3}" id="selectTestLista"
                          name="selectTestLista" listKey="edad" listValue="nombre"
                          headerKey="-1" headerValue="Seleccione una opción"/>
                <!-- headerKey y headerValue aportan un valor extra en la lista que será la primera
                    opción que se muestra y que no es ningún valor de la lista mostrada, sino uno 
                    nuevo que no tendrá ninguna asignación a la hora de hacer algún submit-->
                
            </s:form>
        </p>
        <p>
            Etiqueta <strong>optgroup</strong>:<br/>
            Marca una serie de categorías con sus elementos. Con ella se agrupa una serie de valores y 
            sólo puede ser usada dentro de una etiqueta 'select'. Recibirá sus valores a través de un mapa
            o de una lista cuyos objetos no sean cadenas.
            <s:form>
                <s:select id="selectTestOpt" name="selectTestOpt" list="{'JSE','JEE','JME'}">
                    <!-- Añadimos el optgroup cuya lista de opciones sea un mapa -->
                    <s:optgroup label="Servidores" list="#{'1':'Glassfish','2':'JBoss','3':'WebLogic'
                                ,'4':'WebSphere'}"/>
                    <!-- Se coloca un segundo grupo de datos: -->
                    <s:optgroup label="Bases de Datos" list="#{'5':'Oracle','6':'MySQL','7':'SQL Server'
                                ,'8':'PosgreSLQ'}"/>
                </s:select>
            </s:form>
            También en este caso es posible obtener los elementos de la lista por medio de beans:
            <s:form>
                <s:select id="selectTestOpt" name="selectTestOpt" list="{'JSE','JEE','JME'}">                    
                    <s:optgroup label="Bases de Datos" list="#{'5':'Oracle','6':'MySQL','7':'SQL Server'
                                ,'8':'PosgreSLQ'}"/>
                    <s:optgroup label="Usuarios" listKey="edad" listValue="nombre"
                                list="{#usuario1,#usuario2,#usuario3}"/>
                </s:select>                
            </s:form>
        </p>
        <p>
            Etiqueta <strong>textfield</strong>:<br/>
            Consiste en un campo de texto.<br/>
            <s:form>
                <s:label for="textfieldTest" value="Texto: "/>
                <s:textfield id="textfieldTest" name="texfieldTest" value="texto"/>
            </s:form>
        </p>
        <p>
            Etiqueta <strong>password</strong>:<br/>
            Consiste en un campo de texto con los caracteres ocultos.<br/>
            <s:form>
                <s:label for="passwordTest" value="Password: "/>
                <s:password id="passwordTest" name="passwordTest" value="password" />
                <!-- Si quisieramos que el valor del password, se podría poner el atributo
                    showPassword="true"-->
            </s:form>
        </p>
        <p>
            Etiqueta <strong>hidden</strong>:<br/>
            Genera un texto oculto:<br/>
            <s:form>
                <s:label for="hiddenTest" value="Texto oculto: "/>
                <s:hidden name="hiddenTest" value="abc123"/>
                <!-- Que no se debe mostrar en la pantalla -->
            </s:form>            
        </p>
        <p>
            Etiqueta <strong>textarea</strong>:<br/>
            Genera un campo de texto con saltos de línea.<br/>
            <s:form>
                <s:label for="textareaTest" value="Textarea: "/>
                <s:textarea cols="20" rows="5" value="Texto para el area" id="textareaTest"
                            name="textareaTest" />
            </s:form>
        </p>
        <p>
            Etiqueta <strong>combobox</strong>: <br/>
            Mezcla un input de texto con un select, de forma que se coloca un texto en el input a la vez
            que se selecciona en el select. Para rellenar el input se genera un código en JavaScript.<br/>
            <s:form>               
                <s:label for="comboboxTest" value="Combobox: "/>
                <s:combobox list="#{'1':'uno','2':'dos','3':'tres','4':'cuatro','5':'cinco'}" 
                                id="comboboxTest" name="comboboxTest" headerKey="-1"
                                headerValue="Selecciones un elemento" emptyOption="true"/>
            </s:form>
            Usando el bean anterior:<br/>
            <s:form>
                <s:label for="selectTest" value="Select: "/>
                <s:combobox list="{#usuario1,#usuario2,#usuario3}" id="selectTest"
                            name="selectTest" listKey="edad" listValue="nombre"
                            headerKey="-1" headerValue="Seleccione una opción"
                            emptyOption="true" />
            </s:form>
        </p>
        <p>
            Etiqueta <strong>doubleselect</strong>: <br/>
            Es una combinación de dos listas select, de modo que la primera lista determina lo que aparece
            en la segunda.<br/>
            <s:form>
                <!-- Internamente, el doubleselect ejecuta un pequeño Script -->
                <s:doubleselect name="primerLista" id="doubleselectList1Test"
                                headerValue="Seleccionar" headerKey="-1"
                                doubleName="segundaLista" doubleId="doubleselectList2Test"
                                doubleHeaderValue="Selecciona" doubleHeaderKey="-1"
                                list="{'especialidad','lenguaje'}"
                                doubleList="top=='especialidad'?{'comunicacion','bases de datos',
                                'criptografia'}:{'java','php','.net'}"/><br/>
                <!-- Se usa 'top' para preguntar por el valor seleccionado y en función de él
                    se muestra una segunda lista u otra.-->
                <!-- No me funciona :( aunque el código (tanto aquí como el html generado) 
                    es el mismo que en el ejemplo. Es como si estuviera usando un mapa, cosa que 
                    no funciona con esta etiquta.-->
                <!-- Para poder usar un mapa, necesitamos establecer los valores del mapa en una variable: -->
                <s:set var="mapaValores" value="#{'Especialidad':{'Comunicación','Bases de Datos',
                                                  'Criptografía'},'Lenguajes':{'Java','PHP','.Net'},
                                                  'Conocimientos':{'Básico','Intermedio','Avanzado'}}"/>
                <!-- Con esto, ahora podemos usar el doubleselect -->
                <s:doubleselect name="pirmerLista2" id="doubleselectList1Test2"
                                headerValue="Seleccionar" headerKey="-1"
                                doubleName="segundaLista2" doubleId="doubleselectList2Test2"
                                doubleHeaderValue="Selecciona" doubleHeaderKey="-1"
                                list="#mapaValores.keySet()" doubleList="#mapaValores[top]"/><br/>
                <!-- Lo cual sigue sin funcionar -->
                <!-- Tambien se pueden obtener los valores de la lista desde un bean, el cual
                    tendría que ser un mapa cuya llave (Key) sea una cadena y su valor (Value)
                    una lista de cadenas, de la forma Map<String, List<String>> -->
            </s:form>
        </p>
        <p>
            Etiqueta <strong>updownselect</strong>:<br/>
            Coloca un select con botones para moverse por sus elementos. Los elementos seleccionados
            serán enviados en el orden en que se encuentren.<br/>
            <s:form>
                <s:updownselect list="#{'java':'Java','php':'PHP','puntoNet':'.Net'}"
                                name="updownselectTest" id="updownselectTest"
                                headerKey="-1" headerValue="-Selecciona en el orden deseado-"
                                emptyOption="true"/><br/>
                <!-- Desde un bean (hecho por mí, no hay ejemplo en el tutorial) -->
                Desde un bean:<br/>
                <s:updownselect list="{#usuario1,#usuario2,#usuario3}"
                                name="updownselectBean" id="updownselectTest"
                                listKey="edad" listValue="nombre"
                                headerKey="-1" headerValue="-Selecciona usuario-"
                                emptyOption="true"/>
            </s:form>
        </p>
        <p>
            Etiqueta <strong>inputtransferselect</strong>:<br/>
            Es combinación de un select de múltiples valores y una entrada de texto
            que permite agregar y eliminar valores de la lista.
            <s:form>
                <s:inputtransferselect name="inputselectTest" id="inputselectTest"
                                       list="{'Linux','Mac OS', 'Windows'}"/><br/>
                Desde un map:<br/>
                <!-- Y personalizando las opciones -->
                <s:inputtransferselect name="inputselectTest2" id="inputselectTest2"
                                       addLabel="Agregar" removeLabel="Eliminar" 
                                       removeAllLabel="Eliminar todo" upLabel="Subir"
                                       downLabel="Bajar"
                                       list="#{'1':'Linux','2':'Mac OS','3':'Windows'}"/>
            </s:form>
        </p>
        
    </body>
</html>
