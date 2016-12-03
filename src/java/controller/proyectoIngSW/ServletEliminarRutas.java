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
public class ServletEliminarRutas extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String idRutaElim= request.getParameter("idRutaElim");
      
        try{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
        CallableStatement otro=con.prepareCall("{call BORRAR_RUTA(?)}");  
        
        otro.setString(1,idRutaElim); 
        otro.execute();  
        out.println("Se borro ruta");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
    }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
