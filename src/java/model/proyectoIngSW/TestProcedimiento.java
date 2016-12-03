/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package model.proyectoIngSW;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author campitos
 */
public class TestProcedimiento {
    public static void guardaConductor(int idConductor,String nombreCompleto,String dir,String telConduct,int experiencia,String salud){
        try {
     Connection con= Conexion.conectarse();
            CallableStatement guarda=con.prepareCall("{call GUARDAR_CONDUCTOR(?,?,?,?,?,?)}");
            
            guarda.setInt(1,idConductor);
            guarda.setString(2,nombreCompleto);  
            guarda.setString(3,dir);
            guarda.setString(4,telConduct);
            guarda.setInt(5,experiencia);
            guarda.setString(6,salud);
            guarda.execute();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    
    }
    
    
   public static void main(String args[])throws Exception{
     
        guardaConductor(3, "hjhjhjh", "ghghgh", "ggggg", 0, "mala");
        System.out.println("El id ingresado es:");
    }
    
}
