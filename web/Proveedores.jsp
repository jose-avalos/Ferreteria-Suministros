<%-- 
    Document   : Proveedores
    Created on : 06-oct-2014, 15:57:53
    Author     : usuario
--%>

<%
String Id = request.getParameter("Codigo");
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/prefixfree.jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.min.js"></script>
        <script type="text/javascript" src="js/menu-interno.js"></script>
         <title>Ingresar Proveedores</title>
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
                <div id="test">
                    <center><b>Ingresar Proveedores</b></center>+
               <%
               try{         
              Connection conexion = null;
             ResultSet rs = null;
             Class.forName("com.mysql.jdbc.Driver");
               conexion = DriverManager.getConnection ("jdbc:mysql://localhost/ferreteria","root", "");
                Statement s = conexion.createStatement();
                
                if(Id==null){
                 out.println(
                           "<form action='MantProveedores' method='POST'>"+
                         "Ingrese sus nombres: <input type='text' name='nombre' value='' size='30' /><br>'"+
"Ingrese sus apellidos: <input type='text' name='apellido' value='' size='30'/><br>"+
"Direccion: <input type='text' name='direccion' value='' size='30'/><br>"+
"Telefono: <input type='text' name='telefono' value='' size='10' /><br>"+
"<input type='text' name='Opcion' value='Nuevo' size='10' hidden='hidden'/>"+                                  
"Ingrese su Direccion Email: <input type='text' name='correo' value='' size='45' /><br>"+
"Ingrese su Empresa: <input type='text' name='empresa' value='' size='45' /><br>"+
"<input type='submit' value='Enviar' name='enviar' /><br>"+
                                   "</form>");
                }else{
                   
              rs = s.executeQuery ("select * from proveedores where idproveedores='"+Id+"'");
                while(rs.next()){
                   out.println(
                                 "<form action='MantProveedores' method='POST'>"+
    "<input type='text' name='codigo' value="+rs.getString("idproveedores")+" hidden='hidden'/>"+
    "Ingrese sus nombres: <input type='text' name='nombre' value="+rs.getString("nombre_proveedores")+" size='30' /><br>'"+
    "Ingrese sus apellido: <input type='text' name='apellido' value="+rs.getString("apellido_proveedores")+" size='30'/><br>"+
    "Direccion: <input type='text' name='direccion' value="+rs.getString("direccion_proveedores")+" size='30'/><br>"+
    "Telefono: <input type='text' name='telefono' value="+rs.getString("telefono_proveedores")+" size='10' /><br>"+
    "Ingrese su Direccion Email: <input type='text' name='correo' value="+rs.getString("correo_proveedores")+" size='45' /><br>"+
    "Ingrese su empresa: <input type='text' name='empresa' value="+rs.getString("empresa_proveedores")+" size='45' /><br>"+
     "<input type='text' name='Opcion' value='Actualizando' hidden='hidden'/>"+
    "<input type='submit' value='Enviar' name='enviar' /><br>"+
                                   "</form>");
                }
                }
                    }
        catch (ClassNotFoundException e1) {
                    }
               
               %>
                </div>
            </article>
                
        </section>
        <aside><center><h1>Listado De Proveedores</h1></center>
                           <table align='center' with='75%' border=1>
    <tr><th>Nombre</th><th>Apellido</th><th>Direccion</th><th>Telefono</th><th>Direccion Email</th><th>Empresa</th><th>Actualizar</th><th>Eliminar</th></tr>
        <%
 
            try {
                 Connection conexion = null;
             ResultSet rs = null;
             Class.forName("com.mysql.jdbc.Driver");
               conexion = DriverManager.getConnection ("jdbc:mysql://localhost/ferreteria","root", "");
                Statement s = conexion.createStatement();
            rs = s.executeQuery ("select * from proveedores");
            while (rs.next()){
            out.println("<tr><td>"+
rs.getString("nombre_proveedores")+"</td><td>"+rs.getString("apellido_proveedores")+"</td><td>"+rs.getString("direccion_proveedores")+"</td><td>"+
rs.getString("telefono_proveedores")+"</td><td>"+rs.getString("correo_proveedores")+"</td><td>"+rs.getString("empresa_proveedores")+"</td>"
                    + "<td>"
                    + "<form action='MantProveedores' method='POST'>"
                    + "<input type='text' hidden='hidden' value="+rs.getInt("idproveedores")+" name='codigo'>"
                    + "<input type='text' value='Actualizar' name='Opcion' hidden='hidden'>"
                    + "<input type='submit' Value='Actualizar'>"
                    + "</form></td>"
                    + "<td><form action='MantProveedores' method='POST'>"
                    + "<input type='text' hidden='hidden' value="+rs.getInt("idproveedores")+" name='codigo'>"
                    + "<input type='text' value='Eliminar' name='Opcion' hidden='hidden'>"
                    + "<input type='submit' Value='Eliminar'>"
                    + "</form>"
                    + "</td>");
}         
            }
catch (ClassNotFoundException e1) {
//Error si no puedo leer el driver
out.println("ERROR:No encuentro el driver de la BD: "+
e1.getMessage());
}
        %>
    </table>
        </section>	
        <aside>aside</aside>

        <footer>
            <div class="ft">
                <p>© 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>
