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
public class ServletGuardaConductor extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            
            int idConductor     =Integer.parseInt(request.getParameter("idConductor"));
            String nombreConduct=request.getParameter("nombreConduct");
            String aPaterno     =request.getParameter("aPaterno");
            String aMaterno     =request.getParameter("aMaterno");
            String calle        =request.getParameter("calle");
            String cpConduct    =request.getParameter("cpConduct");
            String delMuniConduct=request.getParameter("delMuniConduct");
            String telConduct   =request.getParameter("telConduct");
            int experiencia     =Integer.parseInt(request.getParameter("experiencia"));
            String salud        =request.getParameter("salud");
            
            String dir                  = calle+" "+cpConduct+" "+delMuniConduct;
            String nombreCompleto       =nombreConduct+" "+aPaterno+" "+aMaterno;
            
            System.out.println("id--"+idConductor);
            System.out.println("nom--"+nombreCompleto);
            System.out.println("dir--"+dir);
            System.out.println("tel--"+telConduct);
            System.out.println("experienca--"+experiencia);
            System.out.println("salud --"+salud);
            
             
            try{
            Conexion c=new Conexion();
            Connection con=c.conectarse();
            CallableStatement guarda=con.prepareCall("{call GUARDAR_CONDUCTOR(?,?,?,?,?,?)}");
            
            guarda.setInt(1,idConductor);
            guarda.setString(2,nombreCompleto);  
            guarda.setString(3,dir);
            guarda.setString(4,telConduct);
            guarda.setInt(5,experiencia);
            guarda.setString(6,salud);
            guarda.execute();
      
        out.println("Se guardo cone exito conductor");
       
            } catch (Exception ex) {
            out.println(ex.getMessage());  
            }
    }
}
