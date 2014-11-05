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
@WebServlet(name = "MantProveedores", urlPatterns = {"/MantProveedores"})
public class MantProveedores extends HttpServlet {

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
String id=request.getParameter("codigo");
String nombre=request.getParameter("nombre");
String apellido=request.getParameter("apellido");
String telefono=request.getParameter("telefono");
String correo=request.getParameter("correo");
String direccion=request.getParameter("direccion");
String empresa=request.getParameter("empresa");
String Opcion=request.getParameter("Opcion");


try {
//Leemos el driver de Mysql
Class.forName("com.mysql.jdbc.Driver");
// Se obtiene una conexión con la base de datos.
conexion = DriverManager.getConnection ("jdbc:mysql://localhost/ferreteria","root", "");
// Permite ejecutar sentencias SQL sin parámetros
Statement s = conexion.createStatement();
    if (Opcion.equals("Nuevo")) {
        s.executeUpdate("Insert into proveedores(nombre_proveedores,apellido_proveedores,direccion_proveedores,telefono_proveedores,correo_proveedores,empresa_proveedores) values('"+nombre+"','"+apellido+"','"+direccion+"','"+telefono+"','"+correo+"','"+empresa+"')");
        response.sendRedirect("Proveedores.jsp");  
    }else if (Opcion.equals("Eliminar")){
        s.execute("Delete from proveedores where idproveedores='"+id+"'");
        response.sendRedirect("Proveedores.jsp"); 
    }else if (Opcion.equals("Actualizando")) {
        s.execute("Update Proveedores set nombre_proveedores='"+nombre+"',apellido_proveedores='"+apellido+"',direccion_proveedores='"+direccion+"',telefono_proveedores='"+telefono+"',correo_proveedores='"+correo+"',empresa_proveedores='"+empresa+"' where idproveedores='"+id+"'");
        response.sendRedirect("Proveedores.jsp"); 
    }  else {
        response.sendRedirect("Proveedores.jsp?Codigo="+id);  
    }

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