/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package modelos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Coneccion;
/**
 *
 * @author Metabee
 */
public class ModeloLogin {
 
private ResultSet rs = null;
private Statement s = null;

    public ModeloLogin(String user, String pass) {
        Coneccion con = new Coneccion();
        
        try {
            s = con.getCon().createStatement();
            String sql= "select * from usuario where usuario_usuario='"+user+"'";
            rs = s.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(ModeloLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList lista () throws SQLException{
        ArrayList datos = new ArrayList<>();
        while(rs.next()){
        datos.add(rs.getString(2));
        datos.add(rs.getString(3));
        datos.add(rs.getInt(4));
        datos.add(rs.getString(5));
            System.out.println("lista: "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getInt(4)+" "+rs.getString(5));
        }
        
        return datos;   
    
    }
    
    
}
