<%-- 
    Document   : vehiculos
    Created on : Oct 16, 2014, 3:29:51 PM
    Author     : Metabee
--%>
<%@include file="/recursos/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%--<c:if test="${sessionScope.cargo!=1}">
    <c:redirect url="index.jsp" />
</c:if>--%>

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
        <script type="text/javascript" src="js/jquery.mask.min.js"></script>
        <title>vehiculos</title>
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
        <section>
            <article>
                <script type="text/javascript">
                $(function() {
                    $("#fusuario").validity(function(){
                        $("#unidad").require("Este campo es requerido");
                        $("#matricula").require("Este campo es requerido");
                    });
                    
                    $("#borrar2").click(function(){
                        $("#unidad").val("");
                        $("#matricula").val("");
                    });
                    
                    $("#matricula").mask("S-009-009", {placeholder: "- -"});
                    
                });   
                </script>
                <div class="formuser">
                    <c:if test="${param.accion==null||param.accion=='ingresar'}">
                    <h3>Crear Vehiculos</h3>
                    <form id="fusuario" method="POST" >
                        <label>Numero de Unidad <b>*</b></label> <input type="text" id="unidad"  name="unidad" />
                        <label>Matricula <b>*</b></label> <input type="text" id="matricula"  name="matricula" />
                        <input type="hidden" name="accion" value="ingresar" />
                        <div>                        
                        <button type="submit" id="send" >Enviar</button>
                        <button type="button" id="borrar2" >Limpiar</button>
                        </div>
                    </form>
                    </c:if>
                    
                    <c:if test="${param.accion=='editar'}">
                         <h3>Editar Vehiculos</h3>
                    <sql:query dataSource="jdbc/mysql" var="q1" sql="select*from vehiculos where idvehiculos=${param.id}" />
                    <c:forEach var="item" items="${q1.rows}">
                        <form id="fusuario" method="POST" action="vehiculoslista.jsp">
                            <label>Numero de Unidad <b>*</b></label> <input type="text" id="unidad"  name="unidad" value="${item.numero_unidad_vehiculos}"/>
                            <label>Matricula <b>*</b></label> <input type="text" id="matricula"  name="matricula" value="${item.matricula_vehiculos}"/>
                        <input type="hidden" name="accion" value="editando" />
                        <input type="hidden" name="id" value="${param.id}" />
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
        <aside></aside>

        <footer>
            <div class="ft">
                <p>© 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>
<c:if test="${param.accion=='ingresar'}">
    <sql:update var="insertar" dataSource="jdbc/mysql">
        INSERT INTO vehiculos (numero_unidad_vehiculos, matricula_vehiculos)values(?,?);
        <sql:param value="${param.unidad}"/>
        <sql:param value="${param.matricula}"/>   
    </sql:update>    
</c:if>