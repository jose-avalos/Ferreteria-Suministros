/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jocea_000
 */
@WebServlet(name = "Servlet_Ingresaremp", urlPatterns = {"/Servlet_Ingresaremp"})
public class Servlet_Ingresaremp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
protected void processRequest(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
response.setContentType("text/html;charset=UTF-8");
PrintWriter out = response.getWriter();
ResultSet rs = null;
Connection conexion = null;
String ids=request.getParameter("codigo");
String nombre=request.getParameter("nombre");
String apellido=request.getParameter("apellido");
String telefono=request.getParameter("telefono");
String dui=request.getParameter("dui");
String direccion=request.getParameter("direccion");
String celular=request.getParameter("celular");
String fecha_nacimiento=request.getParameter("fecha_nacimiento");
String genero=request.getParameter("genero");
String estado=request.getParameter("estado");

try {
//Leemos el driver de Mysql
Class.forName("com.mysql.jdbc.Driver");
// Se obtiene una conexión con la base de datos.
conexion = DriverManager.getConnection (
"jdbc:mysql://localhost/ferreteria","root", "");
// Permite ejecutar sentencias SQL sin parámetros
Statement s = conexion.createStatement();
s.executeUpdate("Insert into empleado "
+ "values("+ids+",\""+nombre+"\",\""+apellido+"\",\""+dui+"\",\""+direccion+"\",\""+telefono+"\",\""+celular+"\",\""+fecha_nacimiento+"\",\""+genero+"\",\""+estado+"\")");

rs = s.executeQuery ("select * from empleado");
//Decimos que nos hemos conectado

out.println ("<html>");
out.println("<body>");
out.println("<h1>Datos Ingresados Exitosamente</h1>");
out.println("<table align='center' with='75%' border=1>");
out.println("<tr><th>Codigo</th><th>Nombres</th><th>Apellidos</th><th>direccion"+
"</th><th>Telefono</th><th>Celular</th><th>Genero</th><th>Estado</th></tr>");
while (rs.next()){
out.println("<tr><td>"+rs.getInt("idempleado")+"</td><td>"+
rs.getString("nombres_empleado")+"</td><td>"+rs.getString("apellidos_empleado")+"</td><td>"+rs.getString("DUI_empleado")+"</td><td>"+
rs.getString("direccion_empleado")+"</td><td>"+rs.getString("tel_empleado")+"</td><td>"+rs.getString("cel_empleado")+"</td><td>"+rs.getString("genero_empleado")+"</td>"
        + "<td>"+rs.getString("estado_empleado")+"</td></tr>");
}
out.println("</table>");

out.println("<a href=\"ingresaremp.jsp\" onclick=\"history.go(-1)\">Volver</a>");
out.println("</body>");
out.println("</html>");
conexion.close();
}
catch (ClassNotFoundException e1) {
//Error si no puedo leer el driver
out.println("ERROR:No encuentro el driver de la BD: "+
e1.getMessage());
}
catch (SQLException e2) {
//Error SQL: login/passwd mal
out.println("ERROR:Fallo en SQL: "+e2.getMessage());
}
finally {
out.close();
}
}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
