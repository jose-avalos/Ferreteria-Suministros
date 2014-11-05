<%-- 
    Document   : usuariolista
    Created on : Oct 4, 2014, 1:41:05 PM
    Author     : Metabee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
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
        <link rel="stylesheet" href="css/displaytag.css">
        <link rel="stylesheet" href="css/jquery.validity.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/prefixfree.jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.min.js"></script>
        <script type="text/javascript" src="js/menu-interno.js"></script>
        <script type="text/javascript" src="js/jquery.validity.js"></script>
        <script type="text/javascript" src="js/jquery.validity.lang.es.js"></script>
        <title>Listado de Usuarios</title>
        <style type="text/css">
            .buscar{
                border-radius: 4px;
                height: 25px;
                width: 300px;       
            }
            #buscar{
                background-image:url(img/bus.png);
                background-size: 50%;
                background-position:center;
                background-repeat:no-repeat;
                border-radius: 4px;
                margin:0px;
                position: relative;
                top: 8px;
                height:30px;
                width:70px;
                
            }
            #buscar:hover{
                background-color: #f3f4f6;
            }
        </style>
        <script type="text/javascript">
            $(function() { 
                $("#cbusqueda").validity(function() {
                    //Expresion regular para usuario.
                    $.validity.patterns.busqueda = /^[\S][\w\s-ñÑ.]{0,}[\S]$/;
                    //mesaje de error de la expresion regular de usuario
                    $.validity.messages.busqueda ="<p>No se aceptan simbolos (%$#!)</p><p>No espacios al Inicio ni al Final</p><p>Minimo de letras 2</p>";
                    $("#btexto").match("busqueda");
                });
            });
        </script>
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
                <c:if test="${param.accion=='eliminar'}">
                    <sql:update var="eliminar" dataSource="jdbc/mysql" sql="delete from usuario where idusuario=${param.id}" />
                </c:if>
                <c:if test="${param.accion=='editando'}">
                    <c:if test="${param.boxpass1A!=''}">
                        <sql:update var="actualizar" dataSource="jdbc/mysql" >
                           update usuario set usuario_usuario=?, clave_usuario_usuario=?, id_cargo_usuario=?, codigo_empleado_usuario=? where idusuario=${param.id}
                           <sql:param value="${param.boxusuario}"/>
                           <sql:param value="${param.boxpass1A}"/>
                           <sql:param value="${param.cargo}"/>
                           <sql:param value="${param.ide}"/>
                       </sql:update>   
                    </c:if>
                   <c:if test="${param.boxpass1A==''}">
                           <sql:update var="actualizar" dataSource="jdbc/mysql" >
                                update usuario set usuario_usuario=?, id_cargo_usuario=?, codigo_empleado_usuario=? where idusuario=${param.id}
                                <sql:param value="${param.boxusuario}"/>                                
                                <sql:param value="${param.cargo}"/>
                                <sql:param value="${param.ide}"/>
                            </sql:update>
                           </c:if>                              
                    </c:if>
                <form id="cbusqueda" method="POST">
                    <div><input type="text" class="buscar" name="btexto" id="btexto" /> <input type="submit" name="buscar" id="buscar" value=""/></div>
                </form>
                <c:if test="${param.btexto!=null}">
                <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT usuario.idusuario, cargo.idcargo, usuario.usuario_usuario, cargo.tipo_cargo FROM ferreteria.usuario usuario INNER JOIN ferreteria.cargo cargo ON (usuario.id_cargo_usuario = cargo.idcargo) where usuario_usuario LIKE '%${param.btexto}%' ORDER BY idusuario DESC"/>    
                </c:if>
                <c:if test="${param.btexto==null}">
                <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT usuario.idusuario, cargo.idcargo, usuario.usuario_usuario, cargo.tipo_cargo FROM ferreteria.usuario usuario INNER JOIN ferreteria.cargo cargo ON (usuario.id_cargo_usuario = cargo.idcargo) ORDER BY idusuario DESC"/>
                </c:if>
                <display:table class="estilo" id="users" name="${queri.rows}"  pagesize="2" >
                    <display:column title="Usuario" property="usuario_usuario" sortable="true" />
                    <display:column title="Cargo" property="tipo_cargo"/>
                    <display:column title="Eliminar" style="text-align:center"><a href="usuariolista.jsp?accion=eliminar&id=${users.idusuario}"><img src="img/x.png" style="width: 16px;height: 16px"/></a></display:column>
                    <display:column title="Editar" style="text-align:center"><a href="usuarios.jsp?accion=editar&id=${users.idusuario}"><img src="img/edit.png" style="width: 16px;height: 16px"/></a></display:column>    
                </display:table>
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
