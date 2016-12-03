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
public class ServletActualizarCiudades extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String idCiudad     =request.getParameter("idCiudad"); 
        String idRutaAct    =request.getParameter("idRutaAct");
       
        try{
        Conexion c=new Conexion();
        Connection con=c.conectarse();
        CallableStatement actu=con.prepareCall("{call ACTUALIZAR_CIUDAD(?,?)}");  /// call y el nombre de tu procedimiento Y EL NUMERO DE PROCEDIMIENTOS QUE TENGAMOS
        
        actu.setString(1,idCiudad);
        actu.setString(2,idRutaAct);   ///tantos campos como se necesiten de nuestro proyecto de los my_ y respetrando su tipo de dato
        
        actu.execute();
       
        out.println("Se actualizo cd");
        }catch(Exception e){
        out.println(e.getMessage());  //invocaremos la exception
    }

    }

}
