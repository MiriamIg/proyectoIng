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
public class ServletGuardaBus extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
       String matriculaBus  = request.getParameter("matriculaBus");
       int idConductor      = Integer.parseInt(request.getParameter("idConductor"));
       String modelo        = request.getParameter("modelo");
       int capacidad        = Integer.parseInt(request.getParameter("capacidad"));
       
         try{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
        CallableStatement guarda=con.prepareCall("{call GUARDAR_AUTOBUS(?,?,?,?)}");
        
        guarda.setString(1,matriculaBus);
        guarda.setInt(2,idConductor);   
        guarda.setString(3,modelo);
        guarda.setInt(4,capacidad);
        guarda.execute();
       
        out.println("Se guardo el bus");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
        }
        
    }

}
