/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.proyectoIngSW;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.proyectoIngSW.Buscar;

/**
 *
 * @author Miry
 */
public class ServletBuscarConductores extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out= response.getWriter();
        try{
        out.println(Buscar.BuscarConductores());
        }catch(Exception ex){
            out.println("Algo malo sucedio");
        }
           
    }

}
