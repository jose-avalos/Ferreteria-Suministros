<%-- 
    Document   : ingresaremp
    Author     : jocea_avalos1
--%>

<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.cargo!=1}">
    <c:redirect url="index.jsp" />
</c:if>

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
        <title>Empleados</title>
        
        <style>
    #test{
width: 50%;
margin: 200px;
padding: 50px,50px,50px,50px;
border: 2px dashed #CCC;
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
                    </div>
                <div id="test">
<form action="Servlet_Ingresaremp" method="POST">
Ingrese su codigo: <input type="text" name="codigo" value="" size="10"><br>
Ingrese sus nombres: <input type="text" name="nombre" value="" size="45" /><br>
Ingrese sus apellido: <input type="text" name="apellido" value="" size="45"/><br>
DUI: <input type="text" name="dui" value="" size="10" /><br>
Direccion: <input type="text" name="direccion" value="" size="45" /><br>
Telefono: <input type="text" name="telefono" value="" size="10" /><br>
Celular: <input type="text" name="celular" value="" size="10" /><br>
Fecha De Nacimiento: <input type="text" name="fecha_nacimiento" value="" size="10" /><br>

Genero <select name="genero">
  <option value="1" >1</option>
  <option value="2">2</option> 
</select>
Estado : <select name="estado">
  <option value="0" >0</option>
  <option value="1">1</option> 
</select> 

<!--Genero: <input type="text" name="genero" value="" size="45" /><br>
estado: <input type="text" name="genero" value="" size="10" /><br>-->

<input type="submit" value="Enviar" name="enviar" /><br>
</form>
                </div>
            </div>
        </nav>
        <section>
            <article>
                <ul id="jMenu">
                    <li><a>titulo 1</a>
                        <ul>
                            <li><a>tema1</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 2</a>
                        <ul>
                            <li><a>tema2</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 3</a>
                        <ul>
                            <li><a>tema3</a></li>
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
                     <li><a>titulo 10</a>
                        <ul>
                            <li><a>tema10</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 11</a>
                        <ul>
                            <li><a>tema11</a></li>
                        </ul>
                    </li>
                    <li><a>titulo 12</a>
                        <ul>
                            <li><a>tema13</a></li>
                        </ul>
                    </li>
                </ul><br>
                Empleados
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
