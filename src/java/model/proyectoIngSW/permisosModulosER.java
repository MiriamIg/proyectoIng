/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.proyectoIngSW;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Miry
 */
public class permisosModulosER {
	public boolean Acceso(String usuario,String password){
		boolean exito= false;
        try{
            Connection con  =Conexion.conectarse();
            Statement st    =con.createStatement();
                String query="select usuario from permisos "
                        + "where user="+usuario+" "
                        + "and pass="+password+" ";
                
            ResultSet res   =st.executeQuery(query);
             String nombre_usuario ="";
            while(res.next()){
                    nombre_usuario=res.getString(1);
                System.out.println("usuario**"+nombre_usuario);
               
                }
             if(!nombre_usuario.isEmpty()){//si existe
                    exito=true;}
            res.close();
            }catch (Exception ex) {
            ex.getMessage();
            }
        
		return exito;

	}
	
	public static void main(String args[]){
		permisosModulosER obj = new permisosModulosER();
                obj.Acceso("carlosh27", "5213");
	}
    
}
