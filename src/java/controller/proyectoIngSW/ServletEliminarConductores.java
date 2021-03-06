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
public class ServletEliminarConductores extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        int idConductElim= Integer.parseInt(request.getParameter("idConductElim"));
      
        try{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
        CallableStatement elim=con.prepareCall("{call ELIMINAR_CONDUCTOR(?)}");  
        
        elim.setInt(1,idConductElim); 
        elim.execute();  
        out.println("Se borro conductor");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
    }

    }

}
