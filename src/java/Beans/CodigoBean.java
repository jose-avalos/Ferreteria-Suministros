/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Beans;

/**
 *
 * @author jocea_000
 */

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CodigoBean {
   private String nombre = "C";
   private String nombre2;
   private int cantidad_registros;
   private String anio_actual;
   private String soloLetra;
   private String soloLetra2;
   private String cod;
/**
* @return the apellido
*/
public String getNombre1() {

    return nombre;
}
/**
* @param nombre the apellido to set
*/
public void setNombre(String nombre) {
this.nombre = nombre;
}
/**
* @return the apellido2
*/
public String getNombre2() {
return nombre2;
}

/**
     * @param apellido2
*/
public void setnombre2(String nombre2) {
this.nombre2 = nombre2;
}
/**
* @return the cantidad_registros
*/
public int getCantidad_registros(){
return cantidad_registros;
}
/**
* @param cantidad_registros the cantidad_registros to set
*/
public void setCantidad_registros(int cantidad_registros) {
this.cantidad_registros = cantidad_registros;
}
public String getCod(){
Date d = new Date();
SimpleDateFormat anio=new SimpleDateFormat("yy");
DecimalFormat dosDigitos = new DecimalFormat("0000");
anio_actual=anio.format(d);
soloLetra= nombre.substring(0,1);
soloLetra2= nombre2.substring(0,1);
int aumentregistros=cantidad_registros+1;
String regitros=String.valueOf(dosDigitos.format(aumentregistros));
String codigo=soloLetra+soloLetra2+anio_actual+regitros;
return codigo;
}
}
