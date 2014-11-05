
<%@include file="/recursos/header.jsp" %>

<title>vehiculos</title>
        <style type="text/css">
            .formuser{
/*                background: #ecf0f1;*/
                background: #f2f6f9;
                border: 1px solid #dedede;
                margin: auto;
                width: 250px;
                padding-top: 20px;
                padding-left: 30px;
                padding-bottom: 15px;
                padding-right: 5px;
                border-radius: 5px; 
            }
            .formuser input{
                /*background: #efefef;*/
                background: #fff;
                border: 1px solid #dedede;
                border-radius: 7px; 
                color: #3a3a3a;
                padding: 10px;
                margin-top: 2px;
                width: 200px;
                height: 10px;
                font-size: 0.9em;
            }
            .formuser label {
                display: block;
                margin-top: 20px;
                letter-spacing: 2px;
            }
            .formuser b {
                color: red;
            }
            .formuser button{
                margin-top: 5px;
                margin-left: 5px;
                padding: 5px;
                
            }
            .formuser div{
                text-align: right;
                margin-top: 20px;
                padding-right: 30px;
                
            }
            .formuser select{
                background: #fff;
                border: 1px solid #dedede;
                border-radius: 7px; 
                color: #3a3a3a;
                padding: 5px;
                margin-top: 2px;
                width: 218px;
                height: 30px;
                font-size: 0.9em;
            }
            
        </style>
        
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

    </head>
    <body>
                        <%@include file="/recursos/menu.jsp" %>
<header>

        </header>
            <article>
                <script type="text/javascript">
                $(function() {
                    $("#fusuario").validity(function(){
                        $("#unidad").require("Este campo es requerido");
                        $("#matricula").require("Este campo es requerido");
                    });
                    
                    $("#borrar2").click(function(){
                        $("#unidad").val("");
                        $("#matricula").val("");
                    });
                    
                    $("#matricula").mask("S-009-009", {placeholder: "- -"});
                    
                });   
                </script>
                <div class="formuser">
                    <c:if test="${param.accion==null||param.accion=='ingresar'}">
                    <h3>Crear Vehiculos</h3>
                    <form id="fusuario" method="POST" >
                        <label>Numero de Unidad <b>*</b></label> <input type="text" id="unidad"  name="unidad" />
                        <label>Matricula <b>*</b></label> <input type="text" id="matricula"  name="matricula" />
                        <input type="hidden" name="accion" value="ingresar" />
                        <div>                        
                        <button type="submit" id="send" >Enviar</button>
                        <button type="button" id="borrar2" >Limpiar</button>
                        </div>
                    </form>
                    </c:if>
                    
                    <c:if test="${param.accion=='editar'}">
                         <h3>Editar Vehiculos</h3>
                    <sql:query dataSource="jdbc/mysql" var="q1" sql="select*from vehiculos where idvehiculos=${param.id}" />
                    <c:forEach var="item" items="${q1.rows}">
                        <form id="fusuario" method="POST" action="vehiculoslista.jsp">
                            <label>Numero de Unidad <b>*</b></label> <input type="text" id="unidad"  name="unidad" value="${item.numero_unidad_vehiculos}"/>
                            <label>Matricula <b>*</b></label> <input type="text" id="matricula"  name="matricula" value="${item.matricula_vehiculos}"/>
                        <input type="hidden" name="accion" value="editando" />
                        <input type="hidden" name="id" value="${param.id}" />
                        <div>                        
                            <button type="submit" id="send" >Guardar</button>
                            <button type="button" id="borrar2" >Limpiar</button>
                        </div>
                    </c:forEach>    
                    </form>
                    </c:if>
                </div>
            </article>
        </section>	
        <aside>aside</aside>

        <footer>
            <div class="ft">
                <p>© 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>
<c:if test="${param.accion=='ingresar'}">
    <sql:update var="insertar" dataSource="jdbc/mysql">
        INSERT INTO vehiculos (numero_unidad_vehiculos, matricula_vehiculos)values(?,?);
        <sql:param value="${param.unidad}"/>
        <sql:param value="${param.matricula}"/>   
    </sql:update>    
</c:if>