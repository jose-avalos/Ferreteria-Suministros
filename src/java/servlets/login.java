/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelos.GeneradoCodigo;
import modelos.ModeloLogin;

/**
 *
 * @author Metabee
 */
public class login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession misesion = request.getSession(true);
            String user = request.getParameter("usuario");
            String pass = request.getParameter("clave");
            Boolean ejecutar = true;
            if (misesion.getAttribute("user") != null) {
                response.sendRedirect("index.jsp");
                ejecutar = false;
                //System.out.println("sesiones");
            }
            if (user == null & pass == null & misesion.getAttribute("user") == null) {
                response.sendRedirect("index.jsp");
                ejecutar = false;
                //System.out.println("nules");
            }

            if (ejecutar) {
                ModeloLogin login = new ModeloLogin(user, pass);
                ArrayList datos = new ArrayList<>();

                try {//el metodo lista de la clase login retorna un arraylist con el usuario, contraseña y cargo
                    datos = login.lista();

                    if (datos.get(1).equals(pass)) {//comparando password
                        misesion.setAttribute("user", datos.get(0));//creando sesion  
                        misesion.setAttribute("cargo", datos.get(2));
                        misesion.setAttribute("codigo", datos.get(3));
                            if (datos.get(2).equals(1)) {//redireccionando dependiendo del cargo
                                response.sendRedirect("administrador.jsp");
                            } else {
                                response.sendRedirect("empleados.jsp");
                            }
                    } else {//redireccionando si el password no coinside
                        response.sendRedirect("index.jsp?msg=error");
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IndexOutOfBoundsException ex) {
                    System.out.println("catch Array: " + ex.getMessage());
                    response.sendRedirect("index.jsp?msg=error");
                }
            }
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
