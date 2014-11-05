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

        <title>Listado de Producto</title>
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
                Listado de Productos
                <c:if test="${param.accion=='eliminar'}">
                    <sql:update var="eliminar" dataSource="jdbc/mysql" sql="delete from productos_de_compra where idproductos_de_compra=${param.id}" />
                    <!--es para controlar error sql: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException:-->
                </c:if>
                <c:if test="${param.accion=='editando'}">
                    <sql:update var="actualizar" dataSource="jdbc/mysql" >
                        update productos_de_compra set nombre_productos_de_compra=?, cantidad_productos_de_compra=?, costo_productos_de_compra where idproductos_de_compra=${param.id}
                        <sql:param value="${param.nombreP}"/>
                        <sql:param value="${param.cantidadP}"/>
                        <sql:param value="${param.costoP}"/>
                    </sql:update>     
                   
                </c:if>
                        <form id="cbusqueda" method="POST">
                            <div><input type="text" class="buscar" name="btexto" id="btexto" /> <input type="submit" name="buscar" id="buscar" value=""/></div>
                        </form>
                <c:if test="${param.btexto!=null}">        
                <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM productos_de_compra where nombre_productos_de_compra LIKE '%${param.btexto}%' ORDER BY idproductos_de_compra DESC"/>
                </c:if>       
                <c:if test="${param.btexto==null}">        
                <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM productos_de_compra ORDER BY idproductos_de_compra DESC"/>
                </c:if>
                <display:table class="estilo" id="cat" name="${queri.rows}"  pagesize="10" >
                    <display:column title="Nombre" property="nombre_productos_de_compra" sortable="true" />
                    <display:column title="Cantidad" property="cantidad_productos_de_compra"/>
                    <display:column title="Eliminar" style="text-align:center"><a href="productosLista.jsp?accion=eliminar&id=${cat.idproductos_de_compra}"><img src="img/x.png" style="width: 16px;height: 16px"/></a></display:column>
                    <display:column title="Editar" style="text-align:center"><a href="Productos.jsp?accion=editar&id=${cat.idproductos_de_compra}"><img src="img/edit.png" style="width: 16px;height: 16px"/></a></display:column>    
                </display:table>
            </article>
        </section>	
                <aside></aside>
                
        <footer>
            <div class="ft">
                <p>© 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>
