<%-- 
    Document   : Cliente
    Created on : 06-oct-2014, 15:55:11
    Author     : usuario
--%>
<%@include file="/recursos/header.jsp" %>
<%
String Id = request.getParameter("Codigo");
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <script type="text/javascript" src="js/jMenu.jquery.js"></script>
        <script type="text/javascript" src="js/jMenu.jquery.min.js"></script>
        <script type="text/javascript" src="js/menu-interno.js"></script>
         <title>Ingresar Clientes</title>
         
 <style type="text/css">
            .formuser{
/*                background: #ecf0f1;*/
                background: #f2f6f9;
                border: 1px solid #dedede;
                margin: auto;
                width: 460px;
                padding: 20px;
                border-radius: 5px; 
            }
            .formuser input{
                /*background: #efefef;*/
                background: #fff;
                border: 1px solid #dedede;
                border-radius: 7px; 
                color: #3a3a3a;
                padding: 5px;
                margin-top: 2px;
                width: 439px;
                height: 20px;
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
                margin-top: 20px;
                margin-left: 10px;
                padding-left: 5px;                
            }
            .formuser div{
                text-align: right;
            }
            .formuser select{
                background: #fff;
                border: 1px solid #dedede;
                border-radius: 7px; 
                color: #3a3a3a;
                padding: 5px;
                margin-top: 2px;
                width: 300px;
                height: 30px;
                font-size: 0.9em;
            }
            
        </style>
        
        
        
    </head>
    <body>
   
      
       
           <%@include file="/recursos/menu.jsp" %>
      
        <section>

            <article>
                <div id="test">
                    <center><b>Ingresar Clientes</b></center>
               <%
               try{         
              Connection conexion = null;
             ResultSet rs = null;
             Class.forName("com.mysql.jdbc.Driver");
               conexion = DriverManager.getConnection ("jdbc:mysql://localhost/ferreteria","root", "");
                Statement s = conexion.createStatement();
                
                if(Id==null){
                 out.println(
                         
                           "<form action='MantCliente' id='fusuario' method='POST' class='contact_form' id='contact_form'>"+
                         "<table id='Formularios'><tr><td><b>*</b>Ingrese primer nombre:<br> <input type='text' id='nomb1' class='redondes' name='nombre1' value='' size='30' pattern='[a-zA-Z]+' title='El nombre solo utiliza letras' required/><br></td>"+
                         "<td>Ingrese segundo nombre: <br><input type='text' id='nomb2' name='nombre2' class='redondes' value='' size='30' pattern='[a-zA-Z]+' title='El nombre solo utiliza letras' /><br></td></tr>"+
                         "<tr><td><b>*</b>Ingrese primer apellido: <br><input type='text'  id='apell1' name='apellido1' class='redondes' value='' size='30'  pattern='[a-zA-Z]+' title='El nombre solo utiliza letras' required/><br></td>"+
                         "<td>Ingrese segundo apellido: <br><input type='text'  id='apell2' name='apellido2' class='redondes' value='' size='30'  pattern='[a-zA-Z]+' title='El nombre solo utiliza letras' /><br></td></tr>"+
                         "<tr><td>Dirección: <br><input type='text' id='Direc' name='direccion' value='' size='30' class='redondes' required/><br></td>"+
                         "<td><b>*</b>Teléfono:<br> <input type='text' id = 'tel' name='telefono' value='' size='10' class='redondes'  pattern='[0-9]{4}-[0-9]{4}' title='xxxx-xxxx (Solo numeros)' required/><br></td></tr>"+
                         "<input type='text' name='Opcion' value='Nuevo' size='10' hidden='hidden' required/>"+
                         "<tr><td>Número de Contribuyente: <br><input type='text' id= 'contribuye' name='numcontribuyente' class='redondes' pattern='[0-9]{8}-[0-9]{1}' title='xxxxxxxx-x' value='' size='45' /><br></td>"+
                         "<td>Tipo Cliente<br><select id = 'tclien' name='tipo'>"+
  "<option value='1' >Cliente Final</option>"+
  "<option value='2'>Cliente Credito Fiscal</option>"+
"</select><br></td></tr>"+
"<tr><td colspan='2'><input type='submit' id='Boton' value='Enviar' name='enviar' /><br></td></tr>"+
                                
                                   "</table></form>");
                }else{
                   
              rs = s.executeQuery ("select * from cliente where idcliente='"+Id+"'");
                while(rs.next()){
                  out.println(
                                 "<form action='MantCliente' id='fusuario' method='POST' class='contact_form' id='contact_form'>"+
    "<input type='text' class='redondes' name='codigo' value="+rs.getString("idcliente")+" hidden='hidden'/>"+
    "<table id='Formularios'><tr><td>Ingrese primer nombre: <br><input type='text' class='redondes' name='nombre1'  value="+rs.getString("nombre_cliente")+" size='30' pattern='[a-zA-Z]+' title='El nombre solo utiliza letras' required/><br></td>'"+
    "<td>Ingrese segundo nombre: <br><input type='text'class='redondes' name='nombre2' value='"+rs.getString("nombre2_cliente")+"' size='30' pattern='[a-zA-Z]+' title='El nombre solo utiliza letras' /><br></td></tr>"+
    "<tr><td>Ingrese su primer apellido: <br><input type='text'class='redondes' name='apellido1' value="+rs.getString("apellido_cliente")+" size='30' pattern='[a-zA-Z]+' title='El nombre solo utiliza letras' required/><br></td>"+
    "<td>Ingrese su segundo apellido:<br><input type='text'class='redondes' name='apellido2' value='"+rs.getString("apellido2_cliente")+"' size='30' pattern='[a-zA-Z]+' title='El nombre solo utiliza letras' /><br></td></tr>"+
    "<tr><td>Dirección:<br> <input type='text' name='direccion'class='redondes' value="+rs.getString("direccion_cliente")+" size='30' required/><br></td>"+
    "<td>Teléfono:<br> <input type='text' name='telefono'class='redondes' value="+rs.getString("telefono_cliente")+" size='10' pattern='[0-9]{4}-[0-9]{4}' title='xxxx-xxxx (Solo numeros)' required/><br></td></tr>"+
    "<tr><td>Número de Contribuyente:<br> <input type='text'class='redondes' name='numcontribuyente' value='"+rs.getString("numero_contribuyente_cliente")+"' size='45' pattern='[0-9]{8}-[0-9]{1}' title='xxxxxxxx-x' /><br></td>"+
    "<td>Tipo Cliente<br><select name='tipo'>"+
    "<option value='1' >1</option>"+
    "<option value='2'>2</option>"+
    "</select><br></td></tr>"+
     "<input type='text' name='Opcion' value='Actualizando' hidden='hidden'/>"+
    "<tr><td colspan='2'><input type='submit' value='Enviar' name='enviar' id='Boton'/><br></td></tr>"+
                                   "</table></form>");
                }
                }
                    }
        catch (ClassNotFoundException e1) {
                    }
               
               %>
                </div>
            </article>
                
        </section>
        <aside><center><h1>Listado Clientes</h1></center>
                           <table align='center' with='75%' border=1>
    <tr><th> Nombre1</th><th> Nombre2</th><th> Apellido1</th><th> Apellido2</th><th>Direccion</th><th>Telefono</th><th>Numero Contribuyente</th><th>Tipo Cliente</th><th>Actualizar</th><th>Eliminar</th></tr>
        <%
 
            try {
                 Connection conexion = null;
             ResultSet rs = null;
             Class.forName("com.mysql.jdbc.Driver");
               conexion = DriverManager.getConnection ("jdbc:mysql://localhost/ferreteria","root", "");
                Statement s = conexion.createStatement();
            rs = s.executeQuery ("select * from cliente");
            while (rs.next()){
            out.println("<tr><td>"+
rs.getString("nombre_cliente")+"</td><td>"+rs.getString("nombre2_cliente")+"</td><td>"+rs.getString("apellido_cliente")+"</td><td>"+rs.getString("apellido2_cliente")+"</td><td>"+rs.getString("direccion_cliente")+"</td><td>"+
rs.getString("telefono_cliente")+"</td><td>"+rs.getString("numero_contribuyente_cliente")+"</td><td>"+rs.getString("tipo_cliente")+"</td>"
                    + "<td>"
                    + "<form action='MantCliente' method='POST'>"
                    + "<input type='text' hidden='hidden' value="+rs.getInt("idcliente")+" name='codigo'>"
                    + "<input type='text' value='Actualizar' name='Opcion' hidden='hidden'>"
                    + "<input type='submit' Value='Actualizar'>"
                    + "</form></td>"
                    + "<td><form action='MantCliente' method='POST'>"
                    + "<input type='text' hidden='hidden' value="+rs.getInt("idcliente")+" name='codigo'>"
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
        <aside></aside>

        <footer>
            <div class="ft">
                <p>© 2014 Copyright Suministros Ferreteros. Reservados todos los derechos.</p>
            </div>
        </footer>
        
    </body>
</html>

