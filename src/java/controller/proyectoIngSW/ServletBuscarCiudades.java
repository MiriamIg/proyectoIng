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
public class ServletBuscarCiudades extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                 try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            out.println(Buscar.BuscarCiudades());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
        
    
}
