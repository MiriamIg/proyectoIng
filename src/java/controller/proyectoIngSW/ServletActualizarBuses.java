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
public class ServletActualizarBuses extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String matricula    = request.getParameter("matricula"); 
        int idConductorAct  =Integer.parseInt(request.getParameter("idConductorAct"));
       
        try{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
        CallableStatement actu=con.prepareCall("{call ACTUALIZAR_AUTOBUS(?,?)}");
        
        actu.setString(1,matricula);
        actu.setInt(2,idConductorAct);
        actu.execute();
       
        out.println("Se actualizo conductor del autobus");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
    }
        
    }

}