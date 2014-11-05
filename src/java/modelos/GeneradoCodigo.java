/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Coneccion;

/**
 *
 * @author Metabee
 */
public class GeneradoCodigo {
private ResultSet rs = null;
private Statement s = null;


    public GeneradoCodigo() {
        
    }
    
    public String creandoCodigo(String ape1 , String ape2, String nom1, String nom2, String nacimiento){
        String codigo="";
        try {//manejado error cuando no exista el segundo apellido
            codigo = ape1.substring(0, 1)+ape2.substring(0, 1);           
        } catch (StringIndexOutOfBoundsException e) {
            codigo=ape1.substring(0, 1)+ape1.substring(0, 1);
        }catch(NullPointerException e){
            codigo=ape1.substring(0, 1)+ape1.substring(0, 1);
        }
        
        try {//manejado error cuando no exista el segundo nombre
            codigo += nom1.substring(0, 1)+nom2.substring(0, 1); 
        } catch (StringIndexOutOfBoundsException e) {
            codigo += nom1.substring(0, 1)+nom1.substring(0, 1);
        } catch(NullPointerException e){
            codigo += nom1.substring(0, 1)+nom1.substring(0, 1);
        }       
        
        if(nacimiento.indexOf("-")!=-1){
            codigo+=nacimiento.replace("-", "");//remplazando guiones
        }else{
            codigo+=nacimiento.replace("/", "");//remplazando plecas
        }
   
        codigo+="-0";
        codigo=codigo.toUpperCase();//mayusculas
        codigo=duplicado(codigo);//verificando si es duplicado
        System.out.println("creando "+codigo);
        
    return codigo;
    }
    
    private String duplicado(String codigo){
        consultando(codigo);
    try {
        while(rs.next()){
            String[] arreglo = new String[2];
            arreglo=codigo.split("-");//dividiendo el codigo donde exista el guion(-)
            
            int num = Integer.parseInt(arreglo[1]);
            num++;
            codigo=arreglo[0]+"-"+num;
            consultando(codigo);
        }
    } catch (SQLException ex) {
        Logger.getLogger(GeneradoCodigo.class.getName()).log(Level.SEVERE, null, ex);
    }
    return codigo;    
    }
    
    private String consultando(String codigo){
      Coneccion con = new Coneccion();
        try {
            s = con.getCon().createStatement();
            String sql= "select codigo_empleado from empleado where codigo_empleado='"+codigo+"'";
            rs = s.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(GeneradoCodigo.class.getName()).log(Level.SEVERE, null, ex);
        }  
    return null;
    }
    
}
