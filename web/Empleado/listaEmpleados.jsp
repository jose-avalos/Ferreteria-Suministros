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
        <title>Listado de Empleados</title>
        <style type="text/css">
            
                        #categoria{padding-left: 7.5Ex;}
        a:link   {   text-decoration:none;   }  
        #gear{margin-left: 20Ex;}
#words {
    margin-left: auto;
    margin-right: auto;
    width: 100%;
    margin-top:1Ex;
    font-style: oblique;
    font-size:2em;
    font-color:white;
    padding-left:20Ex;  }

            
        </style>
    </head>
    <body>
        <header>

        </header>
                <nav>
            
            <h1 id="words">Suministros Ferreteros</h1>
            <div>
                
            <li class="home-page"><a href="index.jsp"><span></span></a></li>
                <!--<ul class="menu">
            
                        <c:if test="${sessionScope.cargo!=null}">
                        <li><a href="cerrar_sesion?valor=cerrar">Cerrar Sesion</a></li>
                        </c:if>
                        <c:if test="${sessionScope.cargo==null}">
                        <li><a class="log" href="#">Iniciar Sesion</a></li>
                        </c:if>

                </ul>-->
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
            <li>
                <a id="categoria">Categorias</a>
                <ul>
                    <li>
                        <li><a href="categorialista.jsp">Listado Categorias</a>
                        <ul>
                                
                                <ul>
                                    <li>
                                        <ul>
                                            <li>
                                                <ul>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li><a href="categorias.jsp">Crear Categoria </a></li>
                    <li>
                        <ul>
                            <li>
                                <ul>
                                    <li><a>Category 1.4</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    
                </ul>
            </li>
            <li>
                <a id="categoria">Empleados</a>
                <ul>
                    <li>
                        <a href="listaEmpleados.jsp">Lista Empleados</a>
                        <ul>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="Empleado.jsp">Ingresar Empleado</a>
                            <ul>
                            
                        </ul>
                    </li>
                    <li>
                        <a>Category 2.2</a>
                        <ul>
                            
                        </ul>
                    </li>
                    <li><a>Category 2.2</a></li>
                </ul>
            </li>

            <li>
                <a id="categoria">Proveedores</a>
                <ul>
                    <li>
                        <a href="Proveedores.jsp">Lista proveedores</a>
                        <ul>
                            <li><a>Category 3.3</a></li>
                            <li><a>Category 3.3</a></li>
                            <li><a>Category 3.3</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="Productos.jsp">Ingresar Productos</a>
                        <ul>
                            <li><a href="productosLista.jsp">Lista Producto</a></li>
                            <li><a>Category 3.3</a></li>
                        </ul>
                    </li>
                    <li><a href="productosLista.jsp">Lista Productos</a></li>
                    <li><a>Category 3.2</a></li>
                </ul>
            </li>

            <li>
                <a id="categoria">Usuarios</a>
                <ul>
                    <li><a href="usuariolista.jsp">lista Usuarios</a></li>
                    <li>
                        <a href="usuarios.jsp">Crear Usuarios</a>
                        <ul>
                            <li><a>Category 4.3</a></li>
                            <li><a>Category 4.3</a></li>
                            <li><a>Category 4.3</a></li>
                            <li><a>Category 4.3</a></li>
                        </ul>
                    </li>
                    <li><a>Category 4.2</a></li>
                </ul>
            </li>

            <li>
                <a id="categoria" >Vehiculos</a>
                <ul>
                    <li>
                        <a href="vehiculos.jsp">Ingresar Vehiculos</a>
                        <ul>
                        </ul>
                    </li>
                    <li><a href="vehiculoslista.jsp">Lista de vehiculos</a></li>
                    
                </ul>
            </li>

            <li><a id="categoria">Reportes</a></li>

            <li>
                
                <c:if test="${sessionScope.cargo!=null}">
                        <li><a href="cerrar_sesion?valor=cerrar">Cerrar Sesion</a></li>
                        </c:if>
                        <c:if test="${sessionScope.cargo==null}">
                        <li><a class="log" href="#">Iniciar Sesion</a></li>
                        </c:if>
               
            </li>
        </ul>    <article>

        
            <article>
                Listado de Empleados
                <c:if test="${param.accion=='eliminar'}">
                    <sql:update var="eliminar" dataSource="jdbc/mysql" sql="delete from empleado where idempleado=${param.id}" />
                    <!--es para controlar error sql: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException:-->
                </c:if>
                <c:if test="${param.accion=='editando'}">
                    <sql:update var="actualizar" dataSource="jdbc/mysql" >
                        update empleado set nombres_empleado=?, apellidos_empleado=?, DUI_empleado=?, direccion_empleado=?, tel_empleado=?, cel_empleado=?, fecha_nacimiento_empleado=?, genero_empleado=?, estado_empleado=?  where idempleado=${param.id}
                        <sql:param value="${param.nombreE}"/>
                        <sql:param value="${param.apellidoE}"/>
                        <sql:param value="${param.duiE}"/>
                        <sql:param value="${param.direccionE}"/>
                        <sql:param value="${param.telefonoE}"/>
                        <sql:param value="${param.celularE}"/>
                        <sql:param value="${param.fechaE}"/>
                        <sql:param value="${param.generoE}"/>
                        <sql:param value="${param.estadoE}"/>
                        
                    </sql:update>     
                   
                </c:if>
                        
                
                <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM empleado"/>
                <display:table class="estilo" id="emp" name="${queri.rows}"  pagesize="2" export="true">
                    <display:column title="Nombre" property="nombres_empleado" sortable="true"/>
                    <display:column title="Apellidos" property="apellidos_empleado" sortable="true"/>
                    <display:column title="Dui" property="dui_empleado" sortable="true"/>
                    <display:column title="direccion" property="direccion_empleado" sortable="true"/>
                    <display:column title="telefono" property="telefono_empleado" sortable="true"/>
                    <display:column title="celular" property="celular_empleado" sortable="true"/>
                    <display:column title="fecha" property="fecha_nacimiento_empleado" sortable="true"/>
                    <display:column title="genero" property="genero_empleado" sortable="true"/>
                    <display:column title="estado" property="estado_empleado" sortable="true"/>
                    <display:column title="Usuarios">
                        <a href="usuarios.jsp?id=${emp.codigo_empleado}">Crear</a>
                    </display:column>
                    <display:column title="Eliminar" style="text-align:center"><a href="listaEmpleados.jsp?accion=eliminar&id=${emp.idempleado}"><img src="img/x.png" style="width: 16px;height: 16px"/></a></display:column>
                    <display:column title="Editar" style="text-align:center"><a href="Empleado.jsp?accion=editar&id=${emp.idempleado}"><img src="img/edit.png" style="width: 16px;height: 16px"/></a></display:column>    
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