<%-- 
    Document   : vehiculoslista
    Created on : Oct 16, 2014, 3:30:45 PM
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
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/prefixfree.jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.min.js"></script>
        <script type="text/javascript" src="js/menu-interno.js"></script>
        <title>vehiculos Listado</title>
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
                    <li><a href="Empleado.jsp">Empleado</a>
                        <ul>
                            <li><a href="listaEmpleados.jsp"> Ingresar Empleados</a></li>
                        </ul>
                    </li>
                    <li><a href="usuarios.jsp">Usuarios</a>
                        <ul>
                            <li><a href="usuariolista.jsp">Listado de Usuarios</a></li>
                        </ul>
                    </li>
                    <li><a href="Cliente.jsp">Cliente</a>
                        <ul>
                            <li><a>tema4</a></li>
                        </ul>
                    </li>
                    <li><a href="Proveedores.jsp">Proveedores</a>
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
                    <sql:update var="eliminar" dataSource="jdbc/mysql" sql="delete from vehiculos where idvehiculos=${param.id}" />
                </c:if>
                <c:if test="${param.accion=='editando'}">
                        <sql:update var="actualizar" dataSource="jdbc/mysql" >
                           update vehiculos set numero_unidad_vehiculos=?, matricula_vehiculos=? where idvehiculos=${param.id}
                           <sql:param value="${param.unidad}"/>
                           <sql:param value="${param.matricula}"/>
                       </sql:update>   
                </c:if>
               <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM vehiculos"/>    
               <display:table class="estilo" id="ve" name="${queri.rows}"  pagesize="2" >
                    <display:column title="Numero de Unidad" property="numero_unidad_vehiculos" sortable="true" />
                    <display:column title="Matricula" property="matricula_vehiculos" sortable="true"/>
                    <display:column title="Eliminar" style="text-align:center"><a href="vehiculoslista.jsp?accion=eliminar&id=${ve.idvehiculos}"><img src="img/x.png" style="width: 16px;height: 16px"/></a></display:column>
                    <display:column title="Editar" style="text-align:center"><a href="vehiculos.jsp?accion=editar&id=${ve.idvehiculos}"><img src="img/edit.png" style="width: 16px;height: 16px"/></a></display:column>    
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
