<%-- 
    Document   : usuarios
    Created on : Oct 4, 2014, 12:40:33 PM
    Author     : Metabee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:if test="${sessionScope.cargo!=1}">
    <c:redirect url="index.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="css/jmenu.css">
        <link rel="stylesheet" href="jquery-ui.min.css">
        <link rel="stylesheet" href="css/jquery.validity.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/prefixfree.jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.min.js"></script>
        <script type="text/javascript" src="js/menu-interno.js"></script>
        <script type="text/javascript" src="js/jquery.validity.js"></script>
        <script type="text/javascript" src="js/jquery.validity.lang.es.js"></script>
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
        <header>

        </header>
        <nav>
            <div>
                <ul class="menu">
                    <li class="home-page"><a href="index.jsp"><span></span></a></li>
                    <li><a href="#">Catalogo</a></li>
                    <li><a href="#">Quienes Somos</a></li>
                    <li><a href="#">Servicios</a></li>
                    <li><a href="#">Projectos</a></li>
                    <li><a href="#">Clientes</a></li>
                    <li><a href="#">Contactos</a></li>
                        <c:if test="${sessionScope.cargo!=null}">
                        <li><a href="cerrar_sesion?valor=cerrar">Cerrar Sesion</a></li>
                        </c:if>
                        <c:if test="${sessionScope.cargo==null}">
                        <li><a class="log" href="#">Iniciar Sesion</a></li>
                        </c:if>

                </ul>
                <div id="dialogo">
                    <form method="POST" action="login">
                        Usuario<input type="text" class="redondes" id="user" name="user"><br>
                        Contraseña <input type="password" class="redondes" id="pass" name="pass"><br><br>
                        <p> 
                            <button type="submit" id="send" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                <span class="ui-button-text">Iniciar Sesión</span>
                            </button>
                            <!-- <button type="reset" id="borrar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                    <span class="ui-button-text">Borrar</span>
                            </button> -->
                        </p>
                    </form>
                </div>
            </div>
        </nav>
        <section>
            <article>
                <ul id="jMenu">
                    <li><a href="categorias.jsp">Categoria</a>
                        <ul>
                            <li><a href="categorialista.jsp">Listado de categorias</a></li>
                        </ul>
                    </li>
                    <li><a href="ingresaremp.jsp">Empleado</a>
                        <ul>
                            <li><a>tema2</a></li>
                        </ul>
                    </li>
                    <li><a href="usuarios.jsp">Usuarios</a>
                        <ul>
                            <li><a href="usuariolista.jsp">Listado de Usuarios</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 4</a>
                        <ul>
                            <li><a>tema4</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 5</a>
                        <ul>
                            <li><a>tema5</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 6</a>
                        <ul>
                            <li><a>tema7</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 8</a>
                        <ul>
                            <li><a>tema8</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 9</a>
                        <ul>
                            <li><a>tema9</a></li>
                        </ul>
                    </li>
                     
                    
                </ul><br>
            </article>
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
                <div class="formuser">
                    <c:if test="${param.accion==null||param.accion=='ingresar'}">
                    <h3>Crear Usuarios</h3>
                    <form id="fusuario" method="POST" >
                        <label>Usuario <b>*</b></label> <input type="text" id="boxusuario"  name="boxusuario" />
                        <label>Contraseña <b>*</b></label> <input type="password" id="boxpass1"  name="boxpass1" />
                        <label>Confirmar Contraseña <b>*</b></label> <input type="password" id="boxpass2"  name="boxpass2" />
                        <label>Cargo <b>*</b></label> 
                        <select name="cargo" id="cargo">
                            <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM cargo"/>
                            <option value="">Seleccionar</option>
                            <c:forEach var="item" items="${queri.rows}">
                                <option value="${item.idcargo}">${item.tipo_cargo}</option>
                            </c:forEach>    
                        </select>
                        <input type="hidden" name="accion" value="ingresar" />
                        <input type="hidden" name="id" value="${param.id}" />
                        <div>                        
                        <button type="submit" id="send" >Enviar</button>
                        <button type="button" id="borrar2" >Limpiar</button>
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
                        <input type="hidden" name="ide" value="${item.id_empleado_usuario}" />
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
        INSERT INTO usuario (usuario_usuario,clave_usuario_usuario,id_cargo_usuario,id_empleado_usuario)values(?,?,?,?);
        <sql:param value="${param.boxusuario}"/>
        <sql:param value="${param.boxpass1}"/>
        <sql:param value="${param.cargo}"/>
        <sql:param value="${param.id}"/>
    </sql:update>    
</c:if>