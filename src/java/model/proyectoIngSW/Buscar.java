/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.proyectoIngSW;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.codehaus.jackson.map.ObjectMapper;

/**
 *
 * @author Miriam
 */
public class Buscar {
    
    
    public static String BuscarRutas() throws Exception{
        String ok="";
        try {
            Connection con  =Conexion.conectarse();
            Statement st    =con.createStatement();
            ResultSet res   =st.executeQuery("select * from RUTA");
            
            int indice=0;
            ArrayList<Ruta> rutas=new ArrayList<Ruta>();
            while(res.next()){
                String id_ruta      =res.getString(1);
                String matricula    =res.getString(2);
                Float km            =res.getFloat(3);
                String origen       =res.getString(4);
                String destino      =res.getString(5);
                Integer numCiudades =res.getInt(6);
                 ///llenamos el arrayList en cada vuelta
                      rutas.add(new Ruta(id_ruta, matricula, km, origen, destino, numCiudades));
            }
             //el paso final, transformamos a objeto json con jackson
             ObjectMapper maper=new ObjectMapper();   //mapeo a objeto jackson
             
             st.close();
             con.close();
             System.out.println("convirtiendo el json");
             return maper.writeValueAsString(rutas);
                    
        } catch (Exception ex) {
            Logger.getLogger(Buscar.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        return ok;
    }
    public static String BuscarBuses() throws Exception{
        
        Connection con=Conexion.conectarse();
        Statement st=con.createStatement();
        ResultSet res=st.executeQuery("select * from AUTOBUS"); 
    
             ArrayList<Bus> buses=new ArrayList<Bus>();
                    while(res.next()){   
                                   String matriculaBus  =res.getString(1);     
                                   Integer idConductor  =res.getInt(2);
                                   String modelo        =res.getString(3);
                                   Integer capacidad    =res.getInt(4);
                                  
                      buses.add(new Bus(matriculaBus,idConductor,modelo,capacidad));
                      
                      //System.out.println("estoy en el array list despues del select");
                    }
             
             
             ObjectMapper maper=new ObjectMapper();   //mapeo a objeto jackson
             
             st.close();
             con.close();
             System.out.println("convirtiendo el json");
             return maper.writeValueAsString(buses);
    }
    public static String BuscarCiudades() throws Exception{
        Connection con=Conexion.conectarse();
        Statement st=con.createStatement();
        ResultSet res=st.executeQuery("select * from CIUDAD");  //reset arreglo enmutado de java  estructura de  datos
    
             
             ArrayList<Ciudad> ciudades=new ArrayList<Ciudad>();
                    while(res.next()){   
                                   String idCiudad  =res.getString(1);     
                                   String idRutaAsig=res.getString(2);
                                   String ciudad    =res.getString(3);
                                   String dir       =res.getString(4);
                                   String tel       =res.getString(5);
                                   
                                  
                      ciudades.add(new Ciudad(idCiudad, idRutaAsig,ciudad, tel, dir));
                      
                      //System.out.println("estoy en el array list despues del select");
                    }
             ObjectMapper maper=new ObjectMapper();  
             
             st.close();
             con.close();
             System.out.println("convirtiendo el json");
             return maper.writeValueAsString(ciudades);
    }
    public static String BuscarConductores() throws Exception{
        Connection con=Conexion.conectarse();
        Statement st=con.createStatement();
        ResultSet res=st.executeQuery("select * from CONDUCTOR");  //reset arreglo enmutado de java  estructura de  datos
        System.out.println("resss----"+res);
             
             ArrayList<Conductor> conductores=new ArrayList<Conductor>();
             
                    while(res.next()){
                                   Integer id_Conduct   =res.getInt(1); 
                                   String nombreConduct =res.getString(2);     
                                   String dir           =res.getString(3);
                                   String telConduct    =res.getString(4);
                                   Integer experiencia  =res.getInt(5);
                                   String salud         =res.getString(6);
                      conductores.add(new Conductor(id_Conduct, nombreConduct, dir, telConduct, experiencia, salud));
                      
                      System.out.println("el id -->"+id_Conduct);
                    }
             ObjectMapper maper=new ObjectMapper();  
             
             st.close();
             con.close();
             System.out.println("convirtiendo el json");
             return maper.writeValueAsString(conductores);
    }
    
    
}
