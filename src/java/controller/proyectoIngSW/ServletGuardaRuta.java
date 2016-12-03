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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.proyectoIngSW.Conexion;

/**
 *
 * @author Miry
 */
public class ServletGuardaRuta extends HttpServlet {

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
       String id_ruta      = request.getParameter("id_ruta");
       String matricula    = request.getParameter("matricula");
       float km            = Float.parseFloat(request.getParameter("km"));
       String origen       = request.getParameter("origen");
       String destino      = request.getParameter("destino");
       int numCiudades     = Integer.parseInt(request.getParameter("numCiudades"));
        
       
          try{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
        CallableStatement guarda=con.prepareCall("{call GUARDAR_RUTA(?,?,?,?,?,?)}"); 
        
        guarda.setString(1,id_ruta);
        guarda.setString(2,matricula);
        guarda.setFloat(3,km);
        guarda.setString(4,origen);
        guarda.setString(5,destino);
        guarda.setInt(6,numCiudades);
        guarda.execute();
       
        out.println("Se guardo ruta");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
        }
    }


}
