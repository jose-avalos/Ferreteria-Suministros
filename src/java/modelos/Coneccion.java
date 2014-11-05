/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelos;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



/**
 *
 * @author Metabee
 */
public class Coneccion {
    private Connection con = null;
    private DataSource ds = null;
    public Coneccion() {
        try {
            Context contextInitial  = new InitialContext();
            Context context = (Context) contextInitial.lookup("java:comp/env");
            ds = (DataSource) context.lookup("jdbc/mysql");
            con = ds.getConnection();
        } catch (NamingException ex) {
            Logger.getLogger(Coneccion.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Coneccion.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

  
    public Connection getCon() {
        return con;
    }

  
    public DataSource getDs() {
        return ds;
    }
    
    
    
}
