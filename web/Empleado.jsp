<%@include file="/recursos/header.jsp" %>
        
<title>Empleados</title>
        
        <style type="text/css">
            .formcat{
/*              background: #ecf0f1;*/
                background: #f2f6f9;
                border: 1px solid #dedede;
                margin: auto;
                width: 460px;
                padding: 15px;
                border-radius: 1px; 
                margin-bottom: 10px;
            }
            .formcat input{
                /*background: #efefef;*/
                background: #fff;
                border: 1px solid #dedede;
                border-radius: 2px; 
                color: #3a3a3a;
                padding: 10px;
                margin-top: 3px;
                width: 439px;
                height: 10px;
                font-size: 0.9em;
            }
            .formcat label {
                display: block;
                margin-top: 0px;
                letter-spacing: 2px;
            }
            .formcat b {
                color: red;
            }
            .formcat button{
                margin-top: 5px;
                margin-left: 5px;
                padding-left: 5px;
                
            }
            
            .ft1 {
                
                margin-top: 200px;
                
            }
            
            .sec{
                margin-bottom: 0px;
                
            }
            .formcat div{
                text-align: center;
            }
            
            b {
                
               color: red;
            }
        </style>
    </head>
    <body>
                <%@include file="/recursos/menu.jsp" %>
                
                        <script type="text/javascript">
            $(document).ready(function() {
                $("#jMenu").jMenu({
                    openClick : false,
                    ulWidth :'auto',
                     TimeBeforeOpening : 100,
                    TimeBeforeClosing : 11,
                    animatedText : false,
                    paddingLeft: 1,
                    effects : {
                        effectSpeedOpen : 150,
                        effectSpeedClose : 150,
                        effectTypeOpen : 'slide',
                        effectTypeClose : 'slide',
                        effectOpen : 'swing',
                        effectClose : 'swing'
                    }

                });
            });
        </script>
            <article>
                 <script type="text/javascript">
            $(function() { 
                $("#cat").validity(function() {
                    $.validity.patterns.nombreE = /^[\S][\w\s-Ò—.]{0,}[\S]$/;
                    $.validity.messages.ndombreE ="<p>-No se aceptan simbolos (%$#!)</p><p>-No espacios al Inicio ni Final</p><p>-Dos letras como minimo</p>";
                    $.validity.patterns.apellidoE = /^[\S][\w\s-Ò—.]{0,}[\S]$/;
                    $.validity.apellidoE ="<p>-No se aceptan simbolos (%$#!)</p><p>-No espacios al Inicio ni Final</p><p>-Dos letras como minimo</p>";
                    $.validity.messages.duiE= "[0-9]{-}[0-9]{1}";
                    $.validity.duiE="<p> Debe introducir solo datos numericos";
                    $.validity.messages.direccionE= /^[\S][\w\s-Ò—.]{0,}[\S]$/;
                    $.validity.direccionE="<p> Campo Obligatorio";
                    $.validity.telefonoE=
                    $.validity.descripcion = /^[\S][\w\s-Ò—@#$%&=+-.]{0,}[\S]$/;
                    
                    $.validity.messages.descripcion ="<p>-Simbolos aceptados: @#$%&=+-</p><p>-No espacios al Inicio ni Final</p><p>-Dos letras como minimo</p>";
                    $("#nombreC").require("Este campo es Requrido").match("nombre");
                    $("#descripC").match("descripcion");
                });
                
                $("#borrar2").click(function(){
                    $("#nombreC").val("");
                    $("#descripC").val("");
                });
            });
                </script>
                    <c:if test="${param.accion==null||param.accion=='ingresar'}">
                        
                       <form name="empleado"  class="contact_form" id="contact_form" method="POST">
                           <div>  
                                <ul>  
                                    <li>  
                                            <h2>Empleados</h2>  
                                            <table id ='Formularios'>
                                        <span class="required_notification">* Datos requeridos</span>  
                                            <input type="hidden" id="nombreC"  name="nombre"  value="EM" id="nombreC" placeholder="Herramientas" required/>
                           <tr><td><label>Nombre Empleado <b>*</b></label> <input type="text"  name="nombre2" id="nombre2" placeholder="Jose" required  pattern="[a-zA-Z]+" />
                                        </td>
                                        <td><label>DUI </label><b>*</b> <input type="text"  name="duiE" id="duiE" placeholder="04897908-1" required pattern="[0-9]{8}-[0-9]{1}"/></td>
                                     
                        <tr><td><label>Direccion </label><b>*</b> <input type="text"  name="direccionE" id="direccionE"  required pattern="[a-zA-Z]+"/></td>
                                     
                            <td><label>Telefono</label><b>*</b> <input type="text"  name="telE" id="telE" placeholder="2222-2222" required pattern="[0-9]{4}-[0-9]{4}"/></td></tr>
                                     
                        <tr><td><label>Celular</label><b>*</b> <input type="text"  name="celE" id="celE" placeholder="7777-7777" required pattern="[0-9]{4}-[0-9]{4}" />
                        <td> <label>Fecha Nacimiendo</label><b>*</b> <input type="date"  name="fechaE" id="fechaE"  required/></td>
                            </tr>
                        <td>
                            <label>Genero </label>
                                   <select name="genero" id="genero">
                            <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM genero"/>
                            <option value="">Seleccionar</option>
                            <c:forEach var="item" items="${queri.rows}">
                                <option value="${item.idgenero}">${item.genero_genero}</option>
                            </c:forEach>    
                                   </select></td>
                                   
                                   <td>
                            <label>Genero </label>
                                   <select name="estado" id="estado">
                            <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM estado"/>
                            <option value="">Seleccionar</option>
                            <c:forEach var="item" items="${queri.rows}">
                                <option value="${item.idestado}">${item.estado_actual}</option>
                                
                            </c:forEach>    
                                   </select></td>
                        
                           
                        <input type="hidden" name="accion" value="ingresar" />
                        <tr><td colspan='2'><button type="submit" id="send" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                    <span class="ui-button-text">Enviar</span>
                        </button>
                        <button type="reset" id="borrar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                    <span class="ui-button-text">Limpiar</span>
                        </button></td></tr>
                           </table>
                        
                    </form> 
                    </c:if>
                    
                    
                    <c:if test="${param.accion=='editar'}">
                        <h2>Editar Empleado</h2>
                        <sql:query dataSource="jdbc/mysql" var="q1" sql="select*from empleado where idempleado=${param.id} " />
                        <c:forEach var="item" items="${q1.rows}">
                                <form name="empleado" method="POST" action="listaEmpleados.jsp">
                                    <label>Nombre Empleado</label> <input type="text" class="redondes" name="nombreE" id="nombreE" value="${item.nombres_empleado}"/>
                                    <label>Apellidos Empleado</label> <input type="text" class="redondes" name="apellidoE" id="apellidoE" value="${item.apellidos_empleado}"/>
                                    <label>Dui </label> <input type="text" class="redondes" name="duiE" id="duiE" value="${item.DUI_empleado}"/>
                                    <label>Direccion </label> <input type="text" class="redondes" name="direccionE" id="direccionE" value="${item.direccion_empleado}"/>
                                    <label>Telefono </label> <input type="text" class="redondes" name="telE" id="telE" value="${item.tel_empleado}"/>
                                    <label>Celular </label> <input type="text" class="redondes" name="celE" id="celE" value="${item.cel_empleado}"/>
                                    <label>Fecha Nacimiento</label> <input type="text" class="redondes" name="fechaE" id="fechaE" value="${item.fecha_nacimiento_empleado}"/>
                                    <label>Genero </label> <input type="text" class="redondes" name="generoE" id="generoE" value="${item.genero_empleado}"/>
                                    <label>Estado </label> <input type="text" class="redondes" name="estadoE" id="estadoE" value="${item.estado_empleado}"/>
                                    <input type="hidden" name="accion" value="editando" />
                                    <input type="hidden" name="id" value="${param.id}" />
                                    <div>
                                    <button type="submit" id="send" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                                <span class="ui-button-text">Guardar</span>
                                    </button>
                                    <button type="reset" id="borrar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                    <span class="ui-button-text">Limpiar</span>
                                    </button>
                                    </div>
                                </form>
                            </c:forEach>
                    </c:if>
                </div>
            </article>
        </section>	
        <footer class="ft1">
            <div class="ft">
                <p>© 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>

<jsp:useBean id="cod" scope="page" class="Beans.CodigoBean"/>

<c:if test="${param.accion=='ingresar'}">
    <h2>Datos Ingresados con existo</h2>
    
<c:set var="nombre" value="${param.nombre}"/>
<c:set var="nombre2" value="${param.nombre2}"/>

<sql:query var="q1" dataSource="jdbc/mysql">
SELECT * from empleado
</sql:query>
<c:set var="nreg" value="${q1.rowCount}"/>
<c:set target="${cod}" property="nombre" value="${nombre}"/>
<c:set target="${cod}" property="nombre2" value="${nombre2}"/>
<c:set target="${cod}" property="cantidad_registros" value="${nreg}"/>
<c:set var="codigoUsu" value="${cod.cod}"/>
    <sql:update var="insertar" dataSource="jdbc/mysql">
        INSERT INTO empleado (codigo, nombres_empleado,DUI_empleado, direccion_empleado, tel_empleado, cel_empleado , fecha_nacimiento_empleado, genero_empleado, estado_empleado)values(?,?,?,?,?,?,?,?,?);
        <sql:param value="${codigoUsu}"/>
       <sql:param value="${param.nombre2}"/>
        <sql:param value="${param.duiE}"/>
        <sql:param value="${param.direccionE}"/>
        <sql:param value="${param.telE}"/>
        <sql:param value="${param.celE}"/>
        <sql:param value="${param.fechaE}"/>
        <sql:param value="${param.generoE}"/>
        <sql:param value="${param.estadoE}"/>
        
    </sql:update>
</c:if>
