<%-- 
    Document   : vehiculoslista
    Created on : Oct 16, 2014, 3:30:45 PM
    Author     : Metabee
--%>
<%@include file="/recursos/header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%--<c:if test="${sessionScope.cargo!=1}">
    <c:redirect url="index.jsp" />
</c:if>
--%>
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
           <%@include file="/recursos/menu.jsp" %>
        <section>
           
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
        <aside></aside>

        <footer>
            <div class="ft">
                <p>© 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>
