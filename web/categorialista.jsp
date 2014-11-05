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
        
        
        <!-- mensaje de confirmacion   -->
       
        <link rel="stylesheet" href="js/Confirm/dialog.css">
<script src="js/Confirm/dialog.js"></script>

       
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/prefixfree.jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.min.js"></script>
        <script type="text/javascript" src="js/menu-interno.js"></script>

        <title>Listado de categorias</title>
        <style type="text/css">
            
            #jsconfirm {
	border-color: #c0c0c0;
	border-width: 2px 4px 4px 2px;
	left: 0;
	margin: 0;
	padding: 0;
	position: absolute;
	top: -1000px;
	z-index: 100;
}

#jsconfirm table {
	background-color: #fff;
	border: 2px groove #c0c0c0;
	height: 150px;
	width: 300px;
}

#jsconfirmtitle {
	background-color: #B0B0B0;
	font-weight: bold;
	height: 20px;
	text-align: center;
}

#jsconfirmbuttons {
	height: 50px;
	text-align: center;
}

#jsconfirmbuttons input {
	background-color: #E9E9CF;
	color: #000000;
	font-weight: bold;
	width: 125px;
	height: 33px;
	padding-left: 20px;
}

#jsconfirmleft{
	background-image: url(left.png);
}

#jsconfirmright{
	background-image: url(right.png);
}

            
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
        
        <!-- divs para mensajes de confirmacion -->
        
       <div id="dialogoverlay"></div>
<div id="dialogbox">
  <div>
    <div id="dialogboxhead"></div>
    <div id="dialogboxbody"></div>
    <div id="dialogboxfoot"></div>
  </div>
</div>
   <!-- cuadro grande de arriba donde va el logo>-->
        <header>   </header>
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
                Escribe Codigo o nombre de la categoria
                <c:if test="${param.accion=='eliminar'}">

                    <sql:update var="eliminar" dataSource="jdbc/mysql" sql="delete from categoria where idcategoria=${param.id}" />
                    <!--es para controlar error sql: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException:-->
                </c:if>
                    
                <c:if test="${param.accion=='editando'}">
                    <sql:update var="actualizar" dataSource="jdbc/mysql" >
                        update categoria set nombre_categoria=?, descripcion_categoria=? where idcategoria=${param.id}
                        <sql:param value="${param.nombreC}"/>
                        <sql:param value="${param.descripC}"/>
                    </sql:update>     
                   
                </c:if>
                        <form id="cbusqueda" method="POST">
                            <div><input type="text" class="buscar" name="btexto" id="btexto" /> <input type="submit" name="buscar" id="buscar" value=""/></div>
                        </form>
                <c:if test="${param.btexto!=null}">        
                <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM categoria where nombre_categoria LIKE '%${param.btexto}%' OR idcategoria LIKE '%${param.btexto}%' OR codigo_categoria LIKE '%${param.btexto}%'  ORDER BY nombre_categoria DESC"/>
                </c:if>       
                <c:if test="${param.btexto==null}">        
                <sql:query var="queri" dataSource="jdbc/mysql" sql="SELECT * FROM categoria ORDER BY idcategoria DESC"/>
                </c:if>
                <display:table class="estilo" id="cat" name="${queri.rows}"  pagesize="10" >
                    <display:column title="codigo" property="codigo_categoria" sortable="true" />
                    <display:column title="Nombre" property="nombre_categoria" sortable="true" />
                    <display:column title="Descripcion" property="descripcion_categoria"/>
                    <display:column title="Eliminar" style="text-align:center"><a onclick=" return confirmar()"  href="categorialista.jsp?accion=eliminar&id=${cat.idcategoria}"><img src="img/x.png" style="width: 16px;height: 16px"/></a></display:column>
                    <display:column title="Editar" style="text-align:center"><a  href="categorias.jsp?accion=editar&id=${cat.idcategoria}"><img src="img/edit.png" style="width: 16px;height: 16px"/></a></display:column>    
                     
                    <!-- onclick=" return confirmar()" -->
                    <!--onclick="javascritp:showConfirm('Please confirm','Are you really really sure to visit google?','Yes','','No','')" -->
                    
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
    <script>
        
    function confirmar(){
    return confirm("Desea Eliminar Este Registro")
}
    </script>
</html>
