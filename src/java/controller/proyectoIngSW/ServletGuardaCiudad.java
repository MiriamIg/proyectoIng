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
public class ServletGuardaCiudad extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            
            String idCiudad  =request.getParameter("idCiudad");
            String idRutaAsig=request.getParameter("idRutaAsig");
            String ciudad    =request.getParameter("ciudad");
            String tel       =request.getParameter("tel");
            String delMuni   =request.getParameter("delMuni");
            String cp        =request.getParameter("cp");
            
            String dir= delMuni+" "+cp;
             System.out.println("direccion completa-->"+dir);
            
            Conexion c=new Conexion();
            Connection con=c.conectarse();
            CallableStatement guarda=con.prepareCall("{call GUARDAR_CIUDAD(?,?,?,?,?)}");
            
            guarda.setString(1,idCiudad);
            guarda.setString(2,idRutaAsig);  
            guarda.setString(3,ciudad);
            guarda.setString(4,tel);
            guarda.setString(5,dir);
            
            guarda.execute();
       
        out.println("Se guardo cone exito ciuad");
       
            } catch (Exception ex) {
            ex.printStackTrace();
            }

    }



}
