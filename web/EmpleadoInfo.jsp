<%-- 
    Document   : Informacion
    Created on : 30-sep-2014, 1:11:25
    Author     : jocea_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="recursos/calendario.jsp"%>
            
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>
<h2>Ingrese del Empleado</h2>
<body>

    <form name="persona" action="ProcesarEmp.jsp" method="post">
Ingrese su nombre: <input type="text" name="nombre" value="" /><br>
Ingrese su primer apellido: <input type="text" name="apellido1" value="" /><br>
Ingrese su segundo apellido: <input type="text" name="apellido2" value="" /><br>
Ingrese DUI: <input type="text" name="dui" value="" /><br>
Ingrese Direccion: <input type="text" name="direccion" value="" /><br>
Ingrese Telefono: <input type="text" name="telefono" value="" /><br>
Ingrese Celular: <input type="text" name="celular" value="" /><br>
Ingrese Fecha Nacimiento: <input type="text" name="fecha" value="" /><img src="<%=request.getContextPath() %>/css/img/c.png" id="f_1" /><br>
Ingrese Genero Empleado: <input type="text" name="genero" value="" /><br>
Ingrese Estado: <input type="text" name="estado" value="" /><br>
<input type="submit" value="Enviar">
</body>
</html>
