/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.proyectoIngSW;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.proyectoIngSW.Conexion;

/**
 *
 * @author Miry
 */
public class ServletEliminarRutas extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String idRutaElim= request.getParameter("idRutaElim");
      
        try{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
           // Statement st    =con.createStatement();
          //  ResultSet res   =st.executeQuery("select * from RUTA");

        CallableStatement otro=con.prepareCall("{call ELIMINAR_RUTA(?)}");  
        
        otro.setString(1,idRutaElim); 
        otro.execute();  
        out.println("Se borro ruta");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
    }
    }
}
