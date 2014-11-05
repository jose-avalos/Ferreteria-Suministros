<%-- 
    Document   : index
    Created on : 19-sep-2014, 13:17:23
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="jquery-ui.min.css">
        <link rel="stylesheet" href="css/jquery.validity.css">
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/prefixfree.jquery.js"></script>
        <script type="text/javascript" src="js/jquery-ui.min.js"></script>
        <script type="text/javascript" src="js/login.js"></script>
        <script type="text/javascript" src="js/jquery.validity.js"></script>
        <script type="text/javascript" src="js/jquery.validity.lang.es.js"></script>
        <title>Principal</title>
        <script type="text/javascript">
            $(function() { 
                $("#login").validity(function() {
                    //Expresion regular para usuario.
                    $.validity.patterns.user = /^([a-zA-ZñÑ]{2,})([0-9]{1,})?$/;
                    //mesaje de error de la expresion regular de usuario
                    $.validity.messages.user ="No se aceptan simbolos (%$#!), ni numeros al inicio.";
                    //Expresion regular para password.
                    $.validity.patterns.pas = /^[a-zA-Z0-9]{6,}$/;
                    //mesaje de error de la expresion regular de password
                    $.validity.messages.pas ="No se aceptan simbolos(%$#!) o Contaseña erronea.";
                    //campos requeridos
                    $("#user").require("Este campo es Requrido").match("user");
                    $("#pass").require("Este campo es Requrido").match("pas");
                });
            });
        </script>
        
        <style>
            
            
            p:first-letter {
    display:block;
    margin:5px 0 0 5px;
    float:left;
    color:Blue;
    font-size:60px;
    font-family:Georgia;
}


                        #mision1{
            margin-left: auto;
    margin-right: auto;
    width: 70%;
    margin-top:4Ex;
    font-style:italic;
    font-weight:bold;
    font-size:2em;
    font-color:#ffffff;
            }
            
            #mision{
                
                margin-left: auto;
    margin-right: auto;
    width: 70%;
    margin-top:2Ex;
    font-style:italic;
  font-color:#ffffff;
  font-family:'Helvetica','Verdana','Monaco',sans-serif;
               }

            #vision1{
            margin-left: auto;
    margin-right: auto;
    width: 70%;
    margin-top:4Ex;
    font-style:italic;
    font-weight:bold;
    font-size:2em;
    font-color:#ffffff;
            }
            
            #vision{
                
                margin-left: auto;
    margin-right: auto;
    width: 70%;
    margin-top:2Ex;
    font-style:italic;
  font-color:#ffffff;
  font-family:'Helvetica','Verdana','Monaco',sans-serif;
               }
        </style>>
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
                    <form method="POST" id="login" action="login">
                        Usuario<input type="text" property="usuario" class="redondes" id="user" name="usuario"><br>
                        Contraseña <input type="password" class="redondes" id="pass" name="clave"><br><br>
                        <p> 
                            <button type="submit" id="send" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                <span class="ui-button-text">Iniciar Sesión</span>
                            </button>
                            <!-- <button type="reset" id="borrar" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only">
                                    <span class="ui-button-text">Borrar</span>
                            </button> -->
                        </p>
                    </form>
                    <c:if test="${param.msg=='error'}">
                        <div id="dialogo2" style="display:none;text-align:center;color:red">
                            <p>Usuario o contraseña no valida</p>
                        </div>
                    </c:if>
                </div> 
            </div>
        </nav>
        <section>
            <article>
                
                <div id="mision1">Misi&oacute;n
                    </div>
                <div id="mision">
                    
                    <p>Ser una Empresa líder a nivel nacional en la comercialización de productos Ferreteros e importados para las demas ferreterias las marcas de la mejor calidad</p>
                </div>
                <div id="vision1">Visi&oacute;n
                    </div>
                <div id="vision">
                <p>Suministros Ferreteros  es una empresa  formal con valores éticos, líder en la distribución y comercialización de materiales para la construcción y la remodelación, ofreciendo productos y servicios de alta calidad para satisfacer las necesidades de nuestros clientes, contando con un excelente equipo  humano  capacitado con pensamiento empresarial, lo que la constituye en  una empresa de ejemplo, creadora de empresas, comprometida en dejar huella, con prioridad en las personas  construyendo un mundo mejor para todos y trabajamos en esa dirección</p>
                </div>
            </article>	
        </section>	
        <aside>
                    <footer>        
            <%@include file="/recursos/footer.jsp" %>
        </footer>	
        </aside>


    </body>
</html>
