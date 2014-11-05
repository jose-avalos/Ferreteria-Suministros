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
@WebServlet(name = "MantCliente", urlPatterns = {"/MantCliente"})
public class MantCliente extends HttpServlet {

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
    String numcontribuyente=request.getParameter("numcontribuyente");
    String direccion=request.getParameter("direccion");
    String Tipo_cliente=request.getParameter("tipo");
    String Opcion=request.getParameter("Opcion");


try {
//Leemos el driver de Mysql
Class.forName("com.mysql.jdbc.Driver");
// Se obtiene una conexión con la base de datos.
conexion = DriverManager.getConnection ("jdbc:mysql://localhost/ferreteria","root", "");
// Permite ejecutar sentencias SQL sin parámetros
Statement s = conexion.createStatement();
    if (Opcion.equals("Nuevo")) {
        s.executeUpdate("Insert into cliente(nombre_cliente,apellido_cliente,direccion_cliente,telefono_cliente,numero_contribuyente_cliente,tipo_cliente) values('"+nombre+"','"+apellido+"','"+direccion+"','"+telefono+"','"+numcontribuyente+"','"+Tipo_cliente+"')");
        response.sendRedirect("Cliente.jsp");  
    }else if (Opcion.equals("Eliminar")){
        s.execute("Delete from cliente where idcliente='"+id+"'");
        response.sendRedirect("Cliente.jsp"); 
    }else if (Opcion.equals("Actualizando")) {
        s.execute("Update cliente set nombre_cliente='"+nombre+"',apellido_cliente='"+apellido+"',direccion_cliente='"+direccion+"',telefono_cliente='"+telefono+"',numero_contribuyente_cliente='"+numcontribuyente+"',tipo_cliente='"+Tipo_cliente+"' where idcliente='"+id+"'");
        response.sendRedirect("Cliente.jsp"); 
    }  else {
        response.sendRedirect("Cliente.jsp?Codigo="+id);  
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
