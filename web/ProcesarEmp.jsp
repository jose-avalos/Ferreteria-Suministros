<%-- 
    Document   : ProcesarInfo
 n : 30-sep-2014, 1:12:11
    Author     : jocea_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<PE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<jsp:useBean id="cod" scope="page" class="Beans.CodigoBean"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<c:set var="nombre" value="${param.nombre}"/>
<c:set var="apellido1" value="${param.apellido1}"/>
<c:set var="apellido2" value="${param.apellido2}"/>
<c:set var="dui" value="${param.dui}"/>
<c:set var="direccion" value="${param.direccion}"/>
<c:set var="telefono" value="${param.telefono}"/>
<c:set var="celular" value="${param.celular}"/>
<c:set var="fecha" value="${param.fecha}"/>
<c:set var="genero" value="${param.genero}"/>
<c:set var="estado" value="${param.estado}"/>

<sql:query var="q1" dataSource="jdbc/mysql">
SELECT * from empleado
</sql:query>

<c:set var="nreg" value="${q1.rowCount}"/>
<c:set target="${cod}" property="apellido1" value="${apellido1}"/>
<c:set target="${cod}" property="apellido2" value="${apellido2}"/>
<c:set target="${cod}" property="cantidad_registros" value="${nreg}"/>
<c:set var="codigoUsu" value="${cod.cod}"/>
Nombre:  <c:out value="${nombre} " /><br>
Apellido1:  <c:out value="${apellido1} " /><br>
Apellido2:  <c:out value="${apellido2} " /><br>
dui:  <c:out value="${dui} " /><br>
Codigo:  <c:out value="${codigoUsu} " /><br>
Direccion :<c:out value="´${direccion}"/>
Estado:<c:out value="´${estado}"/>
    
<sql:update var="insertar" dataSource="jdbc/mysql">
insert into empleado  (codigo,nombres_empleado,apellido1,apellido2,DUI_empleado,direccion_empleado,tel_empleado,cel_empleado,fecha_nacimiento_empleado,genero_empleado,estado_empleado) values (?,?,?,?,?,?,?,?,?,?,?)
<sql:param value="${codigoUsu}"/>
<sql:param value="${nombre}"/>
<sql:param value="${apellido1}"/>
<sql:param value="${apellido2}"/>
<sql:param value="${dui}"/>
<sql:param value="${direccion}"/>
<sql:param value="${telefono}"/>
<sql:param value="${celular}"/>
<sql:param value="${fecha}"/>
<sql:param value="${genero}"/>
<sql:param value="${estado}"/>
</sql:update>
<sql:query var="q1" dataSource="jdbc/mysql">
SELECT * from empleado
</sql:query>
<table>
<tr><th>Id</th><th>Nombres</th><th>Apellidos</th><th>Edad</th></tr>
<c:forEach var="name" items="${q1.rows}">
<tr><td><c:out value="${name.id}"/></td>
<td><c:out value="${name.nombres}"/></td>
<td><c:out value="${name.apellido1} ${name.apellido2}"/></td>
<td><c:out value="${name.edad}"/></td></tr>
</c:forEach>
</table>
</body>
</html>




