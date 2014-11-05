<%@include file="/recursos/header.jsp" %>

<title>Usuarios</title>
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
                   $("#fusuario").validity(function(){
                       $.validity.patterns.buser = /^[\S][\w\s-ñÑ-]{1,}[\S]$/;
                       $.validity.messages.buser ="<p>-No se aceptan simbolos (%$#!)</p><p>-No espacios al Inicio ni Final</p><p>-Tres letras como minimo</p>";
                      $("#boxusuario").require("Este campo es requerido").match("buser"); 
                      //comparando contraseñas 
                      var valor = false;
                      if($("#boxpass1").val()==$("#boxpass2").val()){
                          valor = true;
                      }
                      $.validity.patterns.passs = /^[\S][\w\s-ñÑ-]{4,}[\S]$/;
                      $.validity.messages.passs ="<p>-No se aceptan simbolos (%$#!)</p><p>-No espacios al Inicio ni Final</p><p>-Seis letras como minimo</p>";
                      $("#boxpass2").require("Este campo es requerido").match("passs").assert(valor,"No coinciden las contraseñas");
                      $("#boxpass1").require("Este campo es requerido").match("passs");
                      $("#cargo").require("Este campo es requerido");
                      //editar
                      $("#boxpass2A").match("passs").assert(valor,"No coinciden las contraseñas");
                      $("#boxpass1A").match("passs");
                      
                   });
                   
                    $("#borrar2").click(function(){
                        $("#boxusuario").val("");
                        $("#boxpass1A").val("");
                        $("#boxpass2A").val("");
                        $('#cargo').prop('selectedIndex',0);
                    });
                });   
                </script>
                    <c:if test="${param.accion==null||param.accion=='ingresar'}">
                    <form id="fusuario" method="POST" class="contact_form" id="contact_form" >
                        <div>  
                                <ul>  
                                    <li>  
                                         <h2>Usuario</h2>  
                                           <span class="required_notification">* Datos requeridos</span>  
                                        </li>  
                                        <li>  
                           
                        <label>Usuario </label> <input type="text" id="boxusuario"  name="boxusuario" required/>
                                     </li>  
                                        <li>  
                           
                        <label>Contraseña </label> <input type="password" id="boxpass1"  name="boxpass1" required/>
                                     </li>  
                                        <li>  
                           
                        <label>Confirmar Contraseña</label> <input type="password" id="boxpass2"  name="boxpass2" required/>
                                     </li>  
                                        <li>  
                           
                        <label>Cargo </label> 
                        <select name="cargo" id="cargo">
                            <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM cargo"/>
                            <option value="">Seleccionar</option>
                            <c:forEach var="item" items="${queri.rows}">
                                <option value="${item.idcargo}">${item.tipo_cargo}</option>
                            </c:forEach>    
                        </select>
                                         </li>  
                                        <li>  
                           
                        <input type="hidden" name="accion" value="ingresar" />
                        <input type="hidden" name="id" value="${param.id}" />
                        <button type="submit" id="send" >Enviar</button>
                        <button type="button" id="borrar2" >Limpiar</button>
                                        </li>  
                                   </ul>  
                        </div>  
                    </form>
                    </c:if>
                    
                    <c:if test="${param.accion=='editar'}">
                         <h3>Editar Usuarios</h3>
                    <sql:query dataSource="jdbc/mysql" var="q1" sql="select*from usuario where idusuario=${param.id}" />
                    <c:forEach var="item" items="${q1.rows}">
                        <form id="fusuario" method="POST" action="usuariolista.jsp">
                        <label>Usuario <b>*</b></label> <input type="text" id="boxusuario"  name="boxusuario" value="${item.usuario_usuario}"/>
                        <label>Contraseña <b>*</b></label> <input type="password" id="boxpass1A"  name="boxpass1A" />
                        <label>Confirmar Contraseña <b>*</b></label> <input type="password" id="boxpass2A"  name="boxpass2A" />
                        <label>Cargo <b>*</b></label> 
                        <select name="cargo" id="cargo">
                            <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM cargo"/>
                            <option value="">Seleccionar</option>
                            <c:forEach var="item2" items="${queri.rows}">
                                <c:if test="${item.id_cargo_usuario==item2.idcargo}">
                                    <option value="${item2.idcargo}" selected>${item2.tipo_cargo}</option>
                                </c:if>
                                <c:if test="${item.id_cargo_usuario!=item2.idcargo}">
                                    <option value="${item2.idcargo}">${item2.tipo_cargo}</option>
                                </c:if>
                                
                            </c:forEach>    
                        </select>
                        <input type="hidden" name="accion" value="editando" />
                        <input type="hidden" name="id" value="${param.id}" />
                        <input type="hidden" name="ide" value="${item.codigo_empleado_usuario}" />
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
        INSERT INTO usuario (usuario_usuario,clave_usuario_usuario,id_cargo_usuario,codigo_empleado_usuario)values(?,?,?,?);
        <sql:param value="${param.boxusuario}"/>
        <sql:param value="${param.boxpass1}"/>
        <sql:param value="${param.cargo}"/>
        <sql:param value="${param.id}"/>
    </sql:update>    
</c:if>